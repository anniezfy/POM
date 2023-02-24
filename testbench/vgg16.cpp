#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
#define K 4 // Size of convolution filter ( FOut xFIn x K x K)
#define N 32 // DATA_SET
int main(){
    init("vgg16");
    auto *fct = global::get_implicit_function();
    var f("f", 0 ,64);
    var y("y", 0 ,32); 
    var x("x", 0 ,32); 
    var fz("fz", 0 ,3);
    var fy("fy", 0 ,3);
    var fx("fx", 0 ,3);
    var m("m", 0 ,34); 
    var n("n", 0 ,34);
    placeholder filter("filter",{64,3,3,3},p_float32);
    placeholder conv("conv",{64,32,32,32},p_float32);//{0,64,32,32}
    placeholder input("input",{3,34,34},p_float32);
    placeholder temp("temp",{3,32,32},p_float32);
    placeholder relu("relu",{64,32,32},p_float32);
    placeholder input1("input1",{64,34,34},p_float32);

    for (int n = 0; n < 2; n++) {
      for (int f = 0; f < FOut; f++) {
        for (int y = 0; y < N; y++) {
          for (int x = 0; x < N; x++) {
            rconv[n][f][y][x] = bias[f];
          }
        }
      }
    }
    for (int n = 0; n < BATCH_SIZE; n++) {
      for (int f = 0; f < FOut; f++) {
        for (int y = 0; y < N; y++) {
          for (int x = 0; x < N; x++) {
            for (int fz = 0; fz < FIn; fz++) {
              for (int fy = 0; fy < pK; fy++) {
                for (int fx = 0; fx < pK; fx++) {
                  rconv[n][f][y][x] += filters[f][fz][fy][fx] * inputs[n][fz][y + fy][x + fx];
                }
              }
            }

          }
        }
      }
    }
    
    constant scalar(0,p_float32);
    // omit initialisation of input and filter
    compute s_1("s_1",{f,m,n},scalar,input(fz,m,n));
    compute s_2("s_2",{f,y,x},temp(f,y,x),input(fz,y+1,x+1));
    compute s_3("s_3",{f,y,x,fx},scalar,conv(f,y,x,fx));
    compute s_4("s_4",{f,y,x,fz,fy,fx},conv(f,y,x,fx)+filter(f,fz,fy,fx)*input(fz,y+fy,x+fx),conv(f,y,x,fx));
    // compute s_5("s_5",{f,y,x},conv(f,y,x),relu(f,y,x));
    s_2.after(s_1,-1);
    s_3.after(s_2,-1);
    s_4.after(s_3,-1);
    // s_5.after(s_4,-1);
    codegen();
    fct->gen_c_code();
    // fct->auto_DSE("/home/POM/samples/vgg16/");
}