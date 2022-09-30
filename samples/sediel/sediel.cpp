
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
  float v1[1024][1024],
  float v2[1024][1024]
) {	// L2
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  for (int v3 = 0; v3 < 1024; v3 += 1) {	// L3
    for (int v4 = 0; v4 < 1024; v4 += 1) {	// L4
      for (int v5 = 0; v5 < 1024; v5 += 1) {	// L5
        float v6 = v1[(v4 - 1)][v5];	// L6
        float v7 = v6 + v6;	// L7
        float v8 = v1[(v4 - 1)][(v5 + 1)];	// L8
        float v9 = v8 + v7;	// L9
        float v10 = v1[v4][(v5 - 1)];	// L10
        float v11 = v10 + v9;	// L11
        float v12 = v1[v4][(v5 + 1)];	// L12
        float v13 = v12 + v11;	// L13
        float v14 = v1[(v4 + 1)][(v5 - 1)];	// L14
        float v15 = v14 + v13;	// L15
        float v16 = v1[(v4 + 1)][v5];	// L16
        float v17 = v16 + v15;	// L17
        float v18 = v1[(v4 + 1)][(v5 + 1)];	// L18
        float v19 = v18 + v17;	// L19
        float v20 = v19 * v0;	// L20
        float v21 = v1[v4][v5];	// L21
        float v22 = v21 + v20;	// L22
        v1[v4][v5] = v22;	// L23
      }
    }
  }
}

