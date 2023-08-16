
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
/// Latency=603701252, interval=603701252
/// DSP=5, BRAM=0
void jacobi(
  float v0,
  float v1[4096],
  float v2[4096]
) {	// L2, [0,603701252)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  for (int v3 = 0; v3 < 4096; v3 += 1) {	// L3, [0,603701250), iterCycle=147388, II=147388
    for (int v4 = 0; v4 < 4094; v4 += 1) {	// L4, [0,73694), iterCycle=18, II=18
      float v5 = v2[v4];	// L5, [0,2)
      float v6 = v2[(v4 + 1)];	// L6, [1,3)
      float v7 = v5 + v6;	// L7, [3,8)
      float v8 = v2[(v4 + 2)];	// L8, [6,8)
      float v9 = v8 + v7;	// L9, [8,13)
      float v10 = v9 * v0;	// L10, [13,17)
      v1[(v4 + 1)] = v10;	// L11, [17,18)
    }
    for (int v11 = 0; v11 < 4094; v11 += 1) {	// L13, [73694,147388), iterCycle=18, II=18
      float v12 = v1[v11];	// L14, [0,2)
      float v13 = v1[(v11 + 1)];	// L15, [1,3)
      float v14 = v12 + v13;	// L16, [3,8)
      float v15 = v1[(v11 + 2)];	// L17, [6,8)
      float v16 = v15 + v14;	// L18, [8,13)
      float v17 = v16 * v0;	// L19, [13,17)
      v2[(v11 + 1)] = v17;	// L20, [17,18)
    }
  }
}

