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
    placeholder D("D",{4096,4096},p_float32);
    placeholder E("E",{4096,4096},p_float32);
    constant alpha(1.6);
    constant beta(3.7);


    // compute s_1("s_1",{i,j,k},beta,A(i,j));
    // compute s_2("s_2",{i,j,k},alpha*A(i,k),C(i,j));

    // compute s_3("s_3",{i,j,k},C(i,j)*beta,B(i,j));
    // compute s_1("s_1",{i,j},C(i,j)*beta,C(i,j));
    // compute s_2("s_2",{i,j},C(i,j)*beta,C(i,j));
    // compute s_2("s_2",{i,j,k},C(i,j)+alpha*A(i,k)*B(k,j),C(i,j));
    compute s_1("s_1",{i,j},beta,A(i,j));
    // compute s_1_1("s_1_1",{i,j},beta,E(i,j));
    // compute s_2("s_2",{i,j},A(i,j)+A(i,j),B(i,j));
    compute s_3("s_3",{i,j},C(i,j)+alpha,B(i,j));
    // compute s_3("s_3",{i,j},B(i,j)*beta,C(i,j));
    // compute s_4("s_4",{i,j},C(i,j)+E(i,j),D(i,j));
    // s_2.get_expr().get_access_vector();

    // s_1_1.after(s_1,j);
    // s_2.after(s_1,j);
    s_3.after(s_1,-1);
    // s_4.after(s_3,-1);

    // s_4.tile(i,j,1,4);
    
    // s_4.pipeline(k,1);
    s_1.pipeline(j,1);
    // s_2.pipeline(k,1);
    // // A.partition({1,6},"cyclic");

    // A.partition({4,4},"cyclic");
    // s_2.after(s_1,-1);
    // fct->auto_DSE("/home/POW/samples/gemm/");
    
    codegen();
    

    // fct->gen_c_code();
}