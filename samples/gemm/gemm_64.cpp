
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
/// Latency=8347, interval=8347
/// DSP=166, BRAM=0
void gemm_64(
  float v0,
  float v1,
  float v2[64][64],
  float v3[64][64],
  float v4[64][64]
) {	// L5, [0,8347)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=16 dim=2
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v4 cyclic factor=16 dim=2
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 32; v5 += 1) {	// L6, [0,136), iterCycle=7, II=1
    for (int v6 = 0; v6 < 4; v6 += 1) {	// L7, [8209,8221), iterCycle=7, II=1
      #pragma HLS pipeline II=1
      float v7 = v4[(v5 * 2)][(v6 * 16)];	// L8, [0,2)
      float v8 = v7 * v1;	// L9, [2,6)
      v4[(v5 * 2)][(v6 * 16)] = v8;	// L10, [6,7)
      float v9 = v4[(v5 * 2)][((v6 * 16) + 1)];	// L11, [0,2)
      float v10 = v9 * v1;	// L12, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 1)] = v10;	// L13, [6,7)
      float v11 = v4[(v5 * 2)][((v6 * 16) + 2)];	// L14, [0,2)
      float v12 = v11 * v1;	// L15, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 2)] = v12;	// L16, [6,7)
      float v13 = v4[(v5 * 2)][((v6 * 16) + 3)];	// L17, [0,2)
      float v14 = v13 * v1;	// L18, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 3)] = v14;	// L19, [6,7)
      float v15 = v4[(v5 * 2)][((v6 * 16) + 4)];	// L20, [0,2)
      float v16 = v15 * v1;	// L21, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 4)] = v16;	// L22, [6,7)
      float v17 = v4[(v5 * 2)][((v6 * 16) + 5)];	// L23, [0,2)
      float v18 = v17 * v1;	// L24, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 5)] = v18;	// L25, [6,7)
      float v19 = v4[(v5 * 2)][((v6 * 16) + 6)];	// L26, [0,2)
      float v20 = v19 * v1;	// L27, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 6)] = v20;	// L28, [6,7)
      float v21 = v4[(v5 * 2)][((v6 * 16) + 7)];	// L29, [0,2)
      float v22 = v21 * v1;	// L30, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 7)] = v22;	// L31, [6,7)
      float v23 = v4[(v5 * 2)][((v6 * 16) + 8)];	// L32, [0,2)
      float v24 = v23 * v1;	// L33, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 8)] = v24;	// L34, [6,7)
      float v25 = v4[(v5 * 2)][((v6 * 16) + 9)];	// L35, [0,2)
      float v26 = v25 * v1;	// L36, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 9)] = v26;	// L37, [6,7)
      float v27 = v4[(v5 * 2)][((v6 * 16) + 10)];	// L38, [0,2)
      float v28 = v27 * v1;	// L39, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 10)] = v28;	// L40, [6,7)
      float v29 = v4[(v5 * 2)][((v6 * 16) + 11)];	// L41, [0,2)
      float v30 = v29 * v1;	// L42, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 11)] = v30;	// L43, [6,7)
      float v31 = v4[(v5 * 2)][((v6 * 16) + 12)];	// L44, [0,2)
      float v32 = v31 * v1;	// L45, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 12)] = v32;	// L46, [6,7)
      float v33 = v4[(v5 * 2)][((v6 * 16) + 13)];	// L47, [0,2)
      float v34 = v33 * v1;	// L48, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 13)] = v34;	// L49, [6,7)
      float v35 = v4[(v5 * 2)][((v6 * 16) + 14)];	// L50, [0,2)
      float v36 = v35 * v1;	// L51, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 14)] = v36;	// L52, [6,7)
      float v37 = v4[(v5 * 2)][((v6 * 16) + 15)];	// L53, [0,2)
      float v38 = v37 * v1;	// L54, [2,6)
      v4[(v5 * 2)][((v6 * 16) + 15)] = v38;	// L55, [6,7)
      float v39 = v4[((v5 * 2) + 1)][(v6 * 16)];	// L56, [0,2)
      float v40 = v39 * v1;	// L57, [2,6)
      v4[((v5 * 2) + 1)][(v6 * 16)] = v40;	// L58, [6,7)
      float v41 = v4[((v5 * 2) + 1)][((v6 * 16) + 1)];	// L59, [0,2)
      float v42 = v41 * v1;	// L60, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 1)] = v42;	// L61, [6,7)
      float v43 = v4[((v5 * 2) + 1)][((v6 * 16) + 2)];	// L62, [0,2)
      float v44 = v43 * v1;	// L63, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 2)] = v44;	// L64, [6,7)
      float v45 = v4[((v5 * 2) + 1)][((v6 * 16) + 3)];	// L65, [0,2)
      float v46 = v45 * v1;	// L66, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 3)] = v46;	// L67, [6,7)
      float v47 = v4[((v5 * 2) + 1)][((v6 * 16) + 4)];	// L68, [0,2)
      float v48 = v47 * v1;	// L69, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 4)] = v48;	// L70, [6,7)
      float v49 = v4[((v5 * 2) + 1)][((v6 * 16) + 5)];	// L71, [0,2)
      float v50 = v49 * v1;	// L72, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 5)] = v50;	// L73, [6,7)
      float v51 = v4[((v5 * 2) + 1)][((v6 * 16) + 6)];	// L74, [0,2)
      float v52 = v51 * v1;	// L75, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 6)] = v52;	// L76, [6,7)
      float v53 = v4[((v5 * 2) + 1)][((v6 * 16) + 7)];	// L77, [0,2)
      float v54 = v53 * v1;	// L78, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 7)] = v54;	// L79, [6,7)
      float v55 = v4[((v5 * 2) + 1)][((v6 * 16) + 8)];	// L80, [0,2)
      float v56 = v55 * v1;	// L81, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 8)] = v56;	// L82, [6,7)
      float v57 = v4[((v5 * 2) + 1)][((v6 * 16) + 9)];	// L83, [0,2)
      float v58 = v57 * v1;	// L84, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 9)] = v58;	// L85, [6,7)
      float v59 = v4[((v5 * 2) + 1)][((v6 * 16) + 10)];	// L86, [0,2)
      float v60 = v59 * v1;	// L87, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 10)] = v60;	// L88, [6,7)
      float v61 = v4[((v5 * 2) + 1)][((v6 * 16) + 11)];	// L89, [0,2)
      float v62 = v61 * v1;	// L90, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 11)] = v62;	// L91, [6,7)
      float v63 = v4[((v5 * 2) + 1)][((v6 * 16) + 12)];	// L92, [0,2)
      float v64 = v63 * v1;	// L93, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 12)] = v64;	// L94, [6,7)
      float v65 = v4[((v5 * 2) + 1)][((v6 * 16) + 13)];	// L95, [0,2)
      float v66 = v65 * v1;	// L96, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 13)] = v66;	// L97, [6,7)
      float v67 = v4[((v5 * 2) + 1)][((v6 * 16) + 14)];	// L98, [0,2)
      float v68 = v67 * v1;	// L99, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 14)] = v68;	// L100, [6,7)
      float v69 = v4[((v5 * 2) + 1)][((v6 * 16) + 15)];	// L101, [0,2)
      float v70 = v69 * v1;	// L102, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 16) + 15)] = v70;	// L103, [6,7)
    }
  }
  for (int v71 = 0; v71 < 64; v71 += 1) {	// L106, [136,8345), iterCycle=16, II=1
    for (int v72 = 0; v72 < 32; v72 += 1) {	// L107, [0,145), iterCycle=16, II=1
      for (int v73 = 0; v73 < 4; v73 += 1) {	// L108, [0,21), iterCycle=16, II=1
        #pragma HLS pipeline II=1
        float v74 = v2[(v72 * 2)][v71];	// L109, [0,2)
        float v75 = v0 * v74;	// L110, [2,6)
        float v76 = v3[v71][(v73 * 16)];	// L111, [4,6)
        float v77 = v76 * v75;	// L112, [6,10)
        float v78 = v4[(v72 * 2)][(v73 * 16)];	// L113, [8,10)
        float v79 = v77 + v78;	// L114, [10,15)
        v4[(v72 * 2)][(v73 * 16)] = v79;	// L115, [15,16)
        float v80 = v3[v71][((v73 * 16) + 1)];	// L116, [4,6)
        float v81 = v80 * v75;	// L117, [6,10)
        float v82 = v4[(v72 * 2)][((v73 * 16) + 1)];	// L118, [8,10)
        float v83 = v81 + v82;	// L119, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 1)] = v83;	// L120, [15,16)
        float v84 = v3[v71][((v73 * 16) + 2)];	// L121, [4,6)
        float v85 = v84 * v75;	// L122, [6,10)
        float v86 = v4[(v72 * 2)][((v73 * 16) + 2)];	// L123, [8,10)
        float v87 = v85 + v86;	// L124, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 2)] = v87;	// L125, [15,16)
        float v88 = v3[v71][((v73 * 16) + 3)];	// L126, [4,6)
        float v89 = v88 * v75;	// L127, [6,10)
        float v90 = v4[(v72 * 2)][((v73 * 16) + 3)];	// L128, [8,10)
        float v91 = v89 + v90;	// L129, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 3)] = v91;	// L130, [15,16)
        float v92 = v3[v71][((v73 * 16) + 4)];	// L131, [4,6)
        float v93 = v92 * v75;	// L132, [6,10)
        float v94 = v4[(v72 * 2)][((v73 * 16) + 4)];	// L133, [8,10)
        float v95 = v93 + v94;	// L134, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 4)] = v95;	// L135, [15,16)
        float v96 = v3[v71][((v73 * 16) + 5)];	// L136, [4,6)
        float v97 = v96 * v75;	// L137, [6,10)
        float v98 = v4[(v72 * 2)][((v73 * 16) + 5)];	// L138, [8,10)
        float v99 = v97 + v98;	// L139, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 5)] = v99;	// L140, [15,16)
        float v100 = v3[v71][((v73 * 16) + 6)];	// L141, [4,6)
        float v101 = v100 * v75;	// L142, [6,10)
        float v102 = v4[(v72 * 2)][((v73 * 16) + 6)];	// L143, [8,10)
        float v103 = v101 + v102;	// L144, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 6)] = v103;	// L145, [15,16)
        float v104 = v3[v71][((v73 * 16) + 7)];	// L146, [4,6)
        float v105 = v104 * v75;	// L147, [6,10)
        float v106 = v4[(v72 * 2)][((v73 * 16) + 7)];	// L148, [8,10)
        float v107 = v105 + v106;	// L149, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 7)] = v107;	// L150, [15,16)
        float v108 = v3[v71][((v73 * 16) + 8)];	// L151, [4,6)
        float v109 = v108 * v75;	// L152, [6,10)
        float v110 = v4[(v72 * 2)][((v73 * 16) + 8)];	// L153, [8,10)
        float v111 = v109 + v110;	// L154, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 8)] = v111;	// L155, [15,16)
        float v112 = v3[v71][((v73 * 16) + 9)];	// L156, [4,6)
        float v113 = v112 * v75;	// L157, [6,10)
        float v114 = v4[(v72 * 2)][((v73 * 16) + 9)];	// L158, [8,10)
        float v115 = v113 + v114;	// L159, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 9)] = v115;	// L160, [15,16)
        float v116 = v3[v71][((v73 * 16) + 10)];	// L161, [4,6)
        float v117 = v116 * v75;	// L162, [6,10)
        float v118 = v4[(v72 * 2)][((v73 * 16) + 10)];	// L163, [8,10)
        float v119 = v117 + v118;	// L164, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 10)] = v119;	// L165, [15,16)
        float v120 = v3[v71][((v73 * 16) + 11)];	// L166, [4,6)
        float v121 = v120 * v75;	// L167, [6,10)
        float v122 = v4[(v72 * 2)][((v73 * 16) + 11)];	// L168, [8,10)
        float v123 = v121 + v122;	// L169, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 11)] = v123;	// L170, [15,16)
        float v124 = v3[v71][((v73 * 16) + 12)];	// L171, [4,6)
        float v125 = v124 * v75;	// L172, [6,10)
        float v126 = v4[(v72 * 2)][((v73 * 16) + 12)];	// L173, [8,10)
        float v127 = v125 + v126;	// L174, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 12)] = v127;	// L175, [15,16)
        float v128 = v3[v71][((v73 * 16) + 13)];	// L176, [4,6)
        float v129 = v128 * v75;	// L177, [6,10)
        float v130 = v4[(v72 * 2)][((v73 * 16) + 13)];	// L178, [8,10)
        float v131 = v129 + v130;	// L179, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 13)] = v131;	// L180, [15,16)
        float v132 = v3[v71][((v73 * 16) + 14)];	// L181, [4,6)
        float v133 = v132 * v75;	// L182, [6,10)
        float v134 = v4[(v72 * 2)][((v73 * 16) + 14)];	// L183, [8,10)
        float v135 = v133 + v134;	// L184, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 14)] = v135;	// L185, [15,16)
        float v136 = v3[v71][((v73 * 16) + 15)];	// L186, [4,6)
        float v137 = v136 * v75;	// L187, [6,10)
        float v138 = v4[(v72 * 2)][((v73 * 16) + 15)];	// L188, [8,10)
        float v139 = v137 + v138;	// L189, [10,15)
        v4[(v72 * 2)][((v73 * 16) + 15)] = v139;	// L190, [15,16)
        float v140 = v2[((v72 * 2) + 1)][v71];	// L191, [0,2)
        float v141 = v0 * v140;	// L192, [2,6)
        float v142 = v76 * v141;	// L193, [6,10)
        float v143 = v4[((v72 * 2) + 1)][(v73 * 16)];	// L194, [8,10)
        float v144 = v142 + v143;	// L195, [10,15)
        v4[((v72 * 2) + 1)][(v73 * 16)] = v144;	// L196, [15,16)
        float v145 = v80 * v141;	// L197, [6,10)
        float v146 = v4[((v72 * 2) + 1)][((v73 * 16) + 1)];	// L198, [8,10)
        float v147 = v145 + v146;	// L199, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 1)] = v147;	// L200, [15,16)
        float v148 = v84 * v141;	// L201, [6,10)
        float v149 = v4[((v72 * 2) + 1)][((v73 * 16) + 2)];	// L202, [8,10)
        float v150 = v148 + v149;	// L203, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 2)] = v150;	// L204, [15,16)
        float v151 = v88 * v141;	// L205, [6,10)
        float v152 = v4[((v72 * 2) + 1)][((v73 * 16) + 3)];	// L206, [8,10)
        float v153 = v151 + v152;	// L207, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 3)] = v153;	// L208, [15,16)
        float v154 = v92 * v141;	// L209, [6,10)
        float v155 = v4[((v72 * 2) + 1)][((v73 * 16) + 4)];	// L210, [8,10)
        float v156 = v154 + v155;	// L211, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 4)] = v156;	// L212, [15,16)
        float v157 = v96 * v141;	// L213, [6,10)
        float v158 = v4[((v72 * 2) + 1)][((v73 * 16) + 5)];	// L214, [8,10)
        float v159 = v157 + v158;	// L215, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 5)] = v159;	// L216, [15,16)
        float v160 = v100 * v141;	// L217, [6,10)
        float v161 = v4[((v72 * 2) + 1)][((v73 * 16) + 6)];	// L218, [8,10)
        float v162 = v160 + v161;	// L219, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 6)] = v162;	// L220, [15,16)
        float v163 = v104 * v141;	// L221, [6,10)
        float v164 = v4[((v72 * 2) + 1)][((v73 * 16) + 7)];	// L222, [8,10)
        float v165 = v163 + v164;	// L223, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 7)] = v165;	// L224, [15,16)
        float v166 = v108 * v141;	// L225, [6,10)
        float v167 = v4[((v72 * 2) + 1)][((v73 * 16) + 8)];	// L226, [8,10)
        float v168 = v166 + v167;	// L227, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 8)] = v168;	// L228, [15,16)
        float v169 = v112 * v141;	// L229, [6,10)
        float v170 = v4[((v72 * 2) + 1)][((v73 * 16) + 9)];	// L230, [8,10)
        float v171 = v169 + v170;	// L231, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 9)] = v171;	// L232, [15,16)
        float v172 = v116 * v141;	// L233, [6,10)
        float v173 = v4[((v72 * 2) + 1)][((v73 * 16) + 10)];	// L234, [8,10)
        float v174 = v172 + v173;	// L235, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 10)] = v174;	// L236, [15,16)
        float v175 = v120 * v141;	// L237, [6,10)
        float v176 = v4[((v72 * 2) + 1)][((v73 * 16) + 11)];	// L238, [8,10)
        float v177 = v175 + v176;	// L239, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 11)] = v177;	// L240, [15,16)
        float v178 = v124 * v141;	// L241, [6,10)
        float v179 = v4[((v72 * 2) + 1)][((v73 * 16) + 12)];	// L242, [8,10)
        float v180 = v178 + v179;	// L243, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 12)] = v180;	// L244, [15,16)
        float v181 = v128 * v141;	// L245, [6,10)
        float v182 = v4[((v72 * 2) + 1)][((v73 * 16) + 13)];	// L246, [8,10)
        float v183 = v181 + v182;	// L247, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 13)] = v183;	// L248, [15,16)
        float v184 = v132 * v141;	// L249, [6,10)
        float v185 = v4[((v72 * 2) + 1)][((v73 * 16) + 14)];	// L250, [8,10)
        float v186 = v184 + v185;	// L251, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 14)] = v186;	// L252, [15,16)
        float v187 = v136 * v141;	// L253, [6,10)
        float v188 = v4[((v72 * 2) + 1)][((v73 * 16) + 15)];	// L254, [8,10)
        float v189 = v187 + v188;	// L255, [10,15)
        v4[((v72 * 2) + 1)][((v73 * 16) + 15)] = v189;	// L256, [15,16)
      }
    }
  }
}

