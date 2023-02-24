#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
int main(){
    init("gaussian");
    auto *fct = global::get_implicit_function();
    var q("q", 0 ,4089);
    var w("w", 0 ,4089);
    // var j("j", 1 ,4095);
    // var cc("cc", 0 ,3);
    // var r("r", 0 ,5);
    var cc("cc", 0 ,3);
    var r("r", 0 ,7);
    var e("e", 0 ,7);

    placeholder temp("temp",{4096,4096,3},p_float32);
    placeholder src("src",{4096,4096,3},p_float32);
    placeholder conv("conv",{4096,4096,3},p_float32);
    placeholder kernelX("kernelX",{7},p_float32);
    placeholder kernelY("kernelY",{7},p_float32);
    constant scalar(0);
    
    compute s_1("s_1",{q,w,cc},scalar,temp(q,w,cc));
    compute s_2("s_2",{q,w,cc},scalar,conv(q,w,cc));
    compute s_3("s_3",{q,w,cc,r},temp(q,w,cc)+src(q + r,w,cc)*kernelX(r),temp(q,w,cc));
    compute s_4("s_4",{q,w,cc,e},conv(q,w,cc)+temp(q,w+e,cc)*kernelY(e),conv(q,w,cc));
    s_2.after(s_1,cc);
    s_3.after(s_1,-1);
    s_4.after(s_3,-1);

    // compute s_3("s_1",{q,w,cc},scalar,temp(q,w,cc));
    // compute s_4("s_2",{q,w,cc,r},temp(q,w,cc)+src(q + r,w,cc)*kernelX(r),temp(q,w,cc));

    // for (int q = 0; q < rows - 7; q++) {
    //     for (int w = 0; w < cols - 7; w++) {
    //         for (int cc = 0; cc < 3; cc++) {
    //             temp[q][w][cc] = 0;
    //             for (int r = 0; r < 7; r++) {
    //                 temp[q][w][cc] += src[q + r][w][cc] * kernelX[r];
    //             }
    //         }
    //     }
    // }
    // for (int q = 0; q < rows - 7; q++) {
    //     for (int w = 0; w < cols - 7; w++) {
    //         for (int cc = 0; cc < 3; cc++) {
    //             conv[q][w][cc] = 0;
    //             for (int e = 0; e < 7; e++) {
    //                 conv[q][w][cc] += temp[q][w + e][cc] * kernelY[e];
    //             }
    //         }
    //     }
    // }



    var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    // s_1.unroll(j1,23);
    // s_1.tile(i,j,c,2,2,1,i0, j0, k0, i1, j1,k1);
    // s_2.tile(w,cc,r,2,2,8,i0, j0, k0, i1, j1,k1);
    // s_2.skew(k,i,1,1,i0,j0);
    
    // s_1.tile(k,i,1,28,i0,j0,i1, j1);
    // s_2.tile(k,i,1,23,i0,j0,i1, j1);
    // s_1.unroll(j1,23);
    // s_2.unroll(j1,23);
    // s_2.after(s_1,k);

    fct->auto_DSE("/home/POM/samples/gaussian/");
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