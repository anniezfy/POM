#ifndef _H_polyfp_function_
#define _H_polyfp_function_

#include <isl/set.h>
#include <isl/map.h>
#include <isl/union_map.h>
#include <isl/union_set.h>
#include <isl/ast_build.h>
#include <isl/schedule.h>
#include <isl/schedule_node.h>
#include <isl/space.h>
#include <isl/constraint.h>

#include <map>
#include <string.h>
#include <stdint.h>
#include <unordered_map>
#include <unordered_set>
#include <sstream>
#include <queue>

#include "scalehls/Transforms/Passes.h"
#include "scalehls/Transforms/Utils.h"
#include "scalehls/Transforms/Estimator.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/ToolOutputFile.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineValueMap.h"
#include "mlir/Support/FileUtilities.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Support/MemoryBuffer.h"

#include "llvm/ADT/SmallPtrSet.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/IntegerSet.h"
#include "mlir/IR/BuiltinOps.h"

#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "mlir/IR/Attributes.h"
#include "mlir/IR/Builders.h"

#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/Verifier.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/LLVMIR/LLVMTypes.h"
#include "mlir/Dialect/Math/IR/Math.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Target/LLVMIR/Import.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/OpDefinition.h"


// #include "mlir/Pass/PassManager.h"
// #include "mlir/Target/LLVMIR/Export.h"
// #include "mlir/Transforms/Passes.h"

// #include <Halide.h>
#include "debug.h"
#include "expr.h"
#include "type.h"
#include "codegen.h"
#include "generator_isl.h"
#include "placeholder.h"
// #include "generator.h"






namespace polyfp{


class constant;
class compute;
class generator;
class placeholder;

isl_ast_node *for_code_generator_after_for(isl_ast_node *node, isl_ast_build *build, void *user);
void gen_mlir(polyfp::function *fct, isl_ast_node *node, int level);


class function{

// Friend classes.  They can access the private members of the "function" class.
    friend constant;
    friend compute;
    friend generator;
    friend placeholder;

    


private:
    /**
      * The name of the function.
      * function names should not start with _ (an underscore).
      * Names starting with _ are reserved names.
      */
    std::string name;

    /**
      * function arguments. These are the buffers or scalars that are
      * passed to the function.
      */
    // std::vector<polyfp::buffer *> function_arguments;

    /**
      * A vector representing the invariants of the function (symbolic
      * constants or variables that are invariant to the function i.e.
      * do not change their value during the execution of the function).
      */
    std::vector<polyfp::constant> invariants;

    std::map<std::string, polyfp::constant *> constant_list;


    /**
      * Function arguments. These are the buffers or scalars that are
      * passed to the function.
      */
    std::vector<polyfp::placeholder *> function_arguments;



    /**
      * A map representing the buffers of the function. Some of these
      * buffers are passed to the function as arguments and some are
      * declared and allocated within the function itself.
      */
    std::map<std::string, polyfp::placeholder *> placeholders_list;

    std::map<std::string, polyfp::placeholder *> fct_argument_list;

    std::map<std::string, polyfp::placeholder *> global_argument_list;
    // global
    

    // std::map<std::string, polyfp::placeholder *> global_argument_list;

    bool fct_argument_added = false;



    /**
      * A vector representing the dimensions that should be unrolled
      * around the computations of the function.
      * Unrolled dimensions are identified using the tuple
      * <computation_name, level0, factor>, for example the tuple
      * <S0, 1, 8> indicates that the loops with level 1
      * around the computation S0 should be unrolled with an unrolling
      * factor of 8.
      */
    std::vector<std::tuple<std::string, int, int>> unroll_dimensions;


    std::vector<std::tuple<std::string, std::vector<int>, std::vector<std::string>>> partition_map;

    /**
      * A vector representing the parallel dimensions around
      * the computations of the function.
      * A parallel dimension is identified using the pair
      * <computation_name, level>, for example the pair
      * <S0, 0> indicates that the loop with level 0
      * (i.e. the outermost loop) around the computation S0
      * should be parallelized.
      */
    std::vector<std::pair<std::string, int>> parallel_dimensions;

    /**
      * An ISL context associate with the function.
      */
    isl_ctx *ctx;

    /**
      * An ISL AST representation of the function.
      * The ISL AST is generated by calling gen_isl_ast().
      */
    isl_ast_node *ast;

    /**
      * Body of the function (a vector of computations).
      * The order of the computations in the vector does not have any
      * effect on the actual order of execution of the computations.
      * The order of execution of computations is specified through the
      * schedule.
      */
    std::vector<compute *> body;

    /**
      * A Halide statement that represents the whole function.
      * This value stored in halide_stmt is generated by the code generator
      * and is empty before calling the code generator.
      */
    // todo
    // Halide::Internal::Stmt halide_stmt;

    /**
     * The context set of the function, i.e. a set representing the
     * constraints over the parameters.
     * The parameters of a function are the function invariants (constants).
     */
    isl_set *context_set;



    /**
     * The names of the iterators.
     */
    std::vector<std::string> iterator_names;

    /**
      * Get the trimmed time-processor domain of the function.
      * The first dimension of the time-processor domain is used
      * to indicate duplicates of the computation.  Computations that
      * do not have any duplicate have 0 in that dimension, whereas
      * computations that have duplicates (i.e., are recomputed) have
      * a number in that dimension to represent each duplicate.
      * The trimmed time-processor domain is the time-processor domain
      * without the dimension that represents the duplicates. We simply
      * take the time-processor domain and remove the first dimension
      * used to represent the duplicates.
      */
    isl_union_set *get_trimmed_time_processor_domain() const;

    /**
      * This function iterates over the computations of the function.
      * It modifies the identity schedule of each computation in order to
      * make all the identity schedules have the same number of dimensions
      * in their ranges.
      * This is done by adding dimensions equal to 0 to the range of each
      * identity schedule that does not have enough dimensions.
      */
    isl_union_map *get_aligned_identity_schedules() const;

        /**
      * This function first computes the identity schedules,
      * then it computes the maximal dimension among the dimensions
      * of the ranges of all the identity schedules.
      */
    int get_max_identity_schedules_range_dim() const;


    /**
     * A pass to rename computations.
     * Computation that are defined multiple times need to be renamed, because
     * those computations in general have different expressions and the code
     * generator expects that computations that have the same name always have
     * the same expression and access relation. So we should rename them to avoid
     * any ambiguity for the code generator.
     *
     */
    void rename_computations();
    



   /**
      * Recursive function to perform the DFS step of dump_sched_graph.
      */
    void dump_sched_graph_dfs(polyfp::compute *,
                              std::unordered_set<polyfp::compute *> &);

    /**
      * Recursive function to perform the DFS step of is_sched_graph_tree.
      */
    bool is_sched_graph_tree_dfs(polyfp::compute *,
                                 std::unordered_set<polyfp::compute *> &);

protected:
    /**
      * Add a computation to the function.  The order in which
      * computations are added to the function is not important.
      * The order of execution is specified using the schedule.
      * This doesn't allow computations with duplicate names.
      */


    /**
      * The set of all computations that have no computation scheduled before them.
      * Does not include allocation computations created using
      * allocate_and_map_buffer_automatically().
      */


    isl_ast_node *best_ast;

    void dfs(int pos, int top, int end, int map[500][500], int n, int v[500],int stack[550]);
    polyfp::compute * update_latency();
    int get_longest_path();
    int get_longest_node(std::vector<long> path);
    void add_computation(compute *cpt);
    // polyfp::compute * evaluate_func();

        /**
     * Add an invariant to the function.
     */
    void add_invariant(std::pair<std::string, polyfp::constant *>  param);
        /**
      * Add a buffer to the function.
      * The buffers of the function are either:
      * - buffers passed to the function as arguments, or
      * - buffers that are declared and allocated within the function
      * itself.
      * The first element of the pair is the name of the buffer (it is
      * used as a key), the second element of the pair is a pointer
      * to the buffer.
      */
    void add_placeholder(std::pair<std::string, polyfp::placeholder *> buf);




    /**
      * Get the iterator names of the function.
      */
    const std::vector<std::string> &get_iterator_names() const;

    /**
      * Add an iterator to the function.
      */
    void add_iterator_name(const std::string &it_name);

    /**
      * Keeps track of allocation computations created using
      * allocate_and_map_buffer_automatically() to schedule them during gen_ordering_schedules.
      */
     std::vector<polyfp::compute *> automatically_allocated;

    /**
      * Return a vector of the computations of the function.
      * The order of the computations in the vector does not have any
      * effect on the actual order of execution of the computations.
      * The order of execution of computations is specified through the
      * schedule.
      */
    const std::vector<compute *> &get_computations() const;

        /**
      * Return a set that represents the parameters of the function
      * (an ISL set that represents the parameters and constraints over
      * the parameters of the functions,  a parameter is an invariant
      * of the function). This set is also known as the context of
      * the program.
      * An example of a context set is the following:
      *          "[N,M]->{: M>0 and N>0}"
      * This context set indicates that the two parameters N and M
      * are strictly positive.
      */
    isl_set *get_program_context() const;

    /**
      * Return the computation of the function that has
      * the name \p str.
      */
    std::vector<compute *> get_computation_by_name(std::string str) const;

        /**
      * Return the isl_ctx associated with this function.
      * This is an ISL specific object required when calling certain
      * ISL functions.  It does not represent the set of parameters
      * of the function (which should be retrieved by calling
      * get_program_context()).
      */
    isl_ctx *get_isl_ctx() const;

        /**
      * Return the union of all the schedules
      * of the computations of the function.
      */
    isl_union_map *get_schedule() const;

    /**
      * Return the Halide statement that represents the whole
      * function.
      * The Halide statement is generated by the code generator.
      * This function should not be called before calling the code
      * generator.
      */
    // todo
    // Halide::Internal::Stmt get_halide_stmt() const;





    /**
      * Return the union of all the iteration domains
      * of the computations of the function.
      */
    isl_union_set *get_iteration_domain() const;



    /**
      * Get the name of the function.
      */
    // const std::string &get_name() const;



    /**
     * Return true if the usage of high level scheduling comments is valid; i.e. if
     * the scheduling relations formed using before, after, compute_at, etc.. form a tree.
     *
     * More specifically, it verifies that:
     *     - There should be exactly one computation with no computation scheduled before it.
     *     - Each other computation should have exactly one computation scheduled before it.
     */
    bool is_sched_graph_tree();

    /**
     * Modify the schedules of the computations of this function to reflect
     * the order specified using the high level scheduling commands.
     *
     * Commands like .after() and .before() do not directly modify the schedules
     * but rather modify the sched_graph graph.
     */
    void gen_ordering_schedules();



    /**
     * This functions iterates over the schedules of the function (the schedule
     * of each computation in the function) and computes the maximal dimension
     * among the dimensions of the ranges of all the schedules.
     */
    int get_max_schedules_range_dim() const;

    /**
      * Stores all high level scheduling instructions between computations; i.e. if a user calls
      * for example c2.after(c1, L), sched_graph[&c1] would contain the key &c2, and
      * sched_graph[&c1][&c2] = L.
      * At the end of scheduling, the graph should respect the following rules:
      *     - There should be exactly one computation with no computation scheduled before it.
      *     - Each other computation should have exactly one computation scheduled before it.
      * In other words, the graph should be a valid tree.
      * Does not include allocation computations created using
      * allocate_and_map_buffer_automatically().
      */
    std::unordered_map<polyfp::compute *,std::unordered_map<polyfp::compute *, int>> sched_graph;

    /**
      * Same as sched_graph, except in reverse order (from after to before).
      */
    // std::unordered_map<polyfp::compute *,
    // std::unordered_map<polyfp::compute *, int>> sched_graph_reversed;

    std::unordered_map<polyfp::compute *,
    std::unordered_map<polyfp::compute *, int>> sched_graph_reversed;

    /**
      * Return an ISL AST that represents this function.
      * This function itself does not generate the ISL AST, it just
      * returns it if it already exists.
      * The function gen_isl_ast() should be called before calling
      * this function.
      */
    isl_ast_node *get_isl_ast() const;
  

    /**
      * Generate a Halide stmt that represents the function.
      */
    void gen_mlir_stmt();

    /**
     * \brief Returns a ptr to the first computation in the sched_graph.
     * \details The computation that has no predecessor.
     */
    compute* get_first_cpt();

    /**
     * \brief Returns a ptr to the last computation in the sched_graph.
     * \details The computation that has no succesor.
     */
    compute* get_last_cpt();
public:

    bool is_dataflowed = false;
    void evaluate_func();
    std::unordered_set<polyfp::compute *> starting_computations;
    std::vector<polyfp::compute *> leader_computations;
    std::vector<polyfp::compute *> leaf_computations;
    std::map<polyfp::compute *,int> leader_computation_index;
    std::map<int,long> latency_map;
    std::map<int,long> all_latency_map;
    std::map<int,int> resource_map;
    std::map<int,std::vector<int>> path_map;
    std::vector<std::vector<long>> paths;
    std::vector<std::string> finish_list;
    bool consistent_flag = true;
    bool refused = false;


    void add_fct_argument(std::pair<std::string, polyfp::placeholder *> buf);

    void add_fct_argument();

    void add_global_argument(std::pair<std::string, polyfp::placeholder *> buf);

    void check_loop_fusion();

    int get_global_location(){
        return global_location;
    }

    void set_global_location(int new_location){
        this->global_location = new_location;
    }

    void dump_schedule(std::string path);

    long longest_path;
    long longest_node;
    long dsp_max;
    long dsp_usage;
    long best_dsp_usage = dsp_max;
    long best_latency;
    long current_latency;
    bool new_strategy = true;
    polyfp::compute * current_opt_comp;


    int global_location;
    bool one_compute;

    /**
     * \brief Construct a function called \p name.
     * \details Function names should not start with _ (an underscore).
     * Names starting with _ are reserved names.
     */
    function(std::string name);
    // function(std::string name)
    // {
    // // printf("ssss");
    //     this->name = name;
    //     this->ast = NULL;
    //     this->context_set = NULL;

    //     this->ctx = isl_ctx_alloc();
    // }

    /**
      * \brief Align the schedules of all the computations of this
      * function.
      *
      * This method applies to the schedule of each computation
      * in the function.  It makes the dimensions of the ranges of
      * all the schedules equal.  This is done by adding dimensions
      * equal to 0 to the range of each schedule.
      * This function is called automatically when gen_isl_ast()
      * or gen_time_processor_domain() are called.
      */
    void align_schedules();
    const std::vector<compute *> &get_body() const;

        /**
      * Return a map that represents the buffers of the function.
      * The buffers of the function are buffers that are either passed
      * to the function as arguments or are buffers that are declared
      * and allocated within the function itself.
      * The names of the buffers are used as a key for the map.
      */
    const std::map<std::string, polyfp::placeholder *> &get_placeholders() const;
    const std::map<std::string, polyfp::placeholder *> &get_fct_arguments() const;
    const std::map<std::string, polyfp::placeholder *> &get_global_arguments() const;
        /**
      * Return a vector representing the invariants of the function
      * (symbolic constants or variables that are invariant to the
      * function i.e. do not change their value during the execution
      * of the function).
      *
      * get_invariant_names() returns the names of the variants.
      */
    //@{
    const std::map<std::string, polyfp::constant *> &get_invariants() const;
    const std::vector<std::string> get_invariant_names() const;

    std::vector<std::tuple<std::string, std::vector<int>, std::vector<std::string>>> get_partition_map();

    void set_partition(std::string name, std::vector<int> tile_factors, std::vector<std::string> types);
    
    /**
      * \brief Dumps the graph of scheduling relations set by the higher level scheduling
      * functions (e.g. after, before, compute_at...).
      * \details This is mainly useful for debugging.
      * This function can be called at any point during scheduling.
      */
    void dump_sched_graph();
//////////////////////////////////////
    isl_ast_node *get_isl_ast1() const;

    /**
      * \brief Generate an object file that contains the compiled function.
      * \details This function relies on Halide to generate the object file.
      *
      * \p obj_file_name indicates the name of the generated file.
      *
      * \p os indicates the target operating system (Halide::Target::OS).
      *
      * \p arch indicates the architecture of the target (the instruction set).
      *
      * \p bits indicate the bit-width of the target machine.
      *    must be 0 for unknown, or 32 or 64.
      * \p hw_architecture indicate the hardware architecture, it has to be one
      *    of arch_flexnlp, arch_cpu, arch_nvidia_gpu.
      * For a full list of supported values for \p os and \p arch please
      * check the documentation of Halide::Target
      * (http://halide-lang.org/docs/struct_halide_1_1_target.html).
      * If the machine parameters are not supplied, Halide detects
      * the parameters of the host machine automatically.

      */
    // void gen_halide_obj(const std::string &obj_file_name, Halide::Target::OS os,
    //                     Halide::Target::Arch arch, int bits,
    //                     const polyfp::hardware_architecture_t hw_architecture) const;

    // /**
    //   * \overload
    //   */
    // void gen_halide_obj(const std::string &obj_file_name, Halide::Target::OS os,
    //                     Halide::Target::Arch arch, int bits) const;

    // /**
    //   * \overload
    //   */
    // void gen_halide_obj(const std::string &obj_file_name) const;

    // /**
    //   * \overload
    //   */
    // void gen_halide_obj(const std::string &obj_file_name, const polyfp::hardware_architecture_t hw_architecture) const;

    // /**
    //   * Generate a Halide stmt that represents the function.
    //   */
    // void gen_halide_stmt();

    /**
      * Generate an isl AST that represents the function.
      */

         /**
      * Compute the graph of dependences between the computations of
      * the function.
      *
      * Example
      *
      * C[0] = 0
      * D[1] = C[0]
      * D[2] = C[0]
      * {C[0] -> D[1]; C[0]->D[2]}
      */
    isl_union_map *compute_dep_graph();
    void gen_isl_ast();

        /**
     * Get live in/out computations in the function.
     */
    // @{
    std::vector<polyfp::compute *> get_live_in_computations();
    std::vector<polyfp::compute *> get_live_out_computations();
    /**
      * Set the arguments of the function.
      * The arguments of the function are provided as a vector of
      * pointers to buffers. Each buffer represents an argument
      * to the function.
      * During code generation, the arguments in the vector will become
      * the arguments of the generated function (with the order of their
      * appearance in the vector).
      */
    void set_arguments(const std::vector<polyfp::placeholder *> &buffer_vec);
    /**
      * Generate the time-space domain of the function.
      *
      * In this representation, the logical time of execution and the
      * processor where the computation will be executed are both
      * specified.
      */
    void gen_time_space_domain();

    void gen_loop_location();
    std::string get_name();

    void allocate_and_map_buffers_automatically();


    
    /**
     * Wrapper for all the functions required to run code generation of a
     * polyfp program.
     */
    
    void collect_accesses();
    std::map<int, std::map<std::string, std::vector<polyfp::expr> > > map_loadstores;

   



    void codegen();
    void auto_DSE_loop_transformation();
    void auto_DSE(std::string path);
    void auto_DSE_tile_size(polyfp::compute* comp, int factor,std::string path);
    void dependence_analysis();
    void compute_dependency_graph();

    /**
      * \brief Dump the function on standard output (dump most of the fields of
      * polyfp::function).
      * \details This is mainly useful for debugging.
      * If \p exhaustive is set to true, all the fields of the function
      * class are printed.
      */
    void dump(bool exhaustive) const;
    void gen_c_code() const;

    void trans();


};

}

#endif