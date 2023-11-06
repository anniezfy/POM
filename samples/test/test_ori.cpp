
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
/// Latency=93669426, interval=93669426
/// DSP=5, BRAM=1425
void test(
  float v0,
  float v1,
  float v2[3][64][64],
  float v3[10],
  float v4[256][128],
  float v5[256][256][3][3],
  float v6[256][128][3][3],
  float v7[128][128][3][3],
  float v8[128][128][3][3],
  float v9[128][64],
  float v10[128][128][3][3],
  float v11[128][64][3][3],
  float v12[64][64][3][3],
  float v13[64][64][3][3],
  float v14[10][512],
  float v15[64][64][3][3],
  float v16[64][64][3][3],
  float v17[64][3][3][3],
  float v18[512][512][3][3],
  float v19[512][512][3][3],
  float v20[512][256],
  float v21[512][512][3][3],
  float v22[512][256][3][3],
  float v23[256][256][3][3],
  float v24[256][256][3][3]
) {	// L2, [0,93669426)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6
  #pragma HLS interface bram port=v7
  #pragma HLS interface bram port=v8
  #pragma HLS interface bram port=v9
  #pragma HLS interface bram port=v10
  #pragma HLS interface bram port=v11
  #pragma HLS interface bram port=v12
  #pragma HLS interface bram port=v13
  #pragma HLS interface bram port=v14
  #pragma HLS interface bram port=v15
  #pragma HLS interface bram port=v16
  #pragma HLS interface bram port=v17
  #pragma HLS interface bram port=v18
  #pragma HLS interface bram port=v19
  #pragma HLS interface bram port=v20
  #pragma HLS interface bram port=v21
  #pragma HLS interface bram port=v22
  #pragma HLS interface bram port=v23
  #pragma HLS interface bram port=v24

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS resource variable=v7 core=ram_s2p_bram

  #pragma HLS resource variable=v8 core=ram_s2p_bram

  #pragma HLS resource variable=v9 core=ram_s2p_bram

  #pragma HLS resource variable=v10 core=ram_s2p_bram

  #pragma HLS resource variable=v11 core=ram_s2p_bram

  #pragma HLS resource variable=v12 core=ram_s2p_bram

  #pragma HLS resource variable=v13 core=ram_s2p_bram

  #pragma HLS resource variable=v14 core=ram_s2p_bram

  #pragma HLS resource variable=v15 core=ram_s2p_bram

  #pragma HLS resource variable=v16 core=ram_s2p_bram

  #pragma HLS resource variable=v17 core=ram_s2p_bram

  #pragma HLS resource variable=v18 core=ram_s2p_bram

  #pragma HLS resource variable=v19 core=ram_s2p_bram

  #pragma HLS resource variable=v20 core=ram_s2p_bram

  #pragma HLS resource variable=v21 core=ram_s2p_bram

  #pragma HLS resource variable=v22 core=ram_s2p_bram

  #pragma HLS resource variable=v23 core=ram_s2p_bram

  #pragma HLS resource variable=v24 core=ram_s2p_bram

  float v25[3][66][66];	// L3, [0,0)
  #pragma HLS resource variable=v25 core=ram_s2p_bram

  float v26[64][64][64];	// L4, [50728,50728)
  #pragma HLS resource variable=v26 core=ram_s2p_bram

  float v27[64][64][64];	// L5, [92079916,92079916)
  #pragma HLS resource variable=v27 core=ram_s2p_bram

  float v28[64][64][64];	// L6, [92874670,92874670)
  #pragma HLS resource variable=v28 core=ram_s2p_bram

  for (int v29 = 0; v29 < 3; v29 += 1) {	// L7, [0,13472), iterCycle=4490, II=4490
    for (int v30 = 0; v30 < 66; v30 += 1) {	// L8, [0,4490), iterCycle=68, II=68
      for (int v31 = 0; v31 < 66; v31 += 1) {	// L9, [0,68), iterCycle=1, II=1
        v25[v29][v30][v31] = v0;	// L10, [0,1)
      }
    }
  }
  for (int v32 = 0; v32 < 3; v32 += 1) {	// L14, [13472,50728), iterCycle=12418, II=12418
    for (int v33 = 0; v33 < 64; v33 += 1) {	// L15, [0,12418), iterCycle=194, II=194
      for (int v34 = 0; v34 < 64; v34 += 1) {	// L16, [0,194), iterCycle=3, II=3
        float v35 = v2[v32][v33][v34];	// L17, [0,2)
        v25[v32][(v33 + 1)][(v34 + 1)] = v35;	// L18, [2,3)
      }
    }
  }
  for (int v36 = 0; v36 < 64; v36 += 1) {	// L22, [50728,321194), iterCycle=4226, II=4226
    for (int v37 = 0; v37 < 64; v37 += 1) {	// L23, [0,4226), iterCycle=66, II=66
      for (int v38 = 0; v38 < 64; v38 += 1) {	// L24, [0,66), iterCycle=1, II=1
        v26[v36][v37][v38] = v0;	// L25, [0,1)
      }
    }
  }
  for (int v39 = 0; v39 < 64; v39 += 1) {	// L29, [321194,92079916), iterCycle=1433730, II=1433730
    for (int v40 = 0; v40 < 64; v40 += 1) {	// L30, [0,1433730), iterCycle=22402, II=22402
      for (int v41 = 0; v41 < 64; v41 += 1) {	// L31, [0,22402), iterCycle=350, II=350
        for (int v42 = 0; v42 < 3; v42 += 1) {	// L32, [0,350), iterCycle=116, II=116
          for (int v43 = 0; v43 < 3; v43 += 1) {	// L33, [0,116), iterCycle=38, II=38
            for (int v44 = 0; v44 < 3; v44 += 1) {	// L34, [0,38), iterCycle=12, II=12
              float v45 = v25[v42][(v40 + v43)][(v41 + v44)];	// L35, [0,2)
              float v46 = v17[v39][v42][v43][v44];	// L36, [0,2)
              float v47 = v45 * v46;	// L37, [2,6)
              float v48 = v26[v39][v40][v41];	// L38, [4,6)
              float v49 = v47 + v48;	// L39, [6,11)
              v26[v39][v40][v41] = v49;	// L40, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v50 = 0; v50 < 64; v50 += 1) {	// L47, [92079916,92874670), iterCycle=12418, II=12418
    for (int v51 = 0; v51 < 64; v51 += 1) {	// L48, [0,12418), iterCycle=194, II=194
      for (int v52 = 0; v52 < 64; v52 += 1) {	// L49, [0,194), iterCycle=3, II=3
        float v53 = v26[v50][v51][v52];	// L50, [0,2)
        v27[v50][v51][v52] = v53;	// L51, [2,3)
      }
    }
  }
  for (int v54 = 0; v54 < 64; v54 += 1) {	// L55, [92874670,93669424), iterCycle=12418, II=12418
    for (int v55 = 0; v55 < 64; v55 += 1) {	// L56, [0,12418), iterCycle=194, II=194
      for (int v56 = 0; v56 < 64; v56 += 1) {	// L57, [0,194), iterCycle=3, II=3
        float v57 = v27[v54][v55][v56];	// L58, [0,2)
        float v58 = max(v57, v0);	// L59, [2,2)
        v28[v54][v55][v56] = v58;	// L60, [2,3)
      }
    }
  }
}

