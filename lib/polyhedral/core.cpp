#include <isl/ctx.h>
#include <isl/aff.h>
#include <isl/set.h>
#include <isl/map.h>
#include <isl/id.h>
#include <isl/constraint.h>
#include <isl/union_map.h>
#include <isl/union_set.h>
#include <isl/ast_build.h>

#include "debug.h"
#include "core.h"

#ifdef _WIN32
#include <iso646.h>
#endif

namespace polyfp
{
// Used for the generation of new variable names.
int id_counter = 0;
static int next_dim_name = 0;


primitive_t global::loop_iterator_type = p_int32;
function *global::implicit_fct;
std::unordered_map<std::string, var> var::declared_vars;
// todo
// const var computation::root = var("root");

std::string generate_new_variable_name();

polyfp::expr traverse_expr_and_replace_non_affine_accesses(polyfp::compute *comp,
                                                             const polyfp::expr &exp);

////////////////////////////////////////////////////

void init(std::string fct_name)
{
    function *fct = new function(fct_name);
    global::set_implicit_function(fct);
    // Do all the rest of the initialization.
    init();
}


void init()
{
    // Set default polyfp options.
    global::set_default_polyfp_options();
}

void codegen()
{
    function *fct = global::get_implicit_function();
    fct->codegen();
}



/**
 * Transform the loop level into its corresponding dynamic schedule
 * dimension.
 *
 * In the example below, the dynamic dimension that corresponds
 * to the loop level 0 is 2, and to 1 it is 4, ...
 *
 * The first dimension is the duplication dimension, the following
 * dimensions are static, dynamic, static, dynamic, ...
 *
 * Loop level               :    -1         0      1      2
 * Schedule dimension number:        0, 1   2  3   4  5   6  7
 * Schedule:                        [0, 0, i1, 0, i2, 0, i3, 0]
 */
int loop_level_into_dynamic_dimension(int level)
{
    return 1 + (level * 2 + 1);
}

/**
 * Transform the loop level into the first static schedule
 * dimension after its corresponding dynamic dimension.
 *
 * In the example below, the first static dimension that comes
 * after the corresponding dynamic dimension for
 * the loop level 0 is 3, and to 1 it is 5, ...
 *
 * Loop level               :    -1         0      1      2
 * Schedule dimension number:        0, 1   2  3   4  5   6  7
 * Schedule:                        [0, 0, i1, 0, i2, 0, i3, 0]
 */
int loop_level_into_static_dimension(int level)
{
    return loop_level_into_dynamic_dimension(level) + 1;
}

/**
 * Transform a dynamic schedule dimension into the corresponding loop level.
 *
 * In the example below, the loop level that corresponds
 * to the dynamic dimension 2 is 0, and to the dynamic dimension 4 is 1, ...
 *
 * The first dimension is the duplication dimension, the following
 * dimensions are static, dynamic, static, dynamic, ...
 *
 * Loop level               :    -1         0      1      2
 * Schedule dimension number:        0, 1   2  3   4  5   6  7
 * Schedule:                        [0, 0, i1, 0, i2, 0, i3, 0]
 */
int dynamic_dimension_into_loop_level(int dim)
{
    assert(dim % 2 == 0);
    int level = (dim - 2)/2;
    return level;
}

std::string generate_new_variable_name()
{
    return "t" + std::to_string(id_counter++);
}

std::string generate_new_computation_name()
{
    return "C" + std::to_string(id_counter++);
}

std::string str_from_polyfp_type_expr(polyfp::expr_t type)
{
    switch (type)
    {
    case polyfp::e_val:
        return "val";
    case polyfp::e_op:
        return "op";
    case polyfp::e_var:
        return "var";
    default:
        ERROR("polyfp type not supported.", true);
        return "";
    }
}

std::string str_from_polyfp_type_argument(polyfp::argument_t type)
{
    switch (type)
    {
    case polyfp::a_input:
        return "input";
    case polyfp::a_output:
        return "output";
    case polyfp::a_temporary:
        return "temporary";
    default:
        ERROR("polyfp type not supported.", true);
        return "";
    }
}

std::string str_from_polyfp_type_primitive(polyfp::primitive_t type)
{
    switch (type)
    {
    case polyfp::p_uint8:
        return "uint8";
    case polyfp::p_int8:
        return "int8";
    case polyfp::p_uint16:
        return "uint16";
    case polyfp::p_int16:
        return "int16";
    case polyfp::p_uint32:
        return "uint32";
    case polyfp::p_int32:
        return "int32";
    case polyfp::p_uint64:
        return "uint64";
    case polyfp::p_int64:
        return "int64";
    case polyfp::p_float32:
        return "float32";
    case polyfp::p_float64:
        return "float64";
    case polyfp::p_boolean:
        return "bool";
    default:
        ERROR("polyfp type not supported.", true);
        return "";
    }
}
std::string str_polyfp_type_op(polyfp::op_t type)
{
    switch (type)
    {
    case polyfp::o_logical_and:
        return "and";
    case polyfp::o_logical_or:
        return "or";
    case polyfp::o_max:
        return "max";
    case polyfp::o_min:
        return "min";
    case polyfp::o_minus:
        return "minus";
    case polyfp::o_add:
        return "add";
    case polyfp::o_sub:
        return "sub";
    case polyfp::o_mul:
        return "mul";
    case polyfp::o_div:
        return "div";
    case polyfp::o_mod:
        return "mod";
    case polyfp::o_select:
        return "select";
    case polyfp::o_lerp:
        return "lerp";
    case polyfp::o_cond:
        return "ternary_cond";
    case polyfp::o_logical_not:
        return "not";
    case polyfp::o_eq:
        return "eq";
    case polyfp::o_ne:
        return "ne";
    case polyfp::o_le:
        return "le";
    case polyfp::o_lt:
        return "lt";
    case polyfp::o_ge:
        return "ge";
    case polyfp::o_call:
        return "call";
    case polyfp::o_access:
        return "access";
    case polyfp::o_address:
        return "address";
    case polyfp::o_right_shift:
        return "right-shift";
    case polyfp::o_left_shift:
        return "left-shift";
    case polyfp::o_floor:
        return "floor";
    case polyfp::o_allocate:
        return "allocate";
    case polyfp::o_free:
        return "free";
    case polyfp::o_cast:
        return "cast";
    case polyfp::o_sin:
        return "sin";
    case polyfp::o_cos:
        return "cos";
    case polyfp::o_tan:
        return "tan";
    case polyfp::o_asin:
        return "asin";
    case polyfp::o_acos:
        return "acos";
    case polyfp::o_atan:
        return "atan";
    case polyfp::o_sinh:
        return "sinh";
    case polyfp::o_cosh:
        return "cosh";
    case polyfp::o_tanh:
        return "tanh";
    case polyfp::o_asinh:
        return "asinh";
    case polyfp::o_acosh:
        return "acosh";
    case polyfp::o_atanh:
        return "atanh";
    case polyfp::o_abs:
        return "abs";
    case polyfp::o_sqrt:
        return "sqrt";
    case polyfp::o_expo:
        return "exp";
    case polyfp::o_log:
        return "log";
    case polyfp::o_ceil:
        return "ceil";
    case polyfp::o_round:
        return "round";
    case polyfp::o_trunc:
        return "trunc";
    default:
        // ERROR("polyfp op not supported.", true);
        return "";
    }
}


// TODO: fix this function
isl_map *add_eq_to_schedule_map(int dim0, int in_dim_coefficient, int out_dim_coefficient,
                                int const_conefficient, isl_map *sched)
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    DEBUG(3, polyfp::str_dump("The schedule :", isl_map_to_str(sched)));
    DEBUG(3, polyfp::str_dump("Editing the dimension " + std::to_string(dim0)));
    DEBUG(3, polyfp::str_dump("Coefficient of the input dimension " + std::to_string(
                                    in_dim_coefficient)));
    DEBUG(3, polyfp::str_dump("Coefficient of the output dimension " + std::to_string(
                                    out_dim_coefficient)));
    DEBUG(3, polyfp::str_dump("Coefficient of the constant " + std::to_string(const_conefficient)));

    isl_map *identity = isl_set_identity(isl_map_range(isl_map_copy(sched)));
    identity = isl_map_universe(isl_map_get_space(identity));
    isl_space *sp = isl_map_get_space(identity);
    isl_local_space *lsp = isl_local_space_from_space(isl_space_copy(sp));

    // Create a transformation map that transforms the schedule.
    for (int i = 0; i < isl_map_dim (identity, isl_dim_out); i++)
        if (i == dim0)
        {
            isl_constraint *cst = isl_constraint_alloc_equality(isl_local_space_copy(lsp));
            cst = isl_constraint_set_coefficient_si(cst, isl_dim_in, dim0, in_dim_coefficient);
            cst = isl_constraint_set_coefficient_si(cst, isl_dim_out, dim0, -out_dim_coefficient);
            // TODO: this should be inverted into const_conefficient.
            cst = isl_constraint_set_constant_si(cst, -const_conefficient);
            identity = isl_map_add_constraint(identity, cst);
            DEBUG(3, polyfp::str_dump("Setting the constraint for dimension " + std::to_string(dim0)));
            DEBUG(3, polyfp::str_dump("The identity schedule is now: ", isl_map_to_str(identity)));
        }
        else
        {
            // Set equality constraints for dimensions
            isl_constraint *cst2 = isl_constraint_alloc_equality(isl_local_space_copy(lsp));
            cst2 = isl_constraint_set_coefficient_si(cst2, isl_dim_in, i, 1);
            cst2 = isl_constraint_set_coefficient_si(cst2, isl_dim_out, i, -1);
            identity = isl_map_add_constraint(identity, cst2);
        }

    isl_map *final_identity = identity;
    DEBUG(3, polyfp::str_dump("The transformation map is: ", isl_map_to_str(final_identity)));
    sched = isl_map_apply_range (sched, final_identity);
    DEBUG(3, polyfp::str_dump("The schedule after being transformed: ", isl_map_to_str(sched)));

    DEBUG_INDENT(-4);

    return sched;
}



}

int add(int i, int j) {
    return i + j;
}

// #include <pybind11/pybind11.h>
// #include <pybind11/stl.h>
// namespace py = pybind11;
// PYBIND11_MODULE(core, m) {
//     m.doc() = "pybind11 example plugin"; // optional module docstring
//     //  m.def("add", &add, "A function which adds two numbers");
//     m.def("add", &add);
//     // auto mlog = m.def_submodule("log");
//     // mlog.def("init", &polyfp::init);
//     // m.def("init", py::overload_cast<std::string>(&polyfp::init), "A ");


// }
