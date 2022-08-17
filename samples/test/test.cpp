
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

void test_gemm(
  float v0,
  float v1,
  float v2[32][32],
  float v3[32][32],
  float v4[32][32]
) {	// L2
  for (int v5 = 0; v5 < 32; v5 += 1) {	// L3
    for (int v6 = 0; v6 < 32; v6 += 1) {	// L4
      float v7 = v2[v5][v6];	// L5
      float v8 = v7 * v1;	// L6
      v2[v5][v6] = v8;	// L7
    }
  }
  for (int v9 = 0; v9 < 32; v9 += 1) {	// L10
    for (int v10 = 0; v10 < 32; v10 += 1) {	// L11
      float v11 = v2[v9][v10];	// L12
      float v12 = v11 * v1;	// L13
      v2[v9][v10] = v12;	// L14
      for (int v13 = 0; v13 < 32; v13 += 1) {	// L15
        float v14 = v3[v9][v13];	// L16
        float v15 = v0 * v14;	// L17
        float v16 = v4[v13][v10];	// L18
        float v17 = v15 * v16;	// L19
        float v18 = v2[v9][v10];	// L20
        float v19 = v18 + v17;	// L21
        v2[v9][v10] = v19;	// L22
      }
    }
  }
}

