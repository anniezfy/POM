
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
/// Latency=134217736, interval=134217736
/// DSP=5, BRAM=0
void bicg(
  float v0[4096][4096],
  float v1[4096],
  float v2[4096],
  float v3[4096],
  float v4[4096]
) {	// L2, [0,134217736)
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

  for (int v5 = 0; v5 < 4096; v5 += 1) {	// L3, [0,134217734), iterCycle=12, II=8
    for (int v6 = 0; v6 < 4096; v6 += 1) {	// L4, [0,32774), iterCycle=12, II=8
      #pragma HLS pipeline II=1
      float v7 = v0[v5][v6];	// L5, [0,2)
      float v8 = v3[v5];	// L6, [0,2)
      float v9 = v7 * v8;	// L7, [2,6)
      float v10 = v4[v6];	// L8, [4,6)
      float v11 = v9 + v10;	// L9, [6,11)
      v4[v6] = v11;	// L10, [11,12)
      float v12 = v1[v6];	// L11, [0,2)
      float v13 = v7 * v12;	// L12, [2,6)
      float v14 = v2[v5];	// L13, [4,6)
      float v15 = v13 + v14;	// L14, [6,11)
      v2[v5] = v15;	// L15, [11,12)
    }
  }
}

