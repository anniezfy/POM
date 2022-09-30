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
    init("gesummv");
    auto *fct = global::get_implicit_function();
    var i("i", 0 ,4096);
    var j("j", 0 ,4096);
    var k("k", 0 ,4096);
    placeholder temp("temp",{4096},p_float32);
    placeholder A("A",{4096,4096},p_float32);
    placeholder B("B",{4096,4096},p_float32);
    placeholder x("x",{4096},p_float32);
    placeholder y("y",{4096},p_float32);
    constant alpha(1.6);
    constant beta(3.7);
    compute s_1("s_1",{j,i},temp(i)+A(i,j)*x(j),temp(i));
    compute s_2("s_2",{j,i},y(i)+B(i,j)*x(j),y(i));
    compute s_3("s_3",{i},alpha*temp(i)+beta*y(i),y(i));
    // compute s_1("s_1",{i,j},alpha,temp(i));
    // compute s_2("s_2",{i,j},alpha,y(i));
    // compute s_3("s_3",{i},alpha,y(i));
    s_2.after(s_1,j);
    s_3.after(s_1,-1);
    // var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    // s_2.after(s_1,j);
    // s_3.after(s_1,-1);
    // s_1.tile(j,i,8,16,i0, j0,i1, j1);
    // s_2.tile(j,i,8,16,i0, j0,i1, j1);
    // s_2.after(s_1,j1);
    // s_1.unroll(j1,-1);
    // s_1.unroll(i1,-1);
    // s_1.pipeline(j0,1);
    // s_3.pipeline(i,1);
    // A.partition({16,8},"cyclic");
    // B.partition({16,8},"cyclic");
    // x.partition({8},"cyclic");
    // y.partition({16},"cyclic");
    // temp.partition({16},"cyclic");

    
    fct->auto_DSE("/home/POM/samples/gesummv/");
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