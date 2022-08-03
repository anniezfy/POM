#include "generator_isl.h"

namespace polyfp{

polyfp::expr polyfp_expr_from_isl_ast_expr(isl_ast_expr *isl_expr);

void generator::get_rhs_accesses(const polyfp::function *func, const polyfp::compute *comp,
                                 std::vector<isl_map *> &accesses, bool return_buffer_accesses)
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    const polyfp::expr &rhs = comp->get_expr();
    
    generator::traverse_expr_and_extract_accesses(func, comp, rhs, accesses, return_buffer_accesses);


    DEBUG_INDENT(-4);
    DEBUG_FCT_NAME(3);
}

isl_map *create_map_from_domain_and_range(isl_set *domain, isl_set *range)
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    DEBUG(3, polyfp::str_dump("Domain:", isl_set_to_str(domain)));
    DEBUG(3, polyfp::str_dump("Range:", isl_set_to_str(range)));
    // Extracting the spaces and aligning them
    isl_space *sp1 = isl_set_get_space(domain);
    isl_space *sp2 = isl_set_get_space(range);
    sp1 = isl_space_align_params(sp1, isl_space_copy(sp2));
    sp2 = isl_space_align_params(sp2, isl_space_copy(sp1));
    // Create the space access_domain -> sched_range.
    isl_space *sp = isl_space_map_from_domain_and_range(
            isl_space_copy(sp1), isl_space_copy(sp2));
    isl_map *adapter = isl_map_universe(sp);
    DEBUG(3, polyfp::str_dump("Transformation map:", isl_map_to_str(adapter)));
    isl_space *sp_map = isl_map_get_space(adapter);
    isl_local_space *l_sp = isl_local_space_from_space(sp_map);
    // Add equality constraints.
    for (int i = 0; i < isl_space_dim(sp1, isl_dim_set); i++)
    {
        if (isl_space_has_dim_id(sp1, isl_dim_set, i) == true)
        {
            for (int j = 0; j < isl_space_dim (sp2, isl_dim_set); j++)
            {
                if (isl_space_has_dim_id(sp2, isl_dim_set, j) == true)
                {
                    isl_id *id1 = isl_space_get_dim_id(sp1, isl_dim_set, i);
                    isl_id *id2 = isl_space_get_dim_id(sp2, isl_dim_set, j);
                    if (strcmp(isl_id_get_name(id1), isl_id_get_name(id2)) == 0)
                    {
                        isl_constraint *cst = isl_equality_alloc(
                                isl_local_space_copy(l_sp));
                        cst = isl_constraint_set_coefficient_si(cst,
                                                                isl_dim_in,
                                                                i, 1);
                        cst = isl_constraint_set_coefficient_si(
                                cst, isl_dim_out, j, -1);
                        adapter = isl_map_add_constraint(adapter, cst);
                    }
                    isl_id_free(id1);
                    isl_id_free(id2);
                }
            }
        }
    }

    isl_space_free(sp1);
    isl_space_free(sp2);
    isl_local_space_free(l_sp);

    DEBUG(3, polyfp::str_dump(
            "Transformation map after adding equality constraints:",
            isl_map_to_str(adapter)));

    DEBUG_INDENT(-4);

    return adapter;
}

/**
 * access_dimension:
 *      The dimension of the access. For example, the access
 *      C0(i0, i1, i2) have three access dimensions: i0, i1 and i2.
 * access_expression:
 *      The expression of the access.
 *      This expression is parsed recursively (by calling get_constraint_for_access)
 *      and is gradually used to update the constraint.
 * access_relation:
 *      The access relation that represents the access.
 * cst:
 *      The constraint that defines the access and that is being constructed.
 *      Different calls to get_constraint_for_access modify this constraint
 *      gradually until the final constraint is created. Only the final constraint
 *      is added to the access_relation.
 * coeff:
 *      The coefficient in which all the dimension coefficients of the constraint
 *      are going to be multiplied. This coefficient is used to implement o_minus,
 *      o_mul and o_sub.
 */
isl_constraint *generator::get_constraint_for_access(int access_dimension,
                                                     const polyfp::expr &access_expression,
                                                     isl_map *access_relation,
                                                     isl_constraint *cst,
                                                     int coeff,
                                                     const polyfp::function *fct)
{
    // An e_val can appear in an expression passed to this function in two cases:
    // I- the e_val refers to the constant of the constraint (for example in
    // "i + 1", the "+1" refers to the constant of the constraint).
    // II- the e_val is a coefficient of a dimension. For example, in "2*i"
    // the "+2" is a coefficient of "i".
    //
    // The case (I) is handled in the following block, while the case (II)
    // is handled in the block handling o_mul. The "+2" in that case is
    // used to update coeff.
    if (access_expression.get_expr_type() == polyfp::e_val)
    {
        int64_t val = coeff * access_expression.get_int_val() -
                      isl_val_get_num_si(isl_constraint_get_constant_val(cst));
        cst = isl_constraint_set_constant_si(cst, -val);
        DEBUG(3, polyfp::str_dump("Assigning -(coeff * access_expression.get_int_val() - isl_val_get_num_si(isl_constraint_get_constant_val(cst))) to the cst dimension. The value assigned is : "
                                    + std::to_string(-val)));
    }
    else if (access_expression.get_expr_type() == polyfp::e_var)
    {
        assert(!access_expression.get_name().empty());

        DEBUG(3, polyfp::str_dump("Looking for a dimension named ");
                polyfp::str_dump(access_expression.get_name());
                polyfp::str_dump(" in the domain of ", isl_map_to_str(access_relation)));
        int dim0 = isl_space_find_dim_by_name(isl_map_get_space(access_relation),
                                              isl_dim_in,
                                              access_expression.get_name().c_str());
        if (dim0 >= 0)
        {
            int current_coeff = -isl_val_get_num_si(isl_constraint_get_coefficient_val(cst, isl_dim_in, dim0));
            coeff = current_coeff + coeff;
            cst = isl_constraint_set_coefficient_si(cst, isl_dim_in, dim0, -coeff);
            DEBUG(3, polyfp::str_dump("Dimension found. Assigning -1 to the input coefficient of dimension " +
                                        std::to_string(dim0)));
        }
        else
        {
            DEBUG(3, polyfp::str_dump("Dimension not found. Adding dimension as a parameter."));
            access_relation = isl_map_add_dims(access_relation, isl_dim_param, 1);
            int pos = isl_map_dim(access_relation, isl_dim_param);
            isl_id *param_id = isl_id_alloc(fct->get_isl_ctx(), access_expression.get_name().c_str (), NULL);
            access_relation = isl_map_set_dim_id(access_relation, isl_dim_param, pos - 1, param_id);
            isl_local_space *ls2 = isl_local_space_from_space(isl_map_get_space(access_relation));
            cst = isl_constraint_alloc_equality(ls2);
            cst = isl_constraint_set_coefficient_si(cst, isl_dim_param, pos - 1, -coeff);
            cst = isl_constraint_set_coefficient_si(cst, isl_dim_out, access_dimension, 1);
            DEBUG(3, polyfp::str_dump("After adding a parameter:", isl_map_to_str(access_relation)));
        }
    }
    else if (access_expression.get_expr_type() == polyfp::e_op)
    {
        if (access_expression.get_op_type() == polyfp::o_add)
        {
            polyfp::expr op0 = access_expression.get_operand(0);
            polyfp::expr op1 = access_expression.get_operand(1);
            cst = generator::get_constraint_for_access(access_dimension, op0, access_relation, cst, coeff, fct);
            isl_constraint_dump(cst);
            cst = generator::get_constraint_for_access(access_dimension, op1, access_relation, cst, coeff, fct);
            isl_constraint_dump(cst);
        }
        else if (access_expression.get_op_type() == polyfp::o_sub)
        {
            polyfp::expr op0 = access_expression.get_operand(0);
            polyfp::expr op1 = access_expression.get_operand(1);
            cst = generator::get_constraint_for_access(access_dimension, op0, access_relation, cst, coeff, fct);
            cst = generator::get_constraint_for_access(access_dimension, op1, access_relation, cst, -coeff, fct);
        }
        else if (access_expression.get_op_type() == polyfp::o_minus)
        {
            polyfp::expr op0 = access_expression.get_operand(0);
            cst = generator::get_constraint_for_access(access_dimension, op0, access_relation, cst, -coeff, fct);
        }
        else if (access_expression.get_op_type() == polyfp::o_mul)
        {
            polyfp::expr op0 = access_expression.get_operand(0);
            polyfp::expr op1 = access_expression.get_operand(1);
            if (op0.get_expr_type() == polyfp::e_val)
            {
                coeff = coeff * op0.get_int_val();
                cst = generator::get_constraint_for_access(access_dimension, op1, access_relation, cst, coeff, fct);
            }
            else if (op1.get_expr_type() == polyfp::e_val)
            {
                coeff = coeff * op1.get_int_val();
                cst = generator::get_constraint_for_access(access_dimension, op0, access_relation, cst, coeff, fct);
            }
        }
        else
        {
            ERROR("Currently only Add, Sub, Minus, and Mul operations for accesses are supported for now.", true);
        }
    }

    return cst;
}
/**
 * Traverse the polyfp expression and extract the access of the access
 * operation passed in \p exp.
 * An access relation from the domain of the computation \p comp to the
 * computation accessed by the access operation \p exp is added to the
 * vector \p accesses.
 * If \p return_buffer_accesses = true, an access to a buffer is created
 * instead.
 * \p domain_of_accessed_computation is the domain of the current statement
 * (in ISL AST). Knowing this domain is important to retrieve the computation
 * that corresponds to the current statement if many computations that have
 * the name comp.get_name() exist.
 */
void generator::traverse_expr_and_extract_accesses(const polyfp::function *fct,
                                                   const polyfp::compute *comp,
                                                   const polyfp::expr &exp,
                                                   std::vector<isl_map *> &accesses,
                                                   bool return_buffer_accesses)
{
    assert(fct != NULL);
    assert(comp != NULL);

    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    if ((exp.get_expr_type() == polyfp::e_op) && ((exp.get_op_type() == polyfp::o_access) ||
                                                    (exp.get_op_type() == polyfp::o_lin_index) ||
                                                    (exp.get_op_type() == polyfp::o_placeholder) ||
                                                    (exp.get_op_type() == polyfp::o_address_of)))
    {
        DEBUG(3, polyfp::str_dump("Extracting access from o_access."));

        // Get the domain of the computation that corresponds to the access.
        // Even if there are many computations, we take the first because we are
        // only interested in getting the space of those computations and we assume
        // in Tiramisu that all the computations that have the same name, have the same
        // space.
        std::vector<polyfp::compute *> computations_vector = fct->get_computation_by_name(exp.get_name());

        // Since we modify the names of update computations but do not modify the
        // expressions.  When accessing the expressions we find the old names, so
        // we need to look for the new names instead of the old names.
        // We do this instead of actually changing the expressions, because changing
        // the expressions will make the semantics of the printed program ambiguous,
        // since we do not have any way to distinguish between which update is the
        // consumer is consuming exactly.
        if (computations_vector.size() == 0)
        {
            // Search for update computations.
            computations_vector = fct->get_computation_by_name("_" + exp.get_name() + "_update_0");
            assert((computations_vector.size() > 0) && "Computation not found.");
        }
        polyfp::compute *access_op_comp = computations_vector[0];

        DEBUG(10, polyfp::str_dump("Obtained accessed computation."));

        isl_set *lhs_comp_domain = isl_set_universe(isl_set_get_space(comp->get_iteration_domain()));
        isl_set *rhs_comp_domain = isl_set_universe(isl_set_get_space(
                access_op_comp->get_iteration_domain()));
        isl_map *access_map = create_map_from_domain_and_range(lhs_comp_domain, rhs_comp_domain);
        isl_set_free(lhs_comp_domain);
        isl_set_free(rhs_comp_domain);

        isl_map *access_to_comp = isl_map_universe(isl_map_get_space(access_map));
        isl_map_free(access_map);

        DEBUG(3, polyfp::str_dump("Transformation map before adding constraints:",
                                    isl_map_to_str(access_to_comp)));

        // The dimension_number is a counter that indicates to which dimension
        // is the access associated.
        int access_dimension = 0;
        for (const auto &access : exp.get_access())
        {
            DEBUG(3, polyfp::str_dump("Assigning 1 to the coefficient of output dimension " +
                                        std::to_string (access_dimension)));
            isl_constraint *cst = isl_constraint_alloc_equality(isl_local_space_from_space(isl_map_get_space(
                    access_to_comp)));
            cst = isl_constraint_set_coefficient_si(cst, isl_dim_out, access_dimension, 1);
            cst = generator::get_constraint_for_access(access_dimension, access, access_to_comp, cst, 1, fct);
            access_to_comp = isl_map_add_constraint(access_to_comp, cst);
            DEBUG(3, polyfp::str_dump("After adding a constraint:", isl_map_to_str(access_to_comp)));
            access_dimension++;
        }

        DEBUG(3, polyfp::str_dump("Transformation function after adding constraints:",
                                    isl_map_to_str(access_to_comp)));

        if (return_buffer_accesses)
        {
            isl_map *access_to_buff = isl_map_copy(access_op_comp->get_access_relation());

            DEBUG(3, polyfp::str_dump("The access of this computation to buffers (before re-adapting its domain into the domain of the current access) : ",
                                        isl_map_to_str(access_to_buff)));

            access_to_buff = isl_map_apply_range(isl_map_copy(access_to_comp), access_to_buff);
            DEBUG(3, polyfp::str_dump("Applying access function on the range of transformation function:",
                                        isl_map_to_str(access_to_buff)));

            // Run the following block (i.e. apply the schedule on the access function) only if
            // we are looking for the buffer access functions (i.e. return_buffer_accesses == true)
            // otherwise return the access function that is not transformed into time-processor space
            // this is mainly because the function that calls this function expects the access function
            // to be in the iteration domain.
            // if (global::is_auto_data_mapping_set())TODO
            // {
                // DEBUG(3, polyfp::str_dump("Apply the schedule on the domain of the access function. Access functions:",
                //                             isl_map_to_str(access_to_buff)));
                // DEBUG(3, polyfp::str_dump("Trimmed schedule:",
                //                             isl_map_to_str(comp->get_trimmed_union_of_schedules())));
                // access_to_buff = isl_map_apply_domain(access_to_buff,
                //                                       isl_map_copy(comp->get_trimmed_union_of_schedules()));
                // DEBUG(3, polyfp::str_dump("Result: ", isl_map_to_str(access_to_buff)));
            // }

            accesses.push_back(access_to_buff);
            isl_map_free(access_to_comp);
        }
        else
        {
            accesses.push_back(access_to_comp);
        }
    }
    else if (exp.get_expr_type() == polyfp::e_op)
    {
        DEBUG(3, polyfp::str_dump("Extracting access from e_op."));

        switch (exp.get_op_type())
        {
            case polyfp::o_minus:
            case polyfp::o_logical_not:
            case polyfp::o_floor:
            case polyfp::o_cast:
            case polyfp::o_sin:
            case polyfp::o_cos:
            case polyfp::o_tan:
            case polyfp::o_asin:
            case polyfp::o_acos:
            case polyfp::o_atan:
            case polyfp::o_sinh:
            case polyfp::o_cosh:
            case polyfp::o_tanh:
            case polyfp::o_asinh:
            case polyfp::o_acosh:
            case polyfp::o_atanh:
            case polyfp::o_abs:
            case polyfp::o_sqrt:
            case polyfp::o_expo:
            case polyfp::o_log:
            case polyfp::o_ceil:
            case polyfp::o_round:
            case polyfp::o_trunc:
            case polyfp::o_address:
            {
                polyfp::expr exp0 = exp.get_operand(0);
                generator::traverse_expr_and_extract_accesses(fct, comp, exp0, accesses, return_buffer_accesses);
                break;
            }
            case polyfp::o_logical_and:
            case polyfp::o_logical_or:
            case polyfp::o_max:
            case polyfp::o_min:
            case polyfp::o_add:
            case polyfp::o_sub:
            case polyfp::o_mul:
            case polyfp::o_div:
            case polyfp::o_mod:
            case polyfp::o_le:
            case polyfp::o_lt:
            case polyfp::o_ge:
            case polyfp::o_gt:
            case polyfp::o_eq:
            case polyfp::o_ne:
            case polyfp::o_right_shift:
            case polyfp::o_left_shift:
            {
                polyfp::expr exp0 = exp.get_operand(0);
                polyfp::expr exp1 = exp.get_operand(1);
                generator::traverse_expr_and_extract_accesses(fct, comp, exp0, accesses, return_buffer_accesses);
                generator::traverse_expr_and_extract_accesses(fct, comp, exp1, accesses, return_buffer_accesses);
                break;
            }
            case polyfp::o_select:
            case polyfp::o_cond:
            case polyfp::o_lerp:
            {
                polyfp::expr expr0 = exp.get_operand(0);
                polyfp::expr expr1 = exp.get_operand(1);
                polyfp::expr expr2 = exp.get_operand(2);
                generator::traverse_expr_and_extract_accesses(fct, comp, expr0, accesses, return_buffer_accesses);
                generator::traverse_expr_and_extract_accesses(fct, comp, expr1, accesses, return_buffer_accesses);
                generator::traverse_expr_and_extract_accesses(fct, comp, expr2, accesses, return_buffer_accesses);
                break;
            }
            case polyfp::o_call:
            {
                for (const auto &e : exp.get_arguments())
                {
                    generator::traverse_expr_and_extract_accesses(fct, comp, e, accesses, return_buffer_accesses);
                }
                break;
            }
            case polyfp::o_allocate:
            case polyfp::o_free:
            case polyfp::o_memcpy:
                // They do not have any access.
                break;
            default:
                ERROR("Extracting access function from an unsupported polyfp expression.", 1);
        }
    }

    DEBUG_INDENT(-4);
   
   
    DEBUG_FCT_NAME(3);
}

/**
 * - Generate code:
 * - Generate time-processor domain.
 * - Generate an ISL AST.
 * - Traverse the tree until the level \p dim.
 * - Extract the bounds of that level.
 * - During the traversal, assert that the loop is fully nested.
 *
 */
polyfp::expr utility::get_bound(isl_set *set, int dim, int upper)
{
    DEBUG_FCT_NAME(10);
    DEBUG_INDENT(4);

    assert(set != NULL);
    assert(dim >= 0);
    assert(dim < isl_space_dim(isl_set_get_space(set), isl_dim_set));
    assert(isl_set_is_empty(set) == isl_bool_false);

    DEBUG(10, polyfp::str_dump(std::string("Getting the ") + (upper ? "upper" : "lower") +
                                 " bound on the dimension " +
                                 std::to_string(dim) + " of the set ",
                                 isl_set_to_str(set)));

    polyfp::expr e = polyfp::expr();
    isl_ast_build *ast_build;
    isl_ctx *ctx = isl_set_get_ctx(set);
    ast_build = isl_ast_build_alloc(ctx);

    // Create identity map for set.
    isl_space *sp = isl_set_get_space(set);
    isl_map *sched = isl_map_identity(isl_space_copy(isl_space_map_from_set(sp)));
    sched = isl_map_set_tuple_name(sched, isl_dim_out, "");

    // Generate the AST.
    DEBUG(3, polyfp::str_dump("Setting ISL AST generator options."));
    isl_options_set_ast_build_atomic_upper_bound(ctx, 1);
    isl_options_get_ast_build_exploit_nested_bounds(ctx);
    isl_options_set_ast_build_group_coscheduled(ctx, 1);
    isl_options_set_ast_build_allow_else(ctx, 1);
    isl_options_set_ast_build_detect_min_max(ctx, 1);

    // Computing the polyhedral hull of the input set.
    //DEBUG(3, polyfp::str_dump("Computing the polyhedral hull of the input set."));
    //set = isl_set_from_basic_set(isl_set_affine_hull(isl_set_copy(set)));
    //DEBUG(3, polyfp::str_dump("The polyhedral hull is: ", isl_set_to_str(set)));

    // Intersect the iteration domain with the domain of the schedule.
    DEBUG(3, polyfp::str_dump("Generating time-space domain."));
    isl_map *map =
        isl_map_intersect_domain(
            isl_map_copy(sched),
            isl_set_copy(set));

    // Set iterator names
    DEBUG(3, polyfp::str_dump("Setting the iterator names."));
    int length = isl_map_dim(map, isl_dim_out);
    isl_id_list *iterators = isl_id_list_alloc(ctx, length);

    for (int i = 0; i < length; i++)
    {
        std::string name;
        if (isl_set_has_dim_name(set, isl_dim_set, i) == true)
            name = isl_set_get_dim_name(set, isl_dim_set, i);
        else
            name = generate_new_variable_name();
        isl_id *id = isl_id_alloc(ctx, name.c_str(), NULL);
        iterators = isl_id_list_add(iterators, id);
    }

    ast_build = isl_ast_build_set_iterators(ast_build, iterators);

    isl_ast_node *node = isl_ast_build_node_from_schedule_map(ast_build, isl_union_map_from_map(map));
    e = utility::extract_bound_expression(node, dim, upper);
    isl_ast_build_free(ast_build);

    assert(e.is_defined() && "The computed bound expression is undefined.");
    DEBUG(10, polyfp::str_dump(std::string("The ") + (upper ? "upper" : "lower") + " bound is : "); e.dump(false));
    DEBUG_INDENT(-4);

    return e;
}

/**
  * Traverse recursively the ISL AST tree
  *
  * \p node represents the root of the tree to be traversed.
  *
  * \p dim is the dimension of the loop from which the bounds have to be
  * extracted.
  *
  * \p upper is a boolean that should be set to true to extract
  * the upper bound and false to extract the lower bound.
  */
polyfp::expr utility::extract_bound_expression(isl_ast_node *node, int dim, bool upper)
{
    assert(node != NULL);
    assert(dim >= 0);

    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    polyfp::expr result;

    DEBUG(3, polyfp::str_dump("Extracting bounds from a loop at depth = " + std::to_string(dim)));
    DEBUG(3, polyfp::str_dump("Extracting bounds from the following ISL AST node "));
    DEBUG(3, polyfp::str_dump("\n"); polyfp::str_dump(std::string(isl_ast_node_to_C_str(node))));

    if (isl_ast_node_get_type(node) == isl_ast_node_block)
    {
        ERROR("Currently Tiramisu does not support extracting bounds from blocks.", true);
    }
    else if (isl_ast_node_get_type(node) == isl_ast_node_for)
    {
        DEBUG(3, polyfp::str_dump("Extracting bounds from a for loop."));
        isl_ast_expr *init_bound = isl_ast_node_for_get_init(node);
        isl_ast_expr *upper_bound = isl_ast_node_for_get_cond(node);
        DEBUG(3, polyfp::str_dump("Lower bound at this level is: " + std::string(isl_ast_expr_to_C_str(init_bound))));
        DEBUG(3, polyfp::str_dump("Upper bound at this level is: " + std::string(isl_ast_expr_to_C_str(upper_bound))));

        if (dim == 0)
        {
            if (upper)
            {
                isl_ast_expr *cond = isl_ast_node_for_get_cond(node);

                /**
                  * If we have an expression
                  *  i < N
                  * or an expression
                  *  i <= N - 1
                  *
                  * In both cases, the returned bound should be (N-1).
                  */
                if (isl_ast_expr_get_op_type(cond) == isl_ast_op_lt)
                {
                    // Create an expression of "1".
                    isl_val *one = isl_val_one(isl_ast_node_get_ctx(node));
                    // Add 1 to the ISL ast upper bound to transform it into a strinct bound.
                    result = polyfp_expr_from_isl_ast_expr(isl_ast_expr_sub(isl_ast_expr_get_op_arg(cond, 1),
                                                             isl_ast_expr_from_val(one)));
                }
                else if (isl_ast_expr_get_op_type(cond) == isl_ast_op_le)
                {
                    result = polyfp_expr_from_isl_ast_expr(isl_ast_expr_get_op_arg(cond, 1));
                }
            }
            else
            {
                isl_ast_expr *init = isl_ast_node_for_get_init(node);
                result = polyfp_expr_from_isl_ast_expr(init);
            }
        }
        else
        {
            isl_ast_node *body = isl_ast_node_for_get_body(node);
            result = utility::extract_bound_expression(body, dim-1, upper);
            isl_ast_node_free(body);
        }

        assert(result.is_defined());
    }
    else if (isl_ast_node_get_type(node) == isl_ast_node_user)
    {
        ERROR("Cannot extract bounds from a isl_ast_user node.", true);
    }
    else if (isl_ast_node_get_type(node) == isl_ast_node_if)
    {
        DEBUG(3, polyfp::str_dump("If conditional."));

        // polyfp::expr cond_bound = polyfp_expr_from_isl_ast_expr(isl_ast_node_if_get_cond(node));
        polyfp::expr then_bound = utility::extract_bound_expression(isl_ast_node_if_get_then(node), dim, upper);

        polyfp::expr else_bound;
        if (isl_ast_node_if_has_else(node))
        {
            // else_bound = utility::extract_bound_expression(isl_ast_node_if_get_else(node), dim, upper);
            // result = polyfp::expr(polyfp::o_s, cond_bound, then_bound, else_bound);
            ERROR("If Then Else is unsupported in bound extraction.", true);
        }
        else
            result = then_bound; //polyfp::expr(polyfp::o_cond, cond_bound, then_bound);
    }

    DEBUG(3, polyfp::str_dump("Extracted bound:"); result.dump(false));
    DEBUG_INDENT(-4);

    return result;
}

std::string utility::get_parameters_list(isl_set *set)
{
    std::string list = "";

    assert(set != NULL);

    for (int i = 0; i < isl_set_dim(set, isl_dim_param); i++)
    {
        list += isl_set_get_dim_name(set, isl_dim_param, i);
        if ((i != isl_set_dim(set, isl_dim_param) - 1))
        {
            list += ",";
        }
    }

    return list;
}

polyfp::expr polyfp_expr_from_isl_ast_expr(isl_ast_expr *isl_expr)
{
    DEBUG_FCT_NAME(10);
    DEBUG_INDENT(4);

    DEBUG_NO_NEWLINE(10, polyfp::str_dump("Input expression: ", isl_ast_expr_to_C_str(isl_expr)));
    DEBUG_NEWLINE(10);

    polyfp::expr result;

    if (isl_ast_expr_get_type(isl_expr) == isl_ast_expr_int)
    {
        isl_val *init_val = isl_ast_expr_get_val(isl_expr);
        result = value_cast(polyfp::global::get_loop_iterator_data_type(), isl_val_get_num_si(init_val));
        isl_val_free(init_val);
    }
    else if (isl_ast_expr_get_type(isl_expr) == isl_ast_expr_id)
    {
        isl_id *identifier = isl_ast_expr_get_id(isl_expr);
        std::string name_str(isl_id_get_name(identifier));
        isl_id_free(identifier);
        //todo
        // result = polyfp::var(polyfp::global::get_loop_iterator_data_type(), name_str);
    }
    else if (isl_ast_expr_get_type(isl_expr) == isl_ast_expr_op)
    {
        polyfp::expr op0, op1, op2;
        std::vector<polyfp::expr> new_arguments;

        isl_ast_expr *expr0 = isl_ast_expr_get_op_arg(isl_expr, 0);
        op0 = polyfp_expr_from_isl_ast_expr(expr0);
        isl_ast_expr_free(expr0);

        if (isl_ast_expr_get_op_n_arg(isl_expr) > 1)
        {
            isl_ast_expr *expr1 = isl_ast_expr_get_op_arg(isl_expr, 1);
            op1 = polyfp_expr_from_isl_ast_expr(expr1);
            isl_ast_expr_free(expr1);
        }

        if (isl_ast_expr_get_op_n_arg(isl_expr) > 2)
        {
            isl_ast_expr *expr2 = isl_ast_expr_get_op_arg(isl_expr, 2);
            op2 = polyfp_expr_from_isl_ast_expr(expr2);
            isl_ast_expr_free(expr2);
        }

        switch (isl_ast_expr_get_op_type(isl_expr))
        {
            case isl_ast_op_and:
                result = polyfp::expr(polyfp::o_logical_and, op0, op1);
                break;
            case isl_ast_op_and_then:
                result = polyfp::expr(polyfp::o_logical_and, op0, op1);
                ERROR("isl_ast_op_and_then operator found in the AST. This operator is not well supported.",
                                0);
                break;
            case isl_ast_op_or:
                result = polyfp::expr(polyfp::o_logical_or, op0, op1);
                break;
            case isl_ast_op_or_else:
                result = polyfp::expr(polyfp::o_logical_or, op0, op1);
                ERROR("isl_ast_op_or_then operator found in the AST. This operator is not well supported.",
                                0);
                break;
            case isl_ast_op_max:
                result = polyfp::expr(polyfp::o_max, op0, op1);
                break;
            case isl_ast_op_min:
                result = polyfp::expr(polyfp::o_min, op0, op1);
                break;
            case isl_ast_op_minus:
                result = polyfp::expr(polyfp::o_minus, op0);
                break;
            case isl_ast_op_add:
                result = polyfp::expr(polyfp::o_add, op0, op1);
                break;
            case isl_ast_op_sub:
                result = polyfp::expr(polyfp::o_sub, op0, op1);
                break;
            case isl_ast_op_mul:
                result = polyfp::expr(polyfp::o_mul, op0, op1);
                break;
            case isl_ast_op_div:
                result = polyfp::expr(polyfp::o_div, op0, op1);
                break;
            case isl_ast_op_fdiv_q:
            case isl_ast_op_pdiv_q:
                result = polyfp::expr(polyfp::o_div, op0, op1);
                result = polyfp::expr(polyfp::o_floor, result);
                result = polyfp::expr(polyfp::o_cast, polyfp::global::get_loop_iterator_data_type(), result);
                break;
            case isl_ast_op_zdiv_r:
            case isl_ast_op_pdiv_r:
                result = polyfp::expr(polyfp::o_mod, op0, op1);
                break;
            case isl_ast_op_select:
            case isl_ast_op_cond:
                result = polyfp::expr(polyfp::o_select, op0, op1, op2);
                break;
            case isl_ast_op_le:
                result = polyfp::expr(polyfp::o_le, op0, op1);
                break;
            case isl_ast_op_lt:
                result = polyfp::expr(polyfp::o_lt, op0, op1);
                break;
            case isl_ast_op_ge:
                result = polyfp::expr(polyfp::o_ge, op0, op1);
                break;
            case isl_ast_op_gt:
                result = polyfp::expr(polyfp::o_gt, op0, op1);
                break;
            case isl_ast_op_eq:
                result = polyfp::expr(polyfp::o_eq, op0, op1);
                break;
            default:
                polyfp::str_dump("Transforming the following expression",
                                   (const char *)isl_ast_expr_to_C_str(isl_expr));
                polyfp::str_dump("\n");
                ERROR("Translating an unsupported ISL expression into a Tiramisu expression.", 1);
        }
    }
    else
    {
        polyfp::str_dump("Transforming the following expression",
                           (const char *)isl_ast_expr_to_C_str(isl_expr));
        polyfp::str_dump("\n");
        ERROR("Translating an unsupported ISL expression into a Tiramisu expression.", 1);
    }

    DEBUG_INDENT(-4);

    return result;
}
}