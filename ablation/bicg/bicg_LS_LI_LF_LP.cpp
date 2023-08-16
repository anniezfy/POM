
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
/// Latency=33554447, interval=33554447
/// DSP=5, BRAM=0
void bicg(
  float v0[4096][4096],
  float v1[4096],
  float v2[4096],
  float v3[4096],
  float v4[4096]
) {	// L2, [0,33554447)
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

  for (int v5 = 0; v5 < 4096; v5 += 1) {	// L3, [0,33554445), iterCycle=13, II=2
    for (int v6 = 0; v6 < 4096; v6 += 1) {	// L4, [0,8205), iterCycle=13, II=2
      #pragma HLS pipeline II=1
      float v7 = v0[v5][v6];	// L5, [0,2)
      float v8 = v3[v5];	// L6, [1,3)
      float v9 = v7 * v8;	// L7, [3,7)
      float v10 = v4[v6];	// L8, [5,7)
      float v11 = v9 + v10;	// L9, [7,12)
      v4[v6] = v11;	// L10, [12,13)
      float v12 = v0[v6][v5];	// L11, [1,3)
      float v13 = v1[v5];	// L12, [1,3)
      float v14 = v12 * v13;	// L13, [3,7)
      float v15 = v2[v6];	// L14, [5,7)
      float v16 = v14 + v15;	// L15, [7,12)
      v2[v6] = v16;	// L16, [12,13)
    }
  }
}

