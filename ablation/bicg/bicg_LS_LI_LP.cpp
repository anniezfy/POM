
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
/// Latency=33554460, interval=33554460
/// DSP=5, BRAM=0
void bicg(
  float v0[4096][4096],
  float v1[4096],
  float v2[4096],
  float v3[4096],
  float v4[4096]
) {	// L2, [0,33554460)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface bram port=v0
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS resource variable=v0 core=ram_s2p_bram

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 4096; v5 += 1) {	// L3, [0,16777229), iterCycle=12, II=1
    for (int v6 = 0; v6 < 4096; v6 += 1) {	// L4, [16777229,16781338), iterCycle=12, II=1
      #pragma HLS pipeline II=1
      float v7 = v0[v5][v6];	// L5, [0,2)
      float v8 = v3[v5];	// L6, [0,2)
      float v9 = v7 * v8;	// L7, [2,6)
      float v10 = v4[v6];	// L8, [4,6)
      float v11 = v9 + v10;	// L9, [6,11)
      v4[v6] = v11;	// L10, [11,12)
    }
  }
  for (int v12 = 0; v12 < 4096; v12 += 1) {	// L13, [16777229,33554458), iterCycle=12, II=1
    for (int v13 = 0; v13 < 4096; v13 += 1) {	// L14, [0,4109), iterCycle=12, II=1
      #pragma HLS pipeline II=1
      float v14 = v0[v13][v12];	// L15, [0,2)
      float v15 = v1[v12];	// L16, [0,2)
      float v16 = v14 * v15;	// L17, [2,6)
      float v17 = v2[v13];	// L18, [4,6)
      float v18 = v16 + v17;	// L19, [6,11)
      v2[v13] = v18;	// L20, [11,12)
    }
  }
}

