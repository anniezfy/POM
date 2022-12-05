
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
/// Latency=311556, interval=311556
/// DSP=2, BRAM=0
void test(
  float v0[128][128],
  float v1[128]
) {	// L2, [0,311556)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface bram port=v0
  #pragma HLS interface bram port=v1

  #pragma HLS resource variable=v0 core=ram_s2p_bram

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  for (int v2 = 0; v2 < 128; v2 += 1) {	// L3, [0,311554), iterCycle=2434, II=2434
    for (int v3 = 0; v3 < 128; v3 += 1) {	// L4, [0,2434), iterCycle=19, II=19
      float v4 = v0[(v3 - 1)][v2];	// L5, [0,2)
      float v5 = v0[v3][(v2 - 1)];	// L6, [1,3)
      float v6 = v4 + v5;	// L7, [3,8)
      float v7 = v0[(v3 + 1)][v2];	// L8, [6,8)
      float v8 = v7 + v6;	// L9, [8,13)
      float v9 = v0[v3][(v2 + 1)];	// L10, [11,13)
      float v10 = v9 + v8;	// L11, [13,18)
      v0[v3][v2] = v10;	// L12, [18,19)
    }
  }
}

