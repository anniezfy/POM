
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
/// Latency=68736253979, interval=68736253979
/// DSP=8, BRAM=0
void gemm(
  float v0,
  float v1,
  float v2[4096][4096],
  float v3[4096][4096],
  float v4[4096][4096],
  float v5[4096][4096]
) {	// L2, [0,68736253979)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS resource variable=v5 core=ram_s2p_bram

  for (int v6 = 0; v6 < 4096; v6 += 1) {	// L3, [0,16777224), iterCycle=7, II=1
    for (int v7 = 0; v7 < 4096; v7 += 1) {	// L4, [68719476753,68719480857), iterCycle=7, II=1
      #pragma HLS pipeline II=1
      float v8 = v4[v6][v7];	// L5, [0,2)
      float v9 = v8 * v1;	// L6, [2,6)
      v4[v6][v7] = v9;	// L7, [6,7)
    }
  }
  for (int v10 = 0; v10 < 4096; v10 += 1) {	// L10, [16777224,68736253977), iterCycle=16, II=1
    for (int v11 = 0; v11 < 4096; v11 += 1) {	// L11, [0,16777233), iterCycle=16, II=1
      for (int v12 = 0; v12 < 4096; v12 += 1) {	// L12, [0,4113), iterCycle=16, II=1
        #pragma HLS pipeline II=1
        float v13 = v2[v11][v10];	// L13, [0,2)
        float v14 = v0 * v13;	// L14, [2,6)
        float v15 = v3[v10][v12];	// L15, [4,6)
        float v16 = v15 * v14;	// L16, [6,10)
        float v17 = v4[v11][v12];	// L17, [8,10)
        float v18 = v16 + v17;	// L18, [10,15)
        v4[v11][v12] = v18;	// L19, [15,16)
      }
    }
  }
}

