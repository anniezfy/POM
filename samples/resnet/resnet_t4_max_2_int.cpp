
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
/// Latency=143240538, interval=143240538
/// DSP=20, BRAM=0
void resnet(
  int v0,
  int v1[64][3][3][3],
  int v2[64][64][3][3],
  int v3[128][64][3][3],
  int v4[128][128][3][3],
  int v5[256][128][3][3],
  int v6[256][256][3][3],
  int v7[512][256][3][3],
  int v8[512][512][3][3],
  int v9[64][32][32],
  int v10[128][16][16],
  int v11[128][16][16],
  int v12[128][16][16],
  int v13[128][16][16],
  int v14[128][16][16],
  int v15[256][8][8],
  int v16[256][8][8],
  int v17[256][8][8],
  int v18[256][8][8],
  int v19[256][8][8],
  int v20[64][32][32],
  int v21[256][8][8],
  int v22[256][8][8],
  int v23[512][4][4],
  int v24[512][4][4],
  int v25[512][4][4],
  int v26[512][4][4],
  int v27[512][4][4],
  int v28[512][4][4],
  int v29[512][4][4],
  int v30[64][32][32],
  int v31[64][32][32],
  int v32[64][32][32],
  int v33[64][32][32],
  int v34[64][32][32],
  int v35[128][16][16],
  int v36[128][16][16],
  int v37[3][32][32],
  int v38[128][64],
  int v39[256][128],
  int v40[512][256]
) {	// L6, [0,143240538)
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

  #pragma HLS array_partition variable=v10 cyclic factor=4 dim=1
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

  #pragma HLS array_partition variable=v17 cyclic factor=4 dim=1
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

  #pragma HLS array_partition variable=v25 cyclic factor=4 dim=1
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

  #pragma HLS array_partition variable=v38 cyclic factor=4 dim=1
  #pragma HLS resource variable=v38 core=ram_s2p_bram

  #pragma HLS array_partition variable=v39 cyclic factor=4 dim=1
  #pragma HLS resource variable=v39 core=ram_s2p_bram

  #pragma HLS array_partition variable=v40 cyclic factor=4 dim=1
  #pragma HLS resource variable=v40 core=ram_s2p_bram

  for (int v41 = 0; v41 < 64; v41 += 1) {	// L7, [0,69762), iterCycle=1090, II=1090
    for (int v42 = 0; v42 < 32; v42 += 1) {	// L8, [0,1090), iterCycle=34, II=34
      for (int v43 = 0; v43 < 32; v43 += 1) {	// L9, [0,34), iterCycle=1, II=1
        v9[v41][v42][v43] = v0;	// L10, [0,1)
      }
    }
  }
  for (int v44 = 0; v44 < 3; v44 += 1) {	// L14, [69762,512143), iterCycle=12, II=1
    for (int v45 = 0; v45 < 3; v45 += 1) {	// L15, [142728393,142875862), iterCycle=12, II=1
      for (int v46 = 0; v46 < 3; v46 += 1) {	// L16, [142728393,142777558), iterCycle=12, II=1
        for (int v47 = 0; v47 < 16; v47 += 1) {	// L17, [142728393,142744790), iterCycle=12, II=1
          for (int v48 = 0; v48 < 32; v48 += 1) {	// L18, [142728393,142729430), iterCycle=12, II=1
            for (int v49 = 0; v49 < 32; v49 += 1) {	// L19, [142728393,142728438), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v50 = v37[v44][(v48 + v45)][(v49 + v46)];	// L20, [0,2)
              int v51 = v1[(v47 * 4)][v44][v45][v46];	// L21, [0,2)
              int v52 = v50 * v51;	// L22, [2,6)
              int v53 = v9[(v47 * 4)][v48][v49];	// L23, [4,6)
              int v54 = v52 + v53;	// L24, [6,11)
              v9[(v47 * 4)][v48][v49] = v54;	// L25, [11,12)
              int v55 = v1[((v47 * 4) + 1)][v44][v45][v46];	// L26, [0,2)
              int v56 = v50 * v55;	// L27, [2,6)
              int v57 = v9[((v47 * 4) + 1)][v48][v49];	// L28, [4,6)
              int v58 = v56 + v57;	// L29, [6,11)
              v9[((v47 * 4) + 1)][v48][v49] = v58;	// L30, [11,12)
              int v59 = v1[((v47 * 4) + 2)][v44][v45][v46];	// L31, [0,2)
              int v60 = v50 * v59;	// L32, [2,6)
              int v61 = v9[((v47 * 4) + 2)][v48][v49];	// L33, [4,6)
              int v62 = v60 + v61;	// L34, [6,11)
              v9[((v47 * 4) + 2)][v48][v49] = v62;	// L35, [11,12)
              int v63 = v1[((v47 * 4) + 3)][v44][v45][v46];	// L36, [0,2)
              int v64 = v50 * v63;	// L37, [2,6)
              int v65 = v9[((v47 * 4) + 3)][v48][v49];	// L38, [4,6)
              int v66 = v64 + v65;	// L39, [6,11)
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
        int v70 = v9[v67][v68][v69];	// L50, [0,2)
        v9[v67][v68][v69] = max(v70,v0);	// L51, [2,3)
      }
    }
  }
  for (int v71 = 0; v71 < 64; v71 += 1) {	// L55, [712977,782739), iterCycle=1090, II=1090
    for (int v72 = 0; v72 < 32; v72 += 1) {	// L56, [0,1090), iterCycle=34, II=34
      for (int v73 = 0; v73 < 32; v73 += 1) {	// L57, [0,34), iterCycle=1, II=1
        v20[v71][v72][v73] = v0;	// L58, [0,1)
      }
    }
  }
  for (int v74 = 0; v74 < 64; v74 += 1) {	// L62, [782739,10219936), iterCycle=12, II=1
    for (int v75 = 0; v75 < 3; v75 += 1) {	// L63, [133020600,133168069), iterCycle=12, II=1
      for (int v76 = 0; v76 < 3; v76 += 1) {	// L64, [133020600,133069765), iterCycle=12, II=1
        for (int v77 = 0; v77 < 16; v77 += 1) {	// L65, [133020600,133036997), iterCycle=12, II=1
          for (int v78 = 0; v78 < 32; v78 += 1) {	// L66, [133020600,133021637), iterCycle=12, II=1
            for (int v79 = 0; v79 < 32; v79 += 1) {	// L67, [133020600,133020645), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v80 = v9[v74][(v78 + v75)][(v79 + v76)];	// L68, [0,2)
              int v81 = v2[(v77 * 4)][v74][v75][v76];	// L69, [0,2)
              int v82 = v80 * v81;	// L70, [2,6)
              int v83 = v20[(v77 * 4)][v78][v79];	// L71, [4,6)
              int v84 = v82 + v83;	// L72, [6,11)
              v20[(v77 * 4)][v78][v79] = v84;	// L73, [11,12)
              int v85 = v2[((v77 * 4) + 1)][v74][v75][v76];	// L74, [0,2)
              int v86 = v80 * v85;	// L75, [2,6)
              int v87 = v20[((v77 * 4) + 1)][v78][v79];	// L76, [4,6)
              int v88 = v86 + v87;	// L77, [6,11)
              v20[((v77 * 4) + 1)][v78][v79] = v88;	// L78, [11,12)
              int v89 = v2[((v77 * 4) + 2)][v74][v75][v76];	// L79, [0,2)
              int v90 = v80 * v89;	// L80, [2,6)
              int v91 = v20[((v77 * 4) + 2)][v78][v79];	// L81, [4,6)
              int v92 = v90 + v91;	// L82, [6,11)
              v20[((v77 * 4) + 2)][v78][v79] = v92;	// L83, [11,12)
              int v93 = v2[((v77 * 4) + 3)][v74][v75][v76];	// L84, [0,2)
              int v94 = v80 * v93;	// L85, [2,6)
              int v95 = v20[((v77 * 4) + 3)][v78][v79];	// L86, [4,6)
              int v96 = v94 + v95;	// L87, [6,11)
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
        int v100 = v20[v97][v98][v99];	// L98, [0,2)
        v20[v97][v98][v99] = max(v100,v0);	// L99, [2,3)
      }
    }
  }
  for (int v101 = 0; v101 < 64; v101 += 1) {	// L103, [10420770,10490532), iterCycle=1090, II=1090
    for (int v102 = 0; v102 < 32; v102 += 1) {	// L104, [0,1090), iterCycle=34, II=34
      for (int v103 = 0; v103 < 32; v103 += 1) {	// L105, [0,34), iterCycle=1, II=1
        v30[v101][v102][v103] = v0;	// L106, [0,1)
      }
    }
  }
  for (int v104 = 0; v104 < 64; v104 += 1) {	// L110, [10490532,19927729), iterCycle=12, II=1
    for (int v105 = 0; v105 < 3; v105 += 1) {	// L111, [123312807,123460276), iterCycle=12, II=1
      for (int v106 = 0; v106 < 3; v106 += 1) {	// L112, [123312807,123361972), iterCycle=12, II=1
        for (int v107 = 0; v107 < 16; v107 += 1) {	// L113, [123312807,123329204), iterCycle=12, II=1
          for (int v108 = 0; v108 < 32; v108 += 1) {	// L114, [123312807,123313844), iterCycle=12, II=1
            for (int v109 = 0; v109 < 32; v109 += 1) {	// L115, [123312807,123312852), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v110 = v20[v104][(v108 + v105)][(v109 + v106)];	// L116, [0,2)
              int v111 = v2[(v107 * 4)][v104][v105][v106];	// L117, [0,2)
              int v112 = v110 * v111;	// L118, [2,6)
              int v113 = v30[(v107 * 4)][v108][v109];	// L119, [4,6)
              int v114 = v112 + v113;	// L120, [6,11)
              v30[(v107 * 4)][v108][v109] = v114;	// L121, [11,12)
              int v115 = v2[((v107 * 4) + 1)][v104][v105][v106];	// L122, [0,2)
              int v116 = v110 * v115;	// L123, [2,6)
              int v117 = v30[((v107 * 4) + 1)][v108][v109];	// L124, [4,6)
              int v118 = v116 + v117;	// L125, [6,11)
              v30[((v107 * 4) + 1)][v108][v109] = v118;	// L126, [11,12)
              int v119 = v2[((v107 * 4) + 2)][v104][v105][v106];	// L127, [0,2)
              int v120 = v110 * v119;	// L128, [2,6)
              int v121 = v30[((v107 * 4) + 2)][v108][v109];	// L129, [4,6)
              int v122 = v120 + v121;	// L130, [6,11)
              v30[((v107 * 4) + 2)][v108][v109] = v122;	// L131, [11,12)
              int v123 = v2[((v107 * 4) + 3)][v104][v105][v106];	// L132, [0,2)
              int v124 = v110 * v123;	// L133, [2,6)
              int v125 = v30[((v107 * 4) + 3)][v108][v109];	// L134, [4,6)
              int v126 = v124 + v125;	// L135, [6,11)
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
        int v130 = v30[v127][v128][v129];	// L146, [0,2)
        int v131 = v9[v127][v128][v129];	// L147, [0,2)
        int v132 = v130 + v131;	// L148, [2,7)
        v31[v127][v128][v129] = v132;	// L149, [7,8)
      }
    }
  }
  for (int v133 = 0; v133 < 64; v133 += 1) {	// L153, [20456243,20657077), iterCycle=3138, II=3138
    for (int v134 = 0; v134 < 32; v134 += 1) {	// L154, [0,3138), iterCycle=98, II=98
      for (int v135 = 0; v135 < 32; v135 += 1) {	// L155, [0,98), iterCycle=3, II=3
        int v136 = v31[v133][v134][v135];	// L156, [0,2)
        v31[v133][v134][v135] = max(v136,v0);	// L157, [2,3)
      }
    }
  }
  for (int v137 = 0; v137 < 64; v137 += 1) {	// L161, [20657077,20726839), iterCycle=1090, II=1090
    for (int v138 = 0; v138 < 32; v138 += 1) {	// L162, [0,1090), iterCycle=34, II=34
      for (int v139 = 0; v139 < 32; v139 += 1) {	// L163, [0,34), iterCycle=1, II=1
        v32[v137][v138][v139] = v0;	// L164, [0,1)
      }
    }
  }
  for (int v140 = 0; v140 < 64; v140 += 1) {	// L168, [20726839,30164036), iterCycle=12, II=1
    for (int v141 = 0; v141 < 3; v141 += 1) {	// L169, [113076500,113223969), iterCycle=12, II=1
      for (int v142 = 0; v142 < 3; v142 += 1) {	// L170, [113076500,113125665), iterCycle=12, II=1
        for (int v143 = 0; v143 < 16; v143 += 1) {	// L171, [113076500,113092897), iterCycle=12, II=1
          for (int v144 = 0; v144 < 32; v144 += 1) {	// L172, [113076500,113077537), iterCycle=12, II=1
            for (int v145 = 0; v145 < 32; v145 += 1) {	// L173, [113076500,113076545), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v146 = v31[v140][(v144 + v141)][(v145 + v142)];	// L174, [0,2)
              int v147 = v2[(v143 * 4)][v140][v141][v142];	// L175, [0,2)
              int v148 = v146 * v147;	// L176, [2,6)
              int v149 = v32[(v143 * 4)][v144][v145];	// L177, [4,6)
              int v150 = v148 + v149;	// L178, [6,11)
              v32[(v143 * 4)][v144][v145] = v150;	// L179, [11,12)
              int v151 = v2[((v143 * 4) + 1)][v140][v141][v142];	// L180, [0,2)
              int v152 = v146 * v151;	// L181, [2,6)
              int v153 = v32[((v143 * 4) + 1)][v144][v145];	// L182, [4,6)
              int v154 = v152 + v153;	// L183, [6,11)
              v32[((v143 * 4) + 1)][v144][v145] = v154;	// L184, [11,12)
              int v155 = v2[((v143 * 4) + 2)][v140][v141][v142];	// L185, [0,2)
              int v156 = v146 * v155;	// L186, [2,6)
              int v157 = v32[((v143 * 4) + 2)][v144][v145];	// L187, [4,6)
              int v158 = v156 + v157;	// L188, [6,11)
              v32[((v143 * 4) + 2)][v144][v145] = v158;	// L189, [11,12)
              int v159 = v2[((v143 * 4) + 3)][v140][v141][v142];	// L190, [0,2)
              int v160 = v146 * v159;	// L191, [2,6)
              int v161 = v32[((v143 * 4) + 3)][v144][v145];	// L192, [4,6)
              int v162 = v160 + v161;	// L193, [6,11)
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
        int v166 = v32[v163][v164][v165];	// L204, [0,2)
        v32[v163][v164][v165] = max(v166,v0);	// L205, [2,3)
      }
    }
  }
  for (int v167 = 0; v167 < 64; v167 += 1) {	// L209, [30364870,30434632), iterCycle=1090, II=1090
    for (int v168 = 0; v168 < 32; v168 += 1) {	// L210, [0,1090), iterCycle=34, II=34
      for (int v169 = 0; v169 < 32; v169 += 1) {	// L211, [0,34), iterCycle=1, II=1
        v33[v167][v168][v169] = v0;	// L212, [0,1)
      }
    }
  }
  for (int v170 = 0; v170 < 64; v170 += 1) {	// L216, [30434632,39871829), iterCycle=12, II=1
    for (int v171 = 0; v171 < 3; v171 += 1) {	// L217, [103368707,103516176), iterCycle=12, II=1
      for (int v172 = 0; v172 < 3; v172 += 1) {	// L218, [103368707,103417872), iterCycle=12, II=1
        for (int v173 = 0; v173 < 16; v173 += 1) {	// L219, [103368707,103385104), iterCycle=12, II=1
          for (int v174 = 0; v174 < 32; v174 += 1) {	// L220, [103368707,103369744), iterCycle=12, II=1
            for (int v175 = 0; v175 < 32; v175 += 1) {	// L221, [103368707,103368752), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v176 = v32[v170][(v174 + v171)][(v175 + v172)];	// L222, [0,2)
              int v177 = v2[(v173 * 4)][v170][v171][v172];	// L223, [0,2)
              int v178 = v176 * v177;	// L224, [2,6)
              int v179 = v33[(v173 * 4)][v174][v175];	// L225, [4,6)
              int v180 = v178 + v179;	// L226, [6,11)
              v33[(v173 * 4)][v174][v175] = v180;	// L227, [11,12)
              int v181 = v2[((v173 * 4) + 1)][v170][v171][v172];	// L228, [0,2)
              int v182 = v176 * v181;	// L229, [2,6)
              int v183 = v33[((v173 * 4) + 1)][v174][v175];	// L230, [4,6)
              int v184 = v182 + v183;	// L231, [6,11)
              v33[((v173 * 4) + 1)][v174][v175] = v184;	// L232, [11,12)
              int v185 = v2[((v173 * 4) + 2)][v170][v171][v172];	// L233, [0,2)
              int v186 = v176 * v185;	// L234, [2,6)
              int v187 = v33[((v173 * 4) + 2)][v174][v175];	// L235, [4,6)
              int v188 = v186 + v187;	// L236, [6,11)
              v33[((v173 * 4) + 2)][v174][v175] = v188;	// L237, [11,12)
              int v189 = v2[((v173 * 4) + 3)][v170][v171][v172];	// L238, [0,2)
              int v190 = v176 * v189;	// L239, [2,6)
              int v191 = v33[((v173 * 4) + 3)][v174][v175];	// L240, [4,6)
              int v192 = v190 + v191;	// L241, [6,11)
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
        int v196 = v33[v193][v194][v195];	// L252, [0,2)
        int v197 = v31[v193][v194][v195];	// L253, [0,2)
        int v198 = v196 + v197;	// L254, [2,7)
        v34[v193][v194][v195] = v198;	// L255, [7,8)
      }
    }
  }
  for (int v199 = 0; v199 < 64; v199 += 1) {	// L259, [40400343,40601177), iterCycle=3138, II=3138
    for (int v200 = 0; v200 < 32; v200 += 1) {	// L260, [0,3138), iterCycle=98, II=98
      for (int v201 = 0; v201 < 32; v201 += 1) {	// L261, [0,98), iterCycle=3, II=3
        int v202 = v34[v199][v200][v201];	// L262, [0,2)
        v34[v199][v200][v201] = max(v202,v0);	// L263, [2,3)
      }
    }
  }
  for (int v203 = 0; v203 < 128; v203 += 1) {	// L267, [40601177,40638299), iterCycle=290, II=290
    for (int v204 = 0; v204 < 16; v204 += 1) {	// L268, [0,290), iterCycle=18, II=18
      for (int v205 = 0; v205 < 16; v205 += 1) {	// L269, [0,18), iterCycle=1, II=1
        v35[v203][v204][v205] = v0;	// L270, [0,1)
      }
    }
  }
  for (int v206 = 0; v206 < 64; v206 += 1) {	// L274, [40638299,45356904), iterCycle=12, II=1
    for (int v207 = 0; v207 < 3; v207 += 1) {	// L275, [97883632,97957373), iterCycle=12, II=1
      for (int v208 = 0; v208 < 3; v208 += 1) {	// L276, [97883632,97908221), iterCycle=12, II=1
        for (int v209 = 0; v209 < 32; v209 += 1) {	// L277, [97883632,97891837), iterCycle=12, II=1
          for (int v210 = 0; v210 < 16; v210 += 1) {	// L278, [97883632,97883901), iterCycle=12, II=1
            for (int v211 = 0; v211 < 16; v211 += 1) {	// L279, [97883632,97883661), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v212 = v34[v206][((v210 * 2) + v207)][((v211 * 2) + v208)];	// L280, [0,2)
              int v213 = v3[(v209 * 4)][v206][v207][v208];	// L281, [0,2)
              int v214 = v212 * v213;	// L282, [2,6)
              int v215 = v35[(v209 * 4)][v210][v211];	// L283, [4,6)
              int v216 = v214 + v215;	// L284, [6,11)
              v35[(v209 * 4)][v210][v211] = v216;	// L285, [11,12)
              int v217 = v3[((v209 * 4) + 1)][v206][v207][v208];	// L286, [0,2)
              int v218 = v212 * v217;	// L287, [2,6)
              int v219 = v35[((v209 * 4) + 1)][v210][v211];	// L288, [4,6)
              int v220 = v218 + v219;	// L289, [6,11)
              v35[((v209 * 4) + 1)][v210][v211] = v220;	// L290, [11,12)
              int v221 = v3[((v209 * 4) + 2)][v206][v207][v208];	// L291, [0,2)
              int v222 = v212 * v221;	// L292, [2,6)
              int v223 = v35[((v209 * 4) + 2)][v210][v211];	// L293, [4,6)
              int v224 = v222 + v223;	// L294, [6,11)
              v35[((v209 * 4) + 2)][v210][v211] = v224;	// L295, [11,12)
              int v225 = v3[((v209 * 4) + 3)][v206][v207][v208];	// L296, [0,2)
              int v226 = v212 * v225;	// L297, [2,6)
              int v227 = v35[((v209 * 4) + 3)][v210][v211];	// L298, [4,6)
              int v228 = v226 + v227;	// L299, [6,11)
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
        int v232 = v35[v229][v230][v231];	// L310, [0,2)
        v35[v229][v230][v231] = max(v232,v0);	// L311, [2,3)
      }
    }
  }
  for (int v233 = 0; v233 < 128; v233 += 1) {	// L315, [45459562,45496684), iterCycle=290, II=290
    for (int v234 = 0; v234 < 16; v234 += 1) {	// L316, [0,290), iterCycle=18, II=18
      for (int v235 = 0; v235 < 16; v235 += 1) {	// L317, [0,18), iterCycle=1, II=1
        v36[v233][v234][v235] = v0;	// L318, [0,1)
      }
    }
  }
  for (int v236 = 0; v236 < 128; v236 += 1) {	// L322, [45496684,54933881), iterCycle=12, II=1
    for (int v237 = 0; v237 < 3; v237 += 1) {	// L323, [88306655,88380396), iterCycle=12, II=1
      for (int v238 = 0; v238 < 3; v238 += 1) {	// L324, [88306655,88331244), iterCycle=12, II=1
        for (int v239 = 0; v239 < 32; v239 += 1) {	// L325, [88306655,88314860), iterCycle=12, II=1
          for (int v240 = 0; v240 < 16; v240 += 1) {	// L326, [88306655,88306924), iterCycle=12, II=1
            for (int v241 = 0; v241 < 16; v241 += 1) {	// L327, [88306655,88306684), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v242 = v35[v236][(v240 + v237)][(v241 + v238)];	// L328, [0,2)
              int v243 = v4[(v239 * 4)][v236][v237][v238];	// L329, [0,2)
              int v244 = v242 * v243;	// L330, [2,6)
              int v245 = v36[(v239 * 4)][v240][v241];	// L331, [4,6)
              int v246 = v244 + v245;	// L332, [6,11)
              v36[(v239 * 4)][v240][v241] = v246;	// L333, [11,12)
              int v247 = v4[((v239 * 4) + 1)][v236][v237][v238];	// L334, [0,2)
              int v248 = v242 * v247;	// L335, [2,6)
              int v249 = v36[((v239 * 4) + 1)][v240][v241];	// L336, [4,6)
              int v250 = v248 + v249;	// L337, [6,11)
              v36[((v239 * 4) + 1)][v240][v241] = v250;	// L338, [11,12)
              int v251 = v4[((v239 * 4) + 2)][v236][v237][v238];	// L339, [0,2)
              int v252 = v242 * v251;	// L340, [2,6)
              int v253 = v36[((v239 * 4) + 2)][v240][v241];	// L341, [4,6)
              int v254 = v252 + v253;	// L342, [6,11)
              v36[((v239 * 4) + 2)][v240][v241] = v254;	// L343, [11,12)
              int v255 = v4[((v239 * 4) + 3)][v236][v237][v238];	// L344, [0,2)
              int v256 = v242 * v255;	// L345, [2,6)
              int v257 = v36[((v239 * 4) + 3)][v240][v241];	// L346, [4,6)
              int v258 = v256 + v257;	// L347, [6,11)
              v36[((v239 * 4) + 3)][v240][v241] = v258;	// L348, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v259 = 0; v259 < 64; v259 += 1) {	// L355, [54933881,55458182), iterCycle=12, II=1
    for (int v260 = 0; v260 < 32; v260 += 1) {	// L356, [87782354,87790559), iterCycle=12, II=1
      for (int v261 = 0; v261 < 16; v261 += 1) {	// L357, [87782354,87782623), iterCycle=12, II=1
        for (int v262 = 0; v262 < 16; v262 += 1) {	// L358, [87782354,87782383), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          int v263 = v34[v259][(v261 * 2)][(v262 * 2)];	// L359, [0,2)
          int v264 = v38[(v260 * 4)][v259];	// L360, [0,2)
          int v265 = v263 * v264;	// L361, [2,6)
          int v266 = v10[(v260 * 4)][v261][v262];	// L362, [4,6)
          int v267 = v266 + v265;	// L363, [6,11)
          v10[(v260 * 4)][v261][v262] = v267;	// L364, [11,12)
          int v268 = v38[((v260 * 4) + 1)][v259];	// L365, [0,2)
          int v269 = v263 * v268;	// L366, [2,6)
          int v270 = v10[((v260 * 4) + 1)][v261][v262];	// L367, [4,6)
          int v271 = v270 + v269;	// L368, [6,11)
          v10[((v260 * 4) + 1)][v261][v262] = v271;	// L369, [11,12)
          int v272 = v38[((v260 * 4) + 2)][v259];	// L370, [0,2)
          int v273 = v263 * v272;	// L371, [2,6)
          int v274 = v10[((v260 * 4) + 2)][v261][v262];	// L372, [4,6)
          int v275 = v274 + v273;	// L373, [6,11)
          v10[((v260 * 4) + 2)][v261][v262] = v275;	// L374, [11,12)
          int v276 = v38[((v260 * 4) + 3)][v259];	// L375, [0,2)
          int v277 = v263 * v276;	// L376, [2,6)
          int v278 = v10[((v260 * 4) + 3)][v261][v262];	// L377, [4,6)
          int v279 = v278 + v277;	// L378, [6,11)
          v10[((v260 * 4) + 3)][v261][v262] = v279;	// L379, [11,12)
        }
      }
    }
  }
  for (int v280 = 0; v280 < 128; v280 += 1) {	// L384, [55458182,55724680), iterCycle=2082, II=2082
    for (int v281 = 0; v281 < 16; v281 += 1) {	// L385, [0,2082), iterCycle=130, II=130
      for (int v282 = 0; v282 < 16; v282 += 1) {	// L386, [0,130), iterCycle=8, II=8
        int v283 = v10[v280][v281][v282];	// L387, [0,2)
        int v284 = v36[v280][v281][v282];	// L388, [0,2)
        int v285 = v283 + v284;	// L389, [2,7)
        v11[v280][v281][v282] = v285;	// L390, [7,8)
      }
    }
  }
  for (int v286 = 0; v286 < 128; v286 += 1) {	// L394, [55724680,55827338), iterCycle=802, II=802
    for (int v287 = 0; v287 < 16; v287 += 1) {	// L395, [0,802), iterCycle=50, II=50
      for (int v288 = 0; v288 < 16; v288 += 1) {	// L396, [0,50), iterCycle=3, II=3
        int v289 = v11[v286][v287][v288];	// L397, [0,2)
        v11[v286][v287][v288] = max(v289,v0);	// L398, [2,3)
      }
    }
  }
  for (int v290 = 0; v290 < 128; v290 += 1) {	// L402, [55827338,55864460), iterCycle=290, II=290
    for (int v291 = 0; v291 < 16; v291 += 1) {	// L403, [0,290), iterCycle=18, II=18
      for (int v292 = 0; v292 < 16; v292 += 1) {	// L404, [0,18), iterCycle=1, II=1
        v12[v290][v291][v292] = v0;	// L405, [0,1)
      }
    }
  }
  for (int v293 = 0; v293 < 128; v293 += 1) {	// L409, [55864460,65301657), iterCycle=12, II=1
    for (int v294 = 0; v294 < 3; v294 += 1) {	// L410, [77938879,78012620), iterCycle=12, II=1
      for (int v295 = 0; v295 < 3; v295 += 1) {	// L411, [77938879,77963468), iterCycle=12, II=1
        for (int v296 = 0; v296 < 32; v296 += 1) {	// L412, [77938879,77947084), iterCycle=12, II=1
          for (int v297 = 0; v297 < 16; v297 += 1) {	// L413, [77938879,77939148), iterCycle=12, II=1
            for (int v298 = 0; v298 < 16; v298 += 1) {	// L414, [77938879,77938908), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v299 = v11[v293][(v297 + v294)][(v298 + v295)];	// L415, [0,2)
              int v300 = v4[(v296 * 4)][v293][v294][v295];	// L416, [0,2)
              int v301 = v299 * v300;	// L417, [2,6)
              int v302 = v12[(v296 * 4)][v297][v298];	// L418, [4,6)
              int v303 = v301 + v302;	// L419, [6,11)
              v12[(v296 * 4)][v297][v298] = v303;	// L420, [11,12)
              int v304 = v4[((v296 * 4) + 1)][v293][v294][v295];	// L421, [0,2)
              int v305 = v299 * v304;	// L422, [2,6)
              int v306 = v12[((v296 * 4) + 1)][v297][v298];	// L423, [4,6)
              int v307 = v305 + v306;	// L424, [6,11)
              v12[((v296 * 4) + 1)][v297][v298] = v307;	// L425, [11,12)
              int v308 = v4[((v296 * 4) + 2)][v293][v294][v295];	// L426, [0,2)
              int v309 = v299 * v308;	// L427, [2,6)
              int v310 = v12[((v296 * 4) + 2)][v297][v298];	// L428, [4,6)
              int v311 = v309 + v310;	// L429, [6,11)
              v12[((v296 * 4) + 2)][v297][v298] = v311;	// L430, [11,12)
              int v312 = v4[((v296 * 4) + 3)][v293][v294][v295];	// L431, [0,2)
              int v313 = v299 * v312;	// L432, [2,6)
              int v314 = v12[((v296 * 4) + 3)][v297][v298];	// L433, [4,6)
              int v315 = v313 + v314;	// L434, [6,11)
              v12[((v296 * 4) + 3)][v297][v298] = v315;	// L435, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v316 = 0; v316 < 128; v316 += 1) {	// L442, [65301657,65404315), iterCycle=802, II=802
    for (int v317 = 0; v317 < 16; v317 += 1) {	// L443, [0,802), iterCycle=50, II=50
      for (int v318 = 0; v318 < 16; v318 += 1) {	// L444, [0,50), iterCycle=3, II=3
        int v319 = v12[v316][v317][v318];	// L445, [0,2)
        v12[v316][v317][v318] = max(v319,v0);	// L446, [2,3)
      }
    }
  }
  for (int v320 = 0; v320 < 128; v320 += 1) {	// L450, [65404315,65441437), iterCycle=290, II=290
    for (int v321 = 0; v321 < 16; v321 += 1) {	// L451, [0,290), iterCycle=18, II=18
      for (int v322 = 0; v322 < 16; v322 += 1) {	// L452, [0,18), iterCycle=1, II=1
        v13[v320][v321][v322] = v0;	// L453, [0,1)
      }
    }
  }
  for (int v323 = 0; v323 < 128; v323 += 1) {	// L457, [65441437,74878634), iterCycle=12, II=1
    for (int v324 = 0; v324 < 3; v324 += 1) {	// L458, [68361902,68435643), iterCycle=12, II=1
      for (int v325 = 0; v325 < 3; v325 += 1) {	// L459, [68361902,68386491), iterCycle=12, II=1
        for (int v326 = 0; v326 < 32; v326 += 1) {	// L460, [68361902,68370107), iterCycle=12, II=1
          for (int v327 = 0; v327 < 16; v327 += 1) {	// L461, [68361902,68362171), iterCycle=12, II=1
            for (int v328 = 0; v328 < 16; v328 += 1) {	// L462, [68361902,68361931), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v329 = v12[v323][(v327 + v324)][(v328 + v325)];	// L463, [0,2)
              int v330 = v4[(v326 * 4)][v323][v324][v325];	// L464, [0,2)
              int v331 = v329 * v330;	// L465, [2,6)
              int v332 = v13[(v326 * 4)][v327][v328];	// L466, [4,6)
              int v333 = v331 + v332;	// L467, [6,11)
              v13[(v326 * 4)][v327][v328] = v333;	// L468, [11,12)
              int v334 = v4[((v326 * 4) + 1)][v323][v324][v325];	// L469, [0,2)
              int v335 = v329 * v334;	// L470, [2,6)
              int v336 = v13[((v326 * 4) + 1)][v327][v328];	// L471, [4,6)
              int v337 = v335 + v336;	// L472, [6,11)
              v13[((v326 * 4) + 1)][v327][v328] = v337;	// L473, [11,12)
              int v338 = v4[((v326 * 4) + 2)][v323][v324][v325];	// L474, [0,2)
              int v339 = v329 * v338;	// L475, [2,6)
              int v340 = v13[((v326 * 4) + 2)][v327][v328];	// L476, [4,6)
              int v341 = v339 + v340;	// L477, [6,11)
              v13[((v326 * 4) + 2)][v327][v328] = v341;	// L478, [11,12)
              int v342 = v4[((v326 * 4) + 3)][v323][v324][v325];	// L479, [0,2)
              int v343 = v329 * v342;	// L480, [2,6)
              int v344 = v13[((v326 * 4) + 3)][v327][v328];	// L481, [4,6)
              int v345 = v343 + v344;	// L482, [6,11)
              v13[((v326 * 4) + 3)][v327][v328] = v345;	// L483, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v346 = 0; v346 < 128; v346 += 1) {	// L490, [74878634,75145132), iterCycle=2082, II=2082
    for (int v347 = 0; v347 < 16; v347 += 1) {	// L491, [0,2082), iterCycle=130, II=130
      for (int v348 = 0; v348 < 16; v348 += 1) {	// L492, [0,130), iterCycle=8, II=8
        int v349 = v13[v346][v347][v348];	// L493, [0,2)
        int v350 = v11[v346][v347][v348];	// L494, [0,2)
        int v351 = v349 + v350;	// L495, [2,7)
        v14[v346][v347][v348] = v351;	// L496, [7,8)
      }
    }
  }
  for (int v352 = 0; v352 < 128; v352 += 1) {	// L500, [75145132,75247790), iterCycle=802, II=802
    for (int v353 = 0; v353 < 16; v353 += 1) {	// L501, [0,802), iterCycle=50, II=50
      for (int v354 = 0; v354 < 16; v354 += 1) {	// L502, [0,50), iterCycle=3, II=3
        int v355 = v14[v352][v353][v354];	// L503, [0,2)
        v14[v352][v353][v354] = max(v355,v0);	// L504, [2,3)
      }
    }
  }
  for (int v356 = 0; v356 < 256; v356 += 1) {	// L508, [75247790,75268784), iterCycle=82, II=82
    for (int v357 = 0; v357 < 8; v357 += 1) {	// L509, [0,82), iterCycle=10, II=10
      for (int v358 = 0; v358 < 8; v358 += 1) {	// L510, [0,10), iterCycle=1, II=1
        v15[v356][v357][v358] = v0;	// L511, [0,1)
      }
    }
  }
  for (int v359 = 0; v359 < 128; v359 += 1) {	// L515, [75268784,79987389), iterCycle=12, II=1
    for (int v360 = 0; v360 < 3; v360 += 1) {	// L516, [63253147,63290024), iterCycle=12, II=1
      for (int v361 = 0; v361 < 3; v361 += 1) {	// L517, [63253147,63265448), iterCycle=12, II=1
        for (int v362 = 0; v362 < 64; v362 += 1) {	// L518, [63253147,63257256), iterCycle=12, II=1
          for (int v363 = 0; v363 < 8; v363 += 1) {	// L519, [63253147,63253224), iterCycle=12, II=1
            for (int v364 = 0; v364 < 8; v364 += 1) {	// L520, [63253147,63253168), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v365 = v14[v359][((v363 * 2) + v360)][((v364 * 2) + v361)];	// L521, [0,2)
              int v366 = v5[(v362 * 4)][v359][v360][v361];	// L522, [0,2)
              int v367 = v365 * v366;	// L523, [2,6)
              int v368 = v15[(v362 * 4)][v363][v364];	// L524, [4,6)
              int v369 = v367 + v368;	// L525, [6,11)
              v15[(v362 * 4)][v363][v364] = v369;	// L526, [11,12)
              int v370 = v5[((v362 * 4) + 1)][v359][v360][v361];	// L527, [0,2)
              int v371 = v365 * v370;	// L528, [2,6)
              int v372 = v15[((v362 * 4) + 1)][v363][v364];	// L529, [4,6)
              int v373 = v371 + v372;	// L530, [6,11)
              v15[((v362 * 4) + 1)][v363][v364] = v373;	// L531, [11,12)
              int v374 = v5[((v362 * 4) + 2)][v359][v360][v361];	// L532, [0,2)
              int v375 = v365 * v374;	// L533, [2,6)
              int v376 = v15[((v362 * 4) + 2)][v363][v364];	// L534, [4,6)
              int v377 = v375 + v376;	// L535, [6,11)
              v15[((v362 * 4) + 2)][v363][v364] = v377;	// L536, [11,12)
              int v378 = v5[((v362 * 4) + 3)][v359][v360][v361];	// L537, [0,2)
              int v379 = v365 * v378;	// L538, [2,6)
              int v380 = v15[((v362 * 4) + 3)][v363][v364];	// L539, [4,6)
              int v381 = v379 + v380;	// L540, [6,11)
              v15[((v362 * 4) + 3)][v363][v364] = v381;	// L541, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v382 = 0; v382 < 256; v382 += 1) {	// L548, [79987389,80041151), iterCycle=210, II=210
    for (int v383 = 0; v383 < 8; v383 += 1) {	// L549, [0,210), iterCycle=26, II=26
      for (int v384 = 0; v384 < 8; v384 += 1) {	// L550, [0,26), iterCycle=3, II=3
        int v385 = v15[v382][v383][v384];	// L551, [0,2)
        v15[v382][v383][v384] = max(v385,v0);	// L552, [2,3)
      }
    }
  }
  for (int v386 = 0; v386 < 256; v386 += 1) {	// L556, [80041151,80062145), iterCycle=82, II=82
    for (int v387 = 0; v387 < 8; v387 += 1) {	// L557, [0,82), iterCycle=10, II=10
      for (int v388 = 0; v388 < 8; v388 += 1) {	// L558, [0,10), iterCycle=1, II=1
        v16[v386][v387][v388] = v0;	// L559, [0,1)
      }
    }
  }
  for (int v389 = 0; v389 < 256; v389 += 1) {	// L563, [80062145,89499342), iterCycle=12, II=1
    for (int v390 = 0; v390 < 3; v390 += 1) {	// L564, [53741194,53778071), iterCycle=12, II=1
      for (int v391 = 0; v391 < 3; v391 += 1) {	// L565, [53741194,53753495), iterCycle=12, II=1
        for (int v392 = 0; v392 < 64; v392 += 1) {	// L566, [53741194,53745303), iterCycle=12, II=1
          for (int v393 = 0; v393 < 8; v393 += 1) {	// L567, [53741194,53741271), iterCycle=12, II=1
            for (int v394 = 0; v394 < 8; v394 += 1) {	// L568, [53741194,53741215), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v395 = v15[v389][(v393 + v390)][(v394 + v391)];	// L569, [0,2)
              int v396 = v6[(v392 * 4)][v389][v390][v391];	// L570, [0,2)
              int v397 = v395 * v396;	// L571, [2,6)
              int v398 = v16[(v392 * 4)][v393][v394];	// L572, [4,6)
              int v399 = v397 + v398;	// L573, [6,11)
              v16[(v392 * 4)][v393][v394] = v399;	// L574, [11,12)
              int v400 = v6[((v392 * 4) + 1)][v389][v390][v391];	// L575, [0,2)
              int v401 = v395 * v400;	// L576, [2,6)
              int v402 = v16[((v392 * 4) + 1)][v393][v394];	// L577, [4,6)
              int v403 = v401 + v402;	// L578, [6,11)
              v16[((v392 * 4) + 1)][v393][v394] = v403;	// L579, [11,12)
              int v404 = v6[((v392 * 4) + 2)][v389][v390][v391];	// L580, [0,2)
              int v405 = v395 * v404;	// L581, [2,6)
              int v406 = v16[((v392 * 4) + 2)][v393][v394];	// L582, [4,6)
              int v407 = v405 + v406;	// L583, [6,11)
              v16[((v392 * 4) + 2)][v393][v394] = v407;	// L584, [11,12)
              int v408 = v6[((v392 * 4) + 3)][v389][v390][v391];	// L585, [0,2)
              int v409 = v395 * v408;	// L586, [2,6)
              int v410 = v16[((v392 * 4) + 3)][v393][v394];	// L587, [4,6)
              int v411 = v409 + v410;	// L588, [6,11)
              v16[((v392 * 4) + 3)][v393][v394] = v411;	// L589, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v412 = 0; v412 < 128; v412 += 1) {	// L596, [89499342,90023643), iterCycle=12, II=1
    for (int v413 = 0; v413 < 64; v413 += 1) {	// L597, [53216893,53221002), iterCycle=12, II=1
      for (int v414 = 0; v414 < 8; v414 += 1) {	// L598, [53216893,53216970), iterCycle=12, II=1
        for (int v415 = 0; v415 < 8; v415 += 1) {	// L599, [53216893,53216914), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          int v416 = v14[v412][(v414 * 2)][(v415 * 2)];	// L600, [0,2)
          int v417 = v39[(v413 * 4)][v412];	// L601, [0,2)
          int v418 = v416 * v417;	// L602, [2,6)
          int v419 = v17[(v413 * 4)][v414][v415];	// L603, [4,6)
          int v420 = v419 + v418;	// L604, [6,11)
          v17[(v413 * 4)][v414][v415] = v420;	// L605, [11,12)
          int v421 = v39[((v413 * 4) + 1)][v412];	// L606, [0,2)
          int v422 = v416 * v421;	// L607, [2,6)
          int v423 = v17[((v413 * 4) + 1)][v414][v415];	// L608, [4,6)
          int v424 = v423 + v422;	// L609, [6,11)
          v17[((v413 * 4) + 1)][v414][v415] = v424;	// L610, [11,12)
          int v425 = v39[((v413 * 4) + 2)][v412];	// L611, [0,2)
          int v426 = v416 * v425;	// L612, [2,6)
          int v427 = v17[((v413 * 4) + 2)][v414][v415];	// L613, [4,6)
          int v428 = v427 + v426;	// L614, [6,11)
          v17[((v413 * 4) + 2)][v414][v415] = v428;	// L615, [11,12)
          int v429 = v39[((v413 * 4) + 3)][v412];	// L616, [0,2)
          int v430 = v416 * v429;	// L617, [2,6)
          int v431 = v17[((v413 * 4) + 3)][v414][v415];	// L618, [4,6)
          int v432 = v431 + v430;	// L619, [6,11)
          v17[((v413 * 4) + 3)][v414][v415] = v432;	// L620, [11,12)
        }
      }
    }
  }
  for (int v433 = 0; v433 < 256; v433 += 1) {	// L625, [90023643,90159325), iterCycle=530, II=530
    for (int v434 = 0; v434 < 8; v434 += 1) {	// L626, [0,530), iterCycle=66, II=66
      for (int v435 = 0; v435 < 8; v435 += 1) {	// L627, [0,66), iterCycle=8, II=8
        int v436 = v17[v433][v434][v435];	// L628, [0,2)
        int v437 = v16[v433][v434][v435];	// L629, [0,2)
        int v438 = v436 + v437;	// L630, [2,7)
        v18[v433][v434][v435] = v438;	// L631, [7,8)
      }
    }
  }
  for (int v439 = 0; v439 < 256; v439 += 1) {	// L635, [90159325,90213087), iterCycle=210, II=210
    for (int v440 = 0; v440 < 8; v440 += 1) {	// L636, [0,210), iterCycle=26, II=26
      for (int v441 = 0; v441 < 8; v441 += 1) {	// L637, [0,26), iterCycle=3, II=3
        int v442 = v18[v439][v440][v441];	// L638, [0,2)
        v18[v439][v440][v441] = max(v442,v0);	// L639, [2,3)
      }
    }
  }
  for (int v443 = 0; v443 < 256; v443 += 1) {	// L643, [90213087,90234081), iterCycle=82, II=82
    for (int v444 = 0; v444 < 8; v444 += 1) {	// L644, [0,82), iterCycle=10, II=10
      for (int v445 = 0; v445 < 8; v445 += 1) {	// L645, [0,10), iterCycle=1, II=1
        v19[v443][v444][v445] = v0;	// L646, [0,1)
      }
    }
  }
  for (int v446 = 0; v446 < 256; v446 += 1) {	// L650, [90234081,99671278), iterCycle=12, II=1
    for (int v447 = 0; v447 < 3; v447 += 1) {	// L651, [43569258,43606135), iterCycle=12, II=1
      for (int v448 = 0; v448 < 3; v448 += 1) {	// L652, [43569258,43581559), iterCycle=12, II=1
        for (int v449 = 0; v449 < 64; v449 += 1) {	// L653, [43569258,43573367), iterCycle=12, II=1
          for (int v450 = 0; v450 < 8; v450 += 1) {	// L654, [43569258,43569335), iterCycle=12, II=1
            for (int v451 = 0; v451 < 8; v451 += 1) {	// L655, [43569258,43569279), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v452 = v18[v446][(v450 + v447)][(v451 + v448)];	// L656, [0,2)
              int v453 = v6[(v449 * 4)][v446][v447][v448];	// L657, [0,2)
              int v454 = v452 * v453;	// L658, [2,6)
              int v455 = v19[(v449 * 4)][v450][v451];	// L659, [4,6)
              int v456 = v454 + v455;	// L660, [6,11)
              v19[(v449 * 4)][v450][v451] = v456;	// L661, [11,12)
              int v457 = v6[((v449 * 4) + 1)][v446][v447][v448];	// L662, [0,2)
              int v458 = v452 * v457;	// L663, [2,6)
              int v459 = v19[((v449 * 4) + 1)][v450][v451];	// L664, [4,6)
              int v460 = v458 + v459;	// L665, [6,11)
              v19[((v449 * 4) + 1)][v450][v451] = v460;	// L666, [11,12)
              int v461 = v6[((v449 * 4) + 2)][v446][v447][v448];	// L667, [0,2)
              int v462 = v452 * v461;	// L668, [2,6)
              int v463 = v19[((v449 * 4) + 2)][v450][v451];	// L669, [4,6)
              int v464 = v462 + v463;	// L670, [6,11)
              v19[((v449 * 4) + 2)][v450][v451] = v464;	// L671, [11,12)
              int v465 = v6[((v449 * 4) + 3)][v446][v447][v448];	// L672, [0,2)
              int v466 = v452 * v465;	// L673, [2,6)
              int v467 = v19[((v449 * 4) + 3)][v450][v451];	// L674, [4,6)
              int v468 = v466 + v467;	// L675, [6,11)
              v19[((v449 * 4) + 3)][v450][v451] = v468;	// L676, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v469 = 0; v469 < 256; v469 += 1) {	// L683, [99671278,99725040), iterCycle=210, II=210
    for (int v470 = 0; v470 < 8; v470 += 1) {	// L684, [0,210), iterCycle=26, II=26
      for (int v471 = 0; v471 < 8; v471 += 1) {	// L685, [0,26), iterCycle=3, II=3
        int v472 = v19[v469][v470][v471];	// L686, [0,2)
        v19[v469][v470][v471] = max(v472,v0);	// L687, [2,3)
      }
    }
  }
  for (int v473 = 0; v473 < 256; v473 += 1) {	// L691, [99725040,99746034), iterCycle=82, II=82
    for (int v474 = 0; v474 < 8; v474 += 1) {	// L692, [0,82), iterCycle=10, II=10
      for (int v475 = 0; v475 < 8; v475 += 1) {	// L693, [0,10), iterCycle=1, II=1
        v21[v473][v474][v475] = v0;	// L694, [0,1)
      }
    }
  }
  for (int v476 = 0; v476 < 256; v476 += 1) {	// L698, [99746034,109183231), iterCycle=12, II=1
    for (int v477 = 0; v477 < 3; v477 += 1) {	// L699, [34057305,34094182), iterCycle=12, II=1
      for (int v478 = 0; v478 < 3; v478 += 1) {	// L700, [34057305,34069606), iterCycle=12, II=1
        for (int v479 = 0; v479 < 64; v479 += 1) {	// L701, [34057305,34061414), iterCycle=12, II=1
          for (int v480 = 0; v480 < 8; v480 += 1) {	// L702, [34057305,34057382), iterCycle=12, II=1
            for (int v481 = 0; v481 < 8; v481 += 1) {	// L703, [34057305,34057326), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v482 = v19[v476][(v480 + v477)][(v481 + v478)];	// L704, [0,2)
              int v483 = v6[(v479 * 4)][v476][v477][v478];	// L705, [0,2)
              int v484 = v482 * v483;	// L706, [2,6)
              int v485 = v21[(v479 * 4)][v480][v481];	// L707, [4,6)
              int v486 = v484 + v485;	// L708, [6,11)
              v21[(v479 * 4)][v480][v481] = v486;	// L709, [11,12)
              int v487 = v6[((v479 * 4) + 1)][v476][v477][v478];	// L710, [0,2)
              int v488 = v482 * v487;	// L711, [2,6)
              int v489 = v21[((v479 * 4) + 1)][v480][v481];	// L712, [4,6)
              int v490 = v488 + v489;	// L713, [6,11)
              v21[((v479 * 4) + 1)][v480][v481] = v490;	// L714, [11,12)
              int v491 = v6[((v479 * 4) + 2)][v476][v477][v478];	// L715, [0,2)
              int v492 = v482 * v491;	// L716, [2,6)
              int v493 = v21[((v479 * 4) + 2)][v480][v481];	// L717, [4,6)
              int v494 = v492 + v493;	// L718, [6,11)
              v21[((v479 * 4) + 2)][v480][v481] = v494;	// L719, [11,12)
              int v495 = v6[((v479 * 4) + 3)][v476][v477][v478];	// L720, [0,2)
              int v496 = v482 * v495;	// L721, [2,6)
              int v497 = v21[((v479 * 4) + 3)][v480][v481];	// L722, [4,6)
              int v498 = v496 + v497;	// L723, [6,11)
              v21[((v479 * 4) + 3)][v480][v481] = v498;	// L724, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v499 = 0; v499 < 256; v499 += 1) {	// L731, [109183231,109318913), iterCycle=530, II=530
    for (int v500 = 0; v500 < 8; v500 += 1) {	// L732, [0,530), iterCycle=66, II=66
      for (int v501 = 0; v501 < 8; v501 += 1) {	// L733, [0,66), iterCycle=8, II=8
        int v502 = v21[v499][v500][v501];	// L734, [0,2)
        int v503 = v18[v499][v500][v501];	// L735, [0,2)
        int v504 = v502 + v503;	// L736, [2,7)
        v22[v499][v500][v501] = v504;	// L737, [7,8)
      }
    }
  }
  for (int v505 = 0; v505 < 256; v505 += 1) {	// L741, [109318913,109372675), iterCycle=210, II=210
    for (int v506 = 0; v506 < 8; v506 += 1) {	// L742, [0,210), iterCycle=26, II=26
      for (int v507 = 0; v507 < 8; v507 += 1) {	// L743, [0,26), iterCycle=3, II=3
        int v508 = v22[v505][v506][v507];	// L744, [0,2)
        v22[v505][v506][v507] = max(v508,v0);	// L745, [2,3)
      }
    }
  }
  for (int v509 = 0; v509 < 512; v509 += 1) {	// L749, [109372675,109385989), iterCycle=26, II=26
    for (int v510 = 0; v510 < 4; v510 += 1) {	// L750, [0,26), iterCycle=6, II=6
      for (int v511 = 0; v511 < 4; v511 += 1) {	// L751, [0,6), iterCycle=1, II=1
        v23[v509][v510][v511] = v0;	// L752, [0,1)
      }
    }
  }
  for (int v512 = 0; v512 < 256; v512 += 1) {	// L756, [109385989,114104594), iterCycle=12, II=1
    for (int v513 = 0; v513 < 3; v513 += 1) {	// L757, [29135942,29154387), iterCycle=12, II=1
      for (int v514 = 0; v514 < 3; v514 += 1) {	// L758, [29135942,29142099), iterCycle=12, II=1
        for (int v515 = 0; v515 < 128; v515 += 1) {	// L759, [29135942,29138003), iterCycle=12, II=1
          for (int v516 = 0; v516 < 4; v516 += 1) {	// L760, [29135942,29135971), iterCycle=12, II=1
            for (int v517 = 0; v517 < 4; v517 += 1) {	// L761, [29135942,29135959), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v518 = v22[v512][((v516 * 2) + v513)][((v517 * 2) + v514)];	// L762, [0,2)
              int v519 = v7[(v515 * 4)][v512][v513][v514];	// L763, [0,2)
              int v520 = v518 * v519;	// L764, [2,6)
              int v521 = v23[(v515 * 4)][v516][v517];	// L765, [4,6)
              int v522 = v520 + v521;	// L766, [6,11)
              v23[(v515 * 4)][v516][v517] = v522;	// L767, [11,12)
              int v523 = v7[((v515 * 4) + 1)][v512][v513][v514];	// L768, [0,2)
              int v524 = v518 * v523;	// L769, [2,6)
              int v525 = v23[((v515 * 4) + 1)][v516][v517];	// L770, [4,6)
              int v526 = v524 + v525;	// L771, [6,11)
              v23[((v515 * 4) + 1)][v516][v517] = v526;	// L772, [11,12)
              int v527 = v7[((v515 * 4) + 2)][v512][v513][v514];	// L773, [0,2)
              int v528 = v518 * v527;	// L774, [2,6)
              int v529 = v23[((v515 * 4) + 2)][v516][v517];	// L775, [4,6)
              int v530 = v528 + v529;	// L776, [6,11)
              v23[((v515 * 4) + 2)][v516][v517] = v530;	// L777, [11,12)
              int v531 = v7[((v515 * 4) + 3)][v512][v513][v514];	// L778, [0,2)
              int v532 = v518 * v531;	// L779, [2,6)
              int v533 = v23[((v515 * 4) + 3)][v516][v517];	// L780, [4,6)
              int v534 = v532 + v533;	// L781, [6,11)
              v23[((v515 * 4) + 3)][v516][v517] = v534;	// L782, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v535 = 0; v535 < 512; v535 += 1) {	// L789, [114104594,114134292), iterCycle=58, II=58
    for (int v536 = 0; v536 < 4; v536 += 1) {	// L790, [0,58), iterCycle=14, II=14
      for (int v537 = 0; v537 < 4; v537 += 1) {	// L791, [0,14), iterCycle=3, II=3
        int v538 = v23[v535][v536][v537];	// L792, [0,2)
        v23[v535][v536][v537] = max(v538,v0);	// L793, [2,3)
      }
    }
  }
  for (int v539 = 0; v539 < 512; v539 += 1) {	// L797, [114134292,114147606), iterCycle=26, II=26
    for (int v540 = 0; v540 < 4; v540 += 1) {	// L798, [0,26), iterCycle=6, II=6
      for (int v541 = 0; v541 < 4; v541 += 1) {	// L799, [0,6), iterCycle=1, II=1
        v24[v539][v540][v541] = v0;	// L800, [0,1)
      }
    }
  }
  for (int v542 = 0; v542 < 512; v542 += 1) {	// L804, [114147606,123584803), iterCycle=12, II=1
    for (int v543 = 0; v543 < 3; v543 += 1) {	// L805, [19655733,19674178), iterCycle=12, II=1
      for (int v544 = 0; v544 < 3; v544 += 1) {	// L806, [19655733,19661890), iterCycle=12, II=1
        for (int v545 = 0; v545 < 128; v545 += 1) {	// L807, [19655733,19657794), iterCycle=12, II=1
          for (int v546 = 0; v546 < 4; v546 += 1) {	// L808, [19655733,19655762), iterCycle=12, II=1
            for (int v547 = 0; v547 < 4; v547 += 1) {	// L809, [19655733,19655750), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v548 = v23[v542][(v546 + v543)][(v547 + v544)];	// L810, [0,2)
              int v549 = v8[(v545 * 4)][v542][v543][v544];	// L811, [0,2)
              int v550 = v548 * v549;	// L812, [2,6)
              int v551 = v24[(v545 * 4)][v546][v547];	// L813, [4,6)
              int v552 = v550 + v551;	// L814, [6,11)
              v24[(v545 * 4)][v546][v547] = v552;	// L815, [11,12)
              int v553 = v8[((v545 * 4) + 1)][v542][v543][v544];	// L816, [0,2)
              int v554 = v548 * v553;	// L817, [2,6)
              int v555 = v24[((v545 * 4) + 1)][v546][v547];	// L818, [4,6)
              int v556 = v554 + v555;	// L819, [6,11)
              v24[((v545 * 4) + 1)][v546][v547] = v556;	// L820, [11,12)
              int v557 = v8[((v545 * 4) + 2)][v542][v543][v544];	// L821, [0,2)
              int v558 = v548 * v557;	// L822, [2,6)
              int v559 = v24[((v545 * 4) + 2)][v546][v547];	// L823, [4,6)
              int v560 = v558 + v559;	// L824, [6,11)
              v24[((v545 * 4) + 2)][v546][v547] = v560;	// L825, [11,12)
              int v561 = v8[((v545 * 4) + 3)][v542][v543][v544];	// L826, [0,2)
              int v562 = v548 * v561;	// L827, [2,6)
              int v563 = v24[((v545 * 4) + 3)][v546][v547];	// L828, [4,6)
              int v564 = v562 + v563;	// L829, [6,11)
              v24[((v545 * 4) + 3)][v546][v547] = v564;	// L830, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v565 = 0; v565 < 256; v565 += 1) {	// L837, [123584803,124109104), iterCycle=12, II=1
    for (int v566 = 0; v566 < 128; v566 += 1) {	// L838, [19131432,19133493), iterCycle=12, II=1
      for (int v567 = 0; v567 < 4; v567 += 1) {	// L839, [19131432,19131461), iterCycle=12, II=1
        for (int v568 = 0; v568 < 4; v568 += 1) {	// L840, [19131432,19131449), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          int v569 = v22[v565][(v567 * 2)][(v568 * 2)];	// L841, [0,2)
          int v570 = v40[(v566 * 4)][v565];	// L842, [0,2)
          int v571 = v569 * v570;	// L843, [2,6)
          int v572 = v25[(v566 * 4)][v567][v568];	// L844, [4,6)
          int v573 = v572 + v571;	// L845, [6,11)
          v25[(v566 * 4)][v567][v568] = v573;	// L846, [11,12)
          int v574 = v40[((v566 * 4) + 1)][v565];	// L847, [0,2)
          int v575 = v569 * v574;	// L848, [2,6)
          int v576 = v25[((v566 * 4) + 1)][v567][v568];	// L849, [4,6)
          int v577 = v576 + v575;	// L850, [6,11)
          v25[((v566 * 4) + 1)][v567][v568] = v577;	// L851, [11,12)
          int v578 = v40[((v566 * 4) + 2)][v565];	// L852, [0,2)
          int v579 = v569 * v578;	// L853, [2,6)
          int v580 = v25[((v566 * 4) + 2)][v567][v568];	// L854, [4,6)
          int v581 = v580 + v579;	// L855, [6,11)
          v25[((v566 * 4) + 2)][v567][v568] = v581;	// L856, [11,12)
          int v582 = v40[((v566 * 4) + 3)][v565];	// L857, [0,2)
          int v583 = v569 * v582;	// L858, [2,6)
          int v584 = v25[((v566 * 4) + 3)][v567][v568];	// L859, [4,6)
          int v585 = v584 + v583;	// L860, [6,11)
          v25[((v566 * 4) + 3)][v567][v568] = v585;	// L861, [11,12)
        }
      }
    }
  }
  for (int v586 = 0; v586 < 512; v586 += 1) {	// L866, [124109104,124179762), iterCycle=138, II=138
    for (int v587 = 0; v587 < 4; v587 += 1) {	// L867, [0,138), iterCycle=34, II=34
      for (int v588 = 0; v588 < 4; v588 += 1) {	// L868, [0,34), iterCycle=8, II=8
        int v589 = v25[v586][v587][v588];	// L869, [0,2)
        int v590 = v24[v586][v587][v588];	// L870, [0,2)
        int v591 = v589 + v590;	// L871, [2,7)
        v26[v586][v587][v588] = v591;	// L872, [7,8)
      }
    }
  }
  for (int v592 = 0; v592 < 512; v592 += 1) {	// L876, [124179762,124209460), iterCycle=58, II=58
    for (int v593 = 0; v593 < 4; v593 += 1) {	// L877, [0,58), iterCycle=14, II=14
      for (int v594 = 0; v594 < 4; v594 += 1) {	// L878, [0,14), iterCycle=3, II=3
        int v595 = v26[v592][v593][v594];	// L879, [0,2)
        v26[v592][v593][v594] = max(v595,v0);	// L880, [2,3)
      }
    }
  }
  for (int v596 = 0; v596 < 512; v596 += 1) {	// L884, [124209460,124222774), iterCycle=26, II=26
    for (int v597 = 0; v597 < 4; v597 += 1) {	// L885, [0,26), iterCycle=6, II=6
      for (int v598 = 0; v598 < 4; v598 += 1) {	// L886, [0,6), iterCycle=1, II=1
        v27[v596][v597][v598] = v0;	// L887, [0,1)
      }
    }
  }
  for (int v599 = 0; v599 < 512; v599 += 1) {	// L891, [124222774,133659971), iterCycle=12, II=1
    for (int v600 = 0; v600 < 3; v600 += 1) {	// L892, [9580565,9599010), iterCycle=12, II=1
      for (int v601 = 0; v601 < 3; v601 += 1) {	// L893, [9580565,9586722), iterCycle=12, II=1
        for (int v602 = 0; v602 < 128; v602 += 1) {	// L894, [9580565,9582626), iterCycle=12, II=1
          for (int v603 = 0; v603 < 4; v603 += 1) {	// L895, [9580565,9580594), iterCycle=12, II=1
            for (int v604 = 0; v604 < 4; v604 += 1) {	// L896, [9580565,9580582), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v605 = v26[v599][(v603 + v600)][(v604 + v601)];	// L897, [0,2)
              int v606 = v8[(v602 * 4)][v599][v600][v601];	// L898, [0,2)
              int v607 = v605 * v606;	// L899, [2,6)
              int v608 = v27[(v602 * 4)][v603][v604];	// L900, [4,6)
              int v609 = v607 + v608;	// L901, [6,11)
              v27[(v602 * 4)][v603][v604] = v609;	// L902, [11,12)
              int v610 = v8[((v602 * 4) + 1)][v599][v600][v601];	// L903, [0,2)
              int v611 = v605 * v610;	// L904, [2,6)
              int v612 = v27[((v602 * 4) + 1)][v603][v604];	// L905, [4,6)
              int v613 = v611 + v612;	// L906, [6,11)
              v27[((v602 * 4) + 1)][v603][v604] = v613;	// L907, [11,12)
              int v614 = v8[((v602 * 4) + 2)][v599][v600][v601];	// L908, [0,2)
              int v615 = v605 * v614;	// L909, [2,6)
              int v616 = v27[((v602 * 4) + 2)][v603][v604];	// L910, [4,6)
              int v617 = v615 + v616;	// L911, [6,11)
              v27[((v602 * 4) + 2)][v603][v604] = v617;	// L912, [11,12)
              int v618 = v8[((v602 * 4) + 3)][v599][v600][v601];	// L913, [0,2)
              int v619 = v605 * v618;	// L914, [2,6)
              int v620 = v27[((v602 * 4) + 3)][v603][v604];	// L915, [4,6)
              int v621 = v619 + v620;	// L916, [6,11)
              v27[((v602 * 4) + 3)][v603][v604] = v621;	// L917, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v622 = 0; v622 < 512; v622 += 1) {	// L924, [133659971,133689669), iterCycle=58, II=58
    for (int v623 = 0; v623 < 4; v623 += 1) {	// L925, [0,58), iterCycle=14, II=14
      for (int v624 = 0; v624 < 4; v624 += 1) {	// L926, [0,14), iterCycle=3, II=3
        int v625 = v27[v622][v623][v624];	// L927, [0,2)
        v27[v622][v623][v624] =max(v625,v0) ;	// L928, [2,3)
      }
    }
  }
  for (int v626 = 0; v626 < 512; v626 += 1) {	// L932, [133689669,133702983), iterCycle=26, II=26
    for (int v627 = 0; v627 < 4; v627 += 1) {	// L933, [0,26), iterCycle=6, II=6
      for (int v628 = 0; v628 < 4; v628 += 1) {	// L934, [0,6), iterCycle=1, II=1
        v28[v626][v627][v628] = v0;	// L935, [0,1)
      }
    }
  }
  for (int v629 = 0; v629 < 512; v629 += 1) {	// L939, [133702983,143140180), iterCycle=12, II=1
    for (int v630 = 0; v630 < 3; v630 += 1) {	// L940, [100356,118801), iterCycle=12, II=1
      for (int v631 = 0; v631 < 3; v631 += 1) {	// L941, [100356,106513), iterCycle=12, II=1
        for (int v632 = 0; v632 < 128; v632 += 1) {	// L942, [100356,102417), iterCycle=12, II=1
          for (int v633 = 0; v633 < 4; v633 += 1) {	// L943, [100356,100385), iterCycle=12, II=1
            for (int v634 = 0; v634 < 4; v634 += 1) {	// L944, [100356,100373), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              int v635 = v27[v629][(v633 + v630)][(v634 + v631)];	// L945, [0,2)
              int v636 = v8[(v632 * 4)][v629][v630][v631];	// L946, [0,2)
              int v637 = v635 * v636;	// L947, [2,6)
              int v638 = v28[(v632 * 4)][v633][v634];	// L948, [4,6)
              int v639 = v637 + v638;	// L949, [6,11)
              v28[(v632 * 4)][v633][v634] = v639;	// L950, [11,12)
              int v640 = v8[((v632 * 4) + 1)][v629][v630][v631];	// L951, [0,2)
              int v641 = v635 * v640;	// L952, [2,6)
              int v642 = v28[((v632 * 4) + 1)][v633][v634];	// L953, [4,6)
              int v643 = v641 + v642;	// L954, [6,11)
              v28[((v632 * 4) + 1)][v633][v634] = v643;	// L955, [11,12)
              int v644 = v8[((v632 * 4) + 2)][v629][v630][v631];	// L956, [0,2)
              int v645 = v635 * v644;	// L957, [2,6)
              int v646 = v28[((v632 * 4) + 2)][v633][v634];	// L958, [4,6)
              int v647 = v645 + v646;	// L959, [6,11)
              v28[((v632 * 4) + 2)][v633][v634] = v647;	// L960, [11,12)
              int v648 = v8[((v632 * 4) + 3)][v629][v630][v631];	// L961, [0,2)
              int v649 = v635 * v648;	// L962, [2,6)
              int v650 = v28[((v632 * 4) + 3)][v633][v634];	// L963, [4,6)
              int v651 = v649 + v650;	// L964, [6,11)
              v28[((v632 * 4) + 3)][v633][v634] = v651;	// L965, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v652 = 0; v652 < 512; v652 += 1) {	// L972, [143140180,143210838), iterCycle=138, II=138
    for (int v653 = 0; v653 < 4; v653 += 1) {	// L973, [0,138), iterCycle=34, II=34
      for (int v654 = 0; v654 < 4; v654 += 1) {	// L974, [0,34), iterCycle=8, II=8
        int v655 = v28[v652][v653][v654];	// L975, [0,2)
        int v656 = v26[v652][v653][v654];	// L976, [0,2)
        int v657 = v655 + v656;	// L977, [2,7)
        v29[v652][v653][v654] = v657;	// L978, [7,8)
      }
    }
  }
  for (int v658 = 0; v658 < 512; v658 += 1) {	// L982, [143210838,143240536), iterCycle=58, II=58
    for (int v659 = 0; v659 < 4; v659 += 1) {	// L983, [0,58), iterCycle=14, II=14
      for (int v660 = 0; v660 < 4; v660 += 1) {	// L984, [0,14), iterCycle=3, II=3
        int v661 = v29[v658][v659][v660];	// L985, [0,2)
        v29[v658][v659][v660] = max(v661,v0);	// L986, [2,3)
      }
    }
  }
}

