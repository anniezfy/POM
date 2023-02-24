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
    var c("c", 0 ,3);

    placeholder bx("bx",{4096,4096,3},p_float32);
    placeholder by("by",{4096,4096,3},p_float32);
    placeholder in("in",{4096,4096,3},p_float32);
    constant factor(3.0);
    
    compute s_1("s_1",{i,j,c},(in(i,j,c)+in(i,j+1,c)+in(i,j+2,c))/factor,bx(i,j,c));
    compute s_2("s_2",{i,j,c},(bx(i,j,c)+bx(i+1,j,c)+bx(i+2,j,c))/factor,by(i,j,c));
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
//     Var i(0, N-2), j(0, M-2), c(0, 3);

//     Computation bx(i, j, c), by(i, j, c);

//     bx(i,j,c) = (in(i,j,c)+in(i,j+1,c)+in(i,j+2,c))/3;
//     by(i,j,c) = (bx(i,j,c)+bx(i+1,j,c)+bx(i+2,j,c))/3);
    
// C code:
// for (i = 0; i < 4094; i++){
//     for (j = 0; j < 4094; j++)
//         for (c = 0; c < 3; c++)
//       bx[i][j][c] = (in[i][j][c]+in[i][j+1][c]+in[i][j+2][c])/3.0;
// }
// for (i = 0; i < 4094; i++){
//     for (j = 0; j < 4094; j++)
//         for (c = 0; c < 3; c++)
//       by[i][j][c] = (bx[i][j][c]+bx[i+1][j][c]+bx[i+2][j][c])/3.0;
// }