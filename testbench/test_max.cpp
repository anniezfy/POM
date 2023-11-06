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
    init("test_max");
    auto *fct = global::get_implicit_function();
    var i("i", 0 ,32);
    var j("j", 0 ,64);
    var t("t", 0 ,128);
    placeholder m("m",{32},p_float32);
    placeholder n("n",{32},p_float32);
    constant scalar(0);
    constant temp(0);
    constant beta(0);

    compute S1("S1", {t,i}, temp*beta, m(i));
    compute S2("S2", {t,i}, p_max(temp,beta), m(i));
    
    compute S3("S3", {t,i}, p_max(m(i+t),n(i*2+t)), n(i));
    // compute S3("S3", {i,i}, m(i)*beta, n(i));
    var i0("i0"), j0("j0"),i1("i1"), j1("j1"),k0("k0"),k1("k1");
    S2.after(S1,-1);
    S3.after(S2,-1);
    codegen();
}
// C code:
  /* E := A*B */
//   for (i = 0; i < _PB_NI; i++)
//     for (j = 0; j < _PB_NJ; j++)
//       {
// 	E[i][j] = SCALAR_VAL(0.0);
// 	for (k = 0; k < _PB_NK; ++k)
// 	  E[i][j] += A[i][k] * B[k][j];
//       }
//   /* F := C*D */
//   for (i = 0; i < _PB_NJ; i++)
//     for (j = 0; j < _PB_NL; j++)
//       {
// 	F[i][j] = SCALAR_VAL(0.0);
// 	for (k = 0; k < _PB_NM; ++k)
// 	  F[i][j] += C[i][k] * D[k][j];
//       }
//   /* G := E*F */
//   for (i = 0; i < _PB_NI; i++)
//     for (j = 0; j < _PB_NL; j++)
//       {
// 	G[i][j] = SCALAR_VAL(0.0);
// 	for (k = 0; k < _PB_NJ; ++k)
// 	  G[i][j] += E[i][k] * F[k][j];
//       }