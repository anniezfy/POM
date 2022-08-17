
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
/// Latency=824784732166, interval=824784732166
/// DSP=5, BRAM=0
void gemm(
  float v0,
  float v1,
  float v2[4096][4096],
  float v3[4096][4096],
  float v4[4096][4096],
  float v5[4096][4096],
  float v6[4096][4096]
) {	// L2, [0,824784732166)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS resource variable=v6 core=ram_s2p_bram

  for (int v7 = 0; v7 < 4096; v7 += 1) {	// L3, [0,117448706), iterCycle=28674, II=28674
    for (int v8 = 0; v8 < 4096; v8 += 1) {	// L4, [0,28674), iterCycle=7, II=7
      float v9 = v4[v7][v8];	// L5, [0,2)
      float v10 = v9 * v1;	// L6, [2,6)
      v4[v7][v8] = v10;	// L7, [6,7)
    }
  }
  for (int v11 = 0; v11 < 4096; v11 += 1) {	// L10, [117448706,824784732164), iterCycle=201334786, II=201334786
    for (int v12 = 0; v12 < 4096; v12 += 1) {	// L11, [0,201334786), iterCycle=49154, II=49154
      for (int v13 = 0; v13 < 4096; v13 += 1) {	// L12, [0,49154), iterCycle=12, II=12
        float v14 = v2[v11][v11];	// L13, [0,2)
        float v15 = v0 * v14;	// L14, [2,6)
        float v16 = v4[v11][v12];	// L15, [4,6)
        float v17 = v15 + v16;	// L16, [6,11)
        v4[v11][v12] = v17;	// L17, [11,12)
      }
    }
  }
}

