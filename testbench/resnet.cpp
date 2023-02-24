#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
#define K 4 // Size of convolution filter ( FOut xFIn x K x K)
#define N 32 // DATA_SET
int main(){
    init("resnet");
    

    auto *fct = global::get_implicit_function();
    // var batch_size("batch_size", 0 ,32); //batch_size
    var n("n", 0 ,2);
    var f("f", 0 ,64);
    var y("y", 0 ,32); 
    var x("x", 0 ,32); 
    var fz("fz", 0 ,3);
    var fy("fy", 0 ,3);
    var fx("fx", 0 ,3);
    placeholder filter("filter",{64,3,3,3},p_float32);
    placeholder conv("conv",{2,64,32,32},p_float32);//{0,64,32,32}
    placeholder input("input",{2,3,34,34},p_float32);
    // placeholder bias("bias",{16},p_float32);
    constant scalar(0,p_float32);
    var f1("f1", 0 ,64);
    var y1("y1", 0 ,32); 
    var x1("x1", 0 ,32); 
    var fz1("fz1", 0 ,64);
    var fy1("fy1", 0 ,3);
    var fx1("fx1", 0 ,3);
    placeholder filter1("filter1",{64,64,3,3},p_float32);
    placeholder conv1("conv1",{2,64,32,32},p_float32);
    placeholder relu1("relu1",{2,64,32,32},p_float32);
    
    // compute s_1("s_1",{n,f,y,x},scalar,conv(n,f,y,x));
    compute s_1("s_1",{n,f,y,x,fz,fy,fx},conv(n,f,y,x)+filter(f,fz,fy,fx)*input(n,fz,y+fy,x+fx),conv(n,f,y,x));
    compute s_2("s_2",{n,f1,y1,x1,fz1,fy1,fx1},conv1(n,f1,y1,x1)+filter1(f1,fz1,fy1,fx1)*conv(n,fz1,y1+fy1,x1+fx1),conv1(n,f1,y1,x1));
    s_2.after(s_1,-1);


    fct->auto_DSE("/home/POM/samples/resnet/");
    // fct->-auto_DSE_loop_transformation();
    // codegen();
    // fct->gen_c_code();
}

