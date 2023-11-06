
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

  init("resnet18");
  auto *fct = global::get_implicit_function();
  placeholder c0("c0" ,{3,32,32},p_float32);
	placeholder c1("c1" ,{10},p_float32);
	placeholder c2("c2" ,{10,512},p_float32);
	placeholder c3("c3" ,{512,512,3,3},p_float32);
	placeholder c4("c4" ,{512,512,3,3},p_float32);
	placeholder c5("c5" ,{512,256},p_float32);
	placeholder c6("c6" ,{512,512,3,3},p_float32);
	placeholder c7("c7" ,{512,256,3,3},p_float32);
	placeholder c8("c8" ,{256,256,3,3},p_float32);
	placeholder c9("c9" ,{256,256,3,3},p_float32);
	placeholder c10("c10" ,{256,128},p_float32);
	placeholder c11("c11" ,{256,256,3,3},p_float32);
	placeholder c12("c12" ,{256,128,3,3},p_float32);
	placeholder c13("c13" ,{128,128,3,3},p_float32);
	placeholder c14("c14" ,{128,128,3,3},p_float32);
	placeholder c15("c15" ,{128,64},p_float32);
	placeholder c16("c16" ,{128,128,3,3},p_float32);
	placeholder c17("c17" ,{128,64,3,3},p_float32);
	placeholder c18("c18" ,{64,64,3,3},p_float32);
	placeholder c19("c19" ,{64,64,3,3},p_float32);
	placeholder c20("c20" ,{64,64,3,3},p_float32);
	placeholder c21("c21" ,{64,64,3,3},p_float32);
	placeholder c22("c22" ,{64,3,3,3},p_float32);
	constant zero(0);
	constant c24(1.600000e+01);
	//padOp
	placeholder c25("c25" ,{3,34,34},p_float32);
	var v1("v1", 0,3);
	var v2("v2", 0,34);
	var v3("v3", 0,34);
	var v4("v4", 0,32);
	var v5("v5", 0,32);
	compute s0("s0",{v1,v2,v3},zero,c25(v1,v2,v3));
	compute s1("s1",{v1,v4,v5},c0(v1,v4,v5),c25(v1,v4+1,v5+1));
	//empty
	//generic
	var v6("v6", 0,64);
	placeholder c27("c27" ,{64,32,32},p_float32);
	compute s2("s2",{v6,v4,v5},zero,c27(v6,v4,v5));
	//generic
	var v7("v7", 0,3);
	var v8("v8", 0,3);
	placeholder c28("c28" ,{64,32,32},p_float32);
	compute s3("s3",{v6,v4,v5,v1,v7,v8},c27(v6,v4,v5)+c25(v1,v4+v7,v5+v8)*c22(v6,v1,v7,v8),c27(v6,v4,v5));
	compute s4("s4",{v6,v4,v5},c27(v6,v4,v5),c28(v6,v4,v5));
	//generic
	placeholder c29("c29" ,{64,32,32},p_float32);
	compute s5("s5",{v6,v4,v5},c28(v6,v4,v5),c29(v6,v4,v5));
	//padOp
	placeholder c30("c30" ,{64,34,34},p_float32);
	compute s6("s6",{v6,v2,v3},zero,c30(v6,v2,v3));
	compute s7("s7",{v6,v4,v5},c29(v6,v4,v5),c30(v6,v4+1,v5+1));
	//generic
	var v9("v9", 0,64);
	placeholder c31("c31" ,{64,32,32},p_float32);
	compute s8("s8",{v9,v4,v5,v6,v1,v7},c27(v9,v4,v5)+c30(v6,v4+v1,v5+v7)*c21(v9,v6,v1,v7),c27(v9,v4,v5));
	compute s9("s9",{v9,v4,v5},c27(v9,v4,v5),c31(v9,v4,v5));
	//generic
	placeholder c32("c32" ,{64,32,32},p_float32);
	compute s10("s10",{v6,v4,v5},c31(v6,v4,v5),c32(v6,v4,v5));
	//padOp
	placeholder c33("c33" ,{64,34,34},p_float32);
	compute s11("s11",{v6,v2,v3},zero,c33(v6,v2,v3));
	compute s12("s12",{v6,v4,v5},c32(v6,v4,v5),c33(v6,v4+1,v5+1));
	//generic
	//placeholder c34("c34" ,{64,32,32},p_float32);
	compute s13("s13",{v9,v4,v5,v6,v1,v7},c27(v9,v4,v5)+c33(v6,v4+v1,v5+v7)*c20(v9,v6,v1,v7),c27(v9,v4,v5));
	//compute s14("s14",{v9,v4,v5},c27(v9,v4,v5),c34(v9,v4,v5));
	//generic
	placeholder c35("c35" ,{64,32,32},p_float32);
	compute s15("s15",{v6,v4,v5},c27(v6,v4,v5)+c29(v6,v4,v5),c35(v6,v4,v5));
	//generic
	placeholder c36("c36" ,{64,32,32},p_float32);
	compute s16("s16",{v6,v4,v5},c35(v6,v4,v5),c36(v6,v4,v5));
	//padOp
	placeholder c37("c37" ,{64,34,34},p_float32);
	compute s17("s17",{v6,v2,v3},zero,c37(v6,v2,v3));
	compute s18("s18",{v6,v4,v5},c36(v6,v4,v5),c37(v6,v4+1,v5+1));
	//generic
	//placeholder c38("c38" ,{64,32,32},p_float32);
	compute s19("s19",{v9,v4,v5,v6,v1,v7},c27(v9,v4,v5)+c37(v6,v4+v1,v5+v7)*c19(v9,v6,v1,v7),c27(v9,v4,v5));
	//compute s20("s20",{v9,v4,v5},c27(v9,v4,v5),c38(v9,v4,v5));
	//generic
	placeholder c39("c39" ,{64,32,32},p_float32);
	compute s21("s21",{v6,v4,v5},c27(v6,v4,v5),c39(v6,v4,v5));
	//padOp
	placeholder c40("c40" ,{64,34,34},p_float32);
	compute s22("s22",{v6,v2,v3},zero,c40(v6,v2,v3));
	compute s23("s23",{v6,v4,v5},c39(v6,v4,v5),c40(v6,v4+1,v5+1));
	//generic
	//placeholder c41("c41" ,{64,32,32},p_float32);
	compute s24("s24",{v9,v4,v5,v6,v1,v7},c27(v9,v4,v5)+c40(v6,v4+v1,v5+v7)*c18(v9,v6,v1,v7),c27(v9,v4,v5));
	//compute s25("s25",{v9,v4,v5},c27(v9,v4,v5),c41(v9,v4,v5));
	//generic
	placeholder c42("c42" ,{64,32,32},p_float32);
	compute s26("s26",{v6,v4,v5},c27(v6,v4,v5)+c36(v6,v4,v5),c42(v6,v4,v5));
	//generic
	placeholder c43("c43" ,{64,32,32},p_float32);
	compute s27("s27",{v6,v4,v5},c42(v6,v4,v5),c43(v6,v4,v5));
	//padOp
	placeholder c44("c44" ,{64,34,34},p_float32);
	compute s28("s28",{v6,v2,v3},zero,c44(v6,v2,v3));
	compute s29("s29",{v6,v4,v5},c43(v6,v4,v5),c44(v6,v4+1,v5+1));
	//empty
	//generic
	var v10("v10", 0,128);
	var v11("v11", 0,16);
	var v12("v12", 0,16);
	placeholder c46("c46" ,{128,16,16},p_float32);
	compute s30("s30",{v10,v11,v12},zero,c46(v10,v11,v12));
	//generic
	//placeholder c47("c47" ,{128,16,16},p_float32);
	compute s31("s31",{v10,v11,v12,v6,v1,v7},c46(v10,v11,v12)+c44(v6,v11*2+v1,v12*2+v7)*c17(v10,v6,v1,v7),c46(v10,v11,v12));
	//compute s32("s32",{v10,v11,v12},c46(v10,v11,v12),c47(v10,v11,v12));
	//generic
	placeholder c48("c48" ,{128,16,16},p_float32);
	compute s33("s33",{v10,v11,v12},c46(v10,v11,v12),c48(v10,v11,v12));
	//padOp
	placeholder c49("c49" ,{128,18,18},p_float32);
	var v13("v13", 0,18);
	var v14("v14", 0,18);
	compute s34("s34",{v10,v13,v14},zero,c49(v10,v13,v14));
	compute s35("s35",{v10,v11,v12},c48(v10,v11,v12),c49(v10,v11+1,v12+1));
	//generic
	var v15("v15", 0,128);
	placeholder c50("c50" ,{128,16,16},p_float32);
	compute s36("s36",{v15,v11,v12,v10,v1,v7},c46(v15,v11,v12)+c49(v10,v11+v1,v12+v7)*c16(v15,v10,v1,v7),c46(v15,v11,v12));
	compute s37("s37",{v15,v11,v12},c46(v15,v11,v12),c50(v15,v11,v12));  //cannot delete
	//generic
	var v16("v16", 0,1);
	var v17("v17", 0,1);
	//placeholder c51("c51" ,{128,16,16},p_float32);
	compute s38("s38",{v10,v11,v12,v6},c46(v10,v11,v12)+c43(v6,v11*2,v12*2)*c15(v10,v6),c46(v10,v11,v12));
	//compute s39("s39",{v10,v11,v12},c46(v10,v11,v12),c51(v10,v11,v12));
	//generic
	placeholder c52("c52" ,{128,16,16},p_float32);
	compute s40("s40",{v10,v11,v12},c50(v10,v11,v12)+c46(v10,v11,v12),c52(v10,v11,v12)); //51 to 46
	//generic
	placeholder c53("c53" ,{128,16,16},p_float32);
	compute s41("s41",{v10,v11,v12},c52(v10,v11,v12),c53(v10,v11,v12));
	//padOp
	placeholder c54("c54" ,{128,18,18},p_float32);
	compute s42("s42",{v10,v13,v14},zero,c54(v10,v13,v14));
	compute s43("s43",{v10,v11,v12},c53(v10,v11,v12),c54(v10,v11+1,v12+1));
	//generic
	//placeholder c55("c55" ,{128,16,16},p_float32);
	compute s44("s44",{v15,v11,v12,v10,v1,v7},c46(v15,v11,v12)+c54(v10,v11+v1,v12+v7)*c14(v15,v10,v1,v7),c46(v15,v11,v12));
	//compute s45("s45",{v15,v11,v12},c46(v15,v11,v12),c55(v15,v11,v12));
	//generic
	placeholder c56("c56" ,{128,16,16},p_float32);
	compute s46("s46",{v10,v11,v12},c46(v10,v11,v12),c56(v10,v11,v12)); //55 to 46
	//padOp
	placeholder c57("c57" ,{128,18,18},p_float32);
	compute s47("s47",{v10,v13,v14},zero,c57(v10,v13,v14));
	compute s48("s48",{v10,v11,v12},c56(v10,v11,v12),c57(v10,v11+1,v12+1));
	//generic
	//placeholder c58("c58" ,{128,16,16},p_float32);
	compute s49("s49",{v15,v11,v12,v10,v1,v7},c46(v15,v11,v12)+c57(v10,v11+v1,v12+v7)*c13(v15,v10,v1,v7),c46(v15,v11,v12));
	//compute s50("s50",{v15,v11,v12},c46(v15,v11,v12),c58(v15,v11,v12));
	//generic
	placeholder c59("c59" ,{128,16,16},p_float32);
	compute s51("s51",{v10,v11,v12},c46(v10,v11,v12)+c53(v10,v11,v12),c59(v10,v11,v12));//58 to 46
	//generic
	placeholder c60("c60" ,{128,16,16},p_float32);
	compute s52("s52",{v10,v11,v12},c59(v10,v11,v12),c60(v10,v11,v12));
	//padOp
	placeholder c61("c61" ,{128,18,18},p_float32);
	compute s53("s53",{v10,v13,v14},zero,c61(v10,v13,v14));
	compute s54("s54",{v10,v11,v12},c60(v10,v11,v12),c61(v10,v11+1,v12+1));
	//empty
	//generic
	var v18("v18", 0,256);
	var v19("v19", 0,8);
	var v20("v20", 0,8);
	placeholder c63("c63" ,{256,8,8},p_float32);
	compute s55("s55",{v18,v19,v20},zero,c63(v18,v19,v20));
	//generic
	//placeholder c64("c64" ,{256,8,8},p_float32);
	compute s56("s56",{v18,v19,v20,v10,v1,v7},c63(v18,v19,v20)+c61(v10,v19*2+v1,v20*2+v7)*c12(v18,v10,v1,v7),c63(v18,v19,v20));
	//compute s57("s57",{v18,v19,v20},c63(v18,v19,v20),c64(v18,v19,v20));
	//generic
	placeholder c65("c65" ,{256,8,8},p_float32);
	compute s58("s58",{v18,v19,v20},c63(v18,v19,v20),c65(v18,v19,v20)); //64 to 63
	//padOp
	placeholder c66("c66" ,{256,10,10},p_float32);
	var v21("v21", 0,10);
	var v22("v22", 0,10);
	compute s59("s59",{v18,v21,v22},zero,c66(v18,v21,v22));
	compute s60("s60",{v18,v19,v20},c65(v18,v19,v20),c66(v18,v19+1,v20+1));
	//generic
	var v23("v23", 0,256);
	placeholder c67("c67" ,{256,8,8},p_float32);
	compute s61("s61",{v23,v19,v20,v18,v1,v7},c63(v23,v19,v20)+c66(v18,v19+v1,v20+v7)*c11(v23,v18,v1,v7),c63(v23,v19,v20));
	compute s62("s62",{v23,v19,v20},c63(v23,v19,v20),c67(v23,v19,v20));
	//generic
	placeholder c68("c68" ,{256,8,8},p_float32);
	compute s63("s63",{v18,v19,v20,v10},c63(v18,v19,v20)+c60(v10,v19*2,v20*2)*c10(v18,v10),c63(v18,v19,v20));
	compute s64("s64",{v18,v19,v20},c63(v18,v19,v20),c68(v18,v19,v20));
	//generic
	placeholder c69("c69" ,{256,8,8},p_float32);
	compute s65("s65",{v18,v19,v20},c67(v18,v19,v20)+c68(v18,v19,v20),c69(v18,v19,v20));
	//generic
	placeholder c70("c70" ,{256,8,8},p_float32);
	compute s66("s66",{v18,v19,v20},c69(v18,v19,v20),c70(v18,v19,v20));
	//padOp
	placeholder c71("c71" ,{256,10,10},p_float32);
	compute s67("s67",{v18,v21,v22},zero,c71(v18,v21,v22));
	compute s68("s68",{v18,v19,v20},c70(v18,v19,v20),c71(v18,v19+1,v20+1));
	//generic
	placeholder c72("c72" ,{256,8,8},p_float32);
	compute s69("s69",{v23,v19,v20,v18,v1,v7},c63(v23,v19,v20)+c71(v18,v19+v1,v20+v7)*c9(v23,v18,v1,v7),c63(v23,v19,v20));
	compute s70("s70",{v23,v19,v20},c63(v23,v19,v20),c72(v23,v19,v20));
	//generic
	placeholder c73("c73" ,{256,8,8},p_float32);
	compute s71("s71",{v18,v19,v20},c72(v18,v19,v20),c73(v18,v19,v20));
	//padOp
	placeholder c74("c74" ,{256,10,10},p_float32);
	compute s72("s72",{v18,v21,v22},zero,c74(v18,v21,v22));
	compute s73("s73",{v18,v19,v20},c73(v18,v19,v20),c74(v18,v19+1,v20+1));
	//generic
	placeholder c75("c75" ,{256,8,8},p_float32);
	compute s74("s74",{v23,v19,v20,v18,v1,v7},c63(v23,v19,v20)+c74(v18,v19+v1,v20+v7)*c8(v23,v18,v1,v7),c63(v23,v19,v20));
	compute s75("s75",{v23,v19,v20},c63(v23,v19,v20),c75(v23,v19,v20));
	
	//generic
	placeholder c76("c76" ,{256,8,8},p_float32);
	compute s76("s76",{v18,v19,v20},c75(v18,v19,v20)+c70(v18,v19,v20),c76(v18,v19,v20));
	//generic
	placeholder c77("c77" ,{256,8,8},p_float32);
	compute s77("s77",{v18,v19,v20},c76(v18,v19,v20),c77(v18,v19,v20));
	//padOp
	placeholder c78("c78" ,{256,10,10},p_float32);
	compute s78("s78",{v18,v21,v22},zero,c78(v18,v21,v22));
	compute s79("s79",{v18,v19,v20},c77(v18,v19,v20),c78(v18,v19+1,v20+1));
	//empty
	//generic
	var v24("v24", 0,512);
	var v25("v25", 0,4);
	var v26("v26", 0,4);
	placeholder c80("c80" ,{512,4,4},p_float32);
	compute s80("s80",{v24,v25,v26},zero,c80(v24,v25,v26));
	//generic
	placeholder c81("c81" ,{512,4,4},p_float32);
	compute s81("s81",{v24,v25,v26,v18,v1,v7},c80(v24,v25,v26)+c78(v18,v25*2+v1,v26*2+v7)*c7(v24,v18,v1,v7),c80(v24,v25,v26));
	compute s82("s82",{v24,v25,v26},c80(v24,v25,v26),c81(v24,v25,v26));
	//generic
	placeholder c82("c82" ,{512,4,4},p_float32);
	compute s83("s83",{v24,v25,v26},c81(v24,v25,v26),c82(v24,v25,v26));
	//padOp
	placeholder c83("c83" ,{512,6,6},p_float32);
	var v27("v27", 0,6);
	var v28("v28", 0,6);
	compute s84("s84",{v24,v27,v28},zero,c83(v24,v27,v28));
	compute s85("s85",{v24,v25,v26},c82(v24,v25,v26),c83(v24,v25+1,v26+1));
	//generic
	var v29("v29", 0,512);
	placeholder c84("c84" ,{512,4,4},p_float32);
	compute s86("s86",{v29,v25,v26,v24,v1,v7},c80(v29,v25,v26)+c83(v24,v25+v1,v26+v7)*c6(v29,v24,v1,v7),c80(v29,v25,v26));
	compute s87("s87",{v29,v25,v26},c80(v29,v25,v26),c84(v29,v25,v26));
	//generic
	//placeholder c85("c85" ,{512,4,4},p_float32);
	compute s88("s88",{v24,v25,v26,v18},c80(v24,v25,v26)+c77(v18,v25*2,v26*2)*c5(v24,v18),c80(v24,v25,v26));
	//compute s89("s89",{v24,v25,v26},c80(v24,v25,v26),c85(v24,v25,v26));
	//generic
	placeholder c86("c86" ,{512,4,4},p_float32);
	compute s90("s90",{v24,v25,v26},c84(v24,v25,v26)+c80(v24,v25,v26),c86(v24,v25,v26));//85 to 80
	//generic
	placeholder c87("c87" ,{512,4,4},p_float32);
	compute s91("s91",{v24,v25,v26},c86(v24,v25,v26),c87(v24,v25,v26));
	//padOp
	placeholder c88("c88" ,{512,6,6},p_float32);
	compute s92("s92",{v24,v27,v28},zero,c88(v24,v27,v28));
	compute s93("s93",{v24,v25,v26},c87(v24,v25,v26),c88(v24,v25+1,v26+1));
	//generic
	//placeholder c89("c89" ,{512,4,4},p_float32);
	compute s94("s94",{v29,v25,v26,v24,v1,v7},c80(v29,v25,v26)+c88(v24,v25+v1,v26+v7)*c4(v29,v24,v1,v7),c80(v29,v25,v26));
	//compute s95("s95",{v29,v25,v26},c80(v29,v25,v26),c89(v29,v25,v26));
	//generic
	placeholder c90("c90" ,{512,4,4},p_float32);
	compute s96("s96",{v24,v25,v26},c80(v24,v25,v26),c90(v24,v25,v26)); //89 to 80
	//padOp
	placeholder c91("c91" ,{512,6,6},p_float32);
	compute s97("s97",{v24,v27,v28},zero,c91(v24,v27,v28));
	compute s98("s98",{v24,v25,v26},c90(v24,v25,v26),c91(v24,v25+1,v26+1));
	//generic
	//placeholder c92("c92" ,{512,4,4},p_float32);
	compute s99("s99",{v29,v25,v26,v24,v1,v7},c80(v29,v25,v26)+c91(v24,v25+v1,v26+v7)*c3(v29,v24,v1,v7),c80(v29,v25,v26));
	//compute s100("s100",{v29,v25,v26},c80(v29,v25,v26),c92(v29,v25,v26));
	//generic
	placeholder c93("c93" ,{512,4,4},p_float32);
	compute s101("s101",{v24,v25,v26},c80(v24,v25,v26)+c87(v24,v25,v26),c93(v24,v25,v26));
	//generic
	placeholder c94("c94" ,{512,4,4},p_float32);
	compute s102("s102",{v24,v25,v26},c93(v24,v25,v26),c94(v24,v25,v26));
	//empty
	//generic
	placeholder c96("c96" ,{512},p_float32);
	compute s103("s103",{v24},zero,c96(v24));
	//empty
	//generic
	//placeholder c98("c98" ,{512},p_float32);
	compute s104("s104",{v24,v25,v26},c96(v24)+c93(v24,v25,v26),c96(v24));
	//compute s105("s105",{v24},c96(v24),c98(v24));
	//generic
	placeholder c99("c99" ,{512},p_float32);
	compute s106("s106",{v24},c96(v24)/c24,c99(v24));
	//col
	//placeholder c100("c100" ,{512},p_float32);
	//compute s107("s107",{v24},c99(v24),c100(v24*1));
	//empty
	//generic
	placeholder c102("c102" ,{512,10},p_float32);
	compute s108("s108",{v21,v24},c2(v21,v24),c102(v24,v21));
	//empty
	//generic
	placeholder c104("c104" ,{10},p_float32);
	compute s109("s109",{v21},zero,c104(v21));
	//generic
	//placeholder c105("c105" ,{10},p_float32);
	compute s110("s110",{v21,v24},c104(v21)+c99(v24)*c102(v24,v21),c104(v21));
	//compute s111("s111",{v21},c104(v21),c105(v21));
	//generic
	placeholder c106("c106" ,{10},p_float32);
	compute s112("s112",{v21},c104(v21)+c1(v21),c106(v21)); 
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
	//s14.after(s13,-1);
	s15.after(s13,-1);
	s16.after(s15,-1);
	s17.after(s16,-1);
	s18.after(s17,-1);
	s19.after(s18,-1);
	//s20.after(s19,-1);
	s21.after(s19,-1);
	s22.after(s21,-1);
	s23.after(s22,-1);
	s24.after(s23,-1);
	//s25.after(s24,-1);
	s26.after(s24,-1);
	s27.after(s26,-1);
	s28.after(s27,-1);
	s29.after(s28,-1);
	s30.after(s29,-1);
	s31.after(s30,-1);
	//s32.after(s31,-1);
	s33.after(s31,-1);
	s34.after(s33,-1);
	s35.after(s34,-1);
	s36.after(s35,-1);
	s37.after(s36,-1);
	s38.after(s37,-1);
	//s39.after(s38,-1);
	s40.after(s38,-1);
	s41.after(s40,-1);
	s42.after(s41,-1);
	s43.after(s42,-1);
	s44.after(s43,-1);
	//s45.after(s44,-1);
	s46.after(s44,-1);
	s47.after(s46,-1);
	s48.after(s47,-1);
	s49.after(s48,-1);
	//s50.after(s49,-1);
	s51.after(s49,-1);
	s52.after(s51,-1);
	s53.after(s52,-1);
	s54.after(s53,-1);
	s55.after(s54,-1);
	s56.after(s55,-1);
	//s57.after(s56,-1);
	s58.after(s56,-1);
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
	s84.after(s83,-1);
	s85.after(s84,-1);
	s86.after(s85,-1);
	s87.after(s86,-1);
	s88.after(s87,-1);
	//s89.after(s88,-1);
	s90.after(s88,-1);
	s91.after(s90,-1);
	s92.after(s91,-1);
	s93.after(s92,-1);
	s94.after(s93,-1);
	//s95.after(s94,-1);
	s96.after(s94,-1);
	s97.after(s96,-1);
	s98.after(s97,-1);
	s99.after(s98,-1);
	//s100.after(s99,-1);
	s101.after(s99,-1);
	s102.after(s101,-1);
	s103.after(s102,-1);
	s104.after(s103,-1);
	//s105.after(s104,-1);
	s106.after(s104,-1);
	//s107.after(s106,-1);
	s108.after(s106,-1);
	s109.after(s108,-1);
	s110.after(s109,-1);
	//s111.after(s110,-1);
	s112.after(s110,-1);
	fct->auto_DSE_loop_transformation();
    int count=0;
    for(auto &comp: fct->leader_computations){
        auto iterators = comp->get_iteration_variables();
        int size = iterators.size();
        if(size>=6){
          // std::cout<< "comp->final_strategy.size()"<<std::endl;
          comp->apply_opt_strategy({4,1,1});
        }
        if(size==4){
          // std::cout<< "comp->final_strategy.size()"<<std::endl;
          if(count!=0){
              comp->apply_opt_strategy({2,1,1});
              count+=1;
          }
          count+=1;
          
        }
    }
    fct->dump_schedule("/home/caobohan/POM/opt/resnet18/");
}