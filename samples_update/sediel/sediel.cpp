
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
void sediel(
  float v0,
  float v1[4096][4096],
  float v2[4096][4096]
) {	// L5
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2

  #pragma HLS array_partition variable=v1 cyclic factor=3 dim=1
  #pragma HLS array_partition variable=v1 cyclic factor=3 dim=2
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  for (int v3 = 0; v3 < 4096; v3 += 1) {	// L6
    for (int v4 = 0; v4 < 12280; v4 += 1) {	// L7
      for (int v5 = max(0, ((v4 / 2) - 2046)); v5 < min(4094, (v4 / 2)); v5 += 1) {	// L8
      #pragma HLS pipeline II=1
        float v6 = v1[v5][(((v5 * -2) + v4) + 1)];	// L9
        float v7 = v1[v5][((v5 * -2) + v4)];	// L10
        float v8 = v6 + v7;	// L11
        float v9 = v1[v5][(((v5 * -2) + v4) + 2)];	// L12
        float v10 = v9 + v8;	// L13
        float v11 = v1[(v5 + 1)][((v5 * -2) + v4)];	// L14
        float v12 = v11 + v10;	// L15
        float v13 = v1[(v5 + 1)][(((v5 * -2) + v4) + 1)];	// L16
        float v14 = v13 + v12;	// L17
        float v15 = v1[(v5 + 1)][(((v5 * -2) + v4) + 2)];	// L18
        float v16 = v15 + v14;	// L19
        float v17 = v1[(v5 + 2)][((v5 * -2) + v4)];	// L20
        float v18 = v17 + v16;	// L21
        float v19 = v1[(v5 + 2)][(((v5 * -2) + v4) + 1)];	// L22
        float v20 = v19 + v18;	// L23
        float v21 = v1[(v5 + 2)][(((v5 * -2) + v4) + 2)];	// L24
        float v22 = v21 + v20;	// L25
        float v23 = v22 / v0;	// L26
        v1[(v5 + 1)][(((v5 * -2) + v4) + 1)] = v23;	// L27
      }
    }
  }
}

