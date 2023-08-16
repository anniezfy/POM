
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
/// Latency=343261921307, interval=343261921307
/// DSP=5, BRAM=0
void jacobi2d(
  float v0,
  float v1[4096][4096],
  float v2[4096][4096]
) {	// L2, [0,343261921307)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  for (int v3 = 0; v3 < 4096; v3 += 1) {	// L3, [0,343261921305), iterCycle=28, II=5
    for (int v4 = 0; v4 < 4094; v4 += 1) {	// L4, [0,83804205), iterCycle=28, II=5
      for (int v5 = 0; v5 < 4094; v5 += 1) {	// L5, [469311598,469332093), iterCycle=28, II=5
        #pragma HLS pipeline II=1
        float v6 = v1[(v4 + 1)][(v5 + 1)];	// L6, [0,2)
        float v7 = v1[(v4 + 1)][v5];	// L7, [1,3)
        float v8 = v6 + v7;	// L8, [3,8)
        float v9 = v1[(v4 + 1)][(v5 + 2)];	// L9, [6,8)
        float v10 = v9 + v8;	// L10, [8,13)
        float v11 = v1[(v4 + 2)][(v5 + 1)];	// L11, [11,13)
        float v12 = v11 + v10;	// L12, [13,18)
        float v13 = v1[v4][(v5 + 1)];	// L13, [16,18)
        float v14 = v13 + v12;	// L14, [18,23)
        float v15 = v14 * v0;	// L15, [23,27)
        v2[(v4 + 1)][(v5 + 1)] = v15;	// L16, [27,28)
      }
    }
    for (int v16 = 0; v16 < 4094; v16 += 1) {	// L19, [0,469311598), iterCycle=114634, II=114634
      for (int v17 = 0; v17 < 4094; v17 += 1) {	// L20, [0,114634), iterCycle=28, II=28
        #pragma HLS pipeline II=1
        float v18 = v2[(v16 + 1)][(v17 + 1)];	// L21, [0,2)
        float v19 = v2[(v16 + 1)][v17];	// L22, [1,3)
        float v20 = v18 + v19;	// L23, [3,8)
        float v21 = v2[(v16 + 1)][(v17 + 2)];	// L24, [6,8)
        float v22 = v21 + v20;	// L25, [8,13)
        float v23 = v2[(v16 + 2)][(v17 + 1)];	// L26, [11,13)
        float v24 = v23 + v22;	// L27, [13,18)
        float v25 = v2[v16][(v17 + 1)];	// L28, [16,18)
        float v26 = v25 + v24;	// L29, [18,23)
        float v27 = v26 * v0;	// L30, [23,27)
        v1[(v16 + 1)][(v17 + 1)] = v27;	// L31, [27,28)
      }
    }
  }
}

