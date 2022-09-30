
#include "function.h"
#include "generator.h"
#include <iostream>
#include <fstream>


// #include "mlir/IR/Attributes.h"
// #include "mlir/IR/Builders.h"
// #include "mlir/IR/BuiltinOps.h"
// #include "mlir/IR/BuiltinTypes.h"
// #include "mlir/IR/MLIRContext.h"
// #include "mlir/IR/Verifier.h"

namespace polyfp{


isl_map *isl_map_align_range_dims(isl_map *map, int max_dim)
{
    DEBUG_FCT_NAME(10);
    DEBUG_INDENT(4);

    assert(map != NULL);
    int mdim = isl_map_dim(map, isl_dim_out);
    assert(max_dim >= mdim);

    DEBUG(10, polyfp::str_dump("Input map:", isl_map_to_str(map)));

    const char *original_range_name = isl_map_get_tuple_name(map, isl_dim_out);

    map = isl_map_add_dims(map, isl_dim_out, max_dim - mdim);

    for (int i = mdim; i < max_dim; i++)
    {
        isl_space *sp = isl_map_get_space(map);
        isl_local_space *lsp = isl_local_space_from_space(sp);
        isl_constraint *cst = isl_constraint_alloc_equality(lsp);
        cst = isl_constraint_set_coefficient_si(cst, isl_dim_out, i, 1);
        map = isl_map_add_constraint(map, cst);
    }

    map = isl_map_set_tuple_name(map, isl_dim_out, original_range_name);

    DEBUG(10, polyfp::str_dump("After alignment, map = ",
                                 isl_map_to_str(map)));

    DEBUG_INDENT(-4);
    return map;
}
function::function(std::string name)
{


    this->name = name;
    this->ast = NULL;
    this->context_set = NULL;
    this->ctx = isl_ctx_alloc();
    this->global_location = 0;
};

isl_ctx *function::get_isl_ctx() const
{
    return ctx;
}


const std::vector<compute *> &function ::get_computations() const
{
    return body;
}

const std::vector<compute *> &function ::get_body() const
{
    return body;
}


// void scheduler::set_iterator_names(const std::vector<std::string> &iteratorNames)
// {
//     iterator_names = iteratorNames;
// }

/**
  * Add an iterator to the scheduler.
  */
void function::add_iterator_name(const std::string &iteratorName)
{
    iterator_names.push_back(iteratorName);
}


void polyfp::function::add_invariant(std::pair <std::string, polyfp::constant *> invar)
{
    this->constant_list.insert(invar);
}
const std::map<std::string, polyfp::constant *> &function::get_invariants() const
{
    return constant_list;
}
void polyfp::function::set_partition(std::string name, std::vector<int> factors, std::vector<std::string> types){
    // std::vector<std::string> types;
    // for (int dim = 0; dim < factors.size(); ++dim) {
    //     types.push_back(type);
    // }
    std::tuple<std::string, std::vector<int>, std::vector<std::string>> dims(name,factors,types);
    this->partition_map.push_back(dims);


}
std::vector<std::tuple<std::string, std::vector<int>, std::vector<std::string>>> polyfp::function::get_partition_map(){
    return this->partition_map;
}


void polyfp::function::add_computation(compute *cpt)
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    assert(cpt != NULL);

    this->body.push_back(cpt);
    // if (cpt->should_schedule_this_computation())
    //     this->starting_computations.insert(cpt);
    this->starting_computations.insert(cpt);
    // this->leader_computations.push_back(cpt);

    DEBUG_INDENT(-4);
}


void polyfp::function::dump(bool s) const
{
    if (s)
    {
        std::cout << "\n\nFunction \"" << this->name << "\"" << std::endl << std::endl;

        if (this->function_arguments.size() > 0)
        {
            std::cout << "Function arguments (polyfp buffers):" << std::endl;
            for (const auto &buf : this->function_arguments)
            {
                // buf->dump(s);WSS
            }
            std::cout << std::endl;
        }
        // todo
        if (this->invariants.size() > 0)
        {
            std::cout << "Function invariants:" << std::endl;
            for (const auto &inv : this->invariants)
            {
                //todo
                // inv.dump();
            }
            std::cout << std::endl;
        }

        if (this->get_program_context() != NULL)
        {
            std::cout << "Function context set: "
                      << isl_set_to_str(this->get_program_context())
                      << std::endl;
        }

        std::cout << "Body " << std::endl;
        for (const auto &cpt : this->body)
        {
            cpt->dump();
        }
        std::cout << std::endl;

        // if (this->halide_stmt.defined())
        // {
        //     std::cout << "Halide stmt " << this->halide_stmt << std::endl;
        // }

        // std::cout << "Buffers" << std::endl;
        for (const auto &buf : this->placeholders_list)
        {
            std::cout << "Buffer name: " << buf.second->get_name() << std::endl;
            buf.second->dump(false);
        }

        std::cout << std::endl << std::endl;
    }
}
///////////////////////////////////////////////////
int polyfp::function::get_max_identity_schedules_range_dim() const
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    int max_dim = 0;
    for (const auto &comp : this->get_computations())
    {
        isl_map *sched = comp->gen_identity_schedule_for_time_space_domain();
        int m = isl_map_dim(sched, isl_dim_out);
        max_dim = std::max(max_dim, m);
    }

    DEBUG_INDENT(-4);

    return max_dim;
}
const std::vector<std::string> &function::get_iterator_names() const
{
    return iterator_names;
}
/**
  * Return the isl ast associated with this function.
  */
isl_ast_node *function::get_isl_ast() const
{
    assert((ast != NULL) && ("You should generate an ISL ast first (gen_isl_ast())."));

    return ast;
}
isl_ast_node *function::get_isl_ast1() const
{
    assert((ast != NULL) && ("You should generate an ISL ast first (gen_isl_ast())."));

    return ast;
}
isl_union_set *polyfp::function::get_iteration_domain() const
{
    isl_union_set *result = NULL;
    isl_space *space = NULL;

    if (!this->body.empty())
    {
        space = isl_set_get_space(this->body[0]->get_iteration_domain());
    }
    else
    {
        return NULL;
    }

    assert(space != NULL);
    result = isl_union_set_empty(space);

    for (const auto &cpt : this->body)
    {
        // if (cpt->should_schedule_this_computation())
        // {
            isl_set *cpt_iter_space = isl_set_copy(cpt->get_iteration_domain());
            result = isl_union_set_union(isl_union_set_from_set(cpt_iter_space), result);
        // }
    }

    return result;
}
isl_union_map *polyfp::function::get_aligned_identity_schedules() const
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    isl_union_map *result;
    isl_space *space;

    if (this->body.empty() == false)
    {
        space = isl_map_get_space(this->body[0]->gen_identity_schedule_for_time_space_domain());
    }
    else
    {
        return NULL;
    }
    assert(space != NULL);
    result = isl_union_map_empty(space);

    int max_dim = this->get_max_identity_schedules_range_dim();

    for (const auto &comp : this->get_computations())
    {
        // if (comp->should_schedule_this_computation())
        // {
            isl_map *sched = comp->gen_identity_schedule_for_time_space_domain();
            DEBUG(3, polyfp::str_dump("Identity schedule for time space domain: ", isl_map_to_str(sched)));
            assert((sched != NULL) && "Identity schedule could not be computed");
            sched = isl_map_align_range_dims(sched, max_dim);
            result = isl_union_map_union(result, isl_union_map_from_map(sched));
        // }
    }

    DEBUG_INDENT(-4);
    DEBUG(3, polyfp::str_dump("End of function"));

    return result;
}
void function::dump_sched_graph_dfs(compute * comp,
                                    std::unordered_set<compute *> &visited)
{
    // Do not visit anything that was already returned
    if (visited.find(comp) != visited.end())
        return;

    visited.insert(comp);

    for (auto &edge: this->sched_graph[comp])
    {
        const std::string level = ((edge.second == compute::root_dimension) ?
                                   "root" :
                                   std::to_string(edge.second));

        DEBUG(3, polyfp::str_dump(comp->get_unique_name() +
                                    "=[" + level + "]=>" +
                                    edge.first->get_unique_name()));

        polyfp::str_dump(comp->get_name() +
                                    "=[" + level + "]=>" +
                                    edge.first->get_name());
        std::cout<<" ";
        

        dump_sched_graph_dfs(edge.first, visited);
    }
}
bool function::is_sched_graph_tree_dfs(compute * comp,
                                       std::unordered_set<compute *> &visited)
{
    // Do not visit anything that was already returned
    if (visited.find(comp) != visited.end())
        return false;

    visited.insert(comp);

    for (auto &edge: this->sched_graph[comp])
    {
        if (!is_sched_graph_tree_dfs(edge.first, visited))
            return false;
    }

    return true;
}
bool function::is_sched_graph_tree()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    if (this->starting_computations.size() != 1)
    {
        DEBUG_INDENT(-4);
        return false;
    }

    // Contains all nodes that have been visited
    std::unordered_set<compute *> visited;

    for (auto &comp: this->starting_computations)
    {
        if (!is_sched_graph_tree_dfs(comp, visited))
        {
            DEBUG_INDENT(-4);
            return false;
        }
    }

    DEBUG_INDENT(-4);
    return true;
}




void function::dump_sched_graph()
{
    DEBUG(3, polyfp::str_dump("Number of schedule graph roots is " +
                                std::to_string(this->starting_computations.size())));
    DEBUG(3, polyfp::str_dump("The roots are:"));

    polyfp::str_dump("Number of schedule graph roots is " +
                                std::to_string(this->starting_computations.size()));
    std::cout<<std::endl;
                                
    polyfp::str_dump("The roots are:");
    std::cout<<std::endl;

    for (auto root: this->starting_computations){
        DEBUG(3, polyfp::str_dump(" * " + root->get_name()));
        polyfp::str_dump(" * " + root->get_name());
        std::cout<<std::endl;
    }
    // Contains all nodes that have been visited
    std::unordered_set<compute *> visited;

    DEBUG(3, polyfp::str_dump("Displaying schedule graph"));
    polyfp::str_dump("Displaying schedule graph");
    std::cout<<std::endl;

    for (auto &comp: this->starting_computations)
    {
        dump_sched_graph_dfs(comp, visited);
    }
    std::cout<<std::endl;
    DEBUG(3, polyfp::str_dump("Finished displaying schedule graph"));
    polyfp::str_dump("Finished displaying schedule graph");
}

void function::gen_ordering_schedules()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);
    
    // this->dump_sched_graph();

    if(this->is_sched_graph_tree())
    {
        DEBUG(3, polyfp::str_dump("this->is_sched_graph_tree(): true."));
        // polyfp::str_dump("this->is_sched_graph_tree(): true.");
        
        std::priority_queue<int> level_to_check;
        std::unordered_map<int, std::deque<compute *>> level_queue;

        auto current_comp = *(this->starting_computations.begin());

        // auto init_sched = automatically_allocated;
        // init_sched.push_back(current_comp);
        // //////////this part is not used ,we don't have  automatically_allocated.
        // for (auto it = init_sched.begin(); it != init_sched.end() && it + 1 != init_sched.end(); it++){
        //     std::cout<<"/////////////////////////////////////"<<std::endl;
        //     std::cout<<*it<<std::endl;
        //     (*(it+1))->after_low_level(**it, compute::root_dimension);
        // }

        bool comps_remain = true;
        while(comps_remain)
        {
            for (auto &edge: this->sched_graph[current_comp])
            {
                if (level_queue[edge.second].size() == 0)
                    level_to_check.push(edge.second);

                level_queue[edge.second].push_back(edge.first);
            }

            comps_remain = level_to_check.size() > 0;
            // If we haven't exhausted all computations
            if (comps_remain)
            {
                int fuse_level = level_to_check.top();
                auto next_comp = level_queue[fuse_level].front();
                level_queue[fuse_level].pop_front();

                // assert(this->get_max_iteration_domains_dim() > fuse_level);

                next_comp->after_low_level((*current_comp), fuse_level);

                current_comp = next_comp;
                if (level_queue[fuse_level].size() == 0)
                    level_to_check.pop();
            }
        }
    }
    else
    {
        DEBUG(3, polyfp::str_dump("this->is_sched_graph_tree(): false."));
        // polyfp::str_dump("this->is_sched_graph_tree(): false.");
    }

    DEBUG_INDENT(-4);
}

int polyfp::function::get_max_schedules_range_dim() const
{
    DEBUG_FCT_NAME(10);
    DEBUG_INDENT(4);

    int max_dim = 0;
    for (const auto &comp : this->get_computations())
    {
        isl_map *sched = comp->get_schedule();
        int m = isl_map_dim(sched, isl_dim_out);
        max_dim = std::max(max_dim, m);
    }

    DEBUG_INDENT(-4);

    return max_dim;
}

isl_set *function::get_program_context() const
{
    if (context_set != NULL)
    {
        return isl_set_copy(context_set);
    }
    else
    {
        return NULL;
    }
}

void polyfp::function::align_schedules()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    int max_dim = this->get_max_schedules_range_dim();

    for (auto &comp : this->get_computations())
    {
        isl_map *dup_sched = comp->get_schedule();
        assert((dup_sched != NULL) && "Schedules should be set before calling align_schedules");
        dup_sched = isl_map_align_range_dims(dup_sched, max_dim);
        comp->set_schedule(dup_sched);
        // polyfp::str_dump("Generated time-space domain:", isl_map_to_str(dup_sched));
        comp->name_unnamed_time_space_dimensions();
    }

    DEBUG_INDENT(-4);
    DEBUG(3, polyfp::str_dump("End of function"));
}
std::string function::get_name(){
    return this->name;
}
void function::gen_time_space_domain()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    // Generate the ordering based on calls to .after() and .before().
    this->gen_ordering_schedules();

    this->align_schedules();

    for (auto &comp : this->get_computations())
    {
        comp->gen_time_space_domain();
    }

    DEBUG_INDENT(-4);
}

void function::gen_loop_location()
{
    auto leader_list = this->leader_computations;
    for (auto &a_leader : leader_list)
    {   std::cout << "leader name: ";
        std::cout << a_leader->get_name() <<'\n';
        if(a_leader->is_leader == true){
            std::cout <<"enter here" <<'\n';
            // auto comp = a_leader;
            std::cout <<a_leader->after_level <<'\n';
            if(a_leader->after_level!= -2){
                std::cout << "get here" <<'\n';
                int level = a_leader->after_level;
                int current_level = level;
                int counter = 0;
                // auto dim_list = a_leader->get_loop_level_names();
                auto dim_list = a_leader->final_loop_level_names;
                for(int i=0; i<dim_list.size(); i++)
                {
                    // auto fct = global::get_implicit_function();
                    // std::cout<<dim_list[counter]<<std::endl;
                    auto next_level = this->global_location;
                    a_leader->iterators_location_map.insert(std::make_pair(dim_list[counter],next_level));
                    this->global_location+=1;
                    counter+=1;
                }
            }else{
                std::cout << a_leader->get_name() <<'\n';
                // std::vector<std::string> nms = a_leader->get_iteration_domain_dimension_names();
                auto nms = a_leader->final_loop_level_names;
                // std::cout <<nms.size()<<'\n';
                for (int i = 0; i< nms.size(); i++){
                    // if(this->get_body().size() == 1){
                        a_leader->iterators_location_map.insert(std::make_pair(nms[i],i));
                        this->global_location = nms.size();
                    // }
                    
                }
            }
            
        }
        std::cout <<a_leader->iterators_location_map.size()<<'\n';
        for(auto &map: a_leader->iterators_location_map){
            std::cout<<map.first<<": "<<map.second<<std::endl;
        }
            
        auto components = a_leader->components;
        // sort components by their value
        std::vector<std::pair<polyfp::compute*, int>> temp;
        for (auto it = components.begin(); it != components.end(); it++)
            temp.push_back(std::make_pair(it->first, it->second));

        std::sort(temp.begin(), temp.end(), [](const std::pair<polyfp::compute*, int> &x, const std::pair<polyfp::compute*, int> &y) -> int {
            return x.second < y.second;
        });
        std::cout <<"components: "<<'\n';
        for (auto it = temp.begin(); it != temp.end(); it++)
        {
            std::cout << it->first->get_name() << ':' << it->second << '\n';
            std::cout <<it->first->after_level <<'\n';
            auto comp = it->first;
            int level = comp->after_level;
            int current_level = level;
            int counter = 0;
            auto dim_list = comp->final_loop_level_names;
            auto leader_dim_map = comp->leader->iterators_location_map;
            if(level!=-1)
            {   
                
                for(int i=0; i<dim_list.size(); i++){
                    if(counter <= current_level){
                        comp->iterators_location_map.insert(std::make_pair(dim_list[counter],leader_dim_map[dim_list[counter]]));
                        // std::cout<<leader_dim_map[dim_list[counter]]<<std::endl;
                    }else{
                        // auto fct = global::get_implicit_function();
                        auto next_level = this->global_location;
                        // std::cout<<next_level<<std::endl;
                        comp->iterators_location_map.insert(std::make_pair(dim_list[counter],next_level));
                        this->global_location += 1;
                    }
                    counter+=1;
                }
            }else{

            }
            std::cout<<"iterator locations:"<<std::endl;
            for(auto &map: comp->iterators_location_map)
                std::cout<<map.first<<map.second<<std::endl;
        }
        
    }

}
/**
 * A pass to rename computations.
 * Computation that are defined multiple times need to be renamed, because
 * those computations in general have different expressions and the code
 * generator expects that computations that have the same name always have
 * the same expression and access relation. So we should rename them to avoid
 * any ambiguity for the code generator.
 *
 */
void polyfp::function::rename_computations()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    // Computations that have been defined multiple times should
    // be renamed. ISL code generator expects computations with the
    // same name to have the same expressions and the same access
    // relation. So, "update" computations that have the same name
    // but have different expressions should be renamed first so
    // that we can use the original code generator without any
    // modification.
    for (auto const comp : this->get_computations())
    {
        std::vector<polyfp::compute *> same_name_computations =
            this->get_computation_by_name(comp->get_name());

        int i = 0;

        if (same_name_computations.size() > 1)
            for (auto c : same_name_computations)
            {
                std::string new_name = "_" + c->get_name() + "_update_" + std::to_string(i);
                c->rename_computation(new_name);
                i++;
            }
    }

    DEBUG(3, polyfp::str_dump("After renaming the computations."));
    DEBUG(3, this->dump(false));

    DEBUG_INDENT(-4);
}
isl_union_map *polyfp::function::get_schedule() const
{
    isl_union_map *result = NULL;
    isl_space *space = NULL;

    if (!this->body.empty())
    {
        space = isl_map_get_space(this->body[0]->get_schedule());
    }
    else
    {
        return NULL;
    }

    assert(space != NULL);
    result = isl_union_map_empty(isl_space_copy(space));

    for (const auto &cpt : this->body)
    {
        isl_map *m = isl_map_copy(cpt->get_schedule());
        result = isl_union_map_union(isl_union_map_from_map(m), result);
    }

    result = isl_union_map_intersect_domain(result, this->get_iteration_domain());

    return result;
}
isl_union_set *polyfp::function::get_trimmed_time_processor_domain() const
{
    DEBUG_FCT_NAME(10);
    DEBUG_INDENT(4);

    isl_union_set *result = NULL;
    isl_space *space = NULL;
    if (!this->body.empty())
    {
        space = isl_set_get_space(this->body[0]->get_trimmed_time_processor_domain());
    }
    else
    {
        DEBUG_INDENT(-4);
        return NULL;
    }
    assert(space != NULL);

    result = isl_union_set_empty(space);

    for (const auto &cpt : this->body)
    {
        // if (cpt->should_schedule_this_computation())
        // {
        isl_set *cpt_iter_space = isl_set_copy(cpt->get_trimmed_time_processor_domain());
        result = isl_union_set_union(isl_union_set_from_set(cpt_iter_space), result);
        // }
    }

    DEBUG_INDENT(-4);

    return result;
}

const std::map<std::string, polyfp::placeholder *> &function::get_placeholders() const
{
    return placeholders_list;
}
/**
  * Add a buffer to the function.
  */
void function::add_placeholder(std::pair <std::string, polyfp::placeholder *> buf)
{
    assert(!buf.first.empty() && ("Empty buffer name."));
    assert((buf.second != NULL) && ("Empty buffer."));

    this->placeholders_list.insert(buf);
}

void polyfp::function::allocate_and_map_buffers_automatically()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    DEBUG(10, polyfp::str_dump("Computing live-out computations."));
    // Compute live-in and live-out buffers
    std::vector<polyfp::compute *> liveout = this->get_live_out_computations();
    DEBUG(10, polyfp::str_dump("Allocating/Mapping buffers for live-out computations."));
    
    // for (auto &comp: liveout){
       
    //     if (comp->get_automatically_allocated_buffer() == NULL){
    //             // polyfp::str_dump("go here?");

    //         comp->allocate_and_map_buffer_automatically(a_output);
    //     }else{
    //         // polyfp::str_dump("already?");
    //         // comp->allocate_and_map_buffer_automatically(a_output);
    //         // comp->get_automatically_allocated_buffer()->get_argument_type();

    //     }
    // }
    DEBUG(10, polyfp::str_dump("Computing live-in computations."));
    // Compute live-in and live-out buffers
    std::vector<polyfp::compute *> livein =
            this->get_live_in_computations();
    DEBUG(10, polyfp::str_dump("Allocating/Mapping buffers for live-in computations."));


    // Allocate each live-in computation that is not also live-out (we check that
    // by checking that it was not allocated yet)
    for (auto &comp: livein){
        polyfp::str_dump("go livein?"+comp->get_name());
        // if (comp->get_automatically_allocated_buffer() == NULL){
        //     // polyfp::str_dump("or go here?");
        //     comp->allocate_and_map_buffer_automatically(a_input);
        // }
    }
    for (int b = 0; b < this->body.size(); b++)
    {
        // DEBUG(3, polyfp::str_dump("Inline " + this->body[b]->get_name() + " " + std::to_string(this->body[b]->is_inline_computation())));
        // if (this->body[b]->is_inline_computation()) {
        //     DEBUG(3, polyfp::str_dump("Skipping inline computation " + this->body[b]->get_name()));
        //     continue;
        // }
        DEBUG(10, polyfp::str_dump("Allocating/Mapping buffers for " + this->body[b]->get_name()));
        
        if ((this->body[b]->get_expr().get_expr_type() == polyfp::e_op))
        {
            if (this->body[b]->get_expr().get_op_type() != polyfp::o_allocate)
            {
                // if (this->body[b]->get_automatically_allocated_buffer() == NULL)
                //     // polyfp::str_dump("go here?");
                //     this->body[b]->allocate_and_map_buffer_automatically(a_temporary);
            }
        }
        else
        {
            // if (this->body[b]->get_automatically_allocated_buffer() == NULL) {
            //     // polyfp::str_dump("or go here?");
            //     this->body[b]->allocate_and_map_buffer_automatically(a_temporary);
            // }
        }
    }
    
}

// void polyfp::function::set_arguments(const std::vector<polyfp::placeholder *> &buffer_vec)
// {
//     this->function_arguments = buffer_vec;
//     // Implicit buffers are set to type a_temporary by default. Change them to
//     // a_input or a_output, so that they don't get autoallocated.
//     // polyfp::str_dump("here 1");
//     for (auto &buffer : buffer_vec)
//     {
//         assert((buffer != nullptr) && "Buffer argument is null!");
//         if (buffer->get_argument_type() == a_temporary)
//         {
//             // Determine if it's an input function.
//             // If there are any scheduled computation that uses this buffer,
//             // buffer is marked as output.
//             // polyfp::str_dump("here 2");
//             bool is_input = true;
//             for (auto const &comp : this->body)
//             {
//                 if (comp->get_placeholder() == buffer)
//                 {
//                     is_input = false;
//                     break;
//                 }
//             }
//             // polyfp::str_dump("Setting type of buffer "
//             //          + buffer->get_name() + " to "
//             //          + (is_input ? "input" : "output"));
//             DEBUG(3, polyfp::str_dump("Setting type of buffer "
//                      + buffer->get_name() + " to "
//                      + (is_input ? "input" : "output")));
//             buffer->set_argument_type(is_input ? a_input : a_output);
//         }
//     }
// }

// TODO: get_live_in_computations() does not consider the case of "maybe"
// live-out (non-affine control flow, ...).
std::vector<polyfp::compute *> polyfp::function::get_live_in_computations()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    assert((this->get_computations().size() > 0) &&
           "The function should have at least one computation.");

    std::vector < polyfp::compute * > first;
    isl_union_map *deps = this->compute_dep_graph();

    if (deps != NULL) {
        if (isl_union_map_is_empty(deps) == isl_bool_false) {
            // The domains and the ranges of the dependences
            isl_union_set *domains = isl_union_map_domain(isl_union_map_copy(deps));
            isl_union_set *ranges = isl_union_map_range(isl_union_map_copy(deps));

            DEBUG(3, polyfp::str_dump("Ranges of the dependence graph.", isl_union_set_to_str(ranges)));
            DEBUG(3, polyfp::str_dump("Domains of the dependence graph.", isl_union_set_to_str(domains)));

            /** In a dependence graph, since dependences create a chain (i.e., the end of
             *  a dependence is the beginning of the following), then each range of
             *  a dependence has a set domains that correspond to it (i.e., that their
             *  union is equal to it).  If a domain exists but does not have ranges that
             *  are equal to it, then that domain is the first domain.
             *
             *  To compute those domains that do not have corresponding ranges, we
             *  compute (domains - ranges).
             *
             *  These domains that do not have a corresponding range (i.e., are not
             *  produced by previous computations) and that are not defined (i.e., do
             *  not have any expression) are live-in.
             */
            isl_union_set *first_domains = isl_union_set_subtract(domains, ranges);
            DEBUG(3, polyfp::str_dump("Domains - Ranges :", isl_union_set_to_str(first_domains)));

            if (isl_union_set_is_empty(first_domains) == isl_bool_false) {
                for (const auto &c : this->body) {
                    isl_space *sp = isl_set_get_space(c->get_iteration_domain());
                    isl_set *s = isl_set_universe(sp);
                    isl_union_set *intersect =
                            isl_union_set_intersect(isl_union_set_from_set(s),
                                                    isl_union_set_copy(first_domains));

                    if ((isl_union_set_is_empty(intersect) == isl_bool_false) &&
                        (c->get_expr().is_defined() == false))
                    {
                        first.push_back(c);
                    }
                    isl_union_set_free(intersect);
                }

                DEBUG(3, polyfp::str_dump("First computations:"));
                for (const auto &c : first) {
                    DEBUG(3, polyfp::str_dump(c->get_name() + " "));
                }
            } else {
                // If the difference between domains and ranges is empty, then
                // all the computations of the program are recursive (assuming
                // that the set of dependences is not empty).
                first = this->body;
            }

            isl_union_set_free(first_domains);
        } else {
            // If the program does not have any dependence, then
            // all the computations should be considered as the first
            // computations.
            first = this->body;
        }

        isl_union_map_free(deps);
    }

    DEBUG(3, polyfp::str_dump("Removing inline computations."));
    std::vector<compute* > result;
    for (compute * c: first)
        // if (! c->is_inline_computation())
            result.push_back(c);

    DEBUG_INDENT(-4);

    return result;
}
// TODO: get_live_out_computations() does not consider the case of "maybe"
// live-out (non-affine control flow, ...).
std::vector<polyfp::compute *> polyfp::function::get_live_out_computations()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    assert((this->get_computations().size() > 0) &&
           "The function should have at least one computation.");

    std::vector<polyfp::compute *> first;
    isl_union_map *deps = this->compute_dep_graph();

    if (deps != NULL)
    {
        if (isl_union_map_is_empty(deps) == isl_bool_false)
        {
            // The domains and the ranges of the dependences
            isl_union_set *domains = isl_union_map_domain(isl_union_map_copy(deps));
            isl_union_set *ranges = isl_union_map_range(isl_union_map_copy(deps));

            DEBUG(3, polyfp::str_dump("Ranges of the dependence graph.", isl_union_set_to_str(ranges)));
            DEBUG(3, polyfp::str_dump("Domains of the dependence graph.", isl_union_set_to_str(domains)));

            /** In a dependence graph, since dependences create a chain (i.e., the end of
             *  a dependence is the beginning of the following), then each range of
             *  a dependence has a set domains that correspond to it (i.e., that their
             *  union is equal to it).  If a range exists but does not have domains that
             *  are equal to it, then that range is the last range.
             *
             *  To compute those ranges that do not have corresponding domains, we
             *  compute (ranges - domains).
             */
            isl_union_set *last_ranges = isl_union_set_subtract(ranges, domains);
            DEBUG(3, polyfp::str_dump("Ranges - Domains :", isl_union_set_to_str(last_ranges)));

            if (isl_union_set_is_empty(last_ranges) == isl_bool_false)
            {
                for (const auto &c : this->body)
                {
                    isl_space *sp = isl_set_get_space(c->get_iteration_domain());
                    isl_set *s = isl_set_universe(sp);
                    isl_union_set *intersect =
                        isl_union_set_intersect(isl_union_set_from_set(s),
                                                isl_union_set_copy(last_ranges));

                    if (isl_union_set_is_empty(intersect) == isl_bool_false)
                    {
                        first.push_back(c);
                    }
                    isl_union_set_free(intersect);
                }

                DEBUG(3, polyfp::str_dump("Last computations:"));
                for (const auto &c : first)
                {
                    DEBUG(3, polyfp::str_dump(c->get_name() + " "));
                }
            }
            else
            {
                // If the difference between ranges and domains is empty, then
                // all the computations of the program are recursive (assuming
                // that the set of dependences is not empty).
                first = this->body;
            }

            isl_union_set_free(last_ranges);
        }
        else
        {
            // If the program does not have any dependence, then
            // all the computations should be considered as the last
            // computations.
            first = this->body;
        }
        isl_union_map_free(deps);
    }
    else
    {
        // If the program does not have any dependence, then
        // all the computations should be considered as the last
        // computations.
        first = this->body;
    }

    DEBUG(3, polyfp::str_dump("Removing inline computations."));
    std::vector<compute* > result;
    for (compute * c: first)
        // if (! c->is_inline_computation())
            result.push_back(c);

    assert((result.size() > 0) && "The function should have at least one last computation.");

    DEBUG_INDENT(-4);


    return result;
}


isl_union_map *polyfp::function::compute_dep_graph() {
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);
    // polyfp::str_dump("Computing the dependences involving the computation");
    isl_union_map *result = NULL;

    for (const auto &consumer : this->get_computations()) {
        DEBUG(3, polyfp::str_dump("Computing the dependences involving the computation " +
                                    consumer->get_name() + "."));
        DEBUG(3, polyfp::str_dump("Computing the accesses of the computation."));

        isl_union_map *accesses_union_map = NULL;
        std::vector < isl_map * > accesses_vector;
        generator::get_rhs_accesses(this, consumer, accesses_vector, false);

        DEBUG(3, polyfp::str_dump("Vector of accesses computed."));

        if (!accesses_vector.empty()) {
            // Create a union map of the accesses to the producer.
            if (accesses_union_map == NULL) {
                isl_space *space = isl_map_get_space(accesses_vector[0]);
                assert(space != NULL);
                accesses_union_map = isl_union_map_empty(space);
            }

            for (size_t i = 0; i < accesses_vector.size(); ++i) {
                isl_map *reverse_access = isl_map_reverse(accesses_vector[i]);
                accesses_union_map = isl_union_map_union(isl_union_map_from_map(reverse_access),
                                                         accesses_union_map);
            }

            //accesses_union_map = isl_union_map_intersect_range(accesses_union_map, isl_union_set_from_set(isl_set_copy(consumer->get_iteration_domain())));
            //accesses_union_map = isl_union_map_intersect_domain(accesses_union_map, isl_union_set_from_set(isl_set_copy(consumer->get_iteration_domain())));

            DEBUG(3, polyfp::str_dump("Accesses after filtering."));
            DEBUG(3, polyfp::str_dump(isl_union_map_to_str(accesses_union_map)));

            if (result == NULL) {
                result = isl_union_map_copy(accesses_union_map);
                isl_union_map_free(accesses_union_map);
            } else {
                result = isl_union_map_union(result, accesses_union_map);
            }
        }
    }

    DEBUG(3, polyfp::str_dump("Dep graph: "));
    if (result != NULL)
    {
        // polyfp::str_dump(isl_union_map_to_str(result));
        DEBUG(3, polyfp::str_dump(isl_union_map_to_str(result)));
    }
    else
    {
        DEBUG(3, polyfp::str_dump("Null."));
    }

    DEBUG_INDENT(-4);
    DEBUG(3, polyfp::str_dump("End of function"));

    return result;
}
/**
  * Generate an isl AST for the function.
  */
void function::gen_isl_ast()
{
    DEBUG_FCT_NAME(3);
    DEBUG_INDENT(4);

    // Check that time_processor representation has already been computed,
    assert(this->get_trimmed_time_processor_domain() != NULL);
    assert(this->get_aligned_identity_schedules() != NULL);

    isl_ctx *ctx = this->get_isl_ctx();
    assert(ctx != NULL);
    isl_ast_build *ast_build;

    // Rename updates so that they have different names because
    // the code generator expects each unique name to have
    // an expression, different computations that have the same
    // name cannot have different expressions.
    this->rename_computations();

    if (this->get_program_context() == NULL)
    {
        ast_build = isl_ast_build_alloc(ctx);
    }
    else
    {
        ast_build = isl_ast_build_from_context(isl_set_copy(this->get_program_context()));
    }

    isl_options_set_ast_build_atomic_upper_bound(ctx, 1);
    isl_options_get_ast_build_exploit_nested_bounds(ctx);
    isl_options_set_ast_build_group_coscheduled(ctx, 1);

    ast_build = isl_ast_build_set_after_each_for(ast_build, &polyfp::for_code_generator_after_for,
                NULL);
    // ast_build = isl_ast_build_set_at_each_domain(ast_build, &polyfp::generator::stmt_code_generator,
    //             this);

    // Set iterator names
    // for(auto &kv:this->get_iterator_names()){
    //     // std::cout<<kv;
    // }
    isl_id_list *iterators = isl_id_list_alloc(ctx, this->get_iterator_names().size());
    if (this->get_iterator_names().size() > 0)
    {
        std::string name = generate_new_variable_name();
        isl_id *id = isl_id_alloc(ctx, name.c_str(), NULL);
        iterators = isl_id_list_add(iterators, id);

        for (int i = 0; i < this->get_iterator_names().size(); i++)
        {
            name = this->get_iterator_names()[i];
            id = isl_id_alloc(ctx, name.c_str(), NULL);
            iterators = isl_id_list_add(iterators, id);

            name = generate_new_variable_name();
            id = isl_id_alloc(ctx, name.c_str(), NULL);
            iterators = isl_id_list_add(iterators, id);
            // std::cout<<name;
        }

        ast_build = isl_ast_build_set_iterators(ast_build, iterators);
    }

    // Intersect the iteration domain with the domain of the schedule.
    isl_union_map *umap =
        isl_union_map_intersect_domain(
            isl_union_map_copy(this->get_aligned_identity_schedules()),
            isl_union_set_copy(this->get_trimmed_time_processor_domain()));

    DEBUG(3, polyfp::str_dump("Schedule:", isl_union_map_to_str(this->get_schedule())));
    DEBUG(3, polyfp::str_dump("Iteration domain:",
                                isl_union_set_to_str(this->get_iteration_domain())));
    DEBUG(3, polyfp::str_dump("Trimmed Time-Processor domain:",
                                isl_union_set_to_str(this->get_trimmed_time_processor_domain())));
    DEBUG(3, polyfp::str_dump("Trimmed Time-Processor aligned identity schedule:",
                                isl_union_map_to_str(this->get_aligned_identity_schedules())));
    DEBUG(3, polyfp::str_dump("Identity schedule intersect trimmed Time-Processor domain:",
                                isl_union_map_to_str(umap)));
    DEBUG(3, polyfp::str_dump("\n"));

    // polyfp::str_dump("Schedule:", isl_union_map_to_str(this->get_schedule()));
    // polyfp::str_dump("Iteration domain:",
    //                             isl_union_set_to_str(this->get_iteration_domain()));
    // polyfp::str_dump("Trimmed Time-Processor domain:",
    //                             isl_union_set_to_str(this->get_trimmed_time_processor_domain()));
    // polyfp::str_dump("Trimmed Time-Processor aligned identity schedule:",
    //                             isl_union_map_to_str(this->get_aligned_identity_schedules()))  ;        
    // polyfp::str_dump("Identity schedule intersect trimmed Time-Processor domain:",
    //                             isl_union_map_to_str(umap));                 




    this->ast = isl_ast_build_node_from_schedule_map(ast_build, umap);
    // std::cout<<this->ast;


    isl_ast_build_free(ast_build);

    DEBUG_INDENT(-4);
}

void polyfp::function::dependence_analysis(){

    for(auto &comp: this->leader_computations){
        comp->compute_dependence_vectors();
        comp->auto_loop_transofrmation();
    }


}


void polyfp::function::dfs(int pos, int top, int end, int map[100][100], int n, int v[100],int stack[120])//从pos点开始访问
{   std::cout<<"DFSING"<<std::endl;

	int i;
	if(pos==end){//到达终点
        std::vector<int> path;
		for(i=0;i<top;i++){
            std::cout<<stack[i];
            path.push_back(stack[i]);
		}// printf("%d ",stack[i]);
        std::cout<<end<<std::endl;
        path.push_back(end);
        this->paths.push_back(path);
		// printf("%d\n",end);	
		return;
	}
	v[pos]=1;//标记被访问过 
	stack[top++]=pos;//经过的路径加入队列
	for(i=1;i<=n;i++){
		if(!v[i]&&map[pos][i])//如果这个点没有被访问过，而且b与这个点相连，就继续搜索
			this->dfs(i,top,end,map,n,v,stack);
	}
	v[pos]=0;//删除标记 
	top--;//队列里删除b
}

void polyfp::function::compute_dependency_graph(){

    int map[100][100]={0};
    
    for(auto &comp_from: this->leader_computations){
        std::cout<<"leader computation:"+comp_from->get_name()<<std::endl;
        int comp_from_index = this->leader_computation_index[comp_from];
        for(auto &comp_to: this->leader_computations){
            int comp_to_index = this->leader_computation_index[comp_to];
            if(comp_from->get_name()!=comp_to->get_name()){
                bool has_edge = false;
                for(auto &store: comp_from->store_vector){
                    for(auto &load: comp_to->load_vector){
                        if(store->get_name() == load->get_name()){
                            std::cout<<"a new edge from:"+store->get_name()+load->get_name()<<std::endl;
                            has_edge = true;
                            
                        }
                    }

                }
                if(has_edge == true){
                    std::cout<<"a new edge:"+std::to_string(comp_from_index)+std::to_string(comp_to_index)<<std::endl;
                    map[comp_from_index][comp_to_index] = 1;
                }
            }

        }

    }


    std::vector<int> leafs;

    for(auto &comp: this->leader_computations){
        if(comp->is_leaf == true){
            leafs.push_back(this->leader_computation_index[comp]);
            std::cout<<"a leaf node:"+std::to_string(this->leader_computation_index[comp])<<std::endl;
            
        }
    }
    for(auto &leaf: leafs){
        int stack[120],v[100]={0},top=0,n=this->leader_computations.size(),start=0,end=leaf;
        this->dfs(start,top,end,map,n,v,stack);

    }
    
    





}


void polyfp::function::auto_DSE(std::string path){
    this->auto_DSE_loop_transformation();
    auto comp = this->evaluate_func();
    this->best_latency = this->current_latency;
    this->best_dsp_usage = this->dsp_usage;
    // std::cout<<"name of loop level:"+leader_computations[i]->original_loop_level_name[0]<<std::endl;

    int factor = 1;

    // if(this->leader_computations.size()==1){
    this->auto_DSE_tile_size(comp,factor,path);  

    // }
    // else{
    //     this->auto_DSE_tile_size(comp,factor);

    // }
    // this->auto_DSE_tile_size(comp,factor);
}
void polyfp::function::auto_DSE_loop_transformation(){

    // this->dump_sched_graph();
    // this->gen_loop_location();
    for (auto &comp: this->leader_computations)
    {   
        // comp->get_loads_stores();
        comp->get_all_loadstores();
        // comp->dump_components();
        // comp->dump_loads_stores();
        comp->dump_all_loadstores();
    }

    this->dependence_analysis();

    for (int i=0; i<this->leader_computations.size(); i++)
    {

        this->leader_computation_index[leader_computations[i]] = i;
        this->leader_computations[i]->original_schedule = leader_computations[i]->get_schedule();
        this->leader_computations[i]->original_loop_level_name = leader_computations[i]->get_loop_level_names();

        for(auto &part:this->leader_computations[i]->components){
            part.first->original_loop_level_name = part.first->get_loop_level_names();
            part.first->original_schedule = part.first->get_schedule();
        }
        std::cout<<"name of loop level:"+leader_computations[i]->original_loop_level_name[0]<<std::endl;
        if(leader_computations[i]->is_leaf == true){
            this->leaf_computations.push_back(leader_computations[i]);

       }

    }
    // this->gen_loop_location();
    this->compute_dependency_graph();
    //TODO: Original schedule and Original dimension: iterators and loop_level_name
   

}
void polyfp::function::dump_schedule(std::string path){
    mlir::MLIRContext context;
    auto manager = polyfp::MLIRGenImpl(context);
    int level = 0;
    context.disableMultithreading();
    context.getOrLoadDialect<mlir::func::FuncDialect>();
    context.getOrLoadDialect<mlir::AffineDialect>();
    context.getOrLoadDialect<mlir::LLVM::LLVMDialect>();
    context.getOrLoadDialect<mlir::math::MathDialect>();
    context.getOrLoadDialect<mlir::memref::MemRefDialect>();
    context.getOrLoadDialect<mlir::scalehls::HLSDialect>();

    
    manager.mlirGen1(*this,this->get_isl_ast(),level,true, false, false);

   for(auto &comp : this->leader_computations){
        int index = this->leader_computation_index[comp];
        int position = manager.start_loops_position[index];
        // std::cout<<"position:";
        // std::cout<<position<<std::endl;
        // std::cout<<comp->get_name()<<std::endl;
        // std::cout<<"index:";
        // std::cout<<index<<std::endl;
        //TODO:
        for(auto &comp : this->leader_computations){
        // int index = fct.leader_computation_index[comp];
        // std::cout<<index<<std::endl;
            for(auto &kv : comp->get_directive_map()){
                if(kv.second == "pipeline"){
                    int loc_2 = comp->get_loop_level_number_from_dimension_name(kv.first);
                    int loc = comp->iterators_location_map[kv.first];
                    // index = loc + index;
                    mlir::scalehls::setLoopDirective(manager.ops[loc], true, comp->II, false, false);
                    for(int i=1; i<=loc_2; i++){
                        mlir::scalehls::setLoopDirective(manager.ops[loc-i], false, comp->II, false, true);
                    }
                }
            }             
        }
                
    }

    auto map = manager.get_argument_map();

    mlir::scalehls::setTopFuncAttr(manager.get_funcs()[0]);
    mlir::scalehls::applyFuncPreprocess(manager.get_funcs()[0], true);

                
    for(auto &comp: this->leader_computations){
        if(comp->is_unrolled == true){
            for(int i=0; i<comp->unroll_dimension.size(); i++){
                // int bias = comp->get_loop_level_number_from_dimension_name(comp->unroll_dimension[i].get_name());
                // int loc = fct.leader_computation_index[comp];
                std::cout<<comp->unroll_dimension[i].get_name();
                int loc = comp->iterators_location_map[comp->unroll_dimension[i].get_name()];
                std::cout<<"loc"<<std::endl;
                std::cout<<loc<<std::endl;
                // loc = loc + bias;
                if(comp->unroll_factor[i] != -1){
                    mlir::loopUnrollUpToFactor(manager.ops[loc],comp->unroll_factor[i]);
                }else{
                    mlir::loopUnrollFull(manager.ops[loc]);
                }
            }  
        }
    }
    
    // mlir::loopUnrollFull(manager.ops[1]);

    mlir::scalehls::applyMemoryOpts(manager.get_funcs()[0]);
    mlir::scalehls::applyAutoArrayPartition(manager.get_funcs()[0]);
    SmallVector<int64_t, 8> factors;
    std::string errorMessage;
    auto configFile = mlir::openInputFile("/home/POM/samples/config.json", &errorMessage);
    if (!configFile) {
      llvm::errs() << errorMessage << "\n";
    }
    auto config = llvm::json::parse(configFile->getBuffer());
    if (!config) {
      llvm::errs() << "failed to parse the target spec json file\n";
    }
    auto configObj = config.get().getAsObject();
    if (!configObj) {
      llvm::errs() << "support an object in the target spec json file, found "
                      "something else\n";
    }
    unsigned maxDspNum =ceil(configObj->getInteger("dsp").getValueOr(220));
    this->dsp_max = maxDspNum;
    llvm::StringMap<int64_t> latencyMap;
    mlir::scalehls::getLatencyMap(configObj, latencyMap);
    llvm::StringMap<int64_t> dspUsageMap;
    mlir::scalehls::getDspUsageMap(configObj, dspUsageMap);
    int loc = 0;
    int total_dsp = 0;
    long total_latency = 0;
    if(manager.start_loops_position.size() == 0){
        manager.start_loops_position.push_back(0);
    }

    mlir::scalehls::ScaleHLSEstimator(latencyMap, dspUsageMap, true).estimateFunc(manager.funcs[0]);

    auto module = manager.getModule();
    // mlir::verify(module);
    // if (mlir::failed(mlir::verify(module))) {
    //     module->emitError("module verification error");
    //     // module->dump();
    // }
    
    // module->dump();
    std::error_code error;
    std::string s = this->get_name();
    // std::string path = "/home/jason/Hope/samples/"+s+".mlir";
    std::string path1 = path+s+".mlir";
    std::cout<<path1<<std::endl;
    llvm::raw_fd_ostream os(path1, error);
    os << *module;

}
polyfp::compute * polyfp::function::evaluate_func(){
    // this->
    for(auto &comp: this->get_body()){
        comp->iterators_location_map.clear();
        this->global_location = 0;
    }
    this->gen_loop_location();
    this->gen_time_space_domain();
    this->gen_isl_ast();
    mlir::MLIRContext context;
    auto manager = polyfp::MLIRGenImpl(context);
    int level = 0;
    context.disableMultithreading();
    context.getOrLoadDialect<mlir::func::FuncDialect>();
    context.getOrLoadDialect<mlir::AffineDialect>();
    context.getOrLoadDialect<mlir::LLVM::LLVMDialect>();
    context.getOrLoadDialect<mlir::math::MathDialect>();
    context.getOrLoadDialect<mlir::memref::MemRefDialect>();
    context.getOrLoadDialect<mlir::scalehls::HLSDialect>();

    
    manager.mlirGen1(*this,this->get_isl_ast(),level,true, false, false);
    // manager.getModule().dump();
    for(auto &comp : this->leader_computations){
        int index = this->leader_computation_index[comp];
        int position = manager.start_loops_position[index];
        // std::cout<<"position:";
        // std::cout<<position<<std::endl;
        // std::cout<<comp->get_name()<<std::endl;
        // std::cout<<"index:";
        // std::cout<<index<<std::endl;
        //TODO:
        for(auto &comp : this->leader_computations){
        // int index = fct.leader_computation_index[comp];
        // std::cout<<index<<std::endl;
            for(auto &kv : comp->get_directive_map()){
                if(kv.second == "pipeline"){
                    int loc_2 = comp->get_loop_level_number_from_dimension_name(kv.first);
                    int loc = comp->iterators_location_map[kv.first];
                    // index = loc + index;
                    mlir::scalehls::setLoopDirective(manager.ops[loc], true, comp->II, false, false);
                    for(int i=1; i<=loc_2; i++){
                        mlir::scalehls::setLoopDirective(manager.ops[loc-i], false, comp->II, false, true);
                    }
                }
                }             
        }
                
    }

    auto map = manager.get_argument_map();
    mlir::scalehls::setTopFuncAttr(manager.get_funcs()[0]);
    mlir::scalehls::applyFuncPreprocess(manager.get_funcs()[0], true);
           
    // for(auto &comp: this->leader_computations){
    //     if(comp->is_unrolled == true){
    //         for(int i=0; i<comp->unroll_dimension.size(); i++){
    //             int bias = comp->get_loop_level_number_from_dimension_name(comp->unroll_dimension[i].get_name());
    //             int loc = this->leader_computation_index[comp];
    //             loc = loc + bias;
    //             if(comp->unroll_factor[i] != -1){
    //                 mlir::loopUnrollUpToFactor(manager.ops[loc],comp->unroll_factor[i]);
    //             }else{
    //                 mlir::loopUnrollFull(manager.ops[loc]);
    //             }
    //         }   
    //     }
    // }
    for(auto &comp: this->leader_computations){
        if(comp->is_unrolled == true){
            for(int i=0; i<comp->unroll_dimension.size(); i++){
                // int bias = comp->get_loop_level_number_from_dimension_name(comp->unroll_dimension[i].get_name());
                // int loc = fct.leader_computation_index[comp];
                std::cout<<comp->unroll_dimension[i].get_name();
                int loc = comp->iterators_location_map[comp->unroll_dimension[i].get_name()];
                std::cout<<"loc"<<std::endl;
                std::cout<<loc<<std::endl;
                // loc = loc + bias;
                if(comp->unroll_factor[i] != -1){
                    mlir::loopUnrollUpToFactor(manager.ops[loc],comp->unroll_factor[i]);
                }else{
                    mlir::loopUnrollFull(manager.ops[loc]);
                }
            }  
        }
    }

    mlir::scalehls::applyMemoryOpts(manager.get_funcs()[0]);
    mlir::scalehls::applyAutoArrayPartition(manager.get_funcs()[0]);
    SmallVector<int64_t, 8> factors;
    std::string errorMessage;
    auto configFile = mlir::openInputFile("/home/POM/samples/config.json", &errorMessage);
    if (!configFile) {
      llvm::errs() << errorMessage << "\n";
    }
    auto config = llvm::json::parse(configFile->getBuffer());
    if (!config) {
      llvm::errs() << "failed to parse the target spec json file\n";
    }
    auto configObj = config.get().getAsObject();
    if (!configObj) {
      llvm::errs() << "support an object in the target spec json file, found "
                      "something else\n";
    }
    unsigned maxDspNum =ceil(configObj->getInteger("dsp").getValueOr(220)*1.1);
    this->dsp_max = maxDspNum;
    llvm::StringMap<int64_t> latencyMap;
    mlir::scalehls::getLatencyMap(configObj, latencyMap);
    llvm::StringMap<int64_t> dspUsageMap;
    mlir::scalehls::getDspUsageMap(configObj, dspUsageMap);
    int loc = 0;
    int total_dsp = 0;
    long total_latency = 0;
    if(manager.start_loops_position.size() == 0){
        manager.start_loops_position.push_back(0);
    }
    for(auto &loop: manager.start_loops_position ){
        // std::cout<<"loop: "+std::to_string(loop)<<std::endl;
        // std::cout<<"size: "+std::to_string(manager.ops.size())<<std::endl;
        mlir::scalehls::ScaleHLSEstimator(latencyMap, dspUsageMap, true).estimateLoop(manager.ops[loop],manager.funcs[0]);
        // manager.getModule().dump(); 
        auto latency = mlir::scalehls::getTiming(manager.ops[loop]).getLatency();
        // std::cout<<"latency: "+std::to_string(latency)<<std::endl;
        auto dspNum = mlir::scalehls::getResource(manager.ops[loop]).getDsp();
        auto minII = mlir::scalehls::getLoopInfo(manager.ops[loop]).getMinII();
        this->leader_computations[loc]->latency = latency;
        this->leader_computations[loc]->dsp = dspNum;
        this->leader_computations[loc]->minII = minII;

        total_dsp+=dspNum;
        total_latency+=latency;
        this->latency_map[loc] = latency;
        this->resource_map[loc] = dspNum;
        loc+=1;
        
    }
    // for(auto &comp: this->leader_computations){
    //     int index = this->leader_computation_index[comp];
    //     mlir::scalehls::ScaleHLSEstimator(latencyMap, dspUsageMap, true).estimateLoop(manager.ops[index],manager.funcs[0]);
    //     for(auto &kv : comp->get_directive_map()){
    //         if(kv.second == "pipeline"){
            
    //             int bias = comp->get_loop_level_number_from_dimension_name(kv.first);
    //             int loc = this->leader_computation_index[comp];
    //             loc = loc+bias;
    //             for (auto &kv1: comp->get_directive_tool_map()){
                 
    //                     auto info = mlir::scalehls::getLoopInfo(manager.ops[loc]);
    //                     auto tmpII = info.getMinII();
    //                     // mlir::scalehls::setLoopDirective(ops[level], true, comp->II, false, false);
    //                     mlir::scalehls::setLoopDirective(manager.ops[loc], true, tmpII, false, false);
                    
    //             }


    //         }
                    
    //     }  
    // }
    this->dsp_usage = total_dsp;
    this->current_latency = total_latency;
    // manager.getModule().dump(); 
    // std::cout<<"!!!!!!!11!!!!!!"<<std::endl;
    // manager.getModule().dump();
    return this->update_latency();


}


void polyfp::function::auto_DSE_tile_size(polyfp::compute *comp, int factor, std::string path){
    auto iterators = comp->get_iteration_variables();
    int size = iterators.size();
    std::map<int,polyfp::var> iterator_map;
    for(auto &iter: iterators){
        int loc = comp->get_loop_level_number_from_dimension_name(iter.get_name());
        iterator_map[loc] = iter;
    }

    int factor1=1;
    int factor2=1;
    int factor3=1;
    int max_dim = 0;
    for(auto &iter: comp->get_iteration_variables()){
        int dim = iter.get_upper().get_int32_value();
        if(max_dim<dim){
            max_dim = dim;
        }
    }
    //upper bound:like 4096
    // std::cout<<"upper bound:";
    // std::cout<<max_dim<<std::endl;
    // if(max_dim>=500){
        int scale = 128*pow(2,factor-1);
    // }
    
    std::vector<std::vector<int>> tilesize_list;
    // std::string errorMessage;      
    // auto csvFile = mlir::openOutputFile("/home/jason/Hope/samples/dse_test.csv", &errorMessage);
    // if (!csvFile)
    //     return;
    // auto &os = csvFile->os();

    // Print header row.
    std::string s = this->get_name();
    // std::string path = "/home/jason/Hope/samples/"+s+".mlir";
    std::string path1 = path+s+".csv";
    std::ifstream ifs(path1,std::ios::in);
    char ch;
    ifs>>ch;
    std::ofstream myfile;
    myfile.open(path1,std::ios::app);
    if(ifs.eof())
    {
        for (unsigned i = 0; i < size; ++i){
            myfile << "l" << i << ",";


        }
        myfile << "cycle,dsp,ii\n";     
    }
 
    if(size == 3){
        for(int i = 0; i<6+factor; i++){
            factor1 = pow(2,i);
            for(int j = 0; j<6+factor-i; j++){
                factor2 = pow(2,j);
                factor3 = scale/factor2/factor1;
                tilesize_list.push_back({factor1,factor2,factor3});
            }
        }
        // tilesize_list.push_back({1,8,16});
        // tilesize_list.push_back({1,16,8});
        // tilesize_list.push_back({2,4,16});
        // tilesize_list.push_back({2,8,8});
        // tilesize_list.push_back({2,8,8});
        // tilesize_list.push_back({2,8,8});
        // tilesize_list.push_back({4,2,16});
        bool larger_factor = true;
        // long best_latency = LONG_MAX;
        // //TODO
        // int best_dsp = 9999;
        if(larger_factor == true){
            std::cout<<"current computation: "+comp->get_name()<<std::endl;
            for(auto &tile_size: tilesize_list){
                comp->set_schedule(comp->original_schedule);
                comp->set_loop_level_names(comp->original_loop_level_name);
                comp->directive_map.clear();
                comp->is_unrolled = false;
                comp->unroll_factor.clear();
                comp->unroll_dimension.clear();
                comp->tile_map.clear();
                comp->tile_size_map.clear();
                comp->access_map.clear();
                // comp->after_level = -2;
                var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
                if(tile_size[0]<64 && tile_size[1]<64 && tile_size[2]<64){
                    comp->tile(iterator_map[0],iterator_map[1],iterator_map[2],tile_size[0],tile_size[1],tile_size[2],i0, j0, k0, i1, j1, k1);
                    if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]!=1){
                        comp->pipeline(k0,1);
                        comp->unroll(k1,-1);
                        comp->unroll(j1,-1);
                        comp->unroll(i1,-1);
                    }
                    if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]==1){
                        comp->pipeline(k0,1);
                        comp->unroll(k1,-1);
                        comp->unroll(j1,-1);
                    }
                    if(tile_size[2]!=1 && tile_size[1]==1 && tile_size[0]!=1){
                        comp->pipeline(k0,1);
                        comp->unroll(k1,-1);
                        comp->unroll(i1,-1);
                    }
                    if(tile_size[2]==1 && tile_size[1]!=1 && tile_size[0]!=1){
                        comp->pipeline(iterator_map[2],1);
                        comp->unroll(i1,-1);
                        comp->unroll(j1,-1);
                    }
                    for(auto &part:comp->components){
                        part.first->set_schedule(part.first->original_schedule);
                        part.first->set_loop_level_names(part.first->original_loop_level_name);
                        part.first->tile(iterator_map[0],iterator_map[1],iterator_map[2],tile_size[0],tile_size[1],tile_size[2],i0, j0, k0, i1, j1, k1);
                        // if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]!=1){
                        //     part.first->after(comp,k1);
                        //     // comp->pipeline(i1,1);
                        //     // comp->unroll(k1,-1);
                        //     // comp->unroll(j1,-1);
                        // }
                        // if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]!=1){
                        //     part.first->after(comp,k1);
                        // }
                        // if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]==1){
                        //     part.first->after(comp,k1);
                        // }
                        // if(tile_size[2]!=1 && tile_size[1]==1 && tile_size[0]!=1){
                        //     part.first->after(comp,k1);
                        // }
                        if(tile_size[2]==1 && tile_size[1]!=1 && tile_size[0]!=1){
                            part.first->after(comp,j1);
                        }else{
                            part.first->after(comp,k1);
                        }
                    }
                    int II = 1;
                    if(this->leader_computations.size() == 1){                          
                        // this->evaluate_func();
                        // if(this->dsp_max < this->dsp_usage){
                        //     int new_II= this->dsp_usage / this->dsp_max;
                        //     if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]!=1){
                        //         comp->pipeline(k0,new_II);
                        //     }
                        //     if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]==1){
                        //         comp->pipeline(k0,new_II);
                        //     }
                        //     if(tile_size[2]!=1 && tile_size[1]==1 && tile_size[0]!=1){
                        //         comp->pipeline(k0,new_II);
                        //     }
                        //     if(tile_size[2]==1 && tile_size[1]!=1 && tile_size[0]!=1){
                        //         comp->pipeline(iterator_map[2],new_II);
                        //     }
                        //     II = new_II;
                        // }
                        // this->evaluate_func();
                        // if(this->dsp_max < this->dsp_usage){
                        //     int new_II= this->dsp_usage / this->dsp_max +1;
                        //     if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]!=1){
                        //         comp->pipeline(k0,new_II);
                        //     }
                        //     if(tile_size[2]!=1 && tile_size[1]!=1 && tile_size[0]==1){
                        //         comp->pipeline(k0,new_II);
                        //     }
                        //     if(tile_size[2]!=1 && tile_size[1]==1 && tile_size[0]!=1){
                        //         comp->pipeline(k0,new_II);
                        //     }
                        //     if(tile_size[2]==1 && tile_size[1]!=1 && tile_size[0]!=1){
                        //         comp->pipeline(iterator_map[2],new_II);
                        //     }
                        //     II = new_II;
                        // }
                        this->evaluate_func();
                        if(this->current_latency < this->best_latency && this->dsp_max>= this->dsp_usage){
                            this->best_latency = this->current_latency;
                            this->best_dsp_usage = this->dsp_usage;
                            std::cout<<"best_latency:  "<<std::endl;
                            std::cout<<best_latency<<std::endl;
                            this->dump_schedule(path);
                            // this->best_ast = this->get_isl_ast();
                            // comp->best_schedule = comp->get_schedule();
                            // comp->best_tile_map = comp->tile_map;
                            // comp->best_tile_size_map = comp->tile_size_map;
                            // comp->best_directive_map = comp->directive_map;
                            // comp->best_directive_tool_map = comp->directive_tool_map;
                            // comp->best_loop_level_names = comp->get_loop_level_names();
                            // comp->best_unroll_factor = comp->unroll_factor;
                            // comp->best_unroll_dimension = comp->unroll_dimension;
                        }
                        
                        // if(this->dsp_max>this->dsp_usage){
                        //     larger_factor = true;
                        //     // auto_DSE_tile_size(new_comp, factor);
                        // }

                    }else{
                        std::cout<<"enter else: "+comp->get_name()<<std::endl;
                        auto new_comp = this->evaluate_func();
                        if(new_comp != comp && this->dsp_max>this->dsp_usage){
                            // larger_factor = false;
                            auto_DSE_tile_size(new_comp, 1,path);
                        }else if(new_comp == comp &&this->current_latency < this->best_latency && this->dsp_max>= this->dsp_usage){
                            this->best_latency = this->current_latency;
                            this->best_dsp_usage = this->dsp_usage;

                            std::cout<<"best_latency:  "<<std::endl;
                            std::cout<<this->best_latency<<std::endl;
                            this->dump_schedule(path);
                            auto latency = comp->latency;
                            int dsp = comp->dsp;
                            std::cout<<"schedule: "+std::to_string(tile_size[0])+", "+std::to_string(tile_size[1])+", "+std::to_string(tile_size[2])+": "+std::to_string(latency)+": "+std::to_string(dsp)<<std::endl;
                            // myfile << tile_size[0] << ",";
                            // myfile << tile_size[1] << ",";
                            // myfile << tile_size[2] << ",";
                            // myfile << latency<< ",";
                            // myfile << this->dsp_usage << ",";
                            // myfile << comp->minII << "\n";

                        }
                    }
                    
                    auto latency = comp->latency;
                    int dsp = comp->dsp;
                    
                    std::cout<<"schedule: "+std::to_string(tile_size[0])+", "+std::to_string(tile_size[1])+", "+std::to_string(tile_size[2])+": "+std::to_string(latency)+": "+std::to_string(dsp)+": "+std::to_string(II)<<std::endl;
                    myfile << tile_size[0] << ",";
                    myfile << tile_size[1] << ",";
                    myfile << tile_size[2] << ",";
                    myfile << latency<< ",";
                    myfile << this->dsp_usage << ",";
                    myfile << comp->minII << "\n";

                }
                
            }

        }

        // if(larger_factor == true){
        //     // std::cout<<"finished???"<<std::endl; 
        //     factor = factor+1;
        //     comp->set_schedule(comp->original_schedule);
        //     comp->set_loop_level_names(comp->original_loop_level_name);
        //     comp->directive_map.clear();
        //     comp->unroll_factor.clear();
        //     comp->unroll_dimension.clear();
        //     comp->is_unrolled = false;
        //     if(this->dsp_max>this->dsp_usage && factor<=2){
        //         this->auto_DSE_tile_size(comp,factor,path);
                
        //     }
            
        // }
        myfile.close();



    }
    else if(size == 2){
        for(int j = 0; j<6+factor; j++){
            std::cout<<"factor size: ";
            std::cout<<factor;
            factor1 = pow(2,j);
            factor2 = scale/factor1;
            tilesize_list.push_back({factor1,factor2});
            std::cout<<"tile factor: ";
            std::cout<<factor1;
            std::cout<<"; ";
            std::cout<<factor2<<std::endl;
            
        }
        // tilesize_list.push_back({1,2});
        bool larger_factor = true;
        for(auto &tile_size: tilesize_list){
            comp->set_schedule(comp->original_schedule);
            comp->set_loop_level_names(comp->original_loop_level_name);
            comp->directive_map.clear();
            comp->is_unrolled = false;
            comp->unroll_factor.clear();
            comp->unroll_dimension.clear();
            comp->tile_map.clear();
            comp->tile_size_map.clear();
            comp->access_map.clear();
            // this->gen_c_code();
            var i0("i0"), j0("j0"), i1("i1"), j1("j1");
            // std::cout<<"tile factor: ";
            // std::cout<<tile_size[0];
            // std::cout<<"; ";
            // std::cout<<tile_size[1]<<std::endl;
            if(tile_size[0]<=64 && tile_size[1]<=64){
                comp->tile(iterator_map[0],iterator_map[1],tile_size[0],tile_size[1],i0, j0, i1, j1);
                // std::cout<<iterator_map[0].get_name()<<std::endl;
                // std::cout<<iterator_map[1].get_name()<<std::endl;
                for(auto &part:comp->components){
                    part.first->set_schedule(part.first->original_schedule);
                    part.first->set_loop_level_names(part.first->original_loop_level_name);
                    // std::cout<<"here!!!!!!!!"<<std::endl;
                    // auto iterators = part.first->get_iteration_variables();
                    // int size = iterators.size();
                    // std::map<int,polyfp::var> iterator_map;
                    // for(auto &iter: iterators){
                    //     int loc = part.first->get_loop_level_number_from_dimension_name(iter.get_name());
                    //     iterator_map[loc] = iter;
                    // }
                    part.first->tile(iterator_map[0],iterator_map[1],tile_size[0],tile_size[1],i0, j0, i1, j1);
                    if(tile_size[1]!=1&&tile_size[0]!=1){
                        part.first->after(comp,j1);
                        comp->pipeline(j0,1);
                        comp->unroll(j1,-1);
                        comp->unroll(i1,-1);
                    }else if(tile_size[1]==1&&tile_size[0]!=1){
                        part.first->after(comp,i1);
                        comp->pipeline(iterator_map[1],1);
                        comp->unroll(i1,-1);
                    }else if(tile_size[0]==1&&tile_size[1]!=1){
                        part.first->after(comp,j1);
                        comp->pipeline(j0,1);
                        comp->unroll(j1,-1);
                    }
                
                }
                if(this->leader_computations.size() == 1){
                    std::cout<<"we got here in if"<<std::endl;
                    
                    this->evaluate_func();
                    if(this->current_latency < this->best_latency && this->dsp_max>= this->dsp_usage){
                        this->best_latency = this->current_latency;
                        this->best_dsp_usage = this->dsp_usage;

                        std::cout<<"best_latency:  "<<std::endl;
                        std::cout<<best_latency<<std::endl;
                        this->dump_schedule(path);
                        
                        // this->best_ast = this->get_isl_ast();
                        // comp->best_schedule = comp->get_schedule();
                        // comp->best_tile_map = comp->tile_map;
                        // comp->best_tile_size_map = comp->tile_size_map;
                        // comp->best_directive_map = comp->directive_map;
                        // comp->best_directive_tool_map = comp->directive_tool_map;
                        // comp->best_loop_level_names = comp->get_loop_level_names();
                        // comp->best_unroll_factor = comp->unroll_factor;
                        // comp->best_unroll_dimension = comp->unroll_dimension;
                    }
                    
                    if(this->dsp_max>this->dsp_usage){
                        larger_factor = true;
                        // auto_DSE_tile_size(new_comp, factor);
                    }

                }else{  
                        std::cout<<"before evaluate";
                        auto new_comp = this->evaluate_func();
                        if(new_comp != comp && this->dsp_max>this->dsp_usage){
                            // larger_factor = false;
                            auto_DSE_tile_size(new_comp, 1,path);
                        }else if(new_comp == comp &&this->current_latency < this->best_latency && this->dsp_max>= this->dsp_usage){
                            this->best_latency = this->current_latency;
                            this->best_dsp_usage = this->dsp_usage;

                            std::cout<<"best_latency:  "<<std::endl;
                            std::cout<<this->best_latency<<std::endl;
                            this->dump_schedule(path);
                            auto latency = comp->latency;
                            int dsp = comp->dsp;
                            std::cout<<"schedule: "+std::to_string(tile_size[0])+", "+std::to_string(tile_size[1])+", "+std::to_string(tile_size[2])+": "+std::to_string(latency)+": "+std::to_string(dsp)<<std::endl;
                            myfile << tile_size[0] << ",";
                            myfile << tile_size[1] << ",";
                            // myfile << tile_size[2] << ",";
                            myfile << latency<< ",";
                            myfile << this->dsp_usage << "\n";
                        }
                    }
                
                auto latency = comp->latency;
                int dsp = comp->dsp;
                
                std::cout<<"schedule: "+std::to_string(tile_size[0])+", "+std::to_string(tile_size[1])+": "+std::to_string(latency)+": "+std::to_string(dsp)<<std::endl;
                myfile << tile_size[0] << ",";
                myfile << tile_size[1] << ",";
                myfile << latency<< ",";
                myfile << this->dsp_usage << "\n";

            }
            
            
            
        }
        
       
        // std::cout<<"finished"<<std::endl;
        myfile.close();
        // if(larger_factor == true){
        //     // std::cout<<"finished???"<<std::endl;
        //     factor = factor+1;
        //     comp->set_schedule(comp->original_schedule);
        //     comp->set_loop_level_names(comp->original_loop_level_name);
        //     comp->directive_map.clear();
        //     comp->unroll_factor.clear();
        //     comp->unroll_dimension.clear();
        //     comp->is_unrolled = false;
        //     if(this->dsp_max>this->dsp_usage && factor<=3){
        //         this->auto_DSE_tile_size(comp,factor,path);
                
        //     }
            
        // }
        


    }


}






bool cmp_value(const std::pair<int, int> left, const std::pair<int,int> right)
{
	return left.second < right.second;
}
int polyfp::function::get_longest_path(){
    auto i= std::max_element(this->all_latency_map.begin(),this->all_latency_map.end(),cmp_value);
    // std::cout << i->first << i->second << std::endl;
    return i->first;

}
int polyfp::function::get_longest_node(std::vector<int> path){
    long max_latency = 0;
    long index = 0;
    for(int j=0; j<path.size(); j++){
        if(max_latency < this->latency_map[path[j]]){
            max_latency = this->latency_map[path[j]];
            index = j;

        }
    }
    // std::cout<<"longest node: "+std::to_string(max_latency)+";"+std::to_string(index)<<std::endl;
    return index;

}
polyfp::compute * polyfp::function::update_latency(){

    //jia dsp de zuo wei pan duan yiju
    for(int i=0; i<this->paths.size(); i++){
        std::string result = "Latency of path:";
        long sum = 0;
        for(int j=0; j<this->paths[i].size(); j++){
            result += std::to_string(this->latency_map[this->paths[i][j]]);
            result += ";";
            sum+=this->latency_map[this->paths[i][j]];
        }
        result+=std::to_string(sum);
        this->all_latency_map[i] = sum;
        std::cout<<result<<std::endl;
    }
    long path_index = this->get_longest_path();
    long node_index = this->get_longest_node(this->paths[path_index]);
    this->longest_path = path_index;
    this->longest_node = node_index;
    // std::cout<<"path: ";
    // std::cout<<path_index<<std::endl;
    // std::cout<<"node: ";
    // std::cout<<node_index<<std::endl;

    std::map<polyfp::compute *,int>::iterator it;
    polyfp::compute *comp;

    for( it= this->leader_computation_index.begin();it!=this->leader_computation_index.end();it++) 
	{
		if(it->second==node_index)
		    
            comp = it->first;
	} 

    // std::cout<<"get_todo_comp"+comp->get_name();
    return comp;


    
}


void polyfp::function::codegen()
{
    // this->set_arguments(arguments);
    this->gen_loop_location();
    // this->gen_loop_location();
    this->gen_time_space_domain();
    this->gen_isl_ast();
    this->gen_c_code();

    this->gen_mlir_stmt();

}



void polyfp::function::gen_c_code() const
{
    polyfp::str_dump("\n\n");
    polyfp::str_dump("\nC like code:\n");
    isl_printer *p;
    p = isl_printer_to_file(this->get_isl_ctx(), stdout);
    p = isl_printer_set_output_format(p, ISL_FORMAT_C);
    

    p = isl_printer_print_ast_node(p, this->get_isl_ast());
    isl_printer_free(p);
    polyfp::str_dump("\n\n");
}
void polyfp::function::trans(){
    
    // This vector is used in generate_Halide_stmt_from_isl_node to figure
    // out what are the statements that have already been visited in the
    // AST tree.
    std::vector<std::pair<std::string, std::string>> generated_stmts;
    isl_ast_node *node=this->get_isl_ast();

    const polyfp::function &fct =*this;
    if (isl_ast_node_get_type(node) == isl_ast_node_for)
    
    {
        DEBUG(3, polyfp::str_dump("Generating code for Halide::For"));
        std::cout<<"isl_ast_node_for"<<std::endl;

        isl_ast_expr *iter = isl_ast_node_for_get_iterator(node);
        char *cstr = isl_ast_expr_to_C_str(iter);
        std::string iterator_str = std::string(cstr);
        std::cout<<"iterator_str"<<std::endl;
        std::cout<<iterator_str<<std::endl;

        isl_ast_expr *init = isl_ast_node_for_get_init(node);
        isl_ast_expr *cond = isl_ast_node_for_get_cond(node);
        isl_ast_expr *inc = isl_ast_node_for_get_inc(node);
        isl_ast_node *body = isl_ast_node_for_get_body(node);
        if (isl_ast_node_get_type(body) == isl_ast_node_block)
        {
            std::cout<<"111isl_ast_node_block"<<std::endl;
        }else if (isl_ast_node_get_type(body) == isl_ast_node_user)
        {
            std::cout<<"111isl_ast_node_user"<<std::endl;
        }else if (isl_ast_node_get_type(body) == isl_ast_node_for)
        {
            std::cout<<"111isl_ast_node_for"<<std::endl;
        }


        
        std::cout<<(const char *)isl_ast_expr_to_C_str(init)<<std::endl;
        std::cout<<(const char *)isl_ast_expr_to_C_str(cond)<<std::endl;
        std::cout<<(const char *)isl_ast_expr_to_C_str(inc)<<std::endl;



        polyfp::str_dump("\nCderf like code:\n");
        isl_printer *p;
        isl_ast_print_options *options;
     
        p = isl_printer_to_file(this->get_isl_ctx(), stdout);
        p = isl_printer_set_output_format(p, ISL_FORMAT_C);
        p = isl_printer_print_ast_node(p, this->get_isl_ast());
        p=isl_ast_node_for_print(node,p,options);







        //////////////////////////////
        isl_val *inc_val = isl_ast_expr_get_val(inc);
        if (!isl_val_is_one(inc_val)) {
            ERROR("The increment in one of the loops is not +1."
                                    "This is not supported by Halide", 1);
        }
        isl_val_free(inc_val);
        //////////////////////////////////

        




        ////////////////////////////////////////////////////
        isl_ast_expr *cond_upper_bound_isl_format = NULL;
        if (isl_ast_expr_get_op_type(cond) == isl_ast_op_lt) {
            cond_upper_bound_isl_format = isl_ast_expr_get_op_arg(cond, 1);
        } else if (isl_ast_expr_get_op_type(cond) == isl_ast_op_le) {
            // Create an expression of "1".
            isl_val *one = isl_val_one(isl_ast_node_get_ctx(node));
            // Add 1 to the ISL ast upper bound to transform it into a strinct bound.
            cond_upper_bound_isl_format = isl_ast_expr_add(
                    isl_ast_expr_get_op_arg(cond, 1),
                    isl_ast_expr_from_val(one));
        } else {
            ERROR("The for loop upper bound is not an isl_est_expr of type le or lt", 1);
        }
        std::cout<<(const char *)isl_ast_expr_to_C_str(cond_upper_bound_isl_format)<<std::endl;
        assert(cond_upper_bound_isl_format != NULL);
        DEBUG(3, polyfp::str_dump("Creating for loop init expression."));
        
        //////////////////////////////////////////////////////////


        if (isl_ast_expr_get_type(cond_upper_bound_isl_format) == isl_ast_expr_int)
        {
            isl_val *init_val = isl_ast_expr_get_val(init);
            std::cout<<"int"<< std::endl;
            std::cout<<isl_val_get_num_si(init_val)<< std::endl;
            isl_val_free(init_val);
        }
        else if (isl_ast_expr_get_type(cond_upper_bound_isl_format) == isl_ast_expr_id)
        {
            isl_id *identifier = isl_ast_expr_get_id(init);
            std::cout<<"name"<< std::endl;
            std::string name_str(isl_id_get_name(identifier));
            std::cout<<name_str;
            isl_id_free(identifier);
        
        } else if (isl_ast_expr_get_type(cond_upper_bound_isl_format) == isl_ast_expr_op)
        {   isl_ast_expr *expr0 = isl_ast_expr_get_op_arg(init, 0);
            std::cout<<"name_str";
        }
		
            isl_ast_expr_free(init);
            isl_ast_expr_free(cond);
            isl_ast_expr_free(inc);
            isl_ast_node_free(body);
            isl_ast_expr_free(cond_upper_bound_isl_format);
    }else if (isl_ast_node_get_type(node) == isl_ast_node_block)
    {
        std::cout<<"isl_ast_node_block"<<std::endl;
    }
}
  
       
}










