
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

  init("mobilenettmp");
  auto *fct = global::get_implicit_function();
  placeholder c0("c0" ,{3,32,32},p_float32);
	placeholder c1("c1" ,{32,3,3},p_float32);
	placeholder c2("c2" ,{64,3,3},p_float32);
	placeholder c3("c3" ,{128,3,3},p_float32);
	placeholder c4("c4" ,{128,3,3},p_float32);
	placeholder c5("c5" ,{256,3,3},p_float32);
	placeholder c6("c6" ,{256,3,3},p_float32);
	placeholder c7("c7" ,{512,3,3},p_float32);
	placeholder c8("c8" ,{512,3,3},p_float32);
	placeholder c9("c9" ,{512,3,3},p_float32);
	placeholder c10("c10" ,{512,3,3},p_float32);
	placeholder c11("c11" ,{512,3,3},p_float32);
	placeholder c12("c12" ,{512,3,3},p_float32);
	placeholder c13("c13" ,{1024,3,3},p_float32);
	placeholder c14("c14" ,{10},p_float32);
	placeholder c15("c15" ,{10,1024},p_float32);
	placeholder c16("c16" ,{1024,1024},p_float32);
	placeholder c17("c17" ,{1024,512},p_float32);
	placeholder c18("c18" ,{512,512},p_float32);
	placeholder c19("c19" ,{512,512},p_float32);
	placeholder c20("c20" ,{512,512},p_float32);
	placeholder c21("c21" ,{512,512},p_float32);
	placeholder c22("c22" ,{512,512},p_float32);
	placeholder c23("c23" ,{512,256},p_float32);
	placeholder c24("c24" ,{256,256},p_float32);
	placeholder c25("c25" ,{256,128},p_float32);
	placeholder c26("c26" ,{128,128},p_float32);
	placeholder c27("c27" ,{128,64},p_float32);
	placeholder c28("c28" ,{64,32},p_float32);
	placeholder c29("c29" ,{32,3,3,3},p_float32);
	constant zero(0);
	constant c31(4.000000e+00);
	//padOp
	placeholder c32("c32" ,{3,34,34},p_float32);
	var v1("v1", 0,3);
	var v2("v2", 0,34);
	var v3("v3", 0,34);
	var v4("v4", 0,32);
	var v5("v5", 0,32);
	compute s0("s0",{v1,v2,v3},zero,c32(v1,v2,v3));
	compute s1("s1",{v1,v4,v5},c0(v1,v4,v5),c32(v1,v4+1,v5+1));
	//empty
	//generic
	var v6("v6", 0,32);
	placeholder c34("c34" ,{32,32,32},p_float32);
	compute s2("s2",{v4,v5,v6},zero,c34(v4,v5,v6));
	//generic
	var v7("v7", 0,3);
	var v8("v8", 0,3);
	placeholder c35("c35" ,{32,32,32},p_float32);
	compute s3("s3",{v4,v5,v6,v1,v7,v8},c34(v4,v5,v6)+c32(v1,v5+v7,v6+v8)*c29(v4,v1,v7,v8),c34(v4,v5,v6));
	compute s4("s4",{v4,v5,v6},c34(v4,v5,v6),c35(v4,v5,v6));
	//generic
	placeholder c36("c36" ,{32,32,32},p_float32);
	compute s5("s5",{v4,v5,v6},c35(v4,v5,v6),c36(v4,v5,v6));
	//padOp
	placeholder c37("c37" ,{32,34,34},p_float32);
	compute s6("s6",{v4,v2,v3},zero,c37(v4,v2,v3));
	compute s7("s7",{v4,v5,v6},c36(v4,v5,v6),c37(v4,v5+1,v6+1));
	//generic
	placeholder c38("c38" ,{32,32,32},p_float32);
	compute s8("s8",{v5,v6,v4,v1,v7},c34(v4,v5,v6)+c37(v4,v5+v1,v6+v7)*c1(v4,v1,v7),c34(v4,v5,v6));
	compute s9("s9",{v4,v5,v6},c34(v4,v5,v6),c38(v4,v5,v6));
	//generic
	placeholder c39("c39" ,{32,32,32},p_float32);
	compute s10("s10",{v4,v5,v6},c38(v4,v5,v6),c39(v4,v5,v6));
	//empty
	//generic
	var v9("v9", 0,64);
	placeholder c41("c41" ,{64,32,32},p_float32);
	compute s11("s11",{v9,v4,v5},zero,c41(v9,v4,v5));
	//generic
	placeholder c42("c42" ,{64,32,32},p_float32);
	compute s12("s12",{v9,v5,v6,v4},c41(v9,v5,v6)+c39(v4,v5,v6)*c28(v9,v4),c41(v9,v5,v6));
	compute s13("s13",{v9,v5,v6},c41(v9,v5,v6),c42(v9,v5,v6));
	//generic
	placeholder c43("c43" ,{64,32,32},p_float32);
	compute s14("s14",{v9,v4,v5},c42(v9,v4,v5),c43(v9,v4,v5));
	//padOp
	placeholder c44("c44" ,{64,34,34},p_float32);
	compute s15("s15",{v9,v2,v3},zero,c44(v9,v2,v3));
	compute s16("s16",{v9,v4,v5},c43(v9,v4,v5),c44(v9,v4+1,v5+1));
	//empty
	//generic
	var v12("v12", 0,16);
	var v13("v13", 0,16);
	placeholder c46("c46" ,{64,16,16},p_float32);
	compute s17("s17",{v9,v12,v13},zero,c46(v9,v12,v13));
	//generic
	placeholder c47("c47" ,{64,16,16},p_float32);
	compute s18("s18",{v12,v13,v9,v1,v7},c46(v9,v12,v13)+c44(v9,v12*2+v1,v13*2+v7)*c2(v9,v1,v7),c46(v9,v12,v13));
	compute s19("s19",{v9,v12,v13},c46(v9,v12,v13),c47(v9,v12,v13));
	//generic
	placeholder c48("c48" ,{64,16,16},p_float32);
	compute s20("s20",{v9,v12,v13},c47(v9,v12,v13),c48(v9,v12,v13));
	//empty
	//generic
	var v14("v14", 0,128);
	placeholder c50("c50" ,{128,16,16},p_float32);
	compute s21("s21",{v14,v12,v13},zero,c50(v14,v12,v13));
	//generic
	placeholder c51("c51" ,{128,16,16},p_float32);
	compute s22("s22",{v14,v12,v13,v9},c50(v14,v12,v13)+c48(v9,v12,v13)*c27(v14,v9),c50(v14,v12,v13));
	compute s23("s23",{v14,v12,v13},c50(v14,v12,v13),c51(v14,v12,v13));
	//generic
	placeholder c52("c52" ,{128,16,16},p_float32);
	compute s24("s24",{v14,v12,v13},c51(v14,v12,v13),c52(v14,v12,v13));
	//padOp
	placeholder c53("c53" ,{128,18,18},p_float32);
	var v15("v15", 0,18);
	var v16("v16", 0,18);
	compute s25("s25",{v14,v15,v16},zero,c53(v14,v15,v16));
	compute s26("s26",{v14,v12,v13},c52(v14,v12,v13),c53(v14,v12+1,v13+1));
	//generic
	placeholder c54("c54" ,{128,16,16},p_float32);
	compute s27("s27",{v12,v13,v14,v1,v7},c50(v14,v12,v13)+c53(v14,v12+v1,v13+v7)*c3(v14,v1,v7),c50(v14,v12,v13));
	compute s28("s28",{v14,v12,v13},c50(v14,v12,v13),c54(v14,v12,v13));
	//generic
	placeholder c55("c55" ,{128,16,16},p_float32);
	compute s29("s29",{v14,v12,v13},c54(v14,v12,v13),c55(v14,v12,v13));
	//generic
	var v17("v17", 0,128);
	placeholder c56("c56" ,{128,16,16},p_float32);
	compute s30("s30",{v17,v12,v13,v14},c50(v17,v12,v13)+c55(v14,v12,v13)*c26(v17,v14),c50(v17,v12,v13));
	compute s31("s31",{v17,v12,v13},c50(v17,v12,v13),c56(v17,v12,v13));
	//generic
	placeholder c57("c57" ,{128,16,16},p_float32);
	compute s32("s32",{v14,v12,v13},c56(v14,v12,v13),c57(v14,v12,v13));
	//padOp
	placeholder c58("c58" ,{128,18,18},p_float32);
	compute s33("s33",{v14,v15,v16},zero,c58(v14,v15,v16));
	compute s34("s34",{v14,v12,v13},c57(v14,v12,v13),c58(v14,v12+1,v13+1));
	//empty
	//generic
	var v18("v18", 0,8);
	var v19("v19", 0,8);
	placeholder c60("c60" ,{128,8,8},p_float32);
	compute s35("s35",{v14,v18,v19},zero,c60(v14,v18,v19));
	//generic
	placeholder c61("c61" ,{128,8,8},p_float32);
	compute s36("s36",{v18,v19,v14,v1,v7},c60(v14,v18,v19)+c58(v14,v18*2+v1,v19*2+v7)*c4(v14,v1,v7),c60(v14,v18,v19));
	compute s37("s37",{v14,v18,v19},c60(v14,v18,v19),c61(v14,v18,v19));
	//generic
	placeholder c62("c62" ,{128,8,8},p_float32);
	compute s38("s38",{v14,v18,v19},c61(v14,v18,v19),c62(v14,v18,v19));
	//empty
	//generic
	var v20("v20", 0,256);
	placeholder c64("c64" ,{256,8,8},p_float32);
	compute s39("s39",{v20,v18,v19},zero,c64(v20,v18,v19));
	//generic
	placeholder c65("c65" ,{256,8,8},p_float32);
	compute s40("s40",{v20,v18,v19,v14},c64(v20,v18,v19)+c62(v14,v18,v19)*c25(v20,v14),c64(v20,v18,v19));
	compute s41("s41",{v20,v18,v19},c64(v20,v18,v19),c65(v20,v18,v19));
	//generic
	placeholder c66("c66" ,{256,8,8},p_float32);
	compute s42("s42",{v20,v18,v19},c65(v20,v18,v19),c66(v20,v18,v19));
	//padOp
	placeholder c67("c67" ,{256,10,10},p_float32);
	var v21("v21", 0,10);
	var v22("v22", 0,10);
	compute s43("s43",{v20,v21,v22},zero,c67(v20,v21,v22));
	compute s44("s44",{v20,v18,v19},c66(v20,v18,v19),c67(v20,v18+1,v19+1));
	//generic
	placeholder c68("c68" ,{256,8,8},p_float32);
	compute s45("s45",{v18,v19,v20,v1,v7},c64(v20,v18,v19)+c67(v20,v18+v1,v19+v7)*c5(v20,v1,v7),c64(v20,v18,v19));
	compute s46("s46",{v20,v18,v19},c64(v20,v18,v19),c68(v20,v18,v19));
	//generic
	placeholder c69("c69" ,{256,8,8},p_float32);
	compute s47("s47",{v20,v18,v19},c68(v20,v18,v19),c69(v20,v18,v19));
	//generic
	var v23("v23", 0,256);
	placeholder c70("c70" ,{256,8,8},p_float32);
	compute s48("s48",{v23,v18,v19,v20},c64(v23,v18,v19)+c69(v20,v18,v19)*c24(v23,v20),c64(v23,v18,v19));
	compute s49("s49",{v23,v18,v19},c64(v23,v18,v19),c70(v23,v18,v19));
	//generic
	placeholder c71("c71" ,{256,8,8},p_float32);
	compute s50("s50",{v20,v18,v19},c70(v20,v18,v19),c71(v20,v18,v19));
	//padOp
	placeholder c72("c72" ,{256,10,10},p_float32);
	compute s51("s51",{v20,v21,v22},zero,c72(v20,v21,v22));
	compute s52("s52",{v20,v18,v19},c71(v20,v18,v19),c72(v20,v18+1,v19+1));
	//empty
	//generic
	var v24("v24", 0,4);
	var v25("v25", 0,4);
	placeholder c74("c74" ,{256,4,4},p_float32);
	compute s53("s53",{v20,v24,v25},zero,c74(v20,v24,v25));
	//generic
	placeholder c75("c75" ,{256,4,4},p_float32);
	compute s54("s54",{v24,v25,v20,v1,v7},c74(v20,v24,v25)+c72(v20,v24*2+v1,v25*2+v7)*c6(v20,v1,v7),c74(v20,v24,v25));
	compute s55("s55",{v20,v24,v25},c74(v20,v24,v25),c75(v20,v24,v25));
	//generic
	placeholder c76("c76" ,{256,4,4},p_float32);
	compute s56("s56",{v20,v24,v25},c75(v20,v24,v25),c76(v20,v24,v25));
	//empty
	//generic
	var v26("v26", 0,512);
	placeholder c78("c78" ,{512,4,4},p_float32);
	compute s57("s57",{v26,v24,v25},zero,c78(v26,v24,v25));
	//generic
	placeholder c79("c79" ,{512,4,4},p_float32);
	compute s58("s58",{v26,v24,v25,v20},c78(v26,v24,v25)+c76(v20,v24,v25)*c23(v26,v20),c78(v26,v24,v25));
	compute s59("s59",{v26,v24,v25},c78(v26,v24,v25),c79(v26,v24,v25));
	//generic
	placeholder c80("c80" ,{512,4,4},p_float32);
	compute s60("s60",{v26,v24,v25},c79(v26,v24,v25),c80(v26,v24,v25));
	//padOp
	placeholder c81("c81" ,{512,6,6},p_float32);
	var v27("v27", 0,6);
	var v28("v28", 0,6);
	compute s61("s61",{v26,v27,v28},zero,c81(v26,v27,v28));
	compute s62("s62",{v26,v24,v25},c80(v26,v24,v25),c81(v26,v24+1,v25+1));
	//generic
	placeholder c82("c82" ,{512,4,4},p_float32);
	compute s63("s63",{v24,v25,v26,v1,v7},c78(v26,v24,v25)+c81(v26,v24+v1,v25+v7)*c7(v26,v1,v7),c78(v26,v24,v25));
	compute s64("s64",{v26,v24,v25},c78(v26,v24,v25),c82(v26,v24,v25));
	//generic
	placeholder c83("c83" ,{512,4,4},p_float32);
	compute s65("s65",{v26,v24,v25},c82(v26,v24,v25),c83(v26,v24,v25));
	//generic
	var v29("v29", 0,512);
	placeholder c84("c84" ,{512,4,4},p_float32);
	compute s66("s66",{v29,v24,v25,v26},c78(v29,v24,v25)+c83(v26,v24,v25)*c22(v29,v26),c78(v29,v24,v25));
	compute s67("s67",{v29,v24,v25},c78(v29,v24,v25),c84(v29,v24,v25));
	//generic
	placeholder c85("c85" ,{512,4,4},p_float32);
	compute s68("s68",{v26,v24,v25},c84(v26,v24,v25),c85(v26,v24,v25));
	//padOp
	placeholder c86("c86" ,{512,6,6},p_float32);
	compute s69("s69",{v26,v27,v28},zero,c86(v26,v27,v28));
	compute s70("s70",{v26,v24,v25},c85(v26,v24,v25),c86(v26,v24+1,v25+1));
	//generic
	placeholder c87("c87" ,{512,4,4},p_float32);
	compute s71("s71",{v24,v25,v26,v1,v7},c78(v26,v24,v25)+c86(v26,v24+v1,v25+v7)*c8(v26,v1,v7),c78(v26,v24,v25));
	compute s72("s72",{v26,v24,v25},c78(v26,v24,v25),c87(v26,v24,v25));
	//generic
	placeholder c88("c88" ,{512,4,4},p_float32);
	compute s73("s73",{v26,v24,v25},c87(v26,v24,v25),c88(v26,v24,v25));
	//generic
	placeholder c89("c89" ,{512,4,4},p_float32);
	compute s74("s74",{v29,v24,v25,v26},c78(v29,v24,v25)+c88(v26,v24,v25)*c21(v29,v26),c78(v29,v24,v25));
	compute s75("s75",{v29,v24,v25},c78(v29,v24,v25),c89(v29,v24,v25));
	//generic
	placeholder c90("c90" ,{512,4,4},p_float32);
	compute s76("s76",{v26,v24,v25},c89(v26,v24,v25),c90(v26,v24,v25));
	//padOp
	placeholder c91("c91" ,{512,6,6},p_float32);
	compute s77("s77",{v26,v27,v28},zero,c91(v26,v27,v28));
	compute s78("s78",{v26,v24,v25},c90(v26,v24,v25),c91(v26,v24+1,v25+1));
	//generic
	placeholder c92("c92" ,{512,4,4},p_float32);
	compute s79("s79",{v24,v25,v26,v1,v7},c78(v26,v24,v25)+c91(v26,v24+v1,v25+v7)*c9(v26,v1,v7),c78(v26,v24,v25));
	compute s80("s80",{v26,v24,v25},c78(v26,v24,v25),c92(v26,v24,v25));
	//generic
	placeholder c93("c93" ,{512,4,4},p_float32);
	compute s81("s81",{v26,v24,v25},c92(v26,v24,v25),c93(v26,v24,v25));
	//generic
	placeholder c94("c94" ,{512,4,4},p_float32);
	compute s82("s82",{v29,v24,v25,v26},c78(v29,v24,v25)+c93(v26,v24,v25)*c20(v29,v26),c78(v29,v24,v25));
	compute s83("s83",{v29,v24,v25},c78(v29,v24,v25),c94(v29,v24,v25));
	//generic
	placeholder c95("c95" ,{512,4,4},p_float32);
	compute s84("s84",{v26,v24,v25},c94(v26,v24,v25),c95(v26,v24,v25));
	//padOp
	placeholder c96("c96" ,{512,6,6},p_float32);
	compute s85("s85",{v26,v27,v28},zero,c96(v26,v27,v28));
	compute s86("s86",{v26,v24,v25},c95(v26,v24,v25),c96(v26,v24+1,v25+1));
	//generic
	placeholder c97("c97" ,{512,4,4},p_float32);
	compute s87("s87",{v24,v25,v26,v1,v7},c78(v26,v24,v25)+c96(v26,v24+v1,v25+v7)*c10(v26,v1,v7),c78(v26,v24,v25));
	compute s88("s88",{v26,v24,v25},c78(v26,v24,v25),c97(v26,v24,v25));
	//generic
	placeholder c98("c98" ,{512,4,4},p_float32);
	compute s89("s89",{v26,v24,v25},c97(v26,v24,v25),c98(v26,v24,v25));
	//generic
	placeholder c99("c99" ,{512,4,4},p_float32);
	compute s90("s90",{v29,v24,v25,v26},c78(v29,v24,v25)+c98(v26,v24,v25)*c19(v29,v26),c78(v29,v24,v25));
	compute s91("s91",{v29,v24,v25},c78(v29,v24,v25),c99(v29,v24,v25));
	//generic
	placeholder c100("c100" ,{512,4,4},p_float32);
	compute s92("s92",{v26,v24,v25},c99(v26,v24,v25),c100(v26,v24,v25));
	//padOp
	placeholder c101("c101" ,{512,6,6},p_float32);
	compute s93("s93",{v26,v27,v28},zero,c101(v26,v27,v28));
	compute s94("s94",{v26,v24,v25},c100(v26,v24,v25),c101(v26,v24+1,v25+1));
	//generic
	placeholder c102("c102" ,{512,4,4},p_float32);
	compute s95("s95",{v24,v25,v26,v1,v7},c78(v26,v24,v25)+c101(v26,v24+v1,v25+v7)*c11(v26,v1,v7),c78(v26,v24,v25));
	compute s96("s96",{v26,v24,v25},c78(v26,v24,v25),c102(v26,v24,v25));
	//generic
	placeholder c103("c103" ,{512,4,4},p_float32);
	compute s97("s97",{v26,v24,v25},c102(v26,v24,v25),c103(v26,v24,v25));
	//generic
	placeholder c104("c104" ,{512,4,4},p_float32);
	compute s98("s98",{v29,v24,v25,v26},c78(v29,v24,v25)+c103(v26,v24,v25)*c18(v29,v26),c78(v29,v24,v25));
	compute s99("s99",{v29,v24,v25},c78(v29,v24,v25),c104(v29,v24,v25));
	//generic
	placeholder c105("c105" ,{512,4,4},p_float32);
	compute s100("s100",{v26,v24,v25},c104(v26,v24,v25),c105(v26,v24,v25));
	//padOp
	placeholder c106("c106" ,{512,6,6},p_float32);
	compute s101("s101",{v26,v27,v28},zero,c106(v26,v27,v28));
	compute s102("s102",{v26,v24,v25},c105(v26,v24,v25),c106(v26,v24+1,v25+1));
	//empty
	//generic
	var v30("v30", 0,2);
	var v31("v31", 0,2);
	placeholder c108("c108" ,{512,2,2},p_float32);
	compute s103("s103",{v26,v30,v31},zero,c108(v26,v30,v31));
	//generic
	placeholder c109("c109" ,{512,2,2},p_float32);
	compute s104("s104",{v30,v31,v26,v1,v7},c108(v26,v30,v31)+c106(v26,v30*2+v1,v31*2+v7)*c12(v26,v1,v7),c108(v26,v30,v31));
	compute s105("s105",{v26,v30,v31},c108(v26,v30,v31),c109(v26,v30,v31));
	//generic
	placeholder c110("c110" ,{512,2,2},p_float32);
	compute s106("s106",{v26,v30,v31},c109(v26,v30,v31),c110(v26,v30,v31));
	//empty
	//generic
	var v32("v32", 0,1024);
	placeholder c112("c112" ,{1024,2,2},p_float32);
	compute s107("s107",{v32,v30,v31},zero,c112(v32,v30,v31));
	//generic
	placeholder c113("c113" ,{1024,2,2},p_float32);
	compute s108("s108",{v32,v30,v31,v26},c112(v32,v30,v31)+c110(v26,v30,v31)*c17(v32,v26),c112(v32,v30,v31));
	compute s109("s109",{v32,v30,v31},c112(v32,v30,v31),c113(v32,v30,v31));
	//generic
	placeholder c114("c114" ,{1024,2,2},p_float32);
	compute s110("s110",{v32,v30,v31},c113(v32,v30,v31),c114(v32,v30,v31));
	//padOp
	placeholder c115("c115" ,{1024,4,4},p_float32);
	compute s111("s111",{v32,v24,v25},zero,c115(v32,v24,v25));
	compute s112("s112",{v32,v30,v31},c114(v32,v30,v31),c115(v32,v30+1,v31+1));
	//generic
	placeholder c116("c116" ,{1024,2,2},p_float32);
	compute s113("s113",{v30,v31,v32,v1,v7},c112(v32,v30,v31)+c115(v32,v30+v1,v31+v7)*c13(v32,v1,v7),c112(v32,v30,v31));
	compute s114("s114",{v32,v30,v31},c112(v32,v30,v31),c116(v32,v30,v31));
	//generic
	placeholder c117("c117" ,{1024,2,2},p_float32);
	compute s115("s115",{v32,v30,v31},c116(v32,v30,v31),c117(v32,v30,v31));
	//generic
	var v33("v33", 0,1024);
	placeholder c118("c118" ,{1024,2,2},p_float32);
	compute s116("s116",{v33,v30,v31,v32},c112(v33,v30,v31)+c117(v32,v30,v31)*c16(v33,v32),c112(v33,v30,v31));
	compute s117("s117",{v33,v30,v31},c112(v33,v30,v31),c118(v33,v30,v31));
	//generic
	placeholder c119("c119" ,{1024,2,2},p_float32);
	compute s118("s118",{v32,v30,v31},c118(v32,v30,v31),c119(v32,v30,v31));
	//empty
	//generic
	placeholder c121("c121" ,{1024},p_float32);
	compute s119("s119",{v32},zero,c121(v32));
	//empty
	//generic
	placeholder c123("c123" ,{1024},p_float32);
	compute s120("s120",{v32,v30,v31},c121(v32)+c119(v32,v30,v31),c121(v32));
	compute s121("s121",{v32},c121(v32),c123(v32));
	//generic
	placeholder c124("c124" ,{1024},p_float32);
	compute s122("s122",{v32},c123(v32)/c31,c124(v32));
	//col
	placeholder c125("c125" ,{1024},p_float32);
	compute s123("s123",{v32},c124(v32),c125(v32*1));
	//empty
	//generic
	placeholder c127("c127" ,{1024,10},p_float32);
	compute s124("s124",{v21,v32},c15(v21,v32),c127(v32,v21));
	//empty
	//generic
	placeholder c129("c129" ,{10},p_float32);
	compute s125("s125",{v21},zero,c129(v21));
	//generic
	placeholder c130("c130" ,{10},p_float32);
	compute s126("s126",{v21,v32},c129(v21)+c125(v32)*c127(v32,v21),c129(v21));
	compute s127("s127",{v21},c129(v21),c130(v21));
	//generic
	placeholder c131("c131" ,{10},p_float32);
	compute s128("s128",{v21},c130(v21)+c14(v21),c131(v21));
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
	s84.after(s83,-1);
	s85.after(s84,-1);
	s86.after(s85,-1);
	s87.after(s86,-1);
	s88.after(s87,-1);
	s89.after(s88,-1);
	s90.after(s89,-1);
	s91.after(s90,-1);
	s92.after(s91,-1);
	s93.after(s92,-1);
	s94.after(s93,-1);
	s95.after(s94,-1);
	s96.after(s95,-1);
	s97.after(s96,-1);
	s98.after(s97,-1);
	s99.after(s98,-1);
	s100.after(s99,-1);
	s101.after(s100,-1);
	s102.after(s101,-1);
	s103.after(s102,-1);
	s104.after(s103,-1);
	s105.after(s104,-1);
	s106.after(s105,-1);
	s107.after(s106,-1);
	s108.after(s107,-1);
	s109.after(s108,-1);
	s110.after(s109,-1);
	s111.after(s110,-1);
	s112.after(s111,-1);
	s113.after(s112,-1);
	s114.after(s113,-1);
	s115.after(s114,-1);
	s116.after(s115,-1);
	s117.after(s116,-1);
	s118.after(s117,-1);
	s119.after(s118,-1);
	s120.after(s119,-1);
	s121.after(s120,-1);
	s122.after(s121,-1);
	s123.after(s122,-1);
	s124.after(s123,-1);
	s125.after(s124,-1);
	s126.after(s125,-1);
	s127.after(s126,-1);
	s128.after(s127,-1);
	fct->auto_DSE_loop_transformation();
    int count=0;
    for(auto &comp: fct->leader_computations){
        auto iterators = comp->get_iteration_variables();
        int size = iterators.size();
        if(size>=5){
          // std::cout<< "comp->final_strategy.size()"<<std::endl;
          comp->apply_opt_strategy({1,1,16});
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
	
    fct->dump_schedule("/home/POM/samples/example/");
}