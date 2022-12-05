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
    init("gemver");
    auto *fct = global::get_implicit_function();
    var i("i", 0 ,4096);
    var j("j", 0 ,4096);
    var k("k", 0 ,4096);
    placeholder A("A",{4096,4096},p_float32);
    placeholder u1("u1",{4096},p_float32);
    placeholder u2("u2",{4096},p_float32);
    placeholder v1("v1",{4096},p_float32);
    placeholder v2("v2",{4096},p_float32);
    placeholder x("x",{4096},p_float32);
    placeholder y("y",{4096},p_float32);
    placeholder z("z",{4096},p_float32);
    placeholder w("w",{4096},p_float32);
    constant alpha(1.6);
    constant beta(3.7);
    compute s_1("s_1",{i,j},A(i,j)+u1(i)*v1(j)+u2(i)*v2(j),A(i,j));
    compute s_2("s_2",{i,j},x(i)+beta*A(j,i)*y(j),x(i));
    compute s_3("s_3",{i},x(i)+z(i),x(i));
    compute s_4("s_4",{i,j},w(i)+alpha*A(i,j)*x(j),w(i));
    // s.interchange(i,j);
    s_2.after(s_1,-1);
    s_3.after(s_2,-1);
    s_4.after(s_3,-1);
    var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    // s_2.after(s_1,j);
    // s_3.after(s_1,-1);
    // s_1.tile(i,j,1,16,i0, j0,i1, j1);
    // s_2.tile(j,i,1,16,i0, j0,i1, j1);
    // s_4.tile(j,i,1,16,i0, j0,i1, j1);
    // s_2.after(s_1,j1);
    // s_1.unroll(j1,-1);
    // s_2.unroll(j1,-1);
    // s_4.unroll(j1,-1);
    // s_1.pipeline(i0,1);
    // s_2.pipeline(i0,1);
    // s_4.pipeline(i0,1);
    // A.partition({16,16},"cyclic");
    // u1.partition({16},"cyclic");
    // u2.partition({16},"cyclic");
    // w.partition({16},"cyclic");
    // x.partition({16},"cyclic");

    
    fct->auto_DSE("/home/POM/samples/gemver/");
    // codegen();
}
// C code:
//   for (i = 0; i < _PB_N; i++)
//     for (j = 0; j < _PB_N; j++)
//       A[i][j] = A[i][j] + u1[i] * v1[j] + u2[i] * v2[j];

//   for (i = 0; i < _PB_N; i++)
//     for (j = 0; j < _PB_N; j++)
//       x[i] = x[i] + beta * A[j][i] * y[j];

//   for (i = 0; i < _PB_N; i++)
//     x[i] = x[i] + z[i];

//   for (i = 0; i < _PB_N; i++)
//     for (j = 0; j < _PB_N; j++)
//       w[i] = w[i] +  alpha * A[i][j] * x[j];