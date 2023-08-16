
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
/// Latency=144813402, interval=144813402
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
) {	// L7, [0,144813402)
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

  #pragma HLS array_partition variable=v10 cyclic factor=2 dim=1
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

  #pragma HLS array_partition variable=v38 cyclic factor=2 dim=1
  #pragma HLS resource variable=v38 core=ram_s2p_bram

  #pragma HLS array_partition variable=v39 cyclic factor=2 dim=1
  #pragma HLS resource variable=v39 core=ram_s2p_bram

  #pragma HLS array_partition variable=v40 cyclic factor=2 dim=1
  #pragma HLS resource variable=v40 core=ram_s2p_bram

  for (int v41 = 0; v41 < 64; v41 += 1) {	// L8, [0,69762), iterCycle=1090, II=1090
    for (int v42 = 0; v42 < 32; v42 += 1) {	// L9, [0,1090), iterCycle=34, II=34
      for (int v43 = 0; v43 < 32; v43 += 1) {	// L10, [0,34), iterCycle=1, II=1
        v9[v41][v42][v43] = v0;	// L11, [0,1)
      }
    }
  }
  for (int v44 = 0; v44 < 3; v44 += 1) {	// L15, [69762,512143), iterCycle=12, II=1
    for (int v45 = 0; v45 < 3; v45 += 1) {	// L16, [144301257,144448726), iterCycle=12, II=1
      for (int v46 = 0; v46 < 3; v46 += 1) {	// L17, [144301257,144350422), iterCycle=12, II=1
        for (int v47 = 0; v47 < 16; v47 += 1) {	// L18, [144301257,144317654), iterCycle=12, II=1
          for (int v48 = 0; v48 < 32; v48 += 1) {	// L19, [144301257,144302294), iterCycle=12, II=1
            for (int v49 = 0; v49 < 32; v49 += 1) {	// L20, [144301257,144301302), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v50 = v37[v44][(v48 + v45)][(v49 + v46)];	// L21, [0,2)
              float v51 = v1[(v47 * 4)][v44][v45][v46];	// L22, [0,2)
              float v52 = v50 * v51;	// L23, [2,6)
              float v53 = v9[(v47 * 4)][v48][v49];	// L24, [4,6)
              float v54 = v52 + v53;	// L25, [6,11)
              v9[(v47 * 4)][v48][v49] = v54;	// L26, [11,12)
              float v55 = v1[((v47 * 4) + 1)][v44][v45][v46];	// L27, [0,2)
              float v56 = v50 * v55;	// L28, [2,6)
              float v57 = v9[((v47 * 4) + 1)][v48][v49];	// L29, [4,6)
              float v58 = v56 + v57;	// L30, [6,11)
              v9[((v47 * 4) + 1)][v48][v49] = v58;	// L31, [11,12)
              float v59 = v1[((v47 * 4) + 2)][v44][v45][v46];	// L32, [0,2)
              float v60 = v50 * v59;	// L33, [2,6)
              float v61 = v9[((v47 * 4) + 2)][v48][v49];	// L34, [4,6)
              float v62 = v60 + v61;	// L35, [6,11)
              v9[((v47 * 4) + 2)][v48][v49] = v62;	// L36, [11,12)
              float v63 = v1[((v47 * 4) + 3)][v44][v45][v46];	// L37, [0,2)
              float v64 = v50 * v63;	// L38, [2,6)
              float v65 = v9[((v47 * 4) + 3)][v48][v49];	// L39, [4,6)
              float v66 = v64 + v65;	// L40, [6,11)
              v9[((v47 * 4) + 3)][v48][v49] = v66;	// L41, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v67 = 0; v67 < 64; v67 += 1) {	// L48, [512143,712977), iterCycle=3138, II=3138
    for (int v68 = 0; v68 < 32; v68 += 1) {	// L49, [0,3138), iterCycle=98, II=98
      for (int v69 = 0; v69 < 32; v69 += 1) {	// L50, [0,98), iterCycle=3, II=3
        float v70 = v9[v67][v68][v69];	// L51, [0,2)
        v9[v67][v68][v69] = max(v70,v0);	// L52, [2,3)
      }
    }
  }
  for (int v71 = 0; v71 < 64; v71 += 1) {	// L56, [712977,782739), iterCycle=1090, II=1090
    for (int v72 = 0; v72 < 32; v72 += 1) {	// L57, [0,1090), iterCycle=34, II=34
      for (int v73 = 0; v73 < 32; v73 += 1) {	// L58, [0,34), iterCycle=1, II=1
        v20[v71][v72][v73] = v0;	// L59, [0,1)
      }
    }
  }
  for (int v74 = 0; v74 < 64; v74 += 1) {	// L63, [782739,10219936), iterCycle=12, II=1
    for (int v75 = 0; v75 < 3; v75 += 1) {	// L64, [134593464,134740933), iterCycle=12, II=1
      for (int v76 = 0; v76 < 3; v76 += 1) {	// L65, [134593464,134642629), iterCycle=12, II=1
        for (int v77 = 0; v77 < 16; v77 += 1) {	// L66, [134593464,134609861), iterCycle=12, II=1
          for (int v78 = 0; v78 < 32; v78 += 1) {	// L67, [134593464,134594501), iterCycle=12, II=1
            for (int v79 = 0; v79 < 32; v79 += 1) {	// L68, [134593464,134593509), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v80 = v9[v74][(v78 + v75)][(v79 + v76)];	// L69, [0,2)
              float v81 = v2[(v77 * 4)][v74][v75][v76];	// L70, [0,2)
              float v82 = v80 * v81;	// L71, [2,6)
              float v83 = v20[(v77 * 4)][v78][v79];	// L72, [4,6)
              float v84 = v82 + v83;	// L73, [6,11)
              v20[(v77 * 4)][v78][v79] = v84;	// L74, [11,12)
              float v85 = v2[((v77 * 4) + 1)][v74][v75][v76];	// L75, [0,2)
              float v86 = v80 * v85;	// L76, [2,6)
              float v87 = v20[((v77 * 4) + 1)][v78][v79];	// L77, [4,6)
              float v88 = v86 + v87;	// L78, [6,11)
              v20[((v77 * 4) + 1)][v78][v79] = v88;	// L79, [11,12)
              float v89 = v2[((v77 * 4) + 2)][v74][v75][v76];	// L80, [0,2)
              float v90 = v80 * v89;	// L81, [2,6)
              float v91 = v20[((v77 * 4) + 2)][v78][v79];	// L82, [4,6)
              float v92 = v90 + v91;	// L83, [6,11)
              v20[((v77 * 4) + 2)][v78][v79] = v92;	// L84, [11,12)
              float v93 = v2[((v77 * 4) + 3)][v74][v75][v76];	// L85, [0,2)
              float v94 = v80 * v93;	// L86, [2,6)
              float v95 = v20[((v77 * 4) + 3)][v78][v79];	// L87, [4,6)
              float v96 = v94 + v95;	// L88, [6,11)
              v20[((v77 * 4) + 3)][v78][v79] = v96;	// L89, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v97 = 0; v97 < 64; v97 += 1) {	// L96, [10219936,10420770), iterCycle=3138, II=3138
    for (int v98 = 0; v98 < 32; v98 += 1) {	// L97, [0,3138), iterCycle=98, II=98
      for (int v99 = 0; v99 < 32; v99 += 1) {	// L98, [0,98), iterCycle=3, II=3
        float v100 = v20[v97][v98][v99];	// L99, [0,2)
        v20[v97][v98][v99] = max(v100,v0);	// L100, [2,3)
      }
    }
  }
  for (int v101 = 0; v101 < 64; v101 += 1) {	// L104, [10420770,10490532), iterCycle=1090, II=1090
    for (int v102 = 0; v102 < 32; v102 += 1) {	// L105, [0,1090), iterCycle=34, II=34
      for (int v103 = 0; v103 < 32; v103 += 1) {	// L106, [0,34), iterCycle=1, II=1
        v30[v101][v102][v103] = v0;	// L107, [0,1)
      }
    }
  }
  for (int v104 = 0; v104 < 64; v104 += 1) {	// L111, [10490532,19927729), iterCycle=12, II=1
    for (int v105 = 0; v105 < 3; v105 += 1) {	// L112, [124885671,125033140), iterCycle=12, II=1
      for (int v106 = 0; v106 < 3; v106 += 1) {	// L113, [124885671,124934836), iterCycle=12, II=1
        for (int v107 = 0; v107 < 16; v107 += 1) {	// L114, [124885671,124902068), iterCycle=12, II=1
          for (int v108 = 0; v108 < 32; v108 += 1) {	// L115, [124885671,124886708), iterCycle=12, II=1
            for (int v109 = 0; v109 < 32; v109 += 1) {	// L116, [124885671,124885716), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v110 = v20[v104][(v108 + v105)][(v109 + v106)];	// L117, [0,2)
              float v111 = v2[(v107 * 4)][v104][v105][v106];	// L118, [0,2)
              float v112 = v110 * v111;	// L119, [2,6)
              float v113 = v30[(v107 * 4)][v108][v109];	// L120, [4,6)
              float v114 = v112 + v113;	// L121, [6,11)
              v30[(v107 * 4)][v108][v109] = v114;	// L122, [11,12)
              float v115 = v2[((v107 * 4) + 1)][v104][v105][v106];	// L123, [0,2)
              float v116 = v110 * v115;	// L124, [2,6)
              float v117 = v30[((v107 * 4) + 1)][v108][v109];	// L125, [4,6)
              float v118 = v116 + v117;	// L126, [6,11)
              v30[((v107 * 4) + 1)][v108][v109] = v118;	// L127, [11,12)
              float v119 = v2[((v107 * 4) + 2)][v104][v105][v106];	// L128, [0,2)
              float v120 = v110 * v119;	// L129, [2,6)
              float v121 = v30[((v107 * 4) + 2)][v108][v109];	// L130, [4,6)
              float v122 = v120 + v121;	// L131, [6,11)
              v30[((v107 * 4) + 2)][v108][v109] = v122;	// L132, [11,12)
              float v123 = v2[((v107 * 4) + 3)][v104][v105][v106];	// L133, [0,2)
              float v124 = v110 * v123;	// L134, [2,6)
              float v125 = v30[((v107 * 4) + 3)][v108][v109];	// L135, [4,6)
              float v126 = v124 + v125;	// L136, [6,11)
              v30[((v107 * 4) + 3)][v108][v109] = v126;	// L137, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v127 = 0; v127 < 64; v127 += 1) {	// L144, [19927729,20456243), iterCycle=8258, II=8258
    for (int v128 = 0; v128 < 32; v128 += 1) {	// L145, [0,8258), iterCycle=258, II=258
      for (int v129 = 0; v129 < 32; v129 += 1) {	// L146, [0,258), iterCycle=8, II=8
        float v130 = v30[v127][v128][v129];	// L147, [0,2)
        float v131 = v9[v127][v128][v129];	// L148, [0,2)
        float v132 = v130 + v131;	// L149, [2,7)
        v31[v127][v128][v129] = v132;	// L150, [7,8)
      }
    }
  }
  for (int v133 = 0; v133 < 64; v133 += 1) {	// L154, [20456243,20657077), iterCycle=3138, II=3138
    for (int v134 = 0; v134 < 32; v134 += 1) {	// L155, [0,3138), iterCycle=98, II=98
      for (int v135 = 0; v135 < 32; v135 += 1) {	// L156, [0,98), iterCycle=3, II=3
        float v136 = v31[v133][v134][v135];	// L157, [0,2)
        v31[v133][v134][v135] = max(v136,v0);	// L158, [2,3)
      }
    }
  }
  for (int v137 = 0; v137 < 64; v137 += 1) {	// L162, [20657077,20726839), iterCycle=1090, II=1090
    for (int v138 = 0; v138 < 32; v138 += 1) {	// L163, [0,1090), iterCycle=34, II=34
      for (int v139 = 0; v139 < 32; v139 += 1) {	// L164, [0,34), iterCycle=1, II=1
        v32[v137][v138][v139] = v0;	// L165, [0,1)
      }
    }
  }
  for (int v140 = 0; v140 < 64; v140 += 1) {	// L169, [20726839,30164036), iterCycle=12, II=1
    for (int v141 = 0; v141 < 3; v141 += 1) {	// L170, [114649364,114796833), iterCycle=12, II=1
      for (int v142 = 0; v142 < 3; v142 += 1) {	// L171, [114649364,114698529), iterCycle=12, II=1
        for (int v143 = 0; v143 < 16; v143 += 1) {	// L172, [114649364,114665761), iterCycle=12, II=1
          for (int v144 = 0; v144 < 32; v144 += 1) {	// L173, [114649364,114650401), iterCycle=12, II=1
            for (int v145 = 0; v145 < 32; v145 += 1) {	// L174, [114649364,114649409), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v146 = v31[v140][(v144 + v141)][(v145 + v142)];	// L175, [0,2)
              float v147 = v2[(v143 * 4)][v140][v141][v142];	// L176, [0,2)
              float v148 = v146 * v147;	// L177, [2,6)
              float v149 = v32[(v143 * 4)][v144][v145];	// L178, [4,6)
              float v150 = v148 + v149;	// L179, [6,11)
              v32[(v143 * 4)][v144][v145] = v150;	// L180, [11,12)
              float v151 = v2[((v143 * 4) + 1)][v140][v141][v142];	// L181, [0,2)
              float v152 = v146 * v151;	// L182, [2,6)
              float v153 = v32[((v143 * 4) + 1)][v144][v145];	// L183, [4,6)
              float v154 = v152 + v153;	// L184, [6,11)
              v32[((v143 * 4) + 1)][v144][v145] = v154;	// L185, [11,12)
              float v155 = v2[((v143 * 4) + 2)][v140][v141][v142];	// L186, [0,2)
              float v156 = v146 * v155;	// L187, [2,6)
              float v157 = v32[((v143 * 4) + 2)][v144][v145];	// L188, [4,6)
              float v158 = v156 + v157;	// L189, [6,11)
              v32[((v143 * 4) + 2)][v144][v145] = v158;	// L190, [11,12)
              float v159 = v2[((v143 * 4) + 3)][v140][v141][v142];	// L191, [0,2)
              float v160 = v146 * v159;	// L192, [2,6)
              float v161 = v32[((v143 * 4) + 3)][v144][v145];	// L193, [4,6)
              float v162 = v160 + v161;	// L194, [6,11)
              v32[((v143 * 4) + 3)][v144][v145] = v162;	// L195, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v163 = 0; v163 < 64; v163 += 1) {	// L202, [30164036,30364870), iterCycle=3138, II=3138
    for (int v164 = 0; v164 < 32; v164 += 1) {	// L203, [0,3138), iterCycle=98, II=98
      for (int v165 = 0; v165 < 32; v165 += 1) {	// L204, [0,98), iterCycle=3, II=3
        float v166 = v32[v163][v164][v165];	// L205, [0,2)
        v32[v163][v164][v165] = max(v166,v0);	// L206, [2,3)
      }
    }
  }
  for (int v167 = 0; v167 < 64; v167 += 1) {	// L210, [30364870,30434632), iterCycle=1090, II=1090
    for (int v168 = 0; v168 < 32; v168 += 1) {	// L211, [0,1090), iterCycle=34, II=34
      for (int v169 = 0; v169 < 32; v169 += 1) {	// L212, [0,34), iterCycle=1, II=1
        v33[v167][v168][v169] = v0;	// L213, [0,1)
      }
    }
  }
  for (int v170 = 0; v170 < 64; v170 += 1) {	// L217, [30434632,39871829), iterCycle=12, II=1
    for (int v171 = 0; v171 < 3; v171 += 1) {	// L218, [104941571,105089040), iterCycle=12, II=1
      for (int v172 = 0; v172 < 3; v172 += 1) {	// L219, [104941571,104990736), iterCycle=12, II=1
        for (int v173 = 0; v173 < 16; v173 += 1) {	// L220, [104941571,104957968), iterCycle=12, II=1
          for (int v174 = 0; v174 < 32; v174 += 1) {	// L221, [104941571,104942608), iterCycle=12, II=1
            for (int v175 = 0; v175 < 32; v175 += 1) {	// L222, [104941571,104941616), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v176 = v32[v170][(v174 + v171)][(v175 + v172)];	// L223, [0,2)
              float v177 = v2[(v173 * 4)][v170][v171][v172];	// L224, [0,2)
              float v178 = v176 * v177;	// L225, [2,6)
              float v179 = v33[(v173 * 4)][v174][v175];	// L226, [4,6)
              float v180 = v178 + v179;	// L227, [6,11)
              v33[(v173 * 4)][v174][v175] = v180;	// L228, [11,12)
              float v181 = v2[((v173 * 4) + 1)][v170][v171][v172];	// L229, [0,2)
              float v182 = v176 * v181;	// L230, [2,6)
              float v183 = v33[((v173 * 4) + 1)][v174][v175];	// L231, [4,6)
              float v184 = v182 + v183;	// L232, [6,11)
              v33[((v173 * 4) + 1)][v174][v175] = v184;	// L233, [11,12)
              float v185 = v2[((v173 * 4) + 2)][v170][v171][v172];	// L234, [0,2)
              float v186 = v176 * v185;	// L235, [2,6)
              float v187 = v33[((v173 * 4) + 2)][v174][v175];	// L236, [4,6)
              float v188 = v186 + v187;	// L237, [6,11)
              v33[((v173 * 4) + 2)][v174][v175] = v188;	// L238, [11,12)
              float v189 = v2[((v173 * 4) + 3)][v170][v171][v172];	// L239, [0,2)
              float v190 = v176 * v189;	// L240, [2,6)
              float v191 = v33[((v173 * 4) + 3)][v174][v175];	// L241, [4,6)
              float v192 = v190 + v191;	// L242, [6,11)
              v33[((v173 * 4) + 3)][v174][v175] = v192;	// L243, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v193 = 0; v193 < 64; v193 += 1) {	// L250, [39871829,40400343), iterCycle=8258, II=8258
    for (int v194 = 0; v194 < 32; v194 += 1) {	// L251, [0,8258), iterCycle=258, II=258
      for (int v195 = 0; v195 < 32; v195 += 1) {	// L252, [0,258), iterCycle=8, II=8
        float v196 = v33[v193][v194][v195];	// L253, [0,2)
        float v197 = v31[v193][v194][v195];	// L254, [0,2)
        float v198 = v196 + v197;	// L255, [2,7)
        v34[v193][v194][v195] = v198;	// L256, [7,8)
      }
    }
  }
  for (int v199 = 0; v199 < 64; v199 += 1) {	// L260, [40400343,40601177), iterCycle=3138, II=3138
    for (int v200 = 0; v200 < 32; v200 += 1) {	// L261, [0,3138), iterCycle=98, II=98
      for (int v201 = 0; v201 < 32; v201 += 1) {	// L262, [0,98), iterCycle=3, II=3
        float v202 = v34[v199][v200][v201];	// L263, [0,2)
        v34[v199][v200][v201] = max(v202,v0);	// L264, [2,3)
      }
    }
  }
  for (int v203 = 0; v203 < 128; v203 += 1) {	// L268, [40601177,40638299), iterCycle=290, II=290
    for (int v204 = 0; v204 < 16; v204 += 1) {	// L269, [0,290), iterCycle=18, II=18
      for (int v205 = 0; v205 < 16; v205 += 1) {	// L270, [0,18), iterCycle=1, II=1
        v35[v203][v204][v205] = v0;	// L271, [0,1)
      }
    }
  }
  for (int v206 = 0; v206 < 64; v206 += 1) {	// L275, [40638299,45356904), iterCycle=12, II=1
    for (int v207 = 0; v207 < 3; v207 += 1) {	// L276, [99456496,99530237), iterCycle=12, II=1
      for (int v208 = 0; v208 < 3; v208 += 1) {	// L277, [99456496,99481085), iterCycle=12, II=1
        for (int v209 = 0; v209 < 32; v209 += 1) {	// L278, [99456496,99464701), iterCycle=12, II=1
          for (int v210 = 0; v210 < 16; v210 += 1) {	// L279, [99456496,99456765), iterCycle=12, II=1
            for (int v211 = 0; v211 < 16; v211 += 1) {	// L280, [99456496,99456525), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v212 = v34[v206][((v210 * 2) + v207)][((v211 * 2) + v208)];	// L281, [0,2)
              float v213 = v3[(v209 * 4)][v206][v207][v208];	// L282, [0,2)
              float v214 = v212 * v213;	// L283, [2,6)
              float v215 = v35[(v209 * 4)][v210][v211];	// L284, [4,6)
              float v216 = v214 + v215;	// L285, [6,11)
              v35[(v209 * 4)][v210][v211] = v216;	// L286, [11,12)
              float v217 = v3[((v209 * 4) + 1)][v206][v207][v208];	// L287, [0,2)
              float v218 = v212 * v217;	// L288, [2,6)
              float v219 = v35[((v209 * 4) + 1)][v210][v211];	// L289, [4,6)
              float v220 = v218 + v219;	// L290, [6,11)
              v35[((v209 * 4) + 1)][v210][v211] = v220;	// L291, [11,12)
              float v221 = v3[((v209 * 4) + 2)][v206][v207][v208];	// L292, [0,2)
              float v222 = v212 * v221;	// L293, [2,6)
              float v223 = v35[((v209 * 4) + 2)][v210][v211];	// L294, [4,6)
              float v224 = v222 + v223;	// L295, [6,11)
              v35[((v209 * 4) + 2)][v210][v211] = v224;	// L296, [11,12)
              float v225 = v3[((v209 * 4) + 3)][v206][v207][v208];	// L297, [0,2)
              float v226 = v212 * v225;	// L298, [2,6)
              float v227 = v35[((v209 * 4) + 3)][v210][v211];	// L299, [4,6)
              float v228 = v226 + v227;	// L300, [6,11)
              v35[((v209 * 4) + 3)][v210][v211] = v228;	// L301, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v229 = 0; v229 < 128; v229 += 1) {	// L308, [45356904,45459562), iterCycle=802, II=802
    for (int v230 = 0; v230 < 16; v230 += 1) {	// L309, [0,802), iterCycle=50, II=50
      for (int v231 = 0; v231 < 16; v231 += 1) {	// L310, [0,50), iterCycle=3, II=3
        float v232 = v35[v229][v230][v231];	// L311, [0,2)
        v35[v229][v230][v231] = max(v232,v0);	// L312, [2,3)
      }
    }
  }
  for (int v233 = 0; v233 < 128; v233 += 1) {	// L316, [45459562,45496684), iterCycle=290, II=290
    for (int v234 = 0; v234 < 16; v234 += 1) {	// L317, [0,290), iterCycle=18, II=18
      for (int v235 = 0; v235 < 16; v235 += 1) {	// L318, [0,18), iterCycle=1, II=1
        v36[v233][v234][v235] = v0;	// L319, [0,1)
      }
    }
  }
  for (int v236 = 0; v236 < 128; v236 += 1) {	// L323, [45496684,54933881), iterCycle=12, II=1
    for (int v237 = 0; v237 < 3; v237 += 1) {	// L324, [89879519,89953260), iterCycle=12, II=1
      for (int v238 = 0; v238 < 3; v238 += 1) {	// L325, [89879519,89904108), iterCycle=12, II=1
        for (int v239 = 0; v239 < 32; v239 += 1) {	// L326, [89879519,89887724), iterCycle=12, II=1
          for (int v240 = 0; v240 < 16; v240 += 1) {	// L327, [89879519,89879788), iterCycle=12, II=1
            for (int v241 = 0; v241 < 16; v241 += 1) {	// L328, [89879519,89879548), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v242 = v35[v236][(v240 + v237)][(v241 + v238)];	// L329, [0,2)
              float v243 = v4[(v239 * 4)][v236][v237][v238];	// L330, [0,2)
              float v244 = v242 * v243;	// L331, [2,6)
              float v245 = v36[(v239 * 4)][v240][v241];	// L332, [4,6)
              float v246 = v244 + v245;	// L333, [6,11)
              v36[(v239 * 4)][v240][v241] = v246;	// L334, [11,12)
              float v247 = v4[((v239 * 4) + 1)][v236][v237][v238];	// L335, [0,2)
              float v248 = v242 * v247;	// L336, [2,6)
              float v249 = v36[((v239 * 4) + 1)][v240][v241];	// L337, [4,6)
              float v250 = v248 + v249;	// L338, [6,11)
              v36[((v239 * 4) + 1)][v240][v241] = v250;	// L339, [11,12)
              float v251 = v4[((v239 * 4) + 2)][v236][v237][v238];	// L340, [0,2)
              float v252 = v242 * v251;	// L341, [2,6)
              float v253 = v36[((v239 * 4) + 2)][v240][v241];	// L342, [4,6)
              float v254 = v252 + v253;	// L343, [6,11)
              v36[((v239 * 4) + 2)][v240][v241] = v254;	// L344, [11,12)
              float v255 = v4[((v239 * 4) + 3)][v236][v237][v238];	// L345, [0,2)
              float v256 = v242 * v255;	// L346, [2,6)
              float v257 = v36[((v239 * 4) + 3)][v240][v241];	// L347, [4,6)
              float v258 = v256 + v257;	// L348, [6,11)
              v36[((v239 * 4) + 3)][v240][v241] = v258;	// L349, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v259 = 0; v259 < 64; v259 += 1) {	// L356, [54933881,55982470), iterCycle=12, II=1
    for (int v260 = 0; v260 < 64; v260 += 1) {	// L357, [88830930,88847327), iterCycle=12, II=1
      for (int v261 = 0; v261 < 16; v261 += 1) {	// L358, [88830930,88831199), iterCycle=12, II=1
        for (int v262 = 0; v262 < 16; v262 += 1) {	// L359, [88830930,88830959), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          float v263 = v34[v259][(v261 * 2)][(v262 * 2)];	// L360, [0,2)
          float v264 = v38[(v260 * 2)][v259];	// L361, [0,2)
          float v265 = v263 * v264;	// L362, [2,6)
          float v266 = v10[(v260 * 2)][v261][v262];	// L363, [4,6)
          float v267 = v266 + v265;	// L364, [6,11)
          v10[(v260 * 2)][v261][v262] = v267;	// L365, [11,12)
          float v268 = v38[((v260 * 2) + 1)][v259];	// L366, [0,2)
          float v269 = v263 * v268;	// L367, [2,6)
          float v270 = v10[((v260 * 2) + 1)][v261][v262];	// L368, [4,6)
          float v271 = v270 + v269;	// L369, [6,11)
          v10[((v260 * 2) + 1)][v261][v262] = v271;	// L370, [11,12)
        }
      }
    }
  }
  for (int v272 = 0; v272 < 128; v272 += 1) {	// L375, [55982470,56248968), iterCycle=2082, II=2082
    for (int v273 = 0; v273 < 16; v273 += 1) {	// L376, [0,2082), iterCycle=130, II=130
      for (int v274 = 0; v274 < 16; v274 += 1) {	// L377, [0,130), iterCycle=8, II=8
        float v275 = v10[v272][v273][v274];	// L378, [0,2)
        float v276 = v36[v272][v273][v274];	// L379, [0,2)
        float v277 = v275 + v276;	// L380, [2,7)
        v11[v272][v273][v274] = v277;	// L381, [7,8)
      }
    }
  }
  for (int v278 = 0; v278 < 128; v278 += 1) {	// L385, [56248968,56351626), iterCycle=802, II=802
    for (int v279 = 0; v279 < 16; v279 += 1) {	// L386, [0,802), iterCycle=50, II=50
      for (int v280 = 0; v280 < 16; v280 += 1) {	// L387, [0,50), iterCycle=3, II=3
        float v281 = v11[v278][v279][v280];	// L388, [0,2)
        v11[v278][v279][v280] = max(v281,v0);	// L389, [2,3)
      }
    }
  }
  for (int v282 = 0; v282 < 128; v282 += 1) {	// L393, [56351626,56388748), iterCycle=290, II=290
    for (int v283 = 0; v283 < 16; v283 += 1) {	// L394, [0,290), iterCycle=18, II=18
      for (int v284 = 0; v284 < 16; v284 += 1) {	// L395, [0,18), iterCycle=1, II=1
        v12[v282][v283][v284] = v0;	// L396, [0,1)
      }
    }
  }
  for (int v285 = 0; v285 < 128; v285 += 1) {	// L400, [56388748,65825945), iterCycle=12, II=1
    for (int v286 = 0; v286 < 3; v286 += 1) {	// L401, [78987455,79061196), iterCycle=12, II=1
      for (int v287 = 0; v287 < 3; v287 += 1) {	// L402, [78987455,79012044), iterCycle=12, II=1
        for (int v288 = 0; v288 < 32; v288 += 1) {	// L403, [78987455,78995660), iterCycle=12, II=1
          for (int v289 = 0; v289 < 16; v289 += 1) {	// L404, [78987455,78987724), iterCycle=12, II=1
            for (int v290 = 0; v290 < 16; v290 += 1) {	// L405, [78987455,78987484), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v291 = v11[v285][(v289 + v286)][(v290 + v287)];	// L406, [0,2)
              float v292 = v4[(v288 * 4)][v285][v286][v287];	// L407, [0,2)
              float v293 = v291 * v292;	// L408, [2,6)
              float v294 = v12[(v288 * 4)][v289][v290];	// L409, [4,6)
              float v295 = v293 + v294;	// L410, [6,11)
              v12[(v288 * 4)][v289][v290] = v295;	// L411, [11,12)
              float v296 = v4[((v288 * 4) + 1)][v285][v286][v287];	// L412, [0,2)
              float v297 = v291 * v296;	// L413, [2,6)
              float v298 = v12[((v288 * 4) + 1)][v289][v290];	// L414, [4,6)
              float v299 = v297 + v298;	// L415, [6,11)
              v12[((v288 * 4) + 1)][v289][v290] = v299;	// L416, [11,12)
              float v300 = v4[((v288 * 4) + 2)][v285][v286][v287];	// L417, [0,2)
              float v301 = v291 * v300;	// L418, [2,6)
              float v302 = v12[((v288 * 4) + 2)][v289][v290];	// L419, [4,6)
              float v303 = v301 + v302;	// L420, [6,11)
              v12[((v288 * 4) + 2)][v289][v290] = v303;	// L421, [11,12)
              float v304 = v4[((v288 * 4) + 3)][v285][v286][v287];	// L422, [0,2)
              float v305 = v291 * v304;	// L423, [2,6)
              float v306 = v12[((v288 * 4) + 3)][v289][v290];	// L424, [4,6)
              float v307 = v305 + v306;	// L425, [6,11)
              v12[((v288 * 4) + 3)][v289][v290] = v307;	// L426, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v308 = 0; v308 < 128; v308 += 1) {	// L433, [65825945,65928603), iterCycle=802, II=802
    for (int v309 = 0; v309 < 16; v309 += 1) {	// L434, [0,802), iterCycle=50, II=50
      for (int v310 = 0; v310 < 16; v310 += 1) {	// L435, [0,50), iterCycle=3, II=3
        float v311 = v12[v308][v309][v310];	// L436, [0,2)
        v12[v308][v309][v310] = max(v311,v0);	// L437, [2,3)
      }
    }
  }
  for (int v312 = 0; v312 < 128; v312 += 1) {	// L441, [65928603,65965725), iterCycle=290, II=290
    for (int v313 = 0; v313 < 16; v313 += 1) {	// L442, [0,290), iterCycle=18, II=18
      for (int v314 = 0; v314 < 16; v314 += 1) {	// L443, [0,18), iterCycle=1, II=1
        v13[v312][v313][v314] = v0;	// L444, [0,1)
      }
    }
  }
  for (int v315 = 0; v315 < 128; v315 += 1) {	// L448, [65965725,75402922), iterCycle=12, II=1
    for (int v316 = 0; v316 < 3; v316 += 1) {	// L449, [69410478,69484219), iterCycle=12, II=1
      for (int v317 = 0; v317 < 3; v317 += 1) {	// L450, [69410478,69435067), iterCycle=12, II=1
        for (int v318 = 0; v318 < 32; v318 += 1) {	// L451, [69410478,69418683), iterCycle=12, II=1
          for (int v319 = 0; v319 < 16; v319 += 1) {	// L452, [69410478,69410747), iterCycle=12, II=1
            for (int v320 = 0; v320 < 16; v320 += 1) {	// L453, [69410478,69410507), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v321 = v12[v315][(v319 + v316)][(v320 + v317)];	// L454, [0,2)
              float v322 = v4[(v318 * 4)][v315][v316][v317];	// L455, [0,2)
              float v323 = v321 * v322;	// L456, [2,6)
              float v324 = v13[(v318 * 4)][v319][v320];	// L457, [4,6)
              float v325 = v323 + v324;	// L458, [6,11)
              v13[(v318 * 4)][v319][v320] = v325;	// L459, [11,12)
              float v326 = v4[((v318 * 4) + 1)][v315][v316][v317];	// L460, [0,2)
              float v327 = v321 * v326;	// L461, [2,6)
              float v328 = v13[((v318 * 4) + 1)][v319][v320];	// L462, [4,6)
              float v329 = v327 + v328;	// L463, [6,11)
              v13[((v318 * 4) + 1)][v319][v320] = v329;	// L464, [11,12)
              float v330 = v4[((v318 * 4) + 2)][v315][v316][v317];	// L465, [0,2)
              float v331 = v321 * v330;	// L466, [2,6)
              float v332 = v13[((v318 * 4) + 2)][v319][v320];	// L467, [4,6)
              float v333 = v331 + v332;	// L468, [6,11)
              v13[((v318 * 4) + 2)][v319][v320] = v333;	// L469, [11,12)
              float v334 = v4[((v318 * 4) + 3)][v315][v316][v317];	// L470, [0,2)
              float v335 = v321 * v334;	// L471, [2,6)
              float v336 = v13[((v318 * 4) + 3)][v319][v320];	// L472, [4,6)
              float v337 = v335 + v336;	// L473, [6,11)
              v13[((v318 * 4) + 3)][v319][v320] = v337;	// L474, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v338 = 0; v338 < 128; v338 += 1) {	// L481, [75402922,75669420), iterCycle=2082, II=2082
    for (int v339 = 0; v339 < 16; v339 += 1) {	// L482, [0,2082), iterCycle=130, II=130
      for (int v340 = 0; v340 < 16; v340 += 1) {	// L483, [0,130), iterCycle=8, II=8
        float v341 = v13[v338][v339][v340];	// L484, [0,2)
        float v342 = v11[v338][v339][v340];	// L485, [0,2)
        float v343 = v341 + v342;	// L486, [2,7)
        v14[v338][v339][v340] = v343;	// L487, [7,8)
      }
    }
  }
  for (int v344 = 0; v344 < 128; v344 += 1) {	// L491, [75669420,75772078), iterCycle=802, II=802
    for (int v345 = 0; v345 < 16; v345 += 1) {	// L492, [0,802), iterCycle=50, II=50
      for (int v346 = 0; v346 < 16; v346 += 1) {	// L493, [0,50), iterCycle=3, II=3
        float v347 = v14[v344][v345][v346];	// L494, [0,2)
        v14[v344][v345][v346] = max(v347,v0);	// L495, [2,3)
      }
    }
  }
  for (int v348 = 0; v348 < 256; v348 += 1) {	// L499, [75772078,75793072), iterCycle=82, II=82
    for (int v349 = 0; v349 < 8; v349 += 1) {	// L500, [0,82), iterCycle=10, II=10
      for (int v350 = 0; v350 < 8; v350 += 1) {	// L501, [0,10), iterCycle=1, II=1
        v15[v348][v349][v350] = v0;	// L502, [0,1)
      }
    }
  }
  for (int v351 = 0; v351 < 128; v351 += 1) {	// L506, [75793072,80511677), iterCycle=12, II=1
    for (int v352 = 0; v352 < 3; v352 += 1) {	// L507, [64301723,64338600), iterCycle=12, II=1
      for (int v353 = 0; v353 < 3; v353 += 1) {	// L508, [64301723,64314024), iterCycle=12, II=1
        for (int v354 = 0; v354 < 64; v354 += 1) {	// L509, [64301723,64305832), iterCycle=12, II=1
          for (int v355 = 0; v355 < 8; v355 += 1) {	// L510, [64301723,64301800), iterCycle=12, II=1
            for (int v356 = 0; v356 < 8; v356 += 1) {	// L511, [64301723,64301744), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v357 = v14[v351][((v355 * 2) + v352)][((v356 * 2) + v353)];	// L512, [0,2)
              float v358 = v5[(v354 * 4)][v351][v352][v353];	// L513, [0,2)
              float v359 = v357 * v358;	// L514, [2,6)
              float v360 = v15[(v354 * 4)][v355][v356];	// L515, [4,6)
              float v361 = v359 + v360;	// L516, [6,11)
              v15[(v354 * 4)][v355][v356] = v361;	// L517, [11,12)
              float v362 = v5[((v354 * 4) + 1)][v351][v352][v353];	// L518, [0,2)
              float v363 = v357 * v362;	// L519, [2,6)
              float v364 = v15[((v354 * 4) + 1)][v355][v356];	// L520, [4,6)
              float v365 = v363 + v364;	// L521, [6,11)
              v15[((v354 * 4) + 1)][v355][v356] = v365;	// L522, [11,12)
              float v366 = v5[((v354 * 4) + 2)][v351][v352][v353];	// L523, [0,2)
              float v367 = v357 * v366;	// L524, [2,6)
              float v368 = v15[((v354 * 4) + 2)][v355][v356];	// L525, [4,6)
              float v369 = v367 + v368;	// L526, [6,11)
              v15[((v354 * 4) + 2)][v355][v356] = v369;	// L527, [11,12)
              float v370 = v5[((v354 * 4) + 3)][v351][v352][v353];	// L528, [0,2)
              float v371 = v357 * v370;	// L529, [2,6)
              float v372 = v15[((v354 * 4) + 3)][v355][v356];	// L530, [4,6)
              float v373 = v371 + v372;	// L531, [6,11)
              v15[((v354 * 4) + 3)][v355][v356] = v373;	// L532, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v374 = 0; v374 < 256; v374 += 1) {	// L539, [80511677,80565439), iterCycle=210, II=210
    for (int v375 = 0; v375 < 8; v375 += 1) {	// L540, [0,210), iterCycle=26, II=26
      for (int v376 = 0; v376 < 8; v376 += 1) {	// L541, [0,26), iterCycle=3, II=3
        float v377 = v15[v374][v375][v376];	// L542, [0,2)
        v15[v374][v375][v376] = max(v377,v0);	// L543, [2,3)
      }
    }
  }
  for (int v378 = 0; v378 < 256; v378 += 1) {	// L547, [80565439,80586433), iterCycle=82, II=82
    for (int v379 = 0; v379 < 8; v379 += 1) {	// L548, [0,82), iterCycle=10, II=10
      for (int v380 = 0; v380 < 8; v380 += 1) {	// L549, [0,10), iterCycle=1, II=1
        v16[v378][v379][v380] = v0;	// L550, [0,1)
      }
    }
  }
  for (int v381 = 0; v381 < 256; v381 += 1) {	// L554, [80586433,90023630), iterCycle=12, II=1
    for (int v382 = 0; v382 < 3; v382 += 1) {	// L555, [54789770,54826647), iterCycle=12, II=1
      for (int v383 = 0; v383 < 3; v383 += 1) {	// L556, [54789770,54802071), iterCycle=12, II=1
        for (int v384 = 0; v384 < 64; v384 += 1) {	// L557, [54789770,54793879), iterCycle=12, II=1
          for (int v385 = 0; v385 < 8; v385 += 1) {	// L558, [54789770,54789847), iterCycle=12, II=1
            for (int v386 = 0; v386 < 8; v386 += 1) {	// L559, [54789770,54789791), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v387 = v15[v381][(v385 + v382)][(v386 + v383)];	// L560, [0,2)
              float v388 = v6[(v384 * 4)][v381][v382][v383];	// L561, [0,2)
              float v389 = v387 * v388;	// L562, [2,6)
              float v390 = v16[(v384 * 4)][v385][v386];	// L563, [4,6)
              float v391 = v389 + v390;	// L564, [6,11)
              v16[(v384 * 4)][v385][v386] = v391;	// L565, [11,12)
              float v392 = v6[((v384 * 4) + 1)][v381][v382][v383];	// L566, [0,2)
              float v393 = v387 * v392;	// L567, [2,6)
              float v394 = v16[((v384 * 4) + 1)][v385][v386];	// L568, [4,6)
              float v395 = v393 + v394;	// L569, [6,11)
              v16[((v384 * 4) + 1)][v385][v386] = v395;	// L570, [11,12)
              float v396 = v6[((v384 * 4) + 2)][v381][v382][v383];	// L571, [0,2)
              float v397 = v387 * v396;	// L572, [2,6)
              float v398 = v16[((v384 * 4) + 2)][v385][v386];	// L573, [4,6)
              float v399 = v397 + v398;	// L574, [6,11)
              v16[((v384 * 4) + 2)][v385][v386] = v399;	// L575, [11,12)
              float v400 = v6[((v384 * 4) + 3)][v381][v382][v383];	// L576, [0,2)
              float v401 = v387 * v400;	// L577, [2,6)
              float v402 = v16[((v384 * 4) + 3)][v385][v386];	// L578, [4,6)
              float v403 = v401 + v402;	// L579, [6,11)
              v16[((v384 * 4) + 3)][v385][v386] = v403;	// L580, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v404 = 0; v404 < 128; v404 += 1) {	// L587, [90023630,91072219), iterCycle=12, II=1
    for (int v405 = 0; v405 < 128; v405 += 1) {	// L588, [53741181,53749386), iterCycle=12, II=1
      for (int v406 = 0; v406 < 8; v406 += 1) {	// L589, [53741181,53741258), iterCycle=12, II=1
        for (int v407 = 0; v407 < 8; v407 += 1) {	// L590, [53741181,53741202), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          float v408 = v14[v404][(v406 * 2)][(v407 * 2)];	// L591, [0,2)
          float v409 = v39[(v405 * 2)][v404];	// L592, [0,2)
          float v410 = v408 * v409;	// L593, [2,6)
          float v411 = v17[(v405 * 2)][v406][v407];	// L594, [4,6)
          float v412 = v411 + v410;	// L595, [6,11)
          v17[(v405 * 2)][v406][v407] = v412;	// L596, [11,12)
          float v413 = v39[((v405 * 2) + 1)][v404];	// L597, [0,2)
          float v414 = v408 * v413;	// L598, [2,6)
          float v415 = v17[((v405 * 2) + 1)][v406][v407];	// L599, [4,6)
          float v416 = v415 + v414;	// L600, [6,11)
          v17[((v405 * 2) + 1)][v406][v407] = v416;	// L601, [11,12)
        }
      }
    }
  }
  for (int v417 = 0; v417 < 256; v417 += 1) {	// L606, [91072219,91207901), iterCycle=530, II=530
    for (int v418 = 0; v418 < 8; v418 += 1) {	// L607, [0,530), iterCycle=66, II=66
      for (int v419 = 0; v419 < 8; v419 += 1) {	// L608, [0,66), iterCycle=8, II=8
        float v420 = v17[v417][v418][v419];	// L609, [0,2)
        float v421 = v16[v417][v418][v419];	// L610, [0,2)
        float v422 = v420 + v421;	// L611, [2,7)
        v18[v417][v418][v419] = v422;	// L612, [7,8)
      }
    }
  }
  for (int v423 = 0; v423 < 256; v423 += 1) {	// L616, [91207901,91261663), iterCycle=210, II=210
    for (int v424 = 0; v424 < 8; v424 += 1) {	// L617, [0,210), iterCycle=26, II=26
      for (int v425 = 0; v425 < 8; v425 += 1) {	// L618, [0,26), iterCycle=3, II=3
        float v426 = v18[v423][v424][v425];	// L619, [0,2)
        v18[v423][v424][v425] = max(v426,v0);	// L620, [2,3)
      }
    }
  }
  for (int v427 = 0; v427 < 256; v427 += 1) {	// L624, [91261663,91282657), iterCycle=82, II=82
    for (int v428 = 0; v428 < 8; v428 += 1) {	// L625, [0,82), iterCycle=10, II=10
      for (int v429 = 0; v429 < 8; v429 += 1) {	// L626, [0,10), iterCycle=1, II=1
        v19[v427][v428][v429] = v0;	// L627, [0,1)
      }
    }
  }
  for (int v430 = 0; v430 < 256; v430 += 1) {	// L631, [91282657,100719854), iterCycle=12, II=1
    for (int v431 = 0; v431 < 3; v431 += 1) {	// L632, [44093546,44130423), iterCycle=12, II=1
      for (int v432 = 0; v432 < 3; v432 += 1) {	// L633, [44093546,44105847), iterCycle=12, II=1
        for (int v433 = 0; v433 < 64; v433 += 1) {	// L634, [44093546,44097655), iterCycle=12, II=1
          for (int v434 = 0; v434 < 8; v434 += 1) {	// L635, [44093546,44093623), iterCycle=12, II=1
            for (int v435 = 0; v435 < 8; v435 += 1) {	// L636, [44093546,44093567), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v436 = v18[v430][(v434 + v431)][(v435 + v432)];	// L637, [0,2)
              float v437 = v6[(v433 * 4)][v430][v431][v432];	// L638, [0,2)
              float v438 = v436 * v437;	// L639, [2,6)
              float v439 = v19[(v433 * 4)][v434][v435];	// L640, [4,6)
              float v440 = v438 + v439;	// L641, [6,11)
              v19[(v433 * 4)][v434][v435] = v440;	// L642, [11,12)
              float v441 = v6[((v433 * 4) + 1)][v430][v431][v432];	// L643, [0,2)
              float v442 = v436 * v441;	// L644, [2,6)
              float v443 = v19[((v433 * 4) + 1)][v434][v435];	// L645, [4,6)
              float v444 = v442 + v443;	// L646, [6,11)
              v19[((v433 * 4) + 1)][v434][v435] = v444;	// L647, [11,12)
              float v445 = v6[((v433 * 4) + 2)][v430][v431][v432];	// L648, [0,2)
              float v446 = v436 * v445;	// L649, [2,6)
              float v447 = v19[((v433 * 4) + 2)][v434][v435];	// L650, [4,6)
              float v448 = v446 + v447;	// L651, [6,11)
              v19[((v433 * 4) + 2)][v434][v435] = v448;	// L652, [11,12)
              float v449 = v6[((v433 * 4) + 3)][v430][v431][v432];	// L653, [0,2)
              float v450 = v436 * v449;	// L654, [2,6)
              float v451 = v19[((v433 * 4) + 3)][v434][v435];	// L655, [4,6)
              float v452 = v450 + v451;	// L656, [6,11)
              v19[((v433 * 4) + 3)][v434][v435] = v452;	// L657, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v453 = 0; v453 < 256; v453 += 1) {	// L664, [100719854,100773616), iterCycle=210, II=210
    for (int v454 = 0; v454 < 8; v454 += 1) {	// L665, [0,210), iterCycle=26, II=26
      for (int v455 = 0; v455 < 8; v455 += 1) {	// L666, [0,26), iterCycle=3, II=3
        float v456 = v19[v453][v454][v455];	// L667, [0,2)
        v19[v453][v454][v455] = max(v456,v0);	// L668, [2,3)
      }
    }
  }
  for (int v457 = 0; v457 < 256; v457 += 1) {	// L672, [100773616,100794610), iterCycle=82, II=82
    for (int v458 = 0; v458 < 8; v458 += 1) {	// L673, [0,82), iterCycle=10, II=10
      for (int v459 = 0; v459 < 8; v459 += 1) {	// L674, [0,10), iterCycle=1, II=1
        v21[v457][v458][v459] = v0;	// L675, [0,1)
      }
    }
  }
  for (int v460 = 0; v460 < 256; v460 += 1) {	// L679, [100794610,110231807), iterCycle=12, II=1
    for (int v461 = 0; v461 < 3; v461 += 1) {	// L680, [34581593,34618470), iterCycle=12, II=1
      for (int v462 = 0; v462 < 3; v462 += 1) {	// L681, [34581593,34593894), iterCycle=12, II=1
        for (int v463 = 0; v463 < 64; v463 += 1) {	// L682, [34581593,34585702), iterCycle=12, II=1
          for (int v464 = 0; v464 < 8; v464 += 1) {	// L683, [34581593,34581670), iterCycle=12, II=1
            for (int v465 = 0; v465 < 8; v465 += 1) {	// L684, [34581593,34581614), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v466 = v19[v460][(v464 + v461)][(v465 + v462)];	// L685, [0,2)
              float v467 = v6[(v463 * 4)][v460][v461][v462];	// L686, [0,2)
              float v468 = v466 * v467;	// L687, [2,6)
              float v469 = v21[(v463 * 4)][v464][v465];	// L688, [4,6)
              float v470 = v468 + v469;	// L689, [6,11)
              v21[(v463 * 4)][v464][v465] = v470;	// L690, [11,12)
              float v471 = v6[((v463 * 4) + 1)][v460][v461][v462];	// L691, [0,2)
              float v472 = v466 * v471;	// L692, [2,6)
              float v473 = v21[((v463 * 4) + 1)][v464][v465];	// L693, [4,6)
              float v474 = v472 + v473;	// L694, [6,11)
              v21[((v463 * 4) + 1)][v464][v465] = v474;	// L695, [11,12)
              float v475 = v6[((v463 * 4) + 2)][v460][v461][v462];	// L696, [0,2)
              float v476 = v466 * v475;	// L697, [2,6)
              float v477 = v21[((v463 * 4) + 2)][v464][v465];	// L698, [4,6)
              float v478 = v476 + v477;	// L699, [6,11)
              v21[((v463 * 4) + 2)][v464][v465] = v478;	// L700, [11,12)
              float v479 = v6[((v463 * 4) + 3)][v460][v461][v462];	// L701, [0,2)
              float v480 = v466 * v479;	// L702, [2,6)
              float v481 = v21[((v463 * 4) + 3)][v464][v465];	// L703, [4,6)
              float v482 = v480 + v481;	// L704, [6,11)
              v21[((v463 * 4) + 3)][v464][v465] = v482;	// L705, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v483 = 0; v483 < 256; v483 += 1) {	// L712, [110231807,110367489), iterCycle=530, II=530
    for (int v484 = 0; v484 < 8; v484 += 1) {	// L713, [0,530), iterCycle=66, II=66
      for (int v485 = 0; v485 < 8; v485 += 1) {	// L714, [0,66), iterCycle=8, II=8
        float v486 = v21[v483][v484][v485];	// L715, [0,2)
        float v487 = v18[v483][v484][v485];	// L716, [0,2)
        float v488 = v486 + v487;	// L717, [2,7)
        v22[v483][v484][v485] = v488;	// L718, [7,8)
      }
    }
  }
  for (int v489 = 0; v489 < 256; v489 += 1) {	// L722, [110367489,110421251), iterCycle=210, II=210
    for (int v490 = 0; v490 < 8; v490 += 1) {	// L723, [0,210), iterCycle=26, II=26
      for (int v491 = 0; v491 < 8; v491 += 1) {	// L724, [0,26), iterCycle=3, II=3
        float v492 = v22[v489][v490][v491];	// L725, [0,2)
        v22[v489][v490][v491] = max(v492,v0);	// L726, [2,3)
      }
    }
  }
  for (int v493 = 0; v493 < 512; v493 += 1) {	// L730, [110421251,110434565), iterCycle=26, II=26
    for (int v494 = 0; v494 < 4; v494 += 1) {	// L731, [0,26), iterCycle=6, II=6
      for (int v495 = 0; v495 < 4; v495 += 1) {	// L732, [0,6), iterCycle=1, II=1
        v23[v493][v494][v495] = v0;	// L733, [0,1)
      }
    }
  }
  for (int v496 = 0; v496 < 256; v496 += 1) {	// L737, [110434565,115153170), iterCycle=12, II=1
    for (int v497 = 0; v497 < 3; v497 += 1) {	// L738, [29660230,29678675), iterCycle=12, II=1
      for (int v498 = 0; v498 < 3; v498 += 1) {	// L739, [29660230,29666387), iterCycle=12, II=1
        for (int v499 = 0; v499 < 128; v499 += 1) {	// L740, [29660230,29662291), iterCycle=12, II=1
          for (int v500 = 0; v500 < 4; v500 += 1) {	// L741, [29660230,29660259), iterCycle=12, II=1
            for (int v501 = 0; v501 < 4; v501 += 1) {	// L742, [29660230,29660247), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v502 = v22[v496][((v500 * 2) + v497)][((v501 * 2) + v498)];	// L743, [0,2)
              float v503 = v7[(v499 * 4)][v496][v497][v498];	// L744, [0,2)
              float v504 = v502 * v503;	// L745, [2,6)
              float v505 = v23[(v499 * 4)][v500][v501];	// L746, [4,6)
              float v506 = v504 + v505;	// L747, [6,11)
              v23[(v499 * 4)][v500][v501] = v506;	// L748, [11,12)
              float v507 = v7[((v499 * 4) + 1)][v496][v497][v498];	// L749, [0,2)
              float v508 = v502 * v507;	// L750, [2,6)
              float v509 = v23[((v499 * 4) + 1)][v500][v501];	// L751, [4,6)
              float v510 = v508 + v509;	// L752, [6,11)
              v23[((v499 * 4) + 1)][v500][v501] = v510;	// L753, [11,12)
              float v511 = v7[((v499 * 4) + 2)][v496][v497][v498];	// L754, [0,2)
              float v512 = v502 * v511;	// L755, [2,6)
              float v513 = v23[((v499 * 4) + 2)][v500][v501];	// L756, [4,6)
              float v514 = v512 + v513;	// L757, [6,11)
              v23[((v499 * 4) + 2)][v500][v501] = v514;	// L758, [11,12)
              float v515 = v7[((v499 * 4) + 3)][v496][v497][v498];	// L759, [0,2)
              float v516 = v502 * v515;	// L760, [2,6)
              float v517 = v23[((v499 * 4) + 3)][v500][v501];	// L761, [4,6)
              float v518 = v516 + v517;	// L762, [6,11)
              v23[((v499 * 4) + 3)][v500][v501] = v518;	// L763, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v519 = 0; v519 < 512; v519 += 1) {	// L770, [115153170,115182868), iterCycle=58, II=58
    for (int v520 = 0; v520 < 4; v520 += 1) {	// L771, [0,58), iterCycle=14, II=14
      for (int v521 = 0; v521 < 4; v521 += 1) {	// L772, [0,14), iterCycle=3, II=3
        float v522 = v23[v519][v520][v521];	// L773, [0,2)
        v23[v519][v520][v521] = max(v522,v0);	// L774, [2,3)
      }
    }
  }
  for (int v523 = 0; v523 < 512; v523 += 1) {	// L778, [115182868,115196182), iterCycle=26, II=26
    for (int v524 = 0; v524 < 4; v524 += 1) {	// L779, [0,26), iterCycle=6, II=6
      for (int v525 = 0; v525 < 4; v525 += 1) {	// L780, [0,6), iterCycle=1, II=1
        v24[v523][v524][v525] = v0;	// L781, [0,1)
      }
    }
  }
  for (int v526 = 0; v526 < 512; v526 += 1) {	// L785, [115196182,124633379), iterCycle=12, II=1
    for (int v527 = 0; v527 < 3; v527 += 1) {	// L786, [20180021,20198466), iterCycle=12, II=1
      for (int v528 = 0; v528 < 3; v528 += 1) {	// L787, [20180021,20186178), iterCycle=12, II=1
        for (int v529 = 0; v529 < 128; v529 += 1) {	// L788, [20180021,20182082), iterCycle=12, II=1
          for (int v530 = 0; v530 < 4; v530 += 1) {	// L789, [20180021,20180050), iterCycle=12, II=1
            for (int v531 = 0; v531 < 4; v531 += 1) {	// L790, [20180021,20180038), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v532 = v23[v526][(v530 + v527)][(v531 + v528)];	// L791, [0,2)
              float v533 = v8[(v529 * 4)][v526][v527][v528];	// L792, [0,2)
              float v534 = v532 * v533;	// L793, [2,6)
              float v535 = v24[(v529 * 4)][v530][v531];	// L794, [4,6)
              float v536 = v534 + v535;	// L795, [6,11)
              v24[(v529 * 4)][v530][v531] = v536;	// L796, [11,12)
              float v537 = v8[((v529 * 4) + 1)][v526][v527][v528];	// L797, [0,2)
              float v538 = v532 * v537;	// L798, [2,6)
              float v539 = v24[((v529 * 4) + 1)][v530][v531];	// L799, [4,6)
              float v540 = v538 + v539;	// L800, [6,11)
              v24[((v529 * 4) + 1)][v530][v531] = v540;	// L801, [11,12)
              float v541 = v8[((v529 * 4) + 2)][v526][v527][v528];	// L802, [0,2)
              float v542 = v532 * v541;	// L803, [2,6)
              float v543 = v24[((v529 * 4) + 2)][v530][v531];	// L804, [4,6)
              float v544 = v542 + v543;	// L805, [6,11)
              v24[((v529 * 4) + 2)][v530][v531] = v544;	// L806, [11,12)
              float v545 = v8[((v529 * 4) + 3)][v526][v527][v528];	// L807, [0,2)
              float v546 = v532 * v545;	// L808, [2,6)
              float v547 = v24[((v529 * 4) + 3)][v530][v531];	// L809, [4,6)
              float v548 = v546 + v547;	// L810, [6,11)
              v24[((v529 * 4) + 3)][v530][v531] = v548;	// L811, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v549 = 0; v549 < 256; v549 += 1) {	// L818, [124633379,125681968), iterCycle=12, II=1
    for (int v550 = 0; v550 < 256; v550 += 1) {	// L819, [19131432,19135541), iterCycle=12, II=1
      for (int v551 = 0; v551 < 4; v551 += 1) {	// L820, [19131432,19131461), iterCycle=12, II=1
        for (int v552 = 0; v552 < 4; v552 += 1) {	// L821, [19131432,19131449), iterCycle=12, II=1
          #pragma HLS pipeline II=1
          float v553 = v22[v549][(v551 * 2)][(v552 * 2)];	// L822, [0,2)
          float v554 = v40[(v550 * 2)][v549];	// L823, [0,2)
          float v555 = v553 * v554;	// L824, [2,6)
          float v556 = v25[(v550 * 2)][v551][v552];	// L825, [4,6)
          float v557 = v556 + v555;	// L826, [6,11)
          v25[(v550 * 2)][v551][v552] = v557;	// L827, [11,12)
          float v558 = v40[((v550 * 2) + 1)][v549];	// L828, [0,2)
          float v559 = v553 * v558;	// L829, [2,6)
          float v560 = v25[((v550 * 2) + 1)][v551][v552];	// L830, [4,6)
          float v561 = v560 + v559;	// L831, [6,11)
          v25[((v550 * 2) + 1)][v551][v552] = v561;	// L832, [11,12)
        }
      }
    }
  }
  for (int v562 = 0; v562 < 512; v562 += 1) {	// L837, [125681968,125752626), iterCycle=138, II=138
    for (int v563 = 0; v563 < 4; v563 += 1) {	// L838, [0,138), iterCycle=34, II=34
      for (int v564 = 0; v564 < 4; v564 += 1) {	// L839, [0,34), iterCycle=8, II=8
        float v565 = v25[v562][v563][v564];	// L840, [0,2)
        float v566 = v24[v562][v563][v564];	// L841, [0,2)
        float v567 = v565 + v566;	// L842, [2,7)
        v26[v562][v563][v564] = v567;	// L843, [7,8)
      }
    }
  }
  for (int v568 = 0; v568 < 512; v568 += 1) {	// L847, [125752626,125782324), iterCycle=58, II=58
    for (int v569 = 0; v569 < 4; v569 += 1) {	// L848, [0,58), iterCycle=14, II=14
      for (int v570 = 0; v570 < 4; v570 += 1) {	// L849, [0,14), iterCycle=3, II=3
        float v571 = v26[v568][v569][v570];	// L850, [0,2)
        v26[v568][v569][v570] = max(v571,v0);	// L851, [2,3)
      }
    }
  }
  for (int v572 = 0; v572 < 512; v572 += 1) {	// L855, [125782324,125795638), iterCycle=26, II=26
    for (int v573 = 0; v573 < 4; v573 += 1) {	// L856, [0,26), iterCycle=6, II=6
      for (int v574 = 0; v574 < 4; v574 += 1) {	// L857, [0,6), iterCycle=1, II=1
        v27[v572][v573][v574] = v0;	// L858, [0,1)
      }
    }
  }
  for (int v575 = 0; v575 < 512; v575 += 1) {	// L862, [125795638,135232835), iterCycle=12, II=1
    for (int v576 = 0; v576 < 3; v576 += 1) {	// L863, [9580565,9599010), iterCycle=12, II=1
      for (int v577 = 0; v577 < 3; v577 += 1) {	// L864, [9580565,9586722), iterCycle=12, II=1
        for (int v578 = 0; v578 < 128; v578 += 1) {	// L865, [9580565,9582626), iterCycle=12, II=1
          for (int v579 = 0; v579 < 4; v579 += 1) {	// L866, [9580565,9580594), iterCycle=12, II=1
            for (int v580 = 0; v580 < 4; v580 += 1) {	// L867, [9580565,9580582), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v581 = v26[v575][(v579 + v576)][(v580 + v577)];	// L868, [0,2)
              float v582 = v8[(v578 * 4)][v575][v576][v577];	// L869, [0,2)
              float v583 = v581 * v582;	// L870, [2,6)
              float v584 = v27[(v578 * 4)][v579][v580];	// L871, [4,6)
              float v585 = v583 + v584;	// L872, [6,11)
              v27[(v578 * 4)][v579][v580] = v585;	// L873, [11,12)
              float v586 = v8[((v578 * 4) + 1)][v575][v576][v577];	// L874, [0,2)
              float v587 = v581 * v586;	// L875, [2,6)
              float v588 = v27[((v578 * 4) + 1)][v579][v580];	// L876, [4,6)
              float v589 = v587 + v588;	// L877, [6,11)
              v27[((v578 * 4) + 1)][v579][v580] = v589;	// L878, [11,12)
              float v590 = v8[((v578 * 4) + 2)][v575][v576][v577];	// L879, [0,2)
              float v591 = v581 * v590;	// L880, [2,6)
              float v592 = v27[((v578 * 4) + 2)][v579][v580];	// L881, [4,6)
              float v593 = v591 + v592;	// L882, [6,11)
              v27[((v578 * 4) + 2)][v579][v580] = v593;	// L883, [11,12)
              float v594 = v8[((v578 * 4) + 3)][v575][v576][v577];	// L884, [0,2)
              float v595 = v581 * v594;	// L885, [2,6)
              float v596 = v27[((v578 * 4) + 3)][v579][v580];	// L886, [4,6)
              float v597 = v595 + v596;	// L887, [6,11)
              v27[((v578 * 4) + 3)][v579][v580] = v597;	// L888, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v598 = 0; v598 < 512; v598 += 1) {	// L895, [135232835,135262533), iterCycle=58, II=58
    for (int v599 = 0; v599 < 4; v599 += 1) {	// L896, [0,58), iterCycle=14, II=14
      for (int v600 = 0; v600 < 4; v600 += 1) {	// L897, [0,14), iterCycle=3, II=3
        float v601 = v27[v598][v599][v600];	// L898, [0,2)
        v27[v598][v599][v600] = max(v601,v0);	// L899, [2,3)
      }
    }
  }
  for (int v602 = 0; v602 < 512; v602 += 1) {	// L903, [135262533,135275847), iterCycle=26, II=26
    for (int v603 = 0; v603 < 4; v603 += 1) {	// L904, [0,26), iterCycle=6, II=6
      for (int v604 = 0; v604 < 4; v604 += 1) {	// L905, [0,6), iterCycle=1, II=1
        v28[v602][v603][v604] = v0;	// L906, [0,1)
      }
    }
  }
  for (int v605 = 0; v605 < 512; v605 += 1) {	// L910, [135275847,144713044), iterCycle=12, II=1
    for (int v606 = 0; v606 < 3; v606 += 1) {	// L911, [100356,118801), iterCycle=12, II=1
      for (int v607 = 0; v607 < 3; v607 += 1) {	// L912, [100356,106513), iterCycle=12, II=1
        for (int v608 = 0; v608 < 128; v608 += 1) {	// L913, [100356,102417), iterCycle=12, II=1
          for (int v609 = 0; v609 < 4; v609 += 1) {	// L914, [100356,100385), iterCycle=12, II=1
            for (int v610 = 0; v610 < 4; v610 += 1) {	// L915, [100356,100373), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v611 = v27[v605][(v609 + v606)][(v610 + v607)];	// L916, [0,2)
              float v612 = v8[(v608 * 4)][v605][v606][v607];	// L917, [0,2)
              float v613 = v611 * v612;	// L918, [2,6)
              float v614 = v28[(v608 * 4)][v609][v610];	// L919, [4,6)
              float v615 = v613 + v614;	// L920, [6,11)
              v28[(v608 * 4)][v609][v610] = v615;	// L921, [11,12)
              float v616 = v8[((v608 * 4) + 1)][v605][v606][v607];	// L922, [0,2)
              float v617 = v611 * v616;	// L923, [2,6)
              float v618 = v28[((v608 * 4) + 1)][v609][v610];	// L924, [4,6)
              float v619 = v617 + v618;	// L925, [6,11)
              v28[((v608 * 4) + 1)][v609][v610] = v619;	// L926, [11,12)
              float v620 = v8[((v608 * 4) + 2)][v605][v606][v607];	// L927, [0,2)
              float v621 = v611 * v620;	// L928, [2,6)
              float v622 = v28[((v608 * 4) + 2)][v609][v610];	// L929, [4,6)
              float v623 = v621 + v622;	// L930, [6,11)
              v28[((v608 * 4) + 2)][v609][v610] = v623;	// L931, [11,12)
              float v624 = v8[((v608 * 4) + 3)][v605][v606][v607];	// L932, [0,2)
              float v625 = v611 * v624;	// L933, [2,6)
              float v626 = v28[((v608 * 4) + 3)][v609][v610];	// L934, [4,6)
              float v627 = v625 + v626;	// L935, [6,11)
              v28[((v608 * 4) + 3)][v609][v610] = v627;	// L936, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v628 = 0; v628 < 512; v628 += 1) {	// L943, [144713044,144783702), iterCycle=138, II=138
    for (int v629 = 0; v629 < 4; v629 += 1) {	// L944, [0,138), iterCycle=34, II=34
      for (int v630 = 0; v630 < 4; v630 += 1) {	// L945, [0,34), iterCycle=8, II=8
        float v631 = v28[v628][v629][v630];	// L946, [0,2)
        float v632 = v26[v628][v629][v630];	// L947, [0,2)
        float v633 = v631 + v632;	// L948, [2,7)
        v29[v628][v629][v630] = v633;	// L949, [7,8)
      }
    }
  }
  for (int v634 = 0; v634 < 512; v634 += 1) {	// L953, [144783702,144813400), iterCycle=58, II=58
    for (int v635 = 0; v635 < 4; v635 += 1) {	// L954, [0,58), iterCycle=14, II=14
      for (int v636 = 0; v636 < 4; v636 += 1) {	// L955, [0,14), iterCycle=3, II=3
        float v637 = v29[v634][v635][v636];	// L956, [0,2)
        v29[v634][v635][v636] = max(v637,v0);	// L957, [2,3)
      }
    }
  }
}

