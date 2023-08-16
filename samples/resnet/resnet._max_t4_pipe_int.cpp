
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
/// Latency=219345081, interval=219345081
/// DSP=20, BRAM=0
void resnet(
  float v0,
  float v1[64][3][3][3],
  float v2[64][64][3][3],
  float v3[128][64][3][3],
  float v4[128][128][3][3],
  float v5[256][128][3][3],
  float v6[256][256][3][3],
  float v7[512][256][3][3],
  float v8[512][512][3][3],
  float v9[64][32][32],
  float v10[128][16][16],
  float v11[128][16][16],
  float v12[128][16][16],
  float v13[128][16][16],
  float v14[128][16][16],
  float v15[256][8][8],
  float v16[256][8][8],
  float v17[256][8][8],
  float v18[256][8][8],
  float v19[256][8][8],
  float v20[64][32][32],
  float v21[256][8][8],
  float v22[256][8][8],
  float v23[512][4][4],
  float v24[512][4][4],
  float v25[512][4][4],
  float v26[512][4][4],
  float v27[512][4][4],
  float v28[512][4][4],
  float v29[512][4][4],
  float v30[64][32][32],
  float v31[64][32][32],
  float v32[64][32][32],
  float v33[64][32][32],
  float v34[64][32][32],
  float v35[128][16][16],
  float v36[128][16][16],
  float v37[3][32][32],
  float v38[128][64],
  float v39[256][128],
  float v40[512][256]
) {	// L6, [0,219345081)
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
  #pragma HLS interface bram port=v29
  #pragma HLS interface bram port=v30
  #pragma HLS interface bram port=v31
  #pragma HLS interface bram port=v32
  #pragma HLS interface bram port=v33
  #pragma HLS interface bram port=v34
  #pragma HLS interface bram port=v35
  #pragma HLS interface bram port=v36
  #pragma HLS interface bram port=v37
  #pragma HLS interface bram port=v38
  #pragma HLS interface bram port=v39
  #pragma HLS interface bram port=v40

  #pragma HLS array_partition variable=v1 cyclic factor=4 dim=1
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=4 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=4 dim=1
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=4 dim=1
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS array_partition variable=v5 cyclic factor=4 dim=1
  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS array_partition variable=v6 cyclic factor=4 dim=1
  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS array_partition variable=v7 cyclic factor=4 dim=1
  #pragma HLS resource variable=v7 core=ram_s2p_bram

  #pragma HLS array_partition variable=v8 cyclic factor=4 dim=1
  #pragma HLS resource variable=v8 core=ram_s2p_bram

  #pragma HLS array_partition variable=v9 cyclic factor=4 dim=1
  #pragma HLS resource variable=v9 core=ram_s2p_bram

  #pragma HLS resource variable=v10 core=ram_s2p_bram

  #pragma HLS resource variable=v11 core=ram_s2p_bram

  #pragma HLS array_partition variable=v12 cyclic factor=4 dim=1
  #pragma HLS resource variable=v12 core=ram_s2p_bram

  #pragma HLS array_partition variable=v13 cyclic factor=4 dim=1
  #pragma HLS resource variable=v13 core=ram_s2p_bram

  #pragma HLS resource variable=v14 core=ram_s2p_bram

  #pragma HLS array_partition variable=v15 cyclic factor=4 dim=1
  #pragma HLS resource variable=v15 core=ram_s2p_bram

  #pragma HLS array_partition variable=v16 cyclic factor=4 dim=1
  #pragma HLS resource variable=v16 core=ram_s2p_bram

  #pragma HLS resource variable=v17 core=ram_s2p_bram

  #pragma HLS resource variable=v18 core=ram_s2p_bram

  #pragma HLS array_partition variable=v19 cyclic factor=4 dim=1
  #pragma HLS resource variable=v19 core=ram_s2p_bram

  #pragma HLS array_partition variable=v20 cyclic factor=4 dim=1
  #pragma HLS resource variable=v20 core=ram_s2p_bram

  #pragma HLS array_partition variable=v21 cyclic factor=4 dim=1
  #pragma HLS resource variable=v21 core=ram_s2p_bram

  #pragma HLS resource variable=v22 core=ram_s2p_bram

  #pragma HLS array_partition variable=v23 cyclic factor=4 dim=1
  #pragma HLS resource variable=v23 core=ram_s2p_bram

  #pragma HLS array_partition variable=v24 cyclic factor=4 dim=1
  #pragma HLS resource variable=v24 core=ram_s2p_bram

  #pragma HLS resource variable=v25 core=ram_s2p_bram

  #pragma HLS resource variable=v26 core=ram_s2p_bram

  #pragma HLS array_partition variable=v27 cyclic factor=4 dim=1
  #pragma HLS resource variable=v27 core=ram_s2p_bram

  #pragma HLS array_partition variable=v28 cyclic factor=4 dim=1
  #pragma HLS resource variable=v28 core=ram_s2p_bram

  #pragma HLS resource variable=v29 core=ram_s2p_bram

  #pragma HLS array_partition variable=v30 cyclic factor=4 dim=1
  #pragma HLS resource variable=v30 core=ram_s2p_bram

  #pragma HLS resource variable=v31 core=ram_s2p_bram

  #pragma HLS array_partition variable=v32 cyclic factor=4 dim=1
  #pragma HLS resource variable=v32 core=ram_s2p_bram

  #pragma HLS array_partition variable=v33 cyclic factor=4 dim=1
  #pragma HLS resource variable=v33 core=ram_s2p_bram

  #pragma HLS resource variable=v34 core=ram_s2p_bram

  #pragma HLS array_partition variable=v35 cyclic factor=4 dim=1
  #pragma HLS resource variable=v35 core=ram_s2p_bram

  #pragma HLS array_partition variable=v36 cyclic factor=4 dim=1
  #pragma HLS resource variable=v36 core=ram_s2p_bram

  #pragma HLS resource variable=v37 core=ram_s2p_bram

  #pragma HLS resource variable=v38 core=ram_s2p_bram

  #pragma HLS resource variable=v39 core=ram_s2p_bram

  #pragma HLS resource variable=v40 core=ram_s2p_bram

  for (int v41 = 0; v41 < 64; v41 += 1) {	// L7, [0,69762), iterCycle=1090, II=1090
    for (int v42 = 0; v42 < 32; v42 += 1) {	// L8, [0,1090), iterCycle=34, II=34
      for (int v43 = 0; v43 < 32; v43 += 1) {	// L9, [0,34), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v9[v41][v42][v43] = v0;	// L10, [0,1)
      }
    }
  }
  for (int v44 = 0; v44 < 3; v44 += 1) {	// L14, [69762,512143), iterCycle=12, II=1
    for (int v45 = 0; v45 < 3; v45 += 1) {	// L15, [218832936,218980405), iterCycle=12, II=1
      for (int v46 = 0; v46 < 3; v46 += 1) {	// L16, [218832936,218882101), iterCycle=12, II=1
        for (int v47 = 0; v47 < 16; v47 += 1) {	// L17, [218832936,218849333), iterCycle=12, II=1
          for (int v48 = 0; v48 < 32; v48 += 1) {	// L18, [218832936,218833973), iterCycle=12, II=1
            for (int v49 = 0; v49 < 32; v49 += 1) {	// L19, [218832936,218832981), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v50 = v37[v44][(v48 + v45)][(v49 + v46)];	// L20, [0,2)
              float v51 = v1[(v47 * 4)][v44][v45][v46];	// L21, [0,2)
              float v52 = v50 * v51;	// L22, [2,6)
              float v53 = v9[(v47 * 4)][v48][v49];	// L23, [4,6)
              float v54 = v52 + v53;	// L24, [6,11)
              v9[(v47 * 4)][v48][v49] = v54;	// L25, [11,12)
              float v55 = v1[((v47 * 4) + 1)][v44][v45][v46];	// L26, [0,2)
              float v56 = v50 * v55;	// L27, [2,6)
              float v57 = v9[((v47 * 4) + 1)][v48][v49];	// L28, [4,6)
              float v58 = v56 + v57;	// L29, [6,11)
              v9[((v47 * 4) + 1)][v48][v49] = v58;	// L30, [11,12)
              float v59 = v1[((v47 * 4) + 2)][v44][v45][v46];	// L31, [0,2)
              float v60 = v50 * v59;	// L32, [2,6)
              float v61 = v9[((v47 * 4) + 2)][v48][v49];	// L33, [4,6)
              float v62 = v60 + v61;	// L34, [6,11)
              v9[((v47 * 4) + 2)][v48][v49] = v62;	// L35, [11,12)
              float v63 = v1[((v47 * 4) + 3)][v44][v45][v46];	// L36, [0,2)
              float v64 = v50 * v63;	// L37, [2,6)
              float v65 = v9[((v47 * 4) + 3)][v48][v49];	// L38, [4,6)
              float v66 = v64 + v65;	// L39, [6,11)
              v9[((v47 * 4) + 3)][v48][v49] = v66;	// L40, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v67 = 0; v67 < 64; v67 += 1) {	// L47, [512143,712977), iterCycle=3138, II=3138
    for (int v68 = 0; v68 < 32; v68 += 1) {	// L48, [0,3138), iterCycle=98, II=98
      for (int v69 = 0; v69 < 32; v69 += 1) {	// L49, [0,98), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v70 = v9[v67][v68][v69];	// L50, [0,2)
        v9[v67][v68][v69] = max(v70, v0);	// L51, [2,3)
      }
    }
  }
  for (int v71 = 0; v71 < 64; v71 += 1) {	// L55, [712977,782739), iterCycle=1090, II=1090
    for (int v72 = 0; v72 < 32; v72 += 1) {	// L56, [0,1090), iterCycle=34, II=34
      for (int v73 = 0; v73 < 32; v73 += 1) {	// L57, [0,34), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v20[v71][v72][v73] = v0;	// L58, [0,1)
      }
    }
  }
  for (int v74 = 0; v74 < 64; v74 += 1) {	// L62, [782739,10219936), iterCycle=12, II=1
    for (int v75 = 0; v75 < 3; v75 += 1) {	// L63, [209125143,209272612), iterCycle=12, II=1
      for (int v76 = 0; v76 < 3; v76 += 1) {	// L64, [209125143,209174308), iterCycle=12, II=1
        for (int v77 = 0; v77 < 16; v77 += 1) {	// L65, [209125143,209141540), iterCycle=12, II=1
          for (int v78 = 0; v78 < 32; v78 += 1) {	// L66, [209125143,209126180), iterCycle=12, II=1
            for (int v79 = 0; v79 < 32; v79 += 1) {	// L67, [209125143,209125188), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v80 = v9[v74][(v78 + v75)][(v79 + v76)];	// L68, [0,2)
              float v81 = v2[(v77 * 4)][v74][v75][v76];	// L69, [0,2)
              float v82 = v80 * v81;	// L70, [2,6)
              float v83 = v20[(v77 * 4)][v78][v79];	// L71, [4,6)
              float v84 = v82 + v83;	// L72, [6,11)
              v20[(v77 * 4)][v78][v79] = v84;	// L73, [11,12)
              float v85 = v2[((v77 * 4) + 1)][v74][v75][v76];	// L74, [0,2)
              float v86 = v80 * v85;	// L75, [2,6)
              float v87 = v20[((v77 * 4) + 1)][v78][v79];	// L76, [4,6)
              float v88 = v86 + v87;	// L77, [6,11)
              v20[((v77 * 4) + 1)][v78][v79] = v88;	// L78, [11,12)
              float v89 = v2[((v77 * 4) + 2)][v74][v75][v76];	// L79, [0,2)
              float v90 = v80 * v89;	// L80, [2,6)
              float v91 = v20[((v77 * 4) + 2)][v78][v79];	// L81, [4,6)
              float v92 = v90 + v91;	// L82, [6,11)
              v20[((v77 * 4) + 2)][v78][v79] = v92;	// L83, [11,12)
              float v93 = v2[((v77 * 4) + 3)][v74][v75][v76];	// L84, [0,2)
              float v94 = v80 * v93;	// L85, [2,6)
              float v95 = v20[((v77 * 4) + 3)][v78][v79];	// L86, [4,6)
              float v96 = v94 + v95;	// L87, [6,11)
              v20[((v77 * 4) + 3)][v78][v79] = v96;	// L88, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v97 = 0; v97 < 64; v97 += 1) {	// L95, [10219936,10420770), iterCycle=3138, II=3138
    for (int v98 = 0; v98 < 32; v98 += 1) {	// L96, [0,3138), iterCycle=98, II=98
      for (int v99 = 0; v99 < 32; v99 += 1) {	// L97, [0,98), iterCycle=3, II=3 
        #pragma HLS PIPELINE off
        float v100 = v20[v97][v98][v99];	// L98, [0,2)
        v20[v97][v98][v99] = max(v100, v0);	// L99, [2,3)
      }
    }
  }
  for (int v101 = 0; v101 < 64; v101 += 1) {	// L103, [10420770,10490532), iterCycle=1090, II=1090
    for (int v102 = 0; v102 < 32; v102 += 1) {	// L104, [0,1090), iterCycle=34, II=34
      for (int v103 = 0; v103 < 32; v103 += 1) {	// L105, [0,34), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v30[v101][v102][v103] = v0;	// L106, [0,1)
      }
    }
  }
  for (int v104 = 0; v104 < 64; v104 += 1) {	// L110, [10490532,19927729), iterCycle=12, II=1
    for (int v105 = 0; v105 < 3; v105 += 1) {	// L111, [199417350,199564819), iterCycle=12, II=1
      for (int v106 = 0; v106 < 3; v106 += 1) {	// L112, [199417350,199466515), iterCycle=12, II=1
        for (int v107 = 0; v107 < 16; v107 += 1) {	// L113, [199417350,199433747), iterCycle=12, II=1
          for (int v108 = 0; v108 < 32; v108 += 1) {	// L114, [199417350,199418387), iterCycle=12, II=1
            for (int v109 = 0; v109 < 32; v109 += 1) {	// L115, [199417350,199417395), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v110 = v20[v104][(v108 + v105)][(v109 + v106)];	// L116, [0,2)
              float v111 = v2[(v107 * 4)][v104][v105][v106];	// L117, [0,2)
              float v112 = v110 * v111;	// L118, [2,6)
              float v113 = v30[(v107 * 4)][v108][v109];	// L119, [4,6)
              float v114 = v112 + v113;	// L120, [6,11)
              v30[(v107 * 4)][v108][v109] = v114;	// L121, [11,12)
              float v115 = v2[((v107 * 4) + 1)][v104][v105][v106];	// L122, [0,2)
              float v116 = v110 * v115;	// L123, [2,6)
              float v117 = v30[((v107 * 4) + 1)][v108][v109];	// L124, [4,6)
              float v118 = v116 + v117;	// L125, [6,11)
              v30[((v107 * 4) + 1)][v108][v109] = v118;	// L126, [11,12)
              float v119 = v2[((v107 * 4) + 2)][v104][v105][v106];	// L127, [0,2)
              float v120 = v110 * v119;	// L128, [2,6)
              float v121 = v30[((v107 * 4) + 2)][v108][v109];	// L129, [4,6)
              float v122 = v120 + v121;	// L130, [6,11)
              v30[((v107 * 4) + 2)][v108][v109] = v122;	// L131, [11,12)
              float v123 = v2[((v107 * 4) + 3)][v104][v105][v106];	// L132, [0,2)
              float v124 = v110 * v123;	// L133, [2,6)
              float v125 = v30[((v107 * 4) + 3)][v108][v109];	// L134, [4,6)
              float v126 = v124 + v125;	// L135, [6,11)
              v30[((v107 * 4) + 3)][v108][v109] = v126;	// L136, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v127 = 0; v127 < 64; v127 += 1) {	// L143, [19927729,20456243), iterCycle=8258, II=8258
    for (int v128 = 0; v128 < 32; v128 += 1) {	// L144, [0,8258), iterCycle=258, II=258
      for (int v129 = 0; v129 < 32; v129 += 1) {	// L145, [0,258), iterCycle=8, II=8
      #pragma HLS PIPELINE off
        float v130 = v30[v127][v128][v129];	// L146, [0,2)
        float v131 = v9[v127][v128][v129];	// L147, [0,2)
        float v132 = v130 + v131;	// L148, [2,7)
        v31[v127][v128][v129] = v132;	// L149, [7,8)
      }
    }
  }
  for (int v133 = 0; v133 < 64; v133 += 1) {	// L153, [20456243,20657077), iterCycle=3138, II=3138
    for (int v134 = 0; v134 < 32; v134 += 1) {	// L154, [0,3138), iterCycle=98, II=98
      for (int v135 = 0; v135 < 32; v135 += 1) {	// L155, [0,98), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v136 = v31[v133][v134][v135];	// L156, [0,2)
        v31[v133][v134][v135] = max(v136, v0);	// L157, [2,3)
      }
    }
  }
  for (int v137 = 0; v137 < 64; v137 += 1) {	// L161, [20657077,20726839), iterCycle=1090, II=1090
    for (int v138 = 0; v138 < 32; v138 += 1) {	// L162, [0,1090), iterCycle=34, II=34
      for (int v139 = 0; v139 < 32; v139 += 1) {	// L163, [0,34), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v32[v137][v138][v139] = v0;	// L164, [0,1)
      }
    }
  }
  for (int v140 = 0; v140 < 64; v140 += 1) {	// L168, [20726839,30164036), iterCycle=12, II=1
    for (int v141 = 0; v141 < 3; v141 += 1) {	// L169, [189181043,189328512), iterCycle=12, II=1
      for (int v142 = 0; v142 < 3; v142 += 1) {	// L170, [189181043,189230208), iterCycle=12, II=1
        for (int v143 = 0; v143 < 16; v143 += 1) {	// L171, [189181043,189197440), iterCycle=12, II=1
          for (int v144 = 0; v144 < 32; v144 += 1) {	// L172, [189181043,189182080), iterCycle=12, II=1
            for (int v145 = 0; v145 < 32; v145 += 1) {	// L173, [189181043,189181088), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v146 = v31[v140][(v144 + v141)][(v145 + v142)];	// L174, [0,2)
              float v147 = v2[(v143 * 4)][v140][v141][v142];	// L175, [0,2)
              float v148 = v146 * v147;	// L176, [2,6)
              float v149 = v32[(v143 * 4)][v144][v145];	// L177, [4,6)
              float v150 = v148 + v149;	// L178, [6,11)
              v32[(v143 * 4)][v144][v145] = v150;	// L179, [11,12)
              float v151 = v2[((v143 * 4) + 1)][v140][v141][v142];	// L180, [0,2)
              float v152 = v146 * v151;	// L181, [2,6)
              float v153 = v32[((v143 * 4) + 1)][v144][v145];	// L182, [4,6)
              float v154 = v152 + v153;	// L183, [6,11)
              v32[((v143 * 4) + 1)][v144][v145] = v154;	// L184, [11,12)
              float v155 = v2[((v143 * 4) + 2)][v140][v141][v142];	// L185, [0,2)
              float v156 = v146 * v155;	// L186, [2,6)
              float v157 = v32[((v143 * 4) + 2)][v144][v145];	// L187, [4,6)
              float v158 = v156 + v157;	// L188, [6,11)
              v32[((v143 * 4) + 2)][v144][v145] = v158;	// L189, [11,12)
              float v159 = v2[((v143 * 4) + 3)][v140][v141][v142];	// L190, [0,2)
              float v160 = v146 * v159;	// L191, [2,6)
              float v161 = v32[((v143 * 4) + 3)][v144][v145];	// L192, [4,6)
              float v162 = v160 + v161;	// L193, [6,11)
              v32[((v143 * 4) + 3)][v144][v145] = v162;	// L194, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v163 = 0; v163 < 64; v163 += 1) {	// L201, [30164036,30364870), iterCycle=3138, II=3138
    for (int v164 = 0; v164 < 32; v164 += 1) {	// L202, [0,3138), iterCycle=98, II=98
      for (int v165 = 0; v165 < 32; v165 += 1) {	// L203, [0,98), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v166 = v32[v163][v164][v165];	// L204, [0,2)
        v32[v163][v164][v165] = max(v166, v0);	// L205, [2,3)
      }
    }
  }
  for (int v167 = 0; v167 < 64; v167 += 1) {	// L209, [30364870,30434632), iterCycle=1090, II=1090
    for (int v168 = 0; v168 < 32; v168 += 1) {	// L210, [0,1090), iterCycle=34, II=34
      for (int v169 = 0; v169 < 32; v169 += 1) {	// L211, [0,34), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v33[v167][v168][v169] = v0;	// L212, [0,1)
      }
    }
  }
  for (int v170 = 0; v170 < 64; v170 += 1) {	// L216, [30434632,39871829), iterCycle=12, II=1
    for (int v171 = 0; v171 < 3; v171 += 1) {	// L217, [179473250,179620719), iterCycle=12, II=1
      for (int v172 = 0; v172 < 3; v172 += 1) {	// L218, [179473250,179522415), iterCycle=12, II=1
        for (int v173 = 0; v173 < 16; v173 += 1) {	// L219, [179473250,179489647), iterCycle=12, II=1
          for (int v174 = 0; v174 < 32; v174 += 1) {	// L220, [179473250,179474287), iterCycle=12, II=1
            for (int v175 = 0; v175 < 32; v175 += 1) {	// L221, [179473250,179473295), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v176 = v32[v170][(v174 + v171)][(v175 + v172)];	// L222, [0,2)
              float v177 = v2[(v173 * 4)][v170][v171][v172];	// L223, [0,2)
              float v178 = v176 * v177;	// L224, [2,6)
              float v179 = v33[(v173 * 4)][v174][v175];	// L225, [4,6)
              float v180 = v178 + v179;	// L226, [6,11)
              v33[(v173 * 4)][v174][v175] = v180;	// L227, [11,12)
              float v181 = v2[((v173 * 4) + 1)][v170][v171][v172];	// L228, [0,2)
              float v182 = v176 * v181;	// L229, [2,6)
              float v183 = v33[((v173 * 4) + 1)][v174][v175];	// L230, [4,6)
              float v184 = v182 + v183;	// L231, [6,11)
              v33[((v173 * 4) + 1)][v174][v175] = v184;	// L232, [11,12)
              float v185 = v2[((v173 * 4) + 2)][v170][v171][v172];	// L233, [0,2)
              float v186 = v176 * v185;	// L234, [2,6)
              float v187 = v33[((v173 * 4) + 2)][v174][v175];	// L235, [4,6)
              float v188 = v186 + v187;	// L236, [6,11)
              v33[((v173 * 4) + 2)][v174][v175] = v188;	// L237, [11,12)
              float v189 = v2[((v173 * 4) + 3)][v170][v171][v172];	// L238, [0,2)
              float v190 = v176 * v189;	// L239, [2,6)
              float v191 = v33[((v173 * 4) + 3)][v174][v175];	// L240, [4,6)
              float v192 = v190 + v191;	// L241, [6,11)
              v33[((v173 * 4) + 3)][v174][v175] = v192;	// L242, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v193 = 0; v193 < 64; v193 += 1) {	// L249, [39871829,40400343), iterCycle=8258, II=8258
    for (int v194 = 0; v194 < 32; v194 += 1) {	// L250, [0,8258), iterCycle=258, II=258
      for (int v195 = 0; v195 < 32; v195 += 1) {	// L251, [0,258), iterCycle=8, II=8
      #pragma HLS PIPELINE off
        float v196 = v33[v193][v194][v195];	// L252, [0,2)
        float v197 = v31[v193][v194][v195];	// L253, [0,2)
        float v198 = v196 + v197;	// L254, [2,7)
        v34[v193][v194][v195] = v198;	// L255, [7,8)
      }
    }
  }
  for (int v199 = 0; v199 < 64; v199 += 1) {	// L259, [40400343,40601177), iterCycle=3138, II=3138
    for (int v200 = 0; v200 < 32; v200 += 1) {	// L260, [0,3138), iterCycle=98, II=98
      for (int v201 = 0; v201 < 32; v201 += 1) {	// L261, [0,98), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v202 = v34[v199][v200][v201];	// L262, [0,2)
        v34[v199][v200][v201] = max(v202, v0);	// L263, [2,3)
      }
    }
  }
  for (int v203 = 0; v203 < 128; v203 += 1) {	// L267, [40601177,40638299), iterCycle=290, II=290
    for (int v204 = 0; v204 < 16; v204 += 1) {	// L268, [0,290), iterCycle=18, II=18
      for (int v205 = 0; v205 < 16; v205 += 1) {	// L269, [0,18), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v35[v203][v204][v205] = v0;	// L270, [0,1)
      }
    }
  }
  for (int v206 = 0; v206 < 64; v206 += 1) {	// L274, [40638299,45356904), iterCycle=12, II=1
    for (int v207 = 0; v207 < 3; v207 += 1) {	// L275, [173988175,174061916), iterCycle=12, II=1
      for (int v208 = 0; v208 < 3; v208 += 1) {	// L276, [173988175,174012764), iterCycle=12, II=1
        for (int v209 = 0; v209 < 32; v209 += 1) {	// L277, [173988175,173996380), iterCycle=12, II=1
          for (int v210 = 0; v210 < 16; v210 += 1) {	// L278, [173988175,173988444), iterCycle=12, II=1
            for (int v211 = 0; v211 < 16; v211 += 1) {	// L279, [173988175,173988204), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v212 = v34[v206][((v210 * 2) + v207)][((v211 * 2) + v208)];	// L280, [0,2)
              float v213 = v3[(v209 * 4)][v206][v207][v208];	// L281, [0,2)
              float v214 = v212 * v213;	// L282, [2,6)
              float v215 = v35[(v209 * 4)][v210][v211];	// L283, [4,6)
              float v216 = v214 + v215;	// L284, [6,11)
              v35[(v209 * 4)][v210][v211] = v216;	// L285, [11,12)
              float v217 = v3[((v209 * 4) + 1)][v206][v207][v208];	// L286, [0,2)
              float v218 = v212 * v217;	// L287, [2,6)
              float v219 = v35[((v209 * 4) + 1)][v210][v211];	// L288, [4,6)
              float v220 = v218 + v219;	// L289, [6,11)
              v35[((v209 * 4) + 1)][v210][v211] = v220;	// L290, [11,12)
              float v221 = v3[((v209 * 4) + 2)][v206][v207][v208];	// L291, [0,2)
              float v222 = v212 * v221;	// L292, [2,6)
              float v223 = v35[((v209 * 4) + 2)][v210][v211];	// L293, [4,6)
              float v224 = v222 + v223;	// L294, [6,11)
              v35[((v209 * 4) + 2)][v210][v211] = v224;	// L295, [11,12)
              float v225 = v3[((v209 * 4) + 3)][v206][v207][v208];	// L296, [0,2)
              float v226 = v212 * v225;	// L297, [2,6)
              float v227 = v35[((v209 * 4) + 3)][v210][v211];	// L298, [4,6)
              float v228 = v226 + v227;	// L299, [6,11)
              v35[((v209 * 4) + 3)][v210][v211] = v228;	// L300, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v229 = 0; v229 < 128; v229 += 1) {	// L307, [45356904,45459562), iterCycle=802, II=802
    for (int v230 = 0; v230 < 16; v230 += 1) {	// L308, [0,802), iterCycle=50, II=50
      for (int v231 = 0; v231 < 16; v231 += 1) {	// L309, [0,50), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v232 = v35[v229][v230][v231];	// L310, [0,2)
        v35[v229][v230][v231] = max(v232, v0);	// L311, [2,3)
      }
    }
  }
  for (int v233 = 0; v233 < 128; v233 += 1) {	// L315, [45459562,45496684), iterCycle=290, II=290
    for (int v234 = 0; v234 < 16; v234 += 1) {	// L316, [0,290), iterCycle=18, II=18
      for (int v235 = 0; v235 < 16; v235 += 1) {	// L317, [0,18), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v36[v233][v234][v235] = v0;	// L318, [0,1)
      }
    }
  }
  for (int v236 = 0; v236 < 128; v236 += 1) {	// L322, [45496684,54933881), iterCycle=12, II=1
    for (int v237 = 0; v237 < 3; v237 += 1) {	// L323, [164411198,164484939), iterCycle=12, II=1
      for (int v238 = 0; v238 < 3; v238 += 1) {	// L324, [164411198,164435787), iterCycle=12, II=1
        for (int v239 = 0; v239 < 32; v239 += 1) {	// L325, [164411198,164419403), iterCycle=12, II=1
          for (int v240 = 0; v240 < 16; v240 += 1) {	// L326, [164411198,164411467), iterCycle=12, II=1
            for (int v241 = 0; v241 < 16; v241 += 1) {	// L327, [164411198,164411227), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v242 = v35[v236][(v240 + v237)][(v241 + v238)];	// L328, [0,2)
              float v243 = v4[(v239 * 4)][v236][v237][v238];	// L329, [0,2)
              float v244 = v242 * v243;	// L330, [2,6)
              float v245 = v36[(v239 * 4)][v240][v241];	// L331, [4,6)
              float v246 = v244 + v245;	// L332, [6,11)
              v36[(v239 * 4)][v240][v241] = v246;	// L333, [11,12)
              float v247 = v4[((v239 * 4) + 1)][v236][v237][v238];	// L334, [0,2)
              float v248 = v242 * v247;	// L335, [2,6)
              float v249 = v36[((v239 * 4) + 1)][v240][v241];	// L336, [4,6)
              float v250 = v248 + v249;	// L337, [6,11)
              v36[((v239 * 4) + 1)][v240][v241] = v250;	// L338, [11,12)
              float v251 = v4[((v239 * 4) + 2)][v236][v237][v238];	// L339, [0,2)
              float v252 = v242 * v251;	// L340, [2,6)
              float v253 = v36[((v239 * 4) + 2)][v240][v241];	// L341, [4,6)
              float v254 = v252 + v253;	// L342, [6,11)
              v36[((v239 * 4) + 2)][v240][v241] = v254;	// L343, [11,12)
              float v255 = v4[((v239 * 4) + 3)][v236][v237][v238];	// L344, [0,2)
              float v256 = v242 * v255;	// L345, [2,6)
              float v257 = v36[((v239 * 4) + 3)][v240][v241];	// L346, [4,6)
              float v258 = v256 + v257;	// L347, [6,11)
              v36[((v239 * 4) + 3)][v240][v241] = v258;	// L348, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v259 = 0; v259 < 64; v259 += 1) {	// L355, [54933881,80378363), iterCycle=397570, II=397570
    for (int v260 = 0; v260 < 128; v260 += 1) {	// L356, [0,397570), iterCycle=3106, II=3106
      for (int v261 = 0; v261 < 16; v261 += 1) {	// L357, [0,3106), iterCycle=194, II=194
        for (int v262 = 0; v262 < 16; v262 += 1) {	// L358, [0,194), iterCycle=12, II=12
          #pragma HLS PIPELINE off
          float v263 = v34[v259][(v261 * 2)][(v262 * 2)];	// L359, [0,2)
          float v264 = v38[v260][v259];	// L360, [0,2)
          float v265 = v263 * v264;	// L361, [2,6)
          float v266 = v10[v260][v261][v262];	// L362, [4,6)
          float v267 = v266 + v265;	// L363, [6,11)
          v10[v260][v261][v262] = v267;	// L364, [11,12)
        }
      }
    }
  }
  for (int v268 = 0; v268 < 128; v268 += 1) {	// L369, [80378363,80644861), iterCycle=2082, II=2082
    for (int v269 = 0; v269 < 16; v269 += 1) {	// L370, [0,2082), iterCycle=130, II=130
      for (int v270 = 0; v270 < 16; v270 += 1) {	// L371, [0,130), iterCycle=8, II=8
      #pragma HLS PIPELINE off
        float v271 = v10[v268][v269][v270];	// L372, [0,2)
        float v272 = v36[v268][v269][v270];	// L373, [0,2)
        float v273 = v271 + v272;	// L374, [2,7)
        v11[v268][v269][v270] = v273;	// L375, [7,8)
      }
    }
  }
  for (int v274 = 0; v274 < 128; v274 += 1) {	// L379, [80644861,80747519), iterCycle=802, II=802
    for (int v275 = 0; v275 < 16; v275 += 1) {	// L380, [0,802), iterCycle=50, II=50
      for (int v276 = 0; v276 < 16; v276 += 1) {	// L381, [0,50), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v277 = v11[v274][v275][v276];	// L382, [0,2)
        v11[v274][v275][v276] = max(v277, v0);	// L383, [2,3)
      }
    }
  }
  for (int v278 = 0; v278 < 128; v278 += 1) {	// L387, [80747519,80784641), iterCycle=290, II=290
    for (int v279 = 0; v279 < 16; v279 += 1) {	// L388, [0,290), iterCycle=18, II=18
      for (int v280 = 0; v280 < 16; v280 += 1) {	// L389, [0,18), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v12[v278][v279][v280] = v0;	// L390, [0,1)
      }
    }
  }
  for (int v281 = 0; v281 < 128; v281 += 1) {	// L394, [80784641,90221838), iterCycle=12, II=1
    for (int v282 = 0; v282 < 3; v282 += 1) {	// L395, [129123241,129196982), iterCycle=12, II=1
      for (int v283 = 0; v283 < 3; v283 += 1) {	// L396, [129123241,129147830), iterCycle=12, II=1
        for (int v284 = 0; v284 < 32; v284 += 1) {	// L397, [129123241,129131446), iterCycle=12, II=1
          for (int v285 = 0; v285 < 16; v285 += 1) {	// L398, [129123241,129123510), iterCycle=12, II=1
            for (int v286 = 0; v286 < 16; v286 += 1) {	// L399, [129123241,129123270), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v287 = v11[v281][(v285 + v282)][(v286 + v283)];	// L400, [0,2)
              float v288 = v4[(v284 * 4)][v281][v282][v283];	// L401, [0,2)
              float v289 = v287 * v288;	// L402, [2,6)
              float v290 = v12[(v284 * 4)][v285][v286];	// L403, [4,6)
              float v291 = v289 + v290;	// L404, [6,11)
              v12[(v284 * 4)][v285][v286] = v291;	// L405, [11,12)
              float v292 = v4[((v284 * 4) + 1)][v281][v282][v283];	// L406, [0,2)
              float v293 = v287 * v292;	// L407, [2,6)
              float v294 = v12[((v284 * 4) + 1)][v285][v286];	// L408, [4,6)
              float v295 = v293 + v294;	// L409, [6,11)
              v12[((v284 * 4) + 1)][v285][v286] = v295;	// L410, [11,12)
              float v296 = v4[((v284 * 4) + 2)][v281][v282][v283];	// L411, [0,2)
              float v297 = v287 * v296;	// L412, [2,6)
              float v298 = v12[((v284 * 4) + 2)][v285][v286];	// L413, [4,6)
              float v299 = v297 + v298;	// L414, [6,11)
              v12[((v284 * 4) + 2)][v285][v286] = v299;	// L415, [11,12)
              float v300 = v4[((v284 * 4) + 3)][v281][v282][v283];	// L416, [0,2)
              float v301 = v287 * v300;	// L417, [2,6)
              float v302 = v12[((v284 * 4) + 3)][v285][v286];	// L418, [4,6)
              float v303 = v301 + v302;	// L419, [6,11)
              v12[((v284 * 4) + 3)][v285][v286] = v303;	// L420, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v304 = 0; v304 < 128; v304 += 1) {	// L427, [90221838,90324496), iterCycle=802, II=802
    for (int v305 = 0; v305 < 16; v305 += 1) {	// L428, [0,802), iterCycle=50, II=50
      for (int v306 = 0; v306 < 16; v306 += 1) {	// L429, [0,50), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v307 = v12[v304][v305][v306];	// L430, [0,2)
        v12[v304][v305][v306] = max(v307, v0);	// L431, [2,3)
      }
    }
  }
  for (int v308 = 0; v308 < 128; v308 += 1) {	// L435, [90324496,90361618), iterCycle=290, II=290
    for (int v309 = 0; v309 < 16; v309 += 1) {	// L436, [0,290), iterCycle=18, II=18
      for (int v310 = 0; v310 < 16; v310 += 1) {	// L437, [0,18), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v13[v308][v309][v310] = v0;	// L438, [0,1)
      }
    }
  }
  for (int v311 = 0; v311 < 128; v311 += 1) {	// L442, [90361618,99798815), iterCycle=12, II=1
    for (int v312 = 0; v312 < 3; v312 += 1) {	// L443, [119546264,119620005), iterCycle=12, II=1
      for (int v313 = 0; v313 < 3; v313 += 1) {	// L444, [119546264,119570853), iterCycle=12, II=1
        for (int v314 = 0; v314 < 32; v314 += 1) {	// L445, [119546264,119554469), iterCycle=12, II=1
          for (int v315 = 0; v315 < 16; v315 += 1) {	// L446, [119546264,119546533), iterCycle=12, II=1
            for (int v316 = 0; v316 < 16; v316 += 1) {	// L447, [119546264,119546293), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v317 = v12[v311][(v315 + v312)][(v316 + v313)];	// L448, [0,2)
              float v318 = v4[(v314 * 4)][v311][v312][v313];	// L449, [0,2)
              float v319 = v317 * v318;	// L450, [2,6)
              float v320 = v13[(v314 * 4)][v315][v316];	// L451, [4,6)
              float v321 = v319 + v320;	// L452, [6,11)
              v13[(v314 * 4)][v315][v316] = v321;	// L453, [11,12)
              float v322 = v4[((v314 * 4) + 1)][v311][v312][v313];	// L454, [0,2)
              float v323 = v317 * v322;	// L455, [2,6)
              float v324 = v13[((v314 * 4) + 1)][v315][v316];	// L456, [4,6)
              float v325 = v323 + v324;	// L457, [6,11)
              v13[((v314 * 4) + 1)][v315][v316] = v325;	// L458, [11,12)
              float v326 = v4[((v314 * 4) + 2)][v311][v312][v313];	// L459, [0,2)
              float v327 = v317 * v326;	// L460, [2,6)
              float v328 = v13[((v314 * 4) + 2)][v315][v316];	// L461, [4,6)
              float v329 = v327 + v328;	// L462, [6,11)
              v13[((v314 * 4) + 2)][v315][v316] = v329;	// L463, [11,12)
              float v330 = v4[((v314 * 4) + 3)][v311][v312][v313];	// L464, [0,2)
              float v331 = v317 * v330;	// L465, [2,6)
              float v332 = v13[((v314 * 4) + 3)][v315][v316];	// L466, [4,6)
              float v333 = v331 + v332;	// L467, [6,11)
              v13[((v314 * 4) + 3)][v315][v316] = v333;	// L468, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v334 = 0; v334 < 128; v334 += 1) {	// L475, [99798815,100065313), iterCycle=2082, II=2082
    for (int v335 = 0; v335 < 16; v335 += 1) {	// L476, [0,2082), iterCycle=130, II=130
      for (int v336 = 0; v336 < 16; v336 += 1) {	// L477, [0,130), iterCycle=8, II=8
      #pragma HLS PIPELINE off
        float v337 = v13[v334][v335][v336];	// L478, [0,2)
        float v338 = v11[v334][v335][v336];	// L479, [0,2)
        float v339 = v337 + v338;	// L480, [2,7)
        v14[v334][v335][v336] = v339;	// L481, [7,8)
      }
    }
  }
  for (int v340 = 0; v340 < 128; v340 += 1) {	// L485, [100065313,100167971), iterCycle=802, II=802
    for (int v341 = 0; v341 < 16; v341 += 1) {	// L486, [0,802), iterCycle=50, II=50
      for (int v342 = 0; v342 < 16; v342 += 1) {	// L487, [0,50), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v343 = v14[v340][v341][v342];	// L488, [0,2)
        v14[v340][v341][v342] = max(v343, v0);	// L489, [2,3)
      }
    }
  }
  for (int v344 = 0; v344 < 256; v344 += 1) {	// L493, [100167971,100188965), iterCycle=82, II=82
    for (int v345 = 0; v345 < 8; v345 += 1) {	// L494, [0,82), iterCycle=10, II=10
      for (int v346 = 0; v346 < 8; v346 += 1) {	// L495, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v15[v344][v345][v346] = v0;	// L496, [0,1)
      }
    }
  }
  for (int v347 = 0; v347 < 128; v347 += 1) {	// L500, [100188965,104907570), iterCycle=12, II=1
    for (int v348 = 0; v348 < 3; v348 += 1) {	// L501, [114437509,114474386), iterCycle=12, II=1
      for (int v349 = 0; v349 < 3; v349 += 1) {	// L502, [114437509,114449810), iterCycle=12, II=1
        for (int v350 = 0; v350 < 64; v350 += 1) {	// L503, [114437509,114441618), iterCycle=12, II=1
          for (int v351 = 0; v351 < 8; v351 += 1) {	// L504, [114437509,114437586), iterCycle=12, II=1
            for (int v352 = 0; v352 < 8; v352 += 1) {	// L505, [114437509,114437530), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v353 = v14[v347][((v351 * 2) + v348)][((v352 * 2) + v349)];	// L506, [0,2)
              float v354 = v5[(v350 * 4)][v347][v348][v349];	// L507, [0,2)
              float v355 = v353 * v354;	// L508, [2,6)
              float v356 = v15[(v350 * 4)][v351][v352];	// L509, [4,6)
              float v357 = v355 + v356;	// L510, [6,11)
              v15[(v350 * 4)][v351][v352] = v357;	// L511, [11,12)
              float v358 = v5[((v350 * 4) + 1)][v347][v348][v349];	// L512, [0,2)
              float v359 = v353 * v358;	// L513, [2,6)
              float v360 = v15[((v350 * 4) + 1)][v351][v352];	// L514, [4,6)
              float v361 = v359 + v360;	// L515, [6,11)
              v15[((v350 * 4) + 1)][v351][v352] = v361;	// L516, [11,12)
              float v362 = v5[((v350 * 4) + 2)][v347][v348][v349];	// L517, [0,2)
              float v363 = v353 * v362;	// L518, [2,6)
              float v364 = v15[((v350 * 4) + 2)][v351][v352];	// L519, [4,6)
              float v365 = v363 + v364;	// L520, [6,11)
              v15[((v350 * 4) + 2)][v351][v352] = v365;	// L521, [11,12)
              float v366 = v5[((v350 * 4) + 3)][v347][v348][v349];	// L522, [0,2)
              float v367 = v353 * v366;	// L523, [2,6)
              float v368 = v15[((v350 * 4) + 3)][v351][v352];	// L524, [4,6)
              float v369 = v367 + v368;	// L525, [6,11)
              v15[((v350 * 4) + 3)][v351][v352] = v369;	// L526, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v370 = 0; v370 < 256; v370 += 1) {	// L533, [104907570,104961332), iterCycle=210, II=210
    for (int v371 = 0; v371 < 8; v371 += 1) {	// L534, [0,210), iterCycle=26, II=26
      for (int v372 = 0; v372 < 8; v372 += 1) {	// L535, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v373 = v15[v370][v371][v372];	// L536, [0,2)
        v15[v370][v371][v372] = max(v373, v0);	// L537, [2,3)
      }
    }
  }
  for (int v374 = 0; v374 < 256; v374 += 1) {	// L541, [104961332,104982326), iterCycle=82, II=82
    for (int v375 = 0; v375 < 8; v375 += 1) {	// L542, [0,82), iterCycle=10, II=10
      for (int v376 = 0; v376 < 8; v376 += 1) {	// L543, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v16[v374][v375][v376] = v0;	// L544, [0,1)
      }
    }
  }
  for (int v377 = 0; v377 < 256; v377 += 1) {	// L548, [104982326,114419523), iterCycle=12, II=1
    for (int v378 = 0; v378 < 3; v378 += 1) {	// L549, [104925556,104962433), iterCycle=12, II=1
      for (int v379 = 0; v379 < 3; v379 += 1) {	// L550, [104925556,104937857), iterCycle=12, II=1
        for (int v380 = 0; v380 < 64; v380 += 1) {	// L551, [104925556,104929665), iterCycle=12, II=1
          for (int v381 = 0; v381 < 8; v381 += 1) {	// L552, [104925556,104925633), iterCycle=12, II=1
            for (int v382 = 0; v382 < 8; v382 += 1) {	// L553, [104925556,104925577), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v383 = v15[v377][(v381 + v378)][(v382 + v379)];	// L554, [0,2)
              float v384 = v6[(v380 * 4)][v377][v378][v379];	// L555, [0,2)
              float v385 = v383 * v384;	// L556, [2,6)
              float v386 = v16[(v380 * 4)][v381][v382];	// L557, [4,6)
              float v387 = v385 + v386;	// L558, [6,11)
              v16[(v380 * 4)][v381][v382] = v387;	// L559, [11,12)
              float v388 = v6[((v380 * 4) + 1)][v377][v378][v379];	// L560, [0,2)
              float v389 = v383 * v388;	// L561, [2,6)
              float v390 = v16[((v380 * 4) + 1)][v381][v382];	// L562, [4,6)
              float v391 = v389 + v390;	// L563, [6,11)
              v16[((v380 * 4) + 1)][v381][v382] = v391;	// L564, [11,12)
              float v392 = v6[((v380 * 4) + 2)][v377][v378][v379];	// L565, [0,2)
              float v393 = v383 * v392;	// L566, [2,6)
              float v394 = v16[((v380 * 4) + 2)][v381][v382];	// L567, [4,6)
              float v395 = v393 + v394;	// L568, [6,11)
              v16[((v380 * 4) + 2)][v381][v382] = v395;	// L569, [11,12)
              float v396 = v6[((v380 * 4) + 3)][v377][v378][v379];	// L570, [0,2)
              float v397 = v383 * v396;	// L571, [2,6)
              float v398 = v16[((v380 * 4) + 3)][v381][v382];	// L572, [4,6)
              float v399 = v397 + v398;	// L573, [6,11)
              v16[((v380 * 4) + 3)][v381][v382] = v399;	// L574, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v400 = 0; v400 < 128; v400 += 1) {	// L581, [114419523,140175429), iterCycle=201218, II=201218
    for (int v401 = 0; v401 < 256; v401 += 1) {	// L582, [0,201218), iterCycle=786, II=786
      for (int v402 = 0; v402 < 8; v402 += 1) {	// L583, [0,786), iterCycle=98, II=98
        for (int v403 = 0; v403 < 8; v403 += 1) {	// L584, [0,98), iterCycle=12, II=12
          #pragma HLS PIPELINE off
          float v404 = v14[v400][(v402 * 2)][(v403 * 2)];	// L585, [0,2)
          float v405 = v39[v401][v400];	// L586, [0,2)
          float v406 = v404 * v405;	// L587, [2,6)
          float v407 = v17[v401][v402][v403];	// L588, [4,6)
          float v408 = v407 + v406;	// L589, [6,11)
          v17[v401][v402][v403] = v408;	// L590, [11,12)
        }
      }
    }
  }
  for (int v409 = 0; v409 < 256; v409 += 1) {	// L595, [140175429,140311111), iterCycle=530, II=530
    for (int v410 = 0; v410 < 8; v410 += 1) {	// L596, [0,530), iterCycle=66, II=66
      for (int v411 = 0; v411 < 8; v411 += 1) {	// L597, [0,66), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v412 = v17[v409][v410][v411];	// L598, [0,2)
        float v413 = v16[v409][v410][v411];	// L599, [0,2)
        float v414 = v412 + v413;	// L600, [2,7)
        v18[v409][v410][v411] = v414;	// L601, [7,8)
      }
    }
  }
  for (int v415 = 0; v415 < 256; v415 += 1) {	// L605, [140311111,140364873), iterCycle=210, II=210
    for (int v416 = 0; v416 < 8; v416 += 1) {	// L606, [0,210), iterCycle=26, II=26
      for (int v417 = 0; v417 < 8; v417 += 1) {	// L607, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v418 = v18[v415][v416][v417];	// L608, [0,2)
        v18[v415][v416][v417] = max(v418, v0);	// L609, [2,3)
      }
    }
  }
  for (int v419 = 0; v419 < 256; v419 += 1) {	// L613, [140364873,140385867), iterCycle=82, II=82
    for (int v420 = 0; v420 < 8; v420 += 1) {	// L614, [0,82), iterCycle=10, II=10
      for (int v421 = 0; v421 < 8; v421 += 1) {	// L615, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v19[v419][v420][v421] = v0;	// L616, [0,1)
      }
    }
  }
  for (int v422 = 0; v422 < 256; v422 += 1) {	// L620, [140385867,149823064), iterCycle=12, II=1
    for (int v423 = 0; v423 < 3; v423 += 1) {	// L621, [69522015,69558892), iterCycle=12, II=1
      for (int v424 = 0; v424 < 3; v424 += 1) {	// L622, [69522015,69534316), iterCycle=12, II=1
        for (int v425 = 0; v425 < 64; v425 += 1) {	// L623, [69522015,69526124), iterCycle=12, II=1
          for (int v426 = 0; v426 < 8; v426 += 1) {	// L624, [69522015,69522092), iterCycle=12, II=1
            for (int v427 = 0; v427 < 8; v427 += 1) {	// L625, [69522015,69522036), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v428 = v18[v422][(v426 + v423)][(v427 + v424)];	// L626, [0,2)
              float v429 = v6[(v425 * 4)][v422][v423][v424];	// L627, [0,2)
              float v430 = v428 * v429;	// L628, [2,6)
              float v431 = v19[(v425 * 4)][v426][v427];	// L629, [4,6)
              float v432 = v430 + v431;	// L630, [6,11)
              v19[(v425 * 4)][v426][v427] = v432;	// L631, [11,12)
              float v433 = v6[((v425 * 4) + 1)][v422][v423][v424];	// L632, [0,2)
              float v434 = v428 * v433;	// L633, [2,6)
              float v435 = v19[((v425 * 4) + 1)][v426][v427];	// L634, [4,6)
              float v436 = v434 + v435;	// L635, [6,11)
              v19[((v425 * 4) + 1)][v426][v427] = v436;	// L636, [11,12)
              float v437 = v6[((v425 * 4) + 2)][v422][v423][v424];	// L637, [0,2)
              float v438 = v428 * v437;	// L638, [2,6)
              float v439 = v19[((v425 * 4) + 2)][v426][v427];	// L639, [4,6)
              float v440 = v438 + v439;	// L640, [6,11)
              v19[((v425 * 4) + 2)][v426][v427] = v440;	// L641, [11,12)
              float v441 = v6[((v425 * 4) + 3)][v422][v423][v424];	// L642, [0,2)
              float v442 = v428 * v441;	// L643, [2,6)
              float v443 = v19[((v425 * 4) + 3)][v426][v427];	// L644, [4,6)
              float v444 = v442 + v443;	// L645, [6,11)
              v19[((v425 * 4) + 3)][v426][v427] = v444;	// L646, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v445 = 0; v445 < 256; v445 += 1) {	// L653, [149823064,149876826), iterCycle=210, II=210
    for (int v446 = 0; v446 < 8; v446 += 1) {	// L654, [0,210), iterCycle=26, II=26
      for (int v447 = 0; v447 < 8; v447 += 1) {	// L655, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v448 = v19[v445][v446][v447];	// L656, [0,2)
        v19[v445][v446][v447] = max(v448, v0);	// L657, [2,3)
      }
    }
  }
  for (int v449 = 0; v449 < 256; v449 += 1) {	// L661, [149876826,149897820), iterCycle=82, II=82
    for (int v450 = 0; v450 < 8; v450 += 1) {	// L662, [0,82), iterCycle=10, II=10
      for (int v451 = 0; v451 < 8; v451 += 1) {	// L663, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v21[v449][v450][v451] = v0;	// L664, [0,1)
      }
    }
  }
  for (int v452 = 0; v452 < 256; v452 += 1) {	// L668, [149897820,159335017), iterCycle=12, II=1
    for (int v453 = 0; v453 < 3; v453 += 1) {	// L669, [60010062,60046939), iterCycle=12, II=1
      for (int v454 = 0; v454 < 3; v454 += 1) {	// L670, [60010062,60022363), iterCycle=12, II=1
        for (int v455 = 0; v455 < 64; v455 += 1) {	// L671, [60010062,60014171), iterCycle=12, II=1
          for (int v456 = 0; v456 < 8; v456 += 1) {	// L672, [60010062,60010139), iterCycle=12, II=1
            for (int v457 = 0; v457 < 8; v457 += 1) {	// L673, [60010062,60010083), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v458 = v19[v452][(v456 + v453)][(v457 + v454)];	// L674, [0,2)
              float v459 = v6[(v455 * 4)][v452][v453][v454];	// L675, [0,2)
              float v460 = v458 * v459;	// L676, [2,6)
              float v461 = v21[(v455 * 4)][v456][v457];	// L677, [4,6)
              float v462 = v460 + v461;	// L678, [6,11)
              v21[(v455 * 4)][v456][v457] = v462;	// L679, [11,12)
              float v463 = v6[((v455 * 4) + 1)][v452][v453][v454];	// L680, [0,2)
              float v464 = v458 * v463;	// L681, [2,6)
              float v465 = v21[((v455 * 4) + 1)][v456][v457];	// L682, [4,6)
              float v466 = v464 + v465;	// L683, [6,11)
              v21[((v455 * 4) + 1)][v456][v457] = v466;	// L684, [11,12)
              float v467 = v6[((v455 * 4) + 2)][v452][v453][v454];	// L685, [0,2)
              float v468 = v458 * v467;	// L686, [2,6)
              float v469 = v21[((v455 * 4) + 2)][v456][v457];	// L687, [4,6)
              float v470 = v468 + v469;	// L688, [6,11)
              v21[((v455 * 4) + 2)][v456][v457] = v470;	// L689, [11,12)
              float v471 = v6[((v455 * 4) + 3)][v452][v453][v454];	// L690, [0,2)
              float v472 = v458 * v471;	// L691, [2,6)
              float v473 = v21[((v455 * 4) + 3)][v456][v457];	// L692, [4,6)
              float v474 = v472 + v473;	// L693, [6,11)
              v21[((v455 * 4) + 3)][v456][v457] = v474;	// L694, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v475 = 0; v475 < 256; v475 += 1) {	// L701, [159335017,159470699), iterCycle=530, II=530
    for (int v476 = 0; v476 < 8; v476 += 1) {	// L702, [0,530), iterCycle=66, II=66
      for (int v477 = 0; v477 < 8; v477 += 1) {	// L703, [0,66), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v478 = v21[v475][v476][v477];	// L704, [0,2)
        float v479 = v18[v475][v476][v477];	// L705, [0,2)
        float v480 = v478 + v479;	// L706, [2,7)
        v22[v475][v476][v477] = v480;	// L707, [7,8)
      }
    }
  }
  for (int v481 = 0; v481 < 256; v481 += 1) {	// L711, [159470699,159524461), iterCycle=210, II=210
    for (int v482 = 0; v482 < 8; v482 += 1) {	// L712, [0,210), iterCycle=26, II=26
      for (int v483 = 0; v483 < 8; v483 += 1) {	// L713, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v484 = v22[v481][v482][v483];	// L714, [0,2)
        v22[v481][v482][v483] = max(v484, v0);	// L715, [2,3)
      }
    }
  }
  for (int v485 = 0; v485 < 512; v485 += 1) {	// L719, [159524461,159537775), iterCycle=26, II=26
    for (int v486 = 0; v486 < 4; v486 += 1) {	// L720, [0,26), iterCycle=6, II=6
      for (int v487 = 0; v487 < 4; v487 += 1) {	// L721, [0,6), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v23[v485][v486][v487] = v0;	// L722, [0,1)
      }
    }
  }
  for (int v488 = 0; v488 < 256; v488 += 1) {	// L726, [159537775,164256380), iterCycle=12, II=1
    for (int v489 = 0; v489 < 3; v489 += 1) {	// L727, [55088699,55107144), iterCycle=12, II=1
      for (int v490 = 0; v490 < 3; v490 += 1) {	// L728, [55088699,55094856), iterCycle=12, II=1
        for (int v491 = 0; v491 < 128; v491 += 1) {	// L729, [55088699,55090760), iterCycle=12, II=1
          for (int v492 = 0; v492 < 4; v492 += 1) {	// L730, [55088699,55088728), iterCycle=12, II=1
            for (int v493 = 0; v493 < 4; v493 += 1) {	// L731, [55088699,55088716), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v494 = v22[v488][((v492 * 2) + v489)][((v493 * 2) + v490)];	// L732, [0,2)
              float v495 = v7[(v491 * 4)][v488][v489][v490];	// L733, [0,2)
              float v496 = v494 * v495;	// L734, [2,6)
              float v497 = v23[(v491 * 4)][v492][v493];	// L735, [4,6)
              float v498 = v496 + v497;	// L736, [6,11)
              v23[(v491 * 4)][v492][v493] = v498;	// L737, [11,12)
              float v499 = v7[((v491 * 4) + 1)][v488][v489][v490];	// L738, [0,2)
              float v500 = v494 * v499;	// L739, [2,6)
              float v501 = v23[((v491 * 4) + 1)][v492][v493];	// L740, [4,6)
              float v502 = v500 + v501;	// L741, [6,11)
              v23[((v491 * 4) + 1)][v492][v493] = v502;	// L742, [11,12)
              float v503 = v7[((v491 * 4) + 2)][v488][v489][v490];	// L743, [0,2)
              float v504 = v494 * v503;	// L744, [2,6)
              float v505 = v23[((v491 * 4) + 2)][v492][v493];	// L745, [4,6)
              float v506 = v504 + v505;	// L746, [6,11)
              v23[((v491 * 4) + 2)][v492][v493] = v506;	// L747, [11,12)
              float v507 = v7[((v491 * 4) + 3)][v488][v489][v490];	// L748, [0,2)
              float v508 = v494 * v507;	// L749, [2,6)
              float v509 = v23[((v491 * 4) + 3)][v492][v493];	// L750, [4,6)
              float v510 = v508 + v509;	// L751, [6,11)
              v23[((v491 * 4) + 3)][v492][v493] = v510;	// L752, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v511 = 0; v511 < 512; v511 += 1) {	// L759, [164256380,164286078), iterCycle=58, II=58
    for (int v512 = 0; v512 < 4; v512 += 1) {	// L760, [0,58), iterCycle=14, II=14
      for (int v513 = 0; v513 < 4; v513 += 1) {	// L761, [0,14), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v514 = v23[v511][v512][v513];	// L762, [0,2)
        v23[v511][v512][v513] = max(v514, v0);	// L763, [2,3)
      }
    }
  }
  for (int v515 = 0; v515 < 512; v515 += 1) {	// L767, [164286078,164299392), iterCycle=26, II=26
    for (int v516 = 0; v516 < 4; v516 += 1) {	// L768, [0,26), iterCycle=6, II=6
      for (int v517 = 0; v517 < 4; v517 += 1) {	// L769, [0,6), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v24[v515][v516][v517] = v0;	// L770, [0,1)
      }
    }
  }
  for (int v518 = 0; v518 < 512; v518 += 1) {	// L774, [164299392,173736589), iterCycle=12, II=1
    for (int v519 = 0; v519 < 3; v519 += 1) {	// L775, [45608490,45626935), iterCycle=12, II=1
      for (int v520 = 0; v520 < 3; v520 += 1) {	// L776, [45608490,45614647), iterCycle=12, II=1
        for (int v521 = 0; v521 < 128; v521 += 1) {	// L777, [45608490,45610551), iterCycle=12, II=1
          for (int v522 = 0; v522 < 4; v522 += 1) {	// L778, [45608490,45608519), iterCycle=12, II=1
            for (int v523 = 0; v523 < 4; v523 += 1) {	// L779, [45608490,45608507), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v524 = v23[v518][(v522 + v519)][(v523 + v520)];	// L780, [0,2)
              float v525 = v8[(v521 * 4)][v518][v519][v520];	// L781, [0,2)
              float v526 = v524 * v525;	// L782, [2,6)
              float v527 = v24[(v521 * 4)][v522][v523];	// L783, [4,6)
              float v528 = v526 + v527;	// L784, [6,11)
              v24[(v521 * 4)][v522][v523] = v528;	// L785, [11,12)
              float v529 = v8[((v521 * 4) + 1)][v518][v519][v520];	// L786, [0,2)
              float v530 = v524 * v529;	// L787, [2,6)
              float v531 = v24[((v521 * 4) + 1)][v522][v523];	// L788, [4,6)
              float v532 = v530 + v531;	// L789, [6,11)
              v24[((v521 * 4) + 1)][v522][v523] = v532;	// L790, [11,12)
              float v533 = v8[((v521 * 4) + 2)][v518][v519][v520];	// L791, [0,2)
              float v534 = v524 * v533;	// L792, [2,6)
              float v535 = v24[((v521 * 4) + 2)][v522][v523];	// L793, [4,6)
              float v536 = v534 + v535;	// L794, [6,11)
              v24[((v521 * 4) + 2)][v522][v523] = v536;	// L795, [11,12)
              float v537 = v8[((v521 * 4) + 3)][v518][v519][v520];	// L796, [0,2)
              float v538 = v524 * v537;	// L797, [2,6)
              float v539 = v24[((v521 * 4) + 3)][v522][v523];	// L798, [4,6)
              float v540 = v538 + v539;	// L799, [6,11)
              v24[((v521 * 4) + 3)][v522][v523] = v540;	// L800, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v541 = 0; v541 < 256; v541 += 1) {	// L807, [173736589,200213647), iterCycle=103426, II=103426
    for (int v542 = 0; v542 < 512; v542 += 1) {	// L808, [0,103426), iterCycle=202, II=202
      for (int v543 = 0; v543 < 4; v543 += 1) {	// L809, [0,202), iterCycle=50, II=50
        for (int v544 = 0; v544 < 4; v544 += 1) {	// L810, [0,50), iterCycle=12, II=12
          #pragma HLS PIPELINE off
          float v545 = v22[v541][(v543 * 2)][(v544 * 2)];	// L811, [0,2)
          float v546 = v40[v542][v541];	// L812, [0,2)
          float v547 = v545 * v546;	// L813, [2,6)
          float v548 = v25[v542][v543][v544];	// L814, [4,6)
          float v549 = v548 + v547;	// L815, [6,11)
          v25[v542][v543][v544] = v549;	// L816, [11,12)
        }
      }
    }
  }
  for (int v550 = 0; v550 < 512; v550 += 1) {	// L821, [200213647,200284305), iterCycle=138, II=138
    for (int v551 = 0; v551 < 4; v551 += 1) {	// L822, [0,138), iterCycle=34, II=34
      for (int v552 = 0; v552 < 4; v552 += 1) {	// L823, [0,34), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v553 = v25[v550][v551][v552];	// L824, [0,2)
        float v554 = v24[v550][v551][v552];	// L825, [0,2)
        float v555 = v553 + v554;	// L826, [2,7)
        v26[v550][v551][v552] = v555;	// L827, [7,8)
      }
    }
  }
  for (int v556 = 0; v556 < 512; v556 += 1) {	// L831, [200284305,200314003), iterCycle=58, II=58
    for (int v557 = 0; v557 < 4; v557 += 1) {	// L832, [0,58), iterCycle=14, II=14
      for (int v558 = 0; v558 < 4; v558 += 1) {	// L833, [0,14), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v559 = v26[v556][v557][v558];	// L834, [0,2)
        v26[v556][v557][v558] = max(v559, v0);	// L835, [2,3)
      }
    }
  }
  for (int v560 = 0; v560 < 512; v560 += 1) {	// L839, [200314003,200327317), iterCycle=26, II=26
    for (int v561 = 0; v561 < 4; v561 += 1) {	// L840, [0,26), iterCycle=6, II=6
      for (int v562 = 0; v562 < 4; v562 += 1) {	// L841, [0,6), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v27[v560][v561][v562] = v0;	// L842, [0,1)
      }
    }
  }
  for (int v563 = 0; v563 < 512; v563 += 1) {	// L846, [200327317,209764514), iterCycle=12, II=1
    for (int v564 = 0; v564 < 3; v564 += 1) {	// L847, [9580565,9599010), iterCycle=12, II=1
      for (int v565 = 0; v565 < 3; v565 += 1) {	// L848, [9580565,9586722), iterCycle=12, II=1
        for (int v566 = 0; v566 < 128; v566 += 1) {	// L849, [9580565,9582626), iterCycle=12, II=1
          for (int v567 = 0; v567 < 4; v567 += 1) {	// L850, [9580565,9580594), iterCycle=12, II=1
            for (int v568 = 0; v568 < 4; v568 += 1) {	// L851, [9580565,9580582), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v569 = v26[v563][(v567 + v564)][(v568 + v565)];	// L852, [0,2)
              float v570 = v8[(v566 * 4)][v563][v564][v565];	// L853, [0,2)
              float v571 = v569 * v570;	// L854, [2,6)
              float v572 = v27[(v566 * 4)][v567][v568];	// L855, [4,6)
              float v573 = v571 + v572;	// L856, [6,11)
              v27[(v566 * 4)][v567][v568] = v573;	// L857, [11,12)
              float v574 = v8[((v566 * 4) + 1)][v563][v564][v565];	// L858, [0,2)
              float v575 = v569 * v574;	// L859, [2,6)
              float v576 = v27[((v566 * 4) + 1)][v567][v568];	// L860, [4,6)
              float v577 = v575 + v576;	// L861, [6,11)
              v27[((v566 * 4) + 1)][v567][v568] = v577;	// L862, [11,12)
              float v578 = v8[((v566 * 4) + 2)][v563][v564][v565];	// L863, [0,2)
              float v579 = v569 * v578;	// L864, [2,6)
              float v580 = v27[((v566 * 4) + 2)][v567][v568];	// L865, [4,6)
              float v581 = v579 + v580;	// L866, [6,11)
              v27[((v566 * 4) + 2)][v567][v568] = v581;	// L867, [11,12)
              float v582 = v8[((v566 * 4) + 3)][v563][v564][v565];	// L868, [0,2)
              float v583 = v569 * v582;	// L869, [2,6)
              float v584 = v27[((v566 * 4) + 3)][v567][v568];	// L870, [4,6)
              float v585 = v583 + v584;	// L871, [6,11)
              v27[((v566 * 4) + 3)][v567][v568] = v585;	// L872, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v586 = 0; v586 < 512; v586 += 1) {	// L879, [209764514,209794212), iterCycle=58, II=58
    for (int v587 = 0; v587 < 4; v587 += 1) {	// L880, [0,58), iterCycle=14, II=14
      for (int v588 = 0; v588 < 4; v588 += 1) {	// L881, [0,14), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v589 = v27[v586][v587][v588];	// L882, [0,2)
        v27[v586][v587][v588] = max(v589, v0);	// L883, [2,3)
      }
    }
  }
  for (int v590 = 0; v590 < 512; v590 += 1) {	// L887, [209794212,209807526), iterCycle=26, II=26
    for (int v591 = 0; v591 < 4; v591 += 1) {	// L888, [0,26), iterCycle=6, II=6
      for (int v592 = 0; v592 < 4; v592 += 1) {	// L889, [0,6), iterCycle=1, II=1
      #pragma HLS PIPELINE off
        v28[v590][v591][v592] = v0;	// L890, [0,1)
      }
    }
  }
  for (int v593 = 0; v593 < 512; v593 += 1) {	// L894, [209807526,219244723), iterCycle=12, II=1
    for (int v594 = 0; v594 < 3; v594 += 1) {	// L895, [100356,118801), iterCycle=12, II=1
      for (int v595 = 0; v595 < 3; v595 += 1) {	// L896, [100356,106513), iterCycle=12, II=1
        for (int v596 = 0; v596 < 128; v596 += 1) {	// L897, [100356,102417), iterCycle=12, II=1
          for (int v597 = 0; v597 < 4; v597 += 1) {	// L898, [100356,100385), iterCycle=12, II=1
            for (int v598 = 0; v598 < 4; v598 += 1) {	// L899, [100356,100373), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v599 = v27[v593][(v597 + v594)][(v598 + v595)];	// L900, [0,2)
              float v600 = v8[(v596 * 4)][v593][v594][v595];	// L901, [0,2)
              float v601 = v599 * v600;	// L902, [2,6)
              float v602 = v28[(v596 * 4)][v597][v598];	// L903, [4,6)
              float v603 = v601 + v602;	// L904, [6,11)
              v28[(v596 * 4)][v597][v598] = v603;	// L905, [11,12)
              float v604 = v8[((v596 * 4) + 1)][v593][v594][v595];	// L906, [0,2)
              float v605 = v599 * v604;	// L907, [2,6)
              float v606 = v28[((v596 * 4) + 1)][v597][v598];	// L908, [4,6)
              float v607 = v605 + v606;	// L909, [6,11)
              v28[((v596 * 4) + 1)][v597][v598] = v607;	// L910, [11,12)
              float v608 = v8[((v596 * 4) + 2)][v593][v594][v595];	// L911, [0,2)
              float v609 = v599 * v608;	// L912, [2,6)
              float v610 = v28[((v596 * 4) + 2)][v597][v598];	// L913, [4,6)
              float v611 = v609 + v610;	// L914, [6,11)
              v28[((v596 * 4) + 2)][v597][v598] = v611;	// L915, [11,12)
              float v612 = v8[((v596 * 4) + 3)][v593][v594][v595];	// L916, [0,2)
              float v613 = v599 * v612;	// L917, [2,6)
              float v614 = v28[((v596 * 4) + 3)][v597][v598];	// L918, [4,6)
              float v615 = v613 + v614;	// L919, [6,11)
              v28[((v596 * 4) + 3)][v597][v598] = v615;	// L920, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v616 = 0; v616 < 512; v616 += 1) {	// L927, [219244723,219315381), iterCycle=138, II=138
    for (int v617 = 0; v617 < 4; v617 += 1) {	// L928, [0,138), iterCycle=34, II=34
      for (int v618 = 0; v618 < 4; v618 += 1) {	// L929, [0,34), iterCycle=8, II=8
      #pragma HLS PIPELINE off
        float v619 = v28[v616][v617][v618];	// L930, [0,2)
        float v620 = v26[v616][v617][v618];	// L931, [0,2)
        float v621 = v619 + v620;	// L932, [2,7)
        v29[v616][v617][v618] = v621;	// L933, [7,8)
      }
    }
  }
  for (int v622 = 0; v622 < 512; v622 += 1) {	// L937, [219315381,219345079), iterCycle=58, II=58
    for (int v623 = 0; v623 < 4; v623 += 1) {	// L938, [0,58), iterCycle=14, II=14
      for (int v624 = 0; v624 < 4; v624 += 1) {	// L939, [0,14), iterCycle=3, II=3
      #pragma HLS PIPELINE off
        float v625 = v29[v622][v623][v624];	// L940, [0,2)
        v29[v622][v623][v624] = max(v625, v0);	// L941, [2,3)
      }
    }
  }
}

