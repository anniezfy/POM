
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
/// Latency=205957152794, interval=205957152794
/// DSP=20, BRAM=0
void jacobi2d(
  float v0,
  float v1[4096][4096],
  float v2[4096][4096]
) {	// L3, [0,205957152794)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS array_partition variable=v1 cyclic factor=4 dim=1
  #pragma HLS array_partition variable=v1 cyclic factor=4 dim=2
  #pragma HLS resource variable=v1 core=ram_s2p_bram
  #pragma HLS array_partition variable=v2 cyclic factor=4 dim=1
  #pragma HLS array_partition variable=v2 cyclic factor=4 dim=2
  #pragma HLS resource variable=v2 core=ram_s2p_bram
  for (int v3 = 0; v3 < 4096; v3 += 1) {	// L4, [0,205957152792), iterCycle=34, II=12
    for (int v4 = 0; v4 < 2047; v4 += 1) {	// L5, [0,50282532), iterCycle=34, II=12
      for (int v5 = 0; v5 < 2047; v5 += 1) {	// L6, [142471202,142495790), iterCycle=34, II=12
        #pragma HLS pipeline II=1
        float v6 = v1[((v4 * 2) + 1)][((v5 * 2) + 1)];	// L7, [0,2)
        float v7 = v1[((v4 * 2) + 1)][(v5 * 2)];	// L8, [1,3)
        float v8 = v6 + v7;	// L9, [6,11)
        float v9 = v1[((v4 * 2) + 1)][((v5 * 2) + 2)];	// L10, [3,5)
        float v10 = v9 + v8;	// L11, [11,16)
        float v11 = v1[((v4 * 2) + 2)][((v5 * 2) + 1)];	// L12, [5,7)
        float v12 = v11 + v10;	// L13, [16,21)
        float v13 = v1[(v4 * 2)][((v5 * 2) + 1)];	// L14, [9,11)
        float v14 = v13 + v12;	// L15, [21,26)
        float v15 = v14 * v0;	// L16, [26,30)
        v2[((v4 * 2) + 1)][((v5 * 2) + 1)] = v15;	// L17, [30,31)
        float v16 = v9 + v6;	// L18, [7,12)
        float v17 = v1[((v4 * 2) + 1)][((v5 * 2) + 3)];	// L19, [10,12)
        float v18 = v17 + v16;	// L20, [12,17)
        float v19 = v1[((v4 * 2) + 2)][((v5 * 2) + 2)];	// L21, [2,4)
        float v20 = v19 + v18;	// L22, [17,22)
        float v21 = v1[(v4 * 2)][((v5 * 2) + 2)];	// L23, [4,6)
        float v22 = v21 + v20;	// L24, [22,27)
        float v23 = v22 * v0;	// L25, [27,31)
        v2[((v4 * 2) + 1)][((v5 * 2) + 2)] = v23;	// L26, [31,32)
        float v24 = v1[((v4 * 2) + 2)][(v5 * 2)];	// L27, [6,8)
        float v25 = v11 + v24;	// L28, [8,13)
        float v26 = v19 + v25;	// L29, [13,18)
        float v27 = v1[((v4 * 2) + 3)][((v5 * 2) + 1)];	// L30, [16,18)
        float v28 = v27 + v26;	// L31, [18,23)
        float v29 = v6 + v28;	// L32, [23,28)
        float v30 = v29 * v0;	// L33, [28,32)
        v2[((v4 * 2) + 2)][((v5 * 2) + 1)] = v30;	// L34, [32,33)
        float v31 = v19 + v11;	// L35, [9,14)
        float v32 = v1[((v4 * 2) + 2)][((v5 * 2) + 3)];	// L36, [12,14)
        float v33 = v32 + v31;	// L37, [14,19)
        float v34 = v1[((v4 * 2) + 3)][((v5 * 2) + 2)];	// L38, [17,19)
        float v35 = v34 + v33;	// L39, [19,24)
        float v36 = v9 + v35;	// L40, [24,29)
        float v37 = v36 * v0;	// L41, [29,33)
        v2[((v4 * 2) + 2)][((v5 * 2) + 2)] = v37;	// L42, [33,34)
      }
    }
    for (int v38 = 0; v38 < 2047; v38 += 1) {	// L45, [0,142471202), iterCycle=69600, II=69600
      for (int v39 = 0; v39 < 2047; v39 += 1) {	// L46, [0,69600), iterCycle=34, II=34
        #pragma HLS pipeline II=1
        float v40 = v2[((v38 * 2) + 1)][((v39 * 2) + 1)];	// L47, [0,2)
        float v41 = v2[((v38 * 2) + 1)][(v39 * 2)];	// L48, [1,3)
        float v42 = v40 + v41;	// L49, [6,11)
        float v43 = v2[((v38 * 2) + 1)][((v39 * 2) + 2)];	// L50, [3,5)
        float v44 = v43 + v42;	// L51, [11,16)
        float v45 = v2[((v38 * 2) + 2)][((v39 * 2) + 1)];	// L52, [5,7)
        float v46 = v45 + v44;	// L53, [16,21)
        float v47 = v2[(v38 * 2)][((v39 * 2) + 1)];	// L54, [9,11)
        float v48 = v47 + v46;	// L55, [21,26)
        float v49 = v48 * v0;	// L56, [26,30)
        v1[((v38 * 2) + 1)][((v39 * 2) + 1)] = v49;	// L57, [30,31)
        float v50 = v43 + v40;	// L58, [7,12)
        float v51 = v2[((v38 * 2) + 1)][((v39 * 2) + 3)];	// L59, [10,12)
        float v52 = v51 + v50;	// L60, [12,17)
        float v53 = v2[((v38 * 2) + 2)][((v39 * 2) + 2)];	// L61, [2,4)
        float v54 = v53 + v52;	// L62, [17,22)
        float v55 = v2[(v38 * 2)][((v39 * 2) + 2)];	// L63, [4,6)
        float v56 = v55 + v54;	// L64, [22,27)
        float v57 = v56 * v0;	// L65, [27,31)
        v1[((v38 * 2) + 1)][((v39 * 2) + 2)] = v57;	// L66, [31,32)
        float v58 = v2[((v38 * 2) + 2)][(v39 * 2)];	// L67, [6,8)
        float v59 = v45 + v58;	// L68, [8,13)
        float v60 = v53 + v59;	// L69, [13,18)
        float v61 = v2[((v38 * 2) + 3)][((v39 * 2) + 1)];	// L70, [16,18)
        float v62 = v61 + v60;	// L71, [18,23)
        float v63 = v40 + v62;	// L72, [23,28)
        float v64 = v63 * v0;	// L73, [28,32)
        v1[((v38 * 2) + 2)][((v39 * 2) + 1)] = v64;	// L74, [32,33)
        float v65 = v53 + v45;	// L75, [9,14)
        float v66 = v2[((v38 * 2) + 2)][((v39 * 2) + 3)];	// L76, [12,14)
        float v67 = v66 + v65;	// L77, [14,19)
        float v68 = v2[((v38 * 2) + 3)][((v39 * 2) + 2)];	// L78, [17,19)
        float v69 = v68 + v67;	// L79, [19,24)
        float v70 = v43 + v69;	// L80, [24,29)
        float v71 = v70 * v0;	// L81, [29,33)
        v1[((v38 * 2) + 2)][((v39 * 2) + 2)] = v71;	// L82, [33,34)
      }
    }
  }
}

