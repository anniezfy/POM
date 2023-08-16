
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
/// Latency=7158829566, interval=7158829566
/// DSP=5, BRAM=0
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
) {	// L2, [0,7158829566)
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

  for (int v41 = 0; v41 < 64; v41 += 1) {	// L3, [0,69762), iterCycle=1090, II=1090
    for (int v42 = 0; v42 < 32; v42 += 1) {	// L4, [0,1090), iterCycle=34, II=34
      for (int v43 = 0; v43 < 32; v43 += 1) {	// L5, [0,34), iterCycle=1, II=1
        v9[v41][v42][v43] = v0;	// L6, [0,1)
      }
    }
  }
  for (int v44 = 0; v44 < 64; v44 += 1) {	// L10, [69762,23011588), iterCycle=358466, II=358466
    for (int v45 = 0; v45 < 32; v45 += 1) {	// L11, [0,358466), iterCycle=11202, II=11202
      for (int v46 = 0; v46 < 32; v46 += 1) {	// L12, [0,11202), iterCycle=350, II=350
        for (int v47 = 0; v47 < 3; v47 += 1) {	// L13, [0,350), iterCycle=116, II=116
          for (int v48 = 0; v48 < 3; v48 += 1) {	// L14, [0,116), iterCycle=38, II=38
            for (int v49 = 0; v49 < 3; v49 += 1) {	// L15, [0,38), iterCycle=12, II=12
              float v50 = v37[v47][(v45 + v48)][(v46 + v49)];	// L16, [0,2)
              float v51 = v1[v44][v47][v48][v49];	// L17, [0,2)
              float v52 = v50 * v51;	// L18, [2,6)
              float v53 = v9[v44][v45][v46];	// L19, [4,6)
              float v54 = v52 + v53;	// L20, [6,11)
              v9[v44][v45][v46] = v54;	// L21, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v55 = 0; v55 < 64; v55 += 1) {	// L28, [23011588,23212422), iterCycle=3138, II=3138
    for (int v56 = 0; v56 < 32; v56 += 1) {	// L29, [0,3138), iterCycle=98, II=98
      for (int v57 = 0; v57 < 32; v57 += 1) {	// L30, [0,98), iterCycle=3, II=3
        float v58 = v9[v55][v56][v57];	// L31, [0,2)
        v9[v55][v56][v57] = v58;	// L32, [2,3)
      }
    }
  }
  for (int v59 = 0; v59 < 64; v59 += 1) {	// L36, [23212422,23282184), iterCycle=1090, II=1090
    for (int v60 = 0; v60 < 32; v60 += 1) {	// L37, [0,1090), iterCycle=34, II=34
      for (int v61 = 0; v61 < 32; v61 += 1) {	// L38, [0,34), iterCycle=1, II=1
        v20[v59][v60][v61] = v0;	// L39, [0,1)
      }
    }
  }
  for (int v62 = 0; v62 < 64; v62 += 1) {	// L43, [23282184,509956746), iterCycle=7604290, II=7604290
    for (int v63 = 0; v63 < 32; v63 += 1) {	// L44, [0,7604290), iterCycle=237634, II=237634
      for (int v64 = 0; v64 < 32; v64 += 1) {	// L45, [0,237634), iterCycle=7426, II=7426
        for (int v65 = 0; v65 < 64; v65 += 1) {	// L46, [0,7426), iterCycle=116, II=116
          for (int v66 = 0; v66 < 3; v66 += 1) {	// L47, [0,116), iterCycle=38, II=38
            for (int v67 = 0; v67 < 3; v67 += 1) {	// L48, [0,38), iterCycle=12, II=12
              float v68 = v9[v65][(v63 + v66)][(v64 + v67)];	// L49, [0,2)
              float v69 = v2[v62][v65][v66][v67];	// L50, [0,2)
              float v70 = v68 * v69;	// L51, [2,6)
              float v71 = v20[v62][v63][v64];	// L52, [4,6)
              float v72 = v70 + v71;	// L53, [6,11)
              v20[v62][v63][v64] = v72;	// L54, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v73 = 0; v73 < 64; v73 += 1) {	// L61, [509956746,510157580), iterCycle=3138, II=3138
    for (int v74 = 0; v74 < 32; v74 += 1) {	// L62, [0,3138), iterCycle=98, II=98
      for (int v75 = 0; v75 < 32; v75 += 1) {	// L63, [0,98), iterCycle=3, II=3
        float v76 = v20[v73][v74][v75];	// L64, [0,2)
        v20[v73][v74][v75] = v76;	// L65, [2,3)
      }
    }
  }
  for (int v77 = 0; v77 < 64; v77 += 1) {	// L69, [510157580,510227342), iterCycle=1090, II=1090
    for (int v78 = 0; v78 < 32; v78 += 1) {	// L70, [0,1090), iterCycle=34, II=34
      for (int v79 = 0; v79 < 32; v79 += 1) {	// L71, [0,34), iterCycle=1, II=1
        v30[v77][v78][v79] = v0;	// L72, [0,1)
      }
    }
  }
  for (int v80 = 0; v80 < 64; v80 += 1) {	// L76, [510227342,996901904), iterCycle=7604290, II=7604290
    for (int v81 = 0; v81 < 32; v81 += 1) {	// L77, [0,7604290), iterCycle=237634, II=237634
      for (int v82 = 0; v82 < 32; v82 += 1) {	// L78, [0,237634), iterCycle=7426, II=7426
        for (int v83 = 0; v83 < 64; v83 += 1) {	// L79, [0,7426), iterCycle=116, II=116
          for (int v84 = 0; v84 < 3; v84 += 1) {	// L80, [0,116), iterCycle=38, II=38
            for (int v85 = 0; v85 < 3; v85 += 1) {	// L81, [0,38), iterCycle=12, II=12
              float v86 = v20[v83][(v81 + v84)][(v82 + v85)];	// L82, [0,2)
              float v87 = v2[v80][v83][v84][v85];	// L83, [0,2)
              float v88 = v86 * v87;	// L84, [2,6)
              float v89 = v30[v80][v81][v82];	// L85, [4,6)
              float v90 = v88 + v89;	// L86, [6,11)
              v30[v80][v81][v82] = v90;	// L87, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v91 = 0; v91 < 64; v91 += 1) {	// L94, [996901904,997430418), iterCycle=8258, II=8258
    for (int v92 = 0; v92 < 32; v92 += 1) {	// L95, [0,8258), iterCycle=258, II=258
      for (int v93 = 0; v93 < 32; v93 += 1) {	// L96, [0,258), iterCycle=8, II=8
        float v94 = v30[v91][v92][v93];	// L97, [0,2)
        float v95 = v9[v91][v92][v93];	// L98, [0,2)
        float v96 = v94 + v95;	// L99, [2,7)
        v31[v91][v92][v93] = v96;	// L100, [7,8)
      }
    }
  }
  for (int v97 = 0; v97 < 64; v97 += 1) {	// L104, [997430418,997631252), iterCycle=3138, II=3138
    for (int v98 = 0; v98 < 32; v98 += 1) {	// L105, [0,3138), iterCycle=98, II=98
      for (int v99 = 0; v99 < 32; v99 += 1) {	// L106, [0,98), iterCycle=3, II=3
        float v100 = v31[v97][v98][v99];	// L107, [0,2)
        v31[v97][v98][v99] = v100;	// L108, [2,3)
      }
    }
  }
  for (int v101 = 0; v101 < 64; v101 += 1) {	// L112, [997631252,997701014), iterCycle=1090, II=1090
    for (int v102 = 0; v102 < 32; v102 += 1) {	// L113, [0,1090), iterCycle=34, II=34
      for (int v103 = 0; v103 < 32; v103 += 1) {	// L114, [0,34), iterCycle=1, II=1
        v32[v101][v102][v103] = v0;	// L115, [0,1)
      }
    }
  }
  for (int v104 = 0; v104 < 64; v104 += 1) {	// L119, [997701014,1484375576), iterCycle=7604290, II=7604290
    for (int v105 = 0; v105 < 32; v105 += 1) {	// L120, [0,7604290), iterCycle=237634, II=237634
      for (int v106 = 0; v106 < 32; v106 += 1) {	// L121, [0,237634), iterCycle=7426, II=7426
        for (int v107 = 0; v107 < 64; v107 += 1) {	// L122, [0,7426), iterCycle=116, II=116
          for (int v108 = 0; v108 < 3; v108 += 1) {	// L123, [0,116), iterCycle=38, II=38
            for (int v109 = 0; v109 < 3; v109 += 1) {	// L124, [0,38), iterCycle=12, II=12
              float v110 = v31[v107][(v105 + v108)][(v106 + v109)];	// L125, [0,2)
              float v111 = v2[v104][v107][v108][v109];	// L126, [0,2)
              float v112 = v110 * v111;	// L127, [2,6)
              float v113 = v32[v104][v105][v106];	// L128, [4,6)
              float v114 = v112 + v113;	// L129, [6,11)
              v32[v104][v105][v106] = v114;	// L130, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v115 = 0; v115 < 64; v115 += 1) {	// L137, [1484375576,1484576410), iterCycle=3138, II=3138
    for (int v116 = 0; v116 < 32; v116 += 1) {	// L138, [0,3138), iterCycle=98, II=98
      for (int v117 = 0; v117 < 32; v117 += 1) {	// L139, [0,98), iterCycle=3, II=3
        float v118 = v32[v115][v116][v117];	// L140, [0,2)
        v32[v115][v116][v117] = v118;	// L141, [2,3)
      }
    }
  }
  for (int v119 = 0; v119 < 64; v119 += 1) {	// L145, [1484576410,1484646172), iterCycle=1090, II=1090
    for (int v120 = 0; v120 < 32; v120 += 1) {	// L146, [0,1090), iterCycle=34, II=34
      for (int v121 = 0; v121 < 32; v121 += 1) {	// L147, [0,34), iterCycle=1, II=1
        v33[v119][v120][v121] = v0;	// L148, [0,1)
      }
    }
  }
  for (int v122 = 0; v122 < 64; v122 += 1) {	// L152, [1484646172,1971320734), iterCycle=7604290, II=7604290
    for (int v123 = 0; v123 < 32; v123 += 1) {	// L153, [0,7604290), iterCycle=237634, II=237634
      for (int v124 = 0; v124 < 32; v124 += 1) {	// L154, [0,237634), iterCycle=7426, II=7426
        for (int v125 = 0; v125 < 64; v125 += 1) {	// L155, [0,7426), iterCycle=116, II=116
          for (int v126 = 0; v126 < 3; v126 += 1) {	// L156, [0,116), iterCycle=38, II=38
            for (int v127 = 0; v127 < 3; v127 += 1) {	// L157, [0,38), iterCycle=12, II=12
              float v128 = v32[v125][(v123 + v126)][(v124 + v127)];	// L158, [0,2)
              float v129 = v2[v122][v125][v126][v127];	// L159, [0,2)
              float v130 = v128 * v129;	// L160, [2,6)
              float v131 = v33[v122][v123][v124];	// L161, [4,6)
              float v132 = v130 + v131;	// L162, [6,11)
              v33[v122][v123][v124] = v132;	// L163, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v133 = 0; v133 < 64; v133 += 1) {	// L170, [1971320734,1971849248), iterCycle=8258, II=8258
    for (int v134 = 0; v134 < 32; v134 += 1) {	// L171, [0,8258), iterCycle=258, II=258
      for (int v135 = 0; v135 < 32; v135 += 1) {	// L172, [0,258), iterCycle=8, II=8
        float v136 = v33[v133][v134][v135];	// L173, [0,2)
        float v137 = v31[v133][v134][v135];	// L174, [0,2)
        float v138 = v136 + v137;	// L175, [2,7)
        v34[v133][v134][v135] = v138;	// L176, [7,8)
      }
    }
  }
  for (int v139 = 0; v139 < 64; v139 += 1) {	// L180, [1971849248,1972050082), iterCycle=3138, II=3138
    for (int v140 = 0; v140 < 32; v140 += 1) {	// L181, [0,3138), iterCycle=98, II=98
      for (int v141 = 0; v141 < 32; v141 += 1) {	// L182, [0,98), iterCycle=3, II=3
        float v142 = v34[v139][v140][v141];	// L183, [0,2)
        v34[v139][v140][v141] = v142;	// L184, [2,3)
      }
    }
  }
  for (int v143 = 0; v143 < 128; v143 += 1) {	// L188, [1972050082,1972087204), iterCycle=290, II=290
    for (int v144 = 0; v144 < 16; v144 += 1) {	// L189, [0,290), iterCycle=18, II=18
      for (int v145 = 0; v145 < 16; v145 += 1) {	// L190, [0,18), iterCycle=1, II=1
        v35[v143][v144][v145] = v0;	// L191, [0,1)
      }
    }
  }
  for (int v146 = 0; v146 < 128; v146 += 1) {	// L195, [1972087204,2215426726), iterCycle=1901090, II=1901090
    for (int v147 = 0; v147 < 16; v147 += 1) {	// L196, [0,1901090), iterCycle=118818, II=118818
      for (int v148 = 0; v148 < 16; v148 += 1) {	// L197, [0,118818), iterCycle=7426, II=7426
        for (int v149 = 0; v149 < 64; v149 += 1) {	// L198, [0,7426), iterCycle=116, II=116
          for (int v150 = 0; v150 < 3; v150 += 1) {	// L199, [0,116), iterCycle=38, II=38
            for (int v151 = 0; v151 < 3; v151 += 1) {	// L200, [0,38), iterCycle=12, II=12
              float v152 = v34[v149][((v147 * 2) + v150)][((v148 * 2) + v151)];	// L201, [0,2)
              float v153 = v3[v146][v149][v150][v151];	// L202, [0,2)
              float v154 = v152 * v153;	// L203, [2,6)
              float v155 = v35[v146][v147][v148];	// L204, [4,6)
              float v156 = v154 + v155;	// L205, [6,11)
              v35[v146][v147][v148] = v156;	// L206, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v157 = 0; v157 < 128; v157 += 1) {	// L213, [2215426726,2215529384), iterCycle=802, II=802
    for (int v158 = 0; v158 < 16; v158 += 1) {	// L214, [0,802), iterCycle=50, II=50
      for (int v159 = 0; v159 < 16; v159 += 1) {	// L215, [0,50), iterCycle=3, II=3
        float v160 = v35[v157][v158][v159];	// L216, [0,2)
        v35[v157][v158][v159] = v160;	// L217, [2,3)
      }
    }
  }
  for (int v161 = 0; v161 < 128; v161 += 1) {	// L221, [2215529384,2215566506), iterCycle=290, II=290
    for (int v162 = 0; v162 < 16; v162 += 1) {	// L222, [0,290), iterCycle=18, II=18
      for (int v163 = 0; v163 < 16; v163 += 1) {	// L223, [0,18), iterCycle=1, II=1
        v36[v161][v162][v163] = v0;	// L224, [0,1)
      }
    }
  }
  for (int v164 = 0; v164 < 128; v164 += 1) {	// L228, [2215566506,2702175660), iterCycle=3801634, II=3801634
    for (int v165 = 0; v165 < 16; v165 += 1) {	// L229, [0,3801634), iterCycle=237602, II=237602
      for (int v166 = 0; v166 < 16; v166 += 1) {	// L230, [0,237602), iterCycle=14850, II=14850
        for (int v167 = 0; v167 < 128; v167 += 1) {	// L231, [0,14850), iterCycle=116, II=116
          for (int v168 = 0; v168 < 3; v168 += 1) {	// L232, [0,116), iterCycle=38, II=38
            for (int v169 = 0; v169 < 3; v169 += 1) {	// L233, [0,38), iterCycle=12, II=12
              float v170 = v35[v167][(v165 + v168)][(v166 + v169)];	// L234, [0,2)
              float v171 = v4[v164][v167][v168][v169];	// L235, [0,2)
              float v172 = v170 * v171;	// L236, [2,6)
              float v173 = v36[v164][v165][v166];	// L237, [4,6)
              float v174 = v172 + v173;	// L238, [6,11)
              v36[v164][v165][v166] = v174;	// L239, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v175 = 0; v175 < 128; v175 += 1) {	// L246, [2702175660,2727411374), iterCycle=197154, II=197154
    for (int v176 = 0; v176 < 16; v176 += 1) {	// L247, [0,197154), iterCycle=12322, II=12322
      for (int v177 = 0; v177 < 16; v177 += 1) {	// L248, [0,12322), iterCycle=770, II=770
        for (int v178 = 0; v178 < 64; v178 += 1) {	// L249, [0,770), iterCycle=12, II=12
          float v179 = v34[v178][(v176 * 2)][(v177 * 2)];	// L250, [0,2)
          float v180 = v38[v175][v178];	// L251, [0,2)
          float v181 = v179 * v180;	// L252, [2,6)
          float v182 = v10[v175][v176][v177];	// L253, [4,6)
          float v183 = v182 + v181;	// L254, [6,11)
          v10[v175][v176][v177] = v183;	// L255, [11,12)
        }
      }
    }
  }
  for (int v184 = 0; v184 < 128; v184 += 1) {	// L260, [2727411374,2727677872), iterCycle=2082, II=2082
    for (int v185 = 0; v185 < 16; v185 += 1) {	// L261, [0,2082), iterCycle=130, II=130
      for (int v186 = 0; v186 < 16; v186 += 1) {	// L262, [0,130), iterCycle=8, II=8
        float v187 = v10[v184][v185][v186];	// L263, [0,2)
        float v188 = v36[v184][v185][v186];	// L264, [0,2)
        float v189 = v187 + v188;	// L265, [2,7)
        v11[v184][v185][v186] = v189;	// L266, [7,8)
      }
    }
  }
  for (int v190 = 0; v190 < 128; v190 += 1) {	// L270, [2727677872,2727780530), iterCycle=802, II=802
    for (int v191 = 0; v191 < 16; v191 += 1) {	// L271, [0,802), iterCycle=50, II=50
      for (int v192 = 0; v192 < 16; v192 += 1) {	// L272, [0,50), iterCycle=3, II=3
        float v193 = v11[v190][v191][v192];	// L273, [0,2)
        v11[v190][v191][v192] = v193;	// L274, [2,3)
      }
    }
  }
  for (int v194 = 0; v194 < 128; v194 += 1) {	// L278, [2727780530,2727817652), iterCycle=290, II=290
    for (int v195 = 0; v195 < 16; v195 += 1) {	// L279, [0,290), iterCycle=18, II=18
      for (int v196 = 0; v196 < 16; v196 += 1) {	// L280, [0,18), iterCycle=1, II=1
        v12[v194][v195][v196] = v0;	// L281, [0,1)
      }
    }
  }
  for (int v197 = 0; v197 < 128; v197 += 1) {	// L285, [2727817652,3214426806), iterCycle=3801634, II=3801634
    for (int v198 = 0; v198 < 16; v198 += 1) {	// L286, [0,3801634), iterCycle=237602, II=237602
      for (int v199 = 0; v199 < 16; v199 += 1) {	// L287, [0,237602), iterCycle=14850, II=14850
        for (int v200 = 0; v200 < 128; v200 += 1) {	// L288, [0,14850), iterCycle=116, II=116
          for (int v201 = 0; v201 < 3; v201 += 1) {	// L289, [0,116), iterCycle=38, II=38
            for (int v202 = 0; v202 < 3; v202 += 1) {	// L290, [0,38), iterCycle=12, II=12
              float v203 = v11[v200][(v198 + v201)][(v199 + v202)];	// L291, [0,2)
              float v204 = v4[v197][v200][v201][v202];	// L292, [0,2)
              float v205 = v203 * v204;	// L293, [2,6)
              float v206 = v12[v197][v198][v199];	// L294, [4,6)
              float v207 = v205 + v206;	// L295, [6,11)
              v12[v197][v198][v199] = v207;	// L296, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v208 = 0; v208 < 128; v208 += 1) {	// L303, [3214426806,3214529464), iterCycle=802, II=802
    for (int v209 = 0; v209 < 16; v209 += 1) {	// L304, [0,802), iterCycle=50, II=50
      for (int v210 = 0; v210 < 16; v210 += 1) {	// L305, [0,50), iterCycle=3, II=3
        float v211 = v12[v208][v209][v210];	// L306, [0,2)
        v12[v208][v209][v210] = v211;	// L307, [2,3)
      }
    }
  }
  for (int v212 = 0; v212 < 128; v212 += 1) {	// L311, [3214529464,3214566586), iterCycle=290, II=290
    for (int v213 = 0; v213 < 16; v213 += 1) {	// L312, [0,290), iterCycle=18, II=18
      for (int v214 = 0; v214 < 16; v214 += 1) {	// L313, [0,18), iterCycle=1, II=1
        v13[v212][v213][v214] = v0;	// L314, [0,1)
      }
    }
  }
  for (int v215 = 0; v215 < 128; v215 += 1) {	// L318, [3214566586,3701175740), iterCycle=3801634, II=3801634
    for (int v216 = 0; v216 < 16; v216 += 1) {	// L319, [0,3801634), iterCycle=237602, II=237602
      for (int v217 = 0; v217 < 16; v217 += 1) {	// L320, [0,237602), iterCycle=14850, II=14850
        for (int v218 = 0; v218 < 128; v218 += 1) {	// L321, [0,14850), iterCycle=116, II=116
          for (int v219 = 0; v219 < 3; v219 += 1) {	// L322, [0,116), iterCycle=38, II=38
            for (int v220 = 0; v220 < 3; v220 += 1) {	// L323, [0,38), iterCycle=12, II=12
              float v221 = v12[v218][(v216 + v219)][(v217 + v220)];	// L324, [0,2)
              float v222 = v4[v215][v218][v219][v220];	// L325, [0,2)
              float v223 = v221 * v222;	// L326, [2,6)
              float v224 = v13[v215][v216][v217];	// L327, [4,6)
              float v225 = v223 + v224;	// L328, [6,11)
              v13[v215][v216][v217] = v225;	// L329, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v226 = 0; v226 < 128; v226 += 1) {	// L336, [3701175740,3701442238), iterCycle=2082, II=2082
    for (int v227 = 0; v227 < 16; v227 += 1) {	// L337, [0,2082), iterCycle=130, II=130
      for (int v228 = 0; v228 < 16; v228 += 1) {	// L338, [0,130), iterCycle=8, II=8
        float v229 = v13[v226][v227][v228];	// L339, [0,2)
        float v230 = v11[v226][v227][v228];	// L340, [0,2)
        float v231 = v229 + v230;	// L341, [2,7)
        v14[v226][v227][v228] = v231;	// L342, [7,8)
      }
    }
  }
  for (int v232 = 0; v232 < 128; v232 += 1) {	// L346, [3701442238,3701544896), iterCycle=802, II=802
    for (int v233 = 0; v233 < 16; v233 += 1) {	// L347, [0,802), iterCycle=50, II=50
      for (int v234 = 0; v234 < 16; v234 += 1) {	// L348, [0,50), iterCycle=3, II=3
        float v235 = v14[v232][v233][v234];	// L349, [0,2)
        v14[v232][v233][v234] = v235;	// L350, [2,3)
      }
    }
  }
  for (int v236 = 0; v236 < 256; v236 += 1) {	// L354, [3701544896,3701565890), iterCycle=82, II=82
    for (int v237 = 0; v237 < 8; v237 += 1) {	// L355, [0,82), iterCycle=10, II=10
      for (int v238 = 0; v238 < 8; v238 += 1) {	// L356, [0,10), iterCycle=1, II=1
        v15[v236][v237][v238] = v0;	// L357, [0,1)
      }
    }
  }
  for (int v239 = 0; v239 < 256; v239 += 1) {	// L361, [3701565890,3944872900), iterCycle=950418, II=950418
    for (int v240 = 0; v240 < 8; v240 += 1) {	// L362, [0,950418), iterCycle=118802, II=118802
      for (int v241 = 0; v241 < 8; v241 += 1) {	// L363, [0,118802), iterCycle=14850, II=14850
        for (int v242 = 0; v242 < 128; v242 += 1) {	// L364, [0,14850), iterCycle=116, II=116
          for (int v243 = 0; v243 < 3; v243 += 1) {	// L365, [0,116), iterCycle=38, II=38
            for (int v244 = 0; v244 < 3; v244 += 1) {	// L366, [0,38), iterCycle=12, II=12
              float v245 = v14[v242][((v240 * 2) + v243)][((v241 * 2) + v244)];	// L367, [0,2)
              float v246 = v5[v239][v242][v243][v244];	// L368, [0,2)
              float v247 = v245 * v246;	// L369, [2,6)
              float v248 = v15[v239][v240][v241];	// L370, [4,6)
              float v249 = v247 + v248;	// L371, [6,11)
              v15[v239][v240][v241] = v249;	// L372, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v250 = 0; v250 < 256; v250 += 1) {	// L379, [3944872900,3944926662), iterCycle=210, II=210
    for (int v251 = 0; v251 < 8; v251 += 1) {	// L380, [0,210), iterCycle=26, II=26
      for (int v252 = 0; v252 < 8; v252 += 1) {	// L381, [0,26), iterCycle=3, II=3
        float v253 = v15[v250][v251][v252];	// L382, [0,2)
        v15[v250][v251][v252] = v253;	// L383, [2,3)
      }
    }
  }
  for (int v254 = 0; v254 < 256; v254 += 1) {	// L387, [3944926662,3944947656), iterCycle=82, II=82
    for (int v255 = 0; v255 < 8; v255 += 1) {	// L388, [0,82), iterCycle=10, II=10
      for (int v256 = 0; v256 < 8; v256 += 1) {	// L389, [0,10), iterCycle=1, II=1
        v16[v254][v255][v256] = v0;	// L390, [0,1)
      }
    }
  }
  for (int v257 = 0; v257 < 256; v257 += 1) {	// L394, [3944947656,4431524298), iterCycle=1900690, II=1900690
    for (int v258 = 0; v258 < 8; v258 += 1) {	// L395, [0,1900690), iterCycle=237586, II=237586
      for (int v259 = 0; v259 < 8; v259 += 1) {	// L396, [0,237586), iterCycle=29698, II=29698
        for (int v260 = 0; v260 < 256; v260 += 1) {	// L397, [0,29698), iterCycle=116, II=116
          for (int v261 = 0; v261 < 3; v261 += 1) {	// L398, [0,116), iterCycle=38, II=38
            for (int v262 = 0; v262 < 3; v262 += 1) {	// L399, [0,38), iterCycle=12, II=12
              float v263 = v15[v260][(v258 + v261)][(v259 + v262)];	// L400, [0,2)
              float v264 = v6[v257][v260][v261][v262];	// L401, [0,2)
              float v265 = v263 * v264;	// L402, [2,6)
              float v266 = v16[v257][v258][v259];	// L403, [4,6)
              float v267 = v265 + v266;	// L404, [6,11)
              v16[v257][v258][v259] = v267;	// L405, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v268 = 0; v268 < 256; v268 += 1) {	// L412, [4431524298,4456727500), iterCycle=98450, II=98450
    for (int v269 = 0; v269 < 8; v269 += 1) {	// L413, [0,98450), iterCycle=12306, II=12306
      for (int v270 = 0; v270 < 8; v270 += 1) {	// L414, [0,12306), iterCycle=1538, II=1538
        for (int v271 = 0; v271 < 128; v271 += 1) {	// L415, [0,1538), iterCycle=12, II=12
          float v272 = v14[v271][(v269 * 2)][(v270 * 2)];	// L416, [0,2)
          float v273 = v39[v268][v271];	// L417, [0,2)
          float v274 = v272 * v273;	// L418, [2,6)
          float v275 = v17[v268][v269][v270];	// L419, [4,6)
          float v276 = v275 + v274;	// L420, [6,11)
          v17[v268][v269][v270] = v276;	// L421, [11,12)
        }
      }
    }
  }
  for (int v277 = 0; v277 < 256; v277 += 1) {	// L426, [4456727500,4456863182), iterCycle=530, II=530
    for (int v278 = 0; v278 < 8; v278 += 1) {	// L427, [0,530), iterCycle=66, II=66
      for (int v279 = 0; v279 < 8; v279 += 1) {	// L428, [0,66), iterCycle=8, II=8
        float v280 = v17[v277][v278][v279];	// L429, [0,2)
        float v281 = v16[v277][v278][v279];	// L430, [0,2)
        float v282 = v280 + v281;	// L431, [2,7)
        v18[v277][v278][v279] = v282;	// L432, [7,8)
      }
    }
  }
  for (int v283 = 0; v283 < 256; v283 += 1) {	// L436, [4456863182,4456916944), iterCycle=210, II=210
    for (int v284 = 0; v284 < 8; v284 += 1) {	// L437, [0,210), iterCycle=26, II=26
      for (int v285 = 0; v285 < 8; v285 += 1) {	// L438, [0,26), iterCycle=3, II=3
        float v286 = v18[v283][v284][v285];	// L439, [0,2)
        v18[v283][v284][v285] = v286;	// L440, [2,3)
      }
    }
  }
  for (int v287 = 0; v287 < 256; v287 += 1) {	// L444, [4456916944,4456937938), iterCycle=82, II=82
    for (int v288 = 0; v288 < 8; v288 += 1) {	// L445, [0,82), iterCycle=10, II=10
      for (int v289 = 0; v289 < 8; v289 += 1) {	// L446, [0,10), iterCycle=1, II=1
        v19[v287][v288][v289] = v0;	// L447, [0,1)
      }
    }
  }
  for (int v290 = 0; v290 < 256; v290 += 1) {	// L451, [4456937938,4943514580), iterCycle=1900690, II=1900690
    for (int v291 = 0; v291 < 8; v291 += 1) {	// L452, [0,1900690), iterCycle=237586, II=237586
      for (int v292 = 0; v292 < 8; v292 += 1) {	// L453, [0,237586), iterCycle=29698, II=29698
        for (int v293 = 0; v293 < 256; v293 += 1) {	// L454, [0,29698), iterCycle=116, II=116
          for (int v294 = 0; v294 < 3; v294 += 1) {	// L455, [0,116), iterCycle=38, II=38
            for (int v295 = 0; v295 < 3; v295 += 1) {	// L456, [0,38), iterCycle=12, II=12
              float v296 = v18[v293][(v291 + v294)][(v292 + v295)];	// L457, [0,2)
              float v297 = v6[v290][v293][v294][v295];	// L458, [0,2)
              float v298 = v296 * v297;	// L459, [2,6)
              float v299 = v19[v290][v291][v292];	// L460, [4,6)
              float v300 = v298 + v299;	// L461, [6,11)
              v19[v290][v291][v292] = v300;	// L462, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v301 = 0; v301 < 256; v301 += 1) {	// L469, [4943514580,4943568342), iterCycle=210, II=210
    for (int v302 = 0; v302 < 8; v302 += 1) {	// L470, [0,210), iterCycle=26, II=26
      for (int v303 = 0; v303 < 8; v303 += 1) {	// L471, [0,26), iterCycle=3, II=3
        float v304 = v19[v301][v302][v303];	// L472, [0,2)
        v19[v301][v302][v303] = v304;	// L473, [2,3)
      }
    }
  }
  for (int v305 = 0; v305 < 256; v305 += 1) {	// L477, [4943568342,4943589336), iterCycle=82, II=82
    for (int v306 = 0; v306 < 8; v306 += 1) {	// L478, [0,82), iterCycle=10, II=10
      for (int v307 = 0; v307 < 8; v307 += 1) {	// L479, [0,10), iterCycle=1, II=1
        v21[v305][v306][v307] = v0;	// L480, [0,1)
      }
    }
  }
  for (int v308 = 0; v308 < 256; v308 += 1) {	// L484, [4943589336,5430165978), iterCycle=1900690, II=1900690
    for (int v309 = 0; v309 < 8; v309 += 1) {	// L485, [0,1900690), iterCycle=237586, II=237586
      for (int v310 = 0; v310 < 8; v310 += 1) {	// L486, [0,237586), iterCycle=29698, II=29698
        for (int v311 = 0; v311 < 256; v311 += 1) {	// L487, [0,29698), iterCycle=116, II=116
          for (int v312 = 0; v312 < 3; v312 += 1) {	// L488, [0,116), iterCycle=38, II=38
            for (int v313 = 0; v313 < 3; v313 += 1) {	// L489, [0,38), iterCycle=12, II=12
              float v314 = v19[v311][(v309 + v312)][(v310 + v313)];	// L490, [0,2)
              float v315 = v6[v308][v311][v312][v313];	// L491, [0,2)
              float v316 = v314 * v315;	// L492, [2,6)
              float v317 = v21[v308][v309][v310];	// L493, [4,6)
              float v318 = v316 + v317;	// L494, [6,11)
              v21[v308][v309][v310] = v318;	// L495, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v319 = 0; v319 < 256; v319 += 1) {	// L502, [5430165978,5430301660), iterCycle=530, II=530
    for (int v320 = 0; v320 < 8; v320 += 1) {	// L503, [0,530), iterCycle=66, II=66
      for (int v321 = 0; v321 < 8; v321 += 1) {	// L504, [0,66), iterCycle=8, II=8
        float v322 = v21[v319][v320][v321];	// L505, [0,2)
        float v323 = v18[v319][v320][v321];	// L506, [0,2)
        float v324 = v322 + v323;	// L507, [2,7)
        v22[v319][v320][v321] = v324;	// L508, [7,8)
      }
    }
  }
  for (int v325 = 0; v325 < 256; v325 += 1) {	// L512, [5430301660,5430355422), iterCycle=210, II=210
    for (int v326 = 0; v326 < 8; v326 += 1) {	// L513, [0,210), iterCycle=26, II=26
      for (int v327 = 0; v327 < 8; v327 += 1) {	// L514, [0,26), iterCycle=3, II=3
        float v328 = v22[v325][v326][v327];	// L515, [0,2)
        v22[v325][v326][v327] = v328;	// L516, [2,3)
      }
    }
  }
  for (int v329 = 0; v329 < 512; v329 += 1) {	// L520, [5430355422,5430368736), iterCycle=26, II=26
    for (int v330 = 0; v330 < 4; v330 += 1) {	// L521, [0,26), iterCycle=6, II=6
      for (int v331 = 0; v331 < 4; v331 += 1) {	// L522, [0,6), iterCycle=1, II=1
        v23[v329][v330][v331] = v0;	// L523, [0,1)
      }
    }
  }
  for (int v332 = 0; v332 < 512; v332 += 1) {	// L527, [5430368736,5673659874), iterCycle=475178, II=475178
    for (int v333 = 0; v333 < 4; v333 += 1) {	// L528, [0,475178), iterCycle=118794, II=118794
      for (int v334 = 0; v334 < 4; v334 += 1) {	// L529, [0,118794), iterCycle=29698, II=29698
        for (int v335 = 0; v335 < 256; v335 += 1) {	// L530, [0,29698), iterCycle=116, II=116
          for (int v336 = 0; v336 < 3; v336 += 1) {	// L531, [0,116), iterCycle=38, II=38
            for (int v337 = 0; v337 < 3; v337 += 1) {	// L532, [0,38), iterCycle=12, II=12
              float v338 = v22[v335][((v333 * 2) + v336)][((v334 * 2) + v337)];	// L533, [0,2)
              float v339 = v7[v332][v335][v336][v337];	// L534, [0,2)
              float v340 = v338 * v339;	// L535, [2,6)
              float v341 = v23[v332][v333][v334];	// L536, [4,6)
              float v342 = v340 + v341;	// L537, [6,11)
              v23[v332][v333][v334] = v342;	// L538, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v343 = 0; v343 < 512; v343 += 1) {	// L545, [5673659874,5673689572), iterCycle=58, II=58
    for (int v344 = 0; v344 < 4; v344 += 1) {	// L546, [0,58), iterCycle=14, II=14
      for (int v345 = 0; v345 < 4; v345 += 1) {	// L547, [0,14), iterCycle=3, II=3
        float v346 = v23[v343][v344][v345];	// L548, [0,2)
        v23[v343][v344][v345] = v346;	// L549, [2,3)
      }
    }
  }
  for (int v347 = 0; v347 < 512; v347 += 1) {	// L553, [5673689572,5673702886), iterCycle=26, II=26
    for (int v348 = 0; v348 < 4; v348 += 1) {	// L554, [0,26), iterCycle=6, II=6
      for (int v349 = 0; v349 < 4; v349 += 1) {	// L555, [0,6), iterCycle=1, II=1
        v24[v347][v348][v349] = v0;	// L556, [0,1)
      }
    }
  }
  for (int v350 = 0; v350 < 512; v350 += 1) {	// L560, [5673702886,6160263656), iterCycle=950314, II=950314
    for (int v351 = 0; v351 < 4; v351 += 1) {	// L561, [0,950314), iterCycle=237578, II=237578
      for (int v352 = 0; v352 < 4; v352 += 1) {	// L562, [0,237578), iterCycle=59394, II=59394
        for (int v353 = 0; v353 < 512; v353 += 1) {	// L563, [0,59394), iterCycle=116, II=116
          for (int v354 = 0; v354 < 3; v354 += 1) {	// L564, [0,116), iterCycle=38, II=38
            for (int v355 = 0; v355 < 3; v355 += 1) {	// L565, [0,38), iterCycle=12, II=12
              float v356 = v23[v353][(v351 + v354)][(v352 + v355)];	// L566, [0,2)
              float v357 = v8[v350][v353][v354][v355];	// L567, [0,2)
              float v358 = v356 * v357;	// L568, [2,6)
              float v359 = v24[v350][v351][v352];	// L569, [4,6)
              float v360 = v358 + v359;	// L570, [6,11)
              v24[v350][v351][v352] = v360;	// L571, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v361 = 0; v361 < 512; v361 += 1) {	// L578, [6160263656,6185450986), iterCycle=49194, II=49194
    for (int v362 = 0; v362 < 4; v362 += 1) {	// L579, [0,49194), iterCycle=12298, II=12298
      for (int v363 = 0; v363 < 4; v363 += 1) {	// L580, [0,12298), iterCycle=3074, II=3074
        for (int v364 = 0; v364 < 256; v364 += 1) {	// L581, [0,3074), iterCycle=12, II=12
          float v365 = v22[v364][(v362 * 2)][(v363 * 2)];	// L582, [0,2)
          float v366 = v40[v361][v364];	// L583, [0,2)
          float v367 = v365 * v366;	// L584, [2,6)
          float v368 = v25[v361][v362][v363];	// L585, [4,6)
          float v369 = v368 + v367;	// L586, [6,11)
          v25[v361][v362][v363] = v369;	// L587, [11,12)
        }
      }
    }
  }
  for (int v370 = 0; v370 < 512; v370 += 1) {	// L592, [6185450986,6185521644), iterCycle=138, II=138
    for (int v371 = 0; v371 < 4; v371 += 1) {	// L593, [0,138), iterCycle=34, II=34
      for (int v372 = 0; v372 < 4; v372 += 1) {	// L594, [0,34), iterCycle=8, II=8
        float v373 = v25[v370][v371][v372];	// L595, [0,2)
        float v374 = v24[v370][v371][v372];	// L596, [0,2)
        float v375 = v373 + v374;	// L597, [2,7)
        v26[v370][v371][v372] = v375;	// L598, [7,8)
      }
    }
  }
  for (int v376 = 0; v376 < 512; v376 += 1) {	// L602, [6185521644,6185551342), iterCycle=58, II=58
    for (int v377 = 0; v377 < 4; v377 += 1) {	// L603, [0,58), iterCycle=14, II=14
      for (int v378 = 0; v378 < 4; v378 += 1) {	// L604, [0,14), iterCycle=3, II=3
        float v379 = v26[v376][v377][v378];	// L605, [0,2)
        v26[v376][v377][v378] = v379;	// L606, [2,3)
      }
    }
  }
  for (int v380 = 0; v380 < 512; v380 += 1) {	// L610, [6185551342,6185564656), iterCycle=26, II=26
    for (int v381 = 0; v381 < 4; v381 += 1) {	// L611, [0,26), iterCycle=6, II=6
      for (int v382 = 0; v382 < 4; v382 += 1) {	// L612, [0,6), iterCycle=1, II=1
        v27[v380][v381][v382] = v0;	// L613, [0,1)
      }
    }
  }
  for (int v383 = 0; v383 < 512; v383 += 1) {	// L617, [6185564656,6672125426), iterCycle=950314, II=950314
    for (int v384 = 0; v384 < 4; v384 += 1) {	// L618, [0,950314), iterCycle=237578, II=237578
      for (int v385 = 0; v385 < 4; v385 += 1) {	// L619, [0,237578), iterCycle=59394, II=59394
        for (int v386 = 0; v386 < 512; v386 += 1) {	// L620, [0,59394), iterCycle=116, II=116
          for (int v387 = 0; v387 < 3; v387 += 1) {	// L621, [0,116), iterCycle=38, II=38
            for (int v388 = 0; v388 < 3; v388 += 1) {	// L622, [0,38), iterCycle=12, II=12
              float v389 = v26[v386][(v384 + v387)][(v385 + v388)];	// L623, [0,2)
              float v390 = v8[v383][v386][v387][v388];	// L624, [0,2)
              float v391 = v389 * v390;	// L625, [2,6)
              float v392 = v27[v383][v384][v385];	// L626, [4,6)
              float v393 = v391 + v392;	// L627, [6,11)
              v27[v383][v384][v385] = v393;	// L628, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v394 = 0; v394 < 512; v394 += 1) {	// L635, [6672125426,6672155124), iterCycle=58, II=58
    for (int v395 = 0; v395 < 4; v395 += 1) {	// L636, [0,58), iterCycle=14, II=14
      for (int v396 = 0; v396 < 4; v396 += 1) {	// L637, [0,14), iterCycle=3, II=3
        float v397 = v27[v394][v395][v396];	// L638, [0,2)
        v27[v394][v395][v396] = v397;	// L639, [2,3)
      }
    }
  }
  for (int v398 = 0; v398 < 512; v398 += 1) {	// L643, [6672155124,6672168438), iterCycle=26, II=26
    for (int v399 = 0; v399 < 4; v399 += 1) {	// L644, [0,26), iterCycle=6, II=6
      for (int v400 = 0; v400 < 4; v400 += 1) {	// L645, [0,6), iterCycle=1, II=1
        v28[v398][v399][v400] = v0;	// L646, [0,1)
      }
    }
  }
  for (int v401 = 0; v401 < 512; v401 += 1) {	// L650, [6672168438,7158729208), iterCycle=950314, II=950314
    for (int v402 = 0; v402 < 4; v402 += 1) {	// L651, [0,950314), iterCycle=237578, II=237578
      for (int v403 = 0; v403 < 4; v403 += 1) {	// L652, [0,237578), iterCycle=59394, II=59394
        for (int v404 = 0; v404 < 512; v404 += 1) {	// L653, [0,59394), iterCycle=116, II=116
          for (int v405 = 0; v405 < 3; v405 += 1) {	// L654, [0,116), iterCycle=38, II=38
            for (int v406 = 0; v406 < 3; v406 += 1) {	// L655, [0,38), iterCycle=12, II=12
              float v407 = v27[v404][(v402 + v405)][(v403 + v406)];	// L656, [0,2)
              float v408 = v8[v401][v404][v405][v406];	// L657, [0,2)
              float v409 = v407 * v408;	// L658, [2,6)
              float v410 = v28[v401][v402][v403];	// L659, [4,6)
              float v411 = v409 + v410;	// L660, [6,11)
              v28[v401][v402][v403] = v411;	// L661, [11,12)
            }
          }
        }
      }
    }
  }
  for (int v412 = 0; v412 < 512; v412 += 1) {	// L668, [7158729208,7158799866), iterCycle=138, II=138
    for (int v413 = 0; v413 < 4; v413 += 1) {	// L669, [0,138), iterCycle=34, II=34
      for (int v414 = 0; v414 < 4; v414 += 1) {	// L670, [0,34), iterCycle=8, II=8
        float v415 = v28[v412][v413][v414];	// L671, [0,2)
        float v416 = v26[v412][v413][v414];	// L672, [0,2)
        float v417 = v415 + v416;	// L673, [2,7)
        v29[v412][v413][v414] = v417;	// L674, [7,8)
      }
    }
  }
  for (int v418 = 0; v418 < 512; v418 += 1) {	// L678, [7158799866,7158829564), iterCycle=58, II=58
    for (int v419 = 0; v419 < 4; v419 += 1) {	// L679, [0,58), iterCycle=14, II=14
      for (int v420 = 0; v420 < 4; v420 += 1) {	// L680, [0,14), iterCycle=3, II=3
        float v421 = v29[v418][v419][v420];	// L681, [0,2)
        v29[v418][v419][v420] = v421;	// L682, [2,3)
      }
    }
  }
}

