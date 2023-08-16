
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
/// Latency=80660979, interval=80660979
/// DSP=20, BRAM=0
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
) {	// L6, [0,80660979)
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

  #pragma HLS array_partition variable=v14 cyclic factor=4 dim=1
  #pragma HLS resource variable=v14 core=ram_s2p_bram

  #pragma HLS resource variable=v15 core=ram_s2p_bram

  #pragma HLS array_partition variable=v16 cyclic factor=4 dim=1
  #pragma HLS resource variable=v16 core=ram_s2p_bram

  #pragma HLS array_partition variable=v17 cyclic factor=4 dim=1
  #pragma HLS resource variable=v17 core=ram_s2p_bram

  #pragma HLS array_partition variable=v18 cyclic factor=4 dim=1
  #pragma HLS resource variable=v18 core=ram_s2p_bram

  #pragma HLS resource variable=v19 core=ram_s2p_bram

  #pragma HLS array_partition variable=v20 cyclic factor=4 dim=1
  #pragma HLS resource variable=v20 core=ram_s2p_bram

  #pragma HLS resource variable=v21 core=ram_s2p_bram

  #pragma HLS array_partition variable=v22 cyclic factor=4 dim=1
  #pragma HLS resource variable=v22 core=ram_s2p_bram

  #pragma HLS array_partition variable=v23 cyclic factor=4 dim=1
  #pragma HLS resource variable=v23 core=ram_s2p_bram

  #pragma HLS resource variable=v24 core=ram_s2p_bram

  #pragma HLS array_partition variable=v25 cyclic factor=4 dim=1
  #pragma HLS resource variable=v25 core=ram_s2p_bram

  #pragma HLS array_partition variable=v26 cyclic factor=4 dim=1
  #pragma HLS resource variable=v26 core=ram_s2p_bram

  #pragma HLS array_partition variable=v27 cyclic factor=4 dim=1
  #pragma HLS resource variable=v27 core=ram_s2p_bram

  #pragma HLS resource variable=v28 core=ram_s2p_bram

  for (int v29 = 0; v29 < 64; v29 += 1) {	// L7, [0,69762), iterCycle=1090, II=1090
    for (int v30 = 0; v30 < 32; v30 += 1) {	// L8, [0,1090), iterCycle=34, II=34
      for (int v31 = 0; v31 < 32; v31 += 1) {
#pragma HLS PIPELINE off
	// L9, [0,34), iterCycle=1, II=1
        v10[v29][v30][v31] = v0;	// L10, [0,1)
      }
    }
  }
  for (int v32 = 0; v32 < 3; v32 += 1) {	// L14, [69762,512143), iterCycle=12, II=1
    for (int v33 = 0; v33 < 3; v33 += 1) {	// L15, [80148834,80296303), iterCycle=12, II=1
      for (int v34 = 0; v34 < 3; v34 += 1) {	// L16, [80148834,80197999), iterCycle=12, II=1
        for (int v35 = 0; v35 < 16; v35 += 1) {	// L17, [80148834,80165231), iterCycle=12, II=1
          for (int v36 = 0; v36 < 32; v36 += 1) {	// L18, [80148834,80149871), iterCycle=12, II=1
            for (int v37 = 0; v37 < 32; v37 += 1) {	// L19, [80148834,80148879), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v38 = v28[v32][(v36 + v33)][(v37 + v34)];	// L20, [0,2)
              float v39 = v1[(v35 * 4)][v32][v33][v34];	// L21, [0,2)
              float v40 = v38 * v39;	// L22, [2,6)
              float v41 = v10[(v35 * 4)][v36][v37];	// L23, [4,6)
              float v42 = v40 + v41;	// L24, [6,11)
              v10[(v35 * 4)][v36][v37] = v42;	// L25, [11,12)
              float v43 = v1[((v35 * 4) + 1)][v32][v33][v34];	// L26, [0,2)
              float v44 = v38 * v43;	// L27, [2,6)
              float v45 = v10[((v35 * 4) + 1)][v36][v37];	// L28, [4,6)
              float v46 = v44 + v45;	// L29, [6,11)
              v10[((v35 * 4) + 1)][v36][v37] = v46;	// L30, [11,12)
              float v47 = v1[((v35 * 4) + 2)][v32][v33][v34];	// L31, [0,2)
              float v48 = v38 * v47;	// L32, [2,6)
              float v49 = v10[((v35 * 4) + 2)][v36][v37];	// L33, [4,6)
              float v50 = v48 + v49;	// L34, [6,11)
              v10[((v35 * 4) + 2)][v36][v37] = v50;	// L35, [11,12)
              float v51 = v1[((v35 * 4) + 3)][v32][v33][v34];	// L36, [0,2)
              float v52 = v38 * v51;	// L37, [2,6)
              float v53 = v10[((v35 * 4) + 3)][v36][v37];	// L38, [4,6)
              float v54 = v52 + v53;	// L39, [6,11)
              v10[((v35 * 4) + 3)][v36][v37] = v54;	// L40, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v55 = 0; v55 < 64; v55 += 1) {	// L47, [512143,712977), iterCycle=3138, II=3138
    for (int v56 = 0; v56 < 32; v56 += 1) {	// L48, [0,3138), iterCycle=98, II=98
      for (int v57 = 0; v57 < 32; v57 += 1) {
#pragma HLS PIPELINE off
	// L49, [0,98), iterCycle=3, II=3
        float v58 = v10[v55][v56][v57];	// L50, [0,2)
        v10[v55][v56][v57] = max(v58,v0);	// L51, [2,3)
      }
    }
  }
  for (int v59 = 0; v59 < 64; v59 += 1) {	// L55, [712977,782739), iterCycle=1090, II=1090
    for (int v60 = 0; v60 < 32; v60 += 1) {	// L56, [0,1090), iterCycle=34, II=34
      for (int v61 = 0; v61 < 32; v61 += 1) {
#pragma HLS PIPELINE off
	// L57, [0,34), iterCycle=1, II=1
        v20[v59][v60][v61] = v0;	// L58, [0,1)
      }
    }
  }
  for (int v62 = 0; v62 < 64; v62 += 1) {	// L62, [782739,10219936), iterCycle=12, II=1
    for (int v63 = 0; v63 < 3; v63 += 1) {	// L63, [70441041,70588510), iterCycle=12, II=1
      for (int v64 = 0; v64 < 3; v64 += 1) {	// L64, [70441041,70490206), iterCycle=12, II=1
        for (int v65 = 0; v65 < 16; v65 += 1) {	// L65, [70441041,70457438), iterCycle=12, II=1
          for (int v66 = 0; v66 < 32; v66 += 1) {	// L66, [70441041,70442078), iterCycle=12, II=1
            for (int v67 = 0; v67 < 32; v67 += 1) {	// L67, [70441041,70441086), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v68 = v10[v62][(v66 + v63)][(v67 + v64)];	// L68, [0,2)
              float v69 = v2[(v65 * 4)][v62][v63][v64];	// L69, [0,2)
              float v70 = v68 * v69;	// L70, [2,6)
              float v71 = v20[(v65 * 4)][v66][v67];	// L71, [4,6)
              float v72 = v70 + v71;	// L72, [6,11)
              v20[(v65 * 4)][v66][v67] = v72;	// L73, [11,12)
              float v73 = v2[((v65 * 4) + 1)][v62][v63][v64];	// L74, [0,2)
              float v74 = v68 * v73;	// L75, [2,6)
              float v75 = v20[((v65 * 4) + 1)][v66][v67];	// L76, [4,6)
              float v76 = v74 + v75;	// L77, [6,11)
              v20[((v65 * 4) + 1)][v66][v67] = v76;	// L78, [11,12)
              float v77 = v2[((v65 * 4) + 2)][v62][v63][v64];	// L79, [0,2)
              float v78 = v68 * v77;	// L80, [2,6)
              float v79 = v20[((v65 * 4) + 2)][v66][v67];	// L81, [4,6)
              float v80 = v78 + v79;	// L82, [6,11)
              v20[((v65 * 4) + 2)][v66][v67] = v80;	// L83, [11,12)
              float v81 = v2[((v65 * 4) + 3)][v62][v63][v64];	// L84, [0,2)
              float v82 = v68 * v81;	// L85, [2,6)
              float v83 = v20[((v65 * 4) + 3)][v66][v67];	// L86, [4,6)
              float v84 = v82 + v83;	// L87, [6,11)
              v20[((v65 * 4) + 3)][v66][v67] = v84;	// L88, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v85 = 0; v85 < 64; v85 += 1) {	// L95, [10219936,10420770), iterCycle=3138, II=3138
    for (int v86 = 0; v86 < 32; v86 += 1) {	// L96, [0,3138), iterCycle=98, II=98
      for (int v87 = 0; v87 < 32; v87 += 1) {
#pragma HLS PIPELINE off
	// L97, [0,98), iterCycle=3, II=3
        float v88 = v20[v85][v86][v87];	// L98, [0,2)
        v20[v85][v86][v87] = max(v88,v0);	// L99, [2,3)
      }
    }
  }
  for (int v89 = 0; v89 < 64; v89 += 1) {	// L103, [10420770,10439332), iterCycle=290, II=290
    for (int v90 = 0; v90 < 16; v90 += 1) {	// L104, [0,290), iterCycle=18, II=18
      for (int v91 = 0; v91 < 16; v91 += 1) {
#pragma HLS PIPELINE off
	// L105, [0,18), iterCycle=1, II=1
        v21[v89][v90][v91] = v0;	// L106, [0,1)
      }
    }
  }
  for (int v92 = 0; v92 < 64; v92 += 1) {	// L110, [10439332,11014950), iterCycle=8994, II=8994
    for (int v93 = 0; v93 < 16; v93 += 1) {	// L111, [0,8994), iterCycle=562, II=562
      for (int v94 = 0; v94 < 16; v94 += 1) {	// L112, [0,562), iterCycle=35, II=35
        for (int v95 = 0; v95 < 3; v95 += 1) {	// L113, [0,35), iterCycle=11, II=11
          for (int v96 = 0; v96 < 3; v96 += 1) {
#pragma HLS PIPELINE off
	// L114, [0,11), iterCycle=3, II=3
            float v97 = v20[v92][((v93 * 2) + v95)][((v94 * 2) + v96)];	// L115, [0,2)
            v21[v92][v93][v94] = max(v97,v21[v92][v93][v94]);	// L116, [2,3)
          }
        }
      }
    }
  }
  for (int v98 = 0; v98 < 128; v98 += 1) {	// L122, [11014950,11052072), iterCycle=290, II=290
    for (int v99 = 0; v99 < 16; v99 += 1) {	// L123, [0,290), iterCycle=18, II=18
      for (int v100 = 0; v100 < 16; v100 += 1) {
#pragma HLS PIPELINE off
	// L124, [0,18), iterCycle=1, II=1
        v22[v98][v99][v100] = v0;	// L125, [0,1)
      }
    }
  }
  for (int v101 = 0; v101 < 64; v101 += 1) {	// L129, [11052072,15770677), iterCycle=12, II=1
    for (int v102 = 0; v102 < 3; v102 += 1) {	// L130, [64890300,64964041), iterCycle=12, II=1
      for (int v103 = 0; v103 < 3; v103 += 1) {	// L131, [64890300,64914889), iterCycle=12, II=1
        for (int v104 = 0; v104 < 32; v104 += 1) {	// L132, [64890300,64898505), iterCycle=12, II=1
          for (int v105 = 0; v105 < 16; v105 += 1) {	// L133, [64890300,64890569), iterCycle=12, II=1
            for (int v106 = 0; v106 < 16; v106 += 1) {	// L134, [64890300,64890329), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v107 = v21[v101][(v105 + v102)][(v106 + v103)];	// L135, [0,2)
              float v108 = v3[(v104 * 4)][v101][v102][v103];	// L136, [0,2)
              float v109 = v107 * v108;	// L137, [2,6)
              float v110 = v22[(v104 * 4)][v105][v106];	// L138, [4,6)
              float v111 = v109 + v110;	// L139, [6,11)
              v22[(v104 * 4)][v105][v106] = v111;	// L140, [11,12)
              float v112 = v3[((v104 * 4) + 1)][v101][v102][v103];	// L141, [0,2)
              float v113 = v107 * v112;	// L142, [2,6)
              float v114 = v22[((v104 * 4) + 1)][v105][v106];	// L143, [4,6)
              float v115 = v113 + v114;	// L144, [6,11)
              v22[((v104 * 4) + 1)][v105][v106] = v115;	// L145, [11,12)
              float v116 = v3[((v104 * 4) + 2)][v101][v102][v103];	// L146, [0,2)
              float v117 = v107 * v116;	// L147, [2,6)
              float v118 = v22[((v104 * 4) + 2)][v105][v106];	// L148, [4,6)
              float v119 = v117 + v118;	// L149, [6,11)
              v22[((v104 * 4) + 2)][v105][v106] = v119;	// L150, [11,12)
              float v120 = v3[((v104 * 4) + 3)][v101][v102][v103];	// L151, [0,2)
              float v121 = v107 * v120;	// L152, [2,6)
              float v122 = v22[((v104 * 4) + 3)][v105][v106];	// L153, [4,6)
              float v123 = v121 + v122;	// L154, [6,11)
              v22[((v104 * 4) + 3)][v105][v106] = v123;	// L155, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v124 = 0; v124 < 128; v124 += 1) {	// L162, [15770677,15873335), iterCycle=802, II=802
    for (int v125 = 0; v125 < 16; v125 += 1) {	// L163, [0,802), iterCycle=50, II=50
      for (int v126 = 0; v126 < 16; v126 += 1) {
#pragma HLS PIPELINE off
	// L164, [0,50), iterCycle=3, II=3
        float v127 = v22[v124][v125][v126];	// L165, [0,2)
        v22[v124][v125][v126] = max(v127,v0);	// L166, [2,3)
      }
    }
  }
  for (int v128 = 0; v128 < 128; v128 += 1) {	// L170, [15873335,15910457), iterCycle=290, II=290
    for (int v129 = 0; v129 < 16; v129 += 1) {	// L171, [0,290), iterCycle=18, II=18
      for (int v130 = 0; v130 < 16; v130 += 1) {
#pragma HLS PIPELINE off
	// L172, [0,18), iterCycle=1, II=1
        v23[v128][v129][v130] = v0;	// L173, [0,1)
      }
    }
  }
  for (int v131 = 0; v131 < 128; v131 += 1) {	// L177, [15910457,25347654), iterCycle=12, II=1
    for (int v132 = 0; v132 < 3; v132 += 1) {	// L178, [55313323,55387064), iterCycle=12, II=1
      for (int v133 = 0; v133 < 3; v133 += 1) {	// L179, [55313323,55337912), iterCycle=12, II=1
        for (int v134 = 0; v134 < 32; v134 += 1) {	// L180, [55313323,55321528), iterCycle=12, II=1
          for (int v135 = 0; v135 < 16; v135 += 1) {	// L181, [55313323,55313592), iterCycle=12, II=1
            for (int v136 = 0; v136 < 16; v136 += 1) {	// L182, [55313323,55313352), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v137 = v22[v131][(v135 + v132)][(v136 + v133)];	// L183, [0,2)
              float v138 = v4[(v134 * 4)][v131][v132][v133];	// L184, [0,2)
              float v139 = v137 * v138;	// L185, [2,6)
              float v140 = v23[(v134 * 4)][v135][v136];	// L186, [4,6)
              float v141 = v139 + v140;	// L187, [6,11)
              v23[(v134 * 4)][v135][v136] = v141;	// L188, [11,12)
              float v142 = v4[((v134 * 4) + 1)][v131][v132][v133];	// L189, [0,2)
              float v143 = v137 * v142;	// L190, [2,6)
              float v144 = v23[((v134 * 4) + 1)][v135][v136];	// L191, [4,6)
              float v145 = v143 + v144;	// L192, [6,11)
              v23[((v134 * 4) + 1)][v135][v136] = v145;	// L193, [11,12)
              float v146 = v4[((v134 * 4) + 2)][v131][v132][v133];	// L194, [0,2)
              float v147 = v137 * v146;	// L195, [2,6)
              float v148 = v23[((v134 * 4) + 2)][v135][v136];	// L196, [4,6)
              float v149 = v147 + v148;	// L197, [6,11)
              v23[((v134 * 4) + 2)][v135][v136] = v149;	// L198, [11,12)
              float v150 = v4[((v134 * 4) + 3)][v131][v132][v133];	// L199, [0,2)
              float v151 = v137 * v150;	// L200, [2,6)
              float v152 = v23[((v134 * 4) + 3)][v135][v136];	// L201, [4,6)
              float v153 = v151 + v152;	// L202, [6,11)
              v23[((v134 * 4) + 3)][v135][v136] = v153;	// L203, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v154 = 0; v154 < 128; v154 += 1) {	// L210, [25347654,25450312), iterCycle=802, II=802
    for (int v155 = 0; v155 < 16; v155 += 1) {	// L211, [0,802), iterCycle=50, II=50
      for (int v156 = 0; v156 < 16; v156 += 1) {
#pragma HLS PIPELINE off
	// L212, [0,50), iterCycle=3, II=3
        float v157 = v23[v154][v155][v156];	// L213, [0,2)
        v23[v154][v155][v156] = max(v157,v0);	// L214, [2,3)
      }
    }
  }
  for (int v158 = 0; v158 < 128; v158 += 1) {	// L218, [25450312,25460810), iterCycle=82, II=82
    for (int v159 = 0; v159 < 8; v159 += 1) {	// L219, [0,82), iterCycle=10, II=10
      for (int v160 = 0; v160 < 8; v160 += 1) {
#pragma HLS PIPELINE off
	// L220, [0,10), iterCycle=1, II=1
        v24[v158][v159][v160] = v0;	// L221, [0,1)
      }
    }
  }
  for (int v161 = 0; v161 < 128; v161 += 1) {	// L225, [25460810,25749836), iterCycle=2258, II=2258
    for (int v162 = 0; v162 < 8; v162 += 1) {	// L226, [0,2258), iterCycle=282, II=282
      for (int v163 = 0; v163 < 8; v163 += 1) {	// L227, [0,282), iterCycle=35, II=35
        for (int v164 = 0; v164 < 3; v164 += 1) {	// L228, [0,35), iterCycle=11, II=11
          for (int v165 = 0; v165 < 3; v165 += 1) {
#pragma HLS PIPELINE off
	// L229, [0,11), iterCycle=3, II=3
            float v166 = v23[v161][((v162 * 2) + v164)][((v163 * 2) + v165)];	// L230, [0,2)
            v24[v161][v162][v163] = max(v166,v24[v161][v162][v163]);	// L231, [2,3)
          }
        }
      }
    }
  }
  for (int v167 = 0; v167 < 256; v167 += 1) {	// L237, [25749836,25770830), iterCycle=82, II=82
    for (int v168 = 0; v168 < 8; v168 += 1) {	// L238, [0,82), iterCycle=10, II=10
      for (int v169 = 0; v169 < 8; v169 += 1) {
#pragma HLS PIPELINE off
	// L239, [0,10), iterCycle=1, II=1
        v25[v167][v168][v169] = v0;	// L240, [0,1)
      }
    }
  }
  for (int v170 = 0; v170 < 128; v170 += 1) {	// L244, [25770830,30489435), iterCycle=12, II=1
    for (int v171 = 0; v171 < 3; v171 += 1) {	// L245, [50171542,50208419), iterCycle=12, II=1
      for (int v172 = 0; v172 < 3; v172 += 1) {	// L246, [50171542,50183843), iterCycle=12, II=1
        for (int v173 = 0; v173 < 64; v173 += 1) {	// L247, [50171542,50175651), iterCycle=12, II=1
          for (int v174 = 0; v174 < 8; v174 += 1) {	// L248, [50171542,50171619), iterCycle=12, II=1
            for (int v175 = 0; v175 < 8; v175 += 1) {	// L249, [50171542,50171563), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v176 = v24[v170][(v174 + v171)][(v175 + v172)];	// L250, [0,2)
              float v177 = v5[(v173 * 4)][v170][v171][v172];	// L251, [0,2)
              float v178 = v176 * v177;	// L252, [2,6)
              float v179 = v25[(v173 * 4)][v174][v175];	// L253, [4,6)
              float v180 = v178 + v179;	// L254, [6,11)
              v25[(v173 * 4)][v174][v175] = v180;	// L255, [11,12)
              float v181 = v5[((v173 * 4) + 1)][v170][v171][v172];	// L256, [0,2)
              float v182 = v176 * v181;	// L257, [2,6)
              float v183 = v25[((v173 * 4) + 1)][v174][v175];	// L258, [4,6)
              float v184 = v182 + v183;	// L259, [6,11)
              v25[((v173 * 4) + 1)][v174][v175] = v184;	// L260, [11,12)
              float v185 = v5[((v173 * 4) + 2)][v170][v171][v172];	// L261, [0,2)
              float v186 = v176 * v185;	// L262, [2,6)
              float v187 = v25[((v173 * 4) + 2)][v174][v175];	// L263, [4,6)
              float v188 = v186 + v187;	// L264, [6,11)
              v25[((v173 * 4) + 2)][v174][v175] = v188;	// L265, [11,12)
              float v189 = v5[((v173 * 4) + 3)][v170][v171][v172];	// L266, [0,2)
              float v190 = v176 * v189;	// L267, [2,6)
              float v191 = v25[((v173 * 4) + 3)][v174][v175];	// L268, [4,6)
              float v192 = v190 + v191;	// L269, [6,11)
              v25[((v173 * 4) + 3)][v174][v175] = v192;	// L270, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v193 = 0; v193 < 256; v193 += 1) {	// L277, [30489435,30543197), iterCycle=210, II=210
    for (int v194 = 0; v194 < 8; v194 += 1) {	// L278, [0,210), iterCycle=26, II=26
      for (int v195 = 0; v195 < 8; v195 += 1) {
#pragma HLS PIPELINE off
	// L279, [0,26), iterCycle=3, II=3
        float v196 = v25[v193][v194][v195];	// L280, [0,2)
        v25[v193][v194][v195] = max(v196,v0);	// L281, [2,3)
      }
    }
  }
  for (int v197 = 0; v197 < 256; v197 += 1) {	// L285, [30543197,30564191), iterCycle=82, II=82
    for (int v198 = 0; v198 < 8; v198 += 1) {	// L286, [0,82), iterCycle=10, II=10
      for (int v199 = 0; v199 < 8; v199 += 1) {
#pragma HLS PIPELINE off
	// L287, [0,10), iterCycle=1, II=1
        v26[v197][v198][v199] = v0;	// L288, [0,1)
      }
    }
  }
  for (int v200 = 0; v200 < 256; v200 += 1) {	// L292, [30564191,40001388), iterCycle=12, II=1
    for (int v201 = 0; v201 < 3; v201 += 1) {	// L293, [40659589,40696466), iterCycle=12, II=1
      for (int v202 = 0; v202 < 3; v202 += 1) {	// L294, [40659589,40671890), iterCycle=12, II=1
        for (int v203 = 0; v203 < 64; v203 += 1) {	// L295, [40659589,40663698), iterCycle=12, II=1
          for (int v204 = 0; v204 < 8; v204 += 1) {	// L296, [40659589,40659666), iterCycle=12, II=1
            for (int v205 = 0; v205 < 8; v205 += 1) {	// L297, [40659589,40659610), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v206 = v25[v200][(v204 + v201)][(v205 + v202)];	// L298, [0,2)
              float v207 = v6[(v203 * 4)][v200][v201][v202];	// L299, [0,2)
              float v208 = v206 * v207;	// L300, [2,6)
              float v209 = v26[(v203 * 4)][v204][v205];	// L301, [4,6)
              float v210 = v208 + v209;	// L302, [6,11)
              v26[(v203 * 4)][v204][v205] = v210;	// L303, [11,12)
              float v211 = v6[((v203 * 4) + 1)][v200][v201][v202];	// L304, [0,2)
              float v212 = v206 * v211;	// L305, [2,6)
              float v213 = v26[((v203 * 4) + 1)][v204][v205];	// L306, [4,6)
              float v214 = v212 + v213;	// L307, [6,11)
              v26[((v203 * 4) + 1)][v204][v205] = v214;	// L308, [11,12)
              float v215 = v6[((v203 * 4) + 2)][v200][v201][v202];	// L309, [0,2)
              float v216 = v206 * v215;	// L310, [2,6)
              float v217 = v26[((v203 * 4) + 2)][v204][v205];	// L311, [4,6)
              float v218 = v216 + v217;	// L312, [6,11)
              v26[((v203 * 4) + 2)][v204][v205] = v218;	// L313, [11,12)
              float v219 = v6[((v203 * 4) + 3)][v200][v201][v202];	// L314, [0,2)
              float v220 = v206 * v219;	// L315, [2,6)
              float v221 = v26[((v203 * 4) + 3)][v204][v205];	// L316, [4,6)
              float v222 = v220 + v221;	// L317, [6,11)
              v26[((v203 * 4) + 3)][v204][v205] = v222;	// L318, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v223 = 0; v223 < 256; v223 += 1) {	// L325, [40001388,40055150), iterCycle=210, II=210
    for (int v224 = 0; v224 < 8; v224 += 1) {	// L326, [0,210), iterCycle=26, II=26
      for (int v225 = 0; v225 < 8; v225 += 1) {	// L327, [0,26), iterCycle=3, II=3
        float v226 = v26[v223][v224][v225];	// L328, [0,2)
        v26[v223][v224][v225] = max(v226,v0);	// L329, [2,3)
      }
    }
  }
  for (int v227 = 0; v227 < 256; v227 += 1) {	// L333, [40055150,40076144), iterCycle=82, II=82
    for (int v228 = 0; v228 < 8; v228 += 1) {	// L334, [0,82), iterCycle=10, II=10
      for (int v229 = 0; v229 < 8; v229 += 1) {	// L335, [0,10), iterCycle=1, II=1
        v27[v227][v228][v229] = v0;	// L336, [0,1)
      }
    }
  }
  for (int v230 = 0; v230 < 256; v230 += 1) {	// L340, [40076144,49513341), iterCycle=12, II=1
    for (int v231 = 0; v231 < 3; v231 += 1) {	// L341, [31147636,31184513), iterCycle=12, II=1
      for (int v232 = 0; v232 < 3; v232 += 1) {	// L342, [31147636,31159937), iterCycle=12, II=1
        for (int v233 = 0; v233 < 64; v233 += 1) {	// L343, [31147636,31151745), iterCycle=12, II=1
          for (int v234 = 0; v234 < 8; v234 += 1) {	// L344, [31147636,31147713), iterCycle=12, II=1
            for (int v235 = 0; v235 < 8; v235 += 1) {	// L345, [31147636,31147657), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v236 = v26[v230][(v234 + v231)][(v235 + v232)];	// L346, [0,2)
              float v237 = v6[(v233 * 4)][v230][v231][v232];	// L347, [0,2)
              float v238 = v236 * v237;	// L348, [2,6)
              float v239 = v27[(v233 * 4)][v234][v235];	// L349, [4,6)
              float v240 = v238 + v239;	// L350, [6,11)
              v27[(v233 * 4)][v234][v235] = v240;	// L351, [11,12)
              float v241 = v6[((v233 * 4) + 1)][v230][v231][v232];	// L352, [0,2)
              float v242 = v236 * v241;	// L353, [2,6)
              float v243 = v27[((v233 * 4) + 1)][v234][v235];	// L354, [4,6)
              float v244 = v242 + v243;	// L355, [6,11)
              v27[((v233 * 4) + 1)][v234][v235] = v244;	// L356, [11,12)
              float v245 = v6[((v233 * 4) + 2)][v230][v231][v232];	// L357, [0,2)
              float v246 = v236 * v245;	// L358, [2,6)
              float v247 = v27[((v233 * 4) + 2)][v234][v235];	// L359, [4,6)
              float v248 = v246 + v247;	// L360, [6,11)
              v27[((v233 * 4) + 2)][v234][v235] = v248;	// L361, [11,12)
              float v249 = v6[((v233 * 4) + 3)][v230][v231][v232];	// L362, [0,2)
              float v250 = v236 * v249;	// L363, [2,6)
              float v251 = v27[((v233 * 4) + 3)][v234][v235];	// L364, [4,6)
              float v252 = v250 + v251;	// L365, [6,11)
              v27[((v233 * 4) + 3)][v234][v235] = v252;	// L366, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v253 = 0; v253 < 256; v253 += 1) {	// L373, [49513341,49567103), iterCycle=210, II=210
    for (int v254 = 0; v254 < 8; v254 += 1) {	// L374, [0,210), iterCycle=26, II=26
      for (int v255 = 0; v255 < 8; v255 += 1) {
#pragma HLS PIPELINE off
	// L375, [0,26), iterCycle=3, II=3
        float v256 = v27[v253][v254][v255];	// L376, [0,2)
        v27[v253][v254][v255] = max(v256,v0);	// L377, [2,3)
      }
    }
  }
  for (int v257 = 0; v257 < 256; v257 += 1) {	// L381, [49567103,49573761), iterCycle=26, II=26
    for (int v258 = 0; v258 < 4; v258 += 1) {	// L382, [0,26), iterCycle=6, II=6
      for (int v259 = 0; v259 < 4; v259 += 1) {
#pragma HLS PIPELINE off
	// L383, [0,6), iterCycle=1, II=1
        v11[v257][v258][v259] = v0;	// L384, [0,1)
      }
    }
  }
  for (int v260 = 0; v260 < 256; v260 += 1) {	// L388, [49573761,49719683), iterCycle=570, II=570
    for (int v261 = 0; v261 < 4; v261 += 1) {	// L389, [0,570), iterCycle=142, II=142
      for (int v262 = 0; v262 < 4; v262 += 1) {	// L390, [0,142), iterCycle=35, II=35
        for (int v263 = 0; v263 < 3; v263 += 1) {	// L391, [0,35), iterCycle=11, II=11
          for (int v264 = 0; v264 < 3; v264 += 1) {
#pragma HLS PIPELINE off
	// L392, [0,11), iterCycle=3, II=3
            float v265 = v27[v260][((v261 * 2) + v263)][((v262 * 2) + v264)];	// L393, [0,2)
            v11[v260][v261][v262] = max(v265,v11[v260][v261][v262]);	// L394, [2,3)
          }
        }
      }
    }
  }
  for (int v266 = 0; v266 < 512; v266 += 1) {	// L400, [49719683,49732997), iterCycle=26, II=26
    for (int v267 = 0; v267 < 4; v267 += 1) {	// L401, [0,26), iterCycle=6, II=6
      for (int v268 = 0; v268 < 4; v268 += 1) {
#pragma HLS PIPELINE off
	// L402, [0,6), iterCycle=1, II=1
        v12[v266][v267][v268] = v0;	// L403, [0,1)
      }
    }
  }
  for (int v269 = 0; v269 < 256; v269 += 1) {	// L407, [49732997,54451602), iterCycle=12, II=1
    for (int v270 = 0; v270 < 3; v270 += 1) {	// L408, [26209375,26227820), iterCycle=12, II=1
      for (int v271 = 0; v271 < 3; v271 += 1) {	// L409, [26209375,26215532), iterCycle=12, II=1
        for (int v272 = 0; v272 < 128; v272 += 1) {	// L410, [26209375,26211436), iterCycle=12, II=1
          for (int v273 = 0; v273 < 4; v273 += 1) {	// L411, [26209375,26209404), iterCycle=12, II=1
            for (int v274 = 0; v274 < 4; v274 += 1) {	// L412, [26209375,26209392), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v275 = v11[v269][(v273 + v270)][(v274 + v271)];	// L413, [0,2)
              float v276 = v7[(v272 * 4)][v269][v270][v271];	// L414, [0,2)
              float v277 = v275 * v276;	// L415, [2,6)
              float v278 = v12[(v272 * 4)][v273][v274];	// L416, [4,6)
              float v279 = v277 + v278;	// L417, [6,11)
              v12[(v272 * 4)][v273][v274] = v279;	// L418, [11,12)
              float v280 = v7[((v272 * 4) + 1)][v269][v270][v271];	// L419, [0,2)
              float v281 = v275 * v280;	// L420, [2,6)
              float v282 = v12[((v272 * 4) + 1)][v273][v274];	// L421, [4,6)
              float v283 = v281 + v282;	// L422, [6,11)
              v12[((v272 * 4) + 1)][v273][v274] = v283;	// L423, [11,12)
              float v284 = v7[((v272 * 4) + 2)][v269][v270][v271];	// L424, [0,2)
              float v285 = v275 * v284;	// L425, [2,6)
              float v286 = v12[((v272 * 4) + 2)][v273][v274];	// L426, [4,6)
              float v287 = v285 + v286;	// L427, [6,11)
              v12[((v272 * 4) + 2)][v273][v274] = v287;	// L428, [11,12)
              float v288 = v7[((v272 * 4) + 3)][v269][v270][v271];	// L429, [0,2)
              float v289 = v275 * v288;	// L430, [2,6)
              float v290 = v12[((v272 * 4) + 3)][v273][v274];	// L431, [4,6)
              float v291 = v289 + v290;	// L432, [6,11)
              v12[((v272 * 4) + 3)][v273][v274] = v291;	// L433, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v292 = 0; v292 < 512; v292 += 1) {	// L440, [54451602,54481300), iterCycle=58, II=58
    for (int v293 = 0; v293 < 4; v293 += 1) {	// L441, [0,58), iterCycle=14, II=14
      for (int v294 = 0; v294 < 4; v294 += 1) {
#pragma HLS PIPELINE off
	// L442, [0,14), iterCycle=3, II=3
        float v295 = v12[v292][v293][v294];	// L443, [0,2)
        v12[v292][v293][v294] = max(v295,v0);	// L444, [2,3)
      }
    }
  }
  for (int v296 = 0; v296 < 512; v296 += 1) {	// L448, [54481300,54494614), iterCycle=26, II=26
    for (int v297 = 0; v297 < 4; v297 += 1) {	// L449, [0,26), iterCycle=6, II=6
      for (int v298 = 0; v298 < 4; v298 += 1) {
#pragma HLS PIPELINE off
	// L450, [0,6), iterCycle=1, II=1
        v13[v296][v297][v298] = v0;	// L451, [0,1)
      }
    }
  }
  for (int v299 = 0; v299 < 512; v299 += 1) {	// L455, [54494614,63931811), iterCycle=12, II=1
    for (int v300 = 0; v300 < 3; v300 += 1) {	// L456, [16729166,16747611), iterCycle=12, II=1
      for (int v301 = 0; v301 < 3; v301 += 1) {	// L457, [16729166,16735323), iterCycle=12, II=1
        for (int v302 = 0; v302 < 128; v302 += 1) {	// L458, [16729166,16731227), iterCycle=12, II=1
          for (int v303 = 0; v303 < 4; v303 += 1) {	// L459, [16729166,16729195), iterCycle=12, II=1
            for (int v304 = 0; v304 < 4; v304 += 1) {	// L460, [16729166,16729183), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v305 = v12[v299][(v303 + v300)][(v304 + v301)];	// L461, [0,2)
              float v306 = v8[(v302 * 4)][v299][v300][v301];	// L462, [0,2)
              float v307 = v305 * v306;	// L463, [2,6)
              float v308 = v13[(v302 * 4)][v303][v304];	// L464, [4,6)
              float v309 = v307 + v308;	// L465, [6,11)
              v13[(v302 * 4)][v303][v304] = v309;	// L466, [11,12)
              float v310 = v8[((v302 * 4) + 1)][v299][v300][v301];	// L467, [0,2)
              float v311 = v305 * v310;	// L468, [2,6)
              float v312 = v13[((v302 * 4) + 1)][v303][v304];	// L469, [4,6)
              float v313 = v311 + v312;	// L470, [6,11)
              v13[((v302 * 4) + 1)][v303][v304] = v313;	// L471, [11,12)
              float v314 = v8[((v302 * 4) + 2)][v299][v300][v301];	// L472, [0,2)
              float v315 = v305 * v314;	// L473, [2,6)
              float v316 = v13[((v302 * 4) + 2)][v303][v304];	// L474, [4,6)
              float v317 = v315 + v316;	// L475, [6,11)
              v13[((v302 * 4) + 2)][v303][v304] = v317;	// L476, [11,12)
              float v318 = v8[((v302 * 4) + 3)][v299][v300][v301];	// L477, [0,2)
              float v319 = v305 * v318;	// L478, [2,6)
              float v320 = v13[((v302 * 4) + 3)][v303][v304];	// L479, [4,6)
              float v321 = v319 + v320;	// L480, [6,11)
              v13[((v302 * 4) + 3)][v303][v304] = v321;	// L481, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v322 = 0; v322 < 512; v322 += 1) {	// L488, [63931811,63961509), iterCycle=58, II=58
    for (int v323 = 0; v323 < 4; v323 += 1) {	// L489, [0,58), iterCycle=14, II=14
      for (int v324 = 0; v324 < 4; v324 += 1) {
#pragma HLS PIPELINE off
	// L490, [0,14), iterCycle=3, II=3
        float v325 = v13[v322][v323][v324];	// L491, [0,2)
        v13[v322][v323][v324] = max(v325,v0);	// L492, [2,3)
      }
    }
  }
  for (int v326 = 0; v326 < 512; v326 += 1) {	// L496, [63961509,63974823), iterCycle=26, II=26
    for (int v327 = 0; v327 < 4; v327 += 1) {	// L497, [0,26), iterCycle=6, II=6
      for (int v328 = 0; v328 < 4; v328 += 1) {
#pragma HLS PIPELINE off
	// L498, [0,6), iterCycle=1, II=1
        v14[v326][v327][v328] = v0;	// L499, [0,1)
      }
    }
  }
  for (int v329 = 0; v329 < 512; v329 += 1) {	// L503, [63974823,73412020), iterCycle=12, II=1
    for (int v330 = 0; v330 < 3; v330 += 1) {	// L504, [7248957,7267402), iterCycle=12, II=1
      for (int v331 = 0; v331 < 3; v331 += 1) {	// L505, [7248957,7255114), iterCycle=12, II=1
        for (int v332 = 0; v332 < 128; v332 += 1) {	// L506, [7248957,7251018), iterCycle=12, II=1
          for (int v333 = 0; v333 < 4; v333 += 1) {	// L507, [7248957,7248986), iterCycle=12, II=1
            for (int v334 = 0; v334 < 4; v334 += 1) {	// L508, [7248957,7248974), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v335 = v13[v329][(v333 + v330)][(v334 + v331)];	// L509, [0,2)
              float v336 = v8[(v332 * 4)][v329][v330][v331];	// L510, [0,2)
              float v337 = v335 * v336;	// L511, [2,6)
              float v338 = v14[(v332 * 4)][v333][v334];	// L512, [4,6)
              float v339 = v337 + v338;	// L513, [6,11)
              v14[(v332 * 4)][v333][v334] = v339;	// L514, [11,12)
              float v340 = v8[((v332 * 4) + 1)][v329][v330][v331];	// L515, [0,2)
              float v341 = v335 * v340;	// L516, [2,6)
              float v342 = v14[((v332 * 4) + 1)][v333][v334];	// L517, [4,6)
              float v343 = v341 + v342;	// L518, [6,11)
              v14[((v332 * 4) + 1)][v333][v334] = v343;	// L519, [11,12)
              float v344 = v8[((v332 * 4) + 2)][v329][v330][v331];	// L520, [0,2)
              float v345 = v335 * v344;	// L521, [2,6)
              float v346 = v14[((v332 * 4) + 2)][v333][v334];	// L522, [4,6)
              float v347 = v345 + v346;	// L523, [6,11)
              v14[((v332 * 4) + 2)][v333][v334] = v347;	// L524, [11,12)
              float v348 = v8[((v332 * 4) + 3)][v329][v330][v331];	// L525, [0,2)
              float v349 = v335 * v348;	// L526, [2,6)
              float v350 = v14[((v332 * 4) + 3)][v333][v334];	// L527, [4,6)
              float v351 = v349 + v350;	// L528, [6,11)
              v14[((v332 * 4) + 3)][v333][v334] = v351;	// L529, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v352 = 0; v352 < 512; v352 += 1) {	// L536, [73412020,73441718), iterCycle=58, II=58
    for (int v353 = 0; v353 < 4; v353 += 1) {	// L537, [0,58), iterCycle=14, II=14
      for (int v354 = 0; v354 < 4; v354 += 1) {
#pragma HLS PIPELINE off
	// L538, [0,14), iterCycle=3, II=3
        float v355 = v14[v352][v353][v354];	// L539, [0,2)
        v14[v352][v353][v354] = max(v355,v0);	// L540, [2,3)
      }
    }
  }
  for (int v356 = 0; v356 < 512; v356 += 1) {	// L544, [73441718,73446840), iterCycle=10, II=10
    for (int v357 = 0; v357 < 2; v357 += 1) {	// L545, [0,10), iterCycle=4, II=4
      for (int v358 = 0; v358 < 2; v358 += 1) {
#pragma HLS PIPELINE off
	// L546, [0,4), iterCycle=1, II=1
        v15[v356][v357][v358] = v0;	// L547, [0,1)
      }
    }
  }
  for (int v359 = 0; v359 < 512; v359 += 1) {	// L551, [73446840,73521594), iterCycle=146, II=146
    for (int v360 = 0; v360 < 2; v360 += 1) {	// L552, [0,146), iterCycle=72, II=72
      for (int v361 = 0; v361 < 2; v361 += 1) {	// L553, [0,72), iterCycle=35, II=35
        for (int v362 = 0; v362 < 3; v362 += 1) {	// L554, [0,35), iterCycle=11, II=11
          for (int v363 = 0; v363 < 3; v363 += 1) {
#pragma HLS PIPELINE off
	// L555, [0,11), iterCycle=3, II=3
            float v364 = v14[v359][((v360 * 2) + v362)][((v361 * 2) + v363)];	// L556, [0,2)
            v15[v359][v360][v361] = max(v364,v15[v359][v360][v361]);	// L557, [2,3)
          }
        }
      }
    }
  }
  for (int v365 = 0; v365 < 512; v365 += 1) {	// L563, [73521594,73526716), iterCycle=10, II=10
    for (int v366 = 0; v366 < 2; v366 += 1) {	// L564, [0,10), iterCycle=4, II=4
      for (int v367 = 0; v367 < 2; v367 += 1) {	// L565, [0,4), iterCycle=1, II=1
        v16[v365][v366][v367] = v0;	// L566, [0,1)
      }
    }
  }
  for (int v368 = 0; v368 < 512; v368 += 1) {	// L570, [73526716,75886025), iterCycle=12, II=1
    for (int v369 = 0; v369 < 3; v369 += 1) {	// L571, [4774952,4779573), iterCycle=12, II=1
      for (int v370 = 0; v370 < 3; v370 += 1) {	// L572, [4774952,4776501), iterCycle=12, II=1
        for (int v371 = 0; v371 < 128; v371 += 1) {	// L573, [4774952,4775477), iterCycle=12, II=1
          for (int v372 = 0; v372 < 2; v372 += 1) {	// L574, [4774952,4774969), iterCycle=12, II=1
            for (int v373 = 0; v373 < 2; v373 += 1) {	// L575, [4774952,4774967), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v374 = v15[v368][(v372 + v369)][(v373 + v370)];	// L576, [0,2)
              float v375 = v9[(v371 * 4)][v368][v369][v370];	// L577, [0,2)
              float v376 = v374 * v375;	// L578, [2,6)
              float v377 = v16[(v371 * 4)][v372][v373];	// L579, [4,6)
              float v378 = v376 + v377;	// L580, [6,11)
              v16[(v371 * 4)][v372][v373] = v378;	// L581, [11,12)
              float v379 = v9[((v371 * 4) + 1)][v368][v369][v370];	// L582, [0,2)
              float v380 = v374 * v379;	// L583, [2,6)
              float v381 = v16[((v371 * 4) + 1)][v372][v373];	// L584, [4,6)
              float v382 = v380 + v381;	// L585, [6,11)
              v16[((v371 * 4) + 1)][v372][v373] = v382;	// L586, [11,12)
              float v383 = v9[((v371 * 4) + 2)][v368][v369][v370];	// L587, [0,2)
              float v384 = v374 * v383;	// L588, [2,6)
              float v385 = v16[((v371 * 4) + 2)][v372][v373];	// L589, [4,6)
              float v386 = v384 + v385;	// L590, [6,11)
              v16[((v371 * 4) + 2)][v372][v373] = v386;	// L591, [11,12)
              float v387 = v9[((v371 * 4) + 3)][v368][v369][v370];	// L592, [0,2)
              float v388 = v374 * v387;	// L593, [2,6)
              float v389 = v16[((v371 * 4) + 3)][v372][v373];	// L594, [4,6)
              float v390 = v388 + v389;	// L595, [6,11)
              v16[((v371 * 4) + 3)][v372][v373] = v390;	// L596, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v391 = 0; v391 < 512; v391 += 1) {	// L603, [75886025,75895243), iterCycle=18, II=18
    for (int v392 = 0; v392 < 2; v392 += 1) {	// L604, [0,18), iterCycle=8, II=8
      for (int v393 = 0; v393 < 2; v393 += 1) {
#pragma HLS PIPELINE off
	// L605, [0,8), iterCycle=3, II=3
        float v394 = v16[v391][v392][v393];	// L606, [0,2)
        v16[v391][v392][v393] = max(v394,v0);	// L607, [2,3)
      }
    }
  }
  for (int v395 = 0; v395 < 512; v395 += 1) {	// L611, [75895243,75900365), iterCycle=10, II=10
    for (int v396 = 0; v396 < 2; v396 += 1) {	// L612, [0,10), iterCycle=4, II=4
      for (int v397 = 0; v397 < 2; v397 += 1) {
#pragma HLS PIPELINE off
	// L613, [0,4), iterCycle=1, II=1
        v17[v395][v396][v397] = v0;	// L614, [0,1)
      }
    }
  }
  for (int v398 = 0; v398 < 512; v398 += 1) {	// L618, [75900365,78259674), iterCycle=12, II=1
    for (int v399 = 0; v399 < 3; v399 += 1) {	// L619, [2401303,2405924), iterCycle=12, II=1
      for (int v400 = 0; v400 < 3; v400 += 1) {	// L620, [2401303,2402852), iterCycle=12, II=1
        for (int v401 = 0; v401 < 128; v401 += 1) {	// L621, [2401303,2401828), iterCycle=12, II=1
          for (int v402 = 0; v402 < 2; v402 += 1) {	// L622, [2401303,2401320), iterCycle=12, II=1
            for (int v403 = 0; v403 < 2; v403 += 1) {	// L623, [2401303,2401318), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v404 = v16[v398][(v402 + v399)][(v403 + v400)];	// L624, [0,2)
              float v405 = v9[(v401 * 4)][v398][v399][v400];	// L625, [0,2)
              float v406 = v404 * v405;	// L626, [2,6)
              float v407 = v17[(v401 * 4)][v402][v403];	// L627, [4,6)
              float v408 = v406 + v407;	// L628, [6,11)
              v17[(v401 * 4)][v402][v403] = v408;	// L629, [11,12)
              float v409 = v9[((v401 * 4) + 1)][v398][v399][v400];	// L630, [0,2)
              float v410 = v404 * v409;	// L631, [2,6)
              float v411 = v17[((v401 * 4) + 1)][v402][v403];	// L632, [4,6)
              float v412 = v410 + v411;	// L633, [6,11)
              v17[((v401 * 4) + 1)][v402][v403] = v412;	// L634, [11,12)
              float v413 = v9[((v401 * 4) + 2)][v398][v399][v400];	// L635, [0,2)
              float v414 = v404 * v413;	// L636, [2,6)
              float v415 = v17[((v401 * 4) + 2)][v402][v403];	// L637, [4,6)
              float v416 = v414 + v415;	// L638, [6,11)
              v17[((v401 * 4) + 2)][v402][v403] = v416;	// L639, [11,12)
              float v417 = v9[((v401 * 4) + 3)][v398][v399][v400];	// L640, [0,2)
              float v418 = v404 * v417;	// L641, [2,6)
              float v419 = v17[((v401 * 4) + 3)][v402][v403];	// L642, [4,6)
              float v420 = v418 + v419;	// L643, [6,11)
              v17[((v401 * 4) + 3)][v402][v403] = v420;	// L644, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v421 = 0; v421 < 512; v421 += 1) {	// L651, [78259674,78268892), iterCycle=18, II=18
    for (int v422 = 0; v422 < 2; v422 += 1) {	// L652, [0,18), iterCycle=8, II=8
      for (int v423 = 0; v423 < 2; v423 += 1) {
#pragma HLS PIPELINE off
	// L653, [0,8), iterCycle=3, II=3
        float v424 = v17[v421][v422][v423];	// L654, [0,2)
        v17[v421][v422][v423] = max(v424,v0);	// L655, [2,3)
      }
    }
  }
  for (int v425 = 0; v425 < 512; v425 += 1) {	// L659, [78268892,78274014), iterCycle=10, II=10
    for (int v426 = 0; v426 < 2; v426 += 1) {	// L660, [0,10), iterCycle=4, II=4
      for (int v427 = 0; v427 < 2; v427 += 1) {
#pragma HLS PIPELINE off
	// L661, [0,4), iterCycle=1, II=1
        v18[v425][v426][v427] = v0;	// L662, [0,1)
      }
    }
  }
  for (int v428 = 0; v428 < 512; v428 += 1) {	// L666, [78274014,80633323), iterCycle=12, II=1
    for (int v429 = 0; v429 < 3; v429 += 1) {	// L667, [27654,32275), iterCycle=12, II=1
      for (int v430 = 0; v430 < 3; v430 += 1) {	// L668, [27654,29203), iterCycle=12, II=1
        for (int v431 = 0; v431 < 128; v431 += 1) {	// L669, [27654,28179), iterCycle=12, II=1
          for (int v432 = 0; v432 < 2; v432 += 1) {	// L670, [27654,27671), iterCycle=12, II=1
            for (int v433 = 0; v433 < 2; v433 += 1) {	// L671, [27654,27669), iterCycle=12, II=1
              #pragma HLS pipeline II=1
              float v434 = v17[v428][(v432 + v429)][(v433 + v430)];	// L672, [0,2)
              float v435 = v9[(v431 * 4)][v428][v429][v430];	// L673, [0,2)
              float v436 = v434 * v435;	// L674, [2,6)
              float v437 = v18[(v431 * 4)][v432][v433];	// L675, [4,6)
              float v438 = v436 + v437;	// L676, [6,11)
              v18[(v431 * 4)][v432][v433] = v438;	// L677, [11,12)
              float v439 = v9[((v431 * 4) + 1)][v428][v429][v430];	// L678, [0,2)
              float v440 = v434 * v439;	// L679, [2,6)
              float v441 = v18[((v431 * 4) + 1)][v432][v433];	// L680, [4,6)
              float v442 = v440 + v441;	// L681, [6,11)
              v18[((v431 * 4) + 1)][v432][v433] = v442;	// L682, [11,12)
              float v443 = v9[((v431 * 4) + 2)][v428][v429][v430];	// L683, [0,2)
              float v444 = v434 * v443;	// L684, [2,6)
              float v445 = v18[((v431 * 4) + 2)][v432][v433];	// L685, [4,6)
              float v446 = v444 + v445;	// L686, [6,11)
              v18[((v431 * 4) + 2)][v432][v433] = v446;	// L687, [11,12)
              float v447 = v9[((v431 * 4) + 3)][v428][v429][v430];	// L688, [0,2)
              float v448 = v434 * v447;	// L689, [2,6)
              float v449 = v18[((v431 * 4) + 3)][v432][v433];	// L690, [4,6)
              float v450 = v448 + v449;	// L691, [6,11)
              v18[((v431 * 4) + 3)][v432][v433] = v450;	// L692, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v451 = 0; v451 < 512; v451 += 1) {	// L699, [80633323,80642541), iterCycle=18, II=18
    for (int v452 = 0; v452 < 2; v452 += 1) {	// L700, [0,18), iterCycle=8, II=8
      for (int v453 = 0; v453 < 2; v453 += 1) {
#pragma HLS PIPELINE off
	// L701, [0,8), iterCycle=3, II=3
        float v454 = v18[v451][v452][v453];	// L702, [0,2)
        v18[v451][v452][v453] = max(v454,v0);	// L703, [2,3)
      }
    }
  }
  for (int v455 = 0; v455 < 512; v455 += 1) {
#pragma HLS PIPELINE off
	// L707, [80642541,80643055), iterCycle=1, II=1
    v19[v455] = v0;	// L708, [0,1)
  }
  for (int v456 = 0; v456 < 512; v456 += 1) {
	// L710, [80643055,80660977), iterCycle=35, II=35
    for (int v457 = 0; v457 < 3; v457 += 1) {	// L711, [0,35), iterCycle=11, II=11
      for (int v458 = 0; v458 < 3; v458 += 1) {
#pragma HLS PIPELINE off
	// L712, [0,11), iterCycle=3, II=3
        float v459 = v18[v456][(v457 + 2)][(v458 + 2)];	// L713, [0,2)
        v19[v456] = max(v459,v19[v456]);	// L714, [2,3)
      }
    }
  }
}

