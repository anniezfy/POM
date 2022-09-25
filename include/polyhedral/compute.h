#ifndef _H_polyfp_COMPUTE_
#define _H_polyfp_COMPUTE_

#include <isl/ctx.h>
#include <isl/aff.h>
#include <isl/set.h>
#include <isl/map.h>
#include <isl/id.h>
#include <isl/constraint.h>
#include <isl/union_map.h>
#include <isl/union_set.h>
#include <isl/ast_build.h>
#include <isl/set.h>
#include <isl/map.h>
#include <isl/union_map.h>
#include <isl/union_set.h>
#include <isl/ast_build.h>
#include <isl/schedule.h>
#include <isl/schedule_node.h>
#include <isl/space.h>
#include <isl/constraint.h>
#include <unordered_map>
#include<algorithm>

#include <map>
// #include <string.h>
// #include <stdint.h>
// #include <unordered_map>
// #include <unordered_set>
// #include <sstream>

// #include <Halide.h>
// #include "debug.h"
#include "expr.h"
#include "placeholder.h"

// #include "type.h"
// #include "codegen.h"

namespace polyfp{
std::string generate_new_computation_name();
class var;
class scheduler;
class function;
class placeholder;
class compute
{
  friend function;
  friend placeholder;
  // friend generator;
private:

    /**
      * Access function.  A map indicating how each computation should be stored
      * in memory.  It indicates in which buffer the computation should be stored
      * and which element of the buffer exactly it should be stored.
      */
    isl_map *access;

    /**
      * An ISL context associate with the function.
      */
    isl_ctx *ctx;

        /**
     * The buffer attached "automatically" to this computation.
     * If the buffer is not created automatically, this variable will be empty.
     */
    polyfp::placeholder *plhd;
    polyfp::expr plhd_expr;

    /**
      * Data type: the type of the value returned by the computation.
      */
    polyfp::primitive_t data_type;

    /**
      * An expression representing the computation
      * ("what" should be computed).
      */
    polyfp::expr expression;


    /**
      * The scheduler of this computation.
    */
    polyfp::function *fct;


    /**
     * A map between the original names of the iterators of a computation
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
     */
    std::map<std::string, isl_ast_expr *> iterators_map;


    std::map<std::string, std::string > access_map;



    

    /**
      * Iteration domain of the computation.
      * In this representation, the order of execution of computations
      * is not specified, the computations are also not mapped to memory.
     */
    isl_set *iteration_domain;

    /**
      * The name of this computation.
      * Computation names should not start with _ (an underscore).
      * Names starting with _ are reserved names.
      */
    std::string name;

    /* The number of dimensions in the original definition of the computation. */
    int number_of_dims;

    /**
     * A predicate around the computation. The computation is executed
     * only if this predicate is true. This is useful to insert a non-affine
     * condition around the computation.
     */
    polyfp::expr predicate;

    /**
      * The schedules of the computation.
      */
    isl_map * schedule;

    /**
      * Time-processor domain of the computation.
      * In this representation, the logical time of execution and the
      * processor where the computation will be executed are both
      * specified.
      */
    isl_set *time_processor_domain;

    /**
      * This variable contains the computation's iteration variables
      */
    std::vector<polyfp::var> iteration_variables;

    std::vector<polyfp::expr> placeholder_dims;
    std::vector<polyfp::expr > placeholder_accessmap;

    /**
     * 
      * Returns the iteration_variables vector containing each of the
      * computation's iteration variables
      */
    std::vector<polyfp::var> get_iteration_variables();

     /**
      * Take a list of iterators and a name as input and construct the iteration
      * domain that iterates over those iterators.  The name of the statement
      * of the iteration domain is \p name.
      * The iteration domain is a string in ISL format.
      * \p predicate is an expression that represents constraints on the iteration domain
      * (for example (i != j). The predicate has to be an affine
      * expression.
      */
    std::string construct_iteration_domain(std::string name, std::vector<var> iterator_variables, polyfp::expr predicate);

    /**
      * Create a copy of this computation.
      */
    polyfp::compute *copy();



    /**
      * Return the access function of the computation after transforming
      * it to the time-processor domain.
      * The domain of the access function is transformed to the
      * time-processor domain using the schedule, and then the transformed
      * access function is returned.
      */
    isl_map *get_access_relation_adapted_to_time_processor_domain() const;

    /**
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
     */
    std::map<std::string, isl_ast_expr *> get_iterators_map();

    /**
      * Return the names of iteration domain dimensions.
      */
    std::vector<std::string> get_iteration_domain_dimension_names();




    /**
      * Check that the \p dimensions are valid:
      * - The dimension numbers are within the bounds of accepted dimensions
      * (i.e., between computation::root_dimension and the maximal dimension
      * number in the time-space domain.
      */
    void check_dimensions_validity(std::vector<int> dimensions);

    /**
      * Get the number of dimensions of the iteration
      * domain of the computation.
      */
    int get_iteration_domain_dimensions_number();






    /**
      * Check that the names used in \p dimensions are not already
      * in use.
      */
    void assert_names_not_assigned(std::vector<std::string> dimensions);



    /**
      * Generate an identity schedule for the computation.
      *
      * This identity schedule is an identity relation created from the iteration
      * domain.
      */
    isl_map *gen_identity_schedule_for_iteration_domain();

        /**
      * Generate an identity schedule for the computation.
      *
      * This identity schedule is an identity relation created from the
      * time-processor domain.
      */
    isl_map *gen_identity_schedule_for_time_space_domain();

    /**
      * Assign a name to iteration domain dimensions that do not have a name.
      */
    void name_unnamed_iteration_domain_dimensions();

        /**
      * Assign a name to iteration domain dimensions that do not have a name.
      */
    void name_unnamed_time_space_dimensions();


    /**
      * Set an identity schedule for the computation.
      *
      * This identity schedule is an identity relation created from the iteration
      * domain.
      *
      * This sets the schedule of the original computation
      * and does not set the schedule of any duplicate
      * computation.
      */
    void set_identity_schedule_based_on_iteration_domain();

    /**
      * Set the iteration domain of the computation
      */
    void set_iteration_domain(isl_set *domain);

    /**
      * Set the names of loop levels dimensions.
      * The loop levels are specified using \p loop_levels
      * and their names are specified using \p names.
      * Users can only set the names of loop levels (dynamic dimensions),
      * the static dimension names are set to default names.
      */
    void set_loop_level_names(std::vector<int> loop_levels, std::vector<std::string> names);

    /**
      * Set the names of loop level dimensions.
      * The loop level names are specified using \p names.
      * Users can only set the names of loop levels (dynamic dimensions),
      * the static dimension names are set to default names.
      */
    void set_loop_level_names(std::vector<std::string> names);

    /**
      * Set the names of the dimensions of the schedule domain.
      * The dimension names are specified using \p names, their positions
      * are indicated using \p loop_levels.
      */
    void set_schedule_domain_dim_names(std::vector<int> loop_levels, std::vector<std::string> names);

        /**
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
     */
    void set_iterators_map(std::map<std::string, isl_ast_expr *> map);

    /**
      * Simplify \p set using the context and by calling
      * set coalescing.
      */
        /**
      * Return the function where the computation is declared.
      */
    polyfp::function *get_function() const;


    /**
      * Search the time-space domain (the range of the schedule) and
      * return the loop level numbers that correspond to the dimensions
      * named \p dim.
      * In other words, translate the vector of dimension names (\p dim_names)
      * into loop level numbers. We need to do this because the internal Tiramisu
      * scheduling functions use dimension numbers instead of dimension
      * names (which are used in the user level scheduling functions).
      */
    std::vector<int> get_loop_level_numbers_from_dimension_names(std::vector<std::string> dim_names);

    // @{
    isl_set *simplify(isl_set *set);
    isl_map *simplify(isl_map *map);

        /**
      * A vector describing the access variables in the original definition of  a computation.
      * For every named dimension, a pair representing the index of the named dimension
      * and the name of the dimension is added to access_variables.
      * E.g. if a computation is defined as S[i, 0, j], access_variables will contain
      * {(0, "i"), (2, "j")}.
      */
    std::vector<std::pair<int, std::string>> access_variables;


    /**
      * Intersect \p set with the context of the computation.
      */
    // @{
    isl_set *intersect_set_with_context(isl_set *set);

    /**
      * Return the time-processor domain of the computation.
      * In this representation, the logical time of execution and the
      * processor where the computation will be executed are both
      * specified.
      */
    isl_set *get_time_processor_domain() const;

        /**
      * Return the trimmed time-processor domain.
      * The first dimension of the time-processor domain is used
      * to indicate redundancy of the computation.  Computations that
      * are not redundant have 0 in that dimension, whereas
      * computations that are redundant (i.e., are recomputed) have
      * a number different from 0 in that dimension and which represents
      * the ID of the redundant computation.
      * The trimmed time-processor domain is the time-processor domain
      * without the dimension that represents the redundancy.  We simply
      * take the time-processor domain and remove the first dimension.
      */
    isl_set *get_trimmed_time_processor_domain();

    /**
      * Contains a list of all definitions added to this computation. The 0th definition is
      * always this very computation.
      */
    
    std::vector<polyfp::compute *> updates;

    /**
     * Rename this computation and modify the schedule and the access relation
     * accordingly.
     *
     * Computation that are defined multiple times need to be renamed, because
     * those computations in general have different expressions and the code
     * generator expects that computations that have the same name always have
     * the same expression and access relation. So we should rename them to avoid
     * any ambiguity for the code generator.
     */
    void rename_computation(std::string new_name);

    /**
      * Update loop level names. This function should be called after each scheduling operation
      * because scheduling usually changes the original loop level names.
      * This function erases \p nb_loop_levels_to_erase loop level names starting from the
      * loop level \p start_erasing. It then inserts the loop level names \p new_names in
      * \p start_erasing. In other words, it replaces the names of loop levels from
      * \p start_erasing to \p start_erasing + \p nb_loop_levels_to_erase with the loop levels
      * indicated by \p new_names.  This function sets the non erased loop levels to be equal to the
      * original loop level names.
      *
      * \p original_loop_level_names : a vector containing the original loop level names (loop level
      * names before scheduling).
      *
      * \p new_names : the new loop level names.
      *
      * \p start_erasing : start erasing loop levels from this loop level.
      *
      * \p nb_loop_levels_to_erase : number of loop levels to erase.
      *
      * Example. Assuming the original loop levels are {i0, i1, i2, i3}
      *
      * Calling this->update_names({i0, i1, i2, i3}, {x0, x1}, 1, 2) updates the loop levels to become
      * {i0, x0, x1, i3}.
      */
    void update_names(std::vector<std::string> original_loop_level_names, std::vector<std::string> new_names,
                      int start_erasing, int nb_loop_levels_to_erase);

protected:




    /**
      * Dummy constructor for derived classes.
      */


        /**
      * Return the context of the computations.
      */
    isl_ctx *get_ctx() const;

    /**
     * Return the predicate around this computation if a predicate
     * was added using add_predicate().
     */
    polyfp::expr get_predicate();

    /**
      * Return a unique name of computation; made of the following pattern:
      * [computation name]@[computation address in memory]
      */
    const std::string get_unique_name() const;

    /**
      * Set the name of the computation.
      */
    void set_name(const std::string &n);

    /**
      * Initialize a computation.
      * This is a private function that should not be called explicitly
      * by users.
      */
    void init_computation(std::string iteration_space_str,
                          polyfp::function *fct,
                          const polyfp::expr &e,
                          // bool schedule_this_computation,
                          polyfp::primitive_t t, expr p);



    
    void set_schedule(isl_map *map);
    void set_schedule(std::string map_str);

        /**
      * An isl_ast_expr representing the index of the array where the computation
      * will be stored.  This index is computed after the scheduling is done.
      */
    std::vector<isl_ast_expr *> index_expr;

 



    /**
      * \overload
      */
    compute(std::string name,std::vector<var> iterator_variables, polyfp::expr e, primitive_t t, expr p);


public:
    compute();
    compute(std::string iteration_domain, polyfp::expr e,
                polyfp::primitive_t t,
                polyfp::function *fct, expr p);

    
    int II;
    bool is_unrolled;
    long latency;
    int dsp;
    int minII;

    isl_map * original_schedule;
    std::map<std::string, std::string > tile_map;
    std::map<std::string, int > tile_size_map;
    std::map<std::string, std::string > directive_map;
    std::map<std::string, std::string > directive_tool_map;
    std::vector<std::string> original_loop_level_name;
    std::vector<std::string> final_loop_level_names;
    std::vector<int> unroll_factor;
    std::vector<polyfp::expr> unroll_dimension;


    isl_map * best_schedule;
    std::map<std::string, std::string > best_tile_map;
    std::map<std::string, int > best_tile_size_map;
    std::map<std::string, std::string > best_directive_map;
    std::map<std::string, std::string > best_directive_tool_map;
    std::vector<std::string> best_loop_level_names;
    std::vector<int> best_unroll_factor;
    std::vector<polyfp::expr> best_unroll_dimension;

    std::map<std::string, int>iterators_location_map;
    int after_level;


    /**
      * \brief Constructor for computations.
      * \code
      * var i("i", 0, 20), j("j", 0, 30);
      * \endcode
      *
      * and we have the following computation declaration
      *
      * \code
      * computation S("S", {i,j}, 4);
      * \endcode
      *
      * This is equivalent to writing the following C code
      *
      * \code
      * for (i=0; i<20; i++)
      *   for (j=0; j<30; j++)
      *      S(i,j) = 4;
      * \endcode


      */
    compute(std::string name, std::vector<var> iterator_variables, polyfp::expr e, expr p);
    compute(std::string name, std::vector<var> iterator_variables, int a, expr p);
    isl_map *get_access_relation() const;


    bool is_tiled = false ;

        /**
      * Trim the union of schedules of the computation and
      * return the result.
      * The trimmed union of schedules is the schedule without the
      * duplicate dimension (the dimension used to indicate the
      * duplicate ID).
      */
    isl_map *get_trimmed_union_of_schedules() const;

        /**
      * Return the names of loop levels.
      * (i.e., the names of dynamic dimensions in time-space).
      */
    std::vector<std::string> get_loop_level_names();




        /**
      * Search the time-space domain (the range of the schedule) and
      * return the loop level number that correspond to the dimension
      * named \p dim.
      * In other words, translate the vector of dimension name (\p dim_name)
      * into a loop level number.
      */
    int get_loop_level_number_from_dimension_name(std::string dim_name)
    {
        return this->get_loop_level_numbers_from_dimension_names({dim_name})[0];
    }


    /**
      * Dump the iteration domain of the computation.  This is useful for
      * debugging.
      */
    void dump_iteration_domain() const;

    /**
      * Dump the schedule of the computation.  This is mainly useful for
      * debugging.
      *
      * The schedule is a relation between the iteration space and the
      * time space.  The relation provides a logical date of execution for
      * each point in the iteration space.
      * The schedule needs first to be set before calling this function.
      */
    void dump_schedule() const;

    /**
      * Dump the computation on stdout.  This is mainly useful for
      * debugging.
      */
    void dump() const;


    /**
      * Generate the time-space domain of the computation.
      *
      * In this representation, the logical time of execution and the
      * processor where the computation will be executed are both
      * specified.  The memory location where computations will be
      * stored in memory is not specified at the level.
      */
    void gen_time_space_domain();

    /**
      * Get the data type of the computation.
      */
    primitive_t get_data_type() const;

    /**
      * Return the polyfp expression associated with the computation.
      */
    const polyfp::expr &get_expr() const;

    std::vector<polyfp::expr> get_placeholder_dims();

        /**
      * Get the number of loop levels.
      */
    int get_loop_levels_number();

    /**
     * Return the iteration domain of the computation.
     * In this representation, the order of execution of computations
     * is not specified, the computations are also not mapped to memory.
     */
    isl_set *get_iteration_domain() const;

        /*
     * \brief Allocate a buffer for the computation automatically.  The size of the buffer
     * is deduced automatically and a name is assigned to it automatically.
     *
     * \details Assuming the name of the computation is C, the name of the generated buffer
     * is _C_buffer.
     *
     * \p type is the type of the argument. Three possible types exist:
     *  - a_input: for inputs of the function,
     *  - a_output: for outputs of the function,
     *  - a_temporary: for buffers used as temporary buffers within
     *  the function (any temporary buffer is allocated automatically by
     *  the Tiramisu runtime at the entry of the function and is
     *  deallocated at the exit of the function).
     */
    void allocate_and_map_buffer_automatically(polyfp::argument_t type = polyfp::a_temporary);

        /**
      * Compute the size of the buffer allocated automatically to hold the
      * results of this computation.
      */

    std::vector<polyfp::expr> compute_buffer_size();
    std::map<std::string, std::string > get_access_map();
    std::map<std::string, std::string > get_tile_map();
    std::map<std::string, int > get_tile_size_map();
    std::map<std::string, std::string > get_directive_map();
    std::map<std::string, std::string > get_directive_tool_map();
    void update_leader_components(polyfp::compute *comp);
    void delete_leader_components(polyfp::compute *comp);
    //TODO



    // DSE components
    std::map<polyfp::compute *, int> components;
    std::map<int, polyfp::compute *> component_level_map;
    polyfp::compute *leader;

    std::unordered_map<int, polyfp::compute *> childern;
    std::vector<polyfp::compute * > parents;

    bool is_leader;
    bool has_a_leader;
    bool is_top_parent;
    bool is_leaf;

    void dump_components();
    void dump_loads_stores();

    /**
       * \brief Store this computation in \p buff
       *
       * \details
       *
       * Let us assume that we have a computation C:
       *
       * \code
       * {C[i]: 0<=i<N}
       * \endcode
       *
       * and that we want to store each C(i) in bufC[i]. Then we
       * can use store_in() to indicate that as follows:
       *
       * \code
       * C.store_in(&bufC)
       * \endcode
       *
       * This means that each computation C(i) will be stored
       * in the buffer location bufC[i].
       *
       * If \p iterators is specified, the \p iterators are used to specify how the
       * computation is mapped to the buffer.
       * If the dimensions of this computation are in0, in1, ..., inn and if
       * \p iterators are equal to im0, im1, ..., imm then the computation is
       * mapped as follows
       *
       * \code
       * C[in0, in1, ..., inn]->bufC[im0, im1, ..., imm].
       * \endcode
       *
       * i.e., the computation C[in0, in1, ..., inn] is stored in bufC[im0,
       * im1, ..., imm].
       *
       * This can be used to store the data in many ways (reordering the
       * storage, storing into modulo buffers, ...).
       *
       * Assuming we have have computation D(i,j) that has the following
       * iteration domain:
       *
       * \code
       * {D[i,j]: 0<=i<N and 0<=j<N}
       * \endcode
       *
       * and assuming we have a buffer bufD.
       *
       * The store_in() function can be used to implement many types of data mappings:
       *    - Store the computation D to a scalar: D.store_in(&bufD, {}).
       *      This mans that D(i) will be stored in bufD[0] (which represents a
       *      scalar).
       *    - Store a 2 dimensional computation into a 1-dimensional
       *    buffer: D.store_in(&bufD, {i});
       *    - Change the order of storage.
       *    D.store_in(&bufD, {j, i}) will store D(i,j) in bufD(j,i).
       *    - Store the computation in a circular buffer (modulo storage).
       *    D.store_in(&bufD, {i%4, j%4});
       *    This will store D(i,j) in bufD[i%4, j%4].  Assuming the buffer
       *    bufD is a 4x4 buffer.
       */
     // @{
     void store_in(placeholder *buff);
     void store_in(placeholder *buff, std::vector<expr> iterators);
     // }@

         /**
      * \brief Resize the implicit buffer and remap the computation.
      *
      * \details By default Tiramisu computations are stored in implicit
      * buffers with one to one mapping. If user wants to store the data in a
      * different layout (i.e. for reductions), this function should be used to
      * change the size of the implicit buffer and mapping.
      *
      * For example a simple reduction operation would look like this:
      *
      * \code
      * computation C({i, j}, p_float);
      * C.set_expression(C(i, 0) + B(i, j));
      * C.store_in({i}, {N});
      * \endcode
      *
      * Note that this function creates a completely new implicit buffer, thus
      * the old implicit buffer should not be referenced before this operation.
      */
    // @{
    void store_in(std::vector<expr> mapping, std::vector<expr> sizes);

    /**
      * Get the last update of a computation.
      */
    compute &get_last_update();

    /**
      * Return the name of the computation.
      */
    const std::string &get_name() const;

        /**
     * Get the schedule of the computation.
     */
    isl_map *get_schedule() const;
            /**
      * Return the access function of the computation.
      */
    
    
    /**
       * Set the expression of the computation.
       */
    void set_expression(const polyfp::expr &e);

    void set_access(std::string access_str);
    void set_access(isl_map *access);



        /**
      * Return the buffer that was allocated automatically using
      * high level data mapping functions.
      * If no automatic buffer was allocated, this function returns NULL.
      */
    placeholder *get_placeholder();
    expr get_placeholder_expr();
    // /**
    //    * \brief Add a let statement that is associated to this computation.
    //    * \details The let statement will be executed before the computation
    //    * (more precisely, between this computation and any computation that
    //    * preceeds it). The variable defined by the let statement can be
    //    * accessible by this computation alone. i.e., it cannot be used
    //    * in any other computation.
    //    */
    // void add_associated_let_stmt(std::string access_name, polyfp::expr e);



    /**
      * Interchange (swap) the two loop levels \p L0 and \p L1.
      */
    virtual void interchange(var L0, var L1);

    /**
      * Identical to
      *     void interchange(var L0, var L1);
      */
    virtual void interchange(int L0, int L1);


     /**
      * Split the loop level \p L0 of the iteration space into two
      * new loop levels.
      *
      * \p sizeX is the extent (size) of the inner loop created after
      * splitting.
      */
    //@{
    virtual void split(var L0, int sizeX);
    virtual void split(var L0, int sizeX,
                       var L0_outer, var L0_inner);
    //@}

    /**
      * Identical to
      *     void split(var L0, int sizeX);
      */
    virtual void split(int L0, int sizeX);




    /**
      * Tile the two loop levels \p L0 and \p L1 with rectangular
      * tiling. \p sizeX and \p sizeY represent the tile size.
      * \p L0 and \p L1 should be two consecutive loop levels.
      * \p L0_outer, \p L1_outer, \p L0_inner, \p L1_inner
      * are the names of the new dimensions created after tiling.
      */
    // @{
    virtual void tile(var L0, var L1, int sizeX, int sizeY);
    virtual void tile(var L0, var L1, int sizeX, int sizeY,
                      var L0_outer, var L1_outer, var L0_inner, var L1_inner);
    virtual void tile(var L0, var L1, var L2, int sizeX, int sizeY, int sizeZ);
    virtual void tile(var L0, var L1, var L2, int sizeX, int sizeY, int sizeZ,
                      var L0_outer, var L1_outer, var L2_outer, var L0_inner,
                      var L1_inner, var L2_inner);
    // @}

    /**
      * Tile the two loop levels \p L0 and \p L1 with rectangular
      * tiling. \p sizeX and \p sizeY represent the tile size.
      * \p L0 and \p L1 should be two consecutive loop levels
      * (i.e., \p L0 = \p L1 + 1) and they should satisfy
      * \p L0 > \p L1.
      */
    // @{
    virtual void tile(int L0, int L1, int sizeX, int sizeY);
    virtual void tile(int L0, int L1, int L2, int sizeX, int sizeY, int sizeZ);
    // @}

    virtual void skew(var i, var j, int a , int b, var ni, var nj);

    virtual void skew(int i, int j, int a, int b); 

    void after(compute &comp, polyfp::var iterator);
    void after(compute &comp, int level);

    void after(compute *comp, polyfp::var iterator);
    void after(compute *comp, int level);


/**
      * Schedule this computation to run after the computation \p comp.
      * The computations are placed after each other in the loop level \p level.
      * The outermost loop level is 0.  The root level is computation::root_dimension.
      *
      * For example assuming we have the two computations
      *
      *     {S0[i,j]: 0<=i<N and 0<=j<N} and {S1[i,j]: 0<=i<N and 0<=j<N}
      *
      * In order to make S1 run after S0 in the i loop, one should use
      *
      *     S1.after_low_level(S0,0)
      *
      * which means: S1 is after S0 at the loop level 0 (which is i).
      *
      * The corresponding code is
      *
      * \code
      *     for (i=0; i<N; i++)
      *     {
      *         for (j=0; j<N; j++)
      *             S0;
      *         for (j=0; j<N; j++)
      *             S1;
      *     }
      * \endcode
      *
      * S1.after_low_level(S0,1)
      *
      * means: S1 is after S0 at the loop level 1 (which is j) and would yield
      * the following code
      *
      * \code
      * for (i=0; i<N; i++)
      *   for (j=0; j<N; j++)
      *   {
      *     S0;
      *     S1;
      *   }
      * \endcode
      *
      * S1.after_low_level(S0, computation::root_dimension)
      * means S1 is after S0 at the main program level and would yield
      * the following code
      *
      * \code
      * for (i=0; i<N; i++)
      *   for (j=0; j<N; j++)
      *     S0;
      * for (i=0; i<N; i++)
      *   for (j=0; j<N; j++)
      *     S1;
      * \endcode
      *
      * To specify that this computation is after \p comp in multiple levels,
      * the user can provide those levels in the \p levels vector.
      *
      * S1.after_low_level(S0, {0,1})
      *
      * means that S1 is after S0 in the loop level 0 and in the loop level 1.
      *
      * Note that
      *
      * S1.after_low_level(S0, L)
      *
      * would mean that S1 and S0 share the same loop nests for all the loop
      * levels that are before L and that S1 is after S0 in L only.  S1 is not
      * after S0 in the loop levels that are before L.
      *
      */
    // @{
    void after_low_level(compute &comp, int level);
    void after_low_level(compute &comp, std::vector<int> levels);

    void pipeline(polyfp::expr dim, int II);
    void unroll(polyfp::expr dim, int factor);

    std::map<int, std::map<std::string, std::vector<polyfp::expr> > > map_loadstores;
    std::vector<polyfp::expr> get_loads();
    void get_loads_stores();
    void get_all_loadstores();
    void auto_loop_transofrmation();
    void compute_dependence_vectors();
    std::unordered_map<std::string, polyfp::expr *> load_map;
    std::unordered_map<std::string, polyfp::expr *> store_map;
    std::vector<polyfp::expr *> load_vector;
    std::vector<polyfp::expr *> store_vector;
    std::map<polyfp::expr *, std::vector<std::vector<int> > >  map_dependence_vectors;
    // std::map<polyfp::expr, std::vector<std::vector<int> > >  map_dependence_vectors;


    void dump_all_loadstores();

    void check_loop_interchange();
    void check_loop_skewing();




    /**
      * Equivalent of computation::root but to be used with scheduling
      * functions that take loop level (integers) as input instead of
      * polyfp::var.
    */
    const static int root_dimension = -1;
    
    template<typename... Args> polyfp::expr operator()(Args... args)
    {
        // TODO move to cpp
        std::vector<polyfp::expr> access_expressions{std::forward<Args>(args)...};
        if (access_expressions.size() != this->number_of_dims)
        {
            polyfp::str_dump("Error - Incorrect access: " + this->get_name() + "(");
            for (int i = 0; i < access_expressions.size(); i++)
            {
                polyfp::expr e = access_expressions[i];
                e.dump(false);
                if (i != access_expressions.size() - 1)
                    polyfp::str_dump(", ");
            }
            polyfp::str_dump(").\n");
            polyfp::str_dump("The number of access dimensions does not match that used in the declaration of " + this->get_name() + ".\n\n");
            exit(1);
        }
        // todo
        // if (this->is_inline_computation()) {
        //     std::vector<std::pair<var, expr>> substitutions;
        //     for (auto const &variable: this->access_variables) {
        //         // variable is an (index, variable_name) pair
        //         substitutions.push_back(std::make_pair(var(variable.second, false),
        //                                                access_expressions[variable.first]));
        //     }
        //     // TODO add iteration space for expression
        //     return this->expression.substitute(substitutions);
        // } else {
            return polyfp::expr(polyfp::o_access,
                                  this->get_name(),
                                  access_expressions,
                                  this->get_data_type());
        // }
    }

    operator expr();

};


// class constant
// {
// public:


//     constant(int value, polyfp::primitive_t t = p_int64, polyfp::function *func = global::get_implicit_function());
//     constant(float value, polyfp::primitive_t t = p_float64, polyfp::function *func = global::get_implicit_function());

//     operator expr();
// };





}


#endif