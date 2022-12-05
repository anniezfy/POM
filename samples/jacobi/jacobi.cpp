
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
/// Latency=33538067, interval=33538067
/// DSP=5, BRAM=0
void jacobi(
  float v0,
  float v1[4096],
  float v2[4096]
) {	// L3, [0,33538067)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2

  #pragma HLS array_partition variable=v1 cyclic factor=4 dim=1
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=4 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  for (int v3 = 0; v3 < 4096; v3 += 1) {	// L4, [0,33538065), iterCycle=19, II=4
    for (int v4 = 0; v4 < 2047; v4 += 1) {	// L5, [0,8205), iterCycle=19, II=4
      #pragma HLS pipeline II=1
      float v5 = v2[(v4 * 2)];	// L6, [0,2)
      float v6 = v2[((v4 * 2) + 1)];	// L7, [1,3)
      float v7 = v5 + v6;	// L8, [3,8)
      float v8 = v2[((v4 * 2) + 2)];	// L9, [2,4)
      float v9 = v8 + v7;	// L10, [8,13)
      float v10 = v9 * v0;	// L11, [13,17)
      v1[((v4 * 2) + 1)] = v10;	// L12, [17,18)
      float v11 = v6 + v8;	// L13, [4,9)
      float v12 = v2[((v4 * 2) + 3)];	// L14, [7,9)
      float v13 = v12 + v11;	// L15, [9,14)
      float v14 = v13 * v0;	// L16, [14,18)
      v1[((v4 * 2) + 2)] = v14;	// L17, [18,19)
    }
    for (int v15 = 0; v15 < 2047; v15 += 1) {	// L19, [0,8205), iterCycle=19, II=4
      #pragma HLS pipeline II=1
      float v16 = v1[(v15 * 2)];	// L20, [0,2)
      float v17 = v1[((v15 * 2) + 1)];	// L21, [1,3)
      float v18 = v16 + v17;	// L22, [3,8)
      float v19 = v1[((v15 * 2) + 2)];	// L23, [2,4)
      float v20 = v19 + v18;	// L24, [8,13)
      float v21 = v20 * v0;	// L25, [13,17)
      v2[((v15 * 2) + 1)] = v21;	// L26, [17,18)
      float v22 = v17 + v19;	// L27, [4,9)
      float v23 = v1[((v15 * 2) + 3)];	// L28, [7,9)
      float v24 = v23 + v22;	// L29, [9,14)
      float v25 = v24 * v0;	// L30, [14,18)
      v2[((v15 * 2) + 2)] = v25;	// L31, [18,19)
    }
  }
}

