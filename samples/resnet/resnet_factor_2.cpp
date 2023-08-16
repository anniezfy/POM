
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
/// Latency=631189689, interval=631189689
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
) {	// L2, [0,631189689)
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
        #pragma HLS PIPELINE off
        v9[v41][v42][v43] = v0;	// L6, [0,1)
      }
    }
  }
  for (int v44 = 0; v44 < 3; v44 += 1) {	// L10, [69762,1839247), iterCycle=13, II=2
    for (int v45 = 0; v45 < 3; v45 += 1) {	// L11, [629350440,629940277), iterCycle=13, II=2
      for (int v46 = 0; v46 < 3; v46 += 1) {	// L12, [629350440,629547061), iterCycle=13, II=2
        for (int v47 = 0; v47 < 32; v47 += 1) {	// L13, [629350440,629415989), iterCycle=13, II=2
          for (int v48 = 0; v48 < 32; v48 += 1) {	// L14, [629350440,629352501), iterCycle=13, II=2
            for (int v49 = 0; v49 < 32; v49 += 1) {	// L15, [629350440,629350517), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v50 = v37[v44][(v48 + v45)][(v49 + v46)];	// L16, [0,2)
              float v51 = v1[(v47 * 2)][v44][v45][v46];	// L17, [0,2)
              float v52 = v50 * v51;	// L18, [2,6)
              float v53 = v9[(v47 * 2)][v48][v49];	// L19, [4,6)
              float v54 = v52 + v53;	// L20, [6,11)
              v9[(v47 * 2)][v48][v49] = v54;	// L21, [11,12)
              float v55 = v1[((v47 * 2) + 1)][v44][v45][v46];	// L22, [1,3)
              float v56 = v50 * v55;	// L23, [3,7)
              float v57 = v9[((v47 * 2) + 1)][v48][v49];	// L24, [5,7)
              float v58 = v56 + v57;	// L25, [7,12)
              v9[((v47 * 2) + 1)][v48][v49] = v58;	// L26, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v59 = 0; v59 < 64; v59 += 1) {	// L33, [1839247,2040081), iterCycle=3138, II=3138
    for (int v60 = 0; v60 < 32; v60 += 1) {	// L34, [0,3138), iterCycle=98, II=98
      for (int v61 = 0; v61 < 32; v61 += 1) {	// L35, [0,98), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v62 = v9[v59][v60][v61];	// L36, [0,2)
        v9[v59][v60][v61] = v62;	// L37, [2,3)
      }
    }
  }
  for (int v63 = 0; v63 < 64; v63 += 1) {	// L41, [2040081,2109843), iterCycle=1090, II=1090
    for (int v64 = 0; v64 < 32; v64 += 1) {	// L42, [0,1090), iterCycle=34, II=34
      for (int v65 = 0; v65 < 32; v65 += 1) {	// L43, [0,34), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v20[v63][v64][v65] = v0;	// L44, [0,1)
      }
    }
  }
  for (int v66 = 0; v66 < 64; v66 += 1) {	// L48, [2109843,39858592), iterCycle=13, II=2
    for (int v67 = 0; v67 < 3; v67 += 1) {	// L49, [591331095,591920932), iterCycle=13, II=2
      for (int v68 = 0; v68 < 3; v68 += 1) {	// L50, [591331095,591527716), iterCycle=13, II=2
        for (int v69 = 0; v69 < 32; v69 += 1) {	// L51, [591331095,591396644), iterCycle=13, II=2
          for (int v70 = 0; v70 < 32; v70 += 1) {	// L52, [591331095,591333156), iterCycle=13, II=2
            for (int v71 = 0; v71 < 32; v71 += 1) {	// L53, [591331095,591331172), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v72 = v9[v66][(v70 + v67)][(v71 + v68)];	// L54, [0,2)
              float v73 = v2[(v69 * 2)][v66][v67][v68];	// L55, [0,2)
              float v74 = v72 * v73;	// L56, [2,6)
              float v75 = v20[(v69 * 2)][v70][v71];	// L57, [4,6)
              float v76 = v74 + v75;	// L58, [6,11)
              v20[(v69 * 2)][v70][v71] = v76;	// L59, [11,12)
              float v77 = v2[((v69 * 2) + 1)][v66][v67][v68];	// L60, [1,3)
              float v78 = v72 * v77;	// L61, [3,7)
              float v79 = v20[((v69 * 2) + 1)][v70][v71];	// L62, [5,7)
              float v80 = v78 + v79;	// L63, [7,12)
              v20[((v69 * 2) + 1)][v70][v71] = v80;	// L64, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v81 = 0; v81 < 64; v81 += 1) {	// L71, [39858592,40059426), iterCycle=3138, II=3138
    for (int v82 = 0; v82 < 32; v82 += 1) {	// L72, [0,3138), iterCycle=98, II=98
      for (int v83 = 0; v83 < 32; v83 += 1) {	// L73, [0,98), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v84 = v20[v81][v82][v83];	// L74, [0,2)
        v20[v81][v82][v83] = v84;	// L75, [2,3)
      }
    }
  }
  for (int v85 = 0; v85 < 64; v85 += 1) {	// L79, [40059426,40129188), iterCycle=1090, II=1090
    for (int v86 = 0; v86 < 32; v86 += 1) {	// L80, [0,1090), iterCycle=34, II=34
      for (int v87 = 0; v87 < 32; v87 += 1) {	// L81, [0,34), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v30[v85][v86][v87] = v0;	// L82, [0,1)
      }
    }
  }
  for (int v88 = 0; v88 < 64; v88 += 1) {	// L86, [40129188,77877937), iterCycle=13, II=2
    for (int v89 = 0; v89 < 3; v89 += 1) {	// L87, [553311750,553901587), iterCycle=13, II=2
      for (int v90 = 0; v90 < 3; v90 += 1) {	// L88, [553311750,553508371), iterCycle=13, II=2
        for (int v91 = 0; v91 < 32; v91 += 1) {	// L89, [553311750,553377299), iterCycle=13, II=2
          for (int v92 = 0; v92 < 32; v92 += 1) {	// L90, [553311750,553313811), iterCycle=13, II=2
            for (int v93 = 0; v93 < 32; v93 += 1) {	// L91, [553311750,553311827), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v94 = v20[v88][(v92 + v89)][(v93 + v90)];	// L92, [0,2)
              float v95 = v2[(v91 * 2)][v88][v89][v90];	// L93, [0,2)
              float v96 = v94 * v95;	// L94, [2,6)
              float v97 = v30[(v91 * 2)][v92][v93];	// L95, [4,6)
              float v98 = v96 + v97;	// L96, [6,11)
              v30[(v91 * 2)][v92][v93] = v98;	// L97, [11,12)
              float v99 = v2[((v91 * 2) + 1)][v88][v89][v90];	// L98, [1,3)
              float v100 = v94 * v99;	// L99, [3,7)
              float v101 = v30[((v91 * 2) + 1)][v92][v93];	// L100, [5,7)
              float v102 = v100 + v101;	// L101, [7,12)
              v30[((v91 * 2) + 1)][v92][v93] = v102;	// L102, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v103 = 0; v103 < 64; v103 += 1) {	// L109, [77877937,78406451), iterCycle=8258, II=8258
    for (int v104 = 0; v104 < 32; v104 += 1) {	// L110, [0,8258), iterCycle=258, II=258
      for (int v105 = 0; v105 < 32; v105 += 1) {	// L111, [0,258), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v106 = v30[v103][v104][v105];	// L112, [0,2)
        float v107 = v9[v103][v104][v105];	// L113, [0,2)
        float v108 = v106 + v107;	// L114, [2,7)
        v31[v103][v104][v105] = v108;	// L115, [7,8)
      }
    }
  }
  for (int v109 = 0; v109 < 64; v109 += 1) {	// L119, [78406451,78607285), iterCycle=3138, II=3138
    for (int v110 = 0; v110 < 32; v110 += 1) {	// L120, [0,3138), iterCycle=98, II=98
      for (int v111 = 0; v111 < 32; v111 += 1) {	// L121, [0,98), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v112 = v31[v109][v110][v111];	// L122, [0,2)
        v31[v109][v110][v111] = v112;	// L123, [2,3)
      }
    }
  }
  for (int v113 = 0; v113 < 64; v113 += 1) {	// L127, [78607285,78677047), iterCycle=1090, II=1090
    for (int v114 = 0; v114 < 32; v114 += 1) {	// L128, [0,1090), iterCycle=34, II=34
      for (int v115 = 0; v115 < 32; v115 += 1) {	// L129, [0,34), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v32[v113][v114][v115] = v0;	// L130, [0,1)
      }
    }
  }
  for (int v116 = 0; v116 < 64; v116 += 1) {	// L134, [78677047,116425796), iterCycle=13, II=2
    for (int v117 = 0; v117 < 3; v117 += 1) {	// L135, [514763891,515353728), iterCycle=13, II=2
      for (int v118 = 0; v118 < 3; v118 += 1) {	// L136, [514763891,514960512), iterCycle=13, II=2
        for (int v119 = 0; v119 < 32; v119 += 1) {	// L137, [514763891,514829440), iterCycle=13, II=2
          for (int v120 = 0; v120 < 32; v120 += 1) {	// L138, [514763891,514765952), iterCycle=13, II=2
            for (int v121 = 0; v121 < 32; v121 += 1) {	// L139, [514763891,514763968), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v122 = v31[v116][(v120 + v117)][(v121 + v118)];	// L140, [0,2)
              float v123 = v2[(v119 * 2)][v116][v117][v118];	// L141, [0,2)
              float v124 = v122 * v123;	// L142, [2,6)
              float v125 = v32[(v119 * 2)][v120][v121];	// L143, [4,6)
              float v126 = v124 + v125;	// L144, [6,11)
              v32[(v119 * 2)][v120][v121] = v126;	// L145, [11,12)
              float v127 = v2[((v119 * 2) + 1)][v116][v117][v118];	// L146, [1,3)
              float v128 = v122 * v127;	// L147, [3,7)
              float v129 = v32[((v119 * 2) + 1)][v120][v121];	// L148, [5,7)
              float v130 = v128 + v129;	// L149, [7,12)
              v32[((v119 * 2) + 1)][v120][v121] = v130;	// L150, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v131 = 0; v131 < 64; v131 += 1) {	// L157, [116425796,116626630), iterCycle=3138, II=3138
    for (int v132 = 0; v132 < 32; v132 += 1) {	// L158, [0,3138), iterCycle=98, II=98
      for (int v133 = 0; v133 < 32; v133 += 1) {	// L159, [0,98), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v134 = v32[v131][v132][v133];	// L160, [0,2)
        v32[v131][v132][v133] = v134;	// L161, [2,3)
      }
    }
  }
  for (int v135 = 0; v135 < 64; v135 += 1) {	// L165, [116626630,116696392), iterCycle=1090, II=1090
    for (int v136 = 0; v136 < 32; v136 += 1) {	// L166, [0,1090), iterCycle=34, II=34
      for (int v137 = 0; v137 < 32; v137 += 1) {	// L167, [0,34), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v33[v135][v136][v137] = v0;	// L168, [0,1)
      }
    }
  }
  for (int v138 = 0; v138 < 64; v138 += 1) {	// L172, [116696392,154445141), iterCycle=13, II=2
    for (int v139 = 0; v139 < 3; v139 += 1) {	// L173, [476744546,477334383), iterCycle=13, II=2
      for (int v140 = 0; v140 < 3; v140 += 1) {	// L174, [476744546,476941167), iterCycle=13, II=2
        for (int v141 = 0; v141 < 32; v141 += 1) {	// L175, [476744546,476810095), iterCycle=13, II=2
          for (int v142 = 0; v142 < 32; v142 += 1) {	// L176, [476744546,476746607), iterCycle=13, II=2
            for (int v143 = 0; v143 < 32; v143 += 1) {	// L177, [476744546,476744623), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v144 = v32[v138][(v142 + v139)][(v143 + v140)];	// L178, [0,2)
              float v145 = v2[(v141 * 2)][v138][v139][v140];	// L179, [0,2)
              float v146 = v144 * v145;	// L180, [2,6)
              float v147 = v33[(v141 * 2)][v142][v143];	// L181, [4,6)
              float v148 = v146 + v147;	// L182, [6,11)
              v33[(v141 * 2)][v142][v143] = v148;	// L183, [11,12)
              float v149 = v2[((v141 * 2) + 1)][v138][v139][v140];	// L184, [1,3)
              float v150 = v144 * v149;	// L185, [3,7)
              float v151 = v33[((v141 * 2) + 1)][v142][v143];	// L186, [5,7)
              float v152 = v150 + v151;	// L187, [7,12)
              v33[((v141 * 2) + 1)][v142][v143] = v152;	// L188, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v153 = 0; v153 < 64; v153 += 1) {	// L195, [154445141,154973655), iterCycle=8258, II=8258
    for (int v154 = 0; v154 < 32; v154 += 1) {	// L196, [0,8258), iterCycle=258, II=258
      for (int v155 = 0; v155 < 32; v155 += 1) {	// L197, [0,258), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v156 = v33[v153][v154][v155];	// L198, [0,2)
        float v157 = v31[v153][v154][v155];	// L199, [0,2)
        float v158 = v156 + v157;	// L200, [2,7)
        v34[v153][v154][v155] = v158;	// L201, [7,8)
      }
    }
  }
  for (int v159 = 0; v159 < 64; v159 += 1) {	// L205, [154973655,155174489), iterCycle=3138, II=3138
    for (int v160 = 0; v160 < 32; v160 += 1) {	// L206, [0,3138), iterCycle=98, II=98
      for (int v161 = 0; v161 < 32; v161 += 1) {	// L207, [0,98), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v162 = v34[v159][v160][v161];	// L208, [0,2)
        v34[v159][v160][v161] = v162;	// L209, [2,3)
      }
    }
  }
  for (int v163 = 0; v163 < 128; v163 += 1) {	// L213, [155174489,155211611), iterCycle=290, II=290
    for (int v164 = 0; v164 < 16; v164 += 1) {	// L214, [0,290), iterCycle=18, II=18
      for (int v165 = 0; v165 < 16; v165 += 1) {	// L215, [0,18), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v35[v163][v164][v165] = v0;	// L216, [0,1)
      }
    }
  }
  for (int v166 = 0; v166 < 64; v166 += 1) {	// L220, [155211611,174085992), iterCycle=13, II=2
    for (int v167 = 0; v167 < 3; v167 += 1) {	// L221, [457103695,457398620), iterCycle=13, II=2
      for (int v168 = 0; v168 < 3; v168 += 1) {	// L222, [457103695,457202012), iterCycle=13, II=2
        for (int v169 = 0; v169 < 64; v169 += 1) {	// L223, [457103695,457136476), iterCycle=13, II=2
          for (int v170 = 0; v170 < 16; v170 += 1) {	// L224, [457103695,457104220), iterCycle=13, II=2
            for (int v171 = 0; v171 < 16; v171 += 1) {	// L225, [457103695,457103740), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v172 = v34[v166][((v170 * 2) + v167)][((v171 * 2) + v168)];	// L226, [0,2)
              float v173 = v3[(v169 * 2)][v166][v167][v168];	// L227, [0,2)
              float v174 = v172 * v173;	// L228, [2,6)
              float v175 = v35[(v169 * 2)][v170][v171];	// L229, [4,6)
              float v176 = v174 + v175;	// L230, [6,11)
              v35[(v169 * 2)][v170][v171] = v176;	// L231, [11,12)
              float v177 = v3[((v169 * 2) + 1)][v166][v167][v168];	// L232, [1,3)
              float v178 = v172 * v177;	// L233, [3,7)
              float v179 = v35[((v169 * 2) + 1)][v170][v171];	// L234, [5,7)
              float v180 = v178 + v179;	// L235, [7,12)
              v35[((v169 * 2) + 1)][v170][v171] = v180;	// L236, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v181 = 0; v181 < 128; v181 += 1) {	// L243, [174085992,174188650), iterCycle=802, II=802
    for (int v182 = 0; v182 < 16; v182 += 1) {	// L244, [0,802), iterCycle=50, II=50
      for (int v183 = 0; v183 < 16; v183 += 1) {	// L245, [0,50), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v184 = v35[v181][v182][v183];	// L246, [0,2)
        v35[v181][v182][v183] = v184;	// L247, [2,3)
      }
    }
  }
  for (int v185 = 0; v185 < 128; v185 += 1) {	// L251, [174188650,174225772), iterCycle=290, II=290
    for (int v186 = 0; v186 < 16; v186 += 1) {	// L252, [0,290), iterCycle=18, II=18
      for (int v187 = 0; v187 < 16; v187 += 1) {	// L253, [0,18), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v36[v185][v186][v187] = v0;	// L254, [0,1)
      }
    }
  }
  for (int v188 = 0; v188 < 128; v188 += 1) {	// L258, [174225772,211974521), iterCycle=13, II=2
    for (int v189 = 0; v189 < 3; v189 += 1) {	// L259, [419215166,419510091), iterCycle=13, II=2
      for (int v190 = 0; v190 < 3; v190 += 1) {	// L260, [419215166,419313483), iterCycle=13, II=2
        for (int v191 = 0; v191 < 64; v191 += 1) {	// L261, [419215166,419247947), iterCycle=13, II=2
          for (int v192 = 0; v192 < 16; v192 += 1) {	// L262, [419215166,419215691), iterCycle=13, II=2
            for (int v193 = 0; v193 < 16; v193 += 1) {	// L263, [419215166,419215211), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v194 = v35[v188][(v192 + v189)][(v193 + v190)];	// L264, [0,2)
              float v195 = v4[(v191 * 2)][v188][v189][v190];	// L265, [0,2)
              float v196 = v194 * v195;	// L266, [2,6)
              float v197 = v36[(v191 * 2)][v192][v193];	// L267, [4,6)
              float v198 = v196 + v197;	// L268, [6,11)
              v36[(v191 * 2)][v192][v193] = v198;	// L269, [11,12)
              float v199 = v4[((v191 * 2) + 1)][v188][v189][v190];	// L270, [1,3)
              float v200 = v194 * v199;	// L271, [3,7)
              float v201 = v36[((v191 * 2) + 1)][v192][v193];	// L272, [5,7)
              float v202 = v200 + v201;	// L273, [7,12)
              v36[((v191 * 2) + 1)][v192][v193] = v202;	// L274, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v203 = 0; v203 < 64; v203 += 1) {	// L281, [211974521,237419003), iterCycle=397570, II=397570
    for (int v204 = 0; v204 < 128; v204 += 1) {	// L282, [0,397570), iterCycle=3106, II=3106
      for (int v205 = 0; v205 < 16; v205 += 1) {	// L283, [0,3106), iterCycle=194, II=194
        for (int v206 = 0; v206 < 16; v206 += 1) {	// L284, [0,194), iterCycle=12, II=12
          #pragma HLS PIPELINE off
          float v207 = v34[v203][(v205 * 2)][(v206 * 2)];	// L285, [0,2)
          float v208 = v38[v204][v203];	// L286, [0,2)
          float v209 = v207 * v208;	// L287, [2,6)
          float v210 = v10[v204][v205][v206];	// L288, [4,6)
          float v211 = v210 + v209;	// L289, [6,11)
          v10[v204][v205][v206] = v211;	// L290, [11,12)
        }
      }
    }
  }
  for (int v212 = 0; v212 < 128; v212 += 1) {	// L295, [237419003,237685501), iterCycle=2082, II=2082
    for (int v213 = 0; v213 < 16; v213 += 1) {	// L296, [0,2082), iterCycle=130, II=130
      for (int v214 = 0; v214 < 16; v214 += 1) {	// L297, [0,130), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v215 = v10[v212][v213][v214];	// L298, [0,2)
        float v216 = v36[v212][v213][v214];	// L299, [0,2)
        float v217 = v215 + v216;	// L300, [2,7)
        v11[v212][v213][v214] = v217;	// L301, [7,8)
      }
    }
  }
  for (int v218 = 0; v218 < 128; v218 += 1) {	// L305, [237685501,237788159), iterCycle=802, II=802
    for (int v219 = 0; v219 < 16; v219 += 1) {	// L306, [0,802), iterCycle=50, II=50
      for (int v220 = 0; v220 < 16; v220 += 1) {	// L307, [0,50), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v221 = v11[v218][v219][v220];	// L308, [0,2)
        v11[v218][v219][v220] = v221;	// L309, [2,3)
      }
    }
  }
  for (int v222 = 0; v222 < 128; v222 += 1) {	// L313, [237788159,237825281), iterCycle=290, II=290
    for (int v223 = 0; v223 < 16; v223 += 1) {	// L314, [0,290), iterCycle=18, II=18
      for (int v224 = 0; v224 < 16; v224 += 1) {	// L315, [0,18), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v12[v222][v223][v224] = v0;	// L316, [0,1)
      }
    }
  }
  for (int v225 = 0; v225 < 128; v225 += 1) {	// L320, [237825281,275574030), iterCycle=13, II=2
    for (int v226 = 0; v226 < 3; v226 += 1) {	// L321, [355615657,355910582), iterCycle=13, II=2
      for (int v227 = 0; v227 < 3; v227 += 1) {	// L322, [355615657,355713974), iterCycle=13, II=2
        for (int v228 = 0; v228 < 64; v228 += 1) {	// L323, [355615657,355648438), iterCycle=13, II=2
          for (int v229 = 0; v229 < 16; v229 += 1) {	// L324, [355615657,355616182), iterCycle=13, II=2
            for (int v230 = 0; v230 < 16; v230 += 1) {	// L325, [355615657,355615702), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v231 = v11[v225][(v229 + v226)][(v230 + v227)];	// L326, [0,2)
              float v232 = v4[(v228 * 2)][v225][v226][v227];	// L327, [0,2)
              float v233 = v231 * v232;	// L328, [2,6)
              float v234 = v12[(v228 * 2)][v229][v230];	// L329, [4,6)
              float v235 = v233 + v234;	// L330, [6,11)
              v12[(v228 * 2)][v229][v230] = v235;	// L331, [11,12)
              float v236 = v4[((v228 * 2) + 1)][v225][v226][v227];	// L332, [1,3)
              float v237 = v231 * v236;	// L333, [3,7)
              float v238 = v12[((v228 * 2) + 1)][v229][v230];	// L334, [5,7)
              float v239 = v237 + v238;	// L335, [7,12)
              v12[((v228 * 2) + 1)][v229][v230] = v239;	// L336, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v240 = 0; v240 < 128; v240 += 1) {	// L343, [275574030,275676688), iterCycle=802, II=802
    for (int v241 = 0; v241 < 16; v241 += 1) {	// L344, [0,802), iterCycle=50, II=50
      for (int v242 = 0; v242 < 16; v242 += 1) {	// L345, [0,50), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v243 = v12[v240][v241][v242];	// L346, [0,2)
        v12[v240][v241][v242] = v243;	// L347, [2,3)
      }
    }
  }
  for (int v244 = 0; v244 < 128; v244 += 1) {	// L351, [275676688,275713810), iterCycle=290, II=290
    for (int v245 = 0; v245 < 16; v245 += 1) {	// L352, [0,290), iterCycle=18, II=18
      for (int v246 = 0; v246 < 16; v246 += 1) {	// L353, [0,18), iterCycle=1, II=1
       #pragma HLS PIPELINE off
        v13[v244][v245][v246] = v0;	// L354, [0,1)
      }
    }
  }
  for (int v247 = 0; v247 < 128; v247 += 1) {	// L358, [275713810,313462559), iterCycle=13, II=2
    for (int v248 = 0; v248 < 3; v248 += 1) {	// L359, [317727128,318022053), iterCycle=13, II=2
      for (int v249 = 0; v249 < 3; v249 += 1) {	// L360, [317727128,317825445), iterCycle=13, II=2
        for (int v250 = 0; v250 < 64; v250 += 1) {	// L361, [317727128,317759909), iterCycle=13, II=2
          for (int v251 = 0; v251 < 16; v251 += 1) {	// L362, [317727128,317727653), iterCycle=13, II=2
            for (int v252 = 0; v252 < 16; v252 += 1) {	// L363, [317727128,317727173), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v253 = v12[v247][(v251 + v248)][(v252 + v249)];	// L364, [0,2)
              float v254 = v4[(v250 * 2)][v247][v248][v249];	// L365, [0,2)
              float v255 = v253 * v254;	// L366, [2,6)
              float v256 = v13[(v250 * 2)][v251][v252];	// L367, [4,6)
              float v257 = v255 + v256;	// L368, [6,11)
              v13[(v250 * 2)][v251][v252] = v257;	// L369, [11,12)
              float v258 = v4[((v250 * 2) + 1)][v247][v248][v249];	// L370, [1,3)
              float v259 = v253 * v258;	// L371, [3,7)
              float v260 = v13[((v250 * 2) + 1)][v251][v252];	// L372, [5,7)
              float v261 = v259 + v260;	// L373, [7,12)
              v13[((v250 * 2) + 1)][v251][v252] = v261;	// L374, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v262 = 0; v262 < 128; v262 += 1) {	// L381, [313462559,313729057), iterCycle=2082, II=2082
    for (int v263 = 0; v263 < 16; v263 += 1) {	// L382, [0,2082), iterCycle=130, II=130
      for (int v264 = 0; v264 < 16; v264 += 1) {	// L383, [0,130), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v265 = v13[v262][v263][v264];	// L384, [0,2)
        float v266 = v11[v262][v263][v264];	// L385, [0,2)
        float v267 = v265 + v266;	// L386, [2,7)
        v14[v262][v263][v264] = v267;	// L387, [7,8)
      }
    }
  }
  for (int v268 = 0; v268 < 128; v268 += 1) {	// L391, [313729057,313831715), iterCycle=802, II=802
    for (int v269 = 0; v269 < 16; v269 += 1) {	// L392, [0,802), iterCycle=50, II=50
      for (int v270 = 0; v270 < 16; v270 += 1) {	// L393, [0,50), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v271 = v14[v268][v269][v270];	// L394, [0,2)
        v14[v268][v269][v270] = v271;	// L395, [2,3)
      }
    }
  }
  for (int v272 = 0; v272 < 256; v272 += 1) {	// L399, [313831715,313852709), iterCycle=82, II=82
    for (int v273 = 0; v273 < 8; v273 += 1) {	// L400, [0,82), iterCycle=10, II=10
      for (int v274 = 0; v274 < 8; v274 += 1) {	// L401, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v15[v272][v273][v274] = v0;	// L402, [0,1)
      }
    }
  }
  for (int v275 = 0; v275 < 128; v275 += 1) {	// L406, [313852709,332727090), iterCycle=13, II=2
    for (int v276 = 0; v276 < 3; v276 += 1) {	// L407, [298462597,298610066), iterCycle=13, II=2
      for (int v277 = 0; v277 < 3; v277 += 1) {	// L408, [298462597,298511762), iterCycle=13, II=2
        for (int v278 = 0; v278 < 128; v278 += 1) {	// L409, [298462597,298478994), iterCycle=13, II=2
          for (int v279 = 0; v279 < 8; v279 += 1) {	// L410, [298462597,298462738), iterCycle=13, II=2
            for (int v280 = 0; v280 < 8; v280 += 1) {	// L411, [298462597,298462626), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v281 = v14[v275][((v279 * 2) + v276)][((v280 * 2) + v277)];	// L412, [0,2)
              float v282 = v5[(v278 * 2)][v275][v276][v277];	// L413, [0,2)
              float v283 = v281 * v282;	// L414, [2,6)
              float v284 = v15[(v278 * 2)][v279][v280];	// L415, [4,6)
              float v285 = v283 + v284;	// L416, [6,11)
              v15[(v278 * 2)][v279][v280] = v285;	// L417, [11,12)
              float v286 = v5[((v278 * 2) + 1)][v275][v276][v277];	// L418, [1,3)
              float v287 = v281 * v286;	// L419, [3,7)
              float v288 = v15[((v278 * 2) + 1)][v279][v280];	// L420, [5,7)
              float v289 = v287 + v288;	// L421, [7,12)
              v15[((v278 * 2) + 1)][v279][v280] = v289;	// L422, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v290 = 0; v290 < 256; v290 += 1) {	// L429, [332727090,332780852), iterCycle=210, II=210
    for (int v291 = 0; v291 < 8; v291 += 1) {	// L430, [0,210), iterCycle=26, II=26
      for (int v292 = 0; v292 < 8; v292 += 1) {	// L431, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v293 = v15[v290][v291][v292];	// L432, [0,2)
        v15[v290][v291][v292] = v293;	// L433, [2,3)
      }
    }
  }
  for (int v294 = 0; v294 < 256; v294 += 1) {	// L437, [332780852,332801846), iterCycle=82, II=82
    for (int v295 = 0; v295 < 8; v295 += 1) {	// L438, [0,82), iterCycle=10, II=10
      for (int v296 = 0; v296 < 8; v296 += 1) {	// L439, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v16[v294][v295][v296] = v0;	// L440, [0,1)
      }
    }
  }
  for (int v297 = 0; v297 < 256; v297 += 1) {	// L444, [332801846,370550595), iterCycle=13, II=2
    for (int v298 = 0; v298 < 3; v298 += 1) {	// L445, [260639092,260786561), iterCycle=13, II=2
      for (int v299 = 0; v299 < 3; v299 += 1) {	// L446, [260639092,260688257), iterCycle=13, II=2
        for (int v300 = 0; v300 < 128; v300 += 1) {	// L447, [260639092,260655489), iterCycle=13, II=2
          for (int v301 = 0; v301 < 8; v301 += 1) {	// L448, [260639092,260639233), iterCycle=13, II=2
            for (int v302 = 0; v302 < 8; v302 += 1) {	// L449, [260639092,260639121), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v303 = v15[v297][(v301 + v298)][(v302 + v299)];	// L450, [0,2)
              float v304 = v6[(v300 * 2)][v297][v298][v299];	// L451, [0,2)
              float v305 = v303 * v304;	// L452, [2,6)
              float v306 = v16[(v300 * 2)][v301][v302];	// L453, [4,6)
              float v307 = v305 + v306;	// L454, [6,11)
              v16[(v300 * 2)][v301][v302] = v307;	// L455, [11,12)
              float v308 = v6[((v300 * 2) + 1)][v297][v298][v299];	// L456, [1,3)
              float v309 = v303 * v308;	// L457, [3,7)
              float v310 = v16[((v300 * 2) + 1)][v301][v302];	// L458, [5,7)
              float v311 = v309 + v310;	// L459, [7,12)
              v16[((v300 * 2) + 1)][v301][v302] = v311;	// L460, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v312 = 0; v312 < 128; v312 += 1) {	// L467, [370550595,396306501), iterCycle=201218, II=201218
    for (int v313 = 0; v313 < 256; v313 += 1) {	// L468, [0,201218), iterCycle=786, II=786
      for (int v314 = 0; v314 < 8; v314 += 1) {	// L469, [0,786), iterCycle=98, II=98
        for (int v315 = 0; v315 < 8; v315 += 1) {	// L470, [0,98), iterCycle=12, II=12
          #pragma HLS PIPELINE off
          float v316 = v14[v312][(v314 * 2)][(v315 * 2)];	// L471, [0,2)
          float v317 = v39[v313][v312];	// L472, [0,2)
          float v318 = v316 * v317;	// L473, [2,6)
          float v319 = v17[v313][v314][v315];	// L474, [4,6)
          float v320 = v319 + v318;	// L475, [6,11)
          v17[v313][v314][v315] = v320;	// L476, [11,12)
        }
      }
    }
  }
  for (int v321 = 0; v321 < 256; v321 += 1) {	// L481, [396306501,396442183), iterCycle=530, II=530
    for (int v322 = 0; v322 < 8; v322 += 1) {	// L482, [0,530), iterCycle=66, II=66
      for (int v323 = 0; v323 < 8; v323 += 1) {	// L483, [0,66), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v324 = v17[v321][v322][v323];	// L484, [0,2)
        float v325 = v16[v321][v322][v323];	// L485, [0,2)
        float v326 = v324 + v325;	// L486, [2,7)
        v18[v321][v322][v323] = v326;	// L487, [7,8)
      }
    }
  }
  for (int v327 = 0; v327 < 256; v327 += 1) {	// L491, [396442183,396495945), iterCycle=210, II=210
    for (int v328 = 0; v328 < 8; v328 += 1) {	// L492, [0,210), iterCycle=26, II=26
      for (int v329 = 0; v329 < 8; v329 += 1) {	// L493, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v330 = v18[v327][v328][v329];	// L494, [0,2)
        v18[v327][v328][v329] = v330;	// L495, [2,3)
      }
    }
  }
  for (int v331 = 0; v331 < 256; v331 += 1) {	// L499, [396495945,396516939), iterCycle=82, II=82
    for (int v332 = 0; v332 < 8; v332 += 1) {	// L500, [0,82), iterCycle=10, II=10
      for (int v333 = 0; v333 < 8; v333 += 1) {	// L501, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v19[v331][v332][v333] = v0;	// L502, [0,1)
      }
    }
  }
  for (int v334 = 0; v334 < 256; v334 += 1) {	// L506, [396516939,434265688), iterCycle=13, II=2
    for (int v335 = 0; v335 < 3; v335 += 1) {	// L507, [196923999,197071468), iterCycle=13, II=2
      for (int v336 = 0; v336 < 3; v336 += 1) {	// L508, [196923999,196973164), iterCycle=13, II=2
        for (int v337 = 0; v337 < 128; v337 += 1) {	// L509, [196923999,196940396), iterCycle=13, II=2
          for (int v338 = 0; v338 < 8; v338 += 1) {	// L510, [196923999,196924140), iterCycle=13, II=2
            for (int v339 = 0; v339 < 8; v339 += 1) {	// L511, [196923999,196924028), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v340 = v18[v334][(v338 + v335)][(v339 + v336)];	// L512, [0,2)
              float v341 = v6[(v337 * 2)][v334][v335][v336];	// L513, [0,2)
              float v342 = v340 * v341;	// L514, [2,6)
              float v343 = v19[(v337 * 2)][v338][v339];	// L515, [4,6)
              float v344 = v342 + v343;	// L516, [6,11)
              v19[(v337 * 2)][v338][v339] = v344;	// L517, [11,12)
              float v345 = v6[((v337 * 2) + 1)][v334][v335][v336];	// L518, [1,3)
              float v346 = v340 * v345;	// L519, [3,7)
              float v347 = v19[((v337 * 2) + 1)][v338][v339];	// L520, [5,7)
              float v348 = v346 + v347;	// L521, [7,12)
              v19[((v337 * 2) + 1)][v338][v339] = v348;	// L522, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v349 = 0; v349 < 256; v349 += 1) {	// L529, [434265688,434319450), iterCycle=210, II=210
    for (int v350 = 0; v350 < 8; v350 += 1) {	// L530, [0,210), iterCycle=26, II=26
      for (int v351 = 0; v351 < 8; v351 += 1) {	// L531, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v352 = v19[v349][v350][v351];	// L532, [0,2)
        v19[v349][v350][v351] = v352;	// L533, [2,3)
      }
    }
  }
  for (int v353 = 0; v353 < 256; v353 += 1) {	// L537, [434319450,434340444), iterCycle=82, II=82
    for (int v354 = 0; v354 < 8; v354 += 1) {	// L538, [0,82), iterCycle=10, II=10
      for (int v355 = 0; v355 < 8; v355 += 1) {	// L539, [0,10), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v21[v353][v354][v355] = v0;	// L540, [0,1)
      }
    }
  }
  for (int v356 = 0; v356 < 256; v356 += 1) {	// L544, [434340444,472089193), iterCycle=13, II=2
    for (int v357 = 0; v357 < 3; v357 += 1) {	// L545, [159100494,159247963), iterCycle=13, II=2
      for (int v358 = 0; v358 < 3; v358 += 1) {	// L546, [159100494,159149659), iterCycle=13, II=2
        for (int v359 = 0; v359 < 128; v359 += 1) {	// L547, [159100494,159116891), iterCycle=13, II=2
          for (int v360 = 0; v360 < 8; v360 += 1) {	// L548, [159100494,159100635), iterCycle=13, II=2
            for (int v361 = 0; v361 < 8; v361 += 1) {	// L549, [159100494,159100523), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v362 = v19[v356][(v360 + v357)][(v361 + v358)];	// L550, [0,2)
              float v363 = v6[(v359 * 2)][v356][v357][v358];	// L551, [0,2)
              float v364 = v362 * v363;	// L552, [2,6)
              float v365 = v21[(v359 * 2)][v360][v361];	// L553, [4,6)
              float v366 = v364 + v365;	// L554, [6,11)
              v21[(v359 * 2)][v360][v361] = v366;	// L555, [11,12)
              float v367 = v6[((v359 * 2) + 1)][v356][v357][v358];	// L556, [1,3)
              float v368 = v362 * v367;	// L557, [3,7)
              float v369 = v21[((v359 * 2) + 1)][v360][v361];	// L558, [5,7)
              float v370 = v368 + v369;	// L559, [7,12)
              v21[((v359 * 2) + 1)][v360][v361] = v370;	// L560, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v371 = 0; v371 < 256; v371 += 1) {	// L567, [472089193,472224875), iterCycle=530, II=530
    for (int v372 = 0; v372 < 8; v372 += 1) {	// L568, [0,530), iterCycle=66, II=66
      for (int v373 = 0; v373 < 8; v373 += 1) {	// L569, [0,66), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v374 = v21[v371][v372][v373];	// L570, [0,2)
        float v375 = v18[v371][v372][v373];	// L571, [0,2)
        float v376 = v374 + v375;	// L572, [2,7)
        v22[v371][v372][v373] = v376;	// L573, [7,8)
      }
    }
  }
  for (int v377 = 0; v377 < 256; v377 += 1) {	// L577, [472224875,472278637), iterCycle=210, II=210
    for (int v378 = 0; v378 < 8; v378 += 1) {	// L578, [0,210), iterCycle=26, II=26
      for (int v379 = 0; v379 < 8; v379 += 1) {	// L579, [0,26), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v380 = v22[v377][v378][v379];	// L580, [0,2)
        v22[v377][v378][v379] = v380;	// L581, [2,3)
      }
    }
  }
  for (int v381 = 0; v381 < 512; v381 += 1) {	// L585, [472278637,472291951), iterCycle=26, II=26
    for (int v382 = 0; v382 < 4; v382 += 1) {	// L586, [0,26), iterCycle=6, II=6
      for (int v383 = 0; v383 < 4; v383 += 1) {	// L587, [0,6), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v23[v381][v382][v383] = v0;	// L588, [0,1)
      }
    }
  }
  for (int v384 = 0; v384 < 256; v384 += 1) {	// L592, [472291951,491166332), iterCycle=13, II=2
    for (int v385 = 0; v385 < 3; v385 += 1) {	// L593, [140023355,140097096), iterCycle=13, II=2
      for (int v386 = 0; v386 < 3; v386 += 1) {	// L594, [140023355,140047944), iterCycle=13, II=2
        for (int v387 = 0; v387 < 256; v387 += 1) {	// L595, [140023355,140031560), iterCycle=13, II=2
          for (int v388 = 0; v388 < 4; v388 += 1) {	// L596, [140023355,140023400), iterCycle=13, II=2
            for (int v389 = 0; v389 < 4; v389 += 1) {	// L597, [140023355,140023376), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v390 = v22[v384][((v388 * 2) + v385)][((v389 * 2) + v386)];	// L598, [0,2)
              float v391 = v7[(v387 * 2)][v384][v385][v386];	// L599, [0,2)
              float v392 = v390 * v391;	// L600, [2,6)
              float v393 = v23[(v387 * 2)][v388][v389];	// L601, [4,6)
              float v394 = v392 + v393;	// L602, [6,11)
              v23[(v387 * 2)][v388][v389] = v394;	// L603, [11,12)
              float v395 = v7[((v387 * 2) + 1)][v384][v385][v386];	// L604, [1,3)
              float v396 = v390 * v395;	// L605, [3,7)
              float v397 = v23[((v387 * 2) + 1)][v388][v389];	// L606, [5,7)
              float v398 = v396 + v397;	// L607, [7,12)
              v23[((v387 * 2) + 1)][v388][v389] = v398;	// L608, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v399 = 0; v399 < 512; v399 += 1) {	// L615, [491166332,491196030), iterCycle=58, II=58
    for (int v400 = 0; v400 < 4; v400 += 1) {	// L616, [0,58), iterCycle=14, II=14
      for (int v401 = 0; v401 < 4; v401 += 1) {	// L617, [0,14), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v402 = v23[v399][v400][v401];	// L618, [0,2)
        v23[v399][v400][v401] = v402;	// L619, [2,3)
      }
    }
  }
  for (int v403 = 0; v403 < 512; v403 += 1) {	// L623, [491196030,491209344), iterCycle=26, II=26
    for (int v404 = 0; v404 < 4; v404 += 1) {	// L624, [0,26), iterCycle=6, II=6
      for (int v405 = 0; v405 < 4; v405 += 1) {	// L625, [0,6), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v24[v403][v404][v405] = v0;	// L626, [0,1)
      }
    }
  }
  for (int v406 = 0; v406 < 512; v406 += 1) {	// L630, [491209344,528958093), iterCycle=13, II=2
    for (int v407 = 0; v407 < 3; v407 += 1) {	// L631, [102231594,102305335), iterCycle=13, II=2
      for (int v408 = 0; v408 < 3; v408 += 1) {	// L632, [102231594,102256183), iterCycle=13, II=2
        for (int v409 = 0; v409 < 256; v409 += 1) {	// L633, [102231594,102239799), iterCycle=13, II=2
          for (int v410 = 0; v410 < 4; v410 += 1) {	// L634, [102231594,102231639), iterCycle=13, II=2
            for (int v411 = 0; v411 < 4; v411 += 1) {	// L635, [102231594,102231615), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v412 = v23[v406][(v410 + v407)][(v411 + v408)];	// L636, [0,2)
              float v413 = v8[(v409 * 2)][v406][v407][v408];	// L637, [0,2)
              float v414 = v412 * v413;	// L638, [2,6)
              float v415 = v24[(v409 * 2)][v410][v411];	// L639, [4,6)
              float v416 = v414 + v415;	// L640, [6,11)
              v24[(v409 * 2)][v410][v411] = v416;	// L641, [11,12)
              float v417 = v8[((v409 * 2) + 1)][v406][v407][v408];	// L642, [1,3)
              float v418 = v412 * v417;	// L643, [3,7)
              float v419 = v24[((v409 * 2) + 1)][v410][v411];	// L644, [5,7)
              float v420 = v418 + v419;	// L645, [7,12)
              v24[((v409 * 2) + 1)][v410][v411] = v420;	// L646, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v421 = 0; v421 < 256; v421 += 1) {	// L653, [528958093,555435151), iterCycle=103426, II=103426
    for (int v422 = 0; v422 < 512; v422 += 1) {	// L654, [0,103426), iterCycle=202, II=202
      for (int v423 = 0; v423 < 4; v423 += 1) {	// L655, [0,202), iterCycle=50, II=50
        for (int v424 = 0; v424 < 4; v424 += 1) {	// L656, [0,50), iterCycle=12, II=12
          #pragma HLS PIPELINE off
          float v425 = v22[v421][(v423 * 2)][(v424 * 2)];	// L657, [0,2)
          float v426 = v40[v422][v421];	// L658, [0,2)
          float v427 = v425 * v426;	// L659, [2,6)
          float v428 = v25[v422][v423][v424];	// L660, [4,6)
          float v429 = v428 + v427;	// L661, [6,11)
          v25[v422][v423][v424] = v429;	// L662, [11,12)
        }
      }
    }
  }
  for (int v430 = 0; v430 < 512; v430 += 1) {	// L667, [555435151,555505809), iterCycle=138, II=138
    for (int v431 = 0; v431 < 4; v431 += 1) {	// L668, [0,138), iterCycle=34, II=34
      for (int v432 = 0; v432 < 4; v432 += 1) {	// L669, [0,34), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v433 = v25[v430][v431][v432];	// L670, [0,2)
        float v434 = v24[v430][v431][v432];	// L671, [0,2)
        float v435 = v433 + v434;	// L672, [2,7)
        v26[v430][v431][v432] = v435;	// L673, [7,8)
      }
    }
  }
  for (int v436 = 0; v436 < 512; v436 += 1) {	// L677, [555505809,555535507), iterCycle=58, II=58
    for (int v437 = 0; v437 < 4; v437 += 1) {	// L678, [0,58), iterCycle=14, II=14
      for (int v438 = 0; v438 < 4; v438 += 1) {	// L679, [0,14), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v439 = v26[v436][v437][v438];	// L680, [0,2)
        v26[v436][v437][v438] = v439;	// L681, [2,3)
      }
    }
  }
  for (int v440 = 0; v440 < 512; v440 += 1) {	// L685, [555535507,555548821), iterCycle=26, II=26
    for (int v441 = 0; v441 < 4; v441 += 1) {	// L686, [0,26), iterCycle=6, II=6
      for (int v442 = 0; v442 < 4; v442 += 1) {	// L687, [0,6), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v27[v440][v441][v442] = v0;	// L688, [0,1)
      }
    }
  }
  for (int v443 = 0; v443 < 512; v443 += 1) {	// L692, [555548821,593297570), iterCycle=13, II=2
    for (int v444 = 0; v444 < 3; v444 += 1) {	// L693, [37892117,37965858), iterCycle=13, II=2
      for (int v445 = 0; v445 < 3; v445 += 1) {	// L694, [37892117,37916706), iterCycle=13, II=2
        for (int v446 = 0; v446 < 256; v446 += 1) {	// L695, [37892117,37900322), iterCycle=13, II=2
          for (int v447 = 0; v447 < 4; v447 += 1) {	// L696, [37892117,37892162), iterCycle=13, II=2
            for (int v448 = 0; v448 < 4; v448 += 1) {	// L697, [37892117,37892138), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v449 = v26[v443][(v447 + v444)][(v448 + v445)];	// L698, [0,2)
              float v450 = v8[(v446 * 2)][v443][v444][v445];	// L699, [0,2)
              float v451 = v449 * v450;	// L700, [2,6)
              float v452 = v27[(v446 * 2)][v447][v448];	// L701, [4,6)
              float v453 = v451 + v452;	// L702, [6,11)
              v27[(v446 * 2)][v447][v448] = v453;	// L703, [11,12)
              float v454 = v8[((v446 * 2) + 1)][v443][v444][v445];	// L704, [1,3)
              float v455 = v449 * v454;	// L705, [3,7)
              float v456 = v27[((v446 * 2) + 1)][v447][v448];	// L706, [5,7)
              float v457 = v455 + v456;	// L707, [7,12)
              v27[((v446 * 2) + 1)][v447][v448] = v457;	// L708, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v458 = 0; v458 < 512; v458 += 1) {	// L715, [593297570,593327268), iterCycle=58, II=58
    for (int v459 = 0; v459 < 4; v459 += 1) {	// L716, [0,58), iterCycle=14, II=14
      for (int v460 = 0; v460 < 4; v460 += 1) {	// L717, [0,14), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v461 = v27[v458][v459][v460];	// L718, [0,2)
        v27[v458][v459][v460] = v461;	// L719, [2,3)
      }
    }
  }
  for (int v462 = 0; v462 < 512; v462 += 1) {	// L723, [593327268,593340582), iterCycle=26, II=26
    for (int v463 = 0; v463 < 4; v463 += 1) {	// L724, [0,26), iterCycle=6, II=6
      for (int v464 = 0; v464 < 4; v464 += 1) {	// L725, [0,6), iterCycle=1, II=1
        #pragma HLS PIPELINE off
        v28[v462][v463][v464] = v0;	// L726, [0,1)
      }
    }
  }
  for (int v465 = 0; v465 < 512; v465 += 1) {	// L730, [593340582,631089331), iterCycle=13, II=2
    for (int v466 = 0; v466 < 3; v466 += 1) {	// L731, [100356,174097), iterCycle=13, II=2
      for (int v467 = 0; v467 < 3; v467 += 1) {	// L732, [100356,124945), iterCycle=13, II=2
        for (int v468 = 0; v468 < 256; v468 += 1) {	// L733, [100356,108561), iterCycle=13, II=2
          for (int v469 = 0; v469 < 4; v469 += 1) {	// L734, [100356,100401), iterCycle=13, II=2
            for (int v470 = 0; v470 < 4; v470 += 1) {	// L735, [100356,100377), iterCycle=13, II=2
              #pragma HLS pipeline II=1
              float v471 = v27[v465][(v469 + v466)][(v470 + v467)];	// L736, [0,2)
              float v472 = v8[(v468 * 2)][v465][v466][v467];	// L737, [0,2)
              float v473 = v471 * v472;	// L738, [2,6)
              float v474 = v28[(v468 * 2)][v469][v470];	// L739, [4,6)
              float v475 = v473 + v474;	// L740, [6,11)
              v28[(v468 * 2)][v469][v470] = v475;	// L741, [11,12)
              float v476 = v8[((v468 * 2) + 1)][v465][v466][v467];	// L742, [1,3)
              float v477 = v471 * v476;	// L743, [3,7)
              float v478 = v28[((v468 * 2) + 1)][v469][v470];	// L744, [5,7)
              float v479 = v477 + v478;	// L745, [7,12)
              v28[((v468 * 2) + 1)][v469][v470] = v479;	// L746, [12,13)
            }
          }
        }
      }
    }
  }
  for (int v480 = 0; v480 < 512; v480 += 1) {	// L753, [631089331,631159989), iterCycle=138, II=138
    for (int v481 = 0; v481 < 4; v481 += 1) {	// L754, [0,138), iterCycle=34, II=34
      for (int v482 = 0; v482 < 4; v482 += 1) {	// L755, [0,34), iterCycle=8, II=8
        #pragma HLS PIPELINE off
        float v483 = v28[v480][v481][v482];	// L756, [0,2)
        float v484 = v26[v480][v481][v482];	// L757, [0,2)
        float v485 = v483 + v484;	// L758, [2,7)
        v29[v480][v481][v482] = v485;	// L759, [7,8)
      }
    }
  }
  for (int v486 = 0; v486 < 512; v486 += 1) {	// L763, [631159989,631189687), iterCycle=58, II=58
    for (int v487 = 0; v487 < 4; v487 += 1) {	// L764, [0,58), iterCycle=14, II=14
      for (int v488 = 0; v488 < 4; v488 += 1) {	// L765, [0,14), iterCycle=3, II=3
        #pragma HLS PIPELINE off
        float v489 = v29[v486][v487][v488];	// L766, [0,2)
        v29[v486][v487][v488] = v489;	// L767, [2,3)
      }
    }
  }
}

