
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
/// Latency=3363966828559, interval=3363966828559
/// DSP=2, BRAM=0
void seidel(
  float v0,
  float v1[4096][4096],
  float v2[4096][4096]
) {	// L2, [0,3363966828559)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  for (int v3 = 0; v3 < 4096; v3 += 1) {	// L3, [0,3363966828557), iterCycle=60, II=49
    for (int v4 = 0; v4 < 4094; v4 += 1) {	// L4, [0,821280977), iterCycle=60, II=49
      for (int v5 = 0; v5 < 4094; v5 += 1) {	// L5, [0,200619), iterCycle=60, II=49
        #pragma HLS pipeline II=1
        float v6 = v1[v4][(v5 + 1)];	// L6, [0,2)
        float v7 = v1[v4][v5];	// L7, [1,3)
        float v8 = v6 + v7;	// L8, [3,8)
        float v9 = v1[v4][(v5 + 2)];	// L9, [6,8)
        float v10 = v9 + v8;	// L10, [8,13)
        float v11 = v1[(v4 + 1)][v5];	// L11, [11,13)
        float v12 = v11 + v10;	// L12, [13,18)
        float v13 = v1[(v4 + 1)][(v5 + 1)];	// L13, [16,18)
        float v14 = v13 + v12;	// L14, [18,23)
        float v15 = v1[(v4 + 1)][(v5 + 2)];	// L15, [21,23)
        float v16 = v15 + v14;	// L16, [23,28)
        float v17 = v1[(v4 + 2)][v5];	// L17, [26,28)
        float v18 = v17 + v16;	// L18, [28,33)
        float v19 = v1[(v4 + 2)][(v5 + 1)];	// L19, [31,33)
        float v20 = v19 + v18;	// L20, [33,38)
        float v21 = v1[(v4 + 2)][(v5 + 2)];	// L21, [36,38)
        float v22 = v21 + v20;	// L22, [38,43)
        float v23 = v22 / v0;	// L23, [43,59)
        v1[(v4 + 1)][(v5 + 1)] = v23;	// L24, [59,60)
      }
    }
  }
}

