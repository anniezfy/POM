
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
/// Latency=1167, interval=1167
/// DSP=10, BRAM=0
void bicg_32(
  float v0[32][32],
  float v1[32],
  float v2[32],
  float v3[32],
  float v4[32]
) {	// L5, [0,1167)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface bram port=v0
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS array_partition variable=v0 cyclic factor=16 dim=1
  #pragma HLS array_partition variable=v0 cyclic factor=16 dim=2
  #pragma HLS resource variable=v0 core=ram_s2p_bram

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=16 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=16 dim=1
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 32; v5 += 1) {	// L6, [0,1165), iterCycle=29, II=18
    for (int v6 = 0; v6 < 2; v6 += 1) {	// L7, [0,49), iterCycle=29, II=18
      #pragma HLS pipeline II=1
      float v7 = v0[v5][(v6 * 16)];	// L8, [0,2)
      float v8 = v3[v5];	// L9, [17,19)
      float v9 = v7 * v8;	// L10, [19,23)
      float v10 = v4[(v6 * 16)];	// L11, [21,23)
      float v11 = v9 + v10;	// L12, [23,28)
      v4[(v6 * 16)] = v11;	// L13, [28,29)
      float v12 = v0[(v6 * 16)][v5];	// L14, [1,3)
      float v13 = v1[v5];	// L15, [17,19)
      float v14 = v12 * v13;	// L16, [19,23)
      float v15 = v2[(v6 * 16)];	// L17, [21,23)
      float v16 = v14 + v15;	// L18, [23,28)
      v2[(v6 * 16)] = v16;	// L19, [28,29)
      float v17 = v0[v5][((v6 * 16) + 1)];	// L20, [2,4)
      float v18 = v17 * v8;	// L21, [19,23)
      float v19 = v4[((v6 * 16) + 1)];	// L22, [21,23)
      float v20 = v18 + v19;	// L23, [23,28)
      v4[((v6 * 16) + 1)] = v20;	// L24, [28,29)
      float v21 = v0[((v6 * 16) + 1)][v5];	// L25, [3,5)
      float v22 = v21 * v13;	// L26, [19,23)
      float v23 = v2[((v6 * 16) + 1)];	// L27, [21,23)
      float v24 = v22 + v23;	// L28, [23,28)
      v2[((v6 * 16) + 1)] = v24;	// L29, [28,29)
      float v25 = v0[v5][((v6 * 16) + 2)];	// L30, [2,4)
      float v26 = v25 * v8;	// L31, [19,23)
      float v27 = v4[((v6 * 16) + 2)];	// L32, [21,23)
      float v28 = v26 + v27;	// L33, [23,28)
      v4[((v6 * 16) + 2)] = v28;	// L34, [28,29)
      float v29 = v0[((v6 * 16) + 2)][v5];	// L35, [3,5)
      float v30 = v29 * v13;	// L36, [19,23)
      float v31 = v2[((v6 * 16) + 2)];	// L37, [21,23)
      float v32 = v30 + v31;	// L38, [23,28)
      v2[((v6 * 16) + 2)] = v32;	// L39, [28,29)
      float v33 = v0[v5][((v6 * 16) + 3)];	// L40, [4,6)
      float v34 = v33 * v8;	// L41, [19,23)
      float v35 = v4[((v6 * 16) + 3)];	// L42, [21,23)
      float v36 = v34 + v35;	// L43, [23,28)
      v4[((v6 * 16) + 3)] = v36;	// L44, [28,29)
      float v37 = v0[((v6 * 16) + 3)][v5];	// L45, [5,7)
      float v38 = v37 * v13;	// L46, [19,23)
      float v39 = v2[((v6 * 16) + 3)];	// L47, [21,23)
      float v40 = v38 + v39;	// L48, [23,28)
      v2[((v6 * 16) + 3)] = v40;	// L49, [28,29)
      float v41 = v0[v5][((v6 * 16) + 4)];	// L50, [4,6)
      float v42 = v41 * v8;	// L51, [19,23)
      float v43 = v4[((v6 * 16) + 4)];	// L52, [21,23)
      float v44 = v42 + v43;	// L53, [23,28)
      v4[((v6 * 16) + 4)] = v44;	// L54, [28,29)
      float v45 = v0[((v6 * 16) + 4)][v5];	// L55, [5,7)
      float v46 = v45 * v13;	// L56, [19,23)
      float v47 = v2[((v6 * 16) + 4)];	// L57, [21,23)
      float v48 = v46 + v47;	// L58, [23,28)
      v2[((v6 * 16) + 4)] = v48;	// L59, [28,29)
      float v49 = v0[v5][((v6 * 16) + 5)];	// L60, [6,8)
      float v50 = v49 * v8;	// L61, [19,23)
      float v51 = v4[((v6 * 16) + 5)];	// L62, [21,23)
      float v52 = v50 + v51;	// L63, [23,28)
      v4[((v6 * 16) + 5)] = v52;	// L64, [28,29)
      float v53 = v0[((v6 * 16) + 5)][v5];	// L65, [7,9)
      float v54 = v53 * v13;	// L66, [19,23)
      float v55 = v2[((v6 * 16) + 5)];	// L67, [21,23)
      float v56 = v54 + v55;	// L68, [23,28)
      v2[((v6 * 16) + 5)] = v56;	// L69, [28,29)
      float v57 = v0[v5][((v6 * 16) + 6)];	// L70, [6,8)
      float v58 = v57 * v8;	// L71, [19,23)
      float v59 = v4[((v6 * 16) + 6)];	// L72, [21,23)
      float v60 = v58 + v59;	// L73, [23,28)
      v4[((v6 * 16) + 6)] = v60;	// L74, [28,29)
      float v61 = v0[((v6 * 16) + 6)][v5];	// L75, [7,9)
      float v62 = v61 * v13;	// L76, [19,23)
      float v63 = v2[((v6 * 16) + 6)];	// L77, [21,23)
      float v64 = v62 + v63;	// L78, [23,28)
      v2[((v6 * 16) + 6)] = v64;	// L79, [28,29)
      float v65 = v0[v5][((v6 * 16) + 7)];	// L80, [8,10)
      float v66 = v65 * v8;	// L81, [19,23)
      float v67 = v4[((v6 * 16) + 7)];	// L82, [21,23)
      float v68 = v66 + v67;	// L83, [23,28)
      v4[((v6 * 16) + 7)] = v68;	// L84, [28,29)
      float v69 = v0[((v6 * 16) + 7)][v5];	// L85, [9,11)
      float v70 = v69 * v13;	// L86, [19,23)
      float v71 = v2[((v6 * 16) + 7)];	// L87, [21,23)
      float v72 = v70 + v71;	// L88, [23,28)
      v2[((v6 * 16) + 7)] = v72;	// L89, [28,29)
      float v73 = v0[v5][((v6 * 16) + 8)];	// L90, [8,10)
      float v74 = v73 * v8;	// L91, [19,23)
      float v75 = v4[((v6 * 16) + 8)];	// L92, [21,23)
      float v76 = v74 + v75;	// L93, [23,28)
      v4[((v6 * 16) + 8)] = v76;	// L94, [28,29)
      float v77 = v0[((v6 * 16) + 8)][v5];	// L95, [9,11)
      float v78 = v77 * v13;	// L96, [19,23)
      float v79 = v2[((v6 * 16) + 8)];	// L97, [21,23)
      float v80 = v78 + v79;	// L98, [23,28)
      v2[((v6 * 16) + 8)] = v80;	// L99, [28,29)
      float v81 = v0[v5][((v6 * 16) + 9)];	// L100, [10,12)
      float v82 = v81 * v8;	// L101, [19,23)
      float v83 = v4[((v6 * 16) + 9)];	// L102, [21,23)
      float v84 = v82 + v83;	// L103, [23,28)
      v4[((v6 * 16) + 9)] = v84;	// L104, [28,29)
      float v85 = v0[((v6 * 16) + 9)][v5];	// L105, [11,13)
      float v86 = v85 * v13;	// L106, [19,23)
      float v87 = v2[((v6 * 16) + 9)];	// L107, [21,23)
      float v88 = v86 + v87;	// L108, [23,28)
      v2[((v6 * 16) + 9)] = v88;	// L109, [28,29)
      float v89 = v0[v5][((v6 * 16) + 10)];	// L110, [10,12)
      float v90 = v89 * v8;	// L111, [19,23)
      float v91 = v4[((v6 * 16) + 10)];	// L112, [21,23)
      float v92 = v90 + v91;	// L113, [23,28)
      v4[((v6 * 16) + 10)] = v92;	// L114, [28,29)
      float v93 = v0[((v6 * 16) + 10)][v5];	// L115, [11,13)
      float v94 = v93 * v13;	// L116, [19,23)
      float v95 = v2[((v6 * 16) + 10)];	// L117, [21,23)
      float v96 = v94 + v95;	// L118, [23,28)
      v2[((v6 * 16) + 10)] = v96;	// L119, [28,29)
      float v97 = v0[v5][((v6 * 16) + 11)];	// L120, [12,14)
      float v98 = v97 * v8;	// L121, [19,23)
      float v99 = v4[((v6 * 16) + 11)];	// L122, [21,23)
      float v100 = v98 + v99;	// L123, [23,28)
      v4[((v6 * 16) + 11)] = v100;	// L124, [28,29)
      float v101 = v0[((v6 * 16) + 11)][v5];	// L125, [13,15)
      float v102 = v101 * v13;	// L126, [19,23)
      float v103 = v2[((v6 * 16) + 11)];	// L127, [21,23)
      float v104 = v102 + v103;	// L128, [23,28)
      v2[((v6 * 16) + 11)] = v104;	// L129, [28,29)
      float v105 = v0[v5][((v6 * 16) + 12)];	// L130, [12,14)
      float v106 = v105 * v8;	// L131, [19,23)
      float v107 = v4[((v6 * 16) + 12)];	// L132, [21,23)
      float v108 = v106 + v107;	// L133, [23,28)
      v4[((v6 * 16) + 12)] = v108;	// L134, [28,29)
      float v109 = v0[((v6 * 16) + 12)][v5];	// L135, [13,15)
      float v110 = v109 * v13;	// L136, [19,23)
      float v111 = v2[((v6 * 16) + 12)];	// L137, [21,23)
      float v112 = v110 + v111;	// L138, [23,28)
      v2[((v6 * 16) + 12)] = v112;	// L139, [28,29)
      float v113 = v0[v5][((v6 * 16) + 13)];	// L140, [14,16)
      float v114 = v113 * v8;	// L141, [19,23)
      float v115 = v4[((v6 * 16) + 13)];	// L142, [21,23)
      float v116 = v114 + v115;	// L143, [23,28)
      v4[((v6 * 16) + 13)] = v116;	// L144, [28,29)
      float v117 = v0[((v6 * 16) + 13)][v5];	// L145, [15,17)
      float v118 = v117 * v13;	// L146, [19,23)
      float v119 = v2[((v6 * 16) + 13)];	// L147, [21,23)
      float v120 = v118 + v119;	// L148, [23,28)
      v2[((v6 * 16) + 13)] = v120;	// L149, [28,29)
      float v121 = v0[v5][((v6 * 16) + 14)];	// L150, [14,16)
      float v122 = v121 * v8;	// L151, [19,23)
      float v123 = v4[((v6 * 16) + 14)];	// L152, [21,23)
      float v124 = v122 + v123;	// L153, [23,28)
      v4[((v6 * 16) + 14)] = v124;	// L154, [28,29)
      float v125 = v0[((v6 * 16) + 14)][v5];	// L155, [15,17)
      float v126 = v125 * v13;	// L156, [19,23)
      float v127 = v2[((v6 * 16) + 14)];	// L157, [21,23)
      float v128 = v126 + v127;	// L158, [23,28)
      v2[((v6 * 16) + 14)] = v128;	// L159, [28,29)
      float v129 = v0[v5][((v6 * 16) + 15)];	// L160, [16,18)
      float v130 = v129 * v8;	// L161, [19,23)
      float v131 = v4[((v6 * 16) + 15)];	// L162, [21,23)
      float v132 = v130 + v131;	// L163, [23,28)
      v4[((v6 * 16) + 15)] = v132;	// L164, [28,29)
      float v133 = v0[((v6 * 16) + 15)][v5];	// L165, [17,19)
      float v134 = v133 * v13;	// L166, [19,23)
      float v135 = v2[((v6 * 16) + 15)];	// L167, [21,23)
      float v136 = v134 + v135;	// L168, [23,28)
      v2[((v6 * 16) + 15)] = v136;	// L169, [28,29)
    }
  }
}

