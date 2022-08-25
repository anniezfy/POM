#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
int main(){
    init("jacobi_1d");
    auto *fct = global::get_implicit_function();
    var i("i", 1 ,1023);
    var j("j", 1 ,1023);
    var k("k", 0 ,1024);

    placeholder A("A",{1024},p_float32);
    placeholder B("B",{1024},p_float32);
    constant factor(0.33333);
    compute s_1("s_1",{k,i},(A(i-1)+A(i)+A(i+1))*factor,B(i));
    compute s_2("s_2",{k,i},(B(i-1)+B(i)+B(i+1))*factor,A(i));
    // compute s_2("s_2",{k,i},factor,A(i));
    s_2.after(s_1,k);
    // fct->auto_DSE("/home/POM/samples/sediel/");
    codegen();
    // fct->gen_c_code();
}

// C code:
// for (k = 0; t < 1024; k++){
//    for (i = 1; i < 1023; i++)
//       B(i) = 0.33333 * (A(i-1) + A(i) + A(i + 1));
//    for (i = 1; i < 1023; i++)
// 	     A(i) = 0.33333 * (B(i-1) + B(i) + B(i + 1));
// }