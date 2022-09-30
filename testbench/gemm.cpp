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
    auto *fct = global::get_implicit_function();
    var i("i", 0 ,4096);
    var j("j", 0 ,4096);
    var k("k", 0 ,4096);
    placeholder A("A",{4096,4096},p_float32);
    placeholder B("B",{4096,4096},p_float32);
    placeholder C("C",{4096,4096},p_float32);
    constant alpha(1.6);
    constant beta(3.7);
    // compute s_1("s_1",{i,j},C(i,j)*beta,C(i,j));
    compute s_1("s_1",{i,j},C(i,j)*beta,C(i,j));
    compute s_2("s_2",{i,j,k},C(i,j)+alpha*A(i,k)*B(k,j),C(i,j));
    var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    s_2.after(s_1,-1);
    // s_1.tile(i,j,k,8,8,16,i0, j0, k0, i1, j1,k1);
    // s_2.tile(i,j,k,8,1,16,i0, j0, k0, i1, j1,k1);
    // s_2.after(s_1,k1);
    // s_2.unroll(k1,-1);
    // s_2.unroll(j1,-1);
    // s_2.unroll(i1,-1);
    // s_2.pipeline(k0,1);
    // A.partition({16,8},"cyclic");
    // B.partition({8,1},"cyclic");
    // C.partition({16,1},"cyclic");
    //TODO:两个都是ijk，after k的时候有问题。

    
    fct->auto_DSE("/home/POM/samples/gemm/");
    // codegen();
}
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