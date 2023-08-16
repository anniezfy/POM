
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
/// Latency=12918980662, interval=12918980662
/// DSP=80, BRAM=0
void 3mm(
  float v0,
  float v1[4096][4096],
  float v2[4096][4096],
  float v3[4096][4096],
  float v4[4096][4096],
  float v5[4096][4096],
  float v6[4096][4096],
  float v7[4096][4096]
) {	// L7, [0,12918980662)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6
  #pragma HLS interface bram port=v7

  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=2
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v2 cyclic factor=16 dim=2
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=1
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=8 dim=2
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS array_partition variable=v5 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v5 cyclic factor=16 dim=2
  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS array_partition variable=v6 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v6 cyclic factor=8 dim=2
  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS array_partition variable=v7 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v7 cyclic factor=8 dim=2
  #pragma HLS resource variable=v7 core=ram_s2p_bram

  for (int v8 = 0; v8 < 2048; v8 += 1) {	// L8, [0,524290), iterCycle=1, II=1
    for (int v9 = 0; v9 < 256; v9 += 1) {	// L9, [12918456370,12918456628), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v5[(v8 * 2)][(v9 * 16)] = v0;	// L10, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 1)] = v0;	// L11, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 2)] = v0;	// L12, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 3)] = v0;	// L13, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 4)] = v0;	// L14, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 5)] = v0;	// L15, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 6)] = v0;	// L16, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 7)] = v0;	// L17, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 8)] = v0;	// L18, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 9)] = v0;	// L19, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 10)] = v0;	// L20, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 11)] = v0;	// L21, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 12)] = v0;	// L22, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 13)] = v0;	// L23, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 14)] = v0;	// L24, [0,1)
      v5[(v8 * 2)][((v9 * 16) + 15)] = v0;	// L25, [0,1)
      v5[((v8 * 2) + 1)][(v9 * 16)] = v0;	// L26, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 1)] = v0;	// L27, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 2)] = v0;	// L28, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 3)] = v0;	// L29, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 4)] = v0;	// L30, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 5)] = v0;	// L31, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 6)] = v0;	// L32, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 7)] = v0;	// L33, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 8)] = v0;	// L34, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 9)] = v0;	// L35, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 10)] = v0;	// L36, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 11)] = v0;	// L37, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 12)] = v0;	// L38, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 13)] = v0;	// L39, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 14)] = v0;	// L40, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 16) + 15)] = v0;	// L41, [0,1)
    }
  }
  for (int v10 = 0; v10 < 2048; v10 += 1) {	// L44, [524290,4295491606), iterCycle=20, II=2
    for (int v11 = 0; v11 < 4096; v11 += 1) {	// L45, [8623489054,8625586226), iterCycle=20, II=2
      for (int v12 = 0; v12 < 256; v12 += 1) {	// L46, [8623489054,8623489586), iterCycle=20, II=2
        #pragma HLS pipeline II=1
        float v13 = v1[v11][(v10 * 2)];	// L47, [0,2)
        float v14 = v2[(v10 * 2)][(v12 * 16)];	// L48, [0,2)
        float v15 = v13 * v14;	// L49, [2,6)
        float v16 = v5[v11][(v12 * 16)];	// L50, [4,6)
        float v17 = v15 + v16;	// L51, [6,11)
        v5[v11][(v12 * 16)] = v17;	// L52, [11,12)
        float v18 = v2[(v10 * 2)][((v12 * 16) + 1)];	// L53, [0,2)
        float v19 = v13 * v18;	// L54, [2,6)
        float v20 = v5[v11][((v12 * 16) + 1)];	// L55, [4,6)
        float v21 = v19 + v20;	// L56, [6,11)
        v5[v11][((v12 * 16) + 1)] = v21;	// L57, [11,12)
        float v22 = v2[(v10 * 2)][((v12 * 16) + 2)];	// L58, [0,2)
        float v23 = v13 * v22;	// L59, [2,6)
        float v24 = v5[v11][((v12 * 16) + 2)];	// L60, [4,6)
        float v25 = v23 + v24;	// L61, [6,11)
        v5[v11][((v12 * 16) + 2)] = v25;	// L62, [11,12)
        float v26 = v2[(v10 * 2)][((v12 * 16) + 3)];	// L63, [0,2)
        float v27 = v13 * v26;	// L64, [2,6)
        float v28 = v5[v11][((v12 * 16) + 3)];	// L65, [4,6)
        float v29 = v27 + v28;	// L66, [6,11)
        v5[v11][((v12 * 16) + 3)] = v29;	// L67, [11,12)
        float v30 = v2[(v10 * 2)][((v12 * 16) + 4)];	// L68, [0,2)
        float v31 = v13 * v30;	// L69, [2,6)
        float v32 = v5[v11][((v12 * 16) + 4)];	// L70, [4,6)
        float v33 = v31 + v32;	// L71, [6,11)
        v5[v11][((v12 * 16) + 4)] = v33;	// L72, [11,12)
        float v34 = v2[(v10 * 2)][((v12 * 16) + 5)];	// L73, [0,2)
        float v35 = v13 * v34;	// L74, [2,6)
        float v36 = v5[v11][((v12 * 16) + 5)];	// L75, [4,6)
        float v37 = v35 + v36;	// L76, [6,11)
        v5[v11][((v12 * 16) + 5)] = v37;	// L77, [11,12)
        float v38 = v2[(v10 * 2)][((v12 * 16) + 6)];	// L78, [0,2)
        float v39 = v13 * v38;	// L79, [2,6)
        float v40 = v5[v11][((v12 * 16) + 6)];	// L80, [4,6)
        float v41 = v39 + v40;	// L81, [6,11)
        v5[v11][((v12 * 16) + 6)] = v41;	// L82, [11,12)
        float v42 = v2[(v10 * 2)][((v12 * 16) + 7)];	// L83, [0,2)
        float v43 = v13 * v42;	// L84, [2,6)
        float v44 = v5[v11][((v12 * 16) + 7)];	// L85, [4,6)
        float v45 = v43 + v44;	// L86, [6,11)
        v5[v11][((v12 * 16) + 7)] = v45;	// L87, [11,12)
        float v46 = v2[(v10 * 2)][((v12 * 16) + 8)];	// L88, [0,2)
        float v47 = v13 * v46;	// L89, [2,6)
        float v48 = v5[v11][((v12 * 16) + 8)];	// L90, [4,6)
        float v49 = v47 + v48;	// L91, [6,11)
        v5[v11][((v12 * 16) + 8)] = v49;	// L92, [11,12)
        float v50 = v2[(v10 * 2)][((v12 * 16) + 9)];	// L93, [0,2)
        float v51 = v13 * v50;	// L94, [2,6)
        float v52 = v5[v11][((v12 * 16) + 9)];	// L95, [4,6)
        float v53 = v51 + v52;	// L96, [6,11)
        v5[v11][((v12 * 16) + 9)] = v53;	// L97, [11,12)
        float v54 = v2[(v10 * 2)][((v12 * 16) + 10)];	// L98, [0,2)
        float v55 = v13 * v54;	// L99, [2,6)
        float v56 = v5[v11][((v12 * 16) + 10)];	// L100, [4,6)
        float v57 = v55 + v56;	// L101, [6,11)
        v5[v11][((v12 * 16) + 10)] = v57;	// L102, [11,12)
        float v58 = v2[(v10 * 2)][((v12 * 16) + 11)];	// L103, [0,2)
        float v59 = v13 * v58;	// L104, [2,6)
        float v60 = v5[v11][((v12 * 16) + 11)];	// L105, [4,6)
        float v61 = v59 + v60;	// L106, [6,11)
        v5[v11][((v12 * 16) + 11)] = v61;	// L107, [11,12)
        float v62 = v2[(v10 * 2)][((v12 * 16) + 12)];	// L108, [0,2)
        float v63 = v13 * v62;	// L109, [2,6)
        float v64 = v5[v11][((v12 * 16) + 12)];	// L110, [4,6)
        float v65 = v63 + v64;	// L111, [6,11)
        v5[v11][((v12 * 16) + 12)] = v65;	// L112, [11,12)
        float v66 = v2[(v10 * 2)][((v12 * 16) + 13)];	// L113, [0,2)
        float v67 = v13 * v66;	// L114, [2,6)
        float v68 = v5[v11][((v12 * 16) + 13)];	// L115, [4,6)
        float v69 = v67 + v68;	// L116, [6,11)
        v5[v11][((v12 * 16) + 13)] = v69;	// L117, [11,12)
        float v70 = v2[(v10 * 2)][((v12 * 16) + 14)];	// L118, [0,2)
        float v71 = v13 * v70;	// L119, [2,6)
        float v72 = v5[v11][((v12 * 16) + 14)];	// L120, [4,6)
        float v73 = v71 + v72;	// L121, [6,11)
        v5[v11][((v12 * 16) + 14)] = v73;	// L122, [11,12)
        float v74 = v2[(v10 * 2)][((v12 * 16) + 15)];	// L123, [0,2)
        float v75 = v13 * v74;	// L124, [2,6)
        float v76 = v5[v11][((v12 * 16) + 15)];	// L125, [4,6)
        float v77 = v75 + v76;	// L126, [6,11)
        v5[v11][((v12 * 16) + 15)] = v77;	// L127, [11,12)
        float v78 = v1[v11][((v10 * 2) + 1)];	// L128, [8,10)
        float v79 = v2[((v10 * 2) + 1)][(v12 * 16)];	// L129, [8,10)
        float v80 = v78 * v79;	// L130, [10,14)
        float v81 = v5[v11][(v12 * 16)];	// L131, [12,14)
        float v82 = v80 + v81;	// L132, [14,19)
        v5[v11][(v12 * 16)] = v82;	// L133, [19,20)
        float v83 = v2[((v10 * 2) + 1)][((v12 * 16) + 1)];	// L134, [8,10)
        float v84 = v78 * v83;	// L135, [10,14)
        float v85 = v5[v11][((v12 * 16) + 1)];	// L136, [12,14)
        float v86 = v84 + v85;	// L137, [14,19)
        v5[v11][((v12 * 16) + 1)] = v86;	// L138, [19,20)
        float v87 = v2[((v10 * 2) + 1)][((v12 * 16) + 2)];	// L139, [8,10)
        float v88 = v78 * v87;	// L140, [10,14)
        float v89 = v5[v11][((v12 * 16) + 2)];	// L141, [12,14)
        float v90 = v88 + v89;	// L142, [14,19)
        v5[v11][((v12 * 16) + 2)] = v90;	// L143, [19,20)
        float v91 = v2[((v10 * 2) + 1)][((v12 * 16) + 3)];	// L144, [8,10)
        float v92 = v78 * v91;	// L145, [10,14)
        float v93 = v5[v11][((v12 * 16) + 3)];	// L146, [12,14)
        float v94 = v92 + v93;	// L147, [14,19)
        v5[v11][((v12 * 16) + 3)] = v94;	// L148, [19,20)
        float v95 = v2[((v10 * 2) + 1)][((v12 * 16) + 4)];	// L149, [8,10)
        float v96 = v78 * v95;	// L150, [10,14)
        float v97 = v5[v11][((v12 * 16) + 4)];	// L151, [12,14)
        float v98 = v96 + v97;	// L152, [14,19)
        v5[v11][((v12 * 16) + 4)] = v98;	// L153, [19,20)
        float v99 = v2[((v10 * 2) + 1)][((v12 * 16) + 5)];	// L154, [8,10)
        float v100 = v78 * v99;	// L155, [10,14)
        float v101 = v5[v11][((v12 * 16) + 5)];	// L156, [12,14)
        float v102 = v100 + v101;	// L157, [14,19)
        v5[v11][((v12 * 16) + 5)] = v102;	// L158, [19,20)
        float v103 = v2[((v10 * 2) + 1)][((v12 * 16) + 6)];	// L159, [8,10)
        float v104 = v78 * v103;	// L160, [10,14)
        float v105 = v5[v11][((v12 * 16) + 6)];	// L161, [12,14)
        float v106 = v104 + v105;	// L162, [14,19)
        v5[v11][((v12 * 16) + 6)] = v106;	// L163, [19,20)
        float v107 = v2[((v10 * 2) + 1)][((v12 * 16) + 7)];	// L164, [8,10)
        float v108 = v78 * v107;	// L165, [10,14)
        float v109 = v5[v11][((v12 * 16) + 7)];	// L166, [12,14)
        float v110 = v108 + v109;	// L167, [14,19)
        v5[v11][((v12 * 16) + 7)] = v110;	// L168, [19,20)
        float v111 = v2[((v10 * 2) + 1)][((v12 * 16) + 8)];	// L169, [8,10)
        float v112 = v78 * v111;	// L170, [10,14)
        float v113 = v5[v11][((v12 * 16) + 8)];	// L171, [12,14)
        float v114 = v112 + v113;	// L172, [14,19)
        v5[v11][((v12 * 16) + 8)] = v114;	// L173, [19,20)
        float v115 = v2[((v10 * 2) + 1)][((v12 * 16) + 9)];	// L174, [8,10)
        float v116 = v78 * v115;	// L175, [10,14)
        float v117 = v5[v11][((v12 * 16) + 9)];	// L176, [12,14)
        float v118 = v116 + v117;	// L177, [14,19)
        v5[v11][((v12 * 16) + 9)] = v118;	// L178, [19,20)
        float v119 = v2[((v10 * 2) + 1)][((v12 * 16) + 10)];	// L179, [8,10)
        float v120 = v78 * v119;	// L180, [10,14)
        float v121 = v5[v11][((v12 * 16) + 10)];	// L181, [12,14)
        float v122 = v120 + v121;	// L182, [14,19)
        v5[v11][((v12 * 16) + 10)] = v122;	// L183, [19,20)
        float v123 = v2[((v10 * 2) + 1)][((v12 * 16) + 11)];	// L184, [8,10)
        float v124 = v78 * v123;	// L185, [10,14)
        float v125 = v5[v11][((v12 * 16) + 11)];	// L186, [12,14)
        float v126 = v124 + v125;	// L187, [14,19)
        v5[v11][((v12 * 16) + 11)] = v126;	// L188, [19,20)
        float v127 = v2[((v10 * 2) + 1)][((v12 * 16) + 12)];	// L189, [8,10)
        float v128 = v78 * v127;	// L190, [10,14)
        float v129 = v5[v11][((v12 * 16) + 12)];	// L191, [12,14)
        float v130 = v128 + v129;	// L192, [14,19)
        v5[v11][((v12 * 16) + 12)] = v130;	// L193, [19,20)
        float v131 = v2[((v10 * 2) + 1)][((v12 * 16) + 13)];	// L194, [8,10)
        float v132 = v78 * v131;	// L195, [10,14)
        float v133 = v5[v11][((v12 * 16) + 13)];	// L196, [12,14)
        float v134 = v132 + v133;	// L197, [14,19)
        v5[v11][((v12 * 16) + 13)] = v134;	// L198, [19,20)
        float v135 = v2[((v10 * 2) + 1)][((v12 * 16) + 14)];	// L199, [8,10)
        float v136 = v78 * v135;	// L200, [10,14)
        float v137 = v5[v11][((v12 * 16) + 14)];	// L201, [12,14)
        float v138 = v136 + v137;	// L202, [14,19)
        v5[v11][((v12 * 16) + 14)] = v138;	// L203, [19,20)
        float v139 = v2[((v10 * 2) + 1)][((v12 * 16) + 15)];	// L204, [8,10)
        float v140 = v78 * v139;	// L205, [10,14)
        float v141 = v5[v11][((v12 * 16) + 15)];	// L206, [12,14)
        float v142 = v140 + v141;	// L207, [14,19)
        v5[v11][((v12 * 16) + 15)] = v142;	// L208, [19,20)
      }
    }
  }
  for (int v143 = 0; v143 < 4096; v143 += 1) {	// L212, [4295491606,4312268824), iterCycle=1, II=1
    for (int v144 = 0; v144 < 4096; v144 += 1) {	// L213, [8606711836,8606715934), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v6[v143][v144] = v0;	// L214, [0,1)
    }
  }
  for (int v145 = 0; v145 < 4096; v145 += 1) {	// L217, [4312268824,8607236133), iterCycle=12, II=1
    for (int v146 = 0; v146 < 2048; v146 += 1) {	// L218, [4311744527,4312793116), iterCycle=12, II=1
      for (int v147 = 0; v147 < 512; v147 += 1) {	// L219, [4311744527,4311745052), iterCycle=12, II=1
        #pragma HLS pipeline II=1
        float v148 = v3[(v146 * 2)][v145];	// L220, [0,2)
        float v149 = v4[v145][(v147 * 8)];	// L221, [0,2)
        float v150 = v148 * v149;	// L222, [2,6)
        float v151 = v6[(v146 * 2)][(v147 * 8)];	// L223, [4,6)
        float v152 = v150 + v151;	// L224, [6,11)
        v6[(v146 * 2)][(v147 * 8)] = v152;	// L225, [11,12)
        float v153 = v4[v145][((v147 * 8) + 1)];	// L226, [0,2)
        float v154 = v148 * v153;	// L227, [2,6)
        float v155 = v6[(v146 * 2)][((v147 * 8) + 1)];	// L228, [4,6)
        float v156 = v154 + v155;	// L229, [6,11)
        v6[(v146 * 2)][((v147 * 8) + 1)] = v156;	// L230, [11,12)
        float v157 = v4[v145][((v147 * 8) + 2)];	// L231, [0,2)
        float v158 = v148 * v157;	// L232, [2,6)
        float v159 = v6[(v146 * 2)][((v147 * 8) + 2)];	// L233, [4,6)
        float v160 = v158 + v159;	// L234, [6,11)
        v6[(v146 * 2)][((v147 * 8) + 2)] = v160;	// L235, [11,12)
        float v161 = v4[v145][((v147 * 8) + 3)];	// L236, [0,2)
        float v162 = v148 * v161;	// L237, [2,6)
        float v163 = v6[(v146 * 2)][((v147 * 8) + 3)];	// L238, [4,6)
        float v164 = v162 + v163;	// L239, [6,11)
        v6[(v146 * 2)][((v147 * 8) + 3)] = v164;	// L240, [11,12)
        float v165 = v4[v145][((v147 * 8) + 4)];	// L241, [0,2)
        float v166 = v148 * v165;	// L242, [2,6)
        float v167 = v6[(v146 * 2)][((v147 * 8) + 4)];	// L243, [4,6)
        float v168 = v166 + v167;	// L244, [6,11)
        v6[(v146 * 2)][((v147 * 8) + 4)] = v168;	// L245, [11,12)
        float v169 = v4[v145][((v147 * 8) + 5)];	// L246, [0,2)
        float v170 = v148 * v169;	// L247, [2,6)
        float v171 = v6[(v146 * 2)][((v147 * 8) + 5)];	// L248, [4,6)
        float v172 = v170 + v171;	// L249, [6,11)
        v6[(v146 * 2)][((v147 * 8) + 5)] = v172;	// L250, [11,12)
        float v173 = v4[v145][((v147 * 8) + 6)];	// L251, [0,2)
        float v174 = v148 * v173;	// L252, [2,6)
        float v175 = v6[(v146 * 2)][((v147 * 8) + 6)];	// L253, [4,6)
        float v176 = v174 + v175;	// L254, [6,11)
        v6[(v146 * 2)][((v147 * 8) + 6)] = v176;	// L255, [11,12)
        float v177 = v4[v145][((v147 * 8) + 7)];	// L256, [0,2)
        float v178 = v148 * v177;	// L257, [2,6)
        float v179 = v6[(v146 * 2)][((v147 * 8) + 7)];	// L258, [4,6)
        float v180 = v178 + v179;	// L259, [6,11)
        v6[(v146 * 2)][((v147 * 8) + 7)] = v180;	// L260, [11,12)
        float v181 = v3[((v146 * 2) + 1)][v145];	// L261, [0,2)
        float v182 = v181 * v149;	// L262, [2,6)
        float v183 = v6[((v146 * 2) + 1)][(v147 * 8)];	// L263, [4,6)
        float v184 = v182 + v183;	// L264, [6,11)
        v6[((v146 * 2) + 1)][(v147 * 8)] = v184;	// L265, [11,12)
        float v185 = v181 * v153;	// L266, [2,6)
        float v186 = v6[((v146 * 2) + 1)][((v147 * 8) + 1)];	// L267, [4,6)
        float v187 = v185 + v186;	// L268, [6,11)
        v6[((v146 * 2) + 1)][((v147 * 8) + 1)] = v187;	// L269, [11,12)
        float v188 = v181 * v157;	// L270, [2,6)
        float v189 = v6[((v146 * 2) + 1)][((v147 * 8) + 2)];	// L271, [4,6)
        float v190 = v188 + v189;	// L272, [6,11)
        v6[((v146 * 2) + 1)][((v147 * 8) + 2)] = v190;	// L273, [11,12)
        float v191 = v181 * v161;	// L274, [2,6)
        float v192 = v6[((v146 * 2) + 1)][((v147 * 8) + 3)];	// L275, [4,6)
        float v193 = v191 + v192;	// L276, [6,11)
        v6[((v146 * 2) + 1)][((v147 * 8) + 3)] = v193;	// L277, [11,12)
        float v194 = v181 * v165;	// L278, [2,6)
        float v195 = v6[((v146 * 2) + 1)][((v147 * 8) + 4)];	// L279, [4,6)
        float v196 = v194 + v195;	// L280, [6,11)
        v6[((v146 * 2) + 1)][((v147 * 8) + 4)] = v196;	// L281, [11,12)
        float v197 = v181 * v169;	// L282, [2,6)
        float v198 = v6[((v146 * 2) + 1)][((v147 * 8) + 5)];	// L283, [4,6)
        float v199 = v197 + v198;	// L284, [6,11)
        v6[((v146 * 2) + 1)][((v147 * 8) + 5)] = v199;	// L285, [11,12)
        float v200 = v181 * v173;	// L286, [2,6)
        float v201 = v6[((v146 * 2) + 1)][((v147 * 8) + 6)];	// L287, [4,6)
        float v202 = v200 + v201;	// L288, [6,11)
        v6[((v146 * 2) + 1)][((v147 * 8) + 6)] = v202;	// L289, [11,12)
        float v203 = v181 * v177;	// L290, [2,6)
        float v204 = v6[((v146 * 2) + 1)][((v147 * 8) + 7)];	// L291, [4,6)
        float v205 = v203 + v204;	// L292, [6,11)
        v6[((v146 * 2) + 1)][((v147 * 8) + 7)] = v205;	// L293, [11,12)
      }
    }
  }
  for (int v206 = 0; v206 < 4096; v206 += 1) {	// L297, [8607236133,8624013351), iterCycle=1, II=1
    for (int v207 = 0; v207 < 4096; v207 += 1) {	// L298, [4294967309,4294971407), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v7[v206][v207] = v0;	// L299, [0,1)
    }
  }
  for (int v208 = 0; v208 < 4096; v208 += 1) {	// L302, [8624013351,12918980660), iterCycle=12, II=1
    for (int v209 = 0; v209 < 2048; v209 += 1) {	// L303, [0,1048589), iterCycle=12, II=1
      for (int v210 = 0; v210 < 512; v210 += 1) {	// L304, [0,525), iterCycle=12, II=1
        #pragma HLS pipeline II=1
        float v211 = v5[(v209 * 2)][v208];	// L305, [0,2)
        float v212 = v6[v208][(v210 * 8)];	// L306, [0,2)
        float v213 = v211 * v212;	// L307, [2,6)
        float v214 = v7[(v209 * 2)][(v210 * 8)];	// L308, [4,6)
        float v215 = v213 + v214;	// L309, [6,11)
        v7[(v209 * 2)][(v210 * 8)] = v215;	// L310, [11,12)
        float v216 = v6[v208][((v210 * 8) + 1)];	// L311, [0,2)
        float v217 = v211 * v216;	// L312, [2,6)
        float v218 = v7[(v209 * 2)][((v210 * 8) + 1)];	// L313, [4,6)
        float v219 = v217 + v218;	// L314, [6,11)
        v7[(v209 * 2)][((v210 * 8) + 1)] = v219;	// L315, [11,12)
        float v220 = v6[v208][((v210 * 8) + 2)];	// L316, [0,2)
        float v221 = v211 * v220;	// L317, [2,6)
        float v222 = v7[(v209 * 2)][((v210 * 8) + 2)];	// L318, [4,6)
        float v223 = v221 + v222;	// L319, [6,11)
        v7[(v209 * 2)][((v210 * 8) + 2)] = v223;	// L320, [11,12)
        float v224 = v6[v208][((v210 * 8) + 3)];	// L321, [0,2)
        float v225 = v211 * v224;	// L322, [2,6)
        float v226 = v7[(v209 * 2)][((v210 * 8) + 3)];	// L323, [4,6)
        float v227 = v225 + v226;	// L324, [6,11)
        v7[(v209 * 2)][((v210 * 8) + 3)] = v227;	// L325, [11,12)
        float v228 = v6[v208][((v210 * 8) + 4)];	// L326, [0,2)
        float v229 = v211 * v228;	// L327, [2,6)
        float v230 = v7[(v209 * 2)][((v210 * 8) + 4)];	// L328, [4,6)
        float v231 = v229 + v230;	// L329, [6,11)
        v7[(v209 * 2)][((v210 * 8) + 4)] = v231;	// L330, [11,12)
        float v232 = v6[v208][((v210 * 8) + 5)];	// L331, [0,2)
        float v233 = v211 * v232;	// L332, [2,6)
        float v234 = v7[(v209 * 2)][((v210 * 8) + 5)];	// L333, [4,6)
        float v235 = v233 + v234;	// L334, [6,11)
        v7[(v209 * 2)][((v210 * 8) + 5)] = v235;	// L335, [11,12)
        float v236 = v6[v208][((v210 * 8) + 6)];	// L336, [0,2)
        float v237 = v211 * v236;	// L337, [2,6)
        float v238 = v7[(v209 * 2)][((v210 * 8) + 6)];	// L338, [4,6)
        float v239 = v237 + v238;	// L339, [6,11)
        v7[(v209 * 2)][((v210 * 8) + 6)] = v239;	// L340, [11,12)
        float v240 = v6[v208][((v210 * 8) + 7)];	// L341, [0,2)
        float v241 = v211 * v240;	// L342, [2,6)
        float v242 = v7[(v209 * 2)][((v210 * 8) + 7)];	// L343, [4,6)
        float v243 = v241 + v242;	// L344, [6,11)
        v7[(v209 * 2)][((v210 * 8) + 7)] = v243;	// L345, [11,12)
        float v244 = v5[((v209 * 2) + 1)][v208];	// L346, [0,2)
        float v245 = v244 * v212;	// L347, [2,6)
        float v246 = v7[((v209 * 2) + 1)][(v210 * 8)];	// L348, [4,6)
        float v247 = v245 + v246;	// L349, [6,11)
        v7[((v209 * 2) + 1)][(v210 * 8)] = v247;	// L350, [11,12)
        float v248 = v244 * v216;	// L351, [2,6)
        float v249 = v7[((v209 * 2) + 1)][((v210 * 8) + 1)];	// L352, [4,6)
        float v250 = v248 + v249;	// L353, [6,11)
        v7[((v209 * 2) + 1)][((v210 * 8) + 1)] = v250;	// L354, [11,12)
        float v251 = v244 * v220;	// L355, [2,6)
        float v252 = v7[((v209 * 2) + 1)][((v210 * 8) + 2)];	// L356, [4,6)
        float v253 = v251 + v252;	// L357, [6,11)
        v7[((v209 * 2) + 1)][((v210 * 8) + 2)] = v253;	// L358, [11,12)
        float v254 = v244 * v224;	// L359, [2,6)
        float v255 = v7[((v209 * 2) + 1)][((v210 * 8) + 3)];	// L360, [4,6)
        float v256 = v254 + v255;	// L361, [6,11)
        v7[((v209 * 2) + 1)][((v210 * 8) + 3)] = v256;	// L362, [11,12)
        float v257 = v244 * v228;	// L363, [2,6)
        float v258 = v7[((v209 * 2) + 1)][((v210 * 8) + 4)];	// L364, [4,6)
        float v259 = v257 + v258;	// L365, [6,11)
        v7[((v209 * 2) + 1)][((v210 * 8) + 4)] = v259;	// L366, [11,12)
        float v260 = v244 * v232;	// L367, [2,6)
        float v261 = v7[((v209 * 2) + 1)][((v210 * 8) + 5)];	// L368, [4,6)
        float v262 = v260 + v261;	// L369, [6,11)
        v7[((v209 * 2) + 1)][((v210 * 8) + 5)] = v262;	// L370, [11,12)
        float v263 = v244 * v236;	// L371, [2,6)
        float v264 = v7[((v209 * 2) + 1)][((v210 * 8) + 6)];	// L372, [4,6)
        float v265 = v263 + v264;	// L373, [6,11)
        v7[((v209 * 2) + 1)][((v210 * 8) + 6)] = v265;	// L374, [11,12)
        float v266 = v244 * v240;	// L375, [2,6)
        float v267 = v7[((v209 * 2) + 1)][((v210 * 8) + 7)];	// L376, [4,6)
        float v268 = v266 + v267;	// L377, [6,11)
        v7[((v209 * 2) + 1)][((v210 * 8) + 7)] = v268;	// L378, [11,12)
      }
    }
  }
}
