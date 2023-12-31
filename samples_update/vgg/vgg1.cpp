
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
/// Latency=32014385, interval=32014385
/// DSP=40, BRAM=0
void vgg(
  float v0,
  float v1[2][64][32][32],
  float v2[2][64][16][16],
  float v3[64][3][3][3],
  float v4[64][64][3][3],
  float v5[2][3][34][34],
  float v6[2][64][34][34],
  float v7[2][64][18][18],
  float v8[2][64][32][32],
  float v9[2][64][16][16],
  float v10[2][128][16][16],
  float v11[2][128][16][16]
) {	// L8, [0,32014385)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
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

  #pragma HLS array_partition variable=v1 cyclic factor=8 dim=2
  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=3
  #pragma HLS array_partition variable=v1 cyclic factor=16 dim=4
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=3
  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=4
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=8 dim=1
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS array_partition variable=v5 cyclic factor=2 dim=4
  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS resource variable=v7 core=ram_s2p_bram

  #pragma HLS array_partition variable=v8 cyclic factor=2 dim=3
  #pragma HLS array_partition variable=v8 cyclic factor=16 dim=4
  #pragma HLS resource variable=v8 core=ram_s2p_bram

  #pragma HLS array_partition variable=v9 cyclic factor=2 dim=3
  #pragma HLS array_partition variable=v9 cyclic factor=2 dim=4
  #pragma HLS resource variable=v9 core=ram_s2p_bram

  #pragma HLS resource variable=v10 core=ram_s2p_bram

  #pragma HLS resource variable=v11 core=ram_s2p_bram

  for (int v12 = 0; v12 < 2; v12 += 1) {	// L9, [0,4098), iterCycle=1, II=1
    for (int v13 = 0; v13 < 64; v13 += 1) {	// L10, [32010285,32012335), iterCycle=1, II=1
      for (int v14 = 0; v14 < 16; v14 += 1) {	// L11, [32010285,32010319), iterCycle=1, II=1
        for (int v15 = 0; v15 < 2; v15 += 1) {	// L12, [32010285,32010289), iterCycle=1, II=1
          #pragma HLS pipeline II=1
          v1[v12][v13][(v14 * 2)][(v15 * 16)] = v0;	// L13, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 1)] = v0;	// L14, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 2)] = v0;	// L15, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 3)] = v0;	// L16, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 4)] = v0;	// L17, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 5)] = v0;	// L18, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 6)] = v0;	// L19, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 7)] = v0;	// L20, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 8)] = v0;	// L21, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 9)] = v0;	// L22, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 10)] = v0;	// L23, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 11)] = v0;	// L24, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 12)] = v0;	// L25, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 13)] = v0;	// L26, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 14)] = v0;	// L27, [0,1)
          v1[v12][v13][(v14 * 2)][((v15 * 16) + 15)] = v0;	// L28, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][(v15 * 16)] = v0;	// L29, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 1)] = v0;	// L30, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 2)] = v0;	// L31, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 3)] = v0;	// L32, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 4)] = v0;	// L33, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 5)] = v0;	// L34, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 6)] = v0;	// L35, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 7)] = v0;	// L36, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 8)] = v0;	// L37, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 9)] = v0;	// L38, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 10)] = v0;	// L39, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 11)] = v0;	// L40, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 12)] = v0;	// L41, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 13)] = v0;	// L42, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 14)] = v0;	// L43, [0,1)
          v1[v12][v13][((v14 * 2) + 1)][((v15 * 16) + 15)] = v0;	// L44, [0,1)
        }
      }
    }
  }
  for (int v16 = 0; v16 < 3; v16 += 1) {	// L49, [4098,446479), iterCycle=13, II=2
    for (int v17 = 0; v17 < 3; v17 += 1) {	// L50, [31567904,31715373), iterCycle=13, II=2
      for (int v18 = 0; v18 < 3; v18 += 1) {	// L51, [31567904,31617069), iterCycle=13, II=2
        for (int v19 = 0; v19 < 2; v19 += 1) {	// L52, [31567904,31584301), iterCycle=13, II=2
          for (int v20 = 0; v20 < 8; v20 += 1) {	// L53, [31567904,31576109), iterCycle=13, II=2
            for (int v21 = 0; v21 < 32; v21 += 1) {	// L54, [31567904,31568941), iterCycle=13, II=2
              for (int v22 = 0; v22 < 16; v22 += 1) {	// L55, [31567904,31567949), iterCycle=13, II=2
                #pragma HLS pipeline II=1
                float v23 = v3[(v20 * 8)][v16][v17][v18];	// L56, [0,2)
                float v24 = v5[v19][v16][(v21 + v17)][((v22 * 2) + v18)];	// L57, [0,2)
                float v25 = v23 * v24;	// L58, [2,6)
                float v26 = v1[v19][(v20 * 8)][v21][(v22 * 2)];	// L59, [4,6)
                float v27 = v25 + v26;	// L60, [6,11)
                v1[v19][(v20 * 8)][v21][(v22 * 2)] = v27;	// L61, [11,12)
                float v28 = v5[v19][v16][(v21 + v17)][(((v22 * 2) + v18) + 1)];	// L62, [1,3)
                float v29 = v23 * v28;	// L63, [3,7)
                float v30 = v1[v19][(v20 * 8)][v21][((v22 * 2) + 1)];	// L64, [5,7)
                float v31 = v29 + v30;	// L65, [7,12)
                v1[v19][(v20 * 8)][v21][((v22 * 2) + 1)] = v31;	// L66, [12,13)
                float v32 = v3[((v20 * 8) + 1)][v16][v17][v18];	// L67, [0,2)
                float v33 = v32 * v24;	// L68, [2,6)
                float v34 = v1[v19][((v20 * 8) + 1)][v21][(v22 * 2)];	// L69, [4,6)
                float v35 = v33 + v34;	// L70, [6,11)
                v1[v19][((v20 * 8) + 1)][v21][(v22 * 2)] = v35;	// L71, [11,12)
                float v36 = v32 * v28;	// L72, [3,7)
                float v37 = v1[v19][((v20 * 8) + 1)][v21][((v22 * 2) + 1)];	// L73, [5,7)
                float v38 = v36 + v37;	// L74, [7,12)
                v1[v19][((v20 * 8) + 1)][v21][((v22 * 2) + 1)] = v38;	// L75, [12,13)
                float v39 = v3[((v20 * 8) + 2)][v16][v17][v18];	// L76, [0,2)
                float v40 = v39 * v24;	// L77, [2,6)
                float v41 = v1[v19][((v20 * 8) + 2)][v21][(v22 * 2)];	// L78, [4,6)
                float v42 = v40 + v41;	// L79, [6,11)
                v1[v19][((v20 * 8) + 2)][v21][(v22 * 2)] = v42;	// L80, [11,12)
                float v43 = v39 * v28;	// L81, [3,7)
                float v44 = v1[v19][((v20 * 8) + 2)][v21][((v22 * 2) + 1)];	// L82, [5,7)
                float v45 = v43 + v44;	// L83, [7,12)
                v1[v19][((v20 * 8) + 2)][v21][((v22 * 2) + 1)] = v45;	// L84, [12,13)
                float v46 = v3[((v20 * 8) + 3)][v16][v17][v18];	// L85, [0,2)
                float v47 = v46 * v24;	// L86, [2,6)
                float v48 = v1[v19][((v20 * 8) + 3)][v21][(v22 * 2)];	// L87, [4,6)
                float v49 = v47 + v48;	// L88, [6,11)
                v1[v19][((v20 * 8) + 3)][v21][(v22 * 2)] = v49;	// L89, [11,12)
                float v50 = v46 * v28;	// L90, [3,7)
                float v51 = v1[v19][((v20 * 8) + 3)][v21][((v22 * 2) + 1)];	// L91, [5,7)
                float v52 = v50 + v51;	// L92, [7,12)
                v1[v19][((v20 * 8) + 3)][v21][((v22 * 2) + 1)] = v52;	// L93, [12,13)
                float v53 = v3[((v20 * 8) + 4)][v16][v17][v18];	// L94, [0,2)
                float v54 = v53 * v24;	// L95, [2,6)
                float v55 = v1[v19][((v20 * 8) + 4)][v21][(v22 * 2)];	// L96, [4,6)
                float v56 = v54 + v55;	// L97, [6,11)
                v1[v19][((v20 * 8) + 4)][v21][(v22 * 2)] = v56;	// L98, [11,12)
                float v57 = v53 * v28;	// L99, [3,7)
                float v58 = v1[v19][((v20 * 8) + 4)][v21][((v22 * 2) + 1)];	// L100, [5,7)
                float v59 = v57 + v58;	// L101, [7,12)
                v1[v19][((v20 * 8) + 4)][v21][((v22 * 2) + 1)] = v59;	// L102, [12,13)
                float v60 = v3[((v20 * 8) + 5)][v16][v17][v18];	// L103, [0,2)
                float v61 = v60 * v24;	// L104, [2,6)
                float v62 = v1[v19][((v20 * 8) + 5)][v21][(v22 * 2)];	// L105, [4,6)
                float v63 = v61 + v62;	// L106, [6,11)
                v1[v19][((v20 * 8) + 5)][v21][(v22 * 2)] = v63;	// L107, [11,12)
                float v64 = v60 * v28;	// L108, [3,7)
                float v65 = v1[v19][((v20 * 8) + 5)][v21][((v22 * 2) + 1)];	// L109, [5,7)
                float v66 = v64 + v65;	// L110, [7,12)
                v1[v19][((v20 * 8) + 5)][v21][((v22 * 2) + 1)] = v66;	// L111, [12,13)
                float v67 = v3[((v20 * 8) + 6)][v16][v17][v18];	// L112, [0,2)
                float v68 = v67 * v24;	// L113, [2,6)
                float v69 = v1[v19][((v20 * 8) + 6)][v21][(v22 * 2)];	// L114, [4,6)
                float v70 = v68 + v69;	// L115, [6,11)
                v1[v19][((v20 * 8) + 6)][v21][(v22 * 2)] = v70;	// L116, [11,12)
                float v71 = v67 * v28;	// L117, [3,7)
                float v72 = v1[v19][((v20 * 8) + 6)][v21][((v22 * 2) + 1)];	// L118, [5,7)
                float v73 = v71 + v72;	// L119, [7,12)
                v1[v19][((v20 * 8) + 6)][v21][((v22 * 2) + 1)] = v73;	// L120, [12,13)
                float v74 = v3[((v20 * 8) + 7)][v16][v17][v18];	// L121, [0,2)
                float v75 = v74 * v24;	// L122, [2,6)
                float v76 = v1[v19][((v20 * 8) + 7)][v21][(v22 * 2)];	// L123, [4,6)
                float v77 = v75 + v76;	// L124, [6,11)
                v1[v19][((v20 * 8) + 7)][v21][(v22 * 2)] = v77;	// L125, [11,12)
                float v78 = v74 * v28;	// L126, [3,7)
                float v79 = v1[v19][((v20 * 8) + 7)][v21][((v22 * 2) + 1)];	// L127, [5,7)
                float v80 = v78 + v79;	// L128, [7,12)
                v1[v19][((v20 * 8) + 7)][v21][((v22 * 2) + 1)] = v80;	// L129, [12,13)
              }
            }
          }
        }
      }
    }
  }
  for (int v81 = 0; v81 < 2; v81 += 1) {	// L137, [446479,450579), iterCycle=3, II=1
    for (int v82 = 0; v82 < 64; v82 += 1) {	// L138, [31563804,31565856), iterCycle=3, II=1
      for (int v83 = 0; v83 < 16; v83 += 1) {	// L139, [31563804,31563840), iterCycle=3, II=1
        for (int v84 = 0; v84 < 2; v84 += 1) {	// L140, [31563804,31563810), iterCycle=3, II=1
          #pragma HLS pipeline II=1
          float v85 = v1[v81][v82][(v83 * 2)][(v84 * 16)];	// L141, [0,2)
          v8[v81][v82][(v83 * 2)][(v84 * 16)] = v85;	// L142, [2,3)
          float v86 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 1)];	// L143, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 1)] = v86;	// L144, [2,3)
          float v87 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 2)];	// L145, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 2)] = v87;	// L146, [2,3)
          float v88 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 3)];	// L147, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 3)] = v88;	// L148, [2,3)
          float v89 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 4)];	// L149, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 4)] = v89;	// L150, [2,3)
          float v90 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 5)];	// L151, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 5)] = v90;	// L152, [2,3)
          float v91 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 6)];	// L153, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 6)] = v91;	// L154, [2,3)
          float v92 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 7)];	// L155, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 7)] = v92;	// L156, [2,3)
          float v93 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 8)];	// L157, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 8)] = v93;	// L158, [2,3)
          float v94 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 9)];	// L159, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 9)] = v94;	// L160, [2,3)
          float v95 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 10)];	// L161, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 10)] = v95;	// L162, [2,3)
          float v96 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 11)];	// L163, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 11)] = v96;	// L164, [2,3)
          float v97 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 12)];	// L165, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 12)] = v97;	// L166, [2,3)
          float v98 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 13)];	// L167, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 13)] = v98;	// L168, [2,3)
          float v99 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 14)];	// L169, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 14)] = v99;	// L170, [2,3)
          float v100 = v1[v81][v82][(v83 * 2)][((v84 * 16) + 15)];	// L171, [0,2)
          v8[v81][v82][(v83 * 2)][((v84 * 16) + 15)] = v100;	// L172, [2,3)
          float v101 = v1[v81][v82][((v83 * 2) + 1)][(v84 * 16)];	// L173, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][(v84 * 16)] = v101;	// L174, [2,3)
          float v102 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 1)];	// L175, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 1)] = v102;	// L176, [2,3)
          float v103 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 2)];	// L177, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 2)] = v103;	// L178, [2,3)
          float v104 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 3)];	// L179, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 3)] = v104;	// L180, [2,3)
          float v105 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 4)];	// L181, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 4)] = v105;	// L182, [2,3)
          float v106 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 5)];	// L183, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 5)] = v106;	// L184, [2,3)
          float v107 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 6)];	// L185, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 6)] = v107;	// L186, [2,3)
          float v108 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 7)];	// L187, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 7)] = v108;	// L188, [2,3)
          float v109 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 8)];	// L189, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 8)] = v109;	// L190, [2,3)
          float v110 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 9)];	// L191, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 9)] = v110;	// L192, [2,3)
          float v111 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 10)];	// L193, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 10)] = v111;	// L194, [2,3)
          float v112 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 11)];	// L195, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 11)] = v112;	// L196, [2,3)
          float v113 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 12)];	// L197, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 12)] = v113;	// L198, [2,3)
          float v114 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 13)];	// L199, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 13)] = v114;	// L200, [2,3)
          float v115 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 14)];	// L201, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 14)] = v115;	// L202, [2,3)
          float v116 = v1[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 15)];	// L203, [0,2)
          v8[v81][v82][((v83 * 2) + 1)][((v84 * 16) + 15)] = v116;	// L204, [2,3)
        }
      }
    }
  }
  for (int v117 = 0; v117 < 2; v117 += 1) {	// L209, [450579,483349), iterCycle=1, II=1
    for (int v118 = 0; v118 < 64; v118 += 1) {	// L210, [31531034,31547420), iterCycle=1, II=1
      for (int v119 = 0; v119 < 16; v119 += 1) {	// L211, [31531034,31531292), iterCycle=1, II=1
        for (int v120 = 0; v120 < 16; v120 += 1) {	// L212, [31531034,31531052), iterCycle=1, II=1
          #pragma HLS pipeline II=1
          v2[v117][v118][v119][v120] = v0;	// L213, [0,1)
        }
      }
    }
  }
  for (int v121 = 0; v121 < 64; v121 += 1) {	// L218, [483349,19357733), iterCycle=18, II=4
    for (int v122 = 0; v122 < 3; v122 += 1) {	// L219, [12656650,12951578), iterCycle=18, II=4
      for (int v123 = 0; v123 < 3; v123 += 1) {	// L220, [12656650,12754970), iterCycle=18, II=4
        for (int v124 = 0; v124 < 2; v124 += 1) {	// L221, [12656650,12689434), iterCycle=18, II=4
          for (int v125 = 0; v125 < 64; v125 += 1) {	// L222, [12656650,12673050), iterCycle=18, II=4
            for (int v126 = 0; v126 < 8; v126 += 1) {	// L223, [12656650,12656922), iterCycle=18, II=4
              for (int v127 = 0; v127 < 8; v127 += 1) {	// L224, [12656650,12656698), iterCycle=18, II=4
                #pragma HLS pipeline II=1
                float v128 = v4[v125][v121][v122][v123];	// L225, [6,8)
                float v129 = v8[v124][v121][((v126 * 4) + v122)][((v127 * 4) + v123)];	// L226, [0,2)
                float v130 = v128 * v129;	// L227, [8,12)
                float v131 = v2[v124][v125][(v126 * 2)][(v127 * 2)];	// L228, [10,12)
                float v132 = v130 + v131;	// L229, [12,17)
                v2[v124][v125][(v126 * 2)][(v127 * 2)] = v132;	// L230, [17,18)
                float v133 = v8[v124][v121][((v126 * 4) + v122)][(((v127 * 4) + v123) + 2)];	// L231, [2,4)
                float v134 = v128 * v133;	// L232, [8,12)
                float v135 = v2[v124][v125][(v126 * 2)][((v127 * 2) + 1)];	// L233, [10,12)
                float v136 = v134 + v135;	// L234, [12,17)
                v2[v124][v125][(v126 * 2)][((v127 * 2) + 1)] = v136;	// L235, [17,18)
                float v137 = v8[v124][v121][(((v126 * 4) + v122) + 2)][((v127 * 4) + v123)];	// L236, [4,6)
                float v138 = v128 * v137;	// L237, [8,12)
                float v139 = v2[v124][v125][((v126 * 2) + 1)][(v127 * 2)];	// L238, [10,12)
                float v140 = v138 + v139;	// L239, [12,17)
                v2[v124][v125][((v126 * 2) + 1)][(v127 * 2)] = v140;	// L240, [17,18)
                float v141 = v8[v124][v121][(((v126 * 4) + v122) + 2)][(((v127 * 4) + v123) + 2)];	// L241, [6,8)
                float v142 = v128 * v141;	// L242, [8,12)
                float v143 = v2[v124][v125][((v126 * 2) + 1)][((v127 * 2) + 1)];	// L243, [10,12)
                float v144 = v142 + v143;	// L244, [12,17)
                v2[v124][v125][((v126 * 2) + 1)][((v127 * 2) + 1)] = v144;	// L245, [17,18)
              }
            }
          }
        }
      }
    }
  }
  for (int v145 = 0; v145 < 2; v145 += 1) {	// L253, [19357733,19365929), iterCycle=3, II=1
    for (int v146 = 0; v146 < 64; v146 += 1) {	// L254, [12648454,12652554), iterCycle=3, II=1
      for (int v147 = 0; v147 < 8; v147 += 1) {	// L255, [12648454,12648522), iterCycle=3, II=1
        for (int v148 = 0; v148 < 8; v148 += 1) {	// L256, [12648454,12648466), iterCycle=3, II=1
          #pragma HLS pipeline II=1
          float v149 = v2[v145][v146][(v147 * 2)][(v148 * 2)];	// L257, [0,2)
          v9[v145][v146][(v147 * 2)][(v148 * 2)] = v149;	// L258, [2,3)
          float v150 = v2[v145][v146][(v147 * 2)][((v148 * 2) + 1)];	// L259, [0,2)
          v9[v145][v146][(v147 * 2)][((v148 * 2) + 1)] = v150;	// L260, [2,3)
          float v151 = v2[v145][v146][((v147 * 2) + 1)][(v148 * 2)];	// L261, [0,2)
          v9[v145][v146][((v147 * 2) + 1)][(v148 * 2)] = v151;	// L262, [2,3)
          float v152 = v2[v145][v146][((v147 * 2) + 1)][((v148 * 2) + 1)];	// L263, [0,2)
          v9[v145][v146][((v147 * 2) + 1)][((v148 * 2) + 1)] = v152;	// L264, [2,3)
        }
      }
    }
  }
  for (int v153 = 0; v153 < 2; v153 += 1) {	// L269, [19365929,19431467), iterCycle=1, II=1
    for (int v154 = 0; v154 < 128; v154 += 1) {	// L270, [12582916,12615686), iterCycle=1, II=1
      for (int v155 = 0; v155 < 16; v155 += 1) {	// L271, [12582916,12583174), iterCycle=1, II=1
        for (int v156 = 0; v156 < 16; v156 += 1) {	// L272, [12582916,12582934), iterCycle=1, II=1
          #pragma HLS pipeline II=1
          v11[v153][v154][v155][v156] = v0;	// L273, [0,1)
        }
      }
    }
  }
  for (int v157 = 0; v157 < 2; v157 += 1) {	// L278, [19431467,32014383), iterCycle=3, II=1
    for (int v158 = 0; v158 < 128; v158 += 1) {	// L279, [0,6291460), iterCycle=3, II=1
      for (int v159 = 0; v159 < 16; v159 += 1) {	// L280, [0,49156), iterCycle=3, II=1
        for (int v160 = 0; v160 < 16; v160 += 1) {	// L281, [0,3076), iterCycle=3, II=1
          for (int v161 = 0; v161 < 64; v161 += 1) {	// L282, [0,196), iterCycle=3, II=1
            for (int v162 = 0; v162 < 3; v162 += 1) {	// L283, [0,7), iterCycle=3, II=1
              #pragma HLS pipeline II=1
              float v163 = v9[v157][v161][(v159 + v162)][(v160 + 2)];	// L284, [0,2)
              v11[v157][v158][v159][v160] = v163;	// L285, [2,3)
            }
          }
        }
      }
    }
  }
}

