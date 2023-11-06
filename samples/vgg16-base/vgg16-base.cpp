
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
/// Latency=9953830766, interval=9953830766
/// DSP=5, BRAM=0
void vgg16-base(
  float v0,
  float v1,
  float v2[3][64][64],
  float v3[10],
  float v4[256][256][3][3],
  float v5[256][128][3][3],
  float v6[128][128][3][3],
  float v7[128][64][3][3],
  float v8[64][64][3][3],
  float v9[64][3][3][3],
  float v10[3][66][66],
  float v11[10][512],
  float v12[64][64][64],
  float v13[64][64][64],
  float v14[64][64][64],
  float v15[64][66][66],
  float v16[64][32][32],
  float v17[64][32][32],
  float v18[64][32][32],
  float v19[64][34][34],
  float v20[512][512][3][3],
  float v21[128][32][32],
  float v22[128][32][32],
  float v23[128][32][32],
  float v24[128][34][34],
  float v25[128][16][16],
  float v26[128][16][16],
  float v27[128][16][16],
  float v28[128][18][18],
  float v29[512][512][3][3],
  float v30[256][16][16],
  float v31[256][16][16],
  float v32[256][16][16],
  float v33[256][18][18],
  float v34[256][16][16],
  float v35[256][16][16],
  float v36[256][18][18],
  float v37[256][8][8],
  float v38[256][8][8],
  float v39[512][512][3][3],
  float v40[256][8][8],
  float v41[256][10][10],
  float v42[512][8][8],
  float v43[512][8][8],
  float v44[512][8][8],
  float v45[512][10][10],
  float v46[512][8][8],
  float v47[512][8][8],
  float v48[512][10][10],
  float v49[512][512][3][3],
  float v50[512][4][4],
  float v51[512][4][4],
  float v52[512][4][4],
  float v53[512][6][6],
  float v54[512][4][4],
  float v55[512][4][4],
  float v56[512][6][6],
  float v57[512][4][4],
  float v58[512][4][4],
  float v59[512][512][3][3],
  float v60[512][6][6],
  float v61[512][2][2],
  float v62[512][2][2],
  float v63[512][2][2],
  float v64[512],
  float v65[512],
  float v66[512],
  float v67[512][256][3][3],
  float v68[512],
  float v69[512][10],
  float v70[10],
  float v71[10],
  float v72[10],
  float v73[256][256][3][3]
) {	// L2, [0,9953830766)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
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
  #pragma HLS interface bram port=v41
  #pragma HLS interface bram port=v42
  #pragma HLS interface bram port=v43
  #pragma HLS interface bram port=v44
  #pragma HLS interface bram port=v45
  #pragma HLS interface bram port=v46
  #pragma HLS interface bram port=v47
  #pragma HLS interface bram port=v48
  #pragma HLS interface bram port=v49
  #pragma HLS interface bram port=v50
  #pragma HLS interface bram port=v51
  #pragma HLS interface bram port=v52
  #pragma HLS interface bram port=v53
  #pragma HLS interface bram port=v54
  #pragma HLS interface bram port=v55
  #pragma HLS interface bram port=v56
  #pragma HLS interface bram port=v57
  #pragma HLS interface bram port=v58
  #pragma HLS interface bram port=v59
  #pragma HLS interface bram port=v60
  #pragma HLS interface bram port=v61
  #pragma HLS interface bram port=v62
  #pragma HLS interface bram port=v63
  #pragma HLS interface bram port=v64
  #pragma HLS interface bram port=v65
  #pragma HLS interface bram port=v66
  #pragma HLS interface bram port=v67
  #pragma HLS interface bram port=v68
  #pragma HLS interface bram port=v69
  #pragma HLS interface bram port=v70
  #pragma HLS interface bram port=v71
  #pragma HLS interface bram port=v72
  #pragma HLS interface bram port=v73

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS resource variable=v7 core=ram_s2p_bram

  #pragma HLS resource variable=v8 core=ram_s2p_bram

  #pragma HLS resource variable=v9 core=ram_s2p_bram

  #pragma HLS resource variable=v10 core=ram_s2p_bram

  #pragma HLS resource variable=v11 core=ram_s2p_bram

  #pragma HLS resource variable=v12 core=ram_s2p_bram

  #pragma HLS resource variable=v13 core=ram_s2p_bram

  #pragma HLS resource variable=v14 core=ram_s2p_bram

  #pragma HLS resource variable=v15 core=ram_s2p_bram

  #pragma HLS resource variable=v16 core=ram_s2p_bram

  #pragma HLS resource variable=v17 core=ram_s2p_bram

  #pragma HLS resource variable=v18 core=ram_s2p_bram

  #pragma HLS resource variable=v19 core=ram_s2p_bram

  #pragma HLS resource variable=v20 core=ram_s2p_bram

  #pragma HLS resource variable=v21 core=ram_s2p_bram

  #pragma HLS resource variable=v22 core=ram_s2p_bram

  #pragma HLS resource variable=v23 core=ram_s2p_bram

  #pragma HLS resource variable=v24 core=ram_s2p_bram

  #pragma HLS resource variable=v25 core=ram_s2p_bram

  #pragma HLS resource variable=v26 core=ram_s2p_bram

  #pragma HLS resource variable=v27 core=ram_s2p_bram

  #pragma HLS resource variable=v28 core=ram_s2p_bram

  #pragma HLS resource variable=v29 core=ram_s2p_bram

  #pragma HLS resource variable=v30 core=ram_s2p_bram

  #pragma HLS resource variable=v31 core=ram_s2p_bram

  #pragma HLS resource variable=v32 core=ram_s2p_bram

  #pragma HLS resource variable=v33 core=ram_s2p_bram

  #pragma HLS resource variable=v34 core=ram_s2p_bram

  #pragma HLS resource variable=v35 core=ram_s2p_bram

  #pragma HLS resource variable=v36 core=ram_s2p_bram

  #pragma HLS resource variable=v37 core=ram_s2p_bram

  #pragma HLS resource variable=v38 core=ram_s2p_bram

  #pragma HLS resource variable=v39 core=ram_s2p_bram

  #pragma HLS resource variable=v40 core=ram_s2p_bram

  #pragma HLS resource variable=v41 core=ram_s2p_bram

  #pragma HLS resource variable=v42 core=ram_s2p_bram

  #pragma HLS resource variable=v43 core=ram_s2p_bram

  #pragma HLS resource variable=v44 core=ram_s2p_bram

  #pragma HLS resource variable=v45 core=ram_s2p_bram

  #pragma HLS resource variable=v46 core=ram_s2p_bram

  #pragma HLS resource variable=v47 core=ram_s2p_bram

  #pragma HLS resource variable=v48 core=ram_s2p_bram

  #pragma HLS resource variable=v49 core=ram_s2p_bram

  #pragma HLS resource variable=v50 core=ram_s2p_bram

  #pragma HLS resource variable=v51 core=ram_s2p_bram

  #pragma HLS resource variable=v52 core=ram_s2p_bram

  #pragma HLS resource variable=v53 core=ram_s2p_bram

  #pragma HLS resource variable=v54 core=ram_s2p_bram

  #pragma HLS resource variable=v55 core=ram_s2p_bram

  #pragma HLS resource variable=v56 core=ram_s2p_bram

  #pragma HLS resource variable=v57 core=ram_s2p_bram

  #pragma HLS resource variable=v58 core=ram_s2p_bram

  #pragma HLS resource variable=v59 core=ram_s2p_bram

  #pragma HLS resource variable=v60 core=ram_s2p_bram

  #pragma HLS resource variable=v61 core=ram_s2p_bram

  #pragma HLS resource variable=v62 core=ram_s2p_bram

  #pragma HLS resource variable=v63 core=ram_s2p_bram

  #pragma HLS resource variable=v64 core=ram_s2p_bram

  #pragma HLS resource variable=v65 core=ram_s2p_bram

  #pragma HLS resource variable=v66 core=ram_s2p_bram

  #pragma HLS resource variable=v67 core=ram_s2p_bram

  #pragma HLS resource variable=v68 core=ram_s2p_bram

  #pragma HLS resource variable=v69 core=ram_s2p_bram

  #pragma HLS resource variable=v70 core=ram_s2p_bram

  #pragma HLS resource variable=v71 core=ram_s2p_bram

  #pragma HLS resource variable=v72 core=ram_s2p_bram

  #pragma HLS resource variable=v73 core=ram_s2p_bram

  for (int v74 = 0; v74 < 3; v74 += 1) {	// L3, [0,13472), iterCycle=4490, II=4490
    for (int v75 = 0; v75 < 66; v75 += 1) {	// L4, [0,4490), iterCycle=68, II=68
      for (int v76 = 0; v76 < 66; v76 += 1) {	// L5, [0,68), iterCycle=1, II=1
        v10[v74][v75][v76] = v0;	// L6, [0,1)
      }
    }
  }
  for (int v77 = 0; v77 < 3; v77 += 1) {	// L10, [13472,50728), iterCycle=12418, II=12418
    for (int v78 = 0; v78 < 64; v78 += 1) {	// L11, [0,12418), iterCycle=194, II=194
      for (int v79 = 0; v79 < 64; v79 += 1) {	// L12, [0,194), iterCycle=3, II=3
        float v80 = v2[v77][v78][v79];	// L13, [0,2)
        v10[v77][(v78 + 1)][(v79 + 1)] = v80;	// L14, [2,3)
      }
    }
  }
  for (int v81 = 0; v81 < 64; v81 += 1) {	// L18, [50728,321194), iterCycle=4226, II=4226
    for (int v82 = 0; v82 < 64; v82 += 1) {	// L19, [0,4226), iterCycle=66, II=66
      for (int v83 = 0; v83 < 64; v83 += 1) {	// L20, [0,66), iterCycle=1, II=1
        v12[v81][v82][v83] = v0;	// L21, [0,1)
      }
    }
  }
  for (int v84 = 0; v84 < 64; v84 += 1) {	// L25, [321194,92079916), iterCycle=1433730, II=1433730
    for (int v85 = 0; v85 < 64; v85 += 1) {	// L26, [0,1433730), iterCycle=22402, II=22402
      for (int v86 = 0; v86 < 64; v86 += 1) {	// L27, [0,22402), iterCycle=350, II=350
        for (int v87 = 0; v87 < 3; v87 += 1) {	// L28, [0,350), iterCycle=116, II=116
          for (int v88 = 0; v88 < 3; v88 += 1) {	// L29, [0,116), iterCycle=38, II=38
            for (int v89 = 0; v89 < 3; v89 += 1) {	// L30, [0,38), iterCycle=12, II=12
              float v90 = v10[v87][(v85 + v88)][(v86 + v89)];	// L31, [0,2)
              float v91 = v9[v84][v87][v88][v89];	// L32, [0,2)
              float v92 = v90 * v91;	// L33, [2,6)
              float v93 = v12[v84][v85][v86];	// L34, [4,6)
              float v94 = v92 + v93;	// L35, [6,11)
              v12[v84][v85][v86] = v94;	// L36, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v95 = 0; v95 < 64; v95 += 1) {	// L43, [92079916,92874670), iterCycle=12418, II=12418
    for (int v96 = 0; v96 < 64; v96 += 1) {	// L44, [0,12418), iterCycle=194, II=194
      for (int v97 = 0; v97 < 64; v97 += 1) {	// L45, [0,194), iterCycle=3, II=3
        float v98 = v12[v95][v96][v97];	// L46, [0,2)
        v13[v95][v96][v97] = v98;	// L47, [2,3)
      }
    }
  }
  for (int v99 = 0; v99 < 64; v99 += 1) {	// L51, [92874670,93669424), iterCycle=12418, II=12418
    for (int v100 = 0; v100 < 64; v100 += 1) {	// L52, [0,12418), iterCycle=194, II=194
      for (int v101 = 0; v101 < 64; v101 += 1) {	// L53, [0,194), iterCycle=3, II=3
        float v102 = v13[v99][v100][v101];	// L54, [0,2)
        float v103 = max(v102, v0);	// L55, [2,2)
        v14[v99][v100][v101] = v103;	// L56, [2,3)
      }
    }
  }
  for (int v104 = 0; v104 < 64; v104 += 1) {	// L60, [93669424,93956786), iterCycle=4490, II=4490
    for (int v105 = 0; v105 < 66; v105 += 1) {	// L61, [0,4490), iterCycle=68, II=68
      for (int v106 = 0; v106 < 66; v106 += 1) {	// L62, [0,68), iterCycle=1, II=1
        v15[v104][v105][v106] = v0;	// L63, [0,1)
      }
    }
  }
  for (int v107 = 0; v107 < 64; v107 += 1) {	// L67, [93956786,94751540), iterCycle=12418, II=12418
    for (int v108 = 0; v108 < 64; v108 += 1) {	// L68, [0,12418), iterCycle=194, II=194
      for (int v109 = 0; v109 < 64; v109 += 1) {	// L69, [0,194), iterCycle=3, II=3
        float v110 = v14[v107][v108][v109];	// L70, [0,2)
        v15[v107][(v108 + 1)][(v109 + 1)] = v110;	// L71, [2,3)
      }
    }
  }
  for (int v111 = 0; v111 < 64; v111 += 1) {	// L75, [94751540,94821302), iterCycle=1090, II=1090
    for (int v112 = 0; v112 < 32; v112 += 1) {	// L76, [0,1090), iterCycle=34, II=34
      for (int v113 = 0; v113 < 32; v113 += 1) {	// L77, [0,34), iterCycle=1, II=1
        v16[v111][v112][v113] = v0;	// L78, [0,1)
      }
    }
  }
  for (int v114 = 0; v114 < 64; v114 += 1) {	// L82, [94821302,581495864), iterCycle=7604290, II=7604290
    for (int v115 = 0; v115 < 32; v115 += 1) {	// L83, [0,7604290), iterCycle=237634, II=237634
      for (int v116 = 0; v116 < 32; v116 += 1) {	// L84, [0,237634), iterCycle=7426, II=7426
        for (int v117 = 0; v117 < 64; v117 += 1) {	// L85, [0,7426), iterCycle=116, II=116
          for (int v118 = 0; v118 < 3; v118 += 1) {	// L86, [0,116), iterCycle=38, II=38
            for (int v119 = 0; v119 < 3; v119 += 1) {	// L87, [0,38), iterCycle=12, II=12
              float v120 = v15[v117][((v115 * 2) + v118)][((v116 * 2) + v119)];	// L88, [0,2)
              float v121 = v8[v114][v117][v118][v119];	// L89, [0,2)
              float v122 = v120 * v121;	// L90, [2,6)
              float v123 = v16[v114][v115][v116];	// L91, [4,6)
              float v124 = v122 + v123;	// L92, [6,11)
              v16[v114][v115][v116] = v124;	// L93, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v125 = 0; v125 < 64; v125 += 1) {	// L100, [581495864,581696698), iterCycle=3138, II=3138
    for (int v126 = 0; v126 < 32; v126 += 1) {	// L101, [0,3138), iterCycle=98, II=98
      for (int v127 = 0; v127 < 32; v127 += 1) {	// L102, [0,98), iterCycle=3, II=3
        float v128 = v16[v125][v126][v127];	// L103, [0,2)
        v17[v125][v126][v127] = v128;	// L104, [2,3)
      }
    }
  }
  for (int v129 = 0; v129 < 64; v129 += 1) {	// L108, [581696698,581897532), iterCycle=3138, II=3138
    for (int v130 = 0; v130 < 32; v130 += 1) {	// L109, [0,3138), iterCycle=98, II=98
      for (int v131 = 0; v131 < 32; v131 += 1) {	// L110, [0,98), iterCycle=3, II=3
        float v132 = v17[v129][v130][v131];	// L111, [0,2)
        float v133 = max(v132, v0);	// L112, [2,2)
        v18[v129][v130][v131] = v133;	// L113, [2,3)
      }
    }
  }
  for (int v134 = 0; v134 < 64; v134 += 1) {	// L117, [581897532,581975998), iterCycle=1226, II=1226
    for (int v135 = 0; v135 < 34; v135 += 1) {	// L118, [0,1226), iterCycle=36, II=36
      for (int v136 = 0; v136 < 34; v136 += 1) {	// L119, [0,36), iterCycle=1, II=1
        v19[v134][v135][v136] = v0;	// L120, [0,1)
      }
    }
  }
  for (int v137 = 0; v137 < 64; v137 += 1) {	// L124, [581975998,582176832), iterCycle=3138, II=3138
    for (int v138 = 0; v138 < 32; v138 += 1) {	// L125, [0,3138), iterCycle=98, II=98
      for (int v139 = 0; v139 < 32; v139 += 1) {	// L126, [0,98), iterCycle=3, II=3
        float v140 = v18[v137][v138][v139];	// L127, [0,2)
        v19[v137][(v138 + 1)][(v139 + 1)] = v140;	// L128, [2,3)
      }
    }
  }
  for (int v141 = 0; v141 < 128; v141 += 1) {	// L132, [582176832,582316354), iterCycle=1090, II=1090
    for (int v142 = 0; v142 < 32; v142 += 1) {	// L133, [0,1090), iterCycle=34, II=34
      for (int v143 = 0; v143 < 32; v143 += 1) {	// L134, [0,34), iterCycle=1, II=1
        v21[v141][v142][v143] = v0;	// L135, [0,1)
      }
    }
  }
  for (int v144 = 0; v144 < 128; v144 += 1) {	// L139, [582316354,1555665476), iterCycle=7604290, II=7604290
    for (int v145 = 0; v145 < 32; v145 += 1) {	// L140, [0,7604290), iterCycle=237634, II=237634
      for (int v146 = 0; v146 < 32; v146 += 1) {	// L141, [0,237634), iterCycle=7426, II=7426
        for (int v147 = 0; v147 < 64; v147 += 1) {	// L142, [0,7426), iterCycle=116, II=116
          for (int v148 = 0; v148 < 3; v148 += 1) {	// L143, [0,116), iterCycle=38, II=38
            for (int v149 = 0; v149 < 3; v149 += 1) {	// L144, [0,38), iterCycle=12, II=12
              float v150 = v19[v147][(v145 + v148)][(v146 + v149)];	// L145, [0,2)
              float v151 = v7[v144][v147][v148][v149];	// L146, [0,2)
              float v152 = v150 * v151;	// L147, [2,6)
              float v153 = v21[v144][v145][v146];	// L148, [4,6)
              float v154 = v152 + v153;	// L149, [6,11)
              v21[v144][v145][v146] = v154;	// L150, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v155 = 0; v155 < 128; v155 += 1) {	// L157, [1555665476,1556067142), iterCycle=3138, II=3138
    for (int v156 = 0; v156 < 32; v156 += 1) {	// L158, [0,3138), iterCycle=98, II=98
      for (int v157 = 0; v157 < 32; v157 += 1) {	// L159, [0,98), iterCycle=3, II=3
        float v158 = v21[v155][v156][v157];	// L160, [0,2)
        v22[v155][v156][v157] = v158;	// L161, [2,3)
      }
    }
  }
  for (int v159 = 0; v159 < 128; v159 += 1) {	// L165, [1556067142,1556468808), iterCycle=3138, II=3138
    for (int v160 = 0; v160 < 32; v160 += 1) {	// L166, [0,3138), iterCycle=98, II=98
      for (int v161 = 0; v161 < 32; v161 += 1) {	// L167, [0,98), iterCycle=3, II=3
        float v162 = v22[v159][v160][v161];	// L168, [0,2)
        float v163 = max(v162, v0);	// L169, [2,2)
        v23[v159][v160][v161] = v163;	// L170, [2,3)
      }
    }
  }
  for (int v164 = 0; v164 < 128; v164 += 1) {	// L174, [1556468808,1556625738), iterCycle=1226, II=1226
    for (int v165 = 0; v165 < 34; v165 += 1) {	// L175, [0,1226), iterCycle=36, II=36
      for (int v166 = 0; v166 < 34; v166 += 1) {	// L176, [0,36), iterCycle=1, II=1
        v24[v164][v165][v166] = v0;	// L177, [0,1)
      }
    }
  }
  for (int v167 = 0; v167 < 128; v167 += 1) {	// L181, [1556625738,1557027404), iterCycle=3138, II=3138
    for (int v168 = 0; v168 < 32; v168 += 1) {	// L182, [0,3138), iterCycle=98, II=98
      for (int v169 = 0; v169 < 32; v169 += 1) {	// L183, [0,98), iterCycle=3, II=3
        float v170 = v23[v167][v168][v169];	// L184, [0,2)
        v24[v167][(v168 + 1)][(v169 + 1)] = v170;	// L185, [2,3)
      }
    }
  }
  for (int v171 = 0; v171 < 128; v171 += 1) {	// L189, [1557027404,1557064526), iterCycle=290, II=290
    for (int v172 = 0; v172 < 16; v172 += 1) {	// L190, [0,290), iterCycle=18, II=18
      for (int v173 = 0; v173 < 16; v173 += 1) {	// L191, [0,18), iterCycle=1, II=1
        v25[v171][v172][v173] = v0;	// L192, [0,1)
      }
    }
  }
  for (int v174 = 0; v174 < 128; v174 += 1) {	// L196, [1557064526,2043673680), iterCycle=3801634, II=3801634
    for (int v175 = 0; v175 < 16; v175 += 1) {	// L197, [0,3801634), iterCycle=237602, II=237602
      for (int v176 = 0; v176 < 16; v176 += 1) {	// L198, [0,237602), iterCycle=14850, II=14850
        for (int v177 = 0; v177 < 128; v177 += 1) {	// L199, [0,14850), iterCycle=116, II=116
          for (int v178 = 0; v178 < 3; v178 += 1) {	// L200, [0,116), iterCycle=38, II=38
            for (int v179 = 0; v179 < 3; v179 += 1) {	// L201, [0,38), iterCycle=12, II=12
              float v180 = v24[v177][((v175 * 2) + v178)][((v176 * 2) + v179)];	// L202, [0,2)
              float v181 = v6[v174][v177][v178][v179];	// L203, [0,2)
              float v182 = v180 * v181;	// L204, [2,6)
              float v183 = v25[v174][v175][v176];	// L205, [4,6)
              float v184 = v182 + v183;	// L206, [6,11)
              v25[v174][v175][v176] = v184;	// L207, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v185 = 0; v185 < 128; v185 += 1) {	// L214, [2043673680,2043776338), iterCycle=802, II=802
    for (int v186 = 0; v186 < 16; v186 += 1) {	// L215, [0,802), iterCycle=50, II=50
      for (int v187 = 0; v187 < 16; v187 += 1) {	// L216, [0,50), iterCycle=3, II=3
        float v188 = v25[v185][v186][v187];	// L217, [0,2)
        v26[v185][v186][v187] = v188;	// L218, [2,3)
      }
    }
  }
  for (int v189 = 0; v189 < 128; v189 += 1) {	// L222, [2043776338,2043878996), iterCycle=802, II=802
    for (int v190 = 0; v190 < 16; v190 += 1) {	// L223, [0,802), iterCycle=50, II=50
      for (int v191 = 0; v191 < 16; v191 += 1) {	// L224, [0,50), iterCycle=3, II=3
        float v192 = v26[v189][v190][v191];	// L225, [0,2)
        float v193 = max(v192, v0);	// L226, [2,2)
        v27[v189][v190][v191] = v193;	// L227, [2,3)
      }
    }
  }
  for (int v194 = 0; v194 < 128; v194 += 1) {	// L231, [2043878996,2043925334), iterCycle=362, II=362
    for (int v195 = 0; v195 < 18; v195 += 1) {	// L232, [0,362), iterCycle=20, II=20
      for (int v196 = 0; v196 < 18; v196 += 1) {	// L233, [0,20), iterCycle=1, II=1
        v28[v194][v195][v196] = v0;	// L234, [0,1)
      }
    }
  }
  for (int v197 = 0; v197 < 128; v197 += 1) {	// L238, [2043925334,2044027992), iterCycle=802, II=802
    for (int v198 = 0; v198 < 16; v198 += 1) {	// L239, [0,802), iterCycle=50, II=50
      for (int v199 = 0; v199 < 16; v199 += 1) {	// L240, [0,50), iterCycle=3, II=3
        float v200 = v27[v197][v198][v199];	// L241, [0,2)
        v28[v197][(v198 + 1)][(v199 + 1)] = v200;	// L242, [2,3)
      }
    }
  }
  for (int v201 = 0; v201 < 256; v201 += 1) {	// L246, [2044027992,2044102234), iterCycle=290, II=290
    for (int v202 = 0; v202 < 16; v202 += 1) {	// L247, [0,290), iterCycle=18, II=18
      for (int v203 = 0; v203 < 16; v203 += 1) {	// L248, [0,18), iterCycle=1, II=1
        v30[v201][v202][v203] = v0;	// L249, [0,1)
      }
    }
  }
  for (int v204 = 0; v204 < 256; v204 += 1) {	// L253, [2044102234,3017320540), iterCycle=3801634, II=3801634
    for (int v205 = 0; v205 < 16; v205 += 1) {	// L254, [0,3801634), iterCycle=237602, II=237602
      for (int v206 = 0; v206 < 16; v206 += 1) {	// L255, [0,237602), iterCycle=14850, II=14850
        for (int v207 = 0; v207 < 128; v207 += 1) {	// L256, [0,14850), iterCycle=116, II=116
          for (int v208 = 0; v208 < 3; v208 += 1) {	// L257, [0,116), iterCycle=38, II=38
            for (int v209 = 0; v209 < 3; v209 += 1) {	// L258, [0,38), iterCycle=12, II=12
              float v210 = v28[v207][(v205 + v208)][(v206 + v209)];	// L259, [0,2)
              float v211 = v5[v204][v207][v208][v209];	// L260, [0,2)
              float v212 = v210 * v211;	// L261, [2,6)
              float v213 = v30[v204][v205][v206];	// L262, [4,6)
              float v214 = v212 + v213;	// L263, [6,11)
              v30[v204][v205][v206] = v214;	// L264, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v215 = 0; v215 < 256; v215 += 1) {	// L271, [3017320540,3017525854), iterCycle=802, II=802
    for (int v216 = 0; v216 < 16; v216 += 1) {	// L272, [0,802), iterCycle=50, II=50
      for (int v217 = 0; v217 < 16; v217 += 1) {	// L273, [0,50), iterCycle=3, II=3
        float v218 = v30[v215][v216][v217];	// L274, [0,2)
        v31[v215][v216][v217] = v218;	// L275, [2,3)
      }
    }
  }
  for (int v219 = 0; v219 < 256; v219 += 1) {	// L279, [3017525854,3017731168), iterCycle=802, II=802
    for (int v220 = 0; v220 < 16; v220 += 1) {	// L280, [0,802), iterCycle=50, II=50
      for (int v221 = 0; v221 < 16; v221 += 1) {	// L281, [0,50), iterCycle=3, II=3
        float v222 = v31[v219][v220][v221];	// L282, [0,2)
        float v223 = max(v222, v0);	// L283, [2,2)
        v32[v219][v220][v221] = v223;	// L284, [2,3)
      }
    }
  }
  for (int v224 = 0; v224 < 256; v224 += 1) {	// L288, [3017731168,3017823842), iterCycle=362, II=362
    for (int v225 = 0; v225 < 18; v225 += 1) {	// L289, [0,362), iterCycle=20, II=20
      for (int v226 = 0; v226 < 18; v226 += 1) {	// L290, [0,20), iterCycle=1, II=1
        v33[v224][v225][v226] = v0;	// L291, [0,1)
      }
    }
  }
  for (int v227 = 0; v227 < 256; v227 += 1) {	// L295, [3017823842,3018029156), iterCycle=802, II=802
    for (int v228 = 0; v228 < 16; v228 += 1) {	// L296, [0,802), iterCycle=50, II=50
      for (int v229 = 0; v229 < 16; v229 += 1) {	// L297, [0,50), iterCycle=3, II=3
        float v230 = v32[v227][v228][v229];	// L298, [0,2)
        v33[v227][(v228 + 1)][(v229 + 1)] = v230;	// L299, [2,3)
      }
    }
  }
  for (int v231 = 0; v231 < 256; v231 += 1) {	// L303, [3018029156,4964325990), iterCycle=7602722, II=7602722
    for (int v232 = 0; v232 < 16; v232 += 1) {	// L304, [0,7602722), iterCycle=475170, II=475170
      for (int v233 = 0; v233 < 16; v233 += 1) {	// L305, [0,475170), iterCycle=29698, II=29698
        for (int v234 = 0; v234 < 256; v234 += 1) {	// L306, [0,29698), iterCycle=116, II=116
          for (int v235 = 0; v235 < 3; v235 += 1) {	// L307, [0,116), iterCycle=38, II=38
            for (int v236 = 0; v236 < 3; v236 += 1) {	// L308, [0,38), iterCycle=12, II=12
              float v237 = v33[v234][(v232 + v235)][(v233 + v236)];	// L309, [0,2)
              float v238 = v4[v231][v234][v235][v236];	// L310, [0,2)
              float v239 = v237 * v238;	// L311, [2,6)
              float v240 = v30[v231][v232][v233];	// L312, [4,6)
              float v241 = v239 + v240;	// L313, [6,11)
              v30[v231][v232][v233] = v241;	// L314, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v242 = 0; v242 < 256; v242 += 1) {	// L321, [4964325990,4964531304), iterCycle=802, II=802
    for (int v243 = 0; v243 < 16; v243 += 1) {	// L322, [0,802), iterCycle=50, II=50
      for (int v244 = 0; v244 < 16; v244 += 1) {	// L323, [0,50), iterCycle=3, II=3
        float v245 = v30[v242][v243][v244];	// L324, [0,2)
        v34[v242][v243][v244] = v245;	// L325, [2,3)
      }
    }
  }
  for (int v246 = 0; v246 < 256; v246 += 1) {	// L329, [4964531304,4964736618), iterCycle=802, II=802
    for (int v247 = 0; v247 < 16; v247 += 1) {	// L330, [0,802), iterCycle=50, II=50
      for (int v248 = 0; v248 < 16; v248 += 1) {	// L331, [0,50), iterCycle=3, II=3
        float v249 = v34[v246][v247][v248];	// L332, [0,2)
        float v250 = max(v249, v0);	// L333, [2,2)
        v35[v246][v247][v248] = v250;	// L334, [2,3)
      }
    }
  }
  for (int v251 = 0; v251 < 256; v251 += 1) {	// L338, [4964736618,4964829292), iterCycle=362, II=362
    for (int v252 = 0; v252 < 18; v252 += 1) {	// L339, [0,362), iterCycle=20, II=20
      for (int v253 = 0; v253 < 18; v253 += 1) {	// L340, [0,20), iterCycle=1, II=1
        v36[v251][v252][v253] = v0;	// L341, [0,1)
      }
    }
  }
  for (int v254 = 0; v254 < 256; v254 += 1) {	// L345, [4964829292,4965034606), iterCycle=802, II=802
    for (int v255 = 0; v255 < 16; v255 += 1) {	// L346, [0,802), iterCycle=50, II=50
      for (int v256 = 0; v256 < 16; v256 += 1) {	// L347, [0,50), iterCycle=3, II=3
        float v257 = v35[v254][v255][v256];	// L348, [0,2)
        v36[v254][(v255 + 1)][(v256 + 1)] = v257;	// L349, [2,3)
      }
    }
  }
  for (int v258 = 0; v258 < 256; v258 += 1) {	// L353, [4965034606,4965055600), iterCycle=82, II=82
    for (int v259 = 0; v259 < 8; v259 += 1) {	// L354, [0,82), iterCycle=10, II=10
      for (int v260 = 0; v260 < 8; v260 += 1) {	// L355, [0,10), iterCycle=1, II=1
        v37[v258][v259][v260] = v0;	// L356, [0,1)
      }
    }
  }
  for (int v261 = 0; v261 < 256; v261 += 1) {	// L360, [4965055600,5451632242), iterCycle=1900690, II=1900690
    for (int v262 = 0; v262 < 8; v262 += 1) {	// L361, [0,1900690), iterCycle=237586, II=237586
      for (int v263 = 0; v263 < 8; v263 += 1) {	// L362, [0,237586), iterCycle=29698, II=29698
        for (int v264 = 0; v264 < 256; v264 += 1) {	// L363, [0,29698), iterCycle=116, II=116
          for (int v265 = 0; v265 < 3; v265 += 1) {	// L364, [0,116), iterCycle=38, II=38
            for (int v266 = 0; v266 < 3; v266 += 1) {	// L365, [0,38), iterCycle=12, II=12
              float v267 = v36[v264][((v262 * 2) + v265)][((v263 * 2) + v266)];	// L366, [0,2)
              float v268 = v73[v261][v264][v265][v266];	// L367, [0,2)
              float v269 = v267 * v268;	// L368, [2,6)
              float v270 = v37[v261][v262][v263];	// L369, [4,6)
              float v271 = v269 + v270;	// L370, [6,11)
              v37[v261][v262][v263] = v271;	// L371, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v272 = 0; v272 < 256; v272 += 1) {	// L378, [5451632242,5451686004), iterCycle=210, II=210
    for (int v273 = 0; v273 < 8; v273 += 1) {	// L379, [0,210), iterCycle=26, II=26
      for (int v274 = 0; v274 < 8; v274 += 1) {	// L380, [0,26), iterCycle=3, II=3
        float v275 = v37[v272][v273][v274];	// L381, [0,2)
        v38[v272][v273][v274] = v275;	// L382, [2,3)
      }
    }
  }
  for (int v276 = 0; v276 < 256; v276 += 1) {	// L386, [5451686004,5451739766), iterCycle=210, II=210
    for (int v277 = 0; v277 < 8; v277 += 1) {	// L387, [0,210), iterCycle=26, II=26
      for (int v278 = 0; v278 < 8; v278 += 1) {	// L388, [0,26), iterCycle=3, II=3
        float v279 = v38[v276][v277][v278];	// L389, [0,2)
        float v280 = max(v279, v0);	// L390, [2,2)
        v40[v276][v277][v278] = v280;	// L391, [2,3)
      }
    }
  }
  for (int v281 = 0; v281 < 256; v281 += 1) {	// L395, [5451739766,5451771000), iterCycle=122, II=122
    for (int v282 = 0; v282 < 10; v282 += 1) {	// L396, [0,122), iterCycle=12, II=12
      for (int v283 = 0; v283 < 10; v283 += 1) {	// L397, [0,12), iterCycle=1, II=1
        v41[v281][v282][v283] = v0;	// L398, [0,1)
      }
    }
  }
  for (int v284 = 0; v284 < 256; v284 += 1) {	// L402, [5451771000,5451824762), iterCycle=210, II=210
    for (int v285 = 0; v285 < 8; v285 += 1) {	// L403, [0,210), iterCycle=26, II=26
      for (int v286 = 0; v286 < 8; v286 += 1) {	// L404, [0,26), iterCycle=3, II=3
        float v287 = v40[v284][v285][v286];	// L405, [0,2)
        v41[v284][(v285 + 1)][(v286 + 1)] = v287;	// L406, [2,3)
      }
    }
  }
  for (int v288 = 0; v288 < 512; v288 += 1) {	// L410, [5451824762,5451866748), iterCycle=82, II=82
    for (int v289 = 0; v289 < 8; v289 += 1) {	// L411, [0,82), iterCycle=10, II=10
      for (int v290 = 0; v290 < 8; v290 += 1) {	// L412, [0,10), iterCycle=1, II=1
        v42[v288][v289][v290] = v0;	// L413, [0,1)
      }
    }
  }
  for (int v291 = 0; v291 < 512; v291 += 1) {	// L417, [5451866748,6425020030), iterCycle=1900690, II=1900690
    for (int v292 = 0; v292 < 8; v292 += 1) {	// L418, [0,1900690), iterCycle=237586, II=237586
      for (int v293 = 0; v293 < 8; v293 += 1) {	// L419, [0,237586), iterCycle=29698, II=29698
        for (int v294 = 0; v294 < 256; v294 += 1) {	// L420, [0,29698), iterCycle=116, II=116
          for (int v295 = 0; v295 < 3; v295 += 1) {	// L421, [0,116), iterCycle=38, II=38
            for (int v296 = 0; v296 < 3; v296 += 1) {	// L422, [0,38), iterCycle=12, II=12
              float v297 = v41[v294][(v292 + v295)][(v293 + v296)];	// L423, [0,2)
              float v298 = v67[v291][v294][v295][v296];	// L424, [0,2)
              float v299 = v297 * v298;	// L425, [2,6)
              float v300 = v42[v291][v292][v293];	// L426, [4,6)
              float v301 = v299 + v300;	// L427, [6,11)
              v42[v291][v292][v293] = v301;	// L428, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v302 = 0; v302 < 512; v302 += 1) {	// L435, [6425020030,6425127552), iterCycle=210, II=210
    for (int v303 = 0; v303 < 8; v303 += 1) {	// L436, [0,210), iterCycle=26, II=26
      for (int v304 = 0; v304 < 8; v304 += 1) {	// L437, [0,26), iterCycle=3, II=3
        float v305 = v42[v302][v303][v304];	// L438, [0,2)
        v43[v302][v303][v304] = v305;	// L439, [2,3)
      }
    }
  }
  for (int v306 = 0; v306 < 512; v306 += 1) {	// L443, [6425127552,6425235074), iterCycle=210, II=210
    for (int v307 = 0; v307 < 8; v307 += 1) {	// L444, [0,210), iterCycle=26, II=26
      for (int v308 = 0; v308 < 8; v308 += 1) {	// L445, [0,26), iterCycle=3, II=3
        float v309 = v43[v306][v307][v308];	// L446, [0,2)
        float v310 = max(v309, v0);	// L447, [2,2)
        v44[v306][v307][v308] = v310;	// L448, [2,3)
      }
    }
  }
  for (int v311 = 0; v311 < 512; v311 += 1) {	// L452, [6425235074,6425297540), iterCycle=122, II=122
    for (int v312 = 0; v312 < 10; v312 += 1) {	// L453, [0,122), iterCycle=12, II=12
      for (int v313 = 0; v313 < 10; v313 += 1) {	// L454, [0,12), iterCycle=1, II=1
        v45[v311][v312][v313] = v0;	// L455, [0,1)
      }
    }
  }
  for (int v314 = 0; v314 < 512; v314 += 1) {	// L459, [6425297540,6425405062), iterCycle=210, II=210
    for (int v315 = 0; v315 < 8; v315 += 1) {	// L460, [0,210), iterCycle=26, II=26
      for (int v316 = 0; v316 < 8; v316 += 1) {	// L461, [0,26), iterCycle=3, II=3
        float v317 = v44[v314][v315][v316];	// L462, [0,2)
        v45[v314][(v315 + 1)][(v316 + 1)] = v317;	// L463, [2,3)
      }
    }
  }
  for (int v318 = 0; v318 < 512; v318 += 1) {	// L467, [6425405062,8371636872), iterCycle=3801234, II=3801234
    for (int v319 = 0; v319 < 8; v319 += 1) {	// L468, [0,3801234), iterCycle=475154, II=475154
      for (int v320 = 0; v320 < 8; v320 += 1) {	// L469, [0,475154), iterCycle=59394, II=59394
        for (int v321 = 0; v321 < 512; v321 += 1) {	// L470, [0,59394), iterCycle=116, II=116
          for (int v322 = 0; v322 < 3; v322 += 1) {	// L471, [0,116), iterCycle=38, II=38
            for (int v323 = 0; v323 < 3; v323 += 1) {	// L472, [0,38), iterCycle=12, II=12
              float v324 = v45[v321][(v319 + v322)][(v320 + v323)];	// L473, [0,2)
              float v325 = v59[v318][v321][v322][v323];	// L474, [0,2)
              float v326 = v324 * v325;	// L475, [2,6)
              float v327 = v42[v318][v319][v320];	// L476, [4,6)
              float v328 = v326 + v327;	// L477, [6,11)
              v42[v318][v319][v320] = v328;	// L478, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v329 = 0; v329 < 512; v329 += 1) {	// L485, [8371636872,8371744394), iterCycle=210, II=210
    for (int v330 = 0; v330 < 8; v330 += 1) {	// L486, [0,210), iterCycle=26, II=26
      for (int v331 = 0; v331 < 8; v331 += 1) {	// L487, [0,26), iterCycle=3, II=3
        float v332 = v42[v329][v330][v331];	// L488, [0,2)
        v46[v329][v330][v331] = v332;	// L489, [2,3)
      }
    }
  }
  for (int v333 = 0; v333 < 512; v333 += 1) {	// L493, [8371744394,8371851916), iterCycle=210, II=210
    for (int v334 = 0; v334 < 8; v334 += 1) {	// L494, [0,210), iterCycle=26, II=26
      for (int v335 = 0; v335 < 8; v335 += 1) {	// L495, [0,26), iterCycle=3, II=3
        float v336 = v46[v333][v334][v335];	// L496, [0,2)
        float v337 = max(v336, v0);	// L497, [2,2)
        v47[v333][v334][v335] = v337;	// L498, [2,3)
      }
    }
  }
  for (int v338 = 0; v338 < 512; v338 += 1) {	// L502, [8371851916,8371914382), iterCycle=122, II=122
    for (int v339 = 0; v339 < 10; v339 += 1) {	// L503, [0,122), iterCycle=12, II=12
      for (int v340 = 0; v340 < 10; v340 += 1) {	// L504, [0,12), iterCycle=1, II=1
        v48[v338][v339][v340] = v0;	// L505, [0,1)
      }
    }
  }
  for (int v341 = 0; v341 < 512; v341 += 1) {	// L509, [8371914382,8372021904), iterCycle=210, II=210
    for (int v342 = 0; v342 < 8; v342 += 1) {	// L510, [0,210), iterCycle=26, II=26
      for (int v343 = 0; v343 < 8; v343 += 1) {	// L511, [0,26), iterCycle=3, II=3
        float v344 = v47[v341][v342][v343];	// L512, [0,2)
        v48[v341][(v342 + 1)][(v343 + 1)] = v344;	// L513, [2,3)
      }
    }
  }
  for (int v345 = 0; v345 < 512; v345 += 1) {	// L517, [8372021904,8372035218), iterCycle=26, II=26
    for (int v346 = 0; v346 < 4; v346 += 1) {	// L518, [0,26), iterCycle=6, II=6
      for (int v347 = 0; v347 < 4; v347 += 1) {	// L519, [0,6), iterCycle=1, II=1
        v50[v345][v346][v347] = v0;	// L520, [0,1)
      }
    }
  }
  for (int v348 = 0; v348 < 512; v348 += 1) {	// L524, [8372035218,8858595988), iterCycle=950314, II=950314
    for (int v349 = 0; v349 < 4; v349 += 1) {	// L525, [0,950314), iterCycle=237578, II=237578
      for (int v350 = 0; v350 < 4; v350 += 1) {	// L526, [0,237578), iterCycle=59394, II=59394
        for (int v351 = 0; v351 < 512; v351 += 1) {	// L527, [0,59394), iterCycle=116, II=116
          for (int v352 = 0; v352 < 3; v352 += 1) {	// L528, [0,116), iterCycle=38, II=38
            for (int v353 = 0; v353 < 3; v353 += 1) {	// L529, [0,38), iterCycle=12, II=12
              float v354 = v48[v351][((v349 * 2) + v352)][((v350 * 2) + v353)];	// L530, [0,2)
              float v355 = v49[v348][v351][v352][v353];	// L531, [0,2)
              float v356 = v354 * v355;	// L532, [2,6)
              float v357 = v50[v348][v349][v350];	// L533, [4,6)
              float v358 = v356 + v357;	// L534, [6,11)
              v50[v348][v349][v350] = v358;	// L535, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v359 = 0; v359 < 512; v359 += 1) {	// L542, [8858595988,8858625686), iterCycle=58, II=58
    for (int v360 = 0; v360 < 4; v360 += 1) {	// L543, [0,58), iterCycle=14, II=14
      for (int v361 = 0; v361 < 4; v361 += 1) {	// L544, [0,14), iterCycle=3, II=3
        float v362 = v50[v359][v360][v361];	// L545, [0,2)
        v51[v359][v360][v361] = v362;	// L546, [2,3)
      }
    }
  }
  for (int v363 = 0; v363 < 512; v363 += 1) {	// L550, [8858625686,8858655384), iterCycle=58, II=58
    for (int v364 = 0; v364 < 4; v364 += 1) {	// L551, [0,58), iterCycle=14, II=14
      for (int v365 = 0; v365 < 4; v365 += 1) {	// L552, [0,14), iterCycle=3, II=3
        float v366 = v51[v363][v364][v365];	// L553, [0,2)
        float v367 = max(v366, v0);	// L554, [2,2)
        v52[v363][v364][v365] = v367;	// L555, [2,3)
      }
    }
  }
  for (int v368 = 0; v368 < 512; v368 += 1) {	// L559, [8858655384,8858680986), iterCycle=50, II=50
    for (int v369 = 0; v369 < 6; v369 += 1) {	// L560, [0,50), iterCycle=8, II=8
      for (int v370 = 0; v370 < 6; v370 += 1) {	// L561, [0,8), iterCycle=1, II=1
        v53[v368][v369][v370] = v0;	// L562, [0,1)
      }
    }
  }
  for (int v371 = 0; v371 < 512; v371 += 1) {	// L566, [8858680986,8858710684), iterCycle=58, II=58
    for (int v372 = 0; v372 < 4; v372 += 1) {	// L567, [0,58), iterCycle=14, II=14
      for (int v373 = 0; v373 < 4; v373 += 1) {	// L568, [0,14), iterCycle=3, II=3
        float v374 = v52[v371][v372][v373];	// L569, [0,2)
        v53[v371][(v372 + 1)][(v373 + 1)] = v374;	// L570, [2,3)
      }
    }
  }
  for (int v375 = 0; v375 < 512; v375 += 1) {	// L574, [8858710684,9345271454), iterCycle=950314, II=950314
    for (int v376 = 0; v376 < 4; v376 += 1) {	// L575, [0,950314), iterCycle=237578, II=237578
      for (int v377 = 0; v377 < 4; v377 += 1) {	// L576, [0,237578), iterCycle=59394, II=59394
        for (int v378 = 0; v378 < 512; v378 += 1) {	// L577, [0,59394), iterCycle=116, II=116
          for (int v379 = 0; v379 < 3; v379 += 1) {	// L578, [0,116), iterCycle=38, II=38
            for (int v380 = 0; v380 < 3; v380 += 1) {	// L579, [0,38), iterCycle=12, II=12
              float v381 = v53[v378][(v376 + v379)][(v377 + v380)];	// L580, [0,2)
              float v382 = v39[v375][v378][v379][v380];	// L581, [0,2)
              float v383 = v381 * v382;	// L582, [2,6)
              float v384 = v50[v375][v376][v377];	// L583, [4,6)
              float v385 = v383 + v384;	// L584, [6,11)
              v50[v375][v376][v377] = v385;	// L585, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v386 = 0; v386 < 512; v386 += 1) {	// L592, [9345271454,9345301152), iterCycle=58, II=58
    for (int v387 = 0; v387 < 4; v387 += 1) {	// L593, [0,58), iterCycle=14, II=14
      for (int v388 = 0; v388 < 4; v388 += 1) {	// L594, [0,14), iterCycle=3, II=3
        float v389 = v50[v386][v387][v388];	// L595, [0,2)
        v54[v386][v387][v388] = v389;	// L596, [2,3)
      }
    }
  }
  for (int v390 = 0; v390 < 512; v390 += 1) {	// L600, [9345301152,9345330850), iterCycle=58, II=58
    for (int v391 = 0; v391 < 4; v391 += 1) {	// L601, [0,58), iterCycle=14, II=14
      for (int v392 = 0; v392 < 4; v392 += 1) {	// L602, [0,14), iterCycle=3, II=3
        float v393 = v54[v390][v391][v392];	// L603, [0,2)
        float v394 = max(v393, v0);	// L604, [2,2)
        v55[v390][v391][v392] = v394;	// L605, [2,3)
      }
    }
  }
  for (int v395 = 0; v395 < 512; v395 += 1) {	// L609, [9345330850,9345356452), iterCycle=50, II=50
    for (int v396 = 0; v396 < 6; v396 += 1) {	// L610, [0,50), iterCycle=8, II=8
      for (int v397 = 0; v397 < 6; v397 += 1) {	// L611, [0,8), iterCycle=1, II=1
        v56[v395][v396][v397] = v0;	// L612, [0,1)
      }
    }
  }
  for (int v398 = 0; v398 < 512; v398 += 1) {	// L616, [9345356452,9345386150), iterCycle=58, II=58
    for (int v399 = 0; v399 < 4; v399 += 1) {	// L617, [0,58), iterCycle=14, II=14
      for (int v400 = 0; v400 < 4; v400 += 1) {	// L618, [0,14), iterCycle=3, II=3
        float v401 = v55[v398][v399][v400];	// L619, [0,2)
        v56[v398][(v399 + 1)][(v400 + 1)] = v401;	// L620, [2,3)
      }
    }
  }
  for (int v402 = 0; v402 < 512; v402 += 1) {	// L624, [9345386150,9831946920), iterCycle=950314, II=950314
    for (int v403 = 0; v403 < 4; v403 += 1) {	// L625, [0,950314), iterCycle=237578, II=237578
      for (int v404 = 0; v404 < 4; v404 += 1) {	// L626, [0,237578), iterCycle=59394, II=59394
        for (int v405 = 0; v405 < 512; v405 += 1) {	// L627, [0,59394), iterCycle=116, II=116
          for (int v406 = 0; v406 < 3; v406 += 1) {	// L628, [0,116), iterCycle=38, II=38
            for (int v407 = 0; v407 < 3; v407 += 1) {	// L629, [0,38), iterCycle=12, II=12
              float v408 = v56[v405][(v403 + v406)][(v404 + v407)];	// L630, [0,2)
              float v409 = v29[v402][v405][v406][v407];	// L631, [0,2)
              float v410 = v408 * v409;	// L632, [2,6)
              float v411 = v50[v402][v403][v404];	// L633, [4,6)
              float v412 = v410 + v411;	// L634, [6,11)
              v50[v402][v403][v404] = v412;	// L635, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v413 = 0; v413 < 512; v413 += 1) {	// L642, [9831946920,9831976618), iterCycle=58, II=58
    for (int v414 = 0; v414 < 4; v414 += 1) {	// L643, [0,58), iterCycle=14, II=14
      for (int v415 = 0; v415 < 4; v415 += 1) {	// L644, [0,14), iterCycle=3, II=3
        float v416 = v50[v413][v414][v415];	// L645, [0,2)
        v57[v413][v414][v415] = v416;	// L646, [2,3)
      }
    }
  }
  for (int v417 = 0; v417 < 512; v417 += 1) {	// L650, [9831976618,9832006316), iterCycle=58, II=58
    for (int v418 = 0; v418 < 4; v418 += 1) {	// L651, [0,58), iterCycle=14, II=14
      for (int v419 = 0; v419 < 4; v419 += 1) {	// L652, [0,14), iterCycle=3, II=3
        float v420 = v57[v417][v418][v419];	// L653, [0,2)
        float v421 = max(v420, v0);	// L654, [2,2)
        v58[v417][v418][v419] = v421;	// L655, [2,3)
      }
    }
  }
  for (int v422 = 0; v422 < 512; v422 += 1) {	// L659, [9832006316,9832031918), iterCycle=50, II=50
    for (int v423 = 0; v423 < 6; v423 += 1) {	// L660, [0,50), iterCycle=8, II=8
      for (int v424 = 0; v424 < 6; v424 += 1) {	// L661, [0,8), iterCycle=1, II=1
        v60[v422][v423][v424] = v0;	// L662, [0,1)
      }
    }
  }
  for (int v425 = 0; v425 < 512; v425 += 1) {	// L666, [9832031918,9832061616), iterCycle=58, II=58
    for (int v426 = 0; v426 < 4; v426 += 1) {	// L667, [0,58), iterCycle=14, II=14
      for (int v427 = 0; v427 < 4; v427 += 1) {	// L668, [0,14), iterCycle=3, II=3
        float v428 = v58[v425][v426][v427];	// L669, [0,2)
        v60[v425][(v426 + 1)][(v427 + 1)] = v428;	// L670, [2,3)
      }
    }
  }
  for (int v429 = 0; v429 < 512; v429 += 1) {	// L674, [9832061616,9832066738), iterCycle=10, II=10
    for (int v430 = 0; v430 < 2; v430 += 1) {	// L675, [0,10), iterCycle=4, II=4
      for (int v431 = 0; v431 < 2; v431 += 1) {	// L676, [0,4), iterCycle=1, II=1
        v61[v429][v430][v431] = v0;	// L677, [0,1)
      }
    }
  }
  for (int v432 = 0; v432 < 512; v432 += 1) {	// L681, [9832066738,9953708724), iterCycle=237582, II=237582
    for (int v433 = 0; v433 < 2; v433 += 1) {	// L682, [0,237582), iterCycle=118790, II=118790
      for (int v434 = 0; v434 < 2; v434 += 1) {	// L683, [0,118790), iterCycle=59394, II=59394
        for (int v435 = 0; v435 < 512; v435 += 1) {	// L684, [0,59394), iterCycle=116, II=116
          for (int v436 = 0; v436 < 3; v436 += 1) {	// L685, [0,116), iterCycle=38, II=38
            for (int v437 = 0; v437 < 3; v437 += 1) {	// L686, [0,38), iterCycle=12, II=12
              float v438 = v60[v435][((v433 * 2) + v436)][((v434 * 2) + v437)];	// L687, [0,2)
              float v439 = v20[v432][v435][v436][v437];	// L688, [0,2)
              float v440 = v438 * v439;	// L689, [2,6)
              float v441 = v61[v432][v433][v434];	// L690, [4,6)
              float v442 = v440 + v441;	// L691, [6,11)
              v61[v432][v433][v434] = v442;	// L692, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v443 = 0; v443 < 512; v443 += 1) {	// L699, [9953708724,9953717942), iterCycle=18, II=18
    for (int v444 = 0; v444 < 2; v444 += 1) {	// L700, [0,18), iterCycle=8, II=8
      for (int v445 = 0; v445 < 2; v445 += 1) {	// L701, [0,8), iterCycle=3, II=3
        float v446 = v61[v443][v444][v445];	// L702, [0,2)
        v62[v443][v444][v445] = v446;	// L703, [2,3)
      }
    }
  }
  for (int v447 = 0; v447 < 512; v447 += 1) {	// L707, [9953717942,9953727160), iterCycle=18, II=18
    for (int v448 = 0; v448 < 2; v448 += 1) {	// L708, [0,18), iterCycle=8, II=8
      for (int v449 = 0; v449 < 2; v449 += 1) {	// L709, [0,8), iterCycle=3, II=3
        float v450 = v62[v447][v448][v449];	// L710, [0,2)
        float v451 = max(v450, v0);	// L711, [2,2)
        v63[v447][v448][v449] = v451;	// L712, [2,3)
      }
    }
  }
  for (int v452 = 0; v452 < 512; v452 += 1) {	// L716, [9953727160,9953727674), iterCycle=1, II=1
    v64[v452] = v0;	// L717, [0,1)
  }
  for (int v453 = 0; v453 < 512; v453 += 1) {	// L719, [9953727674,9953747132), iterCycle=38, II=38
    for (int v454 = 0; v454 < 2; v454 += 1) {	// L720, [0,38), iterCycle=18, II=18
      for (int v455 = 0; v455 < 2; v455 += 1) {	// L721, [0,18), iterCycle=8, II=8
        float v456 = v64[v453];	// L722, [0,2)
        float v457 = v63[v453][v454][v455];	// L723, [0,2)
        float v458 = v456 + v457;	// L724, [2,7)
        v64[v453] = v458;	// L725, [7,8)
      }
    }
  }
  for (int v459 = 0; v459 < 512; v459 += 1) {	// L729, [9953747132,9953748670), iterCycle=3, II=3
    float v460 = v64[v459];	// L730, [0,2)
    v65[v459] = v460;	// L731, [2,3)
  }
  for (int v461 = 0; v461 < 512; v461 += 1) {	// L733, [9953748670,9953752256), iterCycle=7, II=7
    float v462 = v65[v461];	// L734, [0,2)
    float v463 = v462 * v1;	// L735, [2,6)
    v66[v461] = v463;	// L736, [6,7)
  }
  for (int v464 = 0; v464 < 512; v464 += 1) {	// L738, [9953752256,9953753794), iterCycle=3, II=3
    float v465 = v66[v464];	// L739, [0,2)
    v68[v464] = v465;	// L740, [2,3)
  }
  for (int v466 = 0; v466 < 10; v466 += 1) {	// L742, [9953753794,9953769176), iterCycle=1538, II=1538
    for (int v467 = 0; v467 < 512; v467 += 1) {	// L743, [0,1538), iterCycle=3, II=3
      float v468 = v11[v466][v467];	// L744, [0,2)
      v69[v467][v466] = v468;	// L745, [2,3)
    }
  }
  for (int v469 = 0; v469 < 10; v469 += 1) {	// L748, [9953769176,9953769188), iterCycle=1, II=1
    v70[v469] = v0;	// L749, [0,1)
  }
  for (int v470 = 0; v470 < 10; v470 += 1) {	// L751, [9953769188,9953830650), iterCycle=6146, II=6146
    for (int v471 = 0; v471 < 512; v471 += 1) {	// L752, [0,6146), iterCycle=12, II=12
      float v472 = v68[v471];	// L753, [0,2)
      float v473 = v69[v471][v470];	// L754, [0,2)
      float v474 = v472 * v473;	// L755, [2,6)
      float v475 = v70[v470];	// L756, [4,6)
      float v476 = v474 + v475;	// L757, [6,11)
      v70[v470] = v476;	// L758, [11,12)
    }
  }
  for (int v477 = 0; v477 < 10; v477 += 1) {	// L761, [9953830650,9953830682), iterCycle=3, II=3
    float v478 = v70[v477];	// L762, [0,2)
    v71[v477] = v478;	// L763, [2,3)
  }
  for (int v479 = 0; v479 < 10; v479 += 1) {	// L765, [9953830682,9953830764), iterCycle=8, II=8
    float v480 = v71[v479];	// L766, [0,2)
    float v481 = v3[v479];	// L767, [0,2)
    float v482 = v480 + v481;	// L768, [2,7)
    v72[v479] = v482;	// L769, [7,8)
  }
}

