
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
/// Latency=29448, interval=29448
/// DSP=0, BRAM=0
void test_max(
  float v0,
  float v1,
  float v2,
  float v3[32],
  float v4[32]
) {	// L2, [0,29448)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface s_axilite port=v2 bundle=ctrl
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 128; v5 += 1) {	// L3, [0,12546), iterCycle=98, II=98
    for (int v6 = 0; v6 < 32; v6 += 1) {	// L4, [0,98), iterCycle=3, II=3
      float v7 = v3[v6];	// L5, [0,2)
      float v8 = max(v7, v1);	// L6, [2,2)
      v3[v6] = v8;	// L7, [2,3)
    }
  }
  for (int v9 = 0; v9 < 128; v9 += 1) {	// L10, [12546,16900), iterCycle=34, II=34
    for (int v10 = 0; v10 < 32; v10 += 1) {	// L11, [0,34), iterCycle=1, II=1
      float v11 = max(v1, v2);	// L12, [0,0)
      v3[v10] = v11;	// L13, [0,1)
    }
  }
  for (int v12 = 0; v12 < 128; v12 += 1) {	// L16, [16900,29446), iterCycle=98, II=98
    for (int v13 = 0; v13 < 32; v13 += 1) {	// L17, [0,98), iterCycle=3, II=3
      float v14 = v3[(v13 + v12)];	// L18, [0,2)
      float v15 = v4[((v13 * 2) + v12)];	// L19, [0,2)
      float v16 = max(v14, v15);	// L20, [2,2)
      v4[v13] = v16;	// L21, [2,3)
    }
  }
}

