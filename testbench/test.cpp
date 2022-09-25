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
#include <variant>
#include <vector>
#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
// #include "mlir/IR/Attributes.h"
using namespace std;
using namespace polyfp;
int main(){
    init("test");
    auto *fct = global::get_implicit_function();
    var i("i", 1 ,4096);
    var j("j", 1 ,4096);
    var k("k", 0 ,4096);

    placeholder A("A",{4096,4096},p_float32);
    placeholder B("B",{4096},p_float32);
    constant factor(9);
    constant alpha(1.6);
    constant beta(3.7);

    // compute s_1("s_1",{k,i,j},(A(i-1,j-1)+A(i-1,j))*(A(i-1,j+1)+A(i,j-1)), A(i,j));
    compute s_1("s_1",{i,j},factor, A(i,j));
    compute s_2("s_2",{i,j,k},(A(i-1,j)+alpha)+(beta+A(i-1,j)), A(i,k));
    compute s_3("s_3",{i,j,k},(A(i-1,j)+alpha)+(beta+A(i-1,j)), A(i,j));
    compute s_4("s_4",{i},factor, B(i));
    compute s_5("s_5",{i,j,k},(A(i-1,j)+alpha)+(beta+A(i-1,j)), A(i,k));
    compute s_6("s_6",{i,j,k},(A(i-1,j)+alpha)+(beta+A(i-1,j)), A(i,j));
    s_2.after(s_1,i);
    s_3.after(s_2,j);
    s_4.after(s_3,i);
    s_5.after(s_1,-1);
    s_6.after(s_5,i);
    // for(auto &kv: s_1.iterators_location_map){
    //     std::cout<<kv.first+" ";
    //     std::cout<<kv.second<<std::endl;
    // }
    // for(auto &kv: s_2.iterators_location_map){
    //     std::cout<<kv.first+" ";
    //     std::cout<<kv.second<<std::endl;
    // }
    // for(auto &kv: s_3.iterators_location_map){
    //     std::cout<<kv.first+" ";
    //     std::cout<<kv.second<<std::endl;
    // }
    
    codegen();
    

    // fct->gen_c_code();
}