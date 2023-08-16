#ifndef _H_polyfp_EXPR_
#define _H_polyfp_EXPR_
// #include <isl/set.h>
// #include <isl/map.h>
// #include <isl/union_map.h>
// #include <isl/union_set.h>
// #include <isl/ast_build.h>
// #include <isl/schedule.h>
// #include <isl/schedule_node.h>
// #include <isl/space.h>

// #include <map>
#include <unordered_map>
#include <vector>
// #include <string.h>
// #include <stdint.h>
// #include <type_traits>
#include <assert.h>
// #include <Halide.h>
#include "debug.h"
#include "type.h"

namespace polyfp
{
class function;
class compute;

std::string generate_new_variable_name();
std::string str_from_polyfp_type_expr(polyfp::expr_t type);
std::string str_polyfp_type_op(polyfp::op_t type);
std::string str_from_polyfp_type_primitive(polyfp::primitive_t type);

// class placeholder;
class expr;
class var;
class global;

template <typename T>
using only_integral = typename std::enable_if<std::is_integral<T>::value, expr>::type;

/**
  * A class that holds all the global variables necessary for polyfp.
  * It also holds polyfp options.
  */
class global
{
private:
    /**
      * Perform automatic data mapping ?
      */
    static bool auto_data_mapping;

    /**
     * Type of the loop iterators to generate.
     */
    static primitive_t loop_iterator_type;



    /**
      * When polyfp is initialized, an implicit polyfp
      * function is created.  All the computations and placeholders
      * created later are added by deafult to this function unless
      * the user indicates otherwise using the polyfp API (by providing
      * a different function as input to the API).
      */
    static function *implicit_fct;


public:

    /**
      * Return a unique placeholder name.
      */
    static std::string generate_new_placeholder_name()
    {
        static int counter = 0;
        return "b" + std::to_string(counter++);
    }


    static std::string generate_new_constant_name()
    {
        static int counter = 0;
        return "C" + std::to_string(counter++);
    }

    /**
      * Return the implicit function created during polyfp initialization.
      *
      * When polyfp is initialized, an implicit polyfp
      * function is created.  All the computations and placeholders
      * created later are added by deafult to this function unless
      * the user indicates otherwise using the polyfp API (by using the low
      * level polyfp API and by providing a different function as input to the API).
      */
    static function *get_implicit_function()
    {
        return global::implicit_fct;
    }

    /**
      * Set the implicit function to the function given as an argument.
      *
      * All the computations and placeholders created later are added by deafult
      * to this function unless it's modified again.
      */
    static void set_implicit_function(function *fct)
    {
        global::implicit_fct = fct;
    }

    /**
      * If this option is set to true, polyfp automatically
      * modifies the computation data mapping whenever a new
      * schedule is applied to a computation.
      * If it is set to false, it is up to the user to set
      * the right data mapping before code generation.
      */
    static void set_auto_data_mapping(bool v)
    {
        global::auto_data_mapping = v;
    }

    /**
      * Return whether auto data mapping is set.
      * If auto data mapping is set, polyfp automatically
      * modifies the computation data mapping whenever a new
      * schedule is applied to a computation.
      * If it is set to false, it is up to the user to set
      * the right data mapping before code generation.
      */
    static bool is_auto_data_mapping_set()
    {
        return global::auto_data_mapping;
    }

    static void set_default_polyfp_options()
    {
        global::loop_iterator_type = p_int32;
        // set_auto_data_mapping(true);
    }

    static void set_loop_iterator_type(primitive_t t) {
        global::loop_iterator_type = t;
    }

    static primitive_t get_loop_iterator_data_type()
    {
        return global::loop_iterator_type;
    }

    global()
    {
        set_default_polyfp_options();
    }
};



/**
  * A class to represent polyfp expressions.
  */
class expr
{
    friend class input;
    friend class var;
    friend class sync;
    friend class computation;
    friend class generator;

    /**
      * The type of the operator.
      */
    polyfp::op_t _operator;

    /**
      * The value of the 1st, 2nd and 3rd operands of the expression.
      * op[0] is the 1st operand, op[1] is the 2nd, ...
      */
    std::vector<polyfp::expr> op;

    /**
      * The value of the expression.
      */
    union
    {
        uint8_t     uint8_value;
        int8_t      int8_value;
        uint16_t    uint16_value;
        int16_t     int16_value;
        uint32_t    uint32_value;
        int32_t     int32_value;
        uint64_t    uint64_value;
        int64_t     int64_value;
        float       float32_value;
        double      float64_value;
    };

    /**
      * A vector of expressions representing placeholder accesses,
      * or computation accesses.
      * For example for the computation C0(i,j), the access is
      * the vector {i, j}.
      */
    std::vector<polyfp::expr> access_vector;

    /**
      * A vector of expressions representing arguments of an
      * external function.
      * For example, to call the function foo() with the following
      * three arguments as input
      *     the integer 1, the result of the computation C1(0,0), and
      *     the computation C0 (i.e., its placeholder).
      * \p vector should be {polyfp::expr(1), C1(0,0), polyfp::expr(o_address, polyfp::var("C0"))}.
      */
    std::vector<polyfp::expr> argument_vector;

    /**
      * Is this expression defined?
      */
    bool defined;

protected:
    /**
      * Identifier name.
      */
    std::string name;

    /**
      * Data type.
      */
    polyfp::primitive_t dtype;

    /**
      * The type of the expression.
      */
    polyfp::expr_t etype;

public:

  
    polyfp::compute *owner;

    /**
      * Create an undefined expression.
      */
    expr()
    {
        this->defined = false;

        this->_operator = polyfp::o_none;
        this->etype = polyfp::e_none;
        this->dtype = polyfp::p_none;
    }

    /**
      * Create an undefined expression with type.
      */
    expr(polyfp::primitive_t dtype)
    {
        this->defined = false;

        this->_operator = polyfp::o_none;
        this->etype = polyfp::e_none;
        this->dtype = dtype;
    }

    /**
      * Create a cast expression to type \p t (a unary operator).
      */
    expr(polyfp::op_t o, polyfp::primitive_t dtype, polyfp::expr expr0)
    {
        assert((o == polyfp::o_cast) && "Only support cast operator.");

        this->_operator = o;
        this->etype = polyfp::e_op;
        this->dtype = dtype;
        this->defined = true;

        this->op.push_back(expr0);
    }

    /**
      * Create an expression for a unary operator.
      */
    expr(polyfp::op_t o, polyfp::expr expr0)
    {
        if ((o == polyfp::o_floor) &&
            (expr0.get_data_type() != polyfp::p_float32) &&
            (expr0.get_data_type() != polyfp::p_float64))
                expr0 = polyfp::expr(polyfp::o_cast, p_float32, expr0);

        this->_operator = o;
        this->etype = polyfp::e_op;
        this->dtype = expr0.get_data_type();
        this->defined = true;

        this->op.push_back(expr0);
    }

    /**
      * Create an expression for a unary operator that applies
      * on a variable. For example: allocate(A) or free(B).
      */
    expr(polyfp::op_t o, std::string name)
    {
        this->_operator = o;
        this->etype = polyfp::e_op;
        this->dtype = polyfp::p_none;
        this->defined = true;

        this->name = name;
    }

    /**
     * Construct an expression for a binary operator.
     */
    expr(polyfp::op_t o, polyfp::expr expr0, polyfp::expr expr1)
    {
        if (expr0.get_data_type() != expr1.get_data_type())
        {
            polyfp::str_dump("Binary operation between two expressions of different types:\n");
            expr0.dump(false);
            polyfp::str_dump(" (" + str_from_polyfp_type_primitive(expr0.get_data_type()) + ")");
            polyfp::str_dump(" and ");
            expr1.dump(false);
            polyfp::str_dump(" (" + str_from_polyfp_type_primitive(expr1.get_data_type()) + ")");
            polyfp::str_dump("\n");
            ERROR("\nThe two expressions should be of the same type. Use casting to elevate the type of one expression to the other.\n", true);
        }

        this->_operator = o;
        this->etype = polyfp::e_op;
        this->dtype = expr0.get_data_type();
        this->defined = true;

        this->op.push_back(expr0);
        this->op.push_back(expr1);
    }

    /**
     * Construct an expression for a ternary operator.
     */
    expr(polyfp::op_t o, polyfp::expr expr0, polyfp::expr expr1, polyfp::expr expr2)
    {
        assert(expr1.get_data_type() == expr2.get_data_type() &&
               "expr1 and expr2 should be of the same type.");

        this->_operator = o;
        this->etype = polyfp::e_op;
        this->dtype = expr1.get_data_type();
        this->defined = true;

        this->op.push_back(expr0);
        this->op.push_back(expr1);
        this->op.push_back(expr2);
    }

    /**
     * Construct an access or a call.
     */
    expr(polyfp::op_t o, std::string name,
         std::vector<polyfp::expr> vec,
         polyfp::primitive_t type)
    {
        assert(((o == polyfp::o_access) || (o == polyfp::o_call) || (o == polyfp::o_address_of) ||
                (o == polyfp::o_lin_index) || (o == polyfp::o_placeholder)) &&
               "The operator is not an access or a call operator.");

        assert(vec.size() > 0);
        assert(name.size() > 0);

        this->_operator = o;
        this->etype = polyfp::e_op;
        this->dtype = type;
        this->defined = true;

        if (o == polyfp::o_access || o == polyfp::o_address_of || o == polyfp::o_lin_index ||
                o == polyfp::o_placeholder)
        {
            this->set_access(vec);
        }
        else if (o == polyfp::o_call)
        {
            this->set_arguments(vec);
        }
        else
        {
            ERROR("Type of operator is not o_access, o_call, o_address_of, o_placeholder, or o_lin_index.", true);
        }

        this->name = name;
    }

    /**
      * Construct an unsigned 8-bit integer expression.
      */
    expr(uint8_t val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_uint8;
        this->uint8_value = val;
    }

    /**
      * Construct a signed 8-bit integer expression.
      */
    expr(int8_t val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_int8;
        this->int8_value = val;
    }

    /**
      * Construct an unsigned 16-bit integer expression.
      */
    expr(uint16_t val)
    {
        this->defined = true;
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;

        this->dtype = polyfp::p_uint16;
        this->uint16_value = val;
    }

    /**
      * Construct a signed 16-bit integer expression.
      */
    expr(int16_t val)
    {
        this->defined = true;
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;

        this->dtype = polyfp::p_int16;
        this->int16_value = val;
    }

    /**
      * Construct an unsigned 32-bit integer expression.
      */
    expr(uint32_t val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_uint32;
        this->uint32_value = val;
    }

    /**
      * Construct a signed 32-bit integer expression.
      */
    expr(int32_t val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_int32;
        this->int32_value = val;
    }

    /**
      * Construct an unsigned 64-bit integer expression.
      */
    expr(uint64_t val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_uint64;
        this->uint64_value = val;
    }

    /**
      * Construct a signed 64-bit integer expression.
      */
    expr(int64_t val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_int64;
        this->int64_value = val;
    }

    /**
      * Construct a 32-bit float expression.
      */
    expr(float val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_float32;
        this->float32_value = val;
    }

    /**
      * Copy an expression.
      */
    polyfp::expr copy() const;

    /**
      * Construct a 64-bit float expression.
      */
    expr(double val)
    {
        this->etype = polyfp::e_val;
        this->_operator = polyfp::o_none;
        this->defined = true;

        this->dtype = polyfp::p_float64;
        this->float64_value = val;
    }

    /**
      * Return the actual value of the expression.
      */
    // @{
    uint8_t get_uint8_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_uint8);

        return uint8_value;
    }

    int8_t get_int8_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_int8);

        return int8_value;
    }

    uint16_t get_uint16_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_uint16);

        return uint16_value;
    }

    int16_t get_int16_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_int16);

        return int16_value;
    }

    uint32_t get_uint32_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_uint32);

        return uint32_value;
    }

    int32_t get_int32_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_int32);

        return int32_value;
    }

    uint64_t get_uint64_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_uint64);

        return uint64_value;
    }

    int64_t get_int64_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_int64);

        return int64_value;
    }

    float get_float32_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_float32);

        return float32_value;
    }

    double get_float64_value() const
    {
        assert(this->get_expr_type() == polyfp::e_val);
        assert(this->get_data_type() == polyfp::p_float64);

        return float64_value;
    }
    // @}

    int64_t get_int_val() const
    {
        assert(this->get_expr_type() == polyfp::e_val);

        int64_t result = 0;

        if (this->get_data_type() == polyfp::p_uint8)
        {
            result = this->get_uint8_value();
        }
        else if (this->get_data_type() == polyfp::p_int8)
        {
            result = this->get_int8_value();
        }
        else if (this->get_data_type() == polyfp::p_uint16)
        {
            result = this->get_uint16_value();
        }
        else if (this->get_data_type() == polyfp::p_int16)
        {
            result = this->get_int16_value();
        }
        else if (this->get_data_type() == polyfp::p_uint32)
        {
            result = this->get_uint32_value();
        }
        else if (this->get_data_type() == polyfp::p_int32)
        {
            result = this->get_int32_value();
        }
        else if (this->get_data_type() == polyfp::p_uint64)
        {
            result = this->get_uint64_value();
        }
        else if (this->get_data_type() == polyfp::p_int64)
        {
            result = this->get_int64_value();
        }
        else if (this->get_data_type() == polyfp::p_float32)
        {
            result = this->get_float32_value();
        }
        else if (this->get_data_type() == polyfp::p_float64)
        {
            result = this->get_float64_value();
        }
        else
        {
            ERROR("Calling get_int_val() on a non integer expression.", true);
        }

        return result;
    }

    double get_double_val() const
    {
        assert(this->get_expr_type() == polyfp::e_val);

        double result = 0;

        if (this->get_data_type() == polyfp::p_float32)
        {
            result = this->get_float32_value();
        }
        else if (this->get_data_type() == polyfp::p_float64)
        {
            result = this->get_float64_value();
        }
        else
        {
            ERROR("Calling get_double_val() on a non double expression.", true);
        }

        return result;
    }

    /**
      * Return the value of the \p i 'th operand of the expression.
      * \p i can be 0, 1 or 2.
      */
    const polyfp::expr &get_operand(int i) const
    {
        assert(this->get_expr_type() == polyfp::e_op);
        assert((i < (int)this->op.size()) && "Operand index is out of bounds.");

        return this->op[i];
    }

    /**
      * Return the number of arguments of the operator.
      */
    int get_n_arg() const
    {
        assert(this->get_expr_type() == polyfp::e_op);

        return this->op.size();
    }

    /**
      * Return the type of the expression (polyfp::expr_type).
      */
    polyfp::expr_t get_expr_type() const
    {
        return etype;
    }

    /**
      * Get the data type of the expression.
      */
    polyfp::primitive_t get_data_type() const
    {
        return dtype;
    }

    /**
      * Get the name of the ID or the variable represented by this expressions.
      */
    const std::string &get_name() const
    {
        assert(
            (this->get_expr_type() == polyfp::e_var) ||
               (this->get_op_type() == polyfp::o_access) ||
               (this->get_op_type() == polyfp::o_address) ||
               (this->get_op_type() == polyfp::o_call) ||
               (this->get_op_type() == polyfp::o_allocate) ||
               (this->get_op_type() == polyfp::o_free) ||
               (this->get_op_type() == polyfp::o_address_of) ||
               (this->get_op_type() == polyfp::o_lin_index) ||
               (this->get_op_type() == polyfp::o_placeholder) ||
               (this->get_op_type() == polyfp::o_dummy));

        return name;
    }

    void set_name(std::string &name)
    {
        assert((this->get_expr_type() == polyfp::e_var) ||
               (this->get_op_type() == polyfp::o_access) ||
               (this->get_op_type() == polyfp::o_call) ||
               (this->get_op_type() == polyfp::o_allocate) ||
               (this->get_op_type() == polyfp::o_free) ||
               (this->get_op_type() == polyfp::o_address_of) ||
               (this->get_op_type() == polyfp::o_lin_index) ||
               (this->get_op_type() == polyfp::o_dummy));

        this->name = name;
    }

    polyfp::expr replace_op_in_expr(const std::string &to_replace,
                                      const std::string &replace_with)
    {
        if (this->name == to_replace) {
            this->name = replace_with;
            return *this;
        }
        for (int i = 0; i < this->op.size(); i++) {
            polyfp::expr operand = this->get_operand(i);
            this->op[i] = operand.replace_op_in_expr(to_replace, replace_with);
        }
        return *this;
    }

    /**
      * Get the type of the operator (polyfp::op_t).
      */
    polyfp::op_t get_op_type() const
    {
        return _operator;
    }

    /**
      * Return a vector of the access of the computation
      * or array.
      * For example, for the computation C0(i,j), this
      * function will return the vector {i, j} where i and j
      * are both polyfp expressions.
      * For a placeholder access A[i+1,j], it will return also {i+1, j}.
      */
    const std::vector<polyfp::expr> &get_access() const
    {
        assert(this->get_expr_type() == polyfp::e_op);
        assert(this->get_op_type() == polyfp::o_access || this->get_op_type() == polyfp::o_lin_index ||
               this->get_op_type() == polyfp::o_address_of || this->get_op_type() == polyfp::o_dummy ||
                       this->get_op_type() == polyfp::o_placeholder);

        return access_vector;
    }

    /**
      * Return the arguments of an external function call.
      */
    const std::vector<polyfp::expr> &get_arguments() const
    {
        assert(this->get_expr_type() == polyfp::e_op);
        assert(this->get_op_type() == polyfp::o_call);

        return argument_vector;
    }

    /**
      * Get the number of dimensions in the access vector.
      */
    int get_n_dim_access() const
    {
        assert(this->get_expr_type() == polyfp::e_op);
        assert(this->get_op_type() == polyfp::o_access);

        return access_vector.size();
    }

    /**
      * Return true if the expression is defined.
      */
    bool is_defined() const
    {
        return defined;
    }

    /**
      * Return true if \p e is identical to this expression.
      */
    bool is_equal(polyfp::expr e) const
    {
        bool equal = true;

        if ((this->_operator != e._operator) ||
            (this->op.size() != e.op.size()) ||
            (this->access_vector.size()   != e.access_vector.size())   ||
            (this->argument_vector.size() != e.argument_vector.size()) ||
            (this->defined != e.defined)     ||
            (this->name != e.name)           ||
            (this->dtype != e.dtype)         ||
            (this->etype != e.etype))
        {
            equal = false;
            return equal;
        }

        for (int i = 0; i < this->access_vector.size(); i++)
            equal = equal && this->access_vector[i].is_equal(e.access_vector[i]);

        for (int i = 0; i < this->op.size(); i++)
            equal = equal && this->op[i].is_equal(e.op[i]);

        for (int i = 0; i < this->argument_vector.size(); i++)
            equal = equal && this->argument_vector[i].is_equal(e.argument_vector[i]);

        if ((this->etype == e_val) && (e.etype == e_val))
        {
            if (this->get_int_val() != e.get_int_val())
                equal = false;
            if ((this->get_data_type() == polyfp::p_float32) ||
                (this->get_data_type() == polyfp::p_float64))
                if (this->get_double_val() != e.get_double_val())
                    equal = false;
        }

        return equal;
    }

    /**
      * Return true if the expression is an integer value.
      */
    bool is_integer() const
    {
        return this->get_expr_type() == e_val &&
                (this->get_data_type() == p_uint8 ||
                 this->get_data_type() == p_uint16 ||
                 this->get_data_type() == p_uint32 ||
                 this->get_data_type() == p_uint64 ||
                 this->get_data_type() == p_int16 ||
                 this->get_data_type() == p_int32 ||
                 this->get_data_type() == p_int8 ||
                 this->get_data_type() == p_int64);
    }

    /**
      * Addition.
      */
    expr operator+(polyfp::expr other) const;
    // expr operator+(int b) const;
    // friend expr operator+(const int b, polyfp::expr obj) ;

    /**
      * Subtraction.
      */
    expr operator-(polyfp::expr other) const;

    /**
      * Division.
      */
    expr operator/(polyfp::expr other) const;

    /**
      * Multiplication.
      */
    expr operator*(polyfp::expr other) const;

    /**
      * Modulo.
      */
    expr operator%(polyfp::expr other) const;

    /**
      * Right shift operator.
      */
    expr operator>>(polyfp::expr other) const;

    /**
      * Left shift operator.
      */
    expr operator<<(polyfp::expr other) const;

    /**
      * Logical and of two expressions.
      */
    polyfp::expr operator&&(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_logical_and, *this, e1);
    }

    /**
      * Logical and of two expressions.
      */
    polyfp::expr operator||(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_logical_or, *this, e1);
    }

    /**
      * Expression multiplied by (-1).
      */
    polyfp::expr operator-() const
    {
        return polyfp::expr(polyfp::o_minus, *this);
    }

    /**
      * Logical NOT of an expression.
      */
    polyfp::expr operator!() const
    {
        return polyfp::expr(polyfp::o_logical_not, *this);
    }

    polyfp::expr& operator=(polyfp::expr const &);

    /**
      * Comparison operator.
      */
    // @{
    polyfp::expr operator==(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_eq, *this, e1);
    }
    polyfp::expr operator!=(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_ne, *this, e1);
    }
    // @}

    /**
      * Less than operator.
      */
    polyfp::expr operator<(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_lt, *this, e1);
    }

    /**
      * Less than or equal operator.
      */
    polyfp::expr operator<=(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_le, *this, e1);
    }

    /**
      * Greater than operator.
      */
    polyfp::expr operator>(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_gt, *this, e1);
    }

    /**
      * Greater than or equal operator.
      */
    polyfp::expr operator>=(polyfp::expr e1) const
    {
        return polyfp::expr(polyfp::o_ge, *this, e1);
    }

    /**
      * Set the access of a computation or an array.
      * For example, for the computation C0, this
      * function can set the vector {i, j} as an access vector.
      * The result is that the computation C0 is accessed
      * with C0(i,j).
      */
    void set_access(std::vector<polyfp::expr> vector)
    {
        access_vector = vector;
    }

    /**
      * Set an element of the vector of accesses of a computation.
      * This changes only one dimension of the access vector.
      */
    void set_access_dimension(int i, polyfp::expr acc)
    {
        assert((i < (int)this->access_vector.size()) && "index is out of bounds.");
        access_vector[i] = acc;
    }

    /**
      * Set the arguments of an external function call.
      * For example, for the call my_external(C0, 1, C1(i,j)),
      * \p vector should be {C0, 1, C1(i,j)}.
      */
    void set_arguments(std::vector<polyfp::expr> vector)
    {
        argument_vector = vector;
    }



    void get_access_vector(std::vector<polyfp::expr> &loads) const{

        switch (this->etype){
            case polyfp::e_op:
            {
                if (this->get_n_arg() > 0)
                {
                    for (int i = 0; i < this->get_n_arg(); i++)
                    {
                        this->op[i].get_access_vector(loads);
                    }
                }
                if ((this->get_op_type() == polyfp::o_access))
                {
                    // std::cout << "Access to " +  this->get_name() + ". Access expressions:" << std::endl;
                    loads.push_back(*this);
                    // for (const auto &e : this->get_access())
                    // {   
                        // if(e.get_expr_type()== polyfp::e_op){
                        //     if(e.get_n_arg() == 2 ){
                        //         std::cout << "Access to op???????" << std::endl;
                        //         if(e.op[0].get_expr_type()!=polyfp::e_op &&e.op[1].get_expr_type()!=polyfp::e_op){
                        //             if(e.op[0].get_expr_type() == polyfp::e_val && e.op[1].get_expr_type() == polyfp::e_var) {
                        //                 loads.push_back(*this);

                        //             }else if(e.op[0].get_expr_type() == polyfp::e_val && e.op[1].get_expr_type() == polyfp::e_var){
                        //                 loads.push_back(*this);

                        //             }else{
                        //                 std::cout<<"not supported depedency analysis"<<std::endl;
                        //                 break;
                                        
                        //             }
                        //         }
                        //     }else if(e.get_n_arg() == 1 ){
                                
                        //         if(e.get_expr_type() == polyfp::e_var ) {
                        //             loads.push_back(*this);

                        //         }else{

                        //         }

                        //     }
                        //     else{
                        //         std::cout<<"not supported depedency analysis"<<std::endl;
                        //         break;
                                        
                        //     }
                        // }else if(e.get_expr_type() == polyfp::e_var ) {
                        //     std::if(e.get_expr_type()== polyfp::e_op){
                        //     if(e.get_n_arg() == 2 ){
                        //         std::cout << "Access to op???????" << std::endl;
                        //         if(e.op[0].get_expr_type()!=polyfp::e_op &&e.op[1].get_expr_type()!=polyfp::e_op){
                        //             if(e.op[0].get_expr_type() == polyfp::e_val && e.op[1].get_expr_type() == polyfp::e_var) {
                        //                 loads.push_back(*this);

                        //             }else if(e.op[0].get_expr_type() == polyfp::e_val && e.op[1].get_expr_type() == polyfp::e_var){
                        //                 loads.push_back(*this);

                        //             }else{
                        //                 std::cout<<"not supported depedency analysis"<<std::endl;
                        //                 break;
                                        
                        //             }
                        //         }
                        //     }else if(e.get_n_arg() == 1 ){
                                
                        //         if(e.get_expr_type() == polyfp::e_var ) {
                        //             loads.push_back(*this);

                        //         }else{

                        //         }

                        //     }
                        //     else{
                        //         std::cout<<"not supported depedency analysis"<<std::endl;
                        //         break;
                                        
                        //     }
                        // }else if(e.get_expr_type() == polyfp::e_var ) {
                        //     std::cout << "Access to var???????" << std::endl;
                        //     loads.push_back(*this);
                        // }cout << "Access to var???????" << std::endl;
                        //     loads.push_back(*this);
                        // }
                    // }
                }
                
                break;
            }
            case (polyfp::e_val):
            {

                // if (this->get_data_type() == polyfp::p_uint8)
                // {
                //     std::cout << "Value:" << this->get_uint8_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_int8)
                // {
                //     std::cout << "Value:" << this->get_int8_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_uint16)
                // {
                //     std::cout << "Value:" << this->get_uint16_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_int16)
                // {
                //     std::cout << "Value:" << this->get_int16_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_uint32)
                // {
                //     std::cout << "Value:" << this->get_uint32_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_int32)
                // {
                //     std::cout << "Value:" << this->get_int32_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_uint64)
                // {
                //     std::cout << "Value:" << this->get_uint64_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_int64)
                // {
                //     std::cout << "Value:" << this->get_int64_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_float32)
                // {
                //     std::cout << "Value:" << this->get_float32_value() << std::endl;
                // }
                // else if (this->get_data_type() == polyfp::p_float64)
                // {
                //     std::cout << "Value:" << this->get_float64_value() << std::endl;
                // }
                break;
            }
            case (polyfp::e_var):
            {
                // std::cout << "Var name:" << this->get_name() << std::endl;
                // std::cout << "Expression value type:" << str_from_polyfp_type_primitive(this->dtype) << std::endl;
                break;
            }
        } 

    }

    /**
      * Dump the object on standard output (dump most of the fields of
      * the expression class). This is mainly useful for debugging.
      * If \p exhaustive is set to true, all the fields of the class are
      * printed. This is useful to find potential initialization problems.
      */
    void dump(bool exhaustive) const
    {
        if (this->get_expr_type() != e_none)
        {
            if (exhaustive == true)
            {
                if (ENABLE_DEBUG && (this->is_defined()))
                {
                    std::cout << "Expression:" << std::endl;
                    std::cout << "Expression type:" << str_from_polyfp_type_expr(this->etype) << std::endl;
                    switch (this->etype)
                    {
                    case polyfp::e_op:
                    {
                        std::cout << "Expression operator type:" << str_polyfp_type_op(this->_operator) << std::endl;
                        if (this->get_n_arg() > 0)
                        {
                            std::cout << "Number of operands:" << this->get_n_arg() << std::endl;
                            std::cout << "Dumping the operands:" << std::endl;
                            for (int i = 0; i < this->get_n_arg(); i++)
                            {
                                std::cout << "Operand " << std::to_string(i) << "." << std::endl;
                                this->op[i].dump(exhaustive);
                            }
                        }
                        if ((this->get_op_type() == polyfp::o_access))
                        {
                            std::cout << "Access to " +  this->get_name() + ". Access expressions:" << std::endl;
                            for (const auto &e : this->get_access())
                            {
                                e.dump(exhaustive);
                            }
                        }
                        if ((this->get_op_type() == polyfp::o_address_of)) {
                            std::cout << "Address to " + this->get_name() + ". Access expressions:" << std::endl;
                            for (const auto &e : this->get_access()) {
                                e.dump(exhaustive);
                            }
                        }
                        if ((this->get_op_type() == polyfp::o_lin_index)) {
                            std::cout << "Linear address to " + this->get_name() + ". Access expressions:"
                                      << std::endl;
                            for (const auto &e : this->get_access()) {
                                e.dump(exhaustive);
                            }
                        }
                        if ((this->get_op_type() == polyfp::o_call))
                        {
                            std::cout << "call to " +  this->get_name() + ". Argument expressions:" << std::endl;
                            for (const auto &e : this->get_arguments())
                            {
                                e.dump(exhaustive);
                            }
                        }
                        if ((this->get_op_type() == polyfp::o_address))
                        {
                            std::cout << "Address of the following access : " << std::endl;
                            this->get_operand(0).dump(true);
                        }
                        if ((this->get_op_type() == polyfp::o_allocate))
                        {
                            std::cout << "allocate(" << this->get_name() << ")" << std::endl;
                        }
                        if ((this->get_op_type() == polyfp::o_free))
                        {
                            std::cout << "free(" << this->get_name() << ")" << std::endl;
                        }
                        break;
                    }
                    case (polyfp::e_val):
                    {
                        std::cout << "Expression value type:" << str_from_polyfp_type_primitive(this->dtype) << std::endl;

                        if (this->get_data_type() == polyfp::p_uint8)
                        {
                            std::cout << "Value:" << this->get_uint8_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_int8)
                        {
                            std::cout << "Value:" << this->get_int8_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_uint16)
                        {
                            std::cout << "Value:" << this->get_uint16_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_int16)
                        {
                            std::cout << "Value:" << this->get_int16_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_uint32)
                        {
                            std::cout << "Value:" << this->get_uint32_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_int32)
                        {
                            std::cout << "Value:" << this->get_int32_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_uint64)
                        {
                            std::cout << "Value:" << this->get_uint64_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_int64)
                        {
                            std::cout << "Value:" << this->get_int64_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_float32)
                        {
                            std::cout << "Value:" << this->get_float32_value() << std::endl;
                        }
                        else if (this->get_data_type() == polyfp::p_float64)
                        {
                            std::cout << "Value:" << this->get_float64_value() << std::endl;
                        }
                        break;
                    }
                    case (polyfp::e_var):
                    {
                        std::cout << "Var name:" << this->get_name() << std::endl;
                        std::cout << "Expression value type:" << str_from_polyfp_type_primitive(this->dtype) << std::endl;
                        break;
                    }

                    }
                }
            }
            else
            {   std::cout << "dump expression"<<std::endl;
                std::cout << this->to_str();
            }
        }
    }

    /**
      * Return true if this expression is a literal constant (i.e., 0, 1, 2, ...).
      **/
    bool is_constant() const
    {
        if (this->get_expr_type() == polyfp::e_val)
            return true;
        else
            return false;
    }

    bool is_unbounded() const
    {
        if (this->get_name() == "_unbounded")
            return true;
        else
            return false;
    }

    
    int get_dependence_vector() const{
        // TODO: a more general method to calculate dependence vector
        // A(i+4,j-5)-> A(i,j-1)
        // Not supported: A(2*i,j), A(i+j, j+9)
        int temp;
        if (this->get_expr_type() == e_op){
            switch (this->get_op_type()){
                case polyfp::o_add:
                    if ((this->get_operand(0).get_expr_type() == polyfp::e_val)){
                        temp = this->get_operand(0).get_int_val();
                    }else if((this->get_operand(1).get_expr_type() == polyfp::e_val)){
                        temp = this->get_operand(1).get_int_val();
                    }else{
                        std::cout<<"not supported type"<<std::endl;
                        return false;
                    }
                case polyfp::o_sub:
                    if ((this->get_operand(0).get_expr_type() == polyfp::e_val)){
                        temp = -(this->get_operand(1).get_int_val());
                    }else if((this->get_operand(1).get_expr_type() == polyfp::e_val)){
                        temp = -(this->get_operand(1).get_int_val());
                    }else{
                        std::cout<<"not supported type"<<std::endl;
                        return false;
                    }
            }
        }else if(this->get_expr_type() == e_var){
            temp = 0;
            

        }else{
            std::cout<<"not supported type"<<std::endl;
            return false;
        }
        return temp;


    }



    /**
      * Simplify the expression.
      */ 
    polyfp::expr simplify() const
    {
        if (this->get_expr_type() != e_none)
        {
            switch (this->etype)
            {
                case polyfp::e_op:
                {
                    switch (this->get_op_type())
                    {
                    case polyfp::o_logical_and:
                        return *this;
                    case polyfp::o_logical_or:
                        return *this;
                    case polyfp::o_max:
                        return *this;
                    case polyfp::o_min:
                        return *this;
                    case polyfp::o_minus:
                        return *this;
                    case polyfp::o_add:
                        this->get_operand(0).simplify();
                        this->get_operand(1).simplify();
                        if ((this->get_operand(0).get_expr_type() == polyfp::e_val) && (this->get_operand(1).get_expr_type() == polyfp::e_val))
                            if ((this->get_operand(0).get_data_type() == polyfp::p_int32))
                                return expr(this->get_operand(0).get_int_val() + this->get_operand(1).get_int_val());
                    case polyfp::o_sub:
                        this->get_operand(0).simplify();
                        this->get_operand(1).simplify();
                        if ((this->get_operand(0).get_expr_type() == polyfp::e_val) && (this->get_operand(1).get_expr_type() == polyfp::e_val))
                            if ((this->get_operand(0).get_data_type() == polyfp::p_int32))
                                return expr(this->get_operand(0).get_int_val() - this->get_operand(1).get_int_val());
                    case polyfp::o_mul:
                        this->get_operand(0).simplify();
                        this->get_operand(1).simplify();
                        if ((this->get_operand(0).get_expr_type() == polyfp::e_val) && (this->get_operand(1).get_expr_type() == polyfp::e_val))
                            if ((this->get_operand(0).get_data_type() == polyfp::p_int32))
                                return expr(this->get_operand(0).get_int_val() * this->get_operand(1).get_int_val());
                    case polyfp::o_div:
                        return *this;
                    case polyfp::o_mod:
                        return *this;
                    case polyfp::o_select:
                        return *this;
                    case polyfp::o_cond:
                        return *this;
                    case polyfp::o_lerp:
                        return *this;
                    case polyfp::o_le:
                        return *this;
                    case polyfp::o_lt:
                        return *this;
                    case polyfp::o_ge:
                        return *this;
                    case polyfp::o_gt:
                        return *this;
                    case polyfp::o_logical_not:
                        return *this;
                    case polyfp::o_eq:
                        return *this;
                    case polyfp::o_ne:
                        return *this;
                    case polyfp::o_right_shift:
                        return *this;
                    case polyfp::o_left_shift:
                        return *this;
                    case polyfp::o_floor:
                        return *this;
                    case polyfp::o_sin:
                        return *this;
                    case polyfp::o_cos:
                        return *this;
                    case polyfp::o_tan:
                        return *this;
                    case polyfp::o_atan:
                        return *this;
                    case polyfp::o_acos:
                        return *this;
                    case polyfp::o_asin:
                        return *this;
                    case polyfp::o_sinh:
                        return *this;
                    case polyfp::o_cosh:
                        return *this;
                    case polyfp::o_tanh:
                        return *this;
                    case polyfp::o_asinh:
                        return *this;
                    case polyfp::o_acosh:
                        return *this;
                    case polyfp::o_atanh:
                        return *this;
                    case polyfp::o_abs:
                        return *this;
                    case polyfp::o_sqrt:
                        return *this;
                    case polyfp::o_expo:
                        return *this;
                    case polyfp::o_log:
                        return *this;
                    case polyfp::o_ceil:
                        return *this;
                    case polyfp::o_round:
                        return *this;
                    case polyfp::o_trunc:
                        return *this;
                    case polyfp::o_cast:
                        return *this;
                    case polyfp::o_access:
                        return *this;
                    case polyfp::o_call:
                        return *this;
                    case polyfp::o_address:
                        return *this;
                    case polyfp::o_allocate:
                        return *this;
                    case polyfp::o_free:
                        return *this;
                    default:
                        ERROR("Simplifying an unsupported polyfp expression.", 1);
                    }
                    break;
                }
                case (polyfp::e_val):
                {
                    return *this;
                }
                case (polyfp::e_var):
                {
                    return *this;
                }
                default:
                    ERROR("Expression type not supported.", true);
            }
        }

        return *this;
    }
#include <iostream>

    std::string to_str() const
    {
        std::string str = std::string("");

        if (this->get_expr_type() != e_none)
        {
            // std::cout<<this->get_expr_type();
                switch (this->etype)
                {
                case polyfp::e_op:
                {
                    switch (this->get_op_type())
                    {
                    case polyfp::o_logical_and:
                        str +=  "(";
                        str += this->get_operand(0).to_str();
                        str +=  " && ";
                        str += this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_logical_or:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " || " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_max:
                        str +=  "max(" + this->get_operand(0).to_str();
                        str +=  ", " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_min:
                        str +=  "min(" + this->get_operand(0).to_str();
                        str +=  ", " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_minus:
                        str +=  "(-" + this->get_operand(0).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_add:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " + " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_sub:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " - " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_mul:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " * " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_div:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " / " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_mod:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " % " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_memcpy:
                        str += "memcpy(" + this->get_operand(0).to_str();
                        str += ", " + this->get_operand(1).to_str();
                        str += ")";
                        break;
                    case polyfp::o_select:
                        str +=  "select(" + this->get_operand(0).to_str();
                        str +=  ", " + this->get_operand(1).to_str();
                        str +=  ", " + this->get_operand(2).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_cond:
                        str +=  "if(" + this->get_operand(0).to_str();
                        str +=  "):(" + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_lerp:
                        str +=  "lerp(" + this->get_operand(0).to_str();
                        str +=  ", " + this->get_operand(1).to_str();
                        str +=  ", " + this->get_operand(2).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_le:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " <= " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_lt:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " < " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_ge:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " >= " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_gt:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " > " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_logical_not:
                        str +=  "(!" + this->get_operand(0).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_eq:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " = " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_ne:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " != " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_right_shift:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " >> " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_left_shift:
                        str +=  "(" + this->get_operand(0).to_str();
                        str +=  " << " + this->get_operand(1).to_str();
                        str +=  ")";
                        break;
                    case polyfp::o_floor:
                        str +=  "floor(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_sin:
                        str +=  "sin(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_cos:
                        str +=  "cos(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_tan:
                        str +=  "tan(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_atan:
                        str +=  "atan(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_acos:
                        str +=  "acos(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_asin:
                        str +=  "asin(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_sinh:
                        str += "sinh(" + this->get_operand(0).to_str();
                        str += ") ";
                        break;
                    case polyfp::o_cosh:
                        str += "cosh(" + this->get_operand(0).to_str();
                        str += ") ";
                        break;
                    case polyfp::o_tanh:
                        str += "tanh(" + this->get_operand(0).to_str();
                        str += ") ";
                        break;
                    case polyfp::o_asinh:
                        str += "asinh(" + this->get_operand(0).to_str();
                        str += ") ";
                        break;
                    case polyfp::o_acosh:
                        str += "acosh(" + this->get_operand(0).to_str();
                        str += ") ";
                        break;
                    case polyfp::o_atanh:
                        str += "atanh(" + this->get_operand(0).to_str();
                        str += ") ";
                        break;
                    case polyfp::o_abs:
                        str +=  "abs(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_sqrt:
                        str +=  "sqrt(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_expo:
                        str +=  "exp(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_log:
                        str +=  "log(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_ceil:
                        str +=  "ceil(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_round:
                        str +=  "round(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_trunc:
                        str +=  "trunc(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_cast:
                        str +=  "cast(" + this->get_operand(0).to_str();
                        str +=  ") ";
                        break;
                    case polyfp::o_access:
                    case polyfp::o_address_of:
                    case polyfp::o_lin_index:
                    case polyfp::o_placeholder:
                        str +=  this->get_name() + "(";
                        for (int k = 0; k < this->get_access().size(); k++)
                        {
                            if (k != 0)
                            {
                                str +=  ", ";
                            }
                            str += this->get_access()[k].to_str();
                        }
                        str +=  ")";
                        break;
                    case polyfp::o_call:
                        str +=  this->get_name() + "(";
                        for (int k = 0; k < this->get_arguments().size(); k++)
                        {
                            if (k != 0)
                            {
                                str +=  ", ";
                            }
                            str += this->get_arguments()[k].to_str();
                        }
                        str +=  ")";
                        break;
                    case polyfp::o_address:
                        str +=  "&" + this->get_operand(0).get_name();
                        break;
                    case polyfp::o_allocate:
                        str +=  "allocate(" + this->get_name() + ")";
                        break;
                    case polyfp::o_free:
                        str +=  "free(" + this->get_name() + ")";
                        break;
                    default:
                        ERROR("Dumping an unsupported polyfp expression.", 1);
                    }
                    break;
                }
                case (polyfp::e_val):
                {
                    if (this->get_data_type() == polyfp::p_uint8)
                    {
                        str +=  std::to_string((int)this->get_uint8_value());
                    }
                    else if (this->get_data_type() == polyfp::p_int8)
                    {
                        str +=  std::to_string((int)this->get_int8_value());
                    }
                    else if (this->get_data_type() == polyfp::p_uint16)
                    {
                        str +=  std::to_string(this->get_uint16_value());
                    }
                    else if (this->get_data_type() == polyfp::p_int16)
                    {
                        str +=  std::to_string(this->get_int16_value());
                    }
                    else if (this->get_data_type() == polyfp::p_uint32)
                    {
                        str +=  std::to_string(this->get_uint32_value());
                    }
                    else if (this->get_data_type() == polyfp::p_int32)
                    {
                        str +=  std::to_string(this->get_int32_value());
                    }
                    else if (this->get_data_type() == polyfp::p_uint64)
                    {
                        str +=  std::to_string(this->get_uint64_value());
                    }
                    else if (this->get_data_type() == polyfp::p_int64)
                    {
                        str +=  std::to_string(this->get_int64_value());
                    }
                    else if (this->get_data_type() == polyfp::p_float32)
                    {
                        str +=  std::to_string(this->get_float32_value());
                    }
                    else if (this->get_data_type() == polyfp::p_float64)
                    {
                        str +=  std::to_string(this->get_float64_value());
                    }
                    break;
                }
                case (polyfp::e_var):
                {
                    str += this->get_name();
                    break;
                }

                default:
                    ERROR("Expression type not supported.", true);
                }
            }

          return str;
        }

    /**
      * Returns a new expression where for every (var, sub) pair in \p substitutions,
      * var in the original expression is replaced by sub.
      * For example: if \p substitutions is {(i, 5), (j, i)}, and the original expression is
      * i + j * 2, then this method returns 5 + i * 2.
      */
    expr substitute(std::vector<std::pair<var, expr>> substitutions) const;

    /**
      * Returns an expression where every access to a computation named
      * \p original is replaced with an access to a computation named
      * \p substitute, with the same access indices.
      * An example where this is useful is when modifying a computation
      * that was designed to work with a host placeholder to work with a GPU
      * placeholder.
      */
    expr substitute_access(std::string original, std::string substitute) const;

    // todo
    // expr apply_to_operands(std::function<expr(const expr &)> f) const
    // {
    //     polyfp::expr e{*this};
    //     for (int i = 0; i < access_vector.size(); i++)
    //         e.access_vector[i] = f(e.access_vector[i]);
    //     for (int i = 0; i < op.size(); i++)
    //         e.op[i] = f(e.op[i]);
    //     for (int i = 0; i < argument_vector.size(); i++)
    //         e.argument_vector[i] = f(e.argument_vector[i]);

    //     return e;
    // }

    /** Create a variable that can be used that a dimension is unbounded.
      * i < polyfp::expr::unbounded()
      * means that i does not have an upper bound.
      * i > polyfp::expr::unbounded()
      * means that i does not have a lower bound.
      */
    static expr unbounded()
    {
        polyfp::expr e;
        e.name = "_unbounded";
        e.etype = polyfp::e_val;
        e._operator = polyfp::o_none;
        e.defined = true;
        e.dtype = polyfp::p_none;
        return e;
    }
};


/**
  * A class that represents constant variable references
  */
class var: public polyfp::expr
{
    friend compute;
private:
    // TODO if more than one scope, variables are to be declared per scope
    /**
      * If a variable gets declared and saved, (either through calling a public constructor,
      * or through calling a private constructor with save set to true), then a mapping from
      * the name of the variable to the variable object is added.
      * The point of this is to make sure that all variables with the same name have the same
      * type, and thus are equal.
      */
    static std::unordered_map<std::string, var> declared_vars;

    /**
      * This has the same as the var(name), except that if \p save is false, then whatever
      * variable is created, it is not stored in declared_vars, and therefore calling this
      * constructor has no effect on the creation of future var objects.
      */
    // var(std::string name);

    /**
      * This has the same as the var(type, name), except that if \p save is false, then whatever
      * variable is created, it is not stored in declared_vars, and therefore calling this
      * constructor has no effect on the creation of future var objects.
      */
    // var(std::string name, polyfp::primitive_t type);

    /**
      * lower loop bound when the variable is used as an iterator.
      * 
      */
    
    // var(std::string name);
    expr lower;


    /**
      * upper loop bound when the variable is used as an iterator.
      */
    expr upper;

    // std::string name;
    // int flag;

public:

    /**
      * Return the upper bound of this variable.
      */
    expr get_upper()
    {
	    return upper;
    }

    /**
      * Return the lower bound of this variable.
      */
    expr get_lower()
    {
	    return lower;
    }

    // int get_flag()
    // {
	//     return flag;
    // }

    /**
     * Construct an expression that represents an untyped variable.
     * For example to declare the variable "t", use
     * polyfp::var("t");
     * If a variable with the same name has previously been declared, this
     * object will have the same type (i.e. it will be equal to the other variable object).
     *
     */
    var(std::string name);
    /**
      * Construct an expression that represents a variable.
      *
      * \p type is the type of the variable and \p name is its name.
      * If a variable with the same name has previously been declared,
      * but with a different type, this constructor will fail.
      * That way two variables with the same name are necessarily equal.
      */
    var(std::string name, polyfp::primitive_t type);

    

    /**
     * Construct a loop iterator that has \p name as a name.
     *
     * \p lower and \p upper are expressions that represent the lower and upper
     * bounds of this iterator.  For example, the iterator i in the following
     * for loop
     *
     * \code
     *     for (i = 0; i < 10; i++)
     * \endcode
     *
     * can be declared as
     *
     * \code
     * var i("i", expr(0), expr(10));
     * \endcode
     *
     */
    // void range(int lb, int ub){
    //     lower = expr((int32_t) lb);
    //     upper = expr((int32_t) ub);
    // }
    var(std::string name, int lower_bound, int upper_bound) : var(name)
    {
        lower = expr((int32_t) lower_bound);
        upper = expr((int32_t) upper_bound);
        // flag = 0;

    }
    var(std::string name, expr lower_bound, expr upper_bound) : var(name)
    {
        lower = lower_bound;
        upper = upper_bound;
        // flag = 0;
    }
     var(std::string name, int lower_bound, expr upper_bound) : var(name)
    {
        lower = expr((int32_t) lower_bound);
        upper = upper_bound;
        // flag = 0;

    }

    /* Construct an expression that represents an untyped variable.
     * The name of the variable is generated automatically.
     * For example to declare a variable, use
     * polyfp::var t;
     */
    var(): var(generate_new_variable_name()) {}

    void show(){
        std::cout << "Saved variable " << this->name << " of type " << str_from_polyfp_type_primitive(this->dtype)<<std::endl;
    }


};


class constant: public polyfp::expr
{
    friend compute;
    friend function;
private:
    expr value;
    float float_value;
    polyfp::primitive_t datatype;
    polyfp::function *func;
    
public:

    // constant(int value, polyfp::primitive_t t = p_int64, polyfp::function *func = global::get_implicit_function()){
    //     this->value = expr((int64_t) value);
    //     this->name = std::to_string(value);
    //     this->etype = polyfp::e_var;
    //     this->dtype = t;
    //     this->func = func;
    // };
    constant(float value = 0, polyfp::primitive_t t = p_float32, polyfp::function *fct = global::get_implicit_function());
        // this->value = expr((float) value);
        // this->name = std::to_string(value);
        // this->etype = polyfp::e_var;
        // this->dtype = t;
        // global::get_implicit_function().add_invariant(*this);
    // constant(float value = 0, polyfp::primitive_t t = p_float32, polyfp::function *fct = global::get_implicit_function());
    // };
    /**
      * Return the type of the elements of the placeholder.
      */
    polyfp::primitive_t get_type() const;


    
};



/**
  * Convert a polyfp expression into a Halide expression. todo
  */
// Halide::Expr halide_expr_from_polyfp_expr(
//     const polyfp::computation *comp,
//     std::vector<isl_ast_expr *> &index_expr,
//     const polyfp::expr &polyfp_expr);


/**
  * Takes in a primitive value \p val, and returns an expression
  * of polyfp type \p tT that represents \p val.
  */
template <typename cT>
expr value_cast(primitive_t tT, cT val) {

//    static_assert(std::is_fundamental<cT>::value, "Type must be fundamental");

    switch (tT) {

        case p_int8:
            return expr{static_cast<int8_t>(val)};
        case p_uint8:
            return expr{static_cast<uint8_t>(val)};
        case p_int16:
            return expr{static_cast<int16_t>(val)};
        case p_uint16:
            return expr{static_cast<uint16_t>(val)};
        case p_int32:
            return expr{static_cast<int32_t>(val)};
        case p_uint32:
            return expr{static_cast<uint32_t>(val)};
        case p_int64:
            return expr{static_cast<int64_t>(val)};
        case p_uint64:
            return expr{static_cast<uint64_t>(val)};
        case p_float32:
            return expr{static_cast<float>(val)};
        case p_float64:
            return expr{static_cast<double>(val)};
        default:
            throw std::invalid_argument{"Type not supported"};
    }
}





/**
  * Returns an expression that casts \p e to \p tT.
  */
expr cast(primitive_t tT, const expr & e);


template <typename T>
only_integral<T> operator+(const polyfp::expr &e, T val)
{
    return e + value_cast(e.get_data_type(), val);
}

template <typename T>
only_integral<T> operator+(T val, const polyfp::expr &e)
{
    return value_cast(e.get_data_type(), val) + e;
}

template <typename T>
only_integral<T> operator-(const polyfp::expr &e, T val)
{
    return e - value_cast(e.get_data_type(), val);
}

template <typename T>
only_integral<T> operator-(T val, const polyfp::expr &e)
{
    return value_cast(e.get_data_type(), val) - e;
}

template <typename T>
only_integral<T> operator/(const polyfp::expr &e, T val)
{
    return e / expr{val};
}

template <typename T>
only_integral<T> operator/(T val, const polyfp::expr &e)
{
    return expr{val} / e;
}

template <typename T>
only_integral<T> operator*(const polyfp::expr &e, T val)
{
    return e * value_cast(e.get_data_type(), val);
}

template <typename T>
only_integral<T> operator*(T val, const polyfp::expr &e)
{
    return value_cast(e.get_data_type(), val) * e;
}

template <typename T>
only_integral<T> operator%(const polyfp::expr &e, T val)
{
    return e % expr{val};
}

template <typename T>
only_integral<T> operator%(T val, const polyfp::expr &e)
{
    return expr{val} % e;
}

template <typename T>
only_integral<T> operator>>(const polyfp::expr &e, T val)
{
    return e >> expr{val};
}

template <typename T>
only_integral<T> operator>>(T val, const polyfp::expr &e)
{
    return expr{val} >> e;
}

template <typename T>
only_integral<T> operator<<(const polyfp::expr &e, T val)
{
    return e << expr{val};
}

template <typename T>
only_integral<T> operator<<(T val, const polyfp::expr &e)
{
    return expr{val} << e;
}
// todo
// expr memcpy(const placeholder& from, const placeholder& to);
// expr allocate(const placeholder& b);


}


#endif
