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
    init("sediel");
    auto *fct = global::get_implicit_function();
    var i("i", 1 ,4096);
    var j("j", 1 ,4096);
    var k("k", 0 ,4096);

    placeholder A("A",{4096,4096},p_float32);
    constant factor(9);
    // constant beta(3.7);
   //  expr = A(i-1,j+1)+A(i,j-1)
    compute s_1("s_1",{k,i,j},(A(i-1,j-1)+A(i-1,j)+A(i-1,j+1)+A(i,j-1)+A(i,j)+A(i,j+1)+A(i+1,j-1)+A(i+1,j)+A(i+1,j+1))*factor, A(i,j));
    // s_4.interchange(j,k);
    // compute s_1("s_1",{i,j},beta,A(i,j));
    // compute s_1_1("s_1_1",{i,j},beta,E(i,j));
    // compute s_2("s_2",{i,j},alpha*A(i,k),B(i,j));
    // compute s_3("s_3",{i,j},B(i,j)*beta,C(i,j));
    // compute s_4("s_4",{i,j},C(i,j)+E(i,j),D(i,j));
    // s_2.get_expr().get_access_vector();

    // s_1_1.after(s_1,j);
    // s_2.after(s_1,-1);
    // s_3.after(s_2,-1);
    // s_4.after(s_3,-1);

    // s_4.tile(i,j,1,4);
    
    // s_4.pipeline(k,1);
    // s_2.pipeline(j,1);
    // // A.partition({1,6},"cyclic");

    // A.partition({4,4},"cyclic");
    // s_2.after(s_1,j);
    fct->auto_DSE("/home/jason/Hopemples/gemm/");
    
    codegen();
    

    // fct->gen_c_code();
}