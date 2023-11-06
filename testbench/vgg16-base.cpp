
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
#include "expr.h"
#include "compute.h"
#include "function.h"
#include "core.h"
using namespace std;
using namespace polyfp;

int main(){

  init("vgg16-base");
  auto *fct = global::get_implicit_function();
  placeholder c0("c0" ,{3,64,64},p_float32);
	placeholder c1("c1" ,{10},p_float32);
	placeholder c2("c2" ,{10,512},p_float32);
	placeholder c3("c3" ,{512,512,3,3},p_float32);
	placeholder c4("c4" ,{512,512,3,3},p_float32);
	placeholder c5("c5" ,{512,512,3,3},p_float32);
	placeholder c6("c6" ,{512,512,3,3},p_float32);
	placeholder c7("c7" ,{512,512,3,3},p_float32);
	placeholder c8("c8" ,{512,256,3,3},p_float32);
	placeholder c9("c9" ,{256,256,3,3},p_float32);
	placeholder c10("c10" ,{256,256,3,3},p_float32);
	placeholder c11("c11" ,{256,128,3,3},p_float32);
	placeholder c12("c12" ,{128,128,3,3},p_float32);
	placeholder c13("c13" ,{128,64,3,3},p_float32);
	placeholder c14("c14" ,{64,64,3,3},p_float32);
	placeholder c15("c15" ,{64,3,3,3},p_float32);
	constant zero(0);
	constant c17(4.000000e+00);
	//padOp
	placeholder c18("c18" ,{3,66,66},p_float32);
	var v1("v1", 0,3);
	var v2("v2", 0,66);
	var v3("v3", 0,66);
	var v4("v4", 0,64);
	var v5("v5", 0,64);
	compute s0("s0",{v1,v2,v3},zero,c18(v1,v2,v3));
	compute s1("s1",{v1,v4,v5},c0(v1,v4,v5),c18(v1,v4+1,v5+1));
	//empty
	//generic
	var v6("v6", 0,64);
	placeholder c20("c20" ,{64,64,64},p_float32);
	compute s2("s2",{v4,v5,v6},zero,c20(v4,v5,v6));
	//generic
	var v7("v7", 0,3);
	var v8("v8", 0,3);
	placeholder c21("c21" ,{64,64,64},p_float32);
	compute s3("s3",{v4,v5,v6,v1,v7,v8},c20(v4,v5,v6)+c18(v1,v5+v7,v6+v8)*c15(v4,v1,v7,v8),c20(v4,v5,v6));
	compute s4("s4",{v4,v5,v6},c20(v4,v5,v6),c21(v4,v5,v6));
	//generic
	placeholder c22("c22" ,{64,64,64},p_float32);
	compute s5("s5",{v4,v5,v6},p_max(c21(v4,v5,v6),zero),c22(v4,v5,v6));
	//padOp
	placeholder c23("c23" ,{64,66,66},p_float32);
	compute s6("s6",{v4,v2,v3},zero,c23(v4,v2,v3));
	compute s7("s7",{v4,v5,v6},c22(v4,v5,v6),c23(v4,v5+1,v6+1));
	//empty
	//generic
	var v9("v9", 0,32);
	var v10("v10", 0,32);
	placeholder c25("c25" ,{64,32,32},p_float32);
	compute s8("s8",{v4,v9,v10},zero,c25(v4,v9,v10));
	//generic
	placeholder c26("c26" ,{64,32,32},p_float32);
	compute s9("s9",{v5,v9,v10,v4,v1,v7},c25(v5,v9,v10)+c23(v4,v9*2+v1,v10*2+v7)*c14(v5,v4,v1,v7),c25(v5,v9,v10));
	compute s10("s10",{v5,v9,v10},c25(v5,v9,v10),c26(v5,v9,v10));
	//generic
	placeholder c27("c27" ,{64,32,32},p_float32);
	compute s11("s11",{v4,v9,v10},p_max(c26(v4,v9,v10),zero),c27(v4,v9,v10));
	//padOp
	placeholder c28("c28" ,{64,34,34},p_float32);
	var v11("v11", 0,34);
	var v12("v12", 0,34);
	compute s12("s12",{v4,v11,v12},zero,c28(v4,v11,v12));
	compute s13("s13",{v4,v9,v10},c27(v4,v9,v10),c28(v4,v9+1,v10+1));
	//empty
	//generic
	var v13("v13", 0,128);
	placeholder c30("c30" ,{128,32,32},p_float32);
	compute s14("s14",{v13,v9,v10},zero,c30(v13,v9,v10));
	//generic
	placeholder c31("c31" ,{128,32,32},p_float32);
	compute s15("s15",{v13,v9,v10,v4,v1,v7},c30(v13,v9,v10)+c28(v4,v9+v1,v10+v7)*c13(v13,v4,v1,v7),c30(v13,v9,v10));
	compute s16("s16",{v13,v9,v10},c30(v13,v9,v10),c31(v13,v9,v10));
	//generic
	placeholder c32("c32" ,{128,32,32},p_float32);
	compute s17("s17",{v13,v9,v10},p_max(c31(v13,v9,v10),zero),c32(v13,v9,v10));
	//padOp
	placeholder c33("c33" ,{128,34,34},p_float32);
	compute s18("s18",{v13,v11,v12},zero,c33(v13,v11,v12));
	compute s19("s19",{v13,v9,v10},c32(v13,v9,v10),c33(v13,v9+1,v10+1));
	//empty
	//generic
	var v14("v14", 0,16);
	var v15("v15", 0,16);
	placeholder c35("c35" ,{128,16,16},p_float32);
	compute s20("s20",{v13,v14,v15},zero,c35(v13,v14,v15));
	//generic
	var v16("v16", 0,128);
	placeholder c36("c36" ,{128,16,16},p_float32);
	compute s21("s21",{v16,v14,v15,v13,v1,v7},c35(v16,v14,v15)+c33(v13,v14*2+v1,v15*2+v7)*c12(v16,v13,v1,v7),c35(v16,v14,v15));
	compute s22("s22",{v16,v14,v15},c35(v16,v14,v15),c36(v16,v14,v15));
	//generic
	placeholder c37("c37" ,{128,16,16},p_float32);
	compute s23("s23",{v13,v14,v15},p_max(c36(v13,v14,v15),zero),c37(v13,v14,v15));
	//padOp
	placeholder c38("c38" ,{128,18,18},p_float32);
	var v17("v17", 0,18);
	var v18("v18", 0,18);
	compute s24("s24",{v13,v17,v18},zero,c38(v13,v17,v18));
	compute s25("s25",{v13,v14,v15},c37(v13,v14,v15),c38(v13,v14+1,v15+1));
	//empty
	//generic
	var v19("v19", 0,256);
	placeholder c40("c40" ,{256,16,16},p_float32);
	compute s26("s26",{v19,v14,v15},zero,c40(v19,v14,v15));
	//generic
	placeholder c41("c41" ,{256,16,16},p_float32);
	compute s27("s27",{v19,v14,v15,v13,v1,v7},c40(v19,v14,v15)+c38(v13,v14+v1,v15+v7)*c11(v19,v13,v1,v7),c40(v19,v14,v15));
	compute s28("s28",{v19,v14,v15},c40(v19,v14,v15),c41(v19,v14,v15));
	//generic
	placeholder c42("c42" ,{256,16,16},p_float32);
	compute s29("s29",{v19,v14,v15},p_max(c41(v19,v14,v15),zero),c42(v19,v14,v15));
	//padOp
	placeholder c43("c43" ,{256,18,18},p_float32);
	compute s30("s30",{v19,v17,v18},zero,c43(v19,v17,v18));
	compute s31("s31",{v19,v14,v15},c42(v19,v14,v15),c43(v19,v14+1,v15+1));
	//generic
	var v20("v20", 0,256);
	placeholder c44("c44" ,{256,16,16},p_float32);
	compute s32("s32",{v20,v14,v15,v19,v1,v7},c40(v20,v14,v15)+c43(v19,v14+v1,v15+v7)*c10(v20,v19,v1,v7),c40(v20,v14,v15));
	compute s33("s33",{v20,v14,v15},c40(v20,v14,v15),c44(v20,v14,v15));
	//generic
	placeholder c45("c45" ,{256,16,16},p_float32);
	compute s34("s34",{v19,v14,v15},p_max(c44(v19,v14,v15),zero),c45(v19,v14,v15));
	//padOp
	placeholder c46("c46" ,{256,18,18},p_float32);
	compute s35("s35",{v19,v17,v18},zero,c46(v19,v17,v18));
	compute s36("s36",{v19,v14,v15},c45(v19,v14,v15),c46(v19,v14+1,v15+1));
	//empty
	//generic
	var v21("v21", 0,8);
	var v22("v22", 0,8);
	placeholder c48("c48" ,{256,8,8},p_float32);
	compute s37("s37",{v19,v21,v22},zero,c48(v19,v21,v22));
	//generic
	placeholder c49("c49" ,{256,8,8},p_float32);
	compute s38("s38",{v20,v21,v22,v19,v1,v7},c48(v20,v21,v22)+c46(v19,v21*2+v1,v22*2+v7)*c9(v20,v19,v1,v7),c48(v20,v21,v22));
	compute s39("s39",{v20,v21,v22},c48(v20,v21,v22),c49(v20,v21,v22));
	//generic
	placeholder c50("c50" ,{256,8,8},p_float32);
	compute s40("s40",{v19,v21,v22},p_max(c49(v19,v21,v22),zero),c50(v19,v21,v22));
	//padOp
	placeholder c51("c51" ,{256,10,10},p_float32);
	var v23("v23", 0,10);
	var v24("v24", 0,10);
	compute s41("s41",{v19,v23,v24},zero,c51(v19,v23,v24));
	compute s42("s42",{v19,v21,v22},c50(v19,v21,v22),c51(v19,v21+1,v22+1));
	//empty
	//generic
	var v25("v25", 0,512);
	placeholder c53("c53" ,{512,8,8},p_float32);
	compute s43("s43",{v25,v21,v22},zero,c53(v25,v21,v22));
	//generic
	placeholder c54("c54" ,{512,8,8},p_float32);
	compute s44("s44",{v25,v21,v22,v19,v1,v7},c53(v25,v21,v22)+c51(v19,v21+v1,v22+v7)*c8(v25,v19,v1,v7),c53(v25,v21,v22));
	compute s45("s45",{v25,v21,v22},c53(v25,v21,v22),c54(v25,v21,v22));
	//generic
	placeholder c55("c55" ,{512,8,8},p_float32);
	compute s46("s46",{v25,v21,v22},p_max(c54(v25,v21,v22),zero),c55(v25,v21,v22));
	//padOp
	placeholder c56("c56" ,{512,10,10},p_float32);
	compute s47("s47",{v25,v23,v24},zero,c56(v25,v23,v24));
	compute s48("s48",{v25,v21,v22},c55(v25,v21,v22),c56(v25,v21+1,v22+1));
	//generic
	var v26("v26", 0,512);
	placeholder c57("c57" ,{512,8,8},p_float32);
	compute s49("s49",{v26,v21,v22,v25,v1,v7},c53(v26,v21,v22)+c56(v25,v21+v1,v22+v7)*c7(v26,v25,v1,v7),c53(v26,v21,v22));
	compute s50("s50",{v26,v21,v22},c53(v26,v21,v22),c57(v26,v21,v22));
	//generic
	placeholder c58("c58" ,{512,8,8},p_float32);
	compute s51("s51",{v25,v21,v22},p_max(c57(v25,v21,v22),zero),c58(v25,v21,v22));
	//padOp
	placeholder c59("c59" ,{512,10,10},p_float32);
	compute s52("s52",{v25,v23,v24},zero,c59(v25,v23,v24));
	compute s53("s53",{v25,v21,v22},c58(v25,v21,v22),c59(v25,v21+1,v22+1));
	//empty
	//generic
	var v27("v27", 0,4);
	var v28("v28", 0,4);
	placeholder c61("c61" ,{512,4,4},p_float32);
	compute s54("s54",{v25,v27,v28},zero,c61(v25,v27,v28));
	//generic
	placeholder c62("c62" ,{512,4,4},p_float32);
	compute s55("s55",{v26,v27,v28,v25,v1,v7},c61(v26,v27,v28)+c59(v25,v27*2+v1,v28*2+v7)*c6(v26,v25,v1,v7),c61(v26,v27,v28));
	compute s56("s56",{v26,v27,v28},c61(v26,v27,v28),c62(v26,v27,v28));
	//generic
	placeholder c63("c63" ,{512,4,4},p_float32);
	compute s57("s57",{v25,v27,v28},p_max(c62(v25,v27,v28),zero),c63(v25,v27,v28));
	//padOp
	placeholder c64("c64" ,{512,6,6},p_float32);
	var v29("v29", 0,6);
	var v30("v30", 0,6);
	compute s58("s58",{v25,v29,v30},zero,c64(v25,v29,v30));
	compute s59("s59",{v25,v27,v28},c63(v25,v27,v28),c64(v25,v27+1,v28+1));
	//generic
	placeholder c65("c65" ,{512,4,4},p_float32);
	compute s60("s60",{v26,v27,v28,v25,v1,v7},c61(v26,v27,v28)+c64(v25,v27+v1,v28+v7)*c5(v26,v25,v1,v7),c61(v26,v27,v28));
	compute s61("s61",{v26,v27,v28},c61(v26,v27,v28),c65(v26,v27,v28));
	//generic
	placeholder c66("c66" ,{512,4,4},p_float32);
	compute s62("s62",{v25,v27,v28},p_max(c65(v25,v27,v28),zero),c66(v25,v27,v28));
	//padOp
	placeholder c67("c67" ,{512,6,6},p_float32);
	compute s63("s63",{v25,v29,v30},zero,c67(v25,v29,v30));
	compute s64("s64",{v25,v27,v28},c66(v25,v27,v28),c67(v25,v27+1,v28+1));
	//generic
	placeholder c68("c68" ,{512,4,4},p_float32);
	compute s65("s65",{v26,v27,v28,v25,v1,v7},c61(v26,v27,v28)+c67(v25,v27+v1,v28+v7)*c4(v26,v25,v1,v7),c61(v26,v27,v28));
	compute s66("s66",{v26,v27,v28},c61(v26,v27,v28),c68(v26,v27,v28));
	//generic
	placeholder c69("c69" ,{512,4,4},p_float32);
	compute s67("s67",{v25,v27,v28},p_max(c68(v25,v27,v28),zero),c69(v25,v27,v28));
	//padOp
	placeholder c70("c70" ,{512,6,6},p_float32);
	compute s68("s68",{v25,v29,v30},zero,c70(v25,v29,v30));
	compute s69("s69",{v25,v27,v28},c69(v25,v27,v28),c70(v25,v27+1,v28+1));
	//empty
	//generic
	var v31("v31", 0,2);
	var v32("v32", 0,2);
	placeholder c72("c72" ,{512,2,2},p_float32);
	compute s70("s70",{v25,v31,v32},zero,c72(v25,v31,v32));
	//generic
	placeholder c73("c73" ,{512,2,2},p_float32);
	compute s71("s71",{v26,v31,v32,v25,v1,v7},c72(v26,v31,v32)+c70(v25,v31*2+v1,v32*2+v7)*c3(v26,v25,v1,v7),c72(v26,v31,v32));
	compute s72("s72",{v26,v31,v32},c72(v26,v31,v32),c73(v26,v31,v32));
	//generic
	placeholder c74("c74" ,{512,2,2},p_float32);
	compute s73("s73",{v25,v31,v32},p_max(c73(v25,v31,v32),zero),c74(v25,v31,v32));
	//empty
	//generic
	placeholder c76("c76" ,{512},p_float32);
	compute s74("s74",{v25},zero,c76(v25));
	//empty
	//generic
	placeholder c78("c78" ,{512},p_float32);
	compute s75("s75",{v25,v31,v32},c76(v25)+c74(v25,v31,v32),c76(v25));
	compute s76("s76",{v25},c76(v25),c78(v25));
	//generic
	placeholder c79("c79" ,{512},p_float32);
	compute s77("s77",{v25},c78(v25)/c17,c79(v25));
	//col
	placeholder c80("c80" ,{512},p_float32);
	compute s78("s78",{v25},c79(v25),c80(v25*1));
	//empty
	//generic
	placeholder c82("c82" ,{512,10},p_float32);
	compute s79("s79",{v23,v25},c2(v23,v25),c82(v25,v23));
	//empty
	//generic
	placeholder c84("c84" ,{10},p_float32);
	compute s80("s80",{v23},zero,c84(v23));
	//generic
	placeholder c85("c85" ,{10},p_float32);
	compute s81("s81",{v23,v25},c84(v23)+c80(v25)*c82(v25,v23),c84(v23));
	compute s82("s82",{v23},c84(v23),c85(v23));
	//generic
	placeholder c86("c86" ,{10},p_float32);
	compute s83("s83",{v23},c85(v23)+c1(v23),c86(v23));
	s1.after(s0,-1);
	s2.after(s1,-1);
	s3.after(s2,-1);
	s4.after(s3,-1);
	s5.after(s4,-1);
	s6.after(s5,-1);
	s7.after(s6,-1);
	s8.after(s7,-1);
	s9.after(s8,-1);
	s10.after(s9,-1);
	s11.after(s10,-1);
	s12.after(s11,-1);
	s13.after(s12,-1);
	s14.after(s13,-1);
	s15.after(s14,-1);
	s16.after(s15,-1);
	s17.after(s16,-1);
	s18.after(s17,-1);
	s19.after(s18,-1);
	s20.after(s19,-1);
	s21.after(s20,-1);
	s22.after(s21,-1);
	s23.after(s22,-1);
	s24.after(s23,-1);
	s25.after(s24,-1);
	s26.after(s25,-1);
	s27.after(s26,-1);
	s28.after(s27,-1);
	s29.after(s28,-1);
	s30.after(s29,-1);
	s31.after(s30,-1);
	s32.after(s31,-1);
	s33.after(s32,-1);
	s34.after(s33,-1);
	s35.after(s34,-1);
	s36.after(s35,-1);
	s37.after(s36,-1);
	s38.after(s37,-1);
	s39.after(s38,-1);
	s40.after(s39,-1);
	s41.after(s40,-1);
	s42.after(s41,-1);
	s43.after(s42,-1);
	s44.after(s43,-1);
	s45.after(s44,-1);
	s46.after(s45,-1);
	s47.after(s46,-1);
	s48.after(s47,-1);
	s49.after(s48,-1);
	s50.after(s49,-1);
	s51.after(s50,-1);
	s52.after(s51,-1);
	s53.after(s52,-1);
	s54.after(s53,-1);
	s55.after(s54,-1);
	s56.after(s55,-1);
	s57.after(s56,-1);
	s58.after(s57,-1);
	s59.after(s58,-1);
	s60.after(s59,-1);
	s61.after(s60,-1);
	s62.after(s61,-1);
	s63.after(s62,-1);
	s64.after(s63,-1);
	s65.after(s64,-1);
	s66.after(s65,-1);
	s67.after(s66,-1);
	s68.after(s67,-1);
	s69.after(s68,-1);
	s70.after(s69,-1);
	s71.after(s70,-1);
	s72.after(s71,-1);
	s73.after(s72,-1);
	s74.after(s73,-1);
	s75.after(s74,-1);
	s76.after(s75,-1);
	s77.after(s76,-1);
	s78.after(s77,-1);
	s79.after(s78,-1);
	s80.after(s79,-1);
	s81.after(s80,-1);
	s82.after(s81,-1);
	s83.after(s82,-1);
	fct->codegen();
	// fct->dump_schedule("/home/POM/samples/resnet18_test/");
}