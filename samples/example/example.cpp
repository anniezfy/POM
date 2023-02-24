
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
void example(
  float v0,
  float v1[1024][1024],
  float v2[1024][1024]
) {	// L5
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2

  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=2
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  for (int v3 = 0; v3 < 2045; v3 += 1) {	// L6
    for (int v4 = max(0, (v3 - 1022)); v4 < min(1023, v3); v4 += 1) {	// L7
      float v5 = v1[v4][(((-v4) + v3) + 1)];	// L8
      float v6 = v1[(v4 + 1)][((-v4) + v3)];	// L9
      float v7 = v5 + v6;	// L10
      v1[(v4 + 1)][(((-v4) + v3) + 1)] = v7;	// L11
    }
  }
}

