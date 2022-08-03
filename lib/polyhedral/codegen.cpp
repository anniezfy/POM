#include "codegen.h"
namespace polyfp
{

std::vector<compute *> function::get_computation_by_name(std::string name) const
{
    assert(!name.empty());

    DEBUG(10, polyfp::str_dump("Searching computation " + name));

    std::vector<polyfp::compute *> res_comp;

    for (const auto &comp : this->get_computations())
    {
        if (name == comp->get_name())
        {
            res_comp.push_back(comp);
        }
    }

    if (res_comp.empty())
    {
        DEBUG(10, polyfp::str_dump("Computation not found."));
    }
    else
    {
        DEBUG(10, polyfp::str_dump("Computation found."));
    }

    return res_comp;
}


bool access_is_affine(const polyfp::expr &exp)
{
    DEBUG_INDENT(4);
    DEBUG_FCT_NAME(10);

    // We assume that the access is affine until we find the opposite.
    bool affine = true;

    // Traverse the expression tree and try to find expressions that are non-affine.
    if (exp.get_expr_type() == polyfp::e_val ||
        exp.get_expr_type() == polyfp::e_var)
    {
        affine = true;
    }
    else if (exp.get_expr_type() == polyfp::e_op)
    {
        switch (exp.get_op_type())
        {
            case polyfp::o_access:
            case polyfp::o_call:
            case polyfp::o_address:
            case polyfp::o_allocate:
            case polyfp::o_free:
            case polyfp::o_type:
            case polyfp::o_address_of:
            case polyfp::o_lin_index:
            case polyfp::o_placeholder:
                affine = false;
                break;
            case polyfp::o_minus:
            case polyfp::o_logical_not:
                affine = access_is_affine(exp.get_operand(0));
                break;
            case polyfp::o_logical_and:
            case polyfp::o_logical_or:
            case polyfp::o_add:
            case polyfp::o_sub:
                affine = access_is_affine(exp.get_operand(0)) && access_is_affine(exp.get_operand(1));
                break;
            case polyfp::o_max:
            case polyfp::o_min:
            case polyfp::o_floor:
            case polyfp::o_select:
            case polyfp::o_lerp:
            case polyfp::o_cond:
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
                // For now we consider these expression to be non-affine expression (although they can be expressed
                // as affine contraints).
                // TODO: work on the expression parser to support parsing these expressions into an access relation
                // with affine constraints.
                affine = false;
                break;
            case polyfp::o_right_shift:
            case polyfp::o_left_shift:
            case polyfp::o_cast:
                affine = false;
                break;
            case polyfp::o_mul:
            case polyfp::o_div:
            case polyfp::o_mod:
            case polyfp::o_le:
            case polyfp::o_lt:
            case polyfp::o_ge:
            case polyfp::o_gt:
            case polyfp::o_eq:
            case polyfp::o_ne:
            // todo
                // if (access_has_id(exp.get_operand(0)) && access_has_id(exp.get_operand(1)))
                // {
                //     affine = false;
                // }
                break;
            default:
                ERROR("Unsupported polyfp expression passed to access_is_affine().", 1);
        }
    }

    DEBUG_INDENT(-4);

    return affine;
}


isl_ast_node *for_code_generator_after_for(isl_ast_node *node, isl_ast_build *build, void *user)
{
    return node;
}






/**
 * Traverse the polyfp expression and replace non-affine accesses by a constant.
 */
polyfp::expr traverse_expr_and_replace_non_affine_accesses(polyfp::compute *comp,
                                                             const polyfp::expr &exp)
{
    DEBUG_FCT_NAME(10);
    DEBUG_INDENT(4);

    DEBUG_NO_NEWLINE(10, polyfp::str_dump("Input expression: "); exp.dump(false););
    DEBUG_NEWLINE(10);

    polyfp::expr output_expr;

    if (exp.get_expr_type() == polyfp::e_val ||
        exp.get_expr_type() == polyfp::e_var )
    {
        output_expr = exp;
    }
    else if ((exp.get_expr_type() == polyfp::e_op) && ((exp.get_op_type() == polyfp::o_access) ||
                                                         (exp.get_op_type() == polyfp::o_address_of) ||
                                                         (exp.get_op_type() == polyfp::o_lin_index) ||
                                                         (exp.get_op_type() == polyfp::o_placeholder)))
    {
        polyfp::expr exp2 = exp;

        DEBUG(10, polyfp::str_dump("Looking for non-affine accesses in an o_access."));

        for (const auto &access : exp2.get_access())
        {
            traverse_expr_and_replace_non_affine_accesses(comp, access);
        }

        // Check if the access expressions of exp are affine (exp is an access operation).
        for (size_t i = 0; i < exp2.get_access().size(); i++)
        {
            // If the access is not affine, create a new constant that computes it
            // and use it as an access expression.
            if (access_is_affine(exp2.get_access()[i]) == false)
            {
                DEBUG_NO_NEWLINE(10, polyfp::str_dump("Access is not affine. Access: "));
                exp2.get_access()[i].dump(false); DEBUG_NEWLINE(10);
                std::string access_name = generate_new_variable_name();
                // todo
                // comp->add_associated_let_stmt(access_name, exp2.get_access()[i]);
                // exp2.set_access_dimension(i, polyfp::var(exp2.get_access()[i].get_data_type(), access_name));
                DEBUG(10, polyfp::str_dump("New access:")); exp2.get_access()[i].dump(false);
            }
        }

        output_expr = exp2;
    }
    else if (exp.get_expr_type() == polyfp::e_op)
    {
        DEBUG(10, polyfp::str_dump("Extracting access from e_op."));

        polyfp::expr exp2, exp3, exp4;
        std::vector<polyfp::expr> new_arguments;

        switch (exp.get_op_type())
        {
            case polyfp::o_minus:
            case polyfp::o_logical_not:
            case polyfp::o_floor:
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
                exp2 = traverse_expr_and_replace_non_affine_accesses(comp, exp.get_operand(0));
                output_expr = polyfp::expr(exp.get_op_type(), exp2);
                break;
            case polyfp::o_cast:
                exp2 = traverse_expr_and_replace_non_affine_accesses(comp, exp.get_operand(0));
                output_expr = expr(exp.get_op_type(), exp.get_data_type(), exp2);
                break;
            case polyfp::o_logical_and:
            case polyfp::o_logical_or:
            case polyfp::o_sub:
            case polyfp::o_add:
            case polyfp::o_max:
            case polyfp::o_min:
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
                exp2 = traverse_expr_and_replace_non_affine_accesses(comp, exp.get_operand(0));
                exp3 = traverse_expr_and_replace_non_affine_accesses(comp, exp.get_operand(1));
                output_expr = polyfp::expr(exp.get_op_type(), exp2, exp3);
                break;
            case polyfp::o_select:
            case polyfp::o_cond:
            case polyfp::o_lerp:
                exp2 = traverse_expr_and_replace_non_affine_accesses(comp, exp.get_operand(0));
                exp3 = traverse_expr_and_replace_non_affine_accesses(comp, exp.get_operand(1));
                exp4 = traverse_expr_and_replace_non_affine_accesses(comp, exp.get_operand(2));
                output_expr = polyfp::expr(exp.get_op_type(), exp2, exp3, exp4);
                break;
            case polyfp::o_call:
                for (const auto &e : exp.get_arguments())
                {
                    exp2 = traverse_expr_and_replace_non_affine_accesses(comp, e);
                    new_arguments.push_back(exp2);
                }
                output_expr = polyfp::expr(o_call, exp.get_name(), new_arguments, exp.get_data_type());
                break;
            case polyfp::o_allocate:
            case polyfp::o_free:
            case polyfp::o_memcpy:
                output_expr = exp;
                break;
            default:
                ERROR("Unsupported polyfp expression passed to traverse_expr_and_replace_non_affine_accesses().",
                                1);
        }
    }

    DEBUG_INDENT(-4);

    return output_expr;
}





} // namespace polyfp
