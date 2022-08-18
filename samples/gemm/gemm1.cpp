
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
/// Latency=201334788, interval=201334788
/// DSP=5, BRAM=0
void gemm(
  float v0,
  float v1,
  float v2[4096][4096],
  float v3[4096][4096],
  float v4[4096][4096],
  float v5[4096][4096],
  float v6[4096][4096]
) {	// L2, [0,201334788)
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

  for (int v7 = 0; v7 < 4096; v7 += 1) {	// L3, [0,201334786), iterCycle=49154, II=49154
    for (int v8 = 0; v8 < 4096; v8 += 1) {	// L4, [0,49154), iterCycle=12, II=12
      v4[v7][v8] = v1;	// L5, [3,4)
      float v9 = v2[v7][v7];	// L6, [0,2)
      float v10 = v0 * v9;	// L7, [2,6)
      float v11 = v4[v7][v8];	// L8, [4,6)
      float v12 = v10 + v11;	// L9, [6,11)
      v4[v7][v8] = v12;	// L10, [11,12)
    }
  }
}

