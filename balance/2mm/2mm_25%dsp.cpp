
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
/// Latency=17197695018, interval=17197695018
/// DSP=43, BRAM=0
void 2mm(
  float v0,
  float v1,
  float v2,
  float v3[4096][4096],
  float v4[4096][4096],
  float v5[4096][4096],
  float v6[4096][4096],
  float v7[4096][4096]
) {	// L5, [0,17197695018)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface s_axilite port=v2 bundle=ctrl
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6
  #pragma HLS interface bram port=v7

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=8 dim=2
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS array_partition variable=v5 cyclic factor=8 dim=2
  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS array_partition variable=v6 cyclic factor=8 dim=2
  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS array_partition variable=v7 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v7 cyclic factor=8 dim=2
  #pragma HLS resource variable=v7 core=ram_s2p_bram

  for (int v8 = 0; v8 < 2048; v8 += 1) {	// L6, [0,1048578), iterCycle=1, II=1
    for (int v9 = 0; v9 < 512; v9 += 1) {	// L7, [17196646438,17196646952), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v7[(v8 * 2)][(v9 * 8)] = v2;	// L8, [0,1)
      v7[(v8 * 2)][((v9 * 8) + 1)] = v2;	// L9, [0,1)
      v7[(v8 * 2)][((v9 * 8) + 2)] = v2;	// L10, [0,1)
      v7[(v8 * 2)][((v9 * 8) + 3)] = v2;	// L11, [0,1)
      v7[(v8 * 2)][((v9 * 8) + 4)] = v2;	// L12, [0,1)
      v7[(v8 * 2)][((v9 * 8) + 5)] = v2;	// L13, [0,1)
      v7[(v8 * 2)][((v9 * 8) + 6)] = v2;	// L14, [0,1)
      v7[(v8 * 2)][((v9 * 8) + 7)] = v2;	// L15, [0,1)
      v7[((v8 * 2) + 1)][(v9 * 8)] = v2;	// L16, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 8) + 1)] = v2;	// L17, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 8) + 2)] = v2;	// L18, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 8) + 3)] = v2;	// L19, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 8) + 4)] = v2;	// L20, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 8) + 5)] = v2;	// L21, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 8) + 6)] = v2;	// L22, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 8) + 7)] = v2;	// L23, [0,1)
    }
  }
  for (int v10 = 0; v10 < 4096; v10 += 1) {	// L26, [1048578,8590983187), iterCycle=16, II=1
    for (int v11 = 0; v11 < 4096; v11 += 1) {	// L27, [8606711829,8608808998), iterCycle=16, II=1
      for (int v12 = 0; v12 < 512; v12 += 1) {	// L28, [8606711829,8606712358), iterCycle=16, II=1
        #pragma HLS pipeline II=1
        float v13 = v3[v11][v10];	// L29, [0,2)
        float v14 = v0 * v13;	// L30, [2,6)
        float v15 = v4[v10][(v12 * 8)];	// L31, [4,6)
        float v16 = v15 * v14;	// L32, [6,10)
        float v17 = v7[v11][(v12 * 8)];	// L33, [8,10)
        float v18 = v16 + v17;	// L34, [10,15)
        v7[v11][(v12 * 8)] = v18;	// L35, [15,16)
        float v19 = v4[v10][((v12 * 8) + 1)];	// L36, [4,6)
        float v20 = v19 * v14;	// L37, [6,10)
        float v21 = v7[v11][((v12 * 8) + 1)];	// L38, [8,10)
        float v22 = v20 + v21;	// L39, [10,15)
        v7[v11][((v12 * 8) + 1)] = v22;	// L40, [15,16)
        float v23 = v4[v10][((v12 * 8) + 2)];	// L41, [4,6)
        float v24 = v23 * v14;	// L42, [6,10)
        float v25 = v7[v11][((v12 * 8) + 2)];	// L43, [8,10)
        float v26 = v24 + v25;	// L44, [10,15)
        v7[v11][((v12 * 8) + 2)] = v26;	// L45, [15,16)
        float v27 = v4[v10][((v12 * 8) + 3)];	// L46, [4,6)
        float v28 = v27 * v14;	// L47, [6,10)
        float v29 = v7[v11][((v12 * 8) + 3)];	// L48, [8,10)
        float v30 = v28 + v29;	// L49, [10,15)
        v7[v11][((v12 * 8) + 3)] = v30;	// L50, [15,16)
        float v31 = v4[v10][((v12 * 8) + 4)];	// L51, [4,6)
        float v32 = v31 * v14;	// L52, [6,10)
        float v33 = v7[v11][((v12 * 8) + 4)];	// L53, [8,10)
        float v34 = v32 + v33;	// L54, [10,15)
        v7[v11][((v12 * 8) + 4)] = v34;	// L55, [15,16)
        float v35 = v4[v10][((v12 * 8) + 5)];	// L56, [4,6)
        float v36 = v35 * v14;	// L57, [6,10)
        float v37 = v7[v11][((v12 * 8) + 5)];	// L58, [8,10)
        float v38 = v36 + v37;	// L59, [10,15)
        v7[v11][((v12 * 8) + 5)] = v38;	// L60, [15,16)
        float v39 = v4[v10][((v12 * 8) + 6)];	// L61, [4,6)
        float v40 = v39 * v14;	// L62, [6,10)
        float v41 = v7[v11][((v12 * 8) + 6)];	// L63, [8,10)
        float v42 = v40 + v41;	// L64, [10,15)
        v7[v11][((v12 * 8) + 6)] = v42;	// L65, [15,16)
        float v43 = v4[v10][((v12 * 8) + 7)];	// L66, [4,6)
        float v44 = v43 * v14;	// L67, [6,10)
        float v45 = v7[v11][((v12 * 8) + 7)];	// L68, [8,10)
        float v46 = v44 + v45;	// L69, [10,15)
        v7[v11][((v12 * 8) + 7)] = v46;	// L70, [15,16)
      }
    }
  }
  for (int v47 = 0; v47 < 4096; v47 += 1) {	// L74, [8590983187,8607760411), iterCycle=7, II=1
    for (int v48 = 0; v48 < 4096; v48 += 1) {	// L75, [8589934605,8589938709), iterCycle=7, II=1
      #pragma HLS pipeline II=1
      float v49 = v6[v47][v48];	// L76, [0,2)
      float v50 = v49 * v1;	// L77, [2,6)
      v6[v47][v48] = v50;	// L78, [6,7)
    }
  }
  for (int v51 = 0; v51 < 4096; v51 += 1) {	// L81, [8607760411,17197695016), iterCycle=12, II=1
    for (int v52 = 0; v52 < 4096; v52 += 1) {	// L82, [0,2097165), iterCycle=12, II=1
      for (int v53 = 0; v53 < 512; v53 += 1) {	// L83, [0,525), iterCycle=12, II=1
        #pragma HLS pipeline II=1
        float v54 = v7[v52][v51];	// L84, [0,2)
        float v55 = v5[v51][(v53 * 8)];	// L85, [0,2)
        float v56 = v54 * v55;	// L86, [2,6)
        float v57 = v6[v52][(v53 * 8)];	// L87, [4,6)
        float v58 = v56 + v57;	// L88, [6,11)
        v6[v52][(v53 * 8)] = v58;	// L89, [11,12)
        float v59 = v5[v51][((v53 * 8) + 1)];	// L90, [0,2)
        float v60 = v54 * v59;	// L91, [2,6)
        float v61 = v6[v52][((v53 * 8) + 1)];	// L92, [4,6)
        float v62 = v60 + v61;	// L93, [6,11)
        v6[v52][((v53 * 8) + 1)] = v62;	// L94, [11,12)
        float v63 = v5[v51][((v53 * 8) + 2)];	// L95, [0,2)
        float v64 = v54 * v63;	// L96, [2,6)
        float v65 = v6[v52][((v53 * 8) + 2)];	// L97, [4,6)
        float v66 = v64 + v65;	// L98, [6,11)
        v6[v52][((v53 * 8) + 2)] = v66;	// L99, [11,12)
        float v67 = v5[v51][((v53 * 8) + 3)];	// L100, [0,2)
        float v68 = v54 * v67;	// L101, [2,6)
        float v69 = v6[v52][((v53 * 8) + 3)];	// L102, [4,6)
        float v70 = v68 + v69;	// L103, [6,11)
        v6[v52][((v53 * 8) + 3)] = v70;	// L104, [11,12)
        float v71 = v5[v51][((v53 * 8) + 4)];	// L105, [0,2)
        float v72 = v54 * v71;	// L106, [2,6)
        float v73 = v6[v52][((v53 * 8) + 4)];	// L107, [4,6)
        float v74 = v72 + v73;	// L108, [6,11)
        v6[v52][((v53 * 8) + 4)] = v74;	// L109, [11,12)
        float v75 = v5[v51][((v53 * 8) + 5)];	// L110, [0,2)
        float v76 = v54 * v75;	// L111, [2,6)
        float v77 = v6[v52][((v53 * 8) + 5)];	// L112, [4,6)
        float v78 = v76 + v77;	// L113, [6,11)
        v6[v52][((v53 * 8) + 5)] = v78;	// L114, [11,12)
        float v79 = v5[v51][((v53 * 8) + 6)];	// L115, [0,2)
        float v80 = v54 * v79;	// L116, [2,6)
        float v81 = v6[v52][((v53 * 8) + 6)];	// L117, [4,6)
        float v82 = v80 + v81;	// L118, [6,11)
        v6[v52][((v53 * 8) + 6)] = v82;	// L119, [11,12)
        float v83 = v5[v51][((v53 * 8) + 7)];	// L120, [0,2)
        float v84 = v54 * v83;	// L121, [2,6)
        float v85 = v6[v52][((v53 * 8) + 7)];	// L122, [4,6)
        float v86 = v84 + v85;	// L123, [6,11)
        v6[v52][((v53 * 8) + 7)] = v86;	// L124, [11,12)
      }
    }
  }
}

