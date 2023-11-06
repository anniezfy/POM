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
    init("2mm_8192");

    auto *fct = global::get_implicit_function();
    var i("i", 0 ,8192);
    var j("j", 0 ,8192);
    var k("k", 0 ,8192);
    placeholder A("A",{8192,8192},p_float32);
    placeholder B("B",{8192,8192},p_float32);
    placeholder C("C",{8192,8192},p_float32);
    placeholder D("D",{8192,8192},p_float32);
    placeholder temp("temp",{8192,8192},p_float32);
    constant alpha(1.6);
    constant beta(3.7);
    constant scalar(3.7);
    compute s_1("s_1",{i,j},scalar,temp(i,j));
    compute s_2("s_2",{i,j,k},temp(i,j)+alpha*A(i,k)*B(k,j),temp(i,j));
    compute s_3("s_3",{i,j},D(i,j)*beta,D(i,j));
    compute s_4("s_4",{i,j,k},D(i,j)+temp(i,k)*C(k,j),D(i,j));
    s_2.after(s_1,-1);
    s_3.after(s_2,-1);
    s_4.after(s_3,-1);
    // var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    // s_2.tile(k,i,j,1,2,16,i0, j0, k0, i1, j1,k1);
    // s_4.tile(k,j,i,1,2,16,i0, j0, k0, i1, j1,k1);
    // s_2.unroll(k1,-1);
    // s_2.unroll(j1,-1);
    // s_2.unroll(i1,-1);
    // s_4.unroll(k1,-1);
    // s_4.unroll(j1,-1);
    // s_4.unroll(i1,-1);
    // s_1.pipeline(j,1);
    // s_1.pipeline(j,1);
    // s_2.pipeline(j,1);
    // s_3.pipeline(j,1);
    // s_4.pipeline(j,1);
    // A.partition({16,1},"cyclic");
    // B.partition({1,2},"cyclic");
    // C.partition({1,2},"cyclic");
    // D.partition({16,2},"cyclic");
    // temp.partition({16,2},"cyclic");
    // fct->auto_DSE_loop_transformation();
    // int count=0;
    // for(auto &comp: fct->leader_computations){
    //     auto iterators = comp->get_iteration_variables();
    //     int size = iterators.size();
    //     if(size>=3){
    //       // std::cout<< "comp->final_strategy.size()"<<std::endl;
    //       comp->apply_opt_strategy({1,16,16});
    //     }
    //     if(size==2){
    //       // std::cout<< "comp->final_strategy.size()"<<std::endl;
    //       if(count!=0){
    //           comp->apply_opt_strategy({1,8,16});
    //           count+=1;
    //       }
    //       count+=1;
          
    //     }
    // }
    // fct->dump_schedule("/home/POM/sample_l/2mm/");
    fct->auto_DSE("/home/POM/samples/2mm/");
    // codegen();
}
// ../scalehls/build/bin/scalehls-opt ../ablation/2mm/2mm.mlir\
//     --scalehls-func-preprocess="top-func=2mm" \
//     --scalehls-qor-estimation="target-spec=../samples/config.json" \
//     | ../scalehls/build/bin/scalehls-translate -emit-hlscpp >  ../ablation/2mm/2mm_LI_LP.cpp
// C code:
// for (int i = 0; i < N; i++) {
//   for (int j = 0; j < N; j++) {
//     C[i][j] *= beta;
//   }
// }
// for (int i = 0; i < N; i++) {
//   for (int j = 0; j < N; j++) {
//     for (int k = 0; k < N; k++) {
//       C[i][j] += alpha * A[i][k] * B[k][j];
//     }
//   }
// }
