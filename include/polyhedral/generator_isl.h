#ifndef _H_polyfp_function1_
#define _H_polyfp_function1_

#include "debug.h"
#include "expr.h"
#include "type.h"
#include "compute.h"
// #include "function.h"
#include "placeholder.h"
namespace polyfp{
class fucntion;
class generator
{
    friend function;
    friend compute;
    // friend placeholder;


protected:

    /*
     * Compute the iterators map.
     * The iterators map is map between the original names of the iterators of a computation
     * and their transformed form after schedule (also after renaming).
     *
     * If in the original computation, we had
     *
     * {C[i0, i1]: ...}
     *
     * And if in the generated code, the iterators are called c0, c1, c2 and c3 and
     * the loops are tiled, then the map will be
     *
     * {<i0, c0*10+c2>, <i1, c1*10+c3>}.
     *
     **/
    // static std::map<std::string, isl_ast_expr *>
    //     compute_iterators_map(polyfp::compute *comp, isl_ast_build *build);

   /**
     * Get the computation associated with a node.
     */
    // static std::vector<polyfp::compute *>
    //     get_computation_by_node(polyfp::function *fct, isl_ast_node *node);

    /**
     * Traverse the vector of computations \p comp_vec and return the computations
     * that have a domain that intersects with \p domain.
     */
    // static std::vector<polyfp::compute *> filter_computations_by_domain(std::vector<polyfp::compute *> comp_vec,
    //         isl_union_set *node_domain);

    /**
     * Compute the accesses of the RHS of the computation
     * \p comp and store them in the accesses vector.
     *
     * If \p return_buffer_accesses is set to true, this function returns access functions to
     * buffers. Otherwise it returns access functions to computations.
     */
    static void get_rhs_accesses(const polyfp::function *func, const polyfp::compute *comp,
                          std::vector<isl_map *> &accesses, bool return_buffer_accesses);

    /**
     * Analyze the \p access_expression and return a set of constraints
     * that correspond to the access pattern of the access_expression.
     *
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
    static isl_constraint *get_constraint_for_access(int access_dimension,
                                                     const polyfp::expr &access_expression,
                                                     isl_map *access_relation,
                                                     isl_constraint *cst,
                                                     int coeff,
                                                     const polyfp::function *fct);

    /**
     * Extract tags from the ISL ast node at given level. This is a helper
     * function meant to be used from halide_stmt_from_isl_node. Traverses
     * the ISL ast tree and fills the tagged_stmts vector.
     */
    // static void extract_tags_from_isl_node(const polyfp::function &fct, isl_ast_node *node, int level,
    //                                        std::vector<std::pair<std::string, std::string>> &tagged_stmts);

    /**
      * Generate a Halide statement from an ISL ast node object in the ISL ast
      * tree.
      * Level represents the level of the node in the schedule. 0 means root.
      * It taks as input:
      *     - a function \p fct for which we are generating code,
      *     - a \p node,
      *     - \p level represents the current loop level being traversed (0 means the outer level.
      *     - \p is_a_child_block indicates whether the block that is ging to be
      *     generated is a child block for an other block. In such a case, allocate
      *     and let statements should not be generate. Allocate and let statements
      *     should only be generated in non-child blocks so that their scope reaches
      *     the whole block.
      */
    // static Halide::Internal::Stmt halide_stmt_from_isl_node(const polyfp::function &fct, isl_ast_node *node,
    //                                                         int level,
    //                                                         std::vector<std::pair<std::string, std::string>> &tagged_stmts,
    //                                                         bool is_a_child_block);

    // // TODO doc
    // static Halide::Internal::Stmt make_halide_block(const Halide::Internal::Stmt &first,
    //         const Halide::Internal::Stmt &second);

    // static Halide::Internal::Stmt make_buffer_alloc(buffer *b, const std::vector<Halide::Expr> &extents,
    //                                                 Halide::Internal::Stmt &stmt);
    // static Halide::Internal::Stmt make_buffer_free(buffer *b);

    // /**
    //  * Create a Halide expression from a  Tiramisu expression.
    //  */
    // static Halide::Expr halide_expr_from_polyfp_expr(const polyfp::function *fct,
    //         std::vector<isl_ast_expr *> &index_expr,
    //         const polyfp::expr &polyfp_expr, polyfp::computation *comp = nullptr);

    // static polyfp::expr replace_accesses(const polyfp::function * func, std::vector<isl_ast_expr *> &index_expr,
    //                                        const polyfp::expr &polyfp_expr);
    // static std::string get_buffer_name(const polyfp::compute *);
    // static polyfp::expr comp_to_buffer(polyfp::compute * comp, std::vector<isl_ast_expr *> &ie,
    //                                                 const polyfp::expr * expr = nullptr);

    /**
     * Linearize a multidimensional access to a Halide buffer.
     * Supposing that we have buf[N1][N2][N3], transform buf[i][j][k]
     * into buf[k + j*N3 + i*N3*N2].
     * Note that the first arg in index_expr is the buffer name.  The other args
     * are the indices for each dimension of the buffer.
     */
    //@{
    // static Halide::Expr linearize_access(int dims, const halide_dimension_t *shape, isl_ast_expr *index_expr);
    // static Halide::Expr linearize_access(int dims, const halide_dimension_t *shape, std::vector<polyfp::expr> index_expr);
    // static Halide::Expr linearize_access(int dims, std::vector<Halide::Expr> &strides, std::vector<polyfp::expr> index_expr);
    // static Halide::Expr linearize_access(int dims, std::vector<Halide::Expr> &strides, isl_ast_expr *index_expr);
    // static polyfp::expr linearize_access(int dims, std::vector<polyfp::expr> &strides, std::vector<polyfp::expr> index_expr);
    // static polyfp::expr linearize_access(int dims, std::vector<polyfp::expr> &strides, isl_ast_expr *index_expr);
    //@}

    /**
     * Retrieve the access function of the ISL AST leaf node (which represents a
     * computation). Store the access in computation->access.
     */
    // static isl_ast_node *stmt_code_generator(isl_ast_node *node, isl_ast_build *build, void *user);

    /**
     * Traverse a polyfp expression (\p exp) and extract the access relations
     * from the access operation passed in \p exp.  The access relations are added
     * to the vector \p accesses.
     * The access relation is from the domain of the computation \p comp to the
     * domain of the computation accessed by the access operation.
     * If \p return_buffer_accesses = true, an access to a buffer is created
     * instead of an access to computations.
     */
    static void traverse_expr_and_extract_accesses(const polyfp::function *fct,
                                            const polyfp::compute *comp,
                                            const polyfp::expr &exp,
                                            std::vector<isl_map *> &accesses,
                                            bool return_buffer_accesses);

    /**
     * Traverse a polyfp expression (\p current_exp) until an expression with the specified name is found.
     * Replace that name with a new name. Replaces all occurrences.
     */
    // static void _update_producer_expr_name(polyfp::expr &current_exp, std::string name_to_replace,
    //                                        std::string replace_with);

public:

    /**
     * Traverse a polyfp expression (\p current_exp) until an expression with the specified name is found.
     * Replace that name with a new name. Replaces all occurrences.
     */
    // static void update_producer_expr_name(polyfp::compute *comp, std::string name_to_replace,
    //                                       std::string replace_with);
};

/**
 * A class containing utility functions.
 */
class utility
{
public:
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
     static expr extract_bound_expression(isl_ast_node *ast, int dim, bool upper);

    /**
     * Return a polyfp::expr representing the bound of
     * the dimension \p dim in \p set.  If \p upper is true
     * then this function returns the upper bound otherwise
     * it returns the lower bound.
     *
     * For example, assuming that
     *
     * S = {S[i,j]: 0<=i<N and 0<=j<N and i<M}
     *
     * then
     *
     * get_upper_bound(S, 1)
     *
     * would return N-1, while
     *
     * get_upper_bound(S, 0)
     *
     * would return min(N-1,M-1)
     */
    static polyfp::expr get_bound(isl_set *set, int dim, int upper);

    /**
     * Return the extent of the loop.
     *
     * For example:
     *
     * [N]->{C[i,j]: 0 <= i < N and N = 10}
     *
     * then get_extent(C,0) would return 10.
     *
     */
    // static int get_extent(isl_set *set, int dim);

    /**
     * Create a comma separated string that represents the list
     * of the parameters of \p set.
     *
     * For example, if the set is
     *
     * [N,M,K]->{S[i]}
     *
     * this function returns the string "N,M,K".
     */
    static std::string get_parameters_list(isl_set *set);
};


}

#endif