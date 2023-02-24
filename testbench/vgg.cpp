#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;
#define K 4 // Size of convolution filter ( FOut xFIn x K x K)
#define N 32 // DATA_SET
int main(){
    init("vgg");
    

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
    placeholder relu("relu",{2,64,32,32},p_float32);
    placeholder input1("input1",{2,64,34,34},p_float32);
    constant scalar(0,p_float32);
    
    compute s_1("s_1",{n,f,y,x},scalar,conv(n,f,y,x));
    compute s_2("s_2",{n,f,y,x,fz,fy,fx},conv(n,f,y,x)+filter(f,fz,fy,fx)*input(n,fz,y+fy,x+fx),conv(n,f,y,x));
    compute s_3("s_3",{n,f,y,x},conv(n,f,y,x),relu(n,f,y,x));
    s_2.after(s_1,-1);
    s_3.after(s_2,-1);

  



    var f1("f1", 0 ,64);
    var y1("y1", 0 ,16); 
    var x1("x1", 0 ,16); 
    var fz1("fz1", 0 ,64);
    var fy1("fy1", 0 ,3);
    var fx1("fx1", 0 ,3);
    placeholder filter1("filter1",{64,64,3,3},p_float32);
    placeholder conv1("conv1",{2,64,16,16},p_float32);
    placeholder relu1("relu1",{2,64,16,16},p_float32);
    placeholder input2("input2",{2,64,18,18},p_float32);

    compute s_5("s_5",{n,f1,y1,x1},scalar,conv1(n,f1,y1,x1));
    compute s_6("s_6",{n,f1,y1,x1,fz1,fy1,fx1},conv1(n,f1,y1,x1)+filter1(f1,fz1,fy1,fx1)*relu(n,fz1,y1*2+fy1,x1*2+fx1),conv1(n,f1,y1,x1));
    compute s_7("s_7",{n,f1,y1,x1},conv1(n,f1,y1,x1),relu1(n,f1,y1,x1));

    s_5.after(s_3,-1);
    s_6.after(s_5,-1);
    s_7.after(s_6,-1);

    var f2("f2", 0 ,128);
    var y2("y2", 0 ,16); 
    var x2("x2", 0 ,16); 
    var fz2("fz2", 0 ,64);
    var fy2("fy2", 0 ,3);
    var fx2("fx2", 0 ,3);
    // placeholder filter2("filter2",{128,64,3,3},p_float32);
    placeholder rpool("rpool",{2,128,16,16},p_float32);
    placeholder relu2("relu2",{2,128,16,16},p_float32);
    // placeholder input3("input3",{2,128,18,18},p_float32);
    compute s_9("s_9",{n,f2,y2,x2},scalar,rpool(n,f2,y2,x2));
    compute s_10("s_10",{n,f2,y2,x2,fz2,fy2,fx2},relu1(n,fz2,y2+fy2,x2+fx2),rpool(n,f2,y2,x2));
    s_9.after(s_7,-1);
    s_10.after(s_9,-1);


    // var f3("f3", 0 ,128);
    // var y3("y3", 0 ,8); 
    // var x3("x3", 0 ,8); 
    // var fz3("fz3", 0 ,128);
    // var fy3("fy3", 0 ,3);
    // var fx3("fx3", 0 ,3);
    // placeholder filter3("filter3",{128,128,3,3},p_float32);
    // placeholder conv3("conv3",{2,128,8,8},p_float32);
    // placeholder relu3("relu3",{2,128,8,8},p_float32);
    // placeholder input4("input4",{2,128,10,10},p_float32);
    // compute s_13("s_13",{n,f3,y3,x3},scalar,conv3(n,f3,y3,x3));
    // compute s_14("s_14",{n,f3,y3,x3,fz3,fy3,fx3},conv3(n,f3,y3,x3)+filter3(f3,fz3,fy3,fx3)*input3(n,fz3,y3*2+fy3,x3*2+fx3),conv3(n,f3,y3,x3));
    // compute s_15("s_15",{n,f3,y3,x3},conv3(n,f3,y3,x3),relu3(n,f3,y3,x3));
    // compute s_16("s_16",{n,f3,y3,x3},relu3(n,f3,y3,x3),input4(n,f3,y3+1,x3+1));
    // s_13.after(s_12,-1);
    // s_14.after(s_13,-1);
    // s_15.after(s_14,-1);
    // s_16.after(s_15,-1);

    // var f4("f4", 0 ,256);//419
    // var y4("y4", 0 ,8); 
    // var x4("x4", 0 ,8); 
    // var fz4("fz4", 0 ,128);
    // var fy4("fy4", 0 ,3);
    // var fx4("fx4", 0 ,3);
    // placeholder filter4("filter4",{256,128,3,3},p_float32);
    // placeholder conv4("conv4",{2,256,8,8},p_float32);
    // placeholder relu4("relu4",{2,256,8,8},p_float32);
    // placeholder input5("input5",{2,256,10,10},p_float32);
    // compute s_17("s_17",{n,f4,y4,x4},scalar,conv4(n,f4,y4,x4));
    // compute s_18("s_18",{n,f4,y4,x4,fz4,fy4,fx4},conv4(n,f4,y4,x4)+filter4(f4,fz4,fy4,fx4)*input4(n,fz4,y4+fy4,x4+fx4),conv4(n,f4,y4,x4));
    // compute s_19("s_19",{n,f4,y4,x4},conv4(n,f4,y4,x4),relu4(n,f4,y4,x4));
    // compute s_20("s_20",{n,f4,y4,x4},relu4(n,f4,y4,x4),input5(n,f4,y4+1,x4+1));
    // s_17.after(s_16,-1);
    // s_18.after(s_17,-1);
    // s_19.after(s_18,-1);
    // s_20.after(s_19,-1);

    // var f5("f5", 0 ,256);//467
    // var y5("y5", 0 ,8); 
    // var x5("x5", 0 ,8); 
    // var fz5("fz5", 0 ,256);
    // var fy5("fy5", 0 ,3);
    // var fx5("fx5", 0 ,3);
    // placeholder filter5("filter5",{256,256,3,3},p_float32);
    // placeholder conv5("conv5",{2,256,8,8},p_float32);
    // placeholder relu5("relu5",{2,256,8,8},p_float32);
    // placeholder input6("input6",{2,256,10,10},p_float32);
    // compute s_21("s_21",{n,f5,y5,x5},scalar,conv5(n,f5,y5,x5));
    // compute s_22("s_22",{n,f5,y5,x5,fz5,fy5,fx5},conv5(n,f5,y5,x5)+filter5(f5,fz5,fy5,fx5)*input5(n,fz5,y5+fy5,x5+fx5),conv5(n,f5,y5,x5));
    // compute s_23("s_23",{n,f5,y5,x5},conv5(n,f5,y5,x5),relu5(n,f5,y5,x5));
    // compute s_24("s_24",{n,f5,y5,x5},relu5(n,f5,y5,x5),input6(n,f5,y5+1,x5+1));
    // s_21.after(s_20,-1);
    // s_22.after(s_21,-1);
    // s_23.after(s_22,-1);
    // s_24.after(s_23,-1);

    // var f6("f6", 0 ,256);//515
    // var y6("y6", 0 ,4); 
    // var x6("x6", 0 ,4); 
    // var fz6("fz6", 0 ,256);
    // var fy6("fy6", 0 ,3);
    // var fx6("fx6", 0 ,3);
    // placeholder filter6("filter6",{256,256,3,3},p_float32);
    // placeholder conv6("conv6",{2,256,4,4},p_float32);
    // placeholder relu6("relu6",{2,256,4,4},p_float32);
    // placeholder input7("input7",{2,256,6,6},p_float32);
    // compute s_25("s_25",{n,f6,y6,x6},scalar,conv6(n,f6,y6,x6));
    // compute s_26("s_26",{n,f6,y6,x6,fz6,fy6,fx6},conv6(n,f6,y6,x6)+filter6(f6,fz6,fy6,fx6)*input6(n,fz6,y6*2+fy6,x6*2+fx6),conv6(n,f6,y6,x6));
    // compute s_27("s_27",{n,f6,y6,x6},conv6(n,f6,y6,x6),relu6(n,f6,y6,x6));
    // compute s_28("s_28",{n,f6,y6,x6},relu6(n,f6,y6,x6),input7(n,f6,y6+1,x6+1));
    // s_25.after(s_24,-1);
    // s_26.after(s_25,-1);
    // s_27.after(s_26,-1);
    // s_28.after(s_27,-1);

    // var f7("f7", 0 ,512);//563
    // var y7("y7", 0 ,4); 
    // var x7("x7", 0 ,4); 
    // var fz7("fz7", 0 ,256);
    // var fy7("fy7", 0 ,3);
    // var fx7("fx7", 0 ,3);
    // placeholder filter7("filter7",{512,256,3,3},p_float32);
    // placeholder conv7("conv7",{2,512,4,4},p_float32);
    // placeholder relu7("relu7",{2,512,4,4},p_float32);
    // placeholder input8("input8",{2,512,6,6},p_float32);
    // compute s_29("s_29",{n,f7,y7,x7},scalar,conv7(n,f7,y7,x7));
    // compute s_30("s_30",{n,f7,y7,x7,fz7,fy7,fx7},conv7(n,f7,y7,x7)+filter7(f7,fz7,fy7,fx7)*input7(n,fz7,y7+fy7,x7+fx7),conv7(n,f7,y7,x7));
    // compute s_31("s_31",{n,f7,y7,x7},conv7(n,f7,y7,x7),relu7(n,f7,y7,x7));
    // compute s_32("s_32",{n,f7,y7,x7},relu7(n,f7,y7,x7),input8(n,f7,y7+1,x7+1));
    // s_29.after(s_28,-1);
    // s_30.after(s_29,-1);
    // s_31.after(s_30,-1);
    // s_32.after(s_31,-1);

    // var f8("f8", 0 ,512);//611
    // var y8("y8", 0 ,4); 
    // var x8("x8", 0 ,4); 
    // var fz8("fz8", 0 ,512);
    // var fy8("fy8", 0 ,3);
    // var fx8("fx8", 0 ,3);
    // placeholder filter8("filter8",{512,512,3,3},p_float32);
    // placeholder conv8("conv8",{2,512,4,4},p_float32);
    // placeholder input9("input9",{2,512,6,6},p_float32);
    // placeholder relu8("relu8",{2,512,4,4},p_float32);
    // compute s_33("s_33",{n,f8,y8,x8},scalar,conv8(n,f8,y8,x8));
    // compute s_34("s_34",{n,f8,y8,x8,fz8,fy8,fx8},conv8(n,f8,y8,x8)+filter8(f8,fz8,fy8,fx8)*input8(n,fz8,y8+fy8,x8+fx8),conv8(n,f8,y8,x8));
    // compute s_35("s_35",{n,f8,y8,x8},conv8(n,f8,y8,x8),relu8(n,f8,y8,x8));
    // compute s_36("s_36",{n,f8,y8,x8},relu8(n,f8,y8,x8),input9(n,f8,y8+1,x8+1));
    // s_33.after(s_32,-1);
    // s_34.after(s_33,-1);
    // s_35.after(s_34,-1);
    // s_36.after(s_35,-1);

    // var f9("f9", 0 ,512);//659
    // var y9("y9", 0 ,2); 
    // var x9("x9", 0 ,2); 
    // var fz9("fz9", 0 ,512);
    // var fy9("fy9", 0 ,3);
    // var fx9("fx9", 0 ,3);
    // placeholder filter9("filter9",{512,512,3,3},p_float32);
    // placeholder conv9("conv9",{2,512,2,2},p_float32);
    // placeholder relu9("relu9",{2,512,2,2},p_float32);
    // placeholder input10("input10",{2,512,4,4},p_float32);
    // compute s_37("s_37",{n,f9,y9,x9},scalar,conv9(n,f9,y9,x9));
    // compute s_38("s_38",{n,f9,y9,x9,fz9,fy9,fx9},conv9(n,f9,y9,x9)+filter9(f9,fz9,fy9,fx9)*input9(n,fz9,y9*2+fy9,x9*2+fx9),conv9(n,f9,y9,x9));
    // compute s_39("s_39",{n,f9,y9,x9},conv9(n,f9,y9,x9),relu9(n,f9,y9,x9));
    // compute s_40("s_40",{n,f9,y9,x9},relu9(n,f9,y9,x9),input10(n,f9,y9+1,x9+1));
    // s_37.after(s_36,-1);
    // s_38.after(s_37,-1);
    // s_39.after(s_38,-1);
    // s_40.after(s_39,-1);

    // var f10("f10", 0 ,512);//707
    // var y10("y10", 0 ,2); 
    // var x10("x10", 0 ,2); 
    // var fz10("fz10", 0 ,512);
    // var fy10("fy10", 0 ,3);
    // var fx10("fx10", 0 ,3);
    // placeholder filter10("filter10",{512,512,3,3},p_float32);
    // placeholder conv10("conv10",{2,512,2,2},p_float32);
    // placeholder relu10("relu10",{2,512,2,2},p_float32);
    // placeholder input11("input11",{2,512,4,4},p_float32);
    // compute s_41("s_41",{n,f10,y10,x10},scalar,conv10(n,f10,y10,x10));
    // compute s_42("s_42",{n,f10,y10,x10,fz10,fy10,fx10},conv10(n,f10,y10,x10)+filter10(f10,fz10,fy10,fx10)*input10(n,fz10,y10+fy10,x10+fx10),conv10(n,f10,y10,x10));
    // compute s_43("s_43",{n,f10,y10,x10},conv10(n,f10,y10,x10),relu10(n,f10,y10,x10));
    // compute s_44("s_44",{n,f10,y10,x10},relu10(n,f10,y10,x10),input11(n,f10,y10+1,x10+1));
    // s_41.after(s_40,-1);
    // s_42.after(s_41,-1);
    // s_43.after(s_42,-1);
    // s_44.after(s_43,-1);

    // var f11("f11", 0 ,512);//755
    // var y11("y11", 0 ,2); 
    // var x11("x11", 0 ,2); 
    // var fz11("fz11", 0 ,512);
    // var fy11("fy11", 0 ,3);
    // var fx11("fx11", 0 ,3);
    // placeholder filter11("filter11",{512,512,3,3},p_float32);
    // placeholder conv11("conv11",{2,512,2,2},p_float32);
    // placeholder relu11("relu11",{2,512,2,2},p_float32);
    // placeholder input12("input12",{2,512,4,4},p_float32);
    // compute s_45("s_45",{n,f11,y11,x11},scalar,conv11(n,f11,y11,x11));
    // compute s_46("s_46",{n,f11,y11,x11,fz11,fy11,fx11},conv11(n,f11,y11,x11)+filter11(f11,fz11,fy11,fx11)*input11(n,fz11,y11+fy11,x11+fx11),conv11(n,f11,y11,x11));
    // compute s_47("s_47",{n,f11,y11,x11},conv11(n,f11,y11,x11),relu11(n,f11,y11,x11));
    // compute s_48("s_48",{n,f11,y11,x11},relu11(n,f11,y11,x11),input12(n,f11,y11+1,x11+1));
    
    // s_45.after(s_44,-1);
    // s_46.after(s_45,-1);
    // s_47.after(s_46,-1);
    // s_48.after(s_47,-1);

    // placeholder output13("output13",{512},p_float32);//todo
    // compute s_49("s_49",{f11},scalar,output13(f11));//803
    // compute s_50("s_50",{f11,fz11,fy11,fx11},output13(f11)+filter11(f11,fz11,fy11,fx11)*input12(n,fz11,fy11,fx11),output13(f11));
    // s_49.after(s_48,-1);
    // s_50.after(s_49,-1);

    // fct->auto_DSE_loop_transformation();
    // for(auto &comp:fct->leader_computations){
    //     auto iterators = comp->get_iteration_variables();
    //     std::vector<polyfp::var> temp_iterators;
    //     int temp_size = iterators.size();
    //     int border = temp_size-3;
    //     for(auto &iter: iterators){
    //         std::cout<<"Dimension name: "+iter.get_name()<<std::endl;
    //         int loc = comp->get_loop_level_number_from_dimension_name(iter.get_name());
    //         if(loc>=border){
    //             temp_iterators.push_back(iter);
    //         }
    //     }
    //     iterators.clear();
    //     iterators=temp_iterators;
    //     std::map<int,polyfp::var> iterator_map;
    //     int size = iterators.size();
    //     for(auto &iter: iterators){
    //         int loc = comp->get_loop_level_number_from_dimension_name(iter.get_name());
    //         std::cout<<iter.get_name()<<std::endl;
    //         std::cout<<loc<<std::endl;
    //         iterator_map[loc] = iter;
    //     }
    //     int temp_index = comp->get_iteration_variables().size()-3;
    //     std::vector<int> list;
    //     for(int i=0; i<3;i++){
    //         int lower = stoi(iterator_map[temp_index+i].get_lower().to_str());
    //         int upper = stoi(iterator_map[temp_index+i].get_upper().to_str());
    //         int range = upper-lower;
    //         if(range = 64){
    //             list.push_back(32);
    //         }else if(range = 128){
    //             list.push_back(64);
    //         }else if(range = 256){
    //             list.push_back(64);
    //         }else if(range = 512){
    //             list.push_back(64);
    //         }else if(range = 16){
    //             list.push_back(2);
    //         }else if(range<=4){
    //             list.push_back(1);
    //         }else{
    //             list.push_back(2);
    //         }
    //     }
    //     comp->apply_opt_strategy(list);
    // }
    // fct->dump_schedule("/home/POM/samples/vgg/");


    // fct->auto_DSE("/home/POM/samples/vgg/");
    // fct->-auto_DSE_loop_transformation();
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