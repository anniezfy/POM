#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
int main(){
    init("blur");
    auto *fct = global::get_implicit_function();
    var i("i", 0 ,4094);
    var j("j", 0 ,4094);
    // var j("j", 1 ,4095);
    var k("k", 0 ,4096);

    placeholder A("A",{4096,4096},p_float32);
    placeholder B("B",{4096,4096},p_float32);
    placeholder C("C",{4096,4096},p_float32);
    constant factor(3.0);
    
    compute s_1("s_1",{k,i,j},(A(i,j)+A(i,j+1)+A(i,j+2))/factor,B(i,j));
    compute s_2("s_2",{k,i,j},(B(i,j)+B(i+1,j)+B(i+2,j))/factor,C(i,j));
    var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    // s_2.tile(k,j,i,1,2,16,i0, j0, k0, i1, j1,k1);
    // s_2.skew(k,i,1,1,i0,j0);
    
    // s_1.tile(k,i,1,28,i0,j0,i1, j1);
    // s_2.tile(k,i,1,23,i0,j0,i1, j1);
    // s_1.unroll(j1,23);
    // s_2.unroll(j1,23);
    s_2.after(s_1,-1);

    fct->auto_DSE("/home/POM/samples/blur/");
    // codegen();
    // fct->gen_c_code();
}

// C code:
// for (k = 0; t < 1024; k++){
//    for (i = 1; i < 1023; i++)
//       B(i) = 0.33333 * (A(i-1) + A(i) + A(i + 1));
//    for (i = 1; i < 1023; i++)
// 	     A(i) = 0.33333 * (B(i-1) + B(i) + B(i + 1));
// }