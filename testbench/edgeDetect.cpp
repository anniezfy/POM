#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
int main(){
    init("edgeDetect");
    auto *fct = global::get_implicit_function();
    var i("i", 0 ,4094);
    var j("j", 0 ,4094);
    // var j("j", 1 ,4095);
    var c("c", 0 ,3);

    placeholder temp("temp",{4096,4096,3},p_float32);
    placeholder src("src",{4096,4096,3},p_float32);
    placeholder out("out",{4096,4096,3},p_float32);
    constant factor(8.0);
    
    compute s_1("s_1",{i,j,c},(src(i,j,c)+src(i,j+1,c)+src(i,j+2,c)+src(i+1,j,c)+src(i+1,j+2,c)+
                               src(i+2,j,c)+src(i+2,j+1,c)+src(i+2,j+2,c))/factor,temp(i,j,c));
    compute s_2("s_2",{i,j,c},temp(i+1,j+1,c)-temp(i+2,j,c)+temp(i+2,j+1,c)-temp(i+1,j,c),out(i,j,c));
    s_2.after(s_1,-1);

    // for (int i = 0; i < rows - 2; i++) {
    //     for (int j = 0; j < cols - 2; j++) {
    //         for (int c = 0; c < 3; c++) {
    //             temp[i][j][c] = (src[i][j][c]   + src[i][j+1][c]   + src[i][j+2][c]+
    //                              src[i+1][j][c]                    + src[i+1][j+2][c]+
    //                              src[i+2][j][c] + src[i+2][j+1][c] + src[i+2][j+2][c])/((unsigned char) 8);
    //         }
    //     }
    // }
    // for (int i = 0; i < rows - 2; i++) {
    //     for (int j = 0; j < cols - 2; j++) {
    //         for (int c = 0; c < 3; c++) {
    //             out[i][j][c] = (temp[i+1][j+1][c]-temp[i+2][j][c]) + (temp[i+2][j+1][c]-temp[i+1][j][c]);
    //         }
    //     }
    // }




    var i0("i0"), j0("j0"),k0("k0"), i1("i1"), j1("j1"),k1("k1");
    // s_1.unroll(j1,23);
    // s_1.tile(i,j,c,2,2,1,i0, j0, k0, i1, j1,k1);
    // s_2.tile(i,j,c,2,2,1,i0, j0, k0, i1, j1,k1);
    // s_2.skew(k,i,1,1,i0,j0);
    
    // s_1.tile(k,i,1,28,i0,j0,i1, j1);
    // s_2.tile(k,i,1,23,i0,j0,i1, j1);
    // s_1.unroll(j1,23);
    // s_2.unroll(j1,23);
    // s_2.after(s_1,k);

    fct->auto_DSE("/home/POM/samples/edgeDetect/");
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