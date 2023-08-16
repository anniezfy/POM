#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
int main(){
    init("bicg");
    auto *fct = global::get_implicit_function();
    var i("i", 0 ,4096);
    var j("j", 0 ,4096);

    placeholder A("A",{4096,4096},p_float32);
    placeholder s("s",{4096},p_float32);
    placeholder q("q",{4096},p_float32);
    placeholder p("p",{4096},p_float32);
    placeholder r("r",{4096},p_float32);


    compute s_1("s_1",{i,j},s(j)+A(i,j)*r(i),s(j));
    // compute s_2("s_2",{i,j},q(i)+A(i,j)*p(j),q(i));
    compute s_2("s_2",{i,j},q(j)+A(j,i)*p(i),q(j));
    // s_2.interchange(i,j);
    s_2.after(s_1,j);

    var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    // s_1.tile(i,j,1,32,i0, j0, i1, j1);
    // s_2.tile(i,j,1,32,i0, j0, i1, j1);
    // s_1.unroll(j1,-1);
    // s_2.unroll(j1,-1);
    // s_2.after(s_1,j1);
    // s_1.pipeline(j,1);
    // s.partition({32},"cyclic");
    // q.partition({32},"cyclic");
    // A.partition({16,32},"cyclic");

    
    fct->auto_DSE("/home/POM/samples/bicg/");
    // codegen();
    
    
    // fct->gen_c_code();
}
// ../scalehls/build/bin/scalehls-opt ../ablation/bicg/bicg.mlir\
//     --scalehls-func-preprocess="top-func=bicg" \
//     --scalehls-qor-estimation="target-spec=../samples/config.json" \
//     | ../scalehls/build/bin/scalehls-translate -emit-hlscpp >  ../ablation/bicg/bicg_LS_LI_LF_LP.cpp
// C code:
// for (int i = 0; i < N; i += 1) {
//     for (int j = 0; j < N; j += 1) {
//       s[j] += A[i][j] * r[i];
//       q[i] += A[i][j] * p[j];
//     }
// }