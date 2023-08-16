
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
/// Latency=169209295, interval=169209295
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
) {	// L8, [0,169209295)
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

  #pragma HLS array_partition variable=v17 cyclic factor=2 dim=1
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

  #pragma HLS array_partition variable=v25 cyclic factor=2 dim=1
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

  #pragma HLS array_partition variable=v39 cyclic factor=2 dim=1
  #pragma HLS resource variable=v39 core=ram_s2p_bram

  #pragma HLS array_partition variable=v40 cyclic factor=2 dim=1
  #pragma HLS resource variable=v40 core=ram_s2p_bram

  for (int v41 = 0; v41 < 64; v41 += 1) {	// L9, [0,69762), iterCycle=1090, II=1090
    for (int v42 = 0; v42 < 32; v42 += 1) {	// L10, [0,1090), iterCycle=34, II=34
      for (int v43 = 0; v43 < 32; v43 += 1) {	// L11, [0,34), iterCycle=1, II=1
        v9[v41][v42][v43] = v0;	// L12, [0,1)
      }
    }
  }
  for (int v44 = 0; v44 < 3; v44 += 1) {	// L16, [69762,512143), iterCycle=12, II=1
    for (int v45 = 0; v45 < 3; v45 += 1) {	// L17, [168697150,168844619), iterCycle=12, II=1
      for (int v46 = 0; v46 < 3; v46 += 1) {	// L18, [168697150,168746315), iterCycle=12, II=1
        for (int v47 = 0; v47 < 16; v47 += 1) {	// L19, [168697150,168713547), iterCycle=12, II=1
          for (int v48 = 0; v48 < 32; v48 += 1) {	// L20, [168697150,168698187), iterCycle=12, II=1
            for (int v49 = 0; v49 < 32; v49 += 1) {	// L21, [168697150,168697195), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v50 = v37[v44][(v48 + v45)][(v49 + v46)];	// L22, [0,2)
              float v51 = v1[(v47 * 4)][v44][v45][v46];	// L23, [0,2)
              float v52 = v50 * v51;	// L24, [2,6)
              float v53 = v9[(v47 * 4)][v48][v49];	// L25, [4,6)
              float v54 = v52 + v53;	// L26, [6,11)
              v9[(v47 * 4)][v48][v49] = v54;	// L27, [11,12)
              float v55 = v1[((v47 * 4) + 1)][v44][v45][v46];	// L28, [0,2)
              float v56 = v50 * v55;	// L29, [2,6)
              float v57 = v9[((v47 * 4) + 1)][v48][v49];	// L30, [4,6)
              float v58 = v56 + v57;	// L31, [6,11)
              v9[((v47 * 4) + 1)][v48][v49] = v58;	// L32, [11,12)
              float v59 = v1[((v47 * 4) + 2)][v44][v45][v46];	// L33, [0,2)
              float v60 = v50 * v59;	// L34, [2,6)
              float v61 = v9[((v47 * 4) + 2)][v48][v49];	// L35, [4,6)
              float v62 = v60 + v61;	// L36, [6,11)
              v9[((v47 * 4) + 2)][v48][v49] = v62;	// L37, [11,12)
              float v63 = v1[((v47 * 4) + 3)][v44][v45][v46];	// L38, [0,2)
              float v64 = v50 * v63;	// L39, [2,6)
              float v65 = v9[((v47 * 4) + 3)][v48][v49];	// L40, [4,6)
              float v66 = v64 + v65;	// L41, [6,11)
              v9[((v47 * 4) + 3)][v48][v49] = v66;	// L42, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v67 = 0; v67 < 64; v67 += 1) {	// L49, [512143,712977), iterCycle=3138, II=3138
    for (int v68 = 0; v68 < 32; v68 += 1) {	// L50, [0,3138), iterCycle=98, II=98
      for (int v69 = 0; v69 < 32; v69 += 1) {	// L51, [0,98), iterCycle=3, II=3
        float v70 = v9[v67][v68][v69];	// L52, [0,2)
        v9[v67][v68][v69] = max(v70,v0);	
        // L53, [2,3)
      }
    }
  }
  for (int v71 = 0; v71 < 64; v71 += 1) {	// L57, [712977,782739), iterCycle=1090, II=1090
    for (int v72 = 0; v72 < 32; v72 += 1) {	// L58, [0,1090), iterCycle=34, II=34
      for (int v73 = 0; v73 < 32; v73 += 1) {	// L59, [0,34), iterCycle=1, II=1
        v20[v71][v72][v73] = v0;	// L60, [0,1)
      }
    }
  }
  for (int v74 = 0; v74 < 64; v74 += 1) {	// L64, [782739,10219936), iterCycle=12, II=1
    for (int v75 = 0; v75 < 3; v75 += 1) {	// L65, [158989357,159136826), iterCycle=12, II=1
      for (int v76 = 0; v76 < 3; v76 += 1) {	// L66, [158989357,159038522), iterCycle=12, II=1
        for (int v77 = 0; v77 < 16; v77 += 1) {	// L67, [158989357,159005754), iterCycle=12, II=1
          for (int v78 = 0; v78 < 32; v78 += 1) {	// L68, [158989357,158990394), iterCycle=12, II=1
            for (int v79 = 0; v79 < 32; v79 += 1) {	// L69, [158989357,158989402), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v80 = v9[v74][(v78 + v75)][(v79 + v76)];	// L70, [0,2)
              float v81 = v2[(v77 * 4)][v74][v75][v76];	// L71, [0,2)
              float v82 = v80 * v81;	// L72, [2,6)
              float v83 = v20[(v77 * 4)][v78][v79];	// L73, [4,6)
              float v84 = v82 + v83;	// L74, [6,11)
              v20[(v77 * 4)][v78][v79] = v84;	// L75, [11,12)
              float v85 = v2[((v77 * 4) + 1)][v74][v75][v76];	// L76, [0,2)
              float v86 = v80 * v85;	// L77, [2,6)
              float v87 = v20[((v77 * 4) + 1)][v78][v79];	// L78, [4,6)
              float v88 = v86 + v87;	// L79, [6,11)
              v20[((v77 * 4) + 1)][v78][v79] = v88;	// L80, [11,12)
              float v89 = v2[((v77 * 4) + 2)][v74][v75][v76];	// L81, [0,2)
              float v90 = v80 * v89;	// L82, [2,6)
              float v91 = v20[((v77 * 4) + 2)][v78][v79];	// L83, [4,6)
              float v92 = v90 + v91;	// L84, [6,11)
              v20[((v77 * 4) + 2)][v78][v79] = v92;	// L85, [11,12)
              float v93 = v2[((v77 * 4) + 3)][v74][v75][v76];	// L86, [0,2)
              float v94 = v80 * v93;	// L87, [2,6)
              float v95 = v20[((v77 * 4) + 3)][v78][v79];	// L88, [4,6)
              float v96 = v94 + v95;	// L89, [6,11)
              v20[((v77 * 4) + 3)][v78][v79] = v96;	// L90, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v97 = 0; v97 < 64; v97 += 1) {	// L97, [10219936,10420770), iterCycle=3138, II=3138
    for (int v98 = 0; v98 < 32; v98 += 1) {	// L98, [0,3138), iterCycle=98, II=98
      for (int v99 = 0; v99 < 32; v99 += 1) {	// L99, [0,98), iterCycle=3, II=3
        float v100 = v20[v97][v98][v99];	// L100, [0,2)
        v20[v97][v98][v99] = max(v100,v0);	// L101, [2,3)
      }
    }
  }
  for (int v101 = 0; v101 < 64; v101 += 1) {	// L105, [10420770,10490532), iterCycle=1090, II=1090
    for (int v102 = 0; v102 < 32; v102 += 1) {	// L106, [0,1090), iterCycle=34, II=34
      for (int v103 = 0; v103 < 32; v103 += 1) {	// L107, [0,34), iterCycle=1, II=1
        v30[v101][v102][v103] = v0;	// L108, [0,1)
      }
    }
  }
  for (int v104 = 0; v104 < 64; v104 += 1) {	// L112, [10490532,19927729), iterCycle=12, II=1
    for (int v105 = 0; v105 < 3; v105 += 1) {	// L113, [149281564,149429033), iterCycle=12, II=1
      for (int v106 = 0; v106 < 3; v106 += 1) {	// L114, [149281564,149330729), iterCycle=12, II=1
        for (int v107 = 0; v107 < 16; v107 += 1) {	// L115, [149281564,149297961), iterCycle=12, II=1
          for (int v108 = 0; v108 < 32; v108 += 1) {	// L116, [149281564,149282601), iterCycle=12, II=1
            for (int v109 = 0; v109 < 32; v109 += 1) {	// L117, [149281564,149281609), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v110 = v20[v104][(v108 + v105)][(v109 + v106)];	// L118, [0,2)
              float v111 = v2[(v107 * 4)][v104][v105][v106];	// L119, [0,2)
              float v112 = v110 * v111;	// L120, [2,6)
              float v113 = v30[(v107 * 4)][v108][v109];	// L121, [4,6)
              float v114 = v112 + v113;	// L122, [6,11)
              v30[(v107 * 4)][v108][v109] = v114;	// L123, [11,12)
              float v115 = v2[((v107 * 4) + 1)][v104][v105][v106];	// L124, [0,2)
              float v116 = v110 * v115;	// L125, [2,6)
              float v117 = v30[((v107 * 4) + 1)][v108][v109];	// L126, [4,6)
              float v118 = v116 + v117;	// L127, [6,11)
              v30[((v107 * 4) + 1)][v108][v109] = v118;	// L128, [11,12)
              float v119 = v2[((v107 * 4) + 2)][v104][v105][v106];	// L129, [0,2)
              float v120 = v110 * v119;	// L130, [2,6)
              float v121 = v30[((v107 * 4) + 2)][v108][v109];	// L131, [4,6)
              float v122 = v120 + v121;	// L132, [6,11)
              v30[((v107 * 4) + 2)][v108][v109] = v122;	// L133, [11,12)
              float v123 = v2[((v107 * 4) + 3)][v104][v105][v106];	// L134, [0,2)
              float v124 = v110 * v123;	// L135, [2,6)
              float v125 = v30[((v107 * 4) + 3)][v108][v109];	// L136, [4,6)
              float v126 = v124 + v125;	// L137, [6,11)
              v30[((v107 * 4) + 3)][v108][v109] = v126;	// L138, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v127 = 0; v127 < 64; v127 += 1) {	// L145, [19927729,20456243), iterCycle=8258, II=8258
    for (int v128 = 0; v128 < 32; v128 += 1) {	// L146, [0,8258), iterCycle=258, II=258
      for (int v129 = 0; v129 < 32; v129 += 1) {	// L147, [0,258), iterCycle=8, II=8
        float v130 = v30[v127][v128][v129];	// L148, [0,2)
        float v131 = v9[v127][v128][v129];	// L149, [0,2)
        float v132 = v130 + v131;	// L150, [2,7)
        v31[v127][v128][v129] = v132;	// L151, [7,8)
      }
    }
  }
  for (int v133 = 0; v133 < 64; v133 += 1) {	// L155, [20456243,20657077), iterCycle=3138, II=3138
    for (int v134 = 0; v134 < 32; v134 += 1) {	// L156, [0,3138), iterCycle=98, II=98
      for (int v135 = 0; v135 < 32; v135 += 1) {	// L157, [0,98), iterCycle=3, II=3
        float v136 = v31[v133][v134][v135];	// L158, [0,2)
        v31[v133][v134][v135] = max(v136,v0);	// L159, [2,3)
      }
    }
  }
  for (int v137 = 0; v137 < 64; v137 += 1) {	// L163, [20657077,20726839), iterCycle=1090, II=1090
    for (int v138 = 0; v138 < 32; v138 += 1) {	// L164, [0,1090), iterCycle=34, II=34
      for (int v139 = 0; v139 < 32; v139 += 1) {	// L165, [0,34), iterCycle=1, II=1
        v32[v137][v138][v139] = v0;	// L166, [0,1)
      }
    }
  }
  for (int v140 = 0; v140 < 64; v140 += 1) {	// L170, [20726839,30164036), iterCycle=12, II=1
    for (int v141 = 0; v141 < 3; v141 += 1) {	// L171, [139045257,139192726), iterCycle=12, II=1
      for (int v142 = 0; v142 < 3; v142 += 1) {	// L172, [139045257,139094422), iterCycle=12, II=1
        for (int v143 = 0; v143 < 16; v143 += 1) {	// L173, [139045257,139061654), iterCycle=12, II=1
          for (int v144 = 0; v144 < 32; v144 += 1) {	// L174, [139045257,139046294), iterCycle=12, II=1
            for (int v145 = 0; v145 < 32; v145 += 1) {	// L175, [139045257,139045302), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v146 = v31[v140][(v144 + v141)][(v145 + v142)];	// L176, [0,2)
              float v147 = v2[(v143 * 4)][v140][v141][v142];	// L177, [0,2)
              float v148 = v146 * v147;	// L178, [2,6)
              float v149 = v32[(v143 * 4)][v144][v145];	// L179, [4,6)
              float v150 = v148 + v149;	// L180, [6,11)
              v32[(v143 * 4)][v144][v145] = v150;	// L181, [11,12)
              float v151 = v2[((v143 * 4) + 1)][v140][v141][v142];	// L182, [0,2)
              float v152 = v146 * v151;	// L183, [2,6)
              float v153 = v32[((v143 * 4) + 1)][v144][v145];	// L184, [4,6)
              float v154 = v152 + v153;	// L185, [6,11)
              v32[((v143 * 4) + 1)][v144][v145] = v154;	// L186, [11,12)
              float v155 = v2[((v143 * 4) + 2)][v140][v141][v142];	// L187, [0,2)
              float v156 = v146 * v155;	// L188, [2,6)
              float v157 = v32[((v143 * 4) + 2)][v144][v145];	// L189, [4,6)
              float v158 = v156 + v157;	// L190, [6,11)
              v32[((v143 * 4) + 2)][v144][v145] = v158;	// L191, [11,12)
              float v159 = v2[((v143 * 4) + 3)][v140][v141][v142];	// L192, [0,2)
              float v160 = v146 * v159;	// L193, [2,6)
              float v161 = v32[((v143 * 4) + 3)][v144][v145];	// L194, [4,6)
              float v162 = v160 + v161;	// L195, [6,11)
              v32[((v143 * 4) + 3)][v144][v145] = v162;	// L196, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v163 = 0; v163 < 64; v163 += 1) {	// L203, [30164036,30364870), iterCycle=3138, II=3138
    for (int v164 = 0; v164 < 32; v164 += 1) {	// L204, [0,3138), iterCycle=98, II=98
      for (int v165 = 0; v165 < 32; v165 += 1) {	// L205, [0,98), iterCycle=3, II=3
        float v166 = v32[v163][v164][v165];	// L206, [0,2)
        v32[v163][v164][v165] = max(v166,v0);	// L207, [2,3)
      }
    }
  }
  for (int v167 = 0; v167 < 64; v167 += 1) {	// L211, [30364870,30434632), iterCycle=1090, II=1090
    for (int v168 = 0; v168 < 32; v168 += 1) {	// L212, [0,1090), iterCycle=34, II=34
      for (int v169 = 0; v169 < 32; v169 += 1) {	// L213, [0,34), iterCycle=1, II=1
        v33[v167][v168][v169] = v0;	// L214, [0,1)
      }
    }
  }
  for (int v170 = 0; v170 < 64; v170 += 1) {	// L218, [30434632,39871829), iterCycle=12, II=1
    for (int v171 = 0; v171 < 3; v171 += 1) {	// L219, [129337464,129484933), iterCycle=12, II=1
      for (int v172 = 0; v172 < 3; v172 += 1) {	// L220, [129337464,129386629), iterCycle=12, II=1
        for (int v173 = 0; v173 < 16; v173 += 1) {	// L221, [129337464,129353861), iterCycle=12, II=1
          for (int v174 = 0; v174 < 32; v174 += 1) {	// L222, [129337464,129338501), iterCycle=12, II=1
            for (int v175 = 0; v175 < 32; v175 += 1) {	// L223, [129337464,129337509), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v176 = v32[v170][(v174 + v171)][(v175 + v172)];	// L224, [0,2)
              float v177 = v2[(v173 * 4)][v170][v171][v172];	// L225, [0,2)
              float v178 = v176 * v177;	// L226, [2,6)
              float v179 = v33[(v173 * 4)][v174][v175];	// L227, [4,6)
              float v180 = v178 + v179;	// L228, [6,11)
              v33[(v173 * 4)][v174][v175] = v180;	// L229, [11,12)
              float v181 = v2[((v173 * 4) + 1)][v170][v171][v172];	// L230, [0,2)
              float v182 = v176 * v181;	// L231, [2,6)
              float v183 = v33[((v173 * 4) + 1)][v174][v175];	// L232, [4,6)
              float v184 = v182 + v183;	// L233, [6,11)
              v33[((v173 * 4) + 1)][v174][v175] = v184;	// L234, [11,12)
              float v185 = v2[((v173 * 4) + 2)][v170][v171][v172];	// L235, [0,2)
              float v186 = v176 * v185;	// L236, [2,6)
              float v187 = v33[((v173 * 4) + 2)][v174][v175];	// L237, [4,6)
              float v188 = v186 + v187;	// L238, [6,11)
              v33[((v173 * 4) + 2)][v174][v175] = v188;	// L239, [11,12)
              float v189 = v2[((v173 * 4) + 3)][v170][v171][v172];	// L240, [0,2)
              float v190 = v176 * v189;	// L241, [2,6)
              float v191 = v33[((v173 * 4) + 3)][v174][v175];	// L242, [4,6)
              float v192 = v190 + v191;	// L243, [6,11)
              v33[((v173 * 4) + 3)][v174][v175] = v192;	// L244, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v193 = 0; v193 < 64; v193 += 1) {	// L251, [39871829,40400343), iterCycle=8258, II=8258
    for (int v194 = 0; v194 < 32; v194 += 1) {	// L252, [0,8258), iterCycle=258, II=258
      for (int v195 = 0; v195 < 32; v195 += 1) {	// L253, [0,258), iterCycle=8, II=8
        float v196 = v33[v193][v194][v195];	// L254, [0,2)
        float v197 = v31[v193][v194][v195];	// L255, [0,2)
        float v198 = v196 + v197;	// L256, [2,7)
        v34[v193][v194][v195] = v198;	// L257, [7,8)
      }
    }
  }
  for (int v199 = 0; v199 < 64; v199 += 1) {	// L261, [40400343,40601177), iterCycle=3138, II=3138
    for (int v200 = 0; v200 < 32; v200 += 1) {	// L262, [0,3138), iterCycle=98, II=98
      for (int v201 = 0; v201 < 32; v201 += 1) {	// L263, [0,98), iterCycle=3, II=3
        float v202 = v34[v199][v200][v201];	// L264, [0,2)
        v34[v199][v200][v201] = max(v202,v0);	// L265, [2,3)
      }
    }
  }
  for (int v203 = 0; v203 < 128; v203 += 1) {	// L269, [40601177,40638299), iterCycle=290, II=290
    for (int v204 = 0; v204 < 16; v204 += 1) {	// L270, [0,290), iterCycle=18, II=18
      for (int v205 = 0; v205 < 16; v205 += 1) {	// L271, [0,18), iterCycle=1, II=1
        v35[v203][v204][v205] = v0;	// L272, [0,1)
      }
    }
  }
  for (int v206 = 0; v206 < 64; v206 += 1) {	// L276, [40638299,45356904), iterCycle=12, II=1
    for (int v207 = 0; v207 < 3; v207 += 1) {	// L277, [123852389,123926130), iterCycle=12, II=1
      for (int v208 = 0; v208 < 3; v208 += 1) {	// L278, [123852389,123876978), iterCycle=12, II=1
        for (int v209 = 0; v209 < 32; v209 += 1) {	// L279, [123852389,123860594), iterCycle=12, II=1
          for (int v210 = 0; v210 < 16; v210 += 1) {	// L280, [123852389,123852658), iterCycle=12, II=1
            for (int v211 = 0; v211 < 16; v211 += 1) {	// L281, [123852389,123852418), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v212 = v34[v206][((v210 * 2) + v207)][((v211 * 2) + v208)];	// L282, [0,2)
              float v213 = v3[(v209 * 4)][v206][v207][v208];	// L283, [0,2)
              float v214 = v212 * v213;	// L284, [2,6)
              float v215 = v35[(v209 * 4)][v210][v211];	// L285, [4,6)
              float v216 = v214 + v215;	// L286, [6,11)
              v35[(v209 * 4)][v210][v211] = v216;	// L287, [11,12)
              float v217 = v3[((v209 * 4) + 1)][v206][v207][v208];	// L288, [0,2)
              float v218 = v212 * v217;	// L289, [2,6)
              float v219 = v35[((v209 * 4) + 1)][v210][v211];	// L290, [4,6)
              float v220 = v218 + v219;	// L291, [6,11)
              v35[((v209 * 4) + 1)][v210][v211] = v220;	// L292, [11,12)
              float v221 = v3[((v209 * 4) + 2)][v206][v207][v208];	// L293, [0,2)
              float v222 = v212 * v221;	// L294, [2,6)
              float v223 = v35[((v209 * 4) + 2)][v210][v211];	// L295, [4,6)
              float v224 = v222 + v223;	// L296, [6,11)
              v35[((v209 * 4) + 2)][v210][v211] = v224;	// L297, [11,12)
              float v225 = v3[((v209 * 4) + 3)][v206][v207][v208];	// L298, [0,2)
              float v226 = v212 * v225;	// L299, [2,6)
              float v227 = v35[((v209 * 4) + 3)][v210][v211];	// L300, [4,6)
              float v228 = v226 + v227;	// L301, [6,11)
              v35[((v209 * 4) + 3)][v210][v211] = v228;	// L302, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v229 = 0; v229 < 128; v229 += 1) {	// L309, [45356904,45459562), iterCycle=802, II=802
    for (int v230 = 0; v230 < 16; v230 += 1) {	// L310, [0,802), iterCycle=50, II=50
      for (int v231 = 0; v231 < 16; v231 += 1) {	// L311, [0,50), iterCycle=3, II=3
        float v232 = v35[v229][v230][v231];	// L312, [0,2)
        v35[v229][v230][v231] = max(v232,v0);	// L313, [2,3)
      }
    }
  }
  for (int v233 = 0; v233 < 128; v233 += 1) {	// L317, [45459562,45496684), iterCycle=290, II=290
    for (int v234 = 0; v234 < 16; v234 += 1) {	// L318, [0,290), iterCycle=18, II=18
      for (int v235 = 0; v235 < 16; v235 += 1) {	// L319, [0,18), iterCycle=1, II=1
        v36[v233][v234][v235] = v0;	// L320, [0,1)
      }
    }
  }
  for (int v236 = 0; v236 < 128; v236 += 1) {	// L324, [45496684,54933881), iterCycle=12, II=1
    for (int v237 = 0; v237 < 3; v237 += 1) {	// L325, [114275412,114349153), iterCycle=12, II=1
      for (int v238 = 0; v238 < 3; v238 += 1) {	// L326, [114275412,114300001), iterCycle=12, II=1
        for (int v239 = 0; v239 < 32; v239 += 1) {	// L327, [114275412,114283617), iterCycle=12, II=1
          for (int v240 = 0; v240 < 16; v240 += 1) {	// L328, [114275412,114275681), iterCycle=12, II=1
            for (int v241 = 0; v241 < 16; v241 += 1) {	// L329, [114275412,114275441), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v242 = v35[v236][(v240 + v237)][(v241 + v238)];	// L330, [0,2)
              float v243 = v4[(v239 * 4)][v236][v237][v238];	// L331, [0,2)
              float v244 = v242 * v243;	// L332, [2,6)
              float v245 = v36[(v239 * 4)][v240][v241];	// L333, [4,6)
              float v246 = v244 + v245;	// L334, [6,11)
              v36[(v239 * 4)][v240][v241] = v246;	// L335, [11,12)
              float v247 = v4[((v239 * 4) + 1)][v236][v237][v238];	// L336, [0,2)
              float v248 = v242 * v247;	// L337, [2,6)
              float v249 = v36[((v239 * 4) + 1)][v240][v241];	// L338, [4,6)
              float v250 = v248 + v249;	// L339, [6,11)
              v36[((v239 * 4) + 1)][v240][v241] = v250;	// L340, [11,12)
              float v251 = v4[((v239 * 4) + 2)][v236][v237][v238];	// L341, [0,2)
              float v252 = v242 * v251;	// L342, [2,6)
              float v253 = v36[((v239 * 4) + 2)][v240][v241];	// L343, [4,6)
              float v254 = v252 + v253;	// L344, [6,11)
              v36[((v239 * 4) + 2)][v240][v241] = v254;	// L345, [11,12)
              float v255 = v4[((v239 * 4) + 3)][v236][v237][v238];	// L346, [0,2)
              float v256 = v242 * v255;	// L347, [2,6)
              float v257 = v36[((v239 * 4) + 3)][v240][v241];	// L348, [4,6)
              float v258 = v256 + v257;	// L349, [6,11)
              v36[((v239 * 4) + 3)][v240][v241] = v258;	// L350, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v259 = 0; v259 < 64; v259 += 1) {	// L357, [54933881,80378363), iterCycle=397570, II=397570
    for (int v260 = 0; v260 < 128; v260 += 1) {	// L358, [0,397570), iterCycle=3106, II=3106
      for (int v261 = 0; v261 < 16; v261 += 1) {	// L359, [0,3106), iterCycle=194, II=194
        for (int v262 = 0; v262 < 16; v262 += 1) {	// L360, [0,194), iterCycle=12, II=12
          float v263 = v34[v259][(v261 * 2)][(v262 * 2)];	// L361, [0,2)
          float v264 = v38[v260][v259];	// L362, [0,2)
          float v265 = v263 * v264;	// L363, [2,6)
          float v266 = v10[v260][v261][v262];	// L364, [4,6)
          float v267 = v266 + v265;	// L365, [6,11)
          v10[v260][v261][v262] = v267;	// L366, [11,12)
        }
      }
    }
  }
  for (int v268 = 0; v268 < 128; v268 += 1) {	// L371, [80378363,80644861), iterCycle=2082, II=2082
    for (int v269 = 0; v269 < 16; v269 += 1) {	// L372, [0,2082), iterCycle=130, II=130
      for (int v270 = 0; v270 < 16; v270 += 1) {	// L373, [0,130), iterCycle=8, II=8
        float v271 = v10[v268][v269][v270];	// L374, [0,2)
        float v272 = v36[v268][v269][v270];	// L375, [0,2)
        float v273 = v271 + v272;	// L376, [2,7)
        v11[v268][v269][v270] = v273;	// L377, [7,8)
      }
    }
  }
  for (int v274 = 0; v274 < 128; v274 += 1) {	// L381, [80644861,80747519), iterCycle=802, II=802
    for (int v275 = 0; v275 < 16; v275 += 1) {	// L382, [0,802), iterCycle=50, II=50
      for (int v276 = 0; v276 < 16; v276 += 1) {	// L383, [0,50), iterCycle=3, II=3
        float v277 = v11[v274][v275][v276];	// L384, [0,2)
        v11[v274][v275][v276] = max(v277,v0);	// L385, [2,3)
      }
    }
  }
  for (int v278 = 0; v278 < 128; v278 += 1) {	// L389, [80747519,80784641), iterCycle=290, II=290
    for (int v279 = 0; v279 < 16; v279 += 1) {	// L390, [0,290), iterCycle=18, II=18
      for (int v280 = 0; v280 < 16; v280 += 1) {	// L391, [0,18), iterCycle=1, II=1
        v12[v278][v279][v280] = v0;	// L392, [0,1)
      }
    }
  }
  for (int v281 = 0; v281 < 128; v281 += 1) {	// L396, [80784641,90221838), iterCycle=12, II=1
    for (int v282 = 0; v282 < 3; v282 += 1) {	// L397, [78987455,79061196), iterCycle=12, II=1
      for (int v283 = 0; v283 < 3; v283 += 1) {	// L398, [78987455,79012044), iterCycle=12, II=1
        for (int v284 = 0; v284 < 32; v284 += 1) {	// L399, [78987455,78995660), iterCycle=12, II=1
          for (int v285 = 0; v285 < 16; v285 += 1) {	// L400, [78987455,78987724), iterCycle=12, II=1
            for (int v286 = 0; v286 < 16; v286 += 1) {	// L401, [78987455,78987484), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v287 = v11[v281][(v285 + v282)][(v286 + v283)];	// L402, [0,2)
              float v288 = v4[(v284 * 4)][v281][v282][v283];	// L403, [0,2)
              float v289 = v287 * v288;	// L404, [2,6)
              float v290 = v12[(v284 * 4)][v285][v286];	// L405, [4,6)
              float v291 = v289 + v290;	// L406, [6,11)
              v12[(v284 * 4)][v285][v286] = v291;	// L407, [11,12)
              float v292 = v4[((v284 * 4) + 1)][v281][v282][v283];	// L408, [0,2)
              float v293 = v287 * v292;	// L409, [2,6)
              float v294 = v12[((v284 * 4) + 1)][v285][v286];	// L410, [4,6)
              float v295 = v293 + v294;	// L411, [6,11)
              v12[((v284 * 4) + 1)][v285][v286] = v295;	// L412, [11,12)
              float v296 = v4[((v284 * 4) + 2)][v281][v282][v283];	// L413, [0,2)
              float v297 = v287 * v296;	// L414, [2,6)
              float v298 = v12[((v284 * 4) + 2)][v285][v286];	// L415, [4,6)
              float v299 = v297 + v298;	// L416, [6,11)
              v12[((v284 * 4) + 2)][v285][v286] = v299;	// L417, [11,12)
              float v300 = v4[((v284 * 4) + 3)][v281][v282][v283];	// L418, [0,2)
              float v301 = v287 * v300;	// L419, [2,6)
              float v302 = v12[((v284 * 4) + 3)][v285][v286];	// L420, [4,6)
              float v303 = v301 + v302;	// L421, [6,11)
              v12[((v284 * 4) + 3)][v285][v286] = v303;	// L422, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v304 = 0; v304 < 128; v304 += 1) {	// L429, [90221838,90324496), iterCycle=802, II=802
    for (int v305 = 0; v305 < 16; v305 += 1) {	// L430, [0,802), iterCycle=50, II=50
      for (int v306 = 0; v306 < 16; v306 += 1) {	// L431, [0,50), iterCycle=3, II=3
        float v307 = v12[v304][v305][v306];	// L432, [0,2)
        v12[v304][v305][v306] = max(v307,v0);	// L433, [2,3)
      }
    }
  }
  for (int v308 = 0; v308 < 128; v308 += 1) {	// L437, [90324496,90361618), iterCycle=290, II=290
    for (int v309 = 0; v309 < 16; v309 += 1) {	// L438, [0,290), iterCycle=18, II=18
      for (int v310 = 0; v310 < 16; v310 += 1) {	// L439, [0,18), iterCycle=1, II=1
        v13[v308][v309][v310] = v0;	// L440, [0,1)
      }
    }
  }
  for (int v311 = 0; v311 < 128; v311 += 1) {	// L444, [90361618,99798815), iterCycle=12, II=1
    for (int v312 = 0; v312 < 3; v312 += 1) {	// L445, [69410478,69484219), iterCycle=12, II=1
      for (int v313 = 0; v313 < 3; v313 += 1) {	// L446, [69410478,69435067), iterCycle=12, II=1
        for (int v314 = 0; v314 < 32; v314 += 1) {	// L447, [69410478,69418683), iterCycle=12, II=1
          for (int v315 = 0; v315 < 16; v315 += 1) {	// L448, [69410478,69410747), iterCycle=12, II=1
            for (int v316 = 0; v316 < 16; v316 += 1) {	// L449, [69410478,69410507), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v317 = v12[v311][(v315 + v312)][(v316 + v313)];	// L450, [0,2)
              float v318 = v4[(v314 * 4)][v311][v312][v313];	// L451, [0,2)
              float v319 = v317 * v318;	// L452, [2,6)
              float v320 = v13[(v314 * 4)][v315][v316];	// L453, [4,6)
              float v321 = v319 + v320;	// L454, [6,11)
              v13[(v314 * 4)][v315][v316] = v321;	// L455, [11,12)
              float v322 = v4[((v314 * 4) + 1)][v311][v312][v313];	// L456, [0,2)
              float v323 = v317 * v322;	// L457, [2,6)
              float v324 = v13[((v314 * 4) + 1)][v315][v316];	// L458, [4,6)
              float v325 = v323 + v324;	// L459, [6,11)
              v13[((v314 * 4) + 1)][v315][v316] = v325;	// L460, [11,12)
              float v326 = v4[((v314 * 4) + 2)][v311][v312][v313];	// L461, [0,2)
              float v327 = v317 * v326;	// L462, [2,6)
              float v328 = v13[((v314 * 4) + 2)][v315][v316];	// L463, [4,6)
              float v329 = v327 + v328;	// L464, [6,11)
              v13[((v314 * 4) + 2)][v315][v316] = v329;	// L465, [11,12)
              float v330 = v4[((v314 * 4) + 3)][v311][v312][v313];	// L466, [0,2)
              float v331 = v317 * v330;	// L467, [2,6)
              float v332 = v13[((v314 * 4) + 3)][v315][v316];	// L468, [4,6)
              float v333 = v331 + v332;	// L469, [6,11)
              v13[((v314 * 4) + 3)][v315][v316] = v333;	// L470, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v334 = 0; v334 < 128; v334 += 1) {	// L477, [99798815,100065313), iterCycle=2082, II=2082
    for (int v335 = 0; v335 < 16; v335 += 1) {	// L478, [0,2082), iterCycle=130, II=130
      for (int v336 = 0; v336 < 16; v336 += 1) {	// L479, [0,130), iterCycle=8, II=8
        float v337 = v13[v334][v335][v336];	// L480, [0,2)
        float v338 = v11[v334][v335][v336];	// L481, [0,2)
        float v339 = v337 + v338;	// L482, [2,7)
        v14[v334][v335][v336] = v339;	// L483, [7,8)
      }
    }
  }
  for (int v340 = 0; v340 < 128; v340 += 1) {	// L487, [100065313,100167971), iterCycle=802, II=802
    for (int v341 = 0; v341 < 16; v341 += 1) {	// L488, [0,802), iterCycle=50, II=50
      for (int v342 = 0; v342 < 16; v342 += 1) {	// L489, [0,50), iterCycle=3, II=3
        float v343 = v14[v340][v341][v342];	// L490, [0,2)
        v14[v340][v341][v342] = max(v343,v0);	// L491, [2,3)
      }
    }
  }
  for (int v344 = 0; v344 < 256; v344 += 1) {	// L495, [100167971,100188965), iterCycle=82, II=82
    for (int v345 = 0; v345 < 8; v345 += 1) {	// L496, [0,82), iterCycle=10, II=10
      for (int v346 = 0; v346 < 8; v346 += 1) {	// L497, [0,10), iterCycle=1, II=1
        v15[v344][v345][v346] = v0;	// L498, [0,1)
      }
    }
  }
  for (int v347 = 0; v347 < 128; v347 += 1) {	// L502, [100188965,104907570), iterCycle=12, II=1
    for (int v348 = 0; v348 < 3; v348 += 1) {	// L503, [64301723,64338600), iterCycle=12, II=1
      for (int v349 = 0; v349 < 3; v349 += 1) {	// L504, [64301723,64314024), iterCycle=12, II=1
        for (int v350 = 0; v350 < 64; v350 += 1) {	// L505, [64301723,64305832), iterCycle=12, II=1
          for (int v351 = 0; v351 < 8; v351 += 1) {	// L506, [64301723,64301800), iterCycle=12, II=1
            for (int v352 = 0; v352 < 8; v352 += 1) {	// L507, [64301723,64301744), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v353 = v14[v347][((v351 * 2) + v348)][((v352 * 2) + v349)];	// L508, [0,2)
              float v354 = v5[(v350 * 4)][v347][v348][v349];	// L509, [0,2)
              float v355 = v353 * v354;	// L510, [2,6)
              float v356 = v15[(v350 * 4)][v351][v352];	// L511, [4,6)
              float v357 = v355 + v356;	// L512, [6,11)
              v15[(v350 * 4)][v351][v352] = v357;	// L513, [11,12)
              float v358 = v5[((v350 * 4) + 1)][v347][v348][v349];	// L514, [0,2)
              float v359 = v353 * v358;	// L515, [2,6)
              float v360 = v15[((v350 * 4) + 1)][v351][v352];	// L516, [4,6)
              float v361 = v359 + v360;	// L517, [6,11)
              v15[((v350 * 4) + 1)][v351][v352] = v361;	// L518, [11,12)
              float v362 = v5[((v350 * 4) + 2)][v347][v348][v349];	// L519, [0,2)
              float v363 = v353 * v362;	// L520, [2,6)
              float v364 = v15[((v350 * 4) + 2)][v351][v352];	// L521, [4,6)
              float v365 = v363 + v364;	// L522, [6,11)
              v15[((v350 * 4) + 2)][v351][v352] = v365;	// L523, [11,12)
              float v366 = v5[((v350 * 4) + 3)][v347][v348][v349];	// L524, [0,2)
              float v367 = v353 * v366;	// L525, [2,6)
              float v368 = v15[((v350 * 4) + 3)][v351][v352];	// L526, [4,6)
              float v369 = v367 + v368;	// L527, [6,11)
              v15[((v350 * 4) + 3)][v351][v352] = v369;	// L528, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v370 = 0; v370 < 256; v370 += 1) {	// L535, [104907570,104961332), iterCycle=210, II=210
    for (int v371 = 0; v371 < 8; v371 += 1) {	// L536, [0,210), iterCycle=26, II=26
      for (int v372 = 0; v372 < 8; v372 += 1) {	// L537, [0,26), iterCycle=3, II=3
        float v373 = v15[v370][v371][v372];	// L538, [0,2)
        v15[v370][v371][v372] = max(v373,v0);	// L539, [2,3)
      }
    }
  }
  for (int v374 = 0; v374 < 256; v374 += 1) {	// L543, [104961332,104982326), iterCycle=82, II=82
    for (int v375 = 0; v375 < 8; v375 += 1) {	// L544, [0,82), iterCycle=10, II=10
      for (int v376 = 0; v376 < 8; v376 += 1) {	// L545, [0,10), iterCycle=1, II=1
        v16[v374][v375][v376] = v0;	// L546, [0,1)
      }
    }
  }
  for (int v377 = 0; v377 < 256; v377 += 1) {	// L550, [104982326,114419523), iterCycle=12, II=1
    for (int v378 = 0; v378 < 3; v378 += 1) {	// L551, [54789770,54826647), iterCycle=12, II=1
      for (int v379 = 0; v379 < 3; v379 += 1) {	// L552, [54789770,54802071), iterCycle=12, II=1
        for (int v380 = 0; v380 < 64; v380 += 1) {	// L553, [54789770,54793879), iterCycle=12, II=1
          for (int v381 = 0; v381 < 8; v381 += 1) {	// L554, [54789770,54789847), iterCycle=12, II=1
            for (int v382 = 0; v382 < 8; v382 += 1) {	// L555, [54789770,54789791), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v383 = v15[v377][(v381 + v378)][(v382 + v379)];	// L556, [0,2)
              float v384 = v6[(v380 * 4)][v377][v378][v379];	// L557, [0,2)
              float v385 = v383 * v384;	// L558, [2,6)
              float v386 = v16[(v380 * 4)][v381][v382];	// L559, [4,6)
              float v387 = v385 + v386;	// L560, [6,11)
              v16[(v380 * 4)][v381][v382] = v387;	// L561, [11,12)
              float v388 = v6[((v380 * 4) + 1)][v377][v378][v379];	// L562, [0,2)
              float v389 = v383 * v388;	// L563, [2,6)
              float v390 = v16[((v380 * 4) + 1)][v381][v382];	// L564, [4,6)
              float v391 = v389 + v390;	// L565, [6,11)
              v16[((v380 * 4) + 1)][v381][v382] = v391;	// L566, [11,12)
              float v392 = v6[((v380 * 4) + 2)][v377][v378][v379];	// L567, [0,2)
              float v393 = v383 * v392;	// L568, [2,6)
              float v394 = v16[((v380 * 4) + 2)][v381][v382];	// L569, [4,6)
              float v395 = v393 + v394;	// L570, [6,11)
              v16[((v380 * 4) + 2)][v381][v382] = v395;	// L571, [11,12)
              float v396 = v6[((v380 * 4) + 3)][v377][v378][v379];	// L572, [0,2)
              float v397 = v383 * v396;	// L573, [2,6)
              float v398 = v16[((v380 * 4) + 3)][v381][v382];	// L574, [4,6)
              float v399 = v397 + v398;	// L575, [6,11)
              v16[((v380 * 4) + 3)][v381][v382] = v399;	// L576, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v400 = 0; v400 < 128; v400 += 1) {	// L583, [114419523,115468112), iterCycle=12, II=1
    for (int v401 = 0; v401 < 128; v401 += 1) {	// L584, [53741181,53749386), iterCycle=12, II=1
      for (int v402 = 0; v402 < 8; v402 += 1) {	// L585, [53741181,53741258), iterCycle=12, II=1
        for (int v403 = 0; v403 < 8; v403 += 1) {	// L586, [53741181,53741202), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          float v404 = v14[v400][(v402 * 2)][(v403 * 2)];	// L587, [0,2)
          float v405 = v39[(v401 * 2)][v400];	// L588, [0,2)
          float v406 = v404 * v405;	// L589, [2,6)
          float v407 = v17[(v401 * 2)][v402][v403];	// L590, [4,6)
          float v408 = v407 + v406;	// L591, [6,11)
          v17[(v401 * 2)][v402][v403] = v408;	// L592, [11,12)
          float v409 = v39[((v401 * 2) + 1)][v400];	// L593, [0,2)
          float v410 = v404 * v409;	// L594, [2,6)
          float v411 = v17[((v401 * 2) + 1)][v402][v403];	// L595, [4,6)
          float v412 = v411 + v410;	// L596, [6,11)
          v17[((v401 * 2) + 1)][v402][v403] = v412;	// L597, [11,12)
        }
      }
    }
  }
  for (int v413 = 0; v413 < 256; v413 += 1) {	// L602, [115468112,115603794), iterCycle=530, II=530
    for (int v414 = 0; v414 < 8; v414 += 1) {	// L603, [0,530), iterCycle=66, II=66
      for (int v415 = 0; v415 < 8; v415 += 1) {	// L604, [0,66), iterCycle=8, II=8
        float v416 = v17[v413][v414][v415];	// L605, [0,2)
        float v417 = v16[v413][v414][v415];	// L606, [0,2)
        float v418 = v416 + v417;	// L607, [2,7)
        v18[v413][v414][v415] = v418;	// L608, [7,8)
      }
    }
  }
  for (int v419 = 0; v419 < 256; v419 += 1) {	// L612, [115603794,115657556), iterCycle=210, II=210
    for (int v420 = 0; v420 < 8; v420 += 1) {	// L613, [0,210), iterCycle=26, II=26
      for (int v421 = 0; v421 < 8; v421 += 1) {	// L614, [0,26), iterCycle=3, II=3
        float v422 = v18[v419][v420][v421];	// L615, [0,2)
        v18[v419][v420][v421] = max(v422,v0);	// L616, [2,3)
      }
    }
  }
  for (int v423 = 0; v423 < 256; v423 += 1) {	// L620, [115657556,115678550), iterCycle=82, II=82
    for (int v424 = 0; v424 < 8; v424 += 1) {	// L621, [0,82), iterCycle=10, II=10
      for (int v425 = 0; v425 < 8; v425 += 1) {	// L622, [0,10), iterCycle=1, II=1
        v19[v423][v424][v425] = v0;	// L623, [0,1)
      }
    }
  }
  for (int v426 = 0; v426 < 256; v426 += 1) {	// L627, [115678550,125115747), iterCycle=12, II=1
    for (int v427 = 0; v427 < 3; v427 += 1) {	// L628, [44093546,44130423), iterCycle=12, II=1
      for (int v428 = 0; v428 < 3; v428 += 1) {	// L629, [44093546,44105847), iterCycle=12, II=1
        for (int v429 = 0; v429 < 64; v429 += 1) {	// L630, [44093546,44097655), iterCycle=12, II=1
          for (int v430 = 0; v430 < 8; v430 += 1) {	// L631, [44093546,44093623), iterCycle=12, II=1
            for (int v431 = 0; v431 < 8; v431 += 1) {	// L632, [44093546,44093567), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v432 = v18[v426][(v430 + v427)][(v431 + v428)];	// L633, [0,2)
              float v433 = v6[(v429 * 4)][v426][v427][v428];	// L634, [0,2)
              float v434 = v432 * v433;	// L635, [2,6)
              float v435 = v19[(v429 * 4)][v430][v431];	// L636, [4,6)
              float v436 = v434 + v435;	// L637, [6,11)
              v19[(v429 * 4)][v430][v431] = v436;	// L638, [11,12)
              float v437 = v6[((v429 * 4) + 1)][v426][v427][v428];	// L639, [0,2)
              float v438 = v432 * v437;	// L640, [2,6)
              float v439 = v19[((v429 * 4) + 1)][v430][v431];	// L641, [4,6)
              float v440 = v438 + v439;	// L642, [6,11)
              v19[((v429 * 4) + 1)][v430][v431] = v440;	// L643, [11,12)
              float v441 = v6[((v429 * 4) + 2)][v426][v427][v428];	// L644, [0,2)
              float v442 = v432 * v441;	// L645, [2,6)
              float v443 = v19[((v429 * 4) + 2)][v430][v431];	// L646, [4,6)
              float v444 = v442 + v443;	// L647, [6,11)
              v19[((v429 * 4) + 2)][v430][v431] = v444;	// L648, [11,12)
              float v445 = v6[((v429 * 4) + 3)][v426][v427][v428];	// L649, [0,2)
              float v446 = v432 * v445;	// L650, [2,6)
              float v447 = v19[((v429 * 4) + 3)][v430][v431];	// L651, [4,6)
              float v448 = v446 + v447;	// L652, [6,11)
              v19[((v429 * 4) + 3)][v430][v431] = v448;	// L653, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v449 = 0; v449 < 256; v449 += 1) {	// L660, [125115747,125169509), iterCycle=210, II=210
    for (int v450 = 0; v450 < 8; v450 += 1) {	// L661, [0,210), iterCycle=26, II=26
      for (int v451 = 0; v451 < 8; v451 += 1) {	// L662, [0,26), iterCycle=3, II=3
        float v452 = v19[v449][v450][v451];	// L663, [0,2)
        v19[v449][v450][v451] = max(v452,v0);	// L664, [2,3)
      }
    }
  }
  for (int v453 = 0; v453 < 256; v453 += 1) {	// L668, [125169509,125190503), iterCycle=82, II=82
    for (int v454 = 0; v454 < 8; v454 += 1) {	// L669, [0,82), iterCycle=10, II=10
      for (int v455 = 0; v455 < 8; v455 += 1) {	// L670, [0,10), iterCycle=1, II=1
        v21[v453][v454][v455] = v0;	// L671, [0,1)
      }
    }
  }
  for (int v456 = 0; v456 < 256; v456 += 1) {	// L675, [125190503,134627700), iterCycle=12, II=1
    for (int v457 = 0; v457 < 3; v457 += 1) {	// L676, [34581593,34618470), iterCycle=12, II=1
      for (int v458 = 0; v458 < 3; v458 += 1) {	// L677, [34581593,34593894), iterCycle=12, II=1
        for (int v459 = 0; v459 < 64; v459 += 1) {	// L678, [34581593,34585702), iterCycle=12, II=1
          for (int v460 = 0; v460 < 8; v460 += 1) {	// L679, [34581593,34581670), iterCycle=12, II=1
            for (int v461 = 0; v461 < 8; v461 += 1) {	// L680, [34581593,34581614), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v462 = v19[v456][(v460 + v457)][(v461 + v458)];	// L681, [0,2)
              float v463 = v6[(v459 * 4)][v456][v457][v458];	// L682, [0,2)
              float v464 = v462 * v463;	// L683, [2,6)
              float v465 = v21[(v459 * 4)][v460][v461];	// L684, [4,6)
              float v466 = v464 + v465;	// L685, [6,11)
              v21[(v459 * 4)][v460][v461] = v466;	// L686, [11,12)
              float v467 = v6[((v459 * 4) + 1)][v456][v457][v458];	// L687, [0,2)
              float v468 = v462 * v467;	// L688, [2,6)
              float v469 = v21[((v459 * 4) + 1)][v460][v461];	// L689, [4,6)
              float v470 = v468 + v469;	// L690, [6,11)
              v21[((v459 * 4) + 1)][v460][v461] = v470;	// L691, [11,12)
              float v471 = v6[((v459 * 4) + 2)][v456][v457][v458];	// L692, [0,2)
              float v472 = v462 * v471;	// L693, [2,6)
              float v473 = v21[((v459 * 4) + 2)][v460][v461];	// L694, [4,6)
              float v474 = v472 + v473;	// L695, [6,11)
              v21[((v459 * 4) + 2)][v460][v461] = v474;	// L696, [11,12)
              float v475 = v6[((v459 * 4) + 3)][v456][v457][v458];	// L697, [0,2)
              float v476 = v462 * v475;	// L698, [2,6)
              float v477 = v21[((v459 * 4) + 3)][v460][v461];	// L699, [4,6)
              float v478 = v476 + v477;	// L700, [6,11)
              v21[((v459 * 4) + 3)][v460][v461] = v478;	// L701, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v479 = 0; v479 < 256; v479 += 1) {	// L708, [134627700,134763382), iterCycle=530, II=530
    for (int v480 = 0; v480 < 8; v480 += 1) {	// L709, [0,530), iterCycle=66, II=66
      for (int v481 = 0; v481 < 8; v481 += 1) {	// L710, [0,66), iterCycle=8, II=8
        float v482 = v21[v479][v480][v481];	// L711, [0,2)
        float v483 = v18[v479][v480][v481];	// L712, [0,2)
        float v484 = v482 + v483;	// L713, [2,7)
        v22[v479][v480][v481] = v484;	// L714, [7,8)
      }
    }
  }
  for (int v485 = 0; v485 < 256; v485 += 1) {	// L718, [134763382,134817144), iterCycle=210, II=210
    for (int v486 = 0; v486 < 8; v486 += 1) {	// L719, [0,210), iterCycle=26, II=26
      for (int v487 = 0; v487 < 8; v487 += 1) {	// L720, [0,26), iterCycle=3, II=3
        float v488 = v22[v485][v486][v487];	// L721, [0,2)
        v22[v485][v486][v487] = max(v488,v0);	// L722, [2,3)
      }
    }
  }
  for (int v489 = 0; v489 < 512; v489 += 1) {	// L726, [134817144,134830458), iterCycle=26, II=26
    for (int v490 = 0; v490 < 4; v490 += 1) {	// L727, [0,26), iterCycle=6, II=6
      for (int v491 = 0; v491 < 4; v491 += 1) {	// L728, [0,6), iterCycle=1, II=1
        v23[v489][v490][v491] = v0;	// L729, [0,1)
      }
    }
  }
  for (int v492 = 0; v492 < 256; v492 += 1) {	// L733, [134830458,139549063), iterCycle=12, II=1
    for (int v493 = 0; v493 < 3; v493 += 1) {	// L734, [29660230,29678675), iterCycle=12, II=1
      for (int v494 = 0; v494 < 3; v494 += 1) {	// L735, [29660230,29666387), iterCycle=12, II=1
        for (int v495 = 0; v495 < 128; v495 += 1) {	// L736, [29660230,29662291), iterCycle=12, II=1
          for (int v496 = 0; v496 < 4; v496 += 1) {	// L737, [29660230,29660259), iterCycle=12, II=1
            for (int v497 = 0; v497 < 4; v497 += 1) {	// L738, [29660230,29660247), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v498 = v22[v492][((v496 * 2) + v493)][((v497 * 2) + v494)];	// L739, [0,2)
              float v499 = v7[(v495 * 4)][v492][v493][v494];	// L740, [0,2)
              float v500 = v498 * v499;	// L741, [2,6)
              float v501 = v23[(v495 * 4)][v496][v497];	// L742, [4,6)
              float v502 = v500 + v501;	// L743, [6,11)
              v23[(v495 * 4)][v496][v497] = v502;	// L744, [11,12)
              float v503 = v7[((v495 * 4) + 1)][v492][v493][v494];	// L745, [0,2)
              float v504 = v498 * v503;	// L746, [2,6)
              float v505 = v23[((v495 * 4) + 1)][v496][v497];	// L747, [4,6)
              float v506 = v504 + v505;	// L748, [6,11)
              v23[((v495 * 4) + 1)][v496][v497] = v506;	// L749, [11,12)
              float v507 = v7[((v495 * 4) + 2)][v492][v493][v494];	// L750, [0,2)
              float v508 = v498 * v507;	// L751, [2,6)
              float v509 = v23[((v495 * 4) + 2)][v496][v497];	// L752, [4,6)
              float v510 = v508 + v509;	// L753, [6,11)
              v23[((v495 * 4) + 2)][v496][v497] = v510;	// L754, [11,12)
              float v511 = v7[((v495 * 4) + 3)][v492][v493][v494];	// L755, [0,2)
              float v512 = v498 * v511;	// L756, [2,6)
              float v513 = v23[((v495 * 4) + 3)][v496][v497];	// L757, [4,6)
              float v514 = v512 + v513;	// L758, [6,11)
              v23[((v495 * 4) + 3)][v496][v497] = v514;	// L759, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v515 = 0; v515 < 512; v515 += 1) {	// L766, [139549063,139578761), iterCycle=58, II=58
    for (int v516 = 0; v516 < 4; v516 += 1) {	// L767, [0,58), iterCycle=14, II=14
      for (int v517 = 0; v517 < 4; v517 += 1) {	// L768, [0,14), iterCycle=3, II=3
        float v518 = v23[v515][v516][v517];	// L769, [0,2)
        v23[v515][v516][v517] = max(v518,v0);	// L770, [2,3)
      }
    }
  }
  for (int v519 = 0; v519 < 512; v519 += 1) {	// L774, [139578761,139592075), iterCycle=26, II=26
    for (int v520 = 0; v520 < 4; v520 += 1) {	// L775, [0,26), iterCycle=6, II=6
      for (int v521 = 0; v521 < 4; v521 += 1) {	// L776, [0,6), iterCycle=1, II=1
        v24[v519][v520][v521] = v0;	// L777, [0,1)
      }
    }
  }
  for (int v522 = 0; v522 < 512; v522 += 1) {	// L781, [139592075,149029272), iterCycle=12, II=1
    for (int v523 = 0; v523 < 3; v523 += 1) {	// L782, [20180021,20198466), iterCycle=12, II=1
      for (int v524 = 0; v524 < 3; v524 += 1) {	// L783, [20180021,20186178), iterCycle=12, II=1
        for (int v525 = 0; v525 < 128; v525 += 1) {	// L784, [20180021,20182082), iterCycle=12, II=1
          for (int v526 = 0; v526 < 4; v526 += 1) {	// L785, [20180021,20180050), iterCycle=12, II=1
            for (int v527 = 0; v527 < 4; v527 += 1) {	// L786, [20180021,20180038), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v528 = v23[v522][(v526 + v523)][(v527 + v524)];	// L787, [0,2)
              float v529 = v8[(v525 * 4)][v522][v523][v524];	// L788, [0,2)
              float v530 = v528 * v529;	// L789, [2,6)
              float v531 = v24[(v525 * 4)][v526][v527];	// L790, [4,6)
              float v532 = v530 + v531;	// L791, [6,11)
              v24[(v525 * 4)][v526][v527] = v532;	// L792, [11,12)
              float v533 = v8[((v525 * 4) + 1)][v522][v523][v524];	// L793, [0,2)
              float v534 = v528 * v533;	// L794, [2,6)
              float v535 = v24[((v525 * 4) + 1)][v526][v527];	// L795, [4,6)
              float v536 = v534 + v535;	// L796, [6,11)
              v24[((v525 * 4) + 1)][v526][v527] = v536;	// L797, [11,12)
              float v537 = v8[((v525 * 4) + 2)][v522][v523][v524];	// L798, [0,2)
              float v538 = v528 * v537;	// L799, [2,6)
              float v539 = v24[((v525 * 4) + 2)][v526][v527];	// L800, [4,6)
              float v540 = v538 + v539;	// L801, [6,11)
              v24[((v525 * 4) + 2)][v526][v527] = v540;	// L802, [11,12)
              float v541 = v8[((v525 * 4) + 3)][v522][v523][v524];	// L803, [0,2)
              float v542 = v528 * v541;	// L804, [2,6)
              float v543 = v24[((v525 * 4) + 3)][v526][v527];	// L805, [4,6)
              float v544 = v542 + v543;	// L806, [6,11)
              v24[((v525 * 4) + 3)][v526][v527] = v544;	// L807, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v545 = 0; v545 < 256; v545 += 1) {	// L814, [149029272,150077861), iterCycle=12, II=1
    for (int v546 = 0; v546 < 256; v546 += 1) {	// L815, [19131432,19135541), iterCycle=12, II=1
      for (int v547 = 0; v547 < 4; v547 += 1) {	// L816, [19131432,19131461), iterCycle=12, II=1
        for (int v548 = 0; v548 < 4; v548 += 1) {	// L817, [19131432,19131449), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          float v549 = v22[v545][(v547 * 2)][(v548 * 2)];	// L818, [0,2)
          float v550 = v40[(v546 * 2)][v545];	// L819, [0,2)
          float v551 = v549 * v550;	// L820, [2,6)
          float v552 = v25[(v546 * 2)][v547][v548];	// L821, [4,6)
          float v553 = v552 + v551;	// L822, [6,11)
          v25[(v546 * 2)][v547][v548] = v553;	// L823, [11,12)
          float v554 = v40[((v546 * 2) + 1)][v545];	// L824, [0,2)
          float v555 = v549 * v554;	// L825, [2,6)
          float v556 = v25[((v546 * 2) + 1)][v547][v548];	// L826, [4,6)
          float v557 = v556 + v555;	// L827, [6,11)
          v25[((v546 * 2) + 1)][v547][v548] = v557;	// L828, [11,12)
        }
      }
    }
  }
  for (int v558 = 0; v558 < 512; v558 += 1) {	// L833, [150077861,150148519), iterCycle=138, II=138
    for (int v559 = 0; v559 < 4; v559 += 1) {	// L834, [0,138), iterCycle=34, II=34
      for (int v560 = 0; v560 < 4; v560 += 1) {	// L835, [0,34), iterCycle=8, II=8
        float v561 = v25[v558][v559][v560];	// L836, [0,2)
        float v562 = v24[v558][v559][v560];	// L837, [0,2)
        float v563 = v561 + v562;	// L838, [2,7)
        v26[v558][v559][v560] = v563;	// L839, [7,8)
      }
    }
  }
  for (int v564 = 0; v564 < 512; v564 += 1) {	// L843, [150148519,150178217), iterCycle=58, II=58
    for (int v565 = 0; v565 < 4; v565 += 1) {	// L844, [0,58), iterCycle=14, II=14
      for (int v566 = 0; v566 < 4; v566 += 1) {	// L845, [0,14), iterCycle=3, II=3
        float v567 = v26[v564][v565][v566];	// L846, [0,2)
        v26[v564][v565][v566] = max(v567,v0);	// L847, [2,3)
      }
    }
  }
  for (int v568 = 0; v568 < 512; v568 += 1) {	// L851, [150178217,150191531), iterCycle=26, II=26
    for (int v569 = 0; v569 < 4; v569 += 1) {	// L852, [0,26), iterCycle=6, II=6
      for (int v570 = 0; v570 < 4; v570 += 1) {	// L853, [0,6), iterCycle=1, II=1
        v27[v568][v569][v570] = v0;	// L854, [0,1)
      }
    }
  }
  for (int v571 = 0; v571 < 512; v571 += 1) {	// L858, [150191531,159628728), iterCycle=12, II=1
    for (int v572 = 0; v572 < 3; v572 += 1) {	// L859, [9580565,9599010), iterCycle=12, II=1
      for (int v573 = 0; v573 < 3; v573 += 1) {	// L860, [9580565,9586722), iterCycle=12, II=1
        for (int v574 = 0; v574 < 128; v574 += 1) {	// L861, [9580565,9582626), iterCycle=12, II=1
          for (int v575 = 0; v575 < 4; v575 += 1) {	// L862, [9580565,9580594), iterCycle=12, II=1
            for (int v576 = 0; v576 < 4; v576 += 1) {	// L863, [9580565,9580582), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v577 = v26[v571][(v575 + v572)][(v576 + v573)];	// L864, [0,2)
              float v578 = v8[(v574 * 4)][v571][v572][v573];	// L865, [0,2)
              float v579 = v577 * v578;	// L866, [2,6)
              float v580 = v27[(v574 * 4)][v575][v576];	// L867, [4,6)
              float v581 = v579 + v580;	// L868, [6,11)
              v27[(v574 * 4)][v575][v576] = v581;	// L869, [11,12)
              float v582 = v8[((v574 * 4) + 1)][v571][v572][v573];	// L870, [0,2)
              float v583 = v577 * v582;	// L871, [2,6)
              float v584 = v27[((v574 * 4) + 1)][v575][v576];	// L872, [4,6)
              float v585 = v583 + v584;	// L873, [6,11)
              v27[((v574 * 4) + 1)][v575][v576] = v585;	// L874, [11,12)
              float v586 = v8[((v574 * 4) + 2)][v571][v572][v573];	// L875, [0,2)
              float v587 = v577 * v586;	// L876, [2,6)
              float v588 = v27[((v574 * 4) + 2)][v575][v576];	// L877, [4,6)
              float v589 = v587 + v588;	// L878, [6,11)
              v27[((v574 * 4) + 2)][v575][v576] = v589;	// L879, [11,12)
              float v590 = v8[((v574 * 4) + 3)][v571][v572][v573];	// L880, [0,2)
              float v591 = v577 * v590;	// L881, [2,6)
              float v592 = v27[((v574 * 4) + 3)][v575][v576];	// L882, [4,6)
              float v593 = v591 + v592;	// L883, [6,11)
              v27[((v574 * 4) + 3)][v575][v576] = v593;	// L884, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v594 = 0; v594 < 512; v594 += 1) {	// L891, [159628728,159658426), iterCycle=58, II=58
    for (int v595 = 0; v595 < 4; v595 += 1) {	// L892, [0,58), iterCycle=14, II=14
      for (int v596 = 0; v596 < 4; v596 += 1) {	// L893, [0,14), iterCycle=3, II=3
        float v597 = v27[v594][v595][v596];	// L894, [0,2)
        v27[v594][v595][v596] = max(v597,v0);	// L895, [2,3)
      }
    }
  }
  for (int v598 = 0; v598 < 512; v598 += 1) {	// L899, [159658426,159671740), iterCycle=26, II=26
    for (int v599 = 0; v599 < 4; v599 += 1) {	// L900, [0,26), iterCycle=6, II=6
      for (int v600 = 0; v600 < 4; v600 += 1) {	// L901, [0,6), iterCycle=1, II=1
        v28[v598][v599][v600] = v0;	// L902, [0,1)
      }
    }
  }
  for (int v601 = 0; v601 < 512; v601 += 1) {	// L906, [159671740,169108937), iterCycle=12, II=1
    for (int v602 = 0; v602 < 3; v602 += 1) {	// L907, [100356,118801), iterCycle=12, II=1
      for (int v603 = 0; v603 < 3; v603 += 1) {	// L908, [100356,106513), iterCycle=12, II=1
        for (int v604 = 0; v604 < 128; v604 += 1) {	// L909, [100356,102417), iterCycle=12, II=1
          for (int v605 = 0; v605 < 4; v605 += 1) {	// L910, [100356,100385), iterCycle=12, II=1
            for (int v606 = 0; v606 < 4; v606 += 1) {	// L911, [100356,100373), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v607 = v27[v601][(v605 + v602)][(v606 + v603)];	// L912, [0,2)
              float v608 = v8[(v604 * 4)][v601][v602][v603];	// L913, [0,2)
              float v609 = v607 * v608;	// L914, [2,6)
              float v610 = v28[(v604 * 4)][v605][v606];	// L915, [4,6)
              float v611 = v609 + v610;	// L916, [6,11)
              v28[(v604 * 4)][v605][v606] = v611;	// L917, [11,12)
              float v612 = v8[((v604 * 4) + 1)][v601][v602][v603];	// L918, [0,2)
              float v613 = v607 * v612;	// L919, [2,6)
              float v614 = v28[((v604 * 4) + 1)][v605][v606];	// L920, [4,6)
              float v615 = v613 + v614;	// L921, [6,11)
              v28[((v604 * 4) + 1)][v605][v606] = v615;	// L922, [11,12)
              float v616 = v8[((v604 * 4) + 2)][v601][v602][v603];	// L923, [0,2)
              float v617 = v607 * v616;	// L924, [2,6)
              float v618 = v28[((v604 * 4) + 2)][v605][v606];	// L925, [4,6)
              float v619 = v617 + v618;	// L926, [6,11)
              v28[((v604 * 4) + 2)][v605][v606] = v619;	// L927, [11,12)
              float v620 = v8[((v604 * 4) + 3)][v601][v602][v603];	// L928, [0,2)
              float v621 = v607 * v620;	// L929, [2,6)
              float v622 = v28[((v604 * 4) + 3)][v605][v606];	// L930, [4,6)
              float v623 = v621 + v622;	// L931, [6,11)
              v28[((v604 * 4) + 3)][v605][v606] = v623;	// L932, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v624 = 0; v624 < 512; v624 += 1) {	// L939, [169108937,169179595), iterCycle=138, II=138
    for (int v625 = 0; v625 < 4; v625 += 1) {	// L940, [0,138), iterCycle=34, II=34
      for (int v626 = 0; v626 < 4; v626 += 1) {	// L941, [0,34), iterCycle=8, II=8
        float v627 = v28[v624][v625][v626];	// L942, [0,2)
        float v628 = v26[v624][v625][v626];	// L943, [0,2)
        float v629 = v627 + v628;	// L944, [2,7)
        v29[v624][v625][v626] = v629;	// L945, [7,8)
        v29[v624][v625][v626] = max(v29[v624][v625][v626],v0);
      }
    }
  }
  // for (int v630 = 0; v630 < 512; v630 += 1) {	// L949, [169179595,169209293), iterCycle=58, II=58
  //   for (int v631 = 0; v631 < 4; v631 += 1) {	// L950, [0,58), iterCycle=14, II=14
  //     for (int v632 = 0; v632 < 4; v632 += 1) {	// L951, [0,14), iterCycle=3, II=3
  //       float v633 = v29[v630][v631][v632];	// L952, [0,2)
  //       v29[v630][v631][v632] = max(v633,v0);	// L953, [2,3)
  //     }
  //   }
  // }
}

