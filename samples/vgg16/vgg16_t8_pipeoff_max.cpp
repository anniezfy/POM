
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
/// Latency=41511411, interval=41511411
/// DSP=40, BRAM=0
void vgg16(
  float v0,
  float v1[64][3][3][3],
  float v2[64][64][3][3],
  float v3[128][64][3][3],
  float v4[128][128][3][3],
  float v5[256][128][3][3],
  float v6[256][256][3][3],
  float v7[512][256][3][3],
  float v8[512][512][3][3],
  float v9[512][512][3][3],
  float v10[64][32][32],
  float v11[256][4][4],
  float v12[512][4][4],
  float v13[512][8][8],
  float v14[512][8][8],
  float v15[512][2][2],
  float v16[512][2][2],
  float v17[512][2][2],
  float v18[512][2][2],
  float v19[512],
  float v20[64][32][32],
  float v21[64][16][16],
  float v22[128][16][16],
  float v23[128][16][16],
  float v24[128][8][8],
  float v25[256][8][8],
  float v26[256][8][8],
  float v27[256][8][8],
  float v28[3][34][34]
) {	// L6, [0,41511411)
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
  #pragma HLS interface bram port=v25
  #pragma HLS interface bram port=v26
  #pragma HLS interface bram port=v27
  #pragma HLS interface bram port=v28

  #pragma HLS array_partition variable=v1 cyclic factor=8 dim=1
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=8 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=8 dim=1
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=8 dim=1
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS array_partition variable=v5 cyclic factor=8 dim=1
  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS array_partition variable=v6 cyclic factor=8 dim=1
  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS array_partition variable=v7 cyclic factor=8 dim=1
  #pragma HLS resource variable=v7 core=ram_s2p_bram

  #pragma HLS array_partition variable=v8 cyclic factor=8 dim=1
  #pragma HLS resource variable=v8 core=ram_s2p_bram

  #pragma HLS array_partition variable=v9 cyclic factor=8 dim=1
  #pragma HLS resource variable=v9 core=ram_s2p_bram

  #pragma HLS array_partition variable=v10 cyclic factor=8 dim=1
  #pragma HLS resource variable=v10 core=ram_s2p_bram

  #pragma HLS resource variable=v11 core=ram_s2p_bram

  #pragma HLS array_partition variable=v12 cyclic factor=8 dim=1
  #pragma HLS resource variable=v12 core=ram_s2p_bram

  #pragma HLS array_partition variable=v13 cyclic factor=8 dim=1
  #pragma HLS resource variable=v13 core=ram_s2p_bram

  #pragma HLS array_partition variable=v14 cyclic factor=8 dim=1
  #pragma HLS resource variable=v14 core=ram_s2p_bram

  #pragma HLS resource variable=v15 core=ram_s2p_bram

  #pragma HLS array_partition variable=v16 cyclic factor=8 dim=1
  #pragma HLS resource variable=v16 core=ram_s2p_bram

  #pragma HLS array_partition variable=v17 cyclic factor=8 dim=1
  #pragma HLS resource variable=v17 core=ram_s2p_bram

  #pragma HLS array_partition variable=v18 cyclic factor=8 dim=1
  #pragma HLS resource variable=v18 core=ram_s2p_bram

  #pragma HLS resource variable=v19 core=ram_s2p_bram

  #pragma HLS array_partition variable=v20 cyclic factor=8 dim=1
  #pragma HLS resource variable=v20 core=ram_s2p_bram

  #pragma HLS resource variable=v21 core=ram_s2p_bram

  #pragma HLS array_partition variable=v22 cyclic factor=8 dim=1
  #pragma HLS resource variable=v22 core=ram_s2p_bram

  #pragma HLS array_partition variable=v23 cyclic factor=8 dim=1
  #pragma HLS resource variable=v23 core=ram_s2p_bram

  #pragma HLS resource variable=v24 core=ram_s2p_bram

  #pragma HLS array_partition variable=v25 cyclic factor=8 dim=1
  #pragma HLS resource variable=v25 core=ram_s2p_bram

  #pragma HLS array_partition variable=v26 cyclic factor=8 dim=1
  #pragma HLS resource variable=v26 core=ram_s2p_bram

  #pragma HLS array_partition variable=v27 cyclic factor=8 dim=1
  #pragma HLS resource variable=v27 core=ram_s2p_bram

  #pragma HLS resource variable=v28 core=ram_s2p_bram

  for (int v29 = 0; v29 < 64; v29 += 1) {	// L7, [0,69762), iterCycle=1090, II=1090
    for (int v30 = 0; v30 < 32; v30 += 1) {	// L8, [0,1090), iterCycle=34, II=34
      for (int v31 = 0; v31 < 32; v31 += 1) {	// L9, [0,34), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v10[v29][v30][v31] = v0;	// L10, [0,1)
      }
    }
  }
  for (int v32 = 0; v32 < 3; v32 += 1) {	// L14, [69762,290959), iterCycle=12, II=1
    for (int v33 = 0; v33 < 3; v33 += 1) {	// L15, [41220450,41294191), iterCycle=12, II=1
      for (int v34 = 0; v34 < 3; v34 += 1) {	// L16, [41220450,41245039), iterCycle=12, II=1
        for (int v35 = 0; v35 < 8; v35 += 1) {	// L17, [41220450,41228655), iterCycle=12, II=1
          for (int v36 = 0; v36 < 32; v36 += 1) {	// L18, [41220450,41221487), iterCycle=12, II=1
            for (int v37 = 0; v37 < 32; v37 += 1) {	// L19, [41220450,41220495), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v38 = v28[v32][(v36 + v33)][(v37 + v34)];	// L20, [0,2)
              float v39 = v1[(v35 * 8)][v32][v33][v34];	// L21, [0,2)
              float v40 = v38 * v39;	// L22, [2,6)
              float v41 = v10[(v35 * 8)][v36][v37];	// L23, [4,6)
              float v42 = v40 + v41;	// L24, [6,11)
              v10[(v35 * 8)][v36][v37] = v42;	// L25, [11,12)
              float v43 = v1[((v35 * 8) + 1)][v32][v33][v34];	// L26, [0,2)
              float v44 = v38 * v43;	// L27, [2,6)
              float v45 = v10[((v35 * 8) + 1)][v36][v37];	// L28, [4,6)
              float v46 = v44 + v45;	// L29, [6,11)
              v10[((v35 * 8) + 1)][v36][v37] = v46;	// L30, [11,12)
              float v47 = v1[((v35 * 8) + 2)][v32][v33][v34];	// L31, [0,2)
              float v48 = v38 * v47;	// L32, [2,6)
              float v49 = v10[((v35 * 8) + 2)][v36][v37];	// L33, [4,6)
              float v50 = v48 + v49;	// L34, [6,11)
              v10[((v35 * 8) + 2)][v36][v37] = v50;	// L35, [11,12)
              float v51 = v1[((v35 * 8) + 3)][v32][v33][v34];	// L36, [0,2)
              float v52 = v38 * v51;	// L37, [2,6)
              float v53 = v10[((v35 * 8) + 3)][v36][v37];	// L38, [4,6)
              float v54 = v52 + v53;	// L39, [6,11)
              v10[((v35 * 8) + 3)][v36][v37] = v54;	// L40, [11,12)
              float v55 = v1[((v35 * 8) + 4)][v32][v33][v34];	// L41, [0,2)
              float v56 = v38 * v55;	// L42, [2,6)
              float v57 = v10[((v35 * 8) + 4)][v36][v37];	// L43, [4,6)
              float v58 = v56 + v57;	// L44, [6,11)
              v10[((v35 * 8) + 4)][v36][v37] = v58;	// L45, [11,12)
              float v59 = v1[((v35 * 8) + 5)][v32][v33][v34];	// L46, [0,2)
              float v60 = v38 * v59;	// L47, [2,6)
              float v61 = v10[((v35 * 8) + 5)][v36][v37];	// L48, [4,6)
              float v62 = v60 + v61;	// L49, [6,11)
              v10[((v35 * 8) + 5)][v36][v37] = v62;	// L50, [11,12)
              float v63 = v1[((v35 * 8) + 6)][v32][v33][v34];	// L51, [0,2)
              float v64 = v38 * v63;	// L52, [2,6)
              float v65 = v10[((v35 * 8) + 6)][v36][v37];	// L53, [4,6)
              float v66 = v64 + v65;	// L54, [6,11)
              v10[((v35 * 8) + 6)][v36][v37] = v66;	// L55, [11,12)
              float v67 = v1[((v35 * 8) + 7)][v32][v33][v34];	// L56, [0,2)
              float v68 = v38 * v67;	// L57, [2,6)
              float v69 = v10[((v35 * 8) + 7)][v36][v37];	// L58, [4,6)
              float v70 = v68 + v69;	// L59, [6,11)
              v10[((v35 * 8) + 7)][v36][v37] = v70;	// L60, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v71 = 0; v71 < 64; v71 += 1) {	// L67, [290959,491793), iterCycle=3138, II=3138
    for (int v72 = 0; v72 < 32; v72 += 1) {	// L68, [0,3138), iterCycle=98, II=98
      for (int v73 = 0; v73 < 32; v73 += 1) {
        #pragma HLS PIPELINE off
	// L69, [0,98), iterCycle=3, II=3
        float v74 = v10[v71][v72][v73];	// L70, [0,2)
        v10[v71][v72][v73] = max(v74,v0);	// L71, [2,3)
      }
    }
  }
  for (int v75 = 0; v75 < 64; v75 += 1) {	// L75, [491793,561555), iterCycle=1090, II=1090
    for (int v76 = 0; v76 < 32; v76 += 1) {	// L76, [0,1090), iterCycle=34, II=34
      for (int v77 = 0; v77 < 32; v77 += 1) {	// L77, [0,34), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v20[v75][v76][v77] = v0;	// L78, [0,1)
      }
    }
  }
  for (int v78 = 0; v78 < 64; v78 += 1) {	// L82, [561555,5280160), iterCycle=12, II=1
    for (int v79 = 0; v79 < 3; v79 += 1) {	// L83, [36231249,36304990), iterCycle=12, II=1
      for (int v80 = 0; v80 < 3; v80 += 1) {	// L84, [36231249,36255838), iterCycle=12, II=1
        for (int v81 = 0; v81 < 8; v81 += 1) {	// L85, [36231249,36239454), iterCycle=12, II=1
          for (int v82 = 0; v82 < 32; v82 += 1) {	// L86, [36231249,36232286), iterCycle=12, II=1
            for (int v83 = 0; v83 < 32; v83 += 1) {	// L87, [36231249,36231294), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v84 = v10[v78][(v82 + v79)][(v83 + v80)];	// L88, [0,2)
              float v85 = v2[(v81 * 8)][v78][v79][v80];	// L89, [0,2)
              float v86 = v84 * v85;	// L90, [2,6)
              float v87 = v20[(v81 * 8)][v82][v83];	// L91, [4,6)
              float v88 = v86 + v87;	// L92, [6,11)
              v20[(v81 * 8)][v82][v83] = v88;	// L93, [11,12)
              float v89 = v2[((v81 * 8) + 1)][v78][v79][v80];	// L94, [0,2)
              float v90 = v84 * v89;	// L95, [2,6)
              float v91 = v20[((v81 * 8) + 1)][v82][v83];	// L96, [4,6)
              float v92 = v90 + v91;	// L97, [6,11)
              v20[((v81 * 8) + 1)][v82][v83] = v92;	// L98, [11,12)
              float v93 = v2[((v81 * 8) + 2)][v78][v79][v80];	// L99, [0,2)
              float v94 = v84 * v93;	// L100, [2,6)
              float v95 = v20[((v81 * 8) + 2)][v82][v83];	// L101, [4,6)
              float v96 = v94 + v95;	// L102, [6,11)
              v20[((v81 * 8) + 2)][v82][v83] = v96;	// L103, [11,12)
              float v97 = v2[((v81 * 8) + 3)][v78][v79][v80];	// L104, [0,2)
              float v98 = v84 * v97;	// L105, [2,6)
              float v99 = v20[((v81 * 8) + 3)][v82][v83];	// L106, [4,6)
              float v100 = v98 + v99;	// L107, [6,11)
              v20[((v81 * 8) + 3)][v82][v83] = v100;	// L108, [11,12)
              float v101 = v2[((v81 * 8) + 4)][v78][v79][v80];	// L109, [0,2)
              float v102 = v84 * v101;	// L110, [2,6)
              float v103 = v20[((v81 * 8) + 4)][v82][v83];	// L111, [4,6)
              float v104 = v102 + v103;	// L112, [6,11)
              v20[((v81 * 8) + 4)][v82][v83] = v104;	// L113, [11,12)
              float v105 = v2[((v81 * 8) + 5)][v78][v79][v80];	// L114, [0,2)
              float v106 = v84 * v105;	// L115, [2,6)
              float v107 = v20[((v81 * 8) + 5)][v82][v83];	// L116, [4,6)
              float v108 = v106 + v107;	// L117, [6,11)
              v20[((v81 * 8) + 5)][v82][v83] = v108;	// L118, [11,12)
              float v109 = v2[((v81 * 8) + 6)][v78][v79][v80];	// L119, [0,2)
              float v110 = v84 * v109;	// L120, [2,6)
              float v111 = v20[((v81 * 8) + 6)][v82][v83];	// L121, [4,6)
              float v112 = v110 + v111;	// L122, [6,11)
              v20[((v81 * 8) + 6)][v82][v83] = v112;	// L123, [11,12)
              float v113 = v2[((v81 * 8) + 7)][v78][v79][v80];	// L124, [0,2)
              float v114 = v84 * v113;	// L125, [2,6)
              float v115 = v20[((v81 * 8) + 7)][v82][v83];	// L126, [4,6)
              float v116 = v114 + v115;	// L127, [6,11)
              v20[((v81 * 8) + 7)][v82][v83] = v116;	// L128, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v117 = 0; v117 < 64; v117 += 1) {	// L135, [5280160,5480994), iterCycle=3138, II=3138
    for (int v118 = 0; v118 < 32; v118 += 1) {	// L136, [0,3138), iterCycle=98, II=98
      for (int v119 = 0; v119 < 32; v119 += 1) {	// L137, [0,98), iterCycle=3, II=3
        float v120 = v20[v117][v118][v119];	// L138, [0,2)
        #pragma HLS PIPELINE off
        v20[v117][v118][v119] = max(v120,v0);	// L139, [2,3)
      }
    }
  }
  for (int v121 = 0; v121 < 64; v121 += 1) {	// L143, [5480994,5499556), iterCycle=290, II=290
    for (int v122 = 0; v122 < 16; v122 += 1) {	// L144, [0,290), iterCycle=18, II=18
      for (int v123 = 0; v123 < 16; v123 += 1) {	// L145, [0,18), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v21[v121][v122][v123] = v0;	// L146, [0,1)
      }
    }
  }
  for (int v124 = 0; v124 < 64; v124 += 1) {	// L150, [5499556,6075174), iterCycle=8994, II=8994
    for (int v125 = 0; v125 < 16; v125 += 1) {	// L151, [0,8994), iterCycle=562, II=562
      for (int v126 = 0; v126 < 16; v126 += 1) {	// L152, [0,562), iterCycle=35, II=35
        for (int v127 = 0; v127 < 3; v127 += 1) {	// L153, [0,35), iterCycle=11, II=11
          for (int v128 = 0; v128 < 3; v128 += 1) {
#pragma HLS PIPELINE off
	// L154, [0,11), iterCycle=3, II=3
            float v129 = v20[v124][((v125 * 2) + v127)][((v126 * 2) + v128)];	// L155, [0,2)
            v21[v124][v125][v126] = max(v129,v21[v124][v125][v126]);	// L156, [2,3)
          }
        }
      }
    }
  }
  for (int v130 = 0; v130 < 128; v130 += 1) {	// L162, [6075174,6112296), iterCycle=290, II=290
    for (int v131 = 0; v131 < 16; v131 += 1) {	// L163, [0,290), iterCycle=18, II=18
      for (int v132 = 0; v132 < 16; v132 += 1) {	// L164, [0,18), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v22[v130][v131][v132] = v0;	// L165, [0,1)
      }
    }
  }
  for (int v133 = 0; v133 < 64; v133 += 1) {	// L169, [6112296,8471605), iterCycle=12, II=1
    for (int v134 = 0; v134 < 3; v134 += 1) {	// L170, [33039804,33076681), iterCycle=12, II=1
      for (int v135 = 0; v135 < 3; v135 += 1) {	// L171, [33039804,33052105), iterCycle=12, II=1
        for (int v136 = 0; v136 < 16; v136 += 1) {	// L172, [33039804,33043913), iterCycle=12, II=1
          for (int v137 = 0; v137 < 16; v137 += 1) {	// L173, [33039804,33040073), iterCycle=12, II=1
            for (int v138 = 0; v138 < 16; v138 += 1) {	// L174, [33039804,33039833), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v139 = v21[v133][(v137 + v134)][(v138 + v135)];	// L175, [0,2)
              float v140 = v3[(v136 * 8)][v133][v134][v135];	// L176, [0,2)
              float v141 = v139 * v140;	// L177, [2,6)
              float v142 = v22[(v136 * 8)][v137][v138];	// L178, [4,6)
              float v143 = v141 + v142;	// L179, [6,11)
              v22[(v136 * 8)][v137][v138] = v143;	// L180, [11,12)
              float v144 = v3[((v136 * 8) + 1)][v133][v134][v135];	// L181, [0,2)
              float v145 = v139 * v144;	// L182, [2,6)
              float v146 = v22[((v136 * 8) + 1)][v137][v138];	// L183, [4,6)
              float v147 = v145 + v146;	// L184, [6,11)
              v22[((v136 * 8) + 1)][v137][v138] = v147;	// L185, [11,12)
              float v148 = v3[((v136 * 8) + 2)][v133][v134][v135];	// L186, [0,2)
              float v149 = v139 * v148;	// L187, [2,6)
              float v150 = v22[((v136 * 8) + 2)][v137][v138];	// L188, [4,6)
              float v151 = v149 + v150;	// L189, [6,11)
              v22[((v136 * 8) + 2)][v137][v138] = v151;	// L190, [11,12)
              float v152 = v3[((v136 * 8) + 3)][v133][v134][v135];	// L191, [0,2)
              float v153 = v139 * v152;	// L192, [2,6)
              float v154 = v22[((v136 * 8) + 3)][v137][v138];	// L193, [4,6)
              float v155 = v153 + v154;	// L194, [6,11)
              v22[((v136 * 8) + 3)][v137][v138] = v155;	// L195, [11,12)
              float v156 = v3[((v136 * 8) + 4)][v133][v134][v135];	// L196, [0,2)
              float v157 = v139 * v156;	// L197, [2,6)
              float v158 = v22[((v136 * 8) + 4)][v137][v138];	// L198, [4,6)
              float v159 = v157 + v158;	// L199, [6,11)
              v22[((v136 * 8) + 4)][v137][v138] = v159;	// L200, [11,12)
              float v160 = v3[((v136 * 8) + 5)][v133][v134][v135];	// L201, [0,2)
              float v161 = v139 * v160;	// L202, [2,6)
              float v162 = v22[((v136 * 8) + 5)][v137][v138];	// L203, [4,6)
              float v163 = v161 + v162;	// L204, [6,11)
              v22[((v136 * 8) + 5)][v137][v138] = v163;	// L205, [11,12)
              float v164 = v3[((v136 * 8) + 6)][v133][v134][v135];	// L206, [0,2)
              float v165 = v139 * v164;	// L207, [2,6)
              float v166 = v22[((v136 * 8) + 6)][v137][v138];	// L208, [4,6)
              float v167 = v165 + v166;	// L209, [6,11)
              v22[((v136 * 8) + 6)][v137][v138] = v167;	// L210, [11,12)
              float v168 = v3[((v136 * 8) + 7)][v133][v134][v135];	// L211, [0,2)
              float v169 = v139 * v168;	// L212, [2,6)
              float v170 = v22[((v136 * 8) + 7)][v137][v138];	// L213, [4,6)
              float v171 = v169 + v170;	// L214, [6,11)
              v22[((v136 * 8) + 7)][v137][v138] = v171;	// L215, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v172 = 0; v172 < 128; v172 += 1) {	// L222, [8471605,8574263), iterCycle=802, II=802
    for (int v173 = 0; v173 < 16; v173 += 1) {	// L223, [0,802), iterCycle=50, II=50
      for (int v174 = 0; v174 < 16; v174 += 1) {
#pragma HLS PIPELINE off
	// L224, [0,50), iterCycle=3, II=3
        float v175 = v22[v172][v173][v174];	// L225, [0,2)
        v22[v172][v173][v174] = max(v175,v0);	// L226, [2,3)
      }
    }
  }
  for (int v176 = 0; v176 < 128; v176 += 1) {	// L230, [8574263,8611385), iterCycle=290, II=290
    for (int v177 = 0; v177 < 16; v177 += 1) {	// L231, [0,290), iterCycle=18, II=18
      for (int v178 = 0; v178 < 16; v178 += 1) {	// L232, [0,18), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v23[v176][v177][v178] = v0;	// L233, [0,1)
      }
    }
  }
  for (int v179 = 0; v179 < 128; v179 += 1) {	// L237, [8611385,13329990), iterCycle=12, II=1
    for (int v180 = 0; v180 < 3; v180 += 1) {	// L238, [28181419,28218296), iterCycle=12, II=1
      for (int v181 = 0; v181 < 3; v181 += 1) {	// L239, [28181419,28193720), iterCycle=12, II=1
        for (int v182 = 0; v182 < 16; v182 += 1) {	// L240, [28181419,28185528), iterCycle=12, II=1
          for (int v183 = 0; v183 < 16; v183 += 1) {	// L241, [28181419,28181688), iterCycle=12, II=1
            for (int v184 = 0; v184 < 16; v184 += 1) {	// L242, [28181419,28181448), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v185 = v22[v179][(v183 + v180)][(v184 + v181)];	// L243, [0,2)
              float v186 = v4[(v182 * 8)][v179][v180][v181];	// L244, [0,2)
              float v187 = v185 * v186;	// L245, [2,6)
              float v188 = v23[(v182 * 8)][v183][v184];	// L246, [4,6)
              float v189 = v187 + v188;	// L247, [6,11)
              v23[(v182 * 8)][v183][v184] = v189;	// L248, [11,12)
              float v190 = v4[((v182 * 8) + 1)][v179][v180][v181];	// L249, [0,2)
              float v191 = v185 * v190;	// L250, [2,6)
              float v192 = v23[((v182 * 8) + 1)][v183][v184];	// L251, [4,6)
              float v193 = v191 + v192;	// L252, [6,11)
              v23[((v182 * 8) + 1)][v183][v184] = v193;	// L253, [11,12)
              float v194 = v4[((v182 * 8) + 2)][v179][v180][v181];	// L254, [0,2)
              float v195 = v185 * v194;	// L255, [2,6)
              float v196 = v23[((v182 * 8) + 2)][v183][v184];	// L256, [4,6)
              float v197 = v195 + v196;	// L257, [6,11)
              v23[((v182 * 8) + 2)][v183][v184] = v197;	// L258, [11,12)
              float v198 = v4[((v182 * 8) + 3)][v179][v180][v181];	// L259, [0,2)
              float v199 = v185 * v198;	// L260, [2,6)
              float v200 = v23[((v182 * 8) + 3)][v183][v184];	// L261, [4,6)
              float v201 = v199 + v200;	// L262, [6,11)
              v23[((v182 * 8) + 3)][v183][v184] = v201;	// L263, [11,12)
              float v202 = v4[((v182 * 8) + 4)][v179][v180][v181];	// L264, [0,2)
              float v203 = v185 * v202;	// L265, [2,6)
              float v204 = v23[((v182 * 8) + 4)][v183][v184];	// L266, [4,6)
              float v205 = v203 + v204;	// L267, [6,11)
              v23[((v182 * 8) + 4)][v183][v184] = v205;	// L268, [11,12)
              float v206 = v4[((v182 * 8) + 5)][v179][v180][v181];	// L269, [0,2)
              float v207 = v185 * v206;	// L270, [2,6)
              float v208 = v23[((v182 * 8) + 5)][v183][v184];	// L271, [4,6)
              float v209 = v207 + v208;	// L272, [6,11)
              v23[((v182 * 8) + 5)][v183][v184] = v209;	// L273, [11,12)
              float v210 = v4[((v182 * 8) + 6)][v179][v180][v181];	// L274, [0,2)
              float v211 = v185 * v210;	// L275, [2,6)
              float v212 = v23[((v182 * 8) + 6)][v183][v184];	// L276, [4,6)
              float v213 = v211 + v212;	// L277, [6,11)
              v23[((v182 * 8) + 6)][v183][v184] = v213;	// L278, [11,12)
              float v214 = v4[((v182 * 8) + 7)][v179][v180][v181];	// L279, [0,2)
              float v215 = v185 * v214;	// L280, [2,6)
              float v216 = v23[((v182 * 8) + 7)][v183][v184];	// L281, [4,6)
              float v217 = v215 + v216;	// L282, [6,11)
              v23[((v182 * 8) + 7)][v183][v184] = v217;	// L283, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v218 = 0; v218 < 128; v218 += 1) {	// L290, [13329990,13432648), iterCycle=802, II=802
    for (int v219 = 0; v219 < 16; v219 += 1) {	// L291, [0,802), iterCycle=50, II=50
      for (int v220 = 0; v220 < 16; v220 += 1) {
#pragma HLS PIPELINE off
	// L292, [0,50), iterCycle=3, II=3
        float v221 = v23[v218][v219][v220];	// L293, [0,2)
        v23[v218][v219][v220] = max(v221,v0);	// L294, [2,3)
      }
    }
  }
  for (int v222 = 0; v222 < 128; v222 += 1) {	// L298, [13432648,13443146), iterCycle=82, II=82
    for (int v223 = 0; v223 < 8; v223 += 1) {	// L299, [0,82), iterCycle=10, II=10
      for (int v224 = 0; v224 < 8; v224 += 1) {	// L300, [0,10), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v24[v222][v223][v224] = v0;	// L301, [0,1)
      }
    }
  }
  for (int v225 = 0; v225 < 128; v225 += 1) {	// L305, [13443146,13732172), iterCycle=2258, II=2258
    for (int v226 = 0; v226 < 8; v226 += 1) {	// L306, [0,2258), iterCycle=282, II=282
      for (int v227 = 0; v227 < 8; v227 += 1) {	// L307, [0,282), iterCycle=35, II=35
        for (int v228 = 0; v228 < 3; v228 += 1) {	// L308, [0,35), iterCycle=11, II=11
          for (int v229 = 0; v229 < 3; v229 += 1) {
#pragma HLS PIPELINE off
	// L309, [0,11), iterCycle=3, II=3
            float v230 = v23[v225][((v226 * 2) + v228)][((v227 * 2) + v229)];	// L310, [0,2)
            v24[v225][v226][v227] = max(v230,v24[v225][v226][v227]);	// L311, [2,3)
          }
        }
      }
    }
  }
  for (int v231 = 0; v231 < 256; v231 += 1) {	// L317, [13732172,13753166), iterCycle=82, II=82
    for (int v232 = 0; v232 < 8; v232 += 1) {	// L318, [0,82), iterCycle=10, II=10
      for (int v233 = 0; v233 < 8; v233 += 1) {	// L319, [0,10), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v25[v231][v232][v233] = v0;	// L320, [0,1)
      }
    }
  }
  for (int v234 = 0; v234 < 128; v234 += 1) {	// L324, [13753166,16112475), iterCycle=12, II=1
    for (int v235 = 0; v235 < 3; v235 += 1) {	// L325, [25398934,25417379), iterCycle=12, II=1
      for (int v236 = 0; v236 < 3; v236 += 1) {	// L326, [25398934,25405091), iterCycle=12, II=1
        for (int v237 = 0; v237 < 32; v237 += 1) {	// L327, [25398934,25400995), iterCycle=12, II=1
          for (int v238 = 0; v238 < 8; v238 += 1) {	// L328, [25398934,25399011), iterCycle=12, II=1
            for (int v239 = 0; v239 < 8; v239 += 1) {	// L329, [25398934,25398955), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v240 = v24[v234][(v238 + v235)][(v239 + v236)];	// L330, [0,2)
              float v241 = v5[(v237 * 8)][v234][v235][v236];	// L331, [0,2)
              float v242 = v240 * v241;	// L332, [2,6)
              float v243 = v25[(v237 * 8)][v238][v239];	// L333, [4,6)
              float v244 = v242 + v243;	// L334, [6,11)
              v25[(v237 * 8)][v238][v239] = v244;	// L335, [11,12)
              float v245 = v5[((v237 * 8) + 1)][v234][v235][v236];	// L336, [0,2)
              float v246 = v240 * v245;	// L337, [2,6)
              float v247 = v25[((v237 * 8) + 1)][v238][v239];	// L338, [4,6)
              float v248 = v246 + v247;	// L339, [6,11)
              v25[((v237 * 8) + 1)][v238][v239] = v248;	// L340, [11,12)
              float v249 = v5[((v237 * 8) + 2)][v234][v235][v236];	// L341, [0,2)
              float v250 = v240 * v249;	// L342, [2,6)
              float v251 = v25[((v237 * 8) + 2)][v238][v239];	// L343, [4,6)
              float v252 = v250 + v251;	// L344, [6,11)
              v25[((v237 * 8) + 2)][v238][v239] = v252;	// L345, [11,12)
              float v253 = v5[((v237 * 8) + 3)][v234][v235][v236];	// L346, [0,2)
              float v254 = v240 * v253;	// L347, [2,6)
              float v255 = v25[((v237 * 8) + 3)][v238][v239];	// L348, [4,6)
              float v256 = v254 + v255;	// L349, [6,11)
              v25[((v237 * 8) + 3)][v238][v239] = v256;	// L350, [11,12)
              float v257 = v5[((v237 * 8) + 4)][v234][v235][v236];	// L351, [0,2)
              float v258 = v240 * v257;	// L352, [2,6)
              float v259 = v25[((v237 * 8) + 4)][v238][v239];	// L353, [4,6)
              float v260 = v258 + v259;	// L354, [6,11)
              v25[((v237 * 8) + 4)][v238][v239] = v260;	// L355, [11,12)
              float v261 = v5[((v237 * 8) + 5)][v234][v235][v236];	// L356, [0,2)
              float v262 = v240 * v261;	// L357, [2,6)
              float v263 = v25[((v237 * 8) + 5)][v238][v239];	// L358, [4,6)
              float v264 = v262 + v263;	// L359, [6,11)
              v25[((v237 * 8) + 5)][v238][v239] = v264;	// L360, [11,12)
              float v265 = v5[((v237 * 8) + 6)][v234][v235][v236];	// L361, [0,2)
              float v266 = v240 * v265;	// L362, [2,6)
              float v267 = v25[((v237 * 8) + 6)][v238][v239];	// L363, [4,6)
              float v268 = v266 + v267;	// L364, [6,11)
              v25[((v237 * 8) + 6)][v238][v239] = v268;	// L365, [11,12)
              float v269 = v5[((v237 * 8) + 7)][v234][v235][v236];	// L366, [0,2)
              float v270 = v240 * v269;	// L367, [2,6)
              float v271 = v25[((v237 * 8) + 7)][v238][v239];	// L368, [4,6)
              float v272 = v270 + v271;	// L369, [6,11)
              v25[((v237 * 8) + 7)][v238][v239] = v272;	// L370, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v273 = 0; v273 < 256; v273 += 1) {	// L377, [16112475,16166237), iterCycle=210, II=210
    for (int v274 = 0; v274 < 8; v274 += 1) {	// L378, [0,210), iterCycle=26, II=26
      for (int v275 = 0; v275 < 8; v275 += 1) {
#pragma HLS PIPELINE off
	// L379, [0,26), iterCycle=3, II=3
        float v276 = v25[v273][v274][v275];	// L380, [0,2)
        v25[v273][v274][v275] = max(v276,v0);	// L381, [2,3)
      }
    }
  }
  for (int v277 = 0; v277 < 256; v277 += 1) {	// L385, [16166237,16187231), iterCycle=82, II=82
    for (int v278 = 0; v278 < 8; v278 += 1) {	// L386, [0,82), iterCycle=10, II=10
      for (int v279 = 0; v279 < 8; v279 += 1) {	// L387, [0,10), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v26[v277][v278][v279] = v0;	// L388, [0,1)
      }
    }
  }
  for (int v280 = 0; v280 < 256; v280 += 1) {	// L392, [16187231,20905836), iterCycle=12, II=1
    for (int v281 = 0; v281 < 3; v281 += 1) {	// L393, [20605573,20624018), iterCycle=12, II=1
      for (int v282 = 0; v282 < 3; v282 += 1) {	// L394, [20605573,20611730), iterCycle=12, II=1
        for (int v283 = 0; v283 < 32; v283 += 1) {	// L395, [20605573,20607634), iterCycle=12, II=1
          for (int v284 = 0; v284 < 8; v284 += 1) {	// L396, [20605573,20605650), iterCycle=12, II=1
            for (int v285 = 0; v285 < 8; v285 += 1) {	// L397, [20605573,20605594), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v286 = v25[v280][(v284 + v281)][(v285 + v282)];	// L398, [0,2)
              float v287 = v6[(v283 * 8)][v280][v281][v282];	// L399, [0,2)
              float v288 = v286 * v287;	// L400, [2,6)
              float v289 = v26[(v283 * 8)][v284][v285];	// L401, [4,6)
              float v290 = v288 + v289;	// L402, [6,11)
              v26[(v283 * 8)][v284][v285] = v290;	// L403, [11,12)
              float v291 = v6[((v283 * 8) + 1)][v280][v281][v282];	// L404, [0,2)
              float v292 = v286 * v291;	// L405, [2,6)
              float v293 = v26[((v283 * 8) + 1)][v284][v285];	// L406, [4,6)
              float v294 = v292 + v293;	// L407, [6,11)
              v26[((v283 * 8) + 1)][v284][v285] = v294;	// L408, [11,12)
              float v295 = v6[((v283 * 8) + 2)][v280][v281][v282];	// L409, [0,2)
              float v296 = v286 * v295;	// L410, [2,6)
              float v297 = v26[((v283 * 8) + 2)][v284][v285];	// L411, [4,6)
              float v298 = v296 + v297;	// L412, [6,11)
              v26[((v283 * 8) + 2)][v284][v285] = v298;	// L413, [11,12)
              float v299 = v6[((v283 * 8) + 3)][v280][v281][v282];	// L414, [0,2)
              float v300 = v286 * v299;	// L415, [2,6)
              float v301 = v26[((v283 * 8) + 3)][v284][v285];	// L416, [4,6)
              float v302 = v300 + v301;	// L417, [6,11)
              v26[((v283 * 8) + 3)][v284][v285] = v302;	// L418, [11,12)
              float v303 = v6[((v283 * 8) + 4)][v280][v281][v282];	// L419, [0,2)
              float v304 = v286 * v303;	// L420, [2,6)
              float v305 = v26[((v283 * 8) + 4)][v284][v285];	// L421, [4,6)
              float v306 = v304 + v305;	// L422, [6,11)
              v26[((v283 * 8) + 4)][v284][v285] = v306;	// L423, [11,12)
              float v307 = v6[((v283 * 8) + 5)][v280][v281][v282];	// L424, [0,2)
              float v308 = v286 * v307;	// L425, [2,6)
              float v309 = v26[((v283 * 8) + 5)][v284][v285];	// L426, [4,6)
              float v310 = v308 + v309;	// L427, [6,11)
              v26[((v283 * 8) + 5)][v284][v285] = v310;	// L428, [11,12)
              float v311 = v6[((v283 * 8) + 6)][v280][v281][v282];	// L429, [0,2)
              float v312 = v286 * v311;	// L430, [2,6)
              float v313 = v26[((v283 * 8) + 6)][v284][v285];	// L431, [4,6)
              float v314 = v312 + v313;	// L432, [6,11)
              v26[((v283 * 8) + 6)][v284][v285] = v314;	// L433, [11,12)
              float v315 = v6[((v283 * 8) + 7)][v280][v281][v282];	// L434, [0,2)
              float v316 = v286 * v315;	// L435, [2,6)
              float v317 = v26[((v283 * 8) + 7)][v284][v285];	// L436, [4,6)
              float v318 = v316 + v317;	// L437, [6,11)
              v26[((v283 * 8) + 7)][v284][v285] = v318;	// L438, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v319 = 0; v319 < 256; v319 += 1) {	// L445, [20905836,20959598), iterCycle=210, II=210
    for (int v320 = 0; v320 < 8; v320 += 1) {	// L446, [0,210), iterCycle=26, II=26
      for (int v321 = 0; v321 < 8; v321 += 1) {
#pragma HLS PIPELINE off
	// L447, [0,26), iterCycle=3, II=3
        float v322 = v26[v319][v320][v321];	// L448, [0,2)
        v26[v319][v320][v321] = max(v322,v0);	// L449, [2,3)
      }
    }
  }
  for (int v323 = 0; v323 < 256; v323 += 1) {	// L453, [20959598,20980592), iterCycle=82, II=82
    for (int v324 = 0; v324 < 8; v324 += 1) {	// L454, [0,82), iterCycle=10, II=10
      for (int v325 = 0; v325 < 8; v325 += 1) {	// L455, [0,10), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v27[v323][v324][v325] = v0;	// L456, [0,1)
      }
    }
  }
  for (int v326 = 0; v326 < 256; v326 += 1) {	// L460, [20980592,25699197), iterCycle=12, II=1
    for (int v327 = 0; v327 < 3; v327 += 1) {	// L461, [15812212,15830657), iterCycle=12, II=1
      for (int v328 = 0; v328 < 3; v328 += 1) {	// L462, [15812212,15818369), iterCycle=12, II=1
        for (int v329 = 0; v329 < 32; v329 += 1) {	// L463, [15812212,15814273), iterCycle=12, II=1
          for (int v330 = 0; v330 < 8; v330 += 1) {	// L464, [15812212,15812289), iterCycle=12, II=1
            for (int v331 = 0; v331 < 8; v331 += 1) {	// L465, [15812212,15812233), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v332 = v26[v326][(v330 + v327)][(v331 + v328)];	// L466, [0,2)
              float v333 = v6[(v329 * 8)][v326][v327][v328];	// L467, [0,2)
              float v334 = v332 * v333;	// L468, [2,6)
              float v335 = v27[(v329 * 8)][v330][v331];	// L469, [4,6)
              float v336 = v334 + v335;	// L470, [6,11)
              v27[(v329 * 8)][v330][v331] = v336;	// L471, [11,12)
              float v337 = v6[((v329 * 8) + 1)][v326][v327][v328];	// L472, [0,2)
              float v338 = v332 * v337;	// L473, [2,6)
              float v339 = v27[((v329 * 8) + 1)][v330][v331];	// L474, [4,6)
              float v340 = v338 + v339;	// L475, [6,11)
              v27[((v329 * 8) + 1)][v330][v331] = v340;	// L476, [11,12)
              float v341 = v6[((v329 * 8) + 2)][v326][v327][v328];	// L477, [0,2)
              float v342 = v332 * v341;	// L478, [2,6)
              float v343 = v27[((v329 * 8) + 2)][v330][v331];	// L479, [4,6)
              float v344 = v342 + v343;	// L480, [6,11)
              v27[((v329 * 8) + 2)][v330][v331] = v344;	// L481, [11,12)
              float v345 = v6[((v329 * 8) + 3)][v326][v327][v328];	// L482, [0,2)
              float v346 = v332 * v345;	// L483, [2,6)
              float v347 = v27[((v329 * 8) + 3)][v330][v331];	// L484, [4,6)
              float v348 = v346 + v347;	// L485, [6,11)
              v27[((v329 * 8) + 3)][v330][v331] = v348;	// L486, [11,12)
              float v349 = v6[((v329 * 8) + 4)][v326][v327][v328];	// L487, [0,2)
              float v350 = v332 * v349;	// L488, [2,6)
              float v351 = v27[((v329 * 8) + 4)][v330][v331];	// L489, [4,6)
              float v352 = v350 + v351;	// L490, [6,11)
              v27[((v329 * 8) + 4)][v330][v331] = v352;	// L491, [11,12)
              float v353 = v6[((v329 * 8) + 5)][v326][v327][v328];	// L492, [0,2)
              float v354 = v332 * v353;	// L493, [2,6)
              float v355 = v27[((v329 * 8) + 5)][v330][v331];	// L494, [4,6)
              float v356 = v354 + v355;	// L495, [6,11)
              v27[((v329 * 8) + 5)][v330][v331] = v356;	// L496, [11,12)
              float v357 = v6[((v329 * 8) + 6)][v326][v327][v328];	// L497, [0,2)
              float v358 = v332 * v357;	// L498, [2,6)
              float v359 = v27[((v329 * 8) + 6)][v330][v331];	// L499, [4,6)
              float v360 = v358 + v359;	// L500, [6,11)
              v27[((v329 * 8) + 6)][v330][v331] = v360;	// L501, [11,12)
              float v361 = v6[((v329 * 8) + 7)][v326][v327][v328];	// L502, [0,2)
              float v362 = v332 * v361;	// L503, [2,6)
              float v363 = v27[((v329 * 8) + 7)][v330][v331];	// L504, [4,6)
              float v364 = v362 + v363;	// L505, [6,11)
              v27[((v329 * 8) + 7)][v330][v331] = v364;	// L506, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v365 = 0; v365 < 256; v365 += 1) {	// L513, [25699197,25752959), iterCycle=210, II=210
    for (int v366 = 0; v366 < 8; v366 += 1) {	// L514, [0,210), iterCycle=26, II=26
      for (int v367 = 0; v367 < 8; v367 += 1) {
#pragma HLS PIPELINE off
	// L515, [0,26), iterCycle=3, II=3
        float v368 = v27[v365][v366][v367];	// L516, [0,2)
        v27[v365][v366][v367] = max(v368,v0);	// L517, [2,3)
      }
    }
  }
  for (int v369 = 0; v369 < 256; v369 += 1) {	// L521, [25752959,25759617), iterCycle=26, II=26
    for (int v370 = 0; v370 < 4; v370 += 1) {	// L522, [0,26), iterCycle=6, II=6
      for (int v371 = 0; v371 < 4; v371 += 1) {	// L523, [0,6), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v11[v369][v370][v371] = v0;	// L524, [0,1)
      }
    }
  }
  for (int v372 = 0; v372 < 256; v372 += 1) {	// L528, [25759617,25905539), iterCycle=570, II=570
    for (int v373 = 0; v373 < 4; v373 += 1) {	// L529, [0,570), iterCycle=142, II=142
      for (int v374 = 0; v374 < 4; v374 += 1) {	// L530, [0,142), iterCycle=35, II=35
        for (int v375 = 0; v375 < 3; v375 += 1) {	// L531, [0,35), iterCycle=11, II=11
          for (int v376 = 0; v376 < 3; v376 += 1) {
#pragma HLS PIPELINE off
	// L532, [0,11), iterCycle=3, II=3
            float v377 = v27[v372][((v373 * 2) + v375)][((v374 * 2) + v376)];	// L533, [0,2)
            v11[v372][v373][v374] = max(v377,v11[v372][v373][v374] ) ;	// L534, [2,3)
          }
        }
      }
    }
  }
  for (int v378 = 0; v378 < 512; v378 += 1) {	// L540, [25905539,25918853), iterCycle=26, II=26
    for (int v379 = 0; v379 < 4; v379 += 1) {	// L541, [0,26), iterCycle=6, II=6
      for (int v380 = 0; v380 < 4; v380 += 1) {	// L542, [0,6), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v12[v378][v379][v380] = v0;	// L543, [0,1)
      }
    }
  }
  for (int v381 = 0; v381 < 256; v381 += 1) {	// L547, [25918853,28278162), iterCycle=12, II=1
    for (int v382 = 0; v382 < 3; v382 += 1) {	// L548, [13233247,13242476), iterCycle=12, II=1
      for (int v383 = 0; v383 < 3; v383 += 1) {	// L549, [13233247,13236332), iterCycle=12, II=1
        for (int v384 = 0; v384 < 64; v384 += 1) {	// L550, [13233247,13234284), iterCycle=12, II=1
          for (int v385 = 0; v385 < 4; v385 += 1) {	// L551, [13233247,13233276), iterCycle=12, II=1
            for (int v386 = 0; v386 < 4; v386 += 1) {	// L552, [13233247,13233264), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v387 = v11[v381][(v385 + v382)][(v386 + v383)];	// L553, [0,2)
              float v388 = v7[(v384 * 8)][v381][v382][v383];	// L554, [0,2)
              float v389 = v387 * v388;	// L555, [2,6)
              float v390 = v12[(v384 * 8)][v385][v386];	// L556, [4,6)
              float v391 = v389 + v390;	// L557, [6,11)
              v12[(v384 * 8)][v385][v386] = v391;	// L558, [11,12)
              float v392 = v7[((v384 * 8) + 1)][v381][v382][v383];	// L559, [0,2)
              float v393 = v387 * v392;	// L560, [2,6)
              float v394 = v12[((v384 * 8) + 1)][v385][v386];	// L561, [4,6)
              float v395 = v393 + v394;	// L562, [6,11)
              v12[((v384 * 8) + 1)][v385][v386] = v395;	// L563, [11,12)
              float v396 = v7[((v384 * 8) + 2)][v381][v382][v383];	// L564, [0,2)
              float v397 = v387 * v396;	// L565, [2,6)
              float v398 = v12[((v384 * 8) + 2)][v385][v386];	// L566, [4,6)
              float v399 = v397 + v398;	// L567, [6,11)
              v12[((v384 * 8) + 2)][v385][v386] = v399;	// L568, [11,12)
              float v400 = v7[((v384 * 8) + 3)][v381][v382][v383];	// L569, [0,2)
              float v401 = v387 * v400;	// L570, [2,6)
              float v402 = v12[((v384 * 8) + 3)][v385][v386];	// L571, [4,6)
              float v403 = v401 + v402;	// L572, [6,11)
              v12[((v384 * 8) + 3)][v385][v386] = v403;	// L573, [11,12)
              float v404 = v7[((v384 * 8) + 4)][v381][v382][v383];	// L574, [0,2)
              float v405 = v387 * v404;	// L575, [2,6)
              float v406 = v12[((v384 * 8) + 4)][v385][v386];	// L576, [4,6)
              float v407 = v405 + v406;	// L577, [6,11)
              v12[((v384 * 8) + 4)][v385][v386] = v407;	// L578, [11,12)
              float v408 = v7[((v384 * 8) + 5)][v381][v382][v383];	// L579, [0,2)
              float v409 = v387 * v408;	// L580, [2,6)
              float v410 = v12[((v384 * 8) + 5)][v385][v386];	// L581, [4,6)
              float v411 = v409 + v410;	// L582, [6,11)
              v12[((v384 * 8) + 5)][v385][v386] = v411;	// L583, [11,12)
              float v412 = v7[((v384 * 8) + 6)][v381][v382][v383];	// L584, [0,2)
              float v413 = v387 * v412;	// L585, [2,6)
              float v414 = v12[((v384 * 8) + 6)][v385][v386];	// L586, [4,6)
              float v415 = v413 + v414;	// L587, [6,11)
              v12[((v384 * 8) + 6)][v385][v386] = v415;	// L588, [11,12)
              float v416 = v7[((v384 * 8) + 7)][v381][v382][v383];	// L589, [0,2)
              float v417 = v387 * v416;	// L590, [2,6)
              float v418 = v12[((v384 * 8) + 7)][v385][v386];	// L591, [4,6)
              float v419 = v417 + v418;	// L592, [6,11)
              v12[((v384 * 8) + 7)][v385][v386] = v419;	// L593, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v420 = 0; v420 < 512; v420 += 1) {	// L600, [28278162,28307860), iterCycle=58, II=58
    for (int v421 = 0; v421 < 4; v421 += 1) {	// L601, [0,58), iterCycle=14, II=14
      for (int v422 = 0; v422 < 4; v422 += 1) {
#pragma HLS PIPELINE off
	// L602, [0,14), iterCycle=3, II=3
        float v423 = v12[v420][v421][v422];	// L603, [0,2)
        v12[v420][v421][v422] = max(v423,v0);	// L604, [2,3)
      }
    }
  }
  for (int v424 = 0; v424 < 512; v424 += 1) {	// L608, [28307860,28321174), iterCycle=26, II=26
    for (int v425 = 0; v425 < 4; v425 += 1) {	// L609, [0,26), iterCycle=6, II=6
      for (int v426 = 0; v426 < 4; v426 += 1) {	// L610, [0,6), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v13[v424][v425][v426] = v0;	// L611, [0,1)
      }
    }
  }
  for (int v427 = 0; v427 < 512; v427 += 1) {	// L615, [28321174,33039779), iterCycle=12, II=1
    for (int v428 = 0; v428 < 3; v428 += 1) {	// L616, [8471630,8480859), iterCycle=12, II=1
      for (int v429 = 0; v429 < 3; v429 += 1) {	// L617, [8471630,8474715), iterCycle=12, II=1
        for (int v430 = 0; v430 < 64; v430 += 1) {	// L618, [8471630,8472667), iterCycle=12, II=1
          for (int v431 = 0; v431 < 4; v431 += 1) {	// L619, [8471630,8471659), iterCycle=12, II=1
            for (int v432 = 0; v432 < 4; v432 += 1) {	// L620, [8471630,8471647), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v433 = v12[v427][(v431 + v428)][(v432 + v429)];	// L621, [0,2)
              float v434 = v8[(v430 * 8)][v427][v428][v429];	// L622, [0,2)
              float v435 = v433 * v434;	// L623, [2,6)
              float v436 = v13[(v430 * 8)][v431][v432];	// L624, [4,6)
              float v437 = v435 + v436;	// L625, [6,11)
              v13[(v430 * 8)][v431][v432] = v437;	// L626, [11,12)
              float v438 = v8[((v430 * 8) + 1)][v427][v428][v429];	// L627, [0,2)
              float v439 = v433 * v438;	// L628, [2,6)
              float v440 = v13[((v430 * 8) + 1)][v431][v432];	// L629, [4,6)
              float v441 = v439 + v440;	// L630, [6,11)
              v13[((v430 * 8) + 1)][v431][v432] = v441;	// L631, [11,12)
              float v442 = v8[((v430 * 8) + 2)][v427][v428][v429];	// L632, [0,2)
              float v443 = v433 * v442;	// L633, [2,6)
              float v444 = v13[((v430 * 8) + 2)][v431][v432];	// L634, [4,6)
              float v445 = v443 + v444;	// L635, [6,11)
              v13[((v430 * 8) + 2)][v431][v432] = v445;	// L636, [11,12)
              float v446 = v8[((v430 * 8) + 3)][v427][v428][v429];	// L637, [0,2)
              float v447 = v433 * v446;	// L638, [2,6)
              float v448 = v13[((v430 * 8) + 3)][v431][v432];	// L639, [4,6)
              float v449 = v447 + v448;	// L640, [6,11)
              v13[((v430 * 8) + 3)][v431][v432] = v449;	// L641, [11,12)
              float v450 = v8[((v430 * 8) + 4)][v427][v428][v429];	// L642, [0,2)
              float v451 = v433 * v450;	// L643, [2,6)
              float v452 = v13[((v430 * 8) + 4)][v431][v432];	// L644, [4,6)
              float v453 = v451 + v452;	// L645, [6,11)
              v13[((v430 * 8) + 4)][v431][v432] = v453;	// L646, [11,12)
              float v454 = v8[((v430 * 8) + 5)][v427][v428][v429];	// L647, [0,2)
              float v455 = v433 * v454;	// L648, [2,6)
              float v456 = v13[((v430 * 8) + 5)][v431][v432];	// L649, [4,6)
              float v457 = v455 + v456;	// L650, [6,11)
              v13[((v430 * 8) + 5)][v431][v432] = v457;	// L651, [11,12)
              float v458 = v8[((v430 * 8) + 6)][v427][v428][v429];	// L652, [0,2)
              float v459 = v433 * v458;	// L653, [2,6)
              float v460 = v13[((v430 * 8) + 6)][v431][v432];	// L654, [4,6)
              float v461 = v459 + v460;	// L655, [6,11)
              v13[((v430 * 8) + 6)][v431][v432] = v461;	// L656, [11,12)
              float v462 = v8[((v430 * 8) + 7)][v427][v428][v429];	// L657, [0,2)
              float v463 = v433 * v462;	// L658, [2,6)
              float v464 = v13[((v430 * 8) + 7)][v431][v432];	// L659, [4,6)
              float v465 = v463 + v464;	// L660, [6,11)
              v13[((v430 * 8) + 7)][v431][v432] = v465;	// L661, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v466 = 0; v466 < 512; v466 += 1) {	// L668, [33039779,33069477), iterCycle=58, II=58
    for (int v467 = 0; v467 < 4; v467 += 1) {	// L669, [0,58), iterCycle=14, II=14
      for (int v468 = 0; v468 < 4; v468 += 1) {
#pragma HLS PIPELINE off
	// L670, [0,14), iterCycle=3, II=3
        float v469 = v13[v466][v467][v468];	// L671, [0,2)
        v13[v466][v467][v468] = max(v469,v0);	// L672, [2,3)
      }
    }
  }
  for (int v470 = 0; v470 < 512; v470 += 1) {	// L676, [33069477,33082791), iterCycle=26, II=26
    for (int v471 = 0; v471 < 4; v471 += 1) {	// L677, [0,26), iterCycle=6, II=6
      for (int v472 = 0; v472 < 4; v472 += 1) {	// L678, [0,6), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v14[v470][v471][v472] = v0;	// L679, [0,1)
      }
    }
  }
  for (int v473 = 0; v473 < 512; v473 += 1) {	// L683, [33082791,37801396), iterCycle=12, II=1
    for (int v474 = 0; v474 < 3; v474 += 1) {	// L684, [3710013,3719242), iterCycle=12, II=1
      for (int v475 = 0; v475 < 3; v475 += 1) {	// L685, [3710013,3713098), iterCycle=12, II=1
        for (int v476 = 0; v476 < 64; v476 += 1) {	// L686, [3710013,3711050), iterCycle=12, II=1
          for (int v477 = 0; v477 < 4; v477 += 1) {	// L687, [3710013,3710042), iterCycle=12, II=1
            for (int v478 = 0; v478 < 4; v478 += 1) {	// L688, [3710013,3710030), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v479 = v13[v473][(v477 + v474)][(v478 + v475)];	// L689, [0,2)
              float v480 = v8[(v476 * 8)][v473][v474][v475];	// L690, [0,2)
              float v481 = v479 * v480;	// L691, [2,6)
              float v482 = v14[(v476 * 8)][v477][v478];	// L692, [4,6)
              float v483 = v481 + v482;	// L693, [6,11)
              v14[(v476 * 8)][v477][v478] = v483;	// L694, [11,12)
              float v484 = v8[((v476 * 8) + 1)][v473][v474][v475];	// L695, [0,2)
              float v485 = v479 * v484;	// L696, [2,6)
              float v486 = v14[((v476 * 8) + 1)][v477][v478];	// L697, [4,6)
              float v487 = v485 + v486;	// L698, [6,11)
              v14[((v476 * 8) + 1)][v477][v478] = v487;	// L699, [11,12)
              float v488 = v8[((v476 * 8) + 2)][v473][v474][v475];	// L700, [0,2)
              float v489 = v479 * v488;	// L701, [2,6)
              float v490 = v14[((v476 * 8) + 2)][v477][v478];	// L702, [4,6)
              float v491 = v489 + v490;	// L703, [6,11)
              v14[((v476 * 8) + 2)][v477][v478] = v491;	// L704, [11,12)
              float v492 = v8[((v476 * 8) + 3)][v473][v474][v475];	// L705, [0,2)
              float v493 = v479 * v492;	// L706, [2,6)
              float v494 = v14[((v476 * 8) + 3)][v477][v478];	// L707, [4,6)
              float v495 = v493 + v494;	// L708, [6,11)
              v14[((v476 * 8) + 3)][v477][v478] = v495;	// L709, [11,12)
              float v496 = v8[((v476 * 8) + 4)][v473][v474][v475];	// L710, [0,2)
              float v497 = v479 * v496;	// L711, [2,6)
              float v498 = v14[((v476 * 8) + 4)][v477][v478];	// L712, [4,6)
              float v499 = v497 + v498;	// L713, [6,11)
              v14[((v476 * 8) + 4)][v477][v478] = v499;	// L714, [11,12)
              float v500 = v8[((v476 * 8) + 5)][v473][v474][v475];	// L715, [0,2)
              float v501 = v479 * v500;	// L716, [2,6)
              float v502 = v14[((v476 * 8) + 5)][v477][v478];	// L717, [4,6)
              float v503 = v501 + v502;	// L718, [6,11)
              v14[((v476 * 8) + 5)][v477][v478] = v503;	// L719, [11,12)
              float v504 = v8[((v476 * 8) + 6)][v473][v474][v475];	// L720, [0,2)
              float v505 = v479 * v504;	// L721, [2,6)
              float v506 = v14[((v476 * 8) + 6)][v477][v478];	// L722, [4,6)
              float v507 = v505 + v506;	// L723, [6,11)
              v14[((v476 * 8) + 6)][v477][v478] = v507;	// L724, [11,12)
              float v508 = v8[((v476 * 8) + 7)][v473][v474][v475];	// L725, [0,2)
              float v509 = v479 * v508;	// L726, [2,6)
              float v510 = v14[((v476 * 8) + 7)][v477][v478];	// L727, [4,6)
              float v511 = v509 + v510;	// L728, [6,11)
              v14[((v476 * 8) + 7)][v477][v478] = v511;	// L729, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v512 = 0; v512 < 512; v512 += 1) {	// L736, [37801396,37831094), iterCycle=58, II=58
    for (int v513 = 0; v513 < 4; v513 += 1) {	// L737, [0,58), iterCycle=14, II=14
      for (int v514 = 0; v514 < 4; v514 += 1) {
#pragma HLS PIPELINE off
	// L738, [0,14), iterCycle=3, II=3
        float v515 = v14[v512][v513][v514];	// L739, [0,2)
        v14[v512][v513][v514] = max(v515,v0);	// L740, [2,3)
      }
    }
  }
  for (int v516 = 0; v516 < 512; v516 += 1) {	// L744, [37831094,37836216), iterCycle=10, II=10
    for (int v517 = 0; v517 < 2; v517 += 1) {	// L745, [0,10), iterCycle=4, II=4
      for (int v518 = 0; v518 < 2; v518 += 1) {	// L746, [0,4), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v15[v516][v517][v518] = v0;	// L747, [0,1)
      }
    }
  }
  for (int v519 = 0; v519 < 512; v519 += 1) {	// L751, [37836216,37910970), iterCycle=146, II=146
    for (int v520 = 0; v520 < 2; v520 += 1) {	// L752, [0,146), iterCycle=72, II=72
      for (int v521 = 0; v521 < 2; v521 += 1) {	// L753, [0,72), iterCycle=35, II=35
        for (int v522 = 0; v522 < 3; v522 += 1) {	// L754, [0,35), iterCycle=11, II=11
          for (int v523 = 0; v523 < 3; v523 += 1) {
#pragma HLS PIPELINE off
	// L755, [0,11), iterCycle=3, II=3
            float v524 = v14[v519][((v520 * 2) + v522)][((v521 * 2) + v523)];	// L756, [0,2)
            v15[v519][v520][v521] = max(v524,v15[v519][v520][v521]);	// L757, [2,3)
          }
        }
      }
    }
  }
  for (int v525 = 0; v525 < 512; v525 += 1) {	// L763, [37910970,37916092), iterCycle=10, II=10
    for (int v526 = 0; v526 < 2; v526 += 1) {	// L764, [0,10), iterCycle=4, II=4
      for (int v527 = 0; v527 < 2; v527 += 1) {	// L765, [0,4), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v16[v525][v526][v527] = v0;	// L766, [0,1)
      }
    }
  }
  for (int v528 = 0; v528 < 512; v528 += 1) {	// L770, [37916092,39095753), iterCycle=12, II=1
    for (int v529 = 0; v529 < 3; v529 += 1) {	// L771, [2415656,2417973), iterCycle=12, II=1
      for (int v530 = 0; v530 < 3; v530 += 1) {	// L772, [2415656,2416437), iterCycle=12, II=1
        for (int v531 = 0; v531 < 64; v531 += 1) {	// L773, [2415656,2415925), iterCycle=12, II=1
          for (int v532 = 0; v532 < 2; v532 += 1) {	// L774, [2415656,2415673), iterCycle=12, II=1
            for (int v533 = 0; v533 < 2; v533 += 1) {	// L775, [2415656,2415671), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v534 = v15[v528][(v532 + v529)][(v533 + v530)];	// L776, [0,2)
              float v535 = v9[(v531 * 8)][v528][v529][v530];	// L777, [0,2)
              float v536 = v534 * v535;	// L778, [2,6)
              float v537 = v16[(v531 * 8)][v532][v533];	// L779, [4,6)
              float v538 = v536 + v537;	// L780, [6,11)
              v16[(v531 * 8)][v532][v533] = v538;	// L781, [11,12)
              float v539 = v9[((v531 * 8) + 1)][v528][v529][v530];	// L782, [0,2)
              float v540 = v534 * v539;	// L783, [2,6)
              float v541 = v16[((v531 * 8) + 1)][v532][v533];	// L784, [4,6)
              float v542 = v540 + v541;	// L785, [6,11)
              v16[((v531 * 8) + 1)][v532][v533] = v542;	// L786, [11,12)
              float v543 = v9[((v531 * 8) + 2)][v528][v529][v530];	// L787, [0,2)
              float v544 = v534 * v543;	// L788, [2,6)
              float v545 = v16[((v531 * 8) + 2)][v532][v533];	// L789, [4,6)
              float v546 = v544 + v545;	// L790, [6,11)
              v16[((v531 * 8) + 2)][v532][v533] = v546;	// L791, [11,12)
              float v547 = v9[((v531 * 8) + 3)][v528][v529][v530];	// L792, [0,2)
              float v548 = v534 * v547;	// L793, [2,6)
              float v549 = v16[((v531 * 8) + 3)][v532][v533];	// L794, [4,6)
              float v550 = v548 + v549;	// L795, [6,11)
              v16[((v531 * 8) + 3)][v532][v533] = v550;	// L796, [11,12)
              float v551 = v9[((v531 * 8) + 4)][v528][v529][v530];	// L797, [0,2)
              float v552 = v534 * v551;	// L798, [2,6)
              float v553 = v16[((v531 * 8) + 4)][v532][v533];	// L799, [4,6)
              float v554 = v552 + v553;	// L800, [6,11)
              v16[((v531 * 8) + 4)][v532][v533] = v554;	// L801, [11,12)
              float v555 = v9[((v531 * 8) + 5)][v528][v529][v530];	// L802, [0,2)
              float v556 = v534 * v555;	// L803, [2,6)
              float v557 = v16[((v531 * 8) + 5)][v532][v533];	// L804, [4,6)
              float v558 = v556 + v557;	// L805, [6,11)
              v16[((v531 * 8) + 5)][v532][v533] = v558;	// L806, [11,12)
              float v559 = v9[((v531 * 8) + 6)][v528][v529][v530];	// L807, [0,2)
              float v560 = v534 * v559;	// L808, [2,6)
              float v561 = v16[((v531 * 8) + 6)][v532][v533];	// L809, [4,6)
              float v562 = v560 + v561;	// L810, [6,11)
              v16[((v531 * 8) + 6)][v532][v533] = v562;	// L811, [11,12)
              float v563 = v9[((v531 * 8) + 7)][v528][v529][v530];	// L812, [0,2)
              float v564 = v534 * v563;	// L813, [2,6)
              float v565 = v16[((v531 * 8) + 7)][v532][v533];	// L814, [4,6)
              float v566 = v564 + v565;	// L815, [6,11)
              v16[((v531 * 8) + 7)][v532][v533] = v566;	// L816, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v567 = 0; v567 < 512; v567 += 1) {	// L823, [39095753,39104971), iterCycle=18, II=18
    for (int v568 = 0; v568 < 2; v568 += 1) {	// L824, [0,18), iterCycle=8, II=8
      for (int v569 = 0; v569 < 2; v569 += 1) {
#pragma HLS PIPELINE off
	// L825, [0,8), iterCycle=3, II=3
        float v570 = v16[v567][v568][v569];	// L826, [0,2)
        v16[v567][v568][v569] = max(v570,v0);	// L827, [2,3)
      }
    }
  }
  for (int v571 = 0; v571 < 512; v571 += 1) {	// L831, [39104971,39110093), iterCycle=10, II=10
    for (int v572 = 0; v572 < 2; v572 += 1) {	// L832, [0,10), iterCycle=4, II=4
      for (int v573 = 0; v573 < 2; v573 += 1) {	// L833, [0,4), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v17[v571][v572][v573] = v0;	// L834, [0,1)
      }
    }
  }
  for (int v574 = 0; v574 < 512; v574 += 1) {	// L838, [39110093,40289754), iterCycle=12, II=1
    for (int v575 = 0; v575 < 3; v575 += 1) {	// L839, [1221655,1223972), iterCycle=12, II=1
      for (int v576 = 0; v576 < 3; v576 += 1) {	// L840, [1221655,1222436), iterCycle=12, II=1
        for (int v577 = 0; v577 < 64; v577 += 1) {	// L841, [1221655,1221924), iterCycle=12, II=1
          for (int v578 = 0; v578 < 2; v578 += 1) {	// L842, [1221655,1221672), iterCycle=12, II=1
            for (int v579 = 0; v579 < 2; v579 += 1) {	// L843, [1221655,1221670), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v580 = v16[v574][(v578 + v575)][(v579 + v576)];	// L844, [0,2)
              float v581 = v9[(v577 * 8)][v574][v575][v576];	// L845, [0,2)
              float v582 = v580 * v581;	// L846, [2,6)
              float v583 = v17[(v577 * 8)][v578][v579];	// L847, [4,6)
              float v584 = v582 + v583;	// L848, [6,11)
              v17[(v577 * 8)][v578][v579] = v584;	// L849, [11,12)
              float v585 = v9[((v577 * 8) + 1)][v574][v575][v576];	// L850, [0,2)
              float v586 = v580 * v585;	// L851, [2,6)
              float v587 = v17[((v577 * 8) + 1)][v578][v579];	// L852, [4,6)
              float v588 = v586 + v587;	// L853, [6,11)
              v17[((v577 * 8) + 1)][v578][v579] = v588;	// L854, [11,12)
              float v589 = v9[((v577 * 8) + 2)][v574][v575][v576];	// L855, [0,2)
              float v590 = v580 * v589;	// L856, [2,6)
              float v591 = v17[((v577 * 8) + 2)][v578][v579];	// L857, [4,6)
              float v592 = v590 + v591;	// L858, [6,11)
              v17[((v577 * 8) + 2)][v578][v579] = v592;	// L859, [11,12)
              float v593 = v9[((v577 * 8) + 3)][v574][v575][v576];	// L860, [0,2)
              float v594 = v580 * v593;	// L861, [2,6)
              float v595 = v17[((v577 * 8) + 3)][v578][v579];	// L862, [4,6)
              float v596 = v594 + v595;	// L863, [6,11)
              v17[((v577 * 8) + 3)][v578][v579] = v596;	// L864, [11,12)
              float v597 = v9[((v577 * 8) + 4)][v574][v575][v576];	// L865, [0,2)
              float v598 = v580 * v597;	// L866, [2,6)
              float v599 = v17[((v577 * 8) + 4)][v578][v579];	// L867, [4,6)
              float v600 = v598 + v599;	// L868, [6,11)
              v17[((v577 * 8) + 4)][v578][v579] = v600;	// L869, [11,12)
              float v601 = v9[((v577 * 8) + 5)][v574][v575][v576];	// L870, [0,2)
              float v602 = v580 * v601;	// L871, [2,6)
              float v603 = v17[((v577 * 8) + 5)][v578][v579];	// L872, [4,6)
              float v604 = v602 + v603;	// L873, [6,11)
              v17[((v577 * 8) + 5)][v578][v579] = v604;	// L874, [11,12)
              float v605 = v9[((v577 * 8) + 6)][v574][v575][v576];	// L875, [0,2)
              float v606 = v580 * v605;	// L876, [2,6)
              float v607 = v17[((v577 * 8) + 6)][v578][v579];	// L877, [4,6)
              float v608 = v606 + v607;	// L878, [6,11)
              v17[((v577 * 8) + 6)][v578][v579] = v608;	// L879, [11,12)
              float v609 = v9[((v577 * 8) + 7)][v574][v575][v576];	// L880, [0,2)
              float v610 = v580 * v609;	// L881, [2,6)
              float v611 = v17[((v577 * 8) + 7)][v578][v579];	// L882, [4,6)
              float v612 = v610 + v611;	// L883, [6,11)
              v17[((v577 * 8) + 7)][v578][v579] = v612;	// L884, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v613 = 0; v613 < 512; v613 += 1) {	// L891, [40289754,40298972), iterCycle=18, II=18
    for (int v614 = 0; v614 < 2; v614 += 1) {	// L892, [0,18), iterCycle=8, II=8
      for (int v615 = 0; v615 < 2; v615 += 1) {
#pragma HLS PIPELINE off
	// L893, [0,8), iterCycle=3, II=3
        float v616 = v17[v613][v614][v615];	// L894, [0,2)
        v17[v613][v614][v615] = max(v616,v0);	// L895, [2,3)
      }
    }
  }
  for (int v617 = 0; v617 < 512; v617 += 1) {	// L899, [40298972,40304094), iterCycle=10, II=10
    for (int v618 = 0; v618 < 2; v618 += 1) {	// L900, [0,10), iterCycle=4, II=4
      for (int v619 = 0; v619 < 2; v619 += 1) {	// L901, [0,4), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v18[v617][v618][v619] = v0;	// L902, [0,1)
      }
    }
  }
  for (int v620 = 0; v620 < 512; v620 += 1) {	// L906, [40304094,41483755), iterCycle=12, II=1
    for (int v621 = 0; v621 < 3; v621 += 1) {	// L907, [27654,29971), iterCycle=12, II=1
      for (int v622 = 0; v622 < 3; v622 += 1) {	// L908, [27654,28435), iterCycle=12, II=1
        for (int v623 = 0; v623 < 64; v623 += 1) {	// L909, [27654,27923), iterCycle=12, II=1
          for (int v624 = 0; v624 < 2; v624 += 1) {	// L910, [27654,27671), iterCycle=12, II=1
            for (int v625 = 0; v625 < 2; v625 += 1) {	// L911, [27654,27669), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v626 = v17[v620][(v624 + v621)][(v625 + v622)];	// L912, [0,2)
              float v627 = v9[(v623 * 8)][v620][v621][v622];	// L913, [0,2)
              float v628 = v626 * v627;	// L914, [2,6)
              float v629 = v18[(v623 * 8)][v624][v625];	// L915, [4,6)
              float v630 = v628 + v629;	// L916, [6,11)
              v18[(v623 * 8)][v624][v625] = v630;	// L917, [11,12)
              float v631 = v9[((v623 * 8) + 1)][v620][v621][v622];	// L918, [0,2)
              float v632 = v626 * v631;	// L919, [2,6)
              float v633 = v18[((v623 * 8) + 1)][v624][v625];	// L920, [4,6)
              float v634 = v632 + v633;	// L921, [6,11)
              v18[((v623 * 8) + 1)][v624][v625] = v634;	// L922, [11,12)
              float v635 = v9[((v623 * 8) + 2)][v620][v621][v622];	// L923, [0,2)
              float v636 = v626 * v635;	// L924, [2,6)
              float v637 = v18[((v623 * 8) + 2)][v624][v625];	// L925, [4,6)
              float v638 = v636 + v637;	// L926, [6,11)
              v18[((v623 * 8) + 2)][v624][v625] = v638;	// L927, [11,12)
              float v639 = v9[((v623 * 8) + 3)][v620][v621][v622];	// L928, [0,2)
              float v640 = v626 * v639;	// L929, [2,6)
              float v641 = v18[((v623 * 8) + 3)][v624][v625];	// L930, [4,6)
              float v642 = v640 + v641;	// L931, [6,11)
              v18[((v623 * 8) + 3)][v624][v625] = v642;	// L932, [11,12)
              float v643 = v9[((v623 * 8) + 4)][v620][v621][v622];	// L933, [0,2)
              float v644 = v626 * v643;	// L934, [2,6)
              float v645 = v18[((v623 * 8) + 4)][v624][v625];	// L935, [4,6)
              float v646 = v644 + v645;	// L936, [6,11)
              v18[((v623 * 8) + 4)][v624][v625] = v646;	// L937, [11,12)
              float v647 = v9[((v623 * 8) + 5)][v620][v621][v622];	// L938, [0,2)
              float v648 = v626 * v647;	// L939, [2,6)
              float v649 = v18[((v623 * 8) + 5)][v624][v625];	// L940, [4,6)
              float v650 = v648 + v649;	// L941, [6,11)
              v18[((v623 * 8) + 5)][v624][v625] = v650;	// L942, [11,12)
              float v651 = v9[((v623 * 8) + 6)][v620][v621][v622];	// L943, [0,2)
              float v652 = v626 * v651;	// L944, [2,6)
              float v653 = v18[((v623 * 8) + 6)][v624][v625];	// L945, [4,6)
              float v654 = v652 + v653;	// L946, [6,11)
              v18[((v623 * 8) + 6)][v624][v625] = v654;	// L947, [11,12)
              float v655 = v9[((v623 * 8) + 7)][v620][v621][v622];	// L948, [0,2)
              float v656 = v626 * v655;	// L949, [2,6)
              float v657 = v18[((v623 * 8) + 7)][v624][v625];	// L950, [4,6)
              float v658 = v656 + v657;	// L951, [6,11)
              v18[((v623 * 8) + 7)][v624][v625] = v658;	// L952, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v659 = 0; v659 < 512; v659 += 1) {	// L959, [41483755,41492973), iterCycle=18, II=18
    for (int v660 = 0; v660 < 2; v660 += 1) {	// L960, [0,18), iterCycle=8, II=8
      for (int v661 = 0; v661 < 2; v661 += 1) {
#pragma HLS PIPELINE off
	// L961, [0,8), iterCycle=3, II=3
        float v662 = v18[v659][v660][v661];	// L962, [0,2)
        v18[v659][v660][v661] = max(v662,v0);	// L963, [2,3)
      }
    }
  }
  for (int v663 = 0; v663 < 512; v663 += 1) {	// L967, [41492973,41493487), iterCycle=1, II=1
    #pragma HLS PIPELINE off
    v19[v663] = v0;	// L968, [0,1)
  }
  for (int v664 = 0; v664 < 512; v664 += 1) {	// L970, [41493487,41511409), iterCycle=35, II=35
    for (int v665 = 0; v665 < 3; v665 += 1) {	// L971, [0,35), iterCycle=11, II=11
      for (int v666 = 0; v666 < 3; v666 += 1) {
      #pragma HLS PIPELINE off
	// L972, [0,11), iterCycle=3, II=3
        float v667 = v18[v664][(v665 + 2)][(v666 + 2)];	// L973, [0,2)
        v19[v664] = max(v667,v19[v664]);	// L974, [2,3)
      }
    }
  }
}

