
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
/// Latency=128, interval=128
/// DSP=160, BRAM=0
void gesummv_32(
  float v0,
  float v1,
  float v2[32][32],
  float v3[32][32],
  float v4[32],
  float v5[32],
  float v6[32]
) {	// L5, [0,128)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6

  #pragma HLS array_partition variable=v2 cyclic factor=16 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=16 dim=1
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=16 dim=1
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS array_partition variable=v6 cyclic factor=16 dim=1
  #pragma HLS resource variable=v6 core=ram_s2p_bram

  for (int v7 = 0; v7 < 32; v7 += 1) {	// L6, [0,77), iterCycle=12, II=1
    for (int v8 = 0; v8 < 2; v8 += 1) {	// L7, [49,64), iterCycle=12, II=1
      #pragma HLS pipeline II=1
      float v9 = v2[(v8 * 16)][v7];	// L8, [0,2)
      float v10 = v5[v7];	// L9, [0,2)
      float v11 = v9 * v10;	// L10, [2,6)
      float v12 = v4[(v8 * 16)];	// L11, [4,6)
      float v13 = v11 + v12;	// L12, [6,11)
      v4[(v8 * 16)] = v13;	// L13, [11,12)
      float v14 = v3[(v8 * 16)][v7];	// L14, [0,2)
      float v15 = v14 * v10;	// L15, [2,6)
      float v16 = v6[(v8 * 16)];	// L16, [4,6)
      float v17 = v15 + v16;	// L17, [6,11)
      v6[(v8 * 16)] = v17;	// L18, [11,12)
      float v18 = v2[((v8 * 16) + 1)][v7];	// L19, [0,2)
      float v19 = v18 * v10;	// L20, [2,6)
      float v20 = v4[((v8 * 16) + 1)];	// L21, [4,6)
      float v21 = v19 + v20;	// L22, [6,11)
      v4[((v8 * 16) + 1)] = v21;	// L23, [11,12)
      float v22 = v3[((v8 * 16) + 1)][v7];	// L24, [0,2)
      float v23 = v22 * v10;	// L25, [2,6)
      float v24 = v6[((v8 * 16) + 1)];	// L26, [4,6)
      float v25 = v23 + v24;	// L27, [6,11)
      v6[((v8 * 16) + 1)] = v25;	// L28, [11,12)
      float v26 = v2[((v8 * 16) + 2)][v7];	// L29, [0,2)
      float v27 = v26 * v10;	// L30, [2,6)
      float v28 = v4[((v8 * 16) + 2)];	// L31, [4,6)
      float v29 = v27 + v28;	// L32, [6,11)
      v4[((v8 * 16) + 2)] = v29;	// L33, [11,12)
      float v30 = v3[((v8 * 16) + 2)][v7];	// L34, [0,2)
      float v31 = v30 * v10;	// L35, [2,6)
      float v32 = v6[((v8 * 16) + 2)];	// L36, [4,6)
      float v33 = v31 + v32;	// L37, [6,11)
      v6[((v8 * 16) + 2)] = v33;	// L38, [11,12)
      float v34 = v2[((v8 * 16) + 3)][v7];	// L39, [0,2)
      float v35 = v34 * v10;	// L40, [2,6)
      float v36 = v4[((v8 * 16) + 3)];	// L41, [4,6)
      float v37 = v35 + v36;	// L42, [6,11)
      v4[((v8 * 16) + 3)] = v37;	// L43, [11,12)
      float v38 = v3[((v8 * 16) + 3)][v7];	// L44, [0,2)
      float v39 = v38 * v10;	// L45, [2,6)
      float v40 = v6[((v8 * 16) + 3)];	// L46, [4,6)
      float v41 = v39 + v40;	// L47, [6,11)
      v6[((v8 * 16) + 3)] = v41;	// L48, [11,12)
      float v42 = v2[((v8 * 16) + 4)][v7];	// L49, [0,2)
      float v43 = v42 * v10;	// L50, [2,6)
      float v44 = v4[((v8 * 16) + 4)];	// L51, [4,6)
      float v45 = v43 + v44;	// L52, [6,11)
      v4[((v8 * 16) + 4)] = v45;	// L53, [11,12)
      float v46 = v3[((v8 * 16) + 4)][v7];	// L54, [0,2)
      float v47 = v46 * v10;	// L55, [2,6)
      float v48 = v6[((v8 * 16) + 4)];	// L56, [4,6)
      float v49 = v47 + v48;	// L57, [6,11)
      v6[((v8 * 16) + 4)] = v49;	// L58, [11,12)
      float v50 = v2[((v8 * 16) + 5)][v7];	// L59, [0,2)
      float v51 = v50 * v10;	// L60, [2,6)
      float v52 = v4[((v8 * 16) + 5)];	// L61, [4,6)
      float v53 = v51 + v52;	// L62, [6,11)
      v4[((v8 * 16) + 5)] = v53;	// L63, [11,12)
      float v54 = v3[((v8 * 16) + 5)][v7];	// L64, [0,2)
      float v55 = v54 * v10;	// L65, [2,6)
      float v56 = v6[((v8 * 16) + 5)];	// L66, [4,6)
      float v57 = v55 + v56;	// L67, [6,11)
      v6[((v8 * 16) + 5)] = v57;	// L68, [11,12)
      float v58 = v2[((v8 * 16) + 6)][v7];	// L69, [0,2)
      float v59 = v58 * v10;	// L70, [2,6)
      float v60 = v4[((v8 * 16) + 6)];	// L71, [4,6)
      float v61 = v59 + v60;	// L72, [6,11)
      v4[((v8 * 16) + 6)] = v61;	// L73, [11,12)
      float v62 = v3[((v8 * 16) + 6)][v7];	// L74, [0,2)
      float v63 = v62 * v10;	// L75, [2,6)
      float v64 = v6[((v8 * 16) + 6)];	// L76, [4,6)
      float v65 = v63 + v64;	// L77, [6,11)
      v6[((v8 * 16) + 6)] = v65;	// L78, [11,12)
      float v66 = v2[((v8 * 16) + 7)][v7];	// L79, [0,2)
      float v67 = v66 * v10;	// L80, [2,6)
      float v68 = v4[((v8 * 16) + 7)];	// L81, [4,6)
      float v69 = v67 + v68;	// L82, [6,11)
      v4[((v8 * 16) + 7)] = v69;	// L83, [11,12)
      float v70 = v3[((v8 * 16) + 7)][v7];	// L84, [0,2)
      float v71 = v70 * v10;	// L85, [2,6)
      float v72 = v6[((v8 * 16) + 7)];	// L86, [4,6)
      float v73 = v71 + v72;	// L87, [6,11)
      v6[((v8 * 16) + 7)] = v73;	// L88, [11,12)
      float v74 = v2[((v8 * 16) + 8)][v7];	// L89, [0,2)
      float v75 = v74 * v10;	// L90, [2,6)
      float v76 = v4[((v8 * 16) + 8)];	// L91, [4,6)
      float v77 = v75 + v76;	// L92, [6,11)
      v4[((v8 * 16) + 8)] = v77;	// L93, [11,12)
      float v78 = v3[((v8 * 16) + 8)][v7];	// L94, [0,2)
      float v79 = v78 * v10;	// L95, [2,6)
      float v80 = v6[((v8 * 16) + 8)];	// L96, [4,6)
      float v81 = v79 + v80;	// L97, [6,11)
      v6[((v8 * 16) + 8)] = v81;	// L98, [11,12)
      float v82 = v2[((v8 * 16) + 9)][v7];	// L99, [0,2)
      float v83 = v82 * v10;	// L100, [2,6)
      float v84 = v4[((v8 * 16) + 9)];	// L101, [4,6)
      float v85 = v83 + v84;	// L102, [6,11)
      v4[((v8 * 16) + 9)] = v85;	// L103, [11,12)
      float v86 = v3[((v8 * 16) + 9)][v7];	// L104, [0,2)
      float v87 = v86 * v10;	// L105, [2,6)
      float v88 = v6[((v8 * 16) + 9)];	// L106, [4,6)
      float v89 = v87 + v88;	// L107, [6,11)
      v6[((v8 * 16) + 9)] = v89;	// L108, [11,12)
      float v90 = v2[((v8 * 16) + 10)][v7];	// L109, [0,2)
      float v91 = v90 * v10;	// L110, [2,6)
      float v92 = v4[((v8 * 16) + 10)];	// L111, [4,6)
      float v93 = v91 + v92;	// L112, [6,11)
      v4[((v8 * 16) + 10)] = v93;	// L113, [11,12)
      float v94 = v3[((v8 * 16) + 10)][v7];	// L114, [0,2)
      float v95 = v94 * v10;	// L115, [2,6)
      float v96 = v6[((v8 * 16) + 10)];	// L116, [4,6)
      float v97 = v95 + v96;	// L117, [6,11)
      v6[((v8 * 16) + 10)] = v97;	// L118, [11,12)
      float v98 = v2[((v8 * 16) + 11)][v7];	// L119, [0,2)
      float v99 = v98 * v10;	// L120, [2,6)
      float v100 = v4[((v8 * 16) + 11)];	// L121, [4,6)
      float v101 = v99 + v100;	// L122, [6,11)
      v4[((v8 * 16) + 11)] = v101;	// L123, [11,12)
      float v102 = v3[((v8 * 16) + 11)][v7];	// L124, [0,2)
      float v103 = v102 * v10;	// L125, [2,6)
      float v104 = v6[((v8 * 16) + 11)];	// L126, [4,6)
      float v105 = v103 + v104;	// L127, [6,11)
      v6[((v8 * 16) + 11)] = v105;	// L128, [11,12)
      float v106 = v2[((v8 * 16) + 12)][v7];	// L129, [0,2)
      float v107 = v106 * v10;	// L130, [2,6)
      float v108 = v4[((v8 * 16) + 12)];	// L131, [4,6)
      float v109 = v107 + v108;	// L132, [6,11)
      v4[((v8 * 16) + 12)] = v109;	// L133, [11,12)
      float v110 = v3[((v8 * 16) + 12)][v7];	// L134, [0,2)
      float v111 = v110 * v10;	// L135, [2,6)
      float v112 = v6[((v8 * 16) + 12)];	// L136, [4,6)
      float v113 = v111 + v112;	// L137, [6,11)
      v6[((v8 * 16) + 12)] = v113;	// L138, [11,12)
      float v114 = v2[((v8 * 16) + 13)][v7];	// L139, [0,2)
      float v115 = v114 * v10;	// L140, [2,6)
      float v116 = v4[((v8 * 16) + 13)];	// L141, [4,6)
      float v117 = v115 + v116;	// L142, [6,11)
      v4[((v8 * 16) + 13)] = v117;	// L143, [11,12)
      float v118 = v3[((v8 * 16) + 13)][v7];	// L144, [0,2)
      float v119 = v118 * v10;	// L145, [2,6)
      float v120 = v6[((v8 * 16) + 13)];	// L146, [4,6)
      float v121 = v119 + v120;	// L147, [6,11)
      v6[((v8 * 16) + 13)] = v121;	// L148, [11,12)
      float v122 = v2[((v8 * 16) + 14)][v7];	// L149, [0,2)
      float v123 = v122 * v10;	// L150, [2,6)
      float v124 = v4[((v8 * 16) + 14)];	// L151, [4,6)
      float v125 = v123 + v124;	// L152, [6,11)
      v4[((v8 * 16) + 14)] = v125;	// L153, [11,12)
      float v126 = v3[((v8 * 16) + 14)][v7];	// L154, [0,2)
      float v127 = v126 * v10;	// L155, [2,6)
      float v128 = v6[((v8 * 16) + 14)];	// L156, [4,6)
      float v129 = v127 + v128;	// L157, [6,11)
      v6[((v8 * 16) + 14)] = v129;	// L158, [11,12)
      float v130 = v2[((v8 * 16) + 15)][v7];	// L159, [0,2)
      float v131 = v130 * v10;	// L160, [2,6)
      float v132 = v4[((v8 * 16) + 15)];	// L161, [4,6)
      float v133 = v131 + v132;	// L162, [6,11)
      v4[((v8 * 16) + 15)] = v133;	// L163, [11,12)
      float v134 = v3[((v8 * 16) + 15)][v7];	// L164, [0,2)
      float v135 = v134 * v10;	// L165, [2,6)
      float v136 = v6[((v8 * 16) + 15)];	// L166, [4,6)
      float v137 = v135 + v136;	// L167, [6,11)
      v6[((v8 * 16) + 15)] = v137;	// L168, [11,12)
    }
  }
  for (int v138 = 0; v138 < 32; v138 += 1) {	// L171, [77,126), iterCycle=16, II=1
    #pragma HLS pipeline II=1
    float v139 = v4[v138];	// L172, [0,2)
    float v140 = v0 * v139;	// L173, [2,6)
    float v141 = v1 + v140;	// L174, [6,11)
    float v142 = v6[v138];	// L175, [9,11)
    float v143 = v141 * v142;	// L176, [11,15)
    v6[v138] = v143;	// L177, [15,16)
  }
}

