
//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for High-level Synthesis (HLS).
//
//===----------------------------------------------------------------------===//

#include <algorithm>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

using namespace std;

/// This is top function.
/// Latency=1099545182236, interval=1099545182236
/// DSP=5, BRAM=0
void 2mm(
  float v0,
  float v1,
  float v2,
  float v3[4096][4096],
  float v4[4096][4096],
  float v5[4096][4096],
  float v6[4096][4096],
  float v7[4096][4096]
) {	// L2, [0,1099545182236)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface s_axilite port=v2 bundle=ctrl
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6
  #pragma HLS interface bram port=v7

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS resource variable=v7 core=ram_s2p_bram

  for (int v8 = 0; v8 < 4096; v8 += 1) {	// L3, [0,16777218), iterCycle=1, II=1
    for (int v9 = 0; v9 < 4096; v9 += 1) {	// L4, [1099528405016,1099528409114), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v7[v8][v9] = v2;	// L5, [0,1)
    }
  }
  for (int v10 = 0; v10 < 4096; v10 += 1) {	// L8, [16777218,549772591116), iterCycle=16, II=8
    for (int v11 = 0; v11 < 4096; v11 += 1) {	// L9, [549772591118,549906808856), iterCycle=16, II=8
      for (int v12 = 0; v12 < 4096; v12 += 1) {	// L10, [549772591118,549772623896), iterCycle=16, II=8
        #pragma HLS pipeline II=1
        float v13 = v3[v10][v12];	// L11, [0,2)
        float v14 = v0 * v13;	// L12, [2,6)
        float v15 = v4[v12][v11];	// L13, [4,6)
        float v16 = v15 * v14;	// L14, [6,10)
        float v17 = v7[v10][v11];	// L15, [8,10)
        float v18 = v16 + v17;	// L16, [10,15)
        v7[v10][v11] = v18;	// L17, [15,16)
      }
    }
  }
  for (int v19 = 0; v19 < 4096; v19 += 1) {	// L21, [549772591116,549789368340), iterCycle=7, II=1
    for (int v20 = 0; v20 < 4096; v20 += 1) {	// L22, [549755813894,549755817998), iterCycle=7, II=1
      #pragma HLS pipeline II=1
      float v21 = v6[v19][v20];	// L23, [0,2)
      float v22 = v21 * v1;	// L24, [2,6)
      v6[v19][v20] = v22;	// L25, [6,7)
    }
  }
  for (int v23 = 0; v23 < 4096; v23 += 1) {	// L28, [549789368340,1099545182234), iterCycle=12, II=8
    for (int v24 = 0; v24 < 4096; v24 += 1) {	// L29, [0,134217734), iterCycle=12, II=8
      for (int v25 = 0; v25 < 4096; v25 += 1) {	// L30, [0,32774), iterCycle=12, II=8
        #pragma HLS pipeline II=1
        float v26 = v7[v23][v25];	// L31, [0,2)
        float v27 = v5[v25][v24];	// L32, [0,2)
        float v28 = v26 * v27;	// L33, [2,6)
        float v29 = v6[v23][v24];	// L34, [4,6)
        float v30 = v28 + v29;	// L35, [6,11)
        v6[v23][v24] = v30;	// L36, [11,12)
      }
    }
  }
}

