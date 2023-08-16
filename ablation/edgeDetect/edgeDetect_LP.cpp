
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
/// Latency=603390164, interval=603390164
/// DSP=2, BRAM=0
void edgeDetect(
  float v0,
  float v1[4096][4096][3],
  float v2[4096][4096][3],
  float v3[4096][4096][3]
) {	// L2, [0,603390164)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  for (int v4 = 0; v4 < 4094; v4 += 1) {	// L3, [0,402260113), iterCycle=55, II=8
    for (int v5 = 0; v5 < 4094; v5 += 1) {	// L4, [201130049,201228354), iterCycle=55, II=8
      for (int v6 = 0; v6 < 3; v6 += 1) {	// L5, [201130049,201130122), iterCycle=55, II=8
        #pragma HLS pipeline II=1
        float v7 = v2[v4][v5][v6];	// L6, [0,2)
        float v8 = v2[v4][(v5 + 1)][v6];	// L7, [1,3)
        float v9 = v7 + v8;	// L8, [3,8)
        float v10 = v2[v4][(v5 + 2)][v6];	// L9, [6,8)
        float v11 = v10 + v9;	// L10, [8,13)
        float v12 = v2[(v4 + 1)][v5][v6];	// L11, [11,13)
        float v13 = v12 + v11;	// L12, [13,18)
        float v14 = v2[(v4 + 1)][(v5 + 2)][v6];	// L13, [16,18)
        float v15 = v14 + v13;	// L14, [18,23)
        float v16 = v2[(v4 + 2)][v5][v6];	// L15, [21,23)
        float v17 = v16 + v15;	// L16, [23,28)
        float v18 = v2[(v4 + 2)][(v5 + 1)][v6];	// L17, [26,28)
        float v19 = v18 + v17;	// L18, [28,33)
        float v20 = v2[(v4 + 2)][(v5 + 2)][v6];	// L19, [31,33)
        float v21 = v20 + v19;	// L20, [33,38)
        float v22 = v21 / v0;	// L21, [38,54)
        v3[v4][v5][v6] = v22;	// L22, [54,55)
      }
    }
  }
  for (int v23 = 0; v23 < 4094; v23 += 1) {	// L26, [402260113,603390162), iterCycle=19, II=4
    for (int v24 = 0; v24 < 4094; v24 += 1) {	// L27, [0,49145), iterCycle=19, II=4
      for (int v25 = 0; v25 < 3; v25 += 1) {	// L28, [0,29), iterCycle=19, II=4
        #pragma HLS pipeline II=1
        float v26 = v3[(v23 + 1)][(v24 + 1)][v25];	// L29, [0,2)
        float v27 = v3[(v23 + 2)][v24][v25];	// L30, [1,3)
        float v28 = v26 - v27;	// L31, [3,8)
        float v29 = v3[(v23 + 2)][(v24 + 1)][v25];	// L32, [6,8)
        float v30 = v29 + v28;	// L33, [8,13)
        float v31 = v3[(v23 + 1)][v24][v25];	// L34, [11,13)
        float v32 = v31 - v30;	// L35, [13,18)
        v1[v23][v24][v25] = v32;	// L36, [18,19)
      }
    }
  }
}

