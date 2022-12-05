
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
/// Latency=137304768573, interval=137304768573
/// DSP=4, BRAM=0
void blur(
  float v0,
  float v1[4096][4096],
  float v2[4096][4096],
  float v3[4096][4096]
) {	// L5, [0,137304768573)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3

  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v1 cyclic factor=4 dim=2
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=4 dim=1
  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=2
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=2
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  for (int v4 = 0; v4 < 4096; v4 += 1) {	// L6, [0,68652384286), iterCycle=32, II=4
    for (int v5 = 0; v5 < 2047; v5 += 1) {	// L7, [68652384285,68669145151), iterCycle=32, II=4
      for (int v6 = 0; v6 < 2047; v6 += 1) {	// L8, [68652384285,68652392503), iterCycle=32, II=4
        #pragma HLS pipeline II=1
        float v7 = v1[(v5 * 2)][(v6 * 2)];	// L9, [0,2)
        float v8 = v1[(v5 * 2)][((v6 * 2) + 1)];	// L10, [1,3)
        float v9 = v7 + v8;	// L11, [4,9)
        float v10 = v1[(v5 * 2)][((v6 * 2) + 2)];	// L12, [2,4)
        float v11 = v10 + v9;	// L13, [9,14)
        float v12 = v11 / v0;	// L14, [14,30)
        v2[(v5 * 2)][(v6 * 2)] = v12;	// L15, [30,31)
        float v13 = v8 + v10;	// L16, [4,9)
        float v14 = v1[(v5 * 2)][((v6 * 2) + 3)];	// L17, [7,9)
        float v15 = v14 + v13;	// L18, [9,14)
        float v16 = v15 / v0;	// L19, [14,30)
        v2[(v5 * 2)][((v6 * 2) + 1)] = v16;	// L20, [30,31)
        float v17 = v1[((v5 * 2) + 1)][(v6 * 2)];	// L21, [1,3)
        float v18 = v1[((v5 * 2) + 1)][((v6 * 2) + 1)];	// L22, [2,4)
        float v19 = v17 + v18;	// L23, [5,10)
        float v20 = v1[((v5 * 2) + 1)][((v6 * 2) + 2)];	// L24, [3,5)
        float v21 = v20 + v19;	// L25, [10,15)
        float v22 = v21 / v0;	// L26, [15,31)
        v2[((v5 * 2) + 1)][(v6 * 2)] = v22;	// L27, [31,32)
        float v23 = v18 + v20;	// L28, [5,10)
        float v24 = v1[((v5 * 2) + 1)][((v6 * 2) + 3)];	// L29, [8,10)
        float v25 = v24 + v23;	// L30, [10,15)
        float v26 = v25 / v0;	// L31, [15,31)
        v2[((v5 * 2) + 1)][((v6 * 2) + 1)] = v26;	// L32, [31,32)
      }
    }
  }
  for (int v27 = 0; v27 < 4096; v27 += 1) {	// L36, [68652384286,137304768571), iterCycle=31, II=4
    for (int v28 = 0; v28 < 2047; v28 += 1) {	// L37, [0,16760865), iterCycle=31, II=4
      for (int v29 = 0; v29 < 2047; v29 += 1) {	// L38, [0,8217), iterCycle=31, II=4
        #pragma HLS pipeline II=1
        float v30 = v2[(v28 * 2)][(v29 * 2)];	// L39, [0,2)
        float v31 = v2[((v28 * 2) + 1)][(v29 * 2)];	// L40, [1,3)
        float v32 = v30 + v31;	// L41, [4,9)
        float v33 = v2[((v28 * 2) + 2)][(v29 * 2)];	// L42, [2,4)
        float v34 = v33 + v32;	// L43, [9,14)
        float v35 = v34 / v0;	// L44, [14,30)
        v3[(v28 * 2)][(v29 * 2)] = v35;	// L45, [30,31)
        float v36 = v2[(v28 * 2)][((v29 * 2) + 1)];	// L46, [0,2)
        float v37 = v2[((v28 * 2) + 1)][((v29 * 2) + 1)];	// L47, [1,3)
        float v38 = v36 + v37;	// L48, [4,9)
        float v39 = v2[((v28 * 2) + 2)][((v29 * 2) + 1)];	// L49, [2,4)
        float v40 = v39 + v38;	// L50, [9,14)
        float v41 = v40 / v0;	// L51, [14,30)
        v3[(v28 * 2)][((v29 * 2) + 1)] = v41;	// L52, [30,31)
        float v42 = v31 + v33;	// L53, [4,9)
        float v43 = v2[((v28 * 2) + 3)][(v29 * 2)];	// L54, [7,9)
        float v44 = v43 + v42;	// L55, [9,14)
        float v45 = v44 / v0;	// L56, [14,30)
        v3[((v28 * 2) + 1)][(v29 * 2)] = v45;	// L57, [30,31)
        float v46 = v37 + v39;	// L58, [4,9)
        float v47 = v2[((v28 * 2) + 3)][((v29 * 2) + 1)];	// L59, [7,9)
        float v48 = v47 + v46;	// L60, [9,14)
        float v49 = v48 / v0;	// L61, [14,30)
        v3[((v28 * 2) + 1)][((v29 * 2) + 1)] = v49;	// L62, [30,31)
      }
    }
  }
}

