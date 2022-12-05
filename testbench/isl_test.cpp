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
#include <iostream>
#include <string>


#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
// #include "mlir/IR/Attributes.h"
using namespace std;
using namespace polyfp;


int main(){
    isl_ctx *ctx;
    isl_union_set *domain;
    isl_union_map *schedule;
    isl_ast_build *build;
    isl_ast_node *tree;
    isl_printer *p;
    const char *s;

    ctx = isl_ctx_alloc();
    s = "[N,M,K] -> { S4[i0, i1] : 0 <= i0 <= N and 0 <= i1 <= M; S5[i0, i1]";
    // s = "[T,N] -> { S[t,i] : 1<=t<=T and 1<=i<=N }";
    domain = isl_union_set_read_from_str(ctx, s);
    s = "[T,N] -> { S[t,i] -> [t,i+t] }";
    schedule = isl_union_map_read_from_str(ctx, s);
    schedule = isl_union_map_intersect_domain(schedule, domain);

    build = isl_ast_build_alloc(ctx);
    tree = isl_ast_build_node_from_schedule_map(build, schedule);
    isl_ast_build_free(build);

    p = isl_printer_to_file(ctx, stdout);
    p = isl_printer_set_output_format(p, ISL_FORMAT_C);
    p = isl_printer_print_ast_node(p, tree);
    isl_printer_free(p);

    isl_ast_node_free(tree);

    isl_ctx_free(ctx);
}

    // isl_ctx *ctx;
    // isl_union_set *domain;
    // isl_union_map *schedule;
    // isl_ast_build *build;
    // isl_ast_node *tree;
    // isl_printer *p;
    // const char *s;
    // isl_schedule *sch; 

    // ctx = isl_ctx_alloc();

    // s = "[T,N] -> { S[t,i] : 1<=t<=T and 1<=i<=N }";
    // domain = isl_union_set_read_from_str(ctx, s);
    // s = "[T,N] -> { S[t,i] -> [t,i+t] }";
    // schedule = isl_union_map_read_from_str(ctx, s);
    // schedule = isl_union_map_intersect_domain(schedule, domain);
    // sch = isl_schedule_read_from_str(ctx,"[T,N] -> { S[t,i] : 1<=t<=T and 1<=i<=N }");
    // p = isl_printer_print_schedule(p,sch);
    // p = isl_printer_to_file(ctx, stdout);
    // // std::cout<<p;

    // build = isl_ast_build_alloc(ctx);
    //     isl_union_set *iterator_domain = isl_union_set_read_from_str(ctx,
    //     "[N,M,K] -> { S4[i0, i1] : 0 <= i0 <= N and 0 <= i1 <= M; S5[i0, i1] : 0 <= i0 <= N and 0 <= i1 <= M }");
    // isl_options_set_schedule_serialize_sccs(ctx, 0);
    // isl_options_set_schedule_maximize_band_depth(ctx, 1);
    // isl_schedule_constraints *sc = isl_schedule_constraints_on_domain(iterator_domain);
    // isl_union_map *proximity=isl_union_map_read_from_str(ctx, "[]->{ s4[i0,i1]->s5[i0,i1] }");
    // auto sc1 = isl_schedule_constraints_compute_schedule(sc);
    // auto sc2=isl_schedule_node_from_domain(iterator_domain);


    // tree = isl_ast_build_node_from_schedule_map(build, schedule);
    // std::cout<<tree;
    // std::cout<<build;
    // isl_ast_build_free(build);

    // p = isl_printer_to_file(ctx, stdout);
    
    // // p = isl_printer_set_output_format(p, ISL_FORMAT_C);
    // p = isl_printer_print_schedule(p, sc1);
    // p = isl_printer_end_line(p);
    // // std::cout<<p;
    // // isl_printer_free(p);
    // isl_printer_free(p);
    // isl_ast_node_free(tree);

    // isl_ctx_free(ctx);
// //////////////////////////////////////////////////////////////////////////////
    // isl_ctx *ctx = isl_ctx_alloc();
    // isl_union_set *iterator_domain = isl_union_set_read_from_str(ctx,
    //     "[N,M,K] -> { S4[i0, i1] : 0 <= i0 <= N and 0 <= i1 <= M; S5[i0, i1] : 0 <= i0 <= N and 0 <= i1 <= M }");
    // isl_options_set_schedule_serialize_sccs(ctx, 0);
    // isl_options_set_schedule_maximize_band_depth(ctx, 1);
    // isl_schedule_constraints *sc = isl_schedule_constraints_on_domain(iterator_domain);
    // isl_union_map *proximity=isl_union_map_read_from_str(ctx, "[]->{ s4[i0,i1]->s5[i0,i1] }");
    // auto schedule = isl_schedule_constraints_compute_schedule(sc);
    // isl_ast_build *build;
    // build = isl_ast_build_alloc(ctx);
    // isl_ast_node *tree;
    // isl_printer *p;

    // p = isl_printer_print_schedule(p,schedule);
    // p = isl_printer_to_file(ctx, stdout);
    // std::cout<<"p";
    // // expr t1 = k.get_upper();
    // // t1.get_data_type();

    // isl_printer_free(p);

    // isl_ast_node_free(tree);

    // isl_ctx_free(ctx);
    // cout<< "i.get_upper()"<<endl;
