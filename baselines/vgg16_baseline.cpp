
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
/// Latency=4039725668, interval=4039725668
/// DSP=5, BRAM=0
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
) {
#pragma HLS PIPELINE off
	// L2, [0,4039725668)
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

  #pragma HLS resource variable=v1 core=ram_s2p_bram

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

  for (int v29 = 0; v29 < 64; v29 += 1) {	// L3, [0,69762), iterCycle=1090, II=1090
    for (int v30 = 0; v30 < 32; v30 += 1) {	// L4, [0,1090), iterCycle=34, II=34
      for (int v31 = 0; v31 < 32; v31 += 1) {	// L5, [0,34), iterCycle=1, II=1
        v10[v29][v30][v31] = v0;	// L6, [0,1)
      }
    }
  }
  for (int v32 = 0; v32 < 64; v32 += 1) {	// L10, [69762,23011588), iterCycle=358466, II=358466
    for (int v33 = 0; v33 < 32; v33 += 1) {	// L11, [0,358466), iterCycle=11202, II=11202
      for (int v34 = 0; v34 < 32; v34 += 1) {	// L12, [0,11202), iterCycle=350, II=350
        for (int v35 = 0; v35 < 3; v35 += 1) {	// L13, [0,350), iterCycle=116, II=116
          for (int v36 = 0; v36 < 3; v36 += 1) {	// L14, [0,116), iterCycle=38, II=38
            for (int v37 = 0; v37 < 3; v37 += 1) {	// L15, [0,38), iterCycle=12, II=12
              float v38 = v28[v35][(v33 + v36)][(v34 + v37)];	// L16, [0,2)
              float v39 = v1[v32][v35][v36][v37];	// L17, [0,2)
              float v40 = v38 * v39;	// L18, [2,6)
              float v41 = v10[v32][v33][v34];	// L19, [4,6)
              float v42 = v40 + v41;	// L20, [6,11)
              v10[v32][v33][v34] = v42;	// L21, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v43 = 0; v43 < 64; v43 += 1) {	// L28, [23011588,23212422), iterCycle=3138, II=3138
    for (int v44 = 0; v44 < 32; v44 += 1) {	// L29, [0,3138), iterCycle=98, II=98
      for (int v45 = 0; v45 < 32; v45 += 1) {	// L30, [0,98), iterCycle=3, II=3
        float v46 = v10[v43][v44][v45];	// L31, [0,2)
        v10[v43][v44][v45] = max(v46,v0);	// L32, [2,3)
      }
    }
  }
  for (int v47 = 0; v47 < 64; v47 += 1) {	// L36, [23212422,23282184), iterCycle=1090, II=1090
    for (int v48 = 0; v48 < 32; v48 += 1) {	// L37, [0,1090), iterCycle=34, II=34
      for (int v49 = 0; v49 < 32; v49 += 1) {	// L38, [0,34), iterCycle=1, II=1
        v20[v47][v48][v49] = v0;	// L39, [0,1)
      }
    }
  }
  for (int v50 = 0; v50 < 64; v50 += 1) {	// L43, [23282184,509956746), iterCycle=7604290, II=7604290
    for (int v51 = 0; v51 < 32; v51 += 1) {	// L44, [0,7604290), iterCycle=237634, II=237634
      for (int v52 = 0; v52 < 32; v52 += 1) {	// L45, [0,237634), iterCycle=7426, II=7426
        for (int v53 = 0; v53 < 64; v53 += 1) {	// L46, [0,7426), iterCycle=116, II=116
          for (int v54 = 0; v54 < 3; v54 += 1) {	// L47, [0,116), iterCycle=38, II=38
            for (int v55 = 0; v55 < 3; v55 += 1) {	// L48, [0,38), iterCycle=12, II=12
              float v56 = v10[v53][(v51 + v54)][(v52 + v55)];	// L49, [0,2)
              float v57 = v2[v50][v53][v54][v55];	// L50, [0,2)
              float v58 = v56 * v57;	// L51, [2,6)
              float v59 = v20[v50][v51][v52];	// L52, [4,6)
              float v60 = v58 + v59;	// L53, [6,11)
              v20[v50][v51][v52] = v60;	// L54, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v61 = 0; v61 < 64; v61 += 1) {	// L61, [509956746,510157580), iterCycle=3138, II=3138
    for (int v62 = 0; v62 < 32; v62 += 1) {	// L62, [0,3138), iterCycle=98, II=98
      for (int v63 = 0; v63 < 32; v63 += 1) {	// L63, [0,98), iterCycle=3, II=3
        float v64 = v20[v61][v62][v63];	// L64, [0,2)
        v20[v61][v62][v63] = max(v64,v0);	// L65, [2,3)
      }
    }
  }
  for (int v65 = 0; v65 < 64; v65 += 1) {	// L69, [510157580,510176142), iterCycle=290, II=290
    for (int v66 = 0; v66 < 16; v66 += 1) {	// L70, [0,290), iterCycle=18, II=18
      for (int v67 = 0; v67 < 16; v67 += 1) {	// L71, [0,18), iterCycle=1, II=1
        v21[v65][v66][v67] = v0;	// L72, [0,1)
      }
    }
  }
  for (int v68 = 0; v68 < 64; v68 += 1) {	// L76, [510176142,510751760), iterCycle=8994, II=8994
    for (int v69 = 0; v69 < 16; v69 += 1) {	// L77, [0,8994), iterCycle=562, II=562
      for (int v70 = 0; v70 < 16; v70 += 1) {	// L78, [0,562), iterCycle=35, II=35
        for (int v71 = 0; v71 < 3; v71 += 1) {	// L79, [0,35), iterCycle=11, II=11
          for (int v72 = 0; v72 < 3; v72 += 1) {	// L80, [0,11), iterCycle=3, II=3
            float v73 = v20[v68][((v69 * 2) + v71)][((v70 * 2) + v72)];	// L81, [0,2)
            v21[v68][v69][v70] = max(v73,v21[v68][v69][v70]);	// L82, [2,3)
          }
        }
      }
    }
  }
  for (int v74 = 0; v74 < 128; v74 += 1) {	// L88, [510751760,510788882), iterCycle=290, II=290
    for (int v75 = 0; v75 < 16; v75 += 1) {	// L89, [0,290), iterCycle=18, II=18
      for (int v76 = 0; v76 < 16; v76 += 1) {	// L90, [0,18), iterCycle=1, II=1
        v22[v74][v75][v76] = v0;	// L91, [0,1)
      }
    }
  }
  for (int v77 = 0; v77 < 128; v77 += 1) {	// L95, [510788882,754128404), iterCycle=1901090, II=1901090
    for (int v78 = 0; v78 < 16; v78 += 1) {	// L96, [0,1901090), iterCycle=118818, II=118818
      for (int v79 = 0; v79 < 16; v79 += 1) {	// L97, [0,118818), iterCycle=7426, II=7426
        for (int v80 = 0; v80 < 64; v80 += 1) {	// L98, [0,7426), iterCycle=116, II=116
          for (int v81 = 0; v81 < 3; v81 += 1) {	// L99, [0,116), iterCycle=38, II=38
            for (int v82 = 0; v82 < 3; v82 += 1) {	// L100, [0,38), iterCycle=12, II=12
              float v83 = v21[v80][(v78 + v81)][(v79 + v82)];	// L101, [0,2)
              float v84 = v3[v77][v80][v81][v82];	// L102, [0,2)
              float v85 = v83 * v84;	// L103, [2,6)
              float v86 = v22[v77][v78][v79];	// L104, [4,6)
              float v87 = v85 + v86;	// L105, [6,11)
              v22[v77][v78][v79] = v87;	// L106, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v88 = 0; v88 < 128; v88 += 1) {	// L113, [754128404,754231062), iterCycle=802, II=802
    for (int v89 = 0; v89 < 16; v89 += 1) {	// L114, [0,802), iterCycle=50, II=50
      for (int v90 = 0; v90 < 16; v90 += 1) {	// L115, [0,50), iterCycle=3, II=3
        float v91 = v22[v88][v89][v90];	// L116, [0,2)
        v22[v88][v89][v90] = max(v91,v0);	// L117, [2,3)
      }
    }
  }
  for (int v92 = 0; v92 < 128; v92 += 1) {	// L121, [754231062,754268184), iterCycle=290, II=290
    for (int v93 = 0; v93 < 16; v93 += 1) {	// L122, [0,290), iterCycle=18, II=18
      for (int v94 = 0; v94 < 16; v94 += 1) {	// L123, [0,18), iterCycle=1, II=1
        v23[v92][v93][v94] = v0;	// L124, [0,1)
      }
    }
  }
  for (int v95 = 0; v95 < 128; v95 += 1) {	// L128, [754268184,1240877338), iterCycle=3801634, II=3801634
    for (int v96 = 0; v96 < 16; v96 += 1) {	// L129, [0,3801634), iterCycle=237602, II=237602
      for (int v97 = 0; v97 < 16; v97 += 1) {	// L130, [0,237602), iterCycle=14850, II=14850
        for (int v98 = 0; v98 < 128; v98 += 1) {	// L131, [0,14850), iterCycle=116, II=116
          for (int v99 = 0; v99 < 3; v99 += 1) {	// L132, [0,116), iterCycle=38, II=38
            for (int v100 = 0; v100 < 3; v100 += 1) {	// L133, [0,38), iterCycle=12, II=12
              float v101 = v22[v98][(v96 + v99)][(v97 + v100)];	// L134, [0,2)
              float v102 = v4[v95][v98][v99][v100];	// L135, [0,2)
              float v103 = v101 * v102;	// L136, [2,6)
              float v104 = v23[v95][v96][v97];	// L137, [4,6)
              float v105 = v103 + v104;	// L138, [6,11)
              v23[v95][v96][v97] = v105;	// L139, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v106 = 0; v106 < 128; v106 += 1) {	// L146, [1240877338,1240979996), iterCycle=802, II=802
    for (int v107 = 0; v107 < 16; v107 += 1) {	// L147, [0,802), iterCycle=50, II=50
      for (int v108 = 0; v108 < 16; v108 += 1) {	// L148, [0,50), iterCycle=3, II=3
        float v109 = v23[v106][v107][v108];	// L149, [0,2)
        v23[v106][v107][v108] = max(v109,v0);	// L150, [2,3)
      }
    }
  }
  for (int v110 = 0; v110 < 128; v110 += 1) {	// L154, [1240979996,1240990494), iterCycle=82, II=82
    for (int v111 = 0; v111 < 8; v111 += 1) {	// L155, [0,82), iterCycle=10, II=10
      for (int v112 = 0; v112 < 8; v112 += 1) {	// L156, [0,10), iterCycle=1, II=1
        v24[v110][v111][v112] = v0;	// L157, [0,1)
      }
    }
  }
  for (int v113 = 0; v113 < 128; v113 += 1) {	// L161, [1240990494,1241279520), iterCycle=2258, II=2258
    for (int v114 = 0; v114 < 8; v114 += 1) {	// L162, [0,2258), iterCycle=282, II=282
      for (int v115 = 0; v115 < 8; v115 += 1) {	// L163, [0,282), iterCycle=35, II=35
        for (int v116 = 0; v116 < 3; v116 += 1) {	// L164, [0,35), iterCycle=11, II=11
          for (int v117 = 0; v117 < 3; v117 += 1) {	// L165, [0,11), iterCycle=3, II=3
            float v118 = v23[v113][((v114 * 2) + v116)][((v115 * 2) + v117)];	// L166, [0,2)
            v24[v113][v114][v115] = max(v118,v24[v113][v114][v115]);	// L167, [2,3)
          }
        }
      }
    }
  }
  for (int v119 = 0; v119 < 256; v119 += 1) {	// L173, [1241279520,1241300514), iterCycle=82, II=82
    for (int v120 = 0; v120 < 8; v120 += 1) {	// L174, [0,82), iterCycle=10, II=10
      for (int v121 = 0; v121 < 8; v121 += 1) {	// L175, [0,10), iterCycle=1, II=1
        v25[v119][v120][v121] = v0;	// L176, [0,1)
      }
    }
  }
  for (int v122 = 0; v122 < 256; v122 += 1) {	// L180, [1241300514,1484607524), iterCycle=950418, II=950418
    for (int v123 = 0; v123 < 8; v123 += 1) {	// L181, [0,950418), iterCycle=118802, II=118802
      for (int v124 = 0; v124 < 8; v124 += 1) {	// L182, [0,118802), iterCycle=14850, II=14850
        for (int v125 = 0; v125 < 128; v125 += 1) {	// L183, [0,14850), iterCycle=116, II=116
          for (int v126 = 0; v126 < 3; v126 += 1) {	// L184, [0,116), iterCycle=38, II=38
            for (int v127 = 0; v127 < 3; v127 += 1) {	// L185, [0,38), iterCycle=12, II=12
              float v128 = v24[v125][(v123 + v126)][(v124 + v127)];	// L186, [0,2)
              float v129 = v5[v122][v125][v126][v127];	// L187, [0,2)
              float v130 = v128 * v129;	// L188, [2,6)
              float v131 = v25[v122][v123][v124];	// L189, [4,6)
              float v132 = v130 + v131;	// L190, [6,11)
              v25[v122][v123][v124] = v132;	// L191, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v133 = 0; v133 < 256; v133 += 1) {	// L198, [1484607524,1484661286), iterCycle=210, II=210
    for (int v134 = 0; v134 < 8; v134 += 1) {	// L199, [0,210), iterCycle=26, II=26
      for (int v135 = 0; v135 < 8; v135 += 1) {	// L200, [0,26), iterCycle=3, II=3
        float v136 = v25[v133][v134][v135];	// L201, [0,2)
        v25[v133][v134][v135] = max(v136,v0);	// L202, [2,3)
      }
    }
  }
  for (int v137 = 0; v137 < 256; v137 += 1) {	// L206, [1484661286,1484682280), iterCycle=82, II=82
    for (int v138 = 0; v138 < 8; v138 += 1) {	// L207, [0,82), iterCycle=10, II=10
      for (int v139 = 0; v139 < 8; v139 += 1) {	// L208, [0,10), iterCycle=1, II=1
        v26[v137][v138][v139] = v0;	// L209, [0,1)
      }
    }
  }
  for (int v140 = 0; v140 < 256; v140 += 1) {	// L213, [1484682280,1971258922), iterCycle=1900690, II=1900690
    for (int v141 = 0; v141 < 8; v141 += 1) {	// L214, [0,1900690), iterCycle=237586, II=237586
      for (int v142 = 0; v142 < 8; v142 += 1) {	// L215, [0,237586), iterCycle=29698, II=29698
        for (int v143 = 0; v143 < 256; v143 += 1) {	// L216, [0,29698), iterCycle=116, II=116
          for (int v144 = 0; v144 < 3; v144 += 1) {	// L217, [0,116), iterCycle=38, II=38
            for (int v145 = 0; v145 < 3; v145 += 1) {	// L218, [0,38), iterCycle=12, II=12
              float v146 = v25[v143][(v141 + v144)][(v142 + v145)];	// L219, [0,2)
              float v147 = v6[v140][v143][v144][v145];	// L220, [0,2)
              float v148 = v146 * v147;	// L221, [2,6)
              float v149 = v26[v140][v141][v142];	// L222, [4,6)
              float v150 = v148 + v149;	// L223, [6,11)
              v26[v140][v141][v142] = v150;	// L224, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v151 = 0; v151 < 256; v151 += 1) {	// L231, [1971258922,1971312684), iterCycle=210, II=210
    for (int v152 = 0; v152 < 8; v152 += 1) {	// L232, [0,210), iterCycle=26, II=26
      for (int v153 = 0; v153 < 8; v153 += 1) {	// L233, [0,26), iterCycle=3, II=3
        float v154 = v26[v151][v152][v153];	// L234, [0,2)
        v26[v151][v152][v153] = max(v154,v0);	// L235, [2,3)
      }
    }
  }
  for (int v155 = 0; v155 < 256; v155 += 1) {	// L239, [1971312684,1971333678), iterCycle=82, II=82
    for (int v156 = 0; v156 < 8; v156 += 1) {	// L240, [0,82), iterCycle=10, II=10
      for (int v157 = 0; v157 < 8; v157 += 1) {	// L241, [0,10), iterCycle=1, II=1
        v27[v155][v156][v157] = v0;	// L242, [0,1)
      }
    }
  }
  for (int v158 = 0; v158 < 256; v158 += 1) {	// L246, [1971333678,2457910320), iterCycle=1900690, II=1900690
    for (int v159 = 0; v159 < 8; v159 += 1) {	// L247, [0,1900690), iterCycle=237586, II=237586
      for (int v160 = 0; v160 < 8; v160 += 1) {	// L248, [0,237586), iterCycle=29698, II=29698
        for (int v161 = 0; v161 < 256; v161 += 1) {	// L249, [0,29698), iterCycle=116, II=116
          for (int v162 = 0; v162 < 3; v162 += 1) {	// L250, [0,116), iterCycle=38, II=38
            for (int v163 = 0; v163 < 3; v163 += 1) {	// L251, [0,38), iterCycle=12, II=12
              float v164 = v26[v161][(v159 + v162)][(v160 + v163)];	// L252, [0,2)
              float v165 = v6[v158][v161][v162][v163];	// L253, [0,2)
              float v166 = v164 * v165;	// L254, [2,6)
              float v167 = v27[v158][v159][v160];	// L255, [4,6)
              float v168 = v166 + v167;	// L256, [6,11)
              v27[v158][v159][v160] = v168;	// L257, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v169 = 0; v169 < 256; v169 += 1) {	// L264, [2457910320,2457964082), iterCycle=210, II=210
    for (int v170 = 0; v170 < 8; v170 += 1) {	// L265, [0,210), iterCycle=26, II=26
      for (int v171 = 0; v171 < 8; v171 += 1) {	// L266, [0,26), iterCycle=3, II=3
        float v172 = v27[v169][v170][v171];	// L267, [0,2)
        v27[v169][v170][v171] = max(v172,v0);	// L268, [2,3)
      }
    }
  }
  for (int v173 = 0; v173 < 256; v173 += 1) {	// L272, [2457964082,2457970740), iterCycle=26, II=26
    for (int v174 = 0; v174 < 4; v174 += 1) {	// L273, [0,26), iterCycle=6, II=6
      for (int v175 = 0; v175 < 4; v175 += 1) {	// L274, [0,6), iterCycle=1, II=1
        v11[v173][v174][v175] = v0;	// L275, [0,1)
      }
    }
  }
  for (int v176 = 0; v176 < 256; v176 += 1) {	// L279, [2457970740,2458116662), iterCycle=570, II=570
    for (int v177 = 0; v177 < 4; v177 += 1) {	// L280, [0,570), iterCycle=142, II=142
      for (int v178 = 0; v178 < 4; v178 += 1) {	// L281, [0,142), iterCycle=35, II=35
        for (int v179 = 0; v179 < 3; v179 += 1) {	// L282, [0,35), iterCycle=11, II=11
          for (int v180 = 0; v180 < 3; v180 += 1) {	// L283, [0,11), iterCycle=3, II=3
            float v181 = v27[v176][((v177 * 2) + v179)][((v178 * 2) + v180)];	// L284, [0,2)
            v11[v176][v177][v178] = max(v181,v11[v176][v177][v178]);	// L285, [2,3)
          }
        }
      }
    }
  }
  for (int v182 = 0; v182 < 512; v182 += 1) {	// L291, [2458116662,2458129976), iterCycle=26, II=26
    for (int v183 = 0; v183 < 4; v183 += 1) {	// L292, [0,26), iterCycle=6, II=6
      for (int v184 = 0; v184 < 4; v184 += 1) {	// L293, [0,6), iterCycle=1, II=1
        v12[v182][v183][v184] = v0;	// L294, [0,1)
      }
    }
  }
  for (int v185 = 0; v185 < 512; v185 += 1) {	// L298, [2458129976,2701421114), iterCycle=475178, II=475178
    for (int v186 = 0; v186 < 4; v186 += 1) {	// L299, [0,475178), iterCycle=118794, II=118794
      for (int v187 = 0; v187 < 4; v187 += 1) {	// L300, [0,118794), iterCycle=29698, II=29698
        for (int v188 = 0; v188 < 256; v188 += 1) {	// L301, [0,29698), iterCycle=116, II=116
          for (int v189 = 0; v189 < 3; v189 += 1) {	// L302, [0,116), iterCycle=38, II=38
            for (int v190 = 0; v190 < 3; v190 += 1) {	// L303, [0,38), iterCycle=12, II=12
              float v191 = v11[v188][(v186 + v189)][(v187 + v190)];	// L304, [0,2)
              float v192 = v7[v185][v188][v189][v190];	// L305, [0,2)
              float v193 = v191 * v192;	// L306, [2,6)
              float v194 = v12[v185][v186][v187];	// L307, [4,6)
              float v195 = v193 + v194;	// L308, [6,11)
              v12[v185][v186][v187] = v195;	// L309, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v196 = 0; v196 < 512; v196 += 1) {	// L316, [2701421114,2701450812), iterCycle=58, II=58
    for (int v197 = 0; v197 < 4; v197 += 1) {	// L317, [0,58), iterCycle=14, II=14
      for (int v198 = 0; v198 < 4; v198 += 1) {	// L318, [0,14), iterCycle=3, II=3
        float v199 = v12[v196][v197][v198];	// L319, [0,2)
        v12[v196][v197][v198] = max(v199,v0);	// L320, [2,3)
      }
    }
  }
  for (int v200 = 0; v200 < 512; v200 += 1) {	// L324, [2701450812,2701464126), iterCycle=26, II=26
    for (int v201 = 0; v201 < 4; v201 += 1) {	// L325, [0,26), iterCycle=6, II=6
      for (int v202 = 0; v202 < 4; v202 += 1) {	// L326, [0,6), iterCycle=1, II=1
        v13[v200][v201][v202] = v0;	// L327, [0,1)
      }
    }
  }
  for (int v203 = 0; v203 < 512; v203 += 1) {	// L331, [2701464126,3188024896), iterCycle=950314, II=950314
    for (int v204 = 0; v204 < 4; v204 += 1) {	// L332, [0,950314), iterCycle=237578, II=237578
      for (int v205 = 0; v205 < 4; v205 += 1) {	// L333, [0,237578), iterCycle=59394, II=59394
        for (int v206 = 0; v206 < 512; v206 += 1) {	// L334, [0,59394), iterCycle=116, II=116
          for (int v207 = 0; v207 < 3; v207 += 1) {	// L335, [0,116), iterCycle=38, II=38
            for (int v208 = 0; v208 < 3; v208 += 1) {	// L336, [0,38), iterCycle=12, II=12
              float v209 = v12[v206][(v204 + v207)][(v205 + v208)];	// L337, [0,2)
              float v210 = v8[v203][v206][v207][v208];	// L338, [0,2)
              float v211 = v209 * v210;	// L339, [2,6)
              float v212 = v13[v203][v204][v205];	// L340, [4,6)
              float v213 = v211 + v212;	// L341, [6,11)
              v13[v203][v204][v205] = v213;	// L342, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v214 = 0; v214 < 512; v214 += 1) {	// L349, [3188024896,3188054594), iterCycle=58, II=58
    for (int v215 = 0; v215 < 4; v215 += 1) {	// L350, [0,58), iterCycle=14, II=14
      for (int v216 = 0; v216 < 4; v216 += 1) {	// L351, [0,14), iterCycle=3, II=3
        float v217 = v13[v214][v215][v216];	// L352, [0,2)
        v13[v214][v215][v216] = max(v217,v0);	// L353, [2,3)
      }
    }
  }
  for (int v218 = 0; v218 < 512; v218 += 1) {	// L357, [3188054594,3188067908), iterCycle=26, II=26
    for (int v219 = 0; v219 < 4; v219 += 1) {	// L358, [0,26), iterCycle=6, II=6
      for (int v220 = 0; v220 < 4; v220 += 1) {	// L359, [0,6), iterCycle=1, II=1
        v14[v218][v219][v220] = v0;	// L360, [0,1)
      }
    }
  }
  for (int v221 = 0; v221 < 512; v221 += 1) {	// L364, [3188067908,3674628678), iterCycle=950314, II=950314
    for (int v222 = 0; v222 < 4; v222 += 1) {	// L365, [0,950314), iterCycle=237578, II=237578
      for (int v223 = 0; v223 < 4; v223 += 1) {	// L366, [0,237578), iterCycle=59394, II=59394
        for (int v224 = 0; v224 < 512; v224 += 1) {	// L367, [0,59394), iterCycle=116, II=116
          for (int v225 = 0; v225 < 3; v225 += 1) {	// L368, [0,116), iterCycle=38, II=38
            for (int v226 = 0; v226 < 3; v226 += 1) {	// L369, [0,38), iterCycle=12, II=12
              float v227 = v13[v224][(v222 + v225)][(v223 + v226)];	// L370, [0,2)
              float v228 = v8[v221][v224][v225][v226];	// L371, [0,2)
              float v229 = v227 * v228;	// L372, [2,6)
              float v230 = v14[v221][v222][v223];	// L373, [4,6)
              float v231 = v229 + v230;	// L374, [6,11)
              v14[v221][v222][v223] = v231;	// L375, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v232 = 0; v232 < 512; v232 += 1) {	// L382, [3674628678,3674658376), iterCycle=58, II=58
    for (int v233 = 0; v233 < 4; v233 += 1) {	// L383, [0,58), iterCycle=14, II=14
      for (int v234 = 0; v234 < 4; v234 += 1) {	// L384, [0,14), iterCycle=3, II=3
        float v235 = v14[v232][v233][v234];	// L385, [0,2)
        v14[v232][v233][v234] = max(v235,v0);	// L386, [2,3)
      }
    }
  }
  for (int v236 = 0; v236 < 512; v236 += 1) {	// L390, [3674658376,3674663498), iterCycle=10, II=10
    for (int v237 = 0; v237 < 2; v237 += 1) {	// L391, [0,10), iterCycle=4, II=4
      for (int v238 = 0; v238 < 2; v238 += 1) {	// L392, [0,4), iterCycle=1, II=1
        v15[v236][v237][v238] = v0;	// L393, [0,1)
      }
    }
  }
  for (int v239 = 0; v239 < 512; v239 += 1) {	// L397, [3674663498,3674738252), iterCycle=146, II=146
    for (int v240 = 0; v240 < 2; v240 += 1) {	// L398, [0,146), iterCycle=72, II=72
      for (int v241 = 0; v241 < 2; v241 += 1) {	// L399, [0,72), iterCycle=35, II=35
        for (int v242 = 0; v242 < 3; v242 += 1) {	// L400, [0,35), iterCycle=11, II=11
          for (int v243 = 0; v243 < 3; v243 += 1) {	// L401, [0,11), iterCycle=3, II=3
            float v244 = v14[v239][((v240 * 2) + v242)][((v241 * 2) + v243)];	// L402, [0,2)
            v15[v239][v240][v241] = max(v244,v15[v239][v240][v241]);	// L403, [2,3)
          }
        }
      }
    }
  }
  for (int v245 = 0; v245 < 512; v245 += 1) {	// L409, [3674738252,3674743374), iterCycle=10, II=10
    for (int v246 = 0; v246 < 2; v246 += 1) {	// L410, [0,10), iterCycle=4, II=4
      for (int v247 = 0; v247 < 2; v247 += 1) {	// L411, [0,4), iterCycle=1, II=1
        v16[v245][v246][v247] = v0;	// L412, [0,1)
      }
    }
  }
  for (int v248 = 0; v248 < 512; v248 += 1) {	// L416, [3674743374,3796385360), iterCycle=237582, II=237582
    for (int v249 = 0; v249 < 2; v249 += 1) {	// L417, [0,237582), iterCycle=118790, II=118790
      for (int v250 = 0; v250 < 2; v250 += 1) {	// L418, [0,118790), iterCycle=59394, II=59394
        for (int v251 = 0; v251 < 512; v251 += 1) {	// L419, [0,59394), iterCycle=116, II=116
          for (int v252 = 0; v252 < 3; v252 += 1) {	// L420, [0,116), iterCycle=38, II=38
            for (int v253 = 0; v253 < 3; v253 += 1) {	// L421, [0,38), iterCycle=12, II=12
              float v254 = v15[v251][(v249 + v252)][(v250 + v253)];	// L422, [0,2)
              float v255 = v9[v248][v251][v252][v253];	// L423, [0,2)
              float v256 = v254 * v255;	// L424, [2,6)
              float v257 = v16[v248][v249][v250];	// L425, [4,6)
              float v258 = v256 + v257;	// L426, [6,11)
              v16[v248][v249][v250] = v258;	// L427, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v259 = 0; v259 < 512; v259 += 1) {	// L434, [3796385360,3796394578), iterCycle=18, II=18
    for (int v260 = 0; v260 < 2; v260 += 1) {	// L435, [0,18), iterCycle=8, II=8
      for (int v261 = 0; v261 < 2; v261 += 1) {	// L436, [0,8), iterCycle=3, II=3
        float v262 = v16[v259][v260][v261];	// L437, [0,2)
        v16[v259][v260][v261] = max(v262,v0);	// L438, [2,3)
      }
    }
  }
  for (int v263 = 0; v263 < 512; v263 += 1) {	// L442, [3796394578,3796399700), iterCycle=10, II=10
    for (int v264 = 0; v264 < 2; v264 += 1) {	// L443, [0,10), iterCycle=4, II=4
      for (int v265 = 0; v265 < 2; v265 += 1) {	// L444, [0,4), iterCycle=1, II=1
        v17[v263][v264][v265] = v0;	// L445, [0,1)
      }
    }
  }
  for (int v266 = 0; v266 < 512; v266 += 1) {	// L449, [3796399700,3918041686), iterCycle=237582, II=237582
    for (int v267 = 0; v267 < 2; v267 += 1) {	// L450, [0,237582), iterCycle=118790, II=118790
      for (int v268 = 0; v268 < 2; v268 += 1) {	// L451, [0,118790), iterCycle=59394, II=59394
        for (int v269 = 0; v269 < 512; v269 += 1) {	// L452, [0,59394), iterCycle=116, II=116
          for (int v270 = 0; v270 < 3; v270 += 1) {	// L453, [0,116), iterCycle=38, II=38
            for (int v271 = 0; v271 < 3; v271 += 1) {	// L454, [0,38), iterCycle=12, II=12
              float v272 = v16[v269][(v267 + v270)][(v268 + v271)];	// L455, [0,2)
              float v273 = v9[v266][v269][v270][v271];	// L456, [0,2)
              float v274 = v272 * v273;	// L457, [2,6)
              float v275 = v17[v266][v267][v268];	// L458, [4,6)
              float v276 = v274 + v275;	// L459, [6,11)
              v17[v266][v267][v268] = v276;	// L460, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v277 = 0; v277 < 512; v277 += 1) {	// L467, [3918041686,3918050904), iterCycle=18, II=18
    for (int v278 = 0; v278 < 2; v278 += 1) {	// L468, [0,18), iterCycle=8, II=8
      for (int v279 = 0; v279 < 2; v279 += 1) {	// L469, [0,8), iterCycle=3, II=3
        float v280 = v17[v277][v278][v279];	// L470, [0,2)
        v17[v277][v278][v279] = max(v280,v0);	// L471, [2,3)
      }
    }
  }
  for (int v281 = 0; v281 < 512; v281 += 1) {	// L475, [3918050904,3918056026), iterCycle=10, II=10
    for (int v282 = 0; v282 < 2; v282 += 1) {	// L476, [0,10), iterCycle=4, II=4
      for (int v283 = 0; v283 < 2; v283 += 1) {	// L477, [0,4), iterCycle=1, II=1
        v18[v281][v282][v283] = v0;	// L478, [0,1)
      }
    }
  }
  for (int v284 = 0; v284 < 512; v284 += 1) {	// L482, [3918056026,4039698012), iterCycle=237582, II=237582
    for (int v285 = 0; v285 < 2; v285 += 1) {	// L483, [0,237582), iterCycle=118790, II=118790
      for (int v286 = 0; v286 < 2; v286 += 1) {	// L484, [0,118790), iterCycle=59394, II=59394
        for (int v287 = 0; v287 < 512; v287 += 1) {	// L485, [0,59394), iterCycle=116, II=116
          for (int v288 = 0; v288 < 3; v288 += 1) {	// L486, [0,116), iterCycle=38, II=38
            for (int v289 = 0; v289 < 3; v289 += 1) {	// L487, [0,38), iterCycle=12, II=12
              float v290 = v17[v287][(v285 + v288)][(v286 + v289)];	// L488, [0,2)
              float v291 = v9[v284][v287][v288][v289];	// L489, [0,2)
              float v292 = v290 * v291;	// L490, [2,6)
              float v293 = v18[v284][v285][v286];	// L491, [4,6)
              float v294 = v292 + v293;	// L492, [6,11)
              v18[v284][v285][v286] = v294;	// L493, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v295 = 0; v295 < 512; v295 += 1) {	// L500, [4039698012,4039707230), iterCycle=18, II=18
    for (int v296 = 0; v296 < 2; v296 += 1) {	// L501, [0,18), iterCycle=8, II=8
      for (int v297 = 0; v297 < 2; v297 += 1) {	// L502, [0,8), iterCycle=3, II=3
        float v298 = v18[v295][v296][v297];	// L503, [0,2)
        v18[v295][v296][v297] = max(v298,v0);	// L504, [2,3)
      }
    }
  }
  for (int v299 = 0; v299 < 512; v299 += 1) {	// L508, [4039707230,4039707744), iterCycle=1, II=1
    v19[v299] = v0;	// L509, [0,1)
  }
  for (int v300 = 0; v300 < 512; v300 += 1) {	// L511, [4039707744,4039725666), iterCycle=35, II=35
    for (int v301 = 0; v301 < 3; v301 += 1) {	// L512, [0,35), iterCycle=11, II=11
      for (int v302 = 0; v302 < 3; v302 += 1) {	// L513, [0,11), iterCycle=3, II=3
        float v303 = v18[v300][(v301 + 2)][(v302 + 2)];	// L514, [0,2)
        v19[v300] = max(v303,v19[v300]);	// L515, [2,3)
      }
    }
  }
}

