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
    init("gemm");
    auto fct = global::get_implicit_function();
    // The DSL described algorithm
    var t("t", 0 ,32);    
    var i("i", 0 ,32);
    placeholder m("m",{32},p_float32);
    placeholder n("n",{32},p_float32);
    placeholder k("k",{32},p_float32);
    constant temp(1.0);
    constant alpha(2.0);
    compute S1("S1", {t,i}, temp, m(i));
    compute S2("S2", {t,i}, m(i)*alpha, n(i));
    compute S3("S3", {t,i}, k(i)+n(i), k(i));
    S2.after(S1,t);
    S3.after(S1,-1);
    // ① Loop transformations
    var i0("i0"),j0("j0"),i1("i1"),j1("j1");
    S1.tile(t, i, 1, 8, j0, i0, j1, i1);
    // ② Hardware optimizations
    S3.pipeline(i,1);
    S1.unroll(i1,-1);
    // m.partition({8},"cyclic");
    

// // The DSL described algorithm
// var t("t", 0 ,32);    
// var i("i", 0 ,32);
// compute S1("S1", {t,i}, temp, M(i));
// compute S2("S2", {t,i}, M(i)*alpha, N(i));
// compute S3("S3", {i,t}, K(i)+N(i), K(i));
// // ① Loop transformations
// var i0("i0"),t0("t0"),i1("i1"),t1("t1");
// S3.interchange(i,t);
// S1.tile(t, i, 1, 8, t0, i0, t1, i1);
// // ② Hardware optimizations
// S3.pipeline(i0,1);
// // ③ Scheduling order
// S2.after(S1,t);
// S3.after(S1,-1);

    
    // fct->auto_DSE("/home/POM/samples/gemm/");
    codegen();

}
// ../scalehls/build/bin/scalehls-opt ../ablation/gemm/gemm.mlir\
//     --scalehls-func-preprocess="top-func=gemm" \
//     --scalehls-qor-estimation="target-spec=../samples/config.json" \
//     | ../scalehls/build/bin/scalehls-translate -emit-hlscpp >  ../ablation/gemm/gemm_LI_LP.cpp
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
// }    //TODO:两个都是ijk，after k的时候有问题。

affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 4 {
        affine.store %arg0, %arg3[%arg6 * 8] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 1] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 2] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 3] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 4] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 5] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 6] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 7] : memref<32xf32>
      } {parallel}
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg3[%arg6] : memref<32xf32>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg4[%arg6] : memref<32xf32>
      } {parallel}
    }
    affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg2[%arg6] : memref<32xf32>
        %1 = affine.load %arg4[%arg6] : memref<32xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg2[%arg6] : memref<32xf32>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}