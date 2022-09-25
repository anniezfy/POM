
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
/// Latency=7865120, interval=7865120
/// DSP=5, BRAM=0
void bicg(
  float v0[4096][4096],
  float v1[4096],
  float v2[4096],
  float v3[4096],
  float v4[4096]
) {	// L4, [0,7865120)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface bram port=v0
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS array_partition variable=v0 cyclic factor=32 dim=1
  #pragma HLS array_partition variable=v0 cyclic factor=64 dim=2
  #pragma HLS resource variable=v0 core=ram_s2p_bram

  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=64 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=64 dim=1
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 512; v5 += 1) {	// L5, [0,7865118), iterCycle=826, II=30
    for (int v6 = 0; v6 < 512; v6 += 1) {	// L6, [0,16158), iterCycle=826, II=30
      #pragma HLS pipeline II=1
      float v7 = v0[(v5 * 8)][(v6 * 8)];	// L7, [0,2)
      float v8 = v3[(v5 * 8)];	// L8, [9,11)
      float v9 = v7 * v8;	// L9, [11,15)
      float v10 = v4[(v6 * 8)];	// L10, [13,15)
      float v11 = v9 + v10;	// L11, [15,20)
      v4[(v6 * 8)] = v11;	// L12, [20,21)
      float v12 = v0[(v6 * 8)][(v5 * 8)];	// L13, [2,4)
      float v13 = v1[(v5 * 8)];	// L14, [9,11)
      float v14 = v12 * v13;	// L15, [11,15)
      float v15 = v2[(v6 * 8)];	// L16, [13,15)
      float v16 = v14 + v15;	// L17, [15,20)
      v2[(v6 * 8)] = v16;	// L18, [20,21)
      float v17 = v0[(v5 * 8)][((v6 * 8) + 1)];	// L19, [3,5)
      float v18 = v3[(v5 * 8)];	// L20, [10,12)
      float v19 = v17 * v18;	// L21, [12,16)
      float v20 = v4[((v6 * 8) + 1)];	// L22, [14,16)
      float v21 = v19 + v20;	// L23, [16,21)
      v4[((v6 * 8) + 1)] = v21;	// L24, [21,22)
      float v22 = v0[((v6 * 8) + 1)][(v5 * 8)];	// L25, [4,6)
      float v23 = v1[(v5 * 8)];	// L26, [10,12)
      float v24 = v22 * v23;	// L27, [12,16)
      float v25 = v2[((v6 * 8) + 1)];	// L28, [14,16)
      float v26 = v24 + v25;	// L29, [16,21)
      v2[((v6 * 8) + 1)] = v26;	// L30, [21,22)
      float v27 = v0[(v5 * 8)][((v6 * 8) + 2)];	// L31, [5,7)
      float v28 = v3[(v5 * 8)];	// L32, [11,13)
      float v29 = v27 * v28;	// L33, [13,17)
      float v30 = v4[((v6 * 8) + 2)];	// L34, [15,17)
      float v31 = v29 + v30;	// L35, [17,22)
      v4[((v6 * 8) + 2)] = v31;	// L36, [22,23)
      float v32 = v0[((v6 * 8) + 2)][(v5 * 8)];	// L37, [6,8)
      float v33 = v1[(v5 * 8)];	// L38, [11,13)
      float v34 = v32 * v33;	// L39, [13,17)
      float v35 = v2[((v6 * 8) + 2)];	// L40, [15,17)
      float v36 = v34 + v35;	// L41, [17,22)
      v2[((v6 * 8) + 2)] = v36;	// L42, [22,23)
      float v37 = v0[(v5 * 8)][((v6 * 8) + 3)];	// L43, [7,9)
      float v38 = v3[(v5 * 8)];	// L44, [12,14)
      float v39 = v37 * v38;	// L45, [14,18)
      float v40 = v4[((v6 * 8) + 3)];	// L46, [16,18)
      float v41 = v39 + v40;	// L47, [18,23)
      v4[((v6 * 8) + 3)] = v41;	// L48, [23,24)
      float v42 = v0[((v6 * 8) + 3)][(v5 * 8)];	// L49, [8,10)
      float v43 = v1[(v5 * 8)];	// L50, [12,14)
      float v44 = v42 * v43;	// L51, [14,18)
      float v45 = v2[((v6 * 8) + 3)];	// L52, [16,18)
      float v46 = v44 + v45;	// L53, [18,23)
      v2[((v6 * 8) + 3)] = v46;	// L54, [23,24)
      float v47 = v0[(v5 * 8)][((v6 * 8) + 4)];	// L55, [9,11)
      float v48 = v3[(v5 * 8)];	// L56, [13,15)
      float v49 = v47 * v48;	// L57, [15,19)
      float v50 = v4[((v6 * 8) + 4)];	// L58, [17,19)
      float v51 = v49 + v50;	// L59, [19,24)
      v4[((v6 * 8) + 4)] = v51;	// L60, [24,25)
      float v52 = v0[((v6 * 8) + 4)][(v5 * 8)];	// L61, [10,12)
      float v53 = v1[(v5 * 8)];	// L62, [13,15)
      float v54 = v52 * v53;	// L63, [15,19)
      float v55 = v2[((v6 * 8) + 4)];	// L64, [17,19)
      float v56 = v54 + v55;	// L65, [19,24)
      v2[((v6 * 8) + 4)] = v56;	// L66, [24,25)
      float v57 = v0[(v5 * 8)][((v6 * 8) + 5)];	// L67, [11,13)
      float v58 = v3[(v5 * 8)];	// L68, [14,16)
      float v59 = v57 * v58;	// L69, [16,20)
      float v60 = v4[((v6 * 8) + 5)];	// L70, [18,20)
      float v61 = v59 + v60;	// L71, [20,25)
      v4[((v6 * 8) + 5)] = v61;	// L72, [25,26)
      float v62 = v0[((v6 * 8) + 5)][(v5 * 8)];	// L73, [12,14)
      float v63 = v1[(v5 * 8)];	// L74, [14,16)
      float v64 = v62 * v63;	// L75, [16,20)
      float v65 = v2[((v6 * 8) + 5)];	// L76, [18,20)
      float v66 = v64 + v65;	// L77, [20,25)
      v2[((v6 * 8) + 5)] = v66;	// L78, [25,26)
      float v67 = v0[(v5 * 8)][((v6 * 8) + 6)];	// L79, [13,15)
      float v68 = v3[(v5 * 8)];	// L80, [15,17)
      float v69 = v67 * v68;	// L81, [17,21)
      float v70 = v4[((v6 * 8) + 6)];	// L82, [19,21)
      float v71 = v69 + v70;	// L83, [21,26)
      v4[((v6 * 8) + 6)] = v71;	// L84, [26,27)
      float v72 = v0[((v6 * 8) + 6)][(v5 * 8)];	// L85, [14,16)
      float v73 = v1[(v5 * 8)];	// L86, [15,17)
      float v74 = v72 * v73;	// L87, [17,21)
      float v75 = v2[((v6 * 8) + 6)];	// L88, [19,21)
      float v76 = v74 + v75;	// L89, [21,26)
      v2[((v6 * 8) + 6)] = v76;	// L90, [26,27)
      float v77 = v0[(v5 * 8)][((v6 * 8) + 7)];	// L91, [15,17)
      float v78 = v3[(v5 * 8)];	// L92, [16,18)
      float v79 = v77 * v78;	// L93, [18,22)
      float v80 = v4[((v6 * 8) + 7)];	// L94, [20,22)
      float v81 = v79 + v80;	// L95, [22,27)
      v4[((v6 * 8) + 7)] = v81;	// L96, [27,28)
      float v82 = v0[((v6 * 8) + 7)][(v5 * 8)];	// L97, [16,18)
      float v83 = v1[(v5 * 8)];	// L98, [16,18)
      float v84 = v82 * v83;	// L99, [18,22)
      float v85 = v2[((v6 * 8) + 7)];	// L100, [20,22)
      float v86 = v84 + v85;	// L101, [22,27)
      v2[((v6 * 8) + 7)] = v86;	// L102, [27,28)
      for (int v87 = 0; v87 < 8; v87 += 1) {	// L103, [28,142), iterCycle=14, II=14
        float v88 = v0[((v5 * 8) + 1)][(v87 + (v6 * 8))];	// L104, [0,2)
        float v89 = v3[((v5 * 8) + 1)];	// L105, [2,4)
        float v90 = v88 * v89;	// L106, [4,8)
        float v91 = v4[(v87 + (v6 * 8))];	// L107, [6,8)
        float v92 = v90 + v91;	// L108, [8,13)
        v4[(v87 + (v6 * 8))] = v92;	// L109, [13,14)
        float v93 = v0[(v87 + (v6 * 8))][((v5 * 8) + 1)];	// L110, [2,4)
        float v94 = v1[((v5 * 8) + 1)];	// L111, [2,4)
        float v95 = v93 * v94;	// L112, [4,8)
        float v96 = v2[(v87 + (v6 * 8))];	// L113, [6,8)
        float v97 = v95 + v96;	// L114, [8,13)
        v2[(v87 + (v6 * 8))] = v97;	// L115, [13,14)
      }
      for (int v98 = 0; v98 < 8; v98 += 1) {	// L117, [142,256), iterCycle=14, II=14
        float v99 = v0[((v5 * 8) + 2)][(v98 + (v6 * 8))];	// L118, [0,2)
        float v100 = v3[((v5 * 8) + 2)];	// L119, [2,4)
        float v101 = v99 * v100;	// L120, [4,8)
        float v102 = v4[(v98 + (v6 * 8))];	// L121, [6,8)
        float v103 = v101 + v102;	// L122, [8,13)
        v4[(v98 + (v6 * 8))] = v103;	// L123, [13,14)
        float v104 = v0[(v98 + (v6 * 8))][((v5 * 8) + 2)];	// L124, [2,4)
        float v105 = v1[((v5 * 8) + 2)];	// L125, [2,4)
        float v106 = v104 * v105;	// L126, [4,8)
        float v107 = v2[(v98 + (v6 * 8))];	// L127, [6,8)
        float v108 = v106 + v107;	// L128, [8,13)
        v2[(v98 + (v6 * 8))] = v108;	// L129, [13,14)
      }
      for (int v109 = 0; v109 < 8; v109 += 1) {	// L131, [256,370), iterCycle=14, II=14
        float v110 = v0[((v5 * 8) + 3)][(v109 + (v6 * 8))];	// L132, [0,2)
        float v111 = v3[((v5 * 8) + 3)];	// L133, [2,4)
        float v112 = v110 * v111;	// L134, [4,8)
        float v113 = v4[(v109 + (v6 * 8))];	// L135, [6,8)
        float v114 = v112 + v113;	// L136, [8,13)
        v4[(v109 + (v6 * 8))] = v114;	// L137, [13,14)
        float v115 = v0[(v109 + (v6 * 8))][((v5 * 8) + 3)];	// L138, [2,4)
        float v116 = v1[((v5 * 8) + 3)];	// L139, [2,4)
        float v117 = v115 * v116;	// L140, [4,8)
        float v118 = v2[(v109 + (v6 * 8))];	// L141, [6,8)
        float v119 = v117 + v118;	// L142, [8,13)
        v2[(v109 + (v6 * 8))] = v119;	// L143, [13,14)
      }
      for (int v120 = 0; v120 < 8; v120 += 1) {	// L145, [370,484), iterCycle=14, II=14
        float v121 = v0[((v5 * 8) + 4)][(v120 + (v6 * 8))];	// L146, [0,2)
        float v122 = v3[((v5 * 8) + 4)];	// L147, [2,4)
        float v123 = v121 * v122;	// L148, [4,8)
        float v124 = v4[(v120 + (v6 * 8))];	// L149, [6,8)
        float v125 = v123 + v124;	// L150, [8,13)
        v4[(v120 + (v6 * 8))] = v125;	// L151, [13,14)
        float v126 = v0[(v120 + (v6 * 8))][((v5 * 8) + 4)];	// L152, [2,4)
        float v127 = v1[((v5 * 8) + 4)];	// L153, [2,4)
        float v128 = v126 * v127;	// L154, [4,8)
        float v129 = v2[(v120 + (v6 * 8))];	// L155, [6,8)
        float v130 = v128 + v129;	// L156, [8,13)
        v2[(v120 + (v6 * 8))] = v130;	// L157, [13,14)
      }
      for (int v131 = 0; v131 < 8; v131 += 1) {	// L159, [484,598), iterCycle=14, II=14
        float v132 = v0[((v5 * 8) + 5)][(v131 + (v6 * 8))];	// L160, [0,2)
        float v133 = v3[((v5 * 8) + 5)];	// L161, [2,4)
        float v134 = v132 * v133;	// L162, [4,8)
        float v135 = v4[(v131 + (v6 * 8))];	// L163, [6,8)
        float v136 = v134 + v135;	// L164, [8,13)
        v4[(v131 + (v6 * 8))] = v136;	// L165, [13,14)
        float v137 = v0[(v131 + (v6 * 8))][((v5 * 8) + 5)];	// L166, [2,4)
        float v138 = v1[((v5 * 8) + 5)];	// L167, [2,4)
        float v139 = v137 * v138;	// L168, [4,8)
        float v140 = v2[(v131 + (v6 * 8))];	// L169, [6,8)
        float v141 = v139 + v140;	// L170, [8,13)
        v2[(v131 + (v6 * 8))] = v141;	// L171, [13,14)
      }
      for (int v142 = 0; v142 < 8; v142 += 1) {	// L173, [598,712), iterCycle=14, II=14
        float v143 = v0[((v5 * 8) + 6)][(v142 + (v6 * 8))];	// L174, [0,2)
        float v144 = v3[((v5 * 8) + 6)];	// L175, [2,4)
        float v145 = v143 * v144;	// L176, [4,8)
        float v146 = v4[(v142 + (v6 * 8))];	// L177, [6,8)
        float v147 = v145 + v146;	// L178, [8,13)
        v4[(v142 + (v6 * 8))] = v147;	// L179, [13,14)
        float v148 = v0[(v142 + (v6 * 8))][((v5 * 8) + 6)];	// L180, [2,4)
        float v149 = v1[((v5 * 8) + 6)];	// L181, [2,4)
        float v150 = v148 * v149;	// L182, [4,8)
        float v151 = v2[(v142 + (v6 * 8))];	// L183, [6,8)
        float v152 = v150 + v151;	// L184, [8,13)
        v2[(v142 + (v6 * 8))] = v152;	// L185, [13,14)
      }
      for (int v153 = 0; v153 < 8; v153 += 1) {	// L187, [712,826), iterCycle=14, II=14
        float v154 = v0[((v5 * 8) + 7)][(v153 + (v6 * 8))];	// L188, [0,2)
        float v155 = v3[((v5 * 8) + 7)];	// L189, [2,4)
        float v156 = v154 * v155;	// L190, [4,8)
        float v157 = v4[(v153 + (v6 * 8))];	// L191, [6,8)
        float v158 = v156 + v157;	// L192, [8,13)
        v4[(v153 + (v6 * 8))] = v158;	// L193, [13,14)
        float v159 = v0[(v153 + (v6 * 8))][((v5 * 8) + 7)];	// L194, [2,4)
        float v160 = v1[((v5 * 8) + 7)];	// L195, [2,4)
        float v161 = v159 * v160;	// L196, [4,8)
        float v162 = v2[(v153 + (v6 * 8))];	// L197, [6,8)
        float v163 = v161 + v162;	// L198, [8,13)
        v2[(v153 + (v6 * 8))] = v163;	// L199, [13,14)
      }
    }
  }
}

