
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

void forward_node1(
  float v0[2],
  float v1[512],
  int v2
) {	// L51
  #pragma HLS inline
  #pragma HLS resource variable=v0 core=ram_t2p_bram

  for (int v3 = 0; v3 < 2; v3 += 1) {	// L52
    #pragma HLS pipeline II=1
    float v4 = v0[v3];	// L53
    v1[(v3 + (v2 * 2))] = v4;	// L54
  }
}

void forward_node2(
  float v5[2],
  float v6[2],
  float v7[2],
  int v8,
  int v9
) {	// L58
  #pragma HLS inline
  #pragma HLS resource variable=v5 core=ram_t2p_bram

  #pragma HLS resource variable=v6 core=ram_t2p_bram

  #pragma HLS resource variable=v7 core=ram_t2p_bram

  for (int v10 = 0; v10 < 2; v10 += 1) {	// L60
    #pragma HLS pipeline II=1
    float v11 = v6[v10];	// L61
    float v12 = (v8 == 0 && v9 == 0) ? (float)-340282346638528859811704183484516925440.000000 : v11;	// L62
    float v13 = v5[v10];	// L63
    float v14 = max(v12, v13);	// L64
    v7[v10] = v14;	// L65
  }
}

void forward_node3(
  float v15[512][2][2],
  float v16[2],
  int v17,
  int v18,
  int v19
) {	// L69
  #pragma HLS inline
  #pragma HLS resource variable=v16 core=ram_t2p_bram

  for (int v20 = 0; v20 < 2; v20 += 1) {	// L70
    #pragma HLS pipeline II=1
    float v21 = v15[(v20 + (v19 * 2))][v17][v18];	// L71
    v16[v20] = v21;	// L72
  }
}

void forward_node4(
  float v22[512],
  float v23[2],
  int v24
) {	// L76
  #pragma HLS inline
  #pragma HLS resource variable=v23 core=ram_t2p_bram

  for (int v25 = 0; v25 < 2; v25 += 1) {	// L77
    #pragma HLS pipeline II=1
    float v26 = v22[(v25 + (v24 * 2))];	// L78
    v23[v25] = v26;	// L79
  }
}

void forward_node0(
  float v27[512][2][2],
  float v28[512],
  float v29[512]
) {	// L83
  for (int v30 = 0; v30 < 1024; v30 += 1) {	// L84
    #pragma HLS dataflow
    int v31 = (v30 % 256);	// L85
    int v32 = ((v30 / 256) % 2);	// L86
    int v33 = ((v30 / 256) / 2);	// L87
    float v34[2];	// L88
    #pragma HLS resource variable=v34 core=ram_t2p_bram

    float v35[2];	// L89
    #pragma HLS resource variable=v35 core=ram_t2p_bram

    forward_node4(v28, v35, v31);	// L90
    forward_node3(v27, v34, v33, v32, v31);	// L91
    float v36[2];	// L92
    #pragma HLS resource variable=v36 core=ram_t2p_bram

    forward_node2(v34, v35, v36, v33, v32);	// L93
    forward_node1(v36, v29, v31);	// L94
  }
}

void forward_node6(
  float v37[2],
  float v38[512][2][2],
  int v39,
  int v40,
  int v41
) {	// L98
  #pragma HLS inline
  #pragma HLS resource variable=v37 core=ram_t2p_bram

  for (int v42 = 0; v42 < 2; v42 += 1) {	// L99
    #pragma HLS pipeline II=1
    float v43 = v37[v42];	// L100
    v38[(v42 + (v41 * 2))][v39][v40] = v43;	// L101
  }
}

void forward_node7(
  float v44[2][2],
  float v45[2],
  float v46[2],
  float v47[2],
  int v48,
  int v49,
  int v50
) {	// L105
  #pragma HLS inline
  #pragma HLS resource variable=v44 core=ram_t2p_bram

  #pragma HLS resource variable=v45 core=ram_t2p_bram

  #pragma HLS resource variable=v46 core=ram_t2p_bram

  #pragma HLS resource variable=v47 core=ram_t2p_bram

  for (int v51 = 0; v51 < 2; v51 += 1) {	// L107
    for (int v52 = 0; v52 < 2; v52 += 1) {	// L108
      #pragma HLS pipeline II=1
      float v53 = v45[v51];	// L109
      float v54 = v44[v52][v51];	// L110
      float v55 = v46[v52];	// L111
      float v56 = v47[v52];	// L112
      float v57 = (v51 == 0) ? v55 : v56;	// L113
      float v58 = v53 * v54;	// L114
      float v59 = v57 + v58;	// L115
      bool v60 = v59 > (float)0.000000;	// L116
      float v61 = v60 ? v59 : (float)0.000000;	// L117
      float v62 = ((((-v51) + (v48 * -2)) + 511) == 0 && ((-v50) + 2) == 0 && ((-v49) + 2) == 0) ? v61 : v59;	// L118
      v47[v52] = v62;	// L119
    }
  }
}

void forward_node8(
  float v63[512][2][2],
  float v64[2],
  int v65,
  int v66,
  int v67
) {	// L124
  #pragma HLS inline
  #pragma HLS resource variable=v64 core=ram_t2p_bram

  for (int v68 = 0; v68 < 2; v68 += 1) {	// L125
    #pragma HLS pipeline II=1
    float v69 = v63[(v68 + (v67 * 2))][v65][v66];	// L126
    v64[v68] = v69;	// L127
  }
}

void forward_node9(
  float v70[512][512][3][3],
  float v71[2][2],
  int v72,
  int v73,
  int v74,
  int v75
) {	// L131
  #pragma HLS inline
  #pragma HLS resource variable=v71 core=ram_t2p_bram

  for (int v76 = 0; v76 < 2; v76 += 1) {	// L132
    for (int v77 = 0; v77 < 2; v77 += 1) {	// L133
      #pragma HLS pipeline II=1
      float v78 = v70[(v76 + (v74 * 2))][(v77 + (v75 * 2))][v72][v73];	// L134
      v71[v76][v77] = v78;	// L135
    }
  }
}

void forward_node10(
  float v79[512][2][2],
  float v80[2],
  int v81,
  int v82,
  int v83,
  int v84,
  int v85
) {	// L140
  #pragma HLS inline
  #pragma HLS resource variable=v80 core=ram_t2p_bram

  for (int v86 = 0; v86 < 2; v86 += 1) {	// L141
    #pragma HLS pipeline II=1
    float v87 = v79[(v86 + (v81 * 2))][((v82 + v83) - 1)][((v84 + v85) - 1)];	// L142
    v80[v86] = v87;	// L143
  }
}

void forward_node5(
  float v88[512][512][3][3],
  float v89[512][2][2],
  float v90[512][2][2],
  float v91[512][2][2]
) {	// L147
  for (int v92 = 0; v92 < 2359296; v92 += 1) {	// L148
    #pragma HLS dataflow
    int v93 = (v92 % 2);	// L149
    int v94 = ((v92 / 2) % 2);	// L150
    int v95 = (((v92 / 2) / 2) % 256);	// L151
    int v96 = ((((v92 / 2) / 2) / 256) % 3);	// L152
    int v97 = (((((v92 / 2) / 2) / 256) / 3) % 3);	// L153
    int v98 = (((((v92 / 2) / 2) / 256) / 3) / 3);	// L154
    float v99[2];	// L155
    #pragma HLS resource variable=v99 core=ram_t2p_bram

    float v100[2][2];	// L156
    #pragma HLS resource variable=v100 core=ram_t2p_bram

    float v101[2];	// L157
    #pragma HLS resource variable=v101 core=ram_t2p_bram

    forward_node10(v89, v101, v98, v94, v97, v93, v96);	// L158
    forward_node9(v88, v100, v97, v96, v95, v98);	// L159
    forward_node8(v90, v99, v94, v93, v95);	// L160
    float v102[2];	// L161
    #pragma HLS resource variable=v102 core=ram_t2p_bram

    forward_node7(v100, v101, v99, v102, v98, v96, v97);	// L162
    forward_node6(v102, v91, v94, v93, v95);	// L163
  }
}

void forward_node12(
  float v103[2],
  float v104[512][2][2],
  int v105,
  int v106,
  int v107
) {	// L167
  #pragma HLS inline
  #pragma HLS resource variable=v103 core=ram_t2p_bram

  for (int v108 = 0; v108 < 2; v108 += 1) {	// L168
    #pragma HLS pipeline II=1
    float v109 = v103[v108];	// L169
    v104[(v108 + (v107 * 2))][v105][v106] = v109;	// L170
  }
}

void forward_node13(
  float v110[2][2],
  float v111[2],
  float v112[2],
  float v113[2],
  float v114[2],
  int v115,
  int v116,
  int v117
) {	// L174
  #pragma HLS inline
  #pragma HLS resource variable=v110 core=ram_t2p_bram

  #pragma HLS resource variable=v111 core=ram_t2p_bram

  #pragma HLS resource variable=v112 core=ram_t2p_bram

  #pragma HLS resource variable=v113 core=ram_t2p_bram

  #pragma HLS resource variable=v114 core=ram_t2p_bram

  for (int v118 = 0; v118 < 2; v118 += 1) {	// L176
    for (int v119 = 0; v119 < 2; v119 += 1) {	// L177
      #pragma HLS pipeline II=1
      float v120 = v112[v119];	// L178
      float v121 = v113[v119];	// L179
      float v122 = v114[v119];	// L180
      float v123 = (v118 == 0) ? v121 : v122;	// L181
      float v124 = ((v118 + (v116 * 2)) == 0 && v115 == 0 && v117 == 0) ? v120 : v123;	// L182
      float v125 = v111[v118];	// L183
      float v126 = v110[v119][v118];	// L184
      float v127 = v125 * v126;	// L185
      float v128 = v124 + v127;	// L186
      bool v129 = v128 > (float)0.000000;	// L187
      float v130 = v129 ? v128 : (float)0.000000;	// L188
      float v131 = ((((-v118) + (v116 * -2)) + 511) == 0 && ((-v115) + 2) == 0 && ((-v117) + 2) == 0) ? v130 : v128;	// L189
      v114[v119] = v131;	// L190
    }
  }
}

void forward_node14(
  float v132[512][512][3][3],
  float v133[2][2],
  int v134,
  int v135,
  int v136,
  int v137
) {	// L195
  #pragma HLS inline
  #pragma HLS resource variable=v133 core=ram_t2p_bram

  for (int v138 = 0; v138 < 2; v138 += 1) {	// L196
    for (int v139 = 0; v139 < 2; v139 += 1) {	// L197
      #pragma HLS pipeline II=1
      float v140 = v132[(v138 + (v136 * 2))][(v139 + (v137 * 2))][v134][v135];	// L198
      v133[v138][v139] = v140;	// L199
    }
  }
}

void forward_node15(
  float v141[512][2][2],
  float v142[2],
  int v143,
  int v144,
  int v145,
  int v146,
  int v147
) {	// L204
  #pragma HLS inline
  #pragma HLS resource variable=v142 core=ram_t2p_bram

  for (int v148 = 0; v148 < 2; v148 += 1) {	// L205
    #pragma HLS pipeline II=1
    float v149 = v141[(v148 + (v143 * 2))][((v144 + v145) - 1)][((v146 + v147) - 1)];	// L206
    v142[v148] = v149;	// L207
  }
}

void forward_node16(
  float v150[512][2][2],
  float v151[2],
  int v152,
  int v153,
  int v154
) {	// L211
  #pragma HLS inline
  #pragma HLS resource variable=v151 core=ram_t2p_bram

  for (int v155 = 0; v155 < 2; v155 += 1) {	// L212
    #pragma HLS pipeline II=1
    float v156 = v150[(v155 + (v154 * 2))][v152][v153];	// L213
    v151[v155] = v156;	// L214
  }
}

void forward_node17(
  float v157[512][2][2],
  float v158[2],
  int v159,
  int v160,
  int v161
) {	// L218
  #pragma HLS inline
  #pragma HLS resource variable=v158 core=ram_t2p_bram

  for (int v162 = 0; v162 < 2; v162 += 1) {	// L219
    #pragma HLS pipeline II=1
    float v163 = v157[(v162 + (v161 * 2))][v159][v160];	// L220
    v158[v162] = v163;	// L221
  }
}

void forward_node11(
  float v164[512][2][2],
  float v165[512][512][3][3],
  float v166[512][2][2],
  float v167[512][2][2],
  float v168[512][2][2]
) {	// L225
  for (int v169 = 0; v169 < 2359296; v169 += 1) {	// L226
    #pragma HLS dataflow
    int v170 = (v169 % 2);	// L227
    int v171 = ((v169 / 2) % 2);	// L228
    int v172 = (((v169 / 2) / 2) % 256);	// L229
    int v173 = ((((v169 / 2) / 2) / 256) % 3);	// L230
    int v174 = (((((v169 / 2) / 2) / 256) / 3) % 3);	// L231
    int v175 = (((((v169 / 2) / 2) / 256) / 3) / 3);	// L232
    float v176[2][2];	// L233
    #pragma HLS resource variable=v176 core=ram_t2p_bram

    float v177[2];	// L234
    #pragma HLS resource variable=v177 core=ram_t2p_bram

    float v178[2];	// L235
    #pragma HLS resource variable=v178 core=ram_t2p_bram

    float v179[2];	// L236
    #pragma HLS resource variable=v179 core=ram_t2p_bram

    forward_node17(v166, v179, v171, v170, v172);	// L237
    forward_node16(v167, v178, v171, v170, v172);	// L238
    forward_node15(v164, v177, v175, v171, v174, v170, v173);	// L239
    forward_node14(v165, v176, v174, v173, v172, v175);	// L240
    float v180[2];	// L241
    #pragma HLS resource variable=v180 core=ram_t2p_bram

    forward_node13(v176, v177, v179, v178, v180, v174, v175, v173);	// L242
    forward_node12(v180, v168, v171, v170, v172);	// L243
  }
}

void forward_node19(
  float v181[2],
  float v182[512][2][2],
  int v183,
  int v184,
  int v185
) {	// L247
  #pragma HLS inline
  #pragma HLS resource variable=v181 core=ram_t2p_bram

  for (int v186 = 0; v186 < 2; v186 += 1) {	// L248
    #pragma HLS pipeline II=1
    float v187 = v181[v186];	// L249
    v182[(v186 + (v185 * 2))][v183][v184] = v187;	// L250
  }
}

void forward_node20(
  float v188[2],
  float v189[2][2],
  float v190[2],
  float v191[2],
  float v192[2],
  int v193,
  int v194,
  int v195
) {	// L254
  #pragma HLS inline
  #pragma HLS resource variable=v188 core=ram_t2p_bram

  #pragma HLS resource variable=v189 core=ram_t2p_bram

  #pragma HLS resource variable=v190 core=ram_t2p_bram

  #pragma HLS resource variable=v191 core=ram_t2p_bram

  #pragma HLS resource variable=v192 core=ram_t2p_bram

  for (int v196 = 0; v196 < 2; v196 += 1) {	// L256
    for (int v197 = 0; v197 < 2; v197 += 1) {	// L257
      #pragma HLS pipeline II=1
      float v198 = v190[v197];	// L258
      float v199 = v191[v197];	// L259
      float v200 = v192[v197];	// L260
      float v201 = (v196 == 0) ? v199 : v200;	// L261
      float v202 = ((v196 + (v193 * 2)) == 0 && v195 == 0 && v194 == 0) ? v198 : v201;	// L262
      float v203 = v188[v196];	// L263
      float v204 = v189[v197][v196];	// L264
      float v205 = v203 * v204;	// L265
      float v206 = v202 + v205;	// L266
      bool v207 = v206 > (float)0.000000;	// L267
      float v208 = v207 ? v206 : (float)0.000000;	// L268
      float v209 = ((((-v196) + (v193 * -2)) + 511) == 0 && ((-v195) + 2) == 0 && ((-v194) + 2) == 0) ? v208 : v206;	// L269
      v192[v197] = v209;	// L270
    }
  }
}

void forward_node21(
  float v210[512][512][3][3],
  float v211[2][2],
  int v212,
  int v213,
  int v214,
  int v215
) {	// L275
  #pragma HLS inline
  #pragma HLS resource variable=v211 core=ram_t2p_bram

  for (int v216 = 0; v216 < 2; v216 += 1) {	// L276
    for (int v217 = 0; v217 < 2; v217 += 1) {	// L277
      #pragma HLS pipeline II=1
      float v218 = v210[(v216 + (v214 * 2))][(v217 + (v215 * 2))][v212][v213];	// L278
      v211[v216][v217] = v218;	// L279
    }
  }
}

void forward_node22(
  float v219[512][2][2],
  float v220[2],
  int v221,
  int v222,
  int v223,
  int v224,
  int v225
) {	// L284
  #pragma HLS inline
  #pragma HLS resource variable=v220 core=ram_t2p_bram

  for (int v226 = 0; v226 < 2; v226 += 1) {	// L285
    #pragma HLS pipeline II=1
    float v227 = v219[(v226 + (v221 * 2))][((v222 + v223) - 1)][((v224 + v225) - 1)];	// L286
    v220[v226] = v227;	// L287
  }
}

void forward_node23(
  float v228[512][2][2],
  float v229[2],
  int v230,
  int v231,
  int v232
) {	// L291
  #pragma HLS inline
  #pragma HLS resource variable=v229 core=ram_t2p_bram

  for (int v233 = 0; v233 < 2; v233 += 1) {	// L292
    #pragma HLS pipeline II=1
    float v234 = v228[(v233 + (v232 * 2))][v230][v231];	// L293
    v229[v233] = v234;	// L294
  }
}

void forward_node24(
  float v235[512][2][2],
  float v236[2],
  int v237,
  int v238,
  int v239
) {	// L298
  #pragma HLS inline
  #pragma HLS resource variable=v236 core=ram_t2p_bram

  for (int v240 = 0; v240 < 2; v240 += 1) {	// L299
    #pragma HLS pipeline II=1
    float v241 = v235[(v240 + (v239 * 2))][v237][v238];	// L300
    v236[v240] = v241;	// L301
  }
}

void forward_node18(
  float v242[512][512][3][3],
  float v243[512][2][2],
  float v244[512][2][2],
  float v245[512][2][2],
  float v246[512][2][2]
) {	// L305
  for (int v247 = 0; v247 < 2359296; v247 += 1) {	// L306
    #pragma HLS dataflow
    int v248 = (v247 % 2);	// L307
    int v249 = ((v247 / 2) % 2);	// L308
    int v250 = (((v247 / 2) / 2) % 256);	// L309
    int v251 = ((((v247 / 2) / 2) / 256) % 3);	// L310
    int v252 = (((((v247 / 2) / 2) / 256) / 3) % 3);	// L311
    int v253 = (((((v247 / 2) / 2) / 256) / 3) / 3);	// L312
    float v254[2][2];	// L313
    #pragma HLS resource variable=v254 core=ram_t2p_bram

    float v255[2];	// L314
    #pragma HLS resource variable=v255 core=ram_t2p_bram

    float v256[2];	// L315
    #pragma HLS resource variable=v256 core=ram_t2p_bram

    float v257[2];	// L316
    #pragma HLS resource variable=v257 core=ram_t2p_bram

    forward_node24(v244, v257, v249, v248, v250);	// L317
    forward_node23(v245, v256, v249, v248, v250);	// L318
    forward_node22(v243, v255, v253, v249, v252, v248, v251);	// L319
    forward_node21(v242, v254, v252, v251, v250, v253);	// L320
    float v258[2];	// L321
    #pragma HLS resource variable=v258 core=ram_t2p_bram

    forward_node20(v255, v254, v257, v256, v258, v253, v251, v252);	// L322
    forward_node19(v258, v246, v249, v248, v250);	// L323
  }
}

void forward_node26(
  float v259[2],
  float v260[512][2][2],
  int v261,
  int v262,
  int v263
) {	// L327
  #pragma HLS inline
  #pragma HLS resource variable=v259 core=ram_t2p_bram

  for (int v264 = 0; v264 < 2; v264 += 1) {	// L328
    #pragma HLS pipeline II=1
    float v265 = v259[v264];	// L329
    v260[(v264 + (v263 * 2))][v261][v262] = v265;	// L330
  }
}

void forward_node27(
  float v266[2],
  float v267[2],
  float v268[2]
) {	// L334
  #pragma HLS inline
  #pragma HLS resource variable=v266 core=ram_t2p_bram

  #pragma HLS resource variable=v267 core=ram_t2p_bram

  #pragma HLS resource variable=v268 core=ram_t2p_bram

  for (int v269 = 0; v269 < 2; v269 += 1) {	// L335
    #pragma HLS pipeline II=1
    float v270 = v266[v269];	// L336
    float v271 = v267[v269];	// L337
    float v272 = max(v271, v270);	// L338
    v268[v269] = v272;	// L339
  }
}

void forward_node28(
  float v273[512][2][2],
  float v274[2],
  int v275,
  int v276,
  int v277
) {	// L343
  #pragma HLS inline
  #pragma HLS resource variable=v274 core=ram_t2p_bram

  for (int v278 = 0; v278 < 2; v278 += 1) {	// L344
    #pragma HLS pipeline II=1
    float v279 = v273[(v278 + (v277 * 2))][v275][v276];	// L345
    v274[v278] = v279;	// L346
  }
}

void forward_node29(
  float v280[512][4][4],
  float v281[2],
  int v282,
  int v283,
  int v284,
  int v285,
  int v286
) {	// L350
  #pragma HLS inline
  #pragma HLS resource variable=v281 core=ram_t2p_bram

  for (int v287 = 0; v287 < 2; v287 += 1) {	// L351
    #pragma HLS pipeline II=1
    float v288 = v280[(v287 + (v282 * 2))][((v283 * 2) + v284)][((v285 * 2) + v286)];	// L352
    v281[v287] = v288;	// L353
  }
}

void forward_node25(
  float v289[512][4][4],
  float v290[512][2][2],
  float v291[512][2][2]
) {	// L357
  for (int v292 = 0; v292 < 4096; v292 += 1) {	// L358
    #pragma HLS dataflow
    int v293 = (v292 % 2);	// L359
    int v294 = ((v292 / 2) % 2);	// L360
    int v295 = (((v292 / 2) / 2) % 256);	// L361
    int v296 = ((((v292 / 2) / 2) / 256) % 2);	// L362
    int v297 = ((((v292 / 2) / 2) / 256) / 2);	// L363
    float v298[2];	// L364
    #pragma HLS resource variable=v298 core=ram_t2p_bram

    float v299[2];	// L365
    #pragma HLS resource variable=v299 core=ram_t2p_bram

    forward_node29(v289, v299, v295, v294, v297, v293, v296);	// L366
    forward_node28(v290, v298, v294, v293, v295);	// L367
    float v300[2];	// L368
    #pragma HLS resource variable=v300 core=ram_t2p_bram

    forward_node27(v299, v298, v300);	// L369
    forward_node26(v300, v291, v294, v293, v295);	// L370
  }
}

void forward_node31(
  float v301[2][2][2],
  float v302[512][4][4],
  int v303,
  int v304,
  int v305
) {	// L374
  #pragma HLS inline
  #pragma HLS array_partition variable=v301 cyclic factor=2 dim=3
  #pragma HLS resource variable=v301 core=ram_t2p_bram

  #pragma HLS array_partition variable=v302 cyclic factor=2 dim=3

  for (int v306 = 0; v306 < 2; v306 += 1) {	// L375
    for (int v307 = 0; v307 < 2; v307 += 1) {	// L376
      #pragma HLS pipeline II=1
      float v308 = v301[v306][v307][0];	// L377
      v302[(v306 + (v303 * 2))][(v307 + (v304 * 2))][(v305 * 2)] = v308;	// L378
      float v309 = v301[v306][v307][1];	// L379
      v302[(v306 + (v303 * 2))][(v307 + (v304 * 2))][((v305 * 2) + 1)] = v309;	// L380
    }
  }
}

void forward_node32(
  float v310[2][2],
  float v311[2][2][2],
  float v312[2][2][2],
  float v313[2][2][2],
  int v314,
  int v315,
  int v316
) {	// L385
  #pragma HLS inline
  #pragma HLS resource variable=v310 core=ram_t2p_bram

  #pragma HLS array_partition variable=v311 cyclic factor=2 dim=3
  #pragma HLS resource variable=v311 core=ram_t2p_bram

  #pragma HLS array_partition variable=v312 cyclic factor=2 dim=3
  #pragma HLS resource variable=v312 core=ram_t2p_bram

  #pragma HLS array_partition variable=v313 cyclic factor=2 dim=3
  #pragma HLS resource variable=v313 core=ram_t2p_bram

  for (int v317 = 0; v317 < 2; v317 += 1) {	// L387
    for (int v318 = 0; v318 < 2; v318 += 1) {	// L388
      for (int v319 = 0; v319 < 2; v319 += 1) {	// L389
        #pragma HLS pipeline II=1
        float v320 = v311[v317][v319][0];	// L390
        float v321 = v310[v318][v317];	// L391
        float v322 = v312[v318][v319][0];	// L392
        float v323 = v313[v318][v319][0];	// L393
        float v324 = (v317 == 0) ? v322 : v323;	// L394
        float v325 = v320 * v321;	// L395
        float v326 = v324 + v325;	// L396
        bool v327 = v326 > (float)0.000000;	// L397
        float v328 = v327 ? v326 : (float)0.000000;	// L398
        float v329 = ((((-v317) + (v314 * -2)) + 511) == 0 && ((-v315) + 2) == 0 && ((-v316) + 2) == 0) ? v328 : v326;	// L399
        v313[v318][v319][0] = v329;	// L400
        float v330 = v311[v317][v319][1];	// L401
        float v331 = v312[v318][v319][1];	// L402
        float v332 = v313[v318][v319][1];	// L403
        float v333 = (v317 == 0) ? v331 : v332;	// L404
        float v334 = v330 * v321;	// L405
        float v335 = v333 + v334;	// L406
        bool v336 = v335 > (float)0.000000;	// L407
        float v337 = v336 ? v335 : (float)0.000000;	// L408
        float v338 = ((((-v317) + (v314 * -2)) + 511) == 0 && ((-v315) + 2) == 0 && ((-v316) + 2) == 0) ? v337 : v335;	// L409
        v313[v318][v319][1] = v338;	// L410
      }
    }
  }
}

void forward_node33(
  float v339[512][4][4],
  float v340[2][2][2],
  int v341,
  int v342,
  int v343
) {	// L416
  #pragma HLS inline
  #pragma HLS array_partition variable=v339 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v340 cyclic factor=2 dim=3
  #pragma HLS resource variable=v340 core=ram_t2p_bram

  for (int v344 = 0; v344 < 2; v344 += 1) {	// L417
    for (int v345 = 0; v345 < 2; v345 += 1) {	// L418
      #pragma HLS pipeline II=1
      float v346 = v339[(v344 + (v341 * 2))][(v345 + (v342 * 2))][(v343 * 2)];	// L419
      v340[v344][v345][0] = v346;	// L420
      float v347 = v339[(v344 + (v341 * 2))][(v345 + (v342 * 2))][((v343 * 2) + 1)];	// L421
      v340[v344][v345][1] = v347;	// L422
    }
  }
}

void forward_node34(
  float v348[512][512][3][3],
  float v349[2][2],
  int v350,
  int v351,
  int v352,
  int v353
) {	// L427
  #pragma HLS inline
  #pragma HLS resource variable=v349 core=ram_t2p_bram

  for (int v354 = 0; v354 < 2; v354 += 1) {	// L428
    for (int v355 = 0; v355 < 2; v355 += 1) {	// L429
      #pragma HLS pipeline II=1
      float v356 = v348[(v354 + (v352 * 2))][(v355 + (v353 * 2))][v350][v351];	// L430
      v349[v354][v355] = v356;	// L431
    }
  }
}

void forward_node35(
  float v357[512][4][4],
  float v358[2][2][2],
  int v359,
  int v360,
  int v361,
  int v362,
  int v363
) {	// L436
  #pragma HLS inline
  #pragma HLS array_partition variable=v357 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v358 cyclic factor=2 dim=3
  #pragma HLS resource variable=v358 core=ram_t2p_bram

  for (int v364 = 0; v364 < 2; v364 += 1) {	// L437
    for (int v365 = 0; v365 < 2; v365 += 1) {	// L438
      #pragma HLS pipeline II=1
      float v366 = v357[(v364 + (v359 * 2))][(((v365 + v360) + (v361 * 2)) - 1)][((v362 + (v363 * 2)) - 1)];	// L439
      v358[v364][v365][0] = v366;	// L440
      float v367 = v357[(v364 + (v359 * 2))][(((v365 + v360) + (v361 * 2)) - 1)][(v362 + (v363 * 2))];	// L441
      v358[v364][v365][1] = v367;	// L442
    }
  }
}

void forward_node30(
  float v368[512][512][3][3],
  float v369[512][4][4],
  float v370[512][4][4],
  float v371[512][4][4]
) {	// L447
  #pragma HLS array_partition variable=v369 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v370 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v371 cyclic factor=2 dim=3

  for (int v372 = 0; v372 < 2359296; v372 += 1) {	// L448
    #pragma HLS dataflow
    int v373 = (v372 % 2);	// L449
    int v374 = ((v372 / 2) % 2);	// L450
    int v375 = (((v372 / 2) / 2) % 256);	// L451
    int v376 = ((((v372 / 2) / 2) / 256) % 3);	// L452
    int v377 = (((((v372 / 2) / 2) / 256) / 3) % 3);	// L453
    int v378 = (((((v372 / 2) / 2) / 256) / 3) / 3);	// L454
    float v379[2][2][2];	// L455
    #pragma HLS array_partition variable=v379 cyclic factor=2 dim=3
    #pragma HLS resource variable=v379 core=ram_t2p_bram

    float v380[2][2];	// L456
    #pragma HLS resource variable=v380 core=ram_t2p_bram

    float v381[2][2][2];	// L457
    #pragma HLS array_partition variable=v381 cyclic factor=2 dim=3
    #pragma HLS resource variable=v381 core=ram_t2p_bram

    forward_node35(v369, v381, v378, v377, v374, v376, v373);	// L458
    forward_node34(v368, v380, v377, v376, v375, v378);	// L459
    forward_node33(v370, v379, v375, v374, v373);	// L460
    float v382[2][2][2];	// L461
    #pragma HLS array_partition variable=v382 cyclic factor=2 dim=3
    #pragma HLS resource variable=v382 core=ram_t2p_bram

    forward_node32(v380, v381, v379, v382, v378, v377, v376);	// L462
    forward_node31(v382, v371, v375, v374, v373);	// L463
  }
}

void forward_node37(
  float v383[2][2][2],
  float v384[512][4][4],
  int v385,
  int v386,
  int v387
) {	// L467
  #pragma HLS inline
  #pragma HLS array_partition variable=v383 cyclic factor=2 dim=3
  #pragma HLS resource variable=v383 core=ram_t2p_bram

  #pragma HLS array_partition variable=v384 cyclic factor=2 dim=3

  for (int v388 = 0; v388 < 2; v388 += 1) {	// L468
    for (int v389 = 0; v389 < 2; v389 += 1) {	// L469
      #pragma HLS pipeline II=1
      float v390 = v383[v388][v389][0];	// L470
      v384[(v388 + (v385 * 2))][(v389 + (v386 * 2))][(v387 * 2)] = v390;	// L471
      float v391 = v383[v388][v389][1];	// L472
      v384[(v388 + (v385 * 2))][(v389 + (v386 * 2))][((v387 * 2) + 1)] = v391;	// L473
    }
  }
}

void forward_node38(
  float v392[2][2][2],
  float v393[2][2],
  float v394[2][2][2],
  float v395[2][2][2],
  float v396[2][2][2],
  int v397,
  int v398,
  int v399
) {	// L478
  #pragma HLS inline
  #pragma HLS array_partition variable=v392 cyclic factor=2 dim=3
  #pragma HLS resource variable=v392 core=ram_t2p_bram

  #pragma HLS resource variable=v393 core=ram_t2p_bram

  #pragma HLS array_partition variable=v394 cyclic factor=2 dim=3
  #pragma HLS resource variable=v394 core=ram_t2p_bram

  #pragma HLS array_partition variable=v395 cyclic factor=2 dim=3
  #pragma HLS resource variable=v395 core=ram_t2p_bram

  #pragma HLS array_partition variable=v396 cyclic factor=2 dim=3
  #pragma HLS resource variable=v396 core=ram_t2p_bram

  for (int v400 = 0; v400 < 2; v400 += 1) {	// L480
    for (int v401 = 0; v401 < 2; v401 += 1) {	// L481
      for (int v402 = 0; v402 < 2; v402 += 1) {	// L482
        #pragma HLS pipeline II=1
        float v403 = v394[v401][v402][0];	// L483
        float v404 = v395[v401][v402][0];	// L484
        float v405 = v396[v401][v402][0];	// L485
        float v406 = (v400 == 0) ? v404 : v405;	// L486
        float v407 = ((v400 + (v397 * 2)) == 0 && v399 == 0 && v398 == 0) ? v403 : v406;	// L487
        float v408 = v392[v400][v402][0];	// L488
        float v409 = v393[v401][v400];	// L489
        float v410 = v408 * v409;	// L490
        float v411 = v407 + v410;	// L491
        bool v412 = v411 > (float)0.000000;	// L492
        float v413 = v412 ? v411 : (float)0.000000;	// L493
        float v414 = ((((-v400) + (v397 * -2)) + 511) == 0 && ((-v399) + 2) == 0 && ((-v398) + 2) == 0) ? v413 : v411;	// L494
        v396[v401][v402][0] = v414;	// L495
        float v415 = v394[v401][v402][1];	// L496
        float v416 = v395[v401][v402][1];	// L497
        float v417 = v396[v401][v402][1];	// L498
        float v418 = (v400 == 0) ? v416 : v417;	// L499
        float v419 = ((v400 + (v397 * 2)) == 0 && v399 == 0 && v398 == 0) ? v415 : v418;	// L500
        float v420 = v392[v400][v402][1];	// L501
        float v421 = v420 * v409;	// L502
        float v422 = v419 + v421;	// L503
        bool v423 = v422 > (float)0.000000;	// L504
        float v424 = v423 ? v422 : (float)0.000000;	// L505
        float v425 = ((((-v400) + (v397 * -2)) + 511) == 0 && ((-v399) + 2) == 0 && ((-v398) + 2) == 0) ? v424 : v422;	// L506
        v396[v401][v402][1] = v425;	// L507
      }
    }
  }
}

void forward_node39(
  float v426[512][512][3][3],
  float v427[2][2],
  int v428,
  int v429,
  int v430,
  int v431
) {	// L513
  #pragma HLS inline
  #pragma HLS resource variable=v427 core=ram_t2p_bram

  for (int v432 = 0; v432 < 2; v432 += 1) {	// L514
    for (int v433 = 0; v433 < 2; v433 += 1) {	// L515
      #pragma HLS pipeline II=1
      float v434 = v426[(v432 + (v430 * 2))][(v433 + (v431 * 2))][v428][v429];	// L516
      v427[v432][v433] = v434;	// L517
    }
  }
}

void forward_node40(
  float v435[512][4][4],
  float v436[2][2][2],
  int v437,
  int v438,
  int v439,
  int v440,
  int v441
) {	// L522
  #pragma HLS inline
  #pragma HLS array_partition variable=v435 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v436 cyclic factor=2 dim=3
  #pragma HLS resource variable=v436 core=ram_t2p_bram

  for (int v442 = 0; v442 < 2; v442 += 1) {	// L523
    for (int v443 = 0; v443 < 2; v443 += 1) {	// L524
      #pragma HLS pipeline II=1
      float v444 = v435[(v442 + (v437 * 2))][(((v443 + v438) + (v439 * 2)) - 1)][((v440 + (v441 * 2)) - 1)];	// L525
      v436[v442][v443][0] = v444;	// L526
      float v445 = v435[(v442 + (v437 * 2))][(((v443 + v438) + (v439 * 2)) - 1)][(v440 + (v441 * 2))];	// L527
      v436[v442][v443][1] = v445;	// L528
    }
  }
}

void forward_node41(
  float v446[512][4][4],
  float v447[2][2][2],
  int v448,
  int v449,
  int v450
) {	// L533
  #pragma HLS inline
  #pragma HLS array_partition variable=v446 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v447 cyclic factor=2 dim=3
  #pragma HLS resource variable=v447 core=ram_t2p_bram

  for (int v451 = 0; v451 < 2; v451 += 1) {	// L534
    for (int v452 = 0; v452 < 2; v452 += 1) {	// L535
      #pragma HLS pipeline II=1
      float v453 = v446[(v451 + (v448 * 2))][(v452 + (v449 * 2))][(v450 * 2)];	// L536
      v447[v451][v452][0] = v453;	// L537
      float v454 = v446[(v451 + (v448 * 2))][(v452 + (v449 * 2))][((v450 * 2) + 1)];	// L538
      v447[v451][v452][1] = v454;	// L539
    }
  }
}

void forward_node42(
  float v455[512][4][4],
  float v456[2][2][2],
  int v457,
  int v458,
  int v459
) {	// L544
  #pragma HLS inline
  #pragma HLS array_partition variable=v455 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v456 cyclic factor=2 dim=3
  #pragma HLS resource variable=v456 core=ram_t2p_bram

  for (int v460 = 0; v460 < 2; v460 += 1) {	// L545
    for (int v461 = 0; v461 < 2; v461 += 1) {	// L546
      #pragma HLS pipeline II=1
      float v462 = v455[(v460 + (v457 * 2))][(v461 + (v458 * 2))][(v459 * 2)];	// L547
      v456[v460][v461][0] = v462;	// L548
      float v463 = v455[(v460 + (v457 * 2))][(v461 + (v458 * 2))][((v459 * 2) + 1)];	// L549
      v456[v460][v461][1] = v463;	// L550
    }
  }
}

void forward_node36(
  float v464[512][4][4],
  float v465[512][512][3][3],
  float v466[512][4][4],
  float v467[512][4][4],
  float v468[512][4][4]
) {	// L555
  #pragma HLS array_partition variable=v464 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v466 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v467 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v468 cyclic factor=2 dim=3

  for (int v469 = 0; v469 < 2359296; v469 += 1) {	// L556
    #pragma HLS dataflow
    int v470 = (v469 % 2);	// L557
    int v471 = ((v469 / 2) % 2);	// L558
    int v472 = (((v469 / 2) / 2) % 256);	// L559
    int v473 = ((((v469 / 2) / 2) / 256) % 3);	// L560
    int v474 = (((((v469 / 2) / 2) / 256) / 3) % 3);	// L561
    int v475 = (((((v469 / 2) / 2) / 256) / 3) / 3);	// L562
    float v476[2][2];	// L563
    #pragma HLS resource variable=v476 core=ram_t2p_bram

    float v477[2][2][2];	// L564
    #pragma HLS array_partition variable=v477 cyclic factor=2 dim=3
    #pragma HLS resource variable=v477 core=ram_t2p_bram

    float v478[2][2][2];	// L565
    #pragma HLS array_partition variable=v478 cyclic factor=2 dim=3
    #pragma HLS resource variable=v478 core=ram_t2p_bram

    float v479[2][2][2];	// L566
    #pragma HLS array_partition variable=v479 cyclic factor=2 dim=3
    #pragma HLS resource variable=v479 core=ram_t2p_bram

    forward_node42(v464, v479, v472, v471, v470);	// L567
    forward_node41(v467, v478, v472, v471, v470);	// L568
    forward_node40(v466, v477, v475, v474, v471, v473, v470);	// L569
    forward_node39(v465, v476, v474, v473, v472, v475);	// L570
    float v480[2][2][2];	// L571
    #pragma HLS array_partition variable=v480 cyclic factor=2 dim=3
    #pragma HLS resource variable=v480 core=ram_t2p_bram

    forward_node38(v477, v476, v479, v478, v480, v475, v473, v474);	// L572
    forward_node37(v480, v468, v472, v471, v470);	// L573
  }
}

void forward_node44(
  float v481[2][2][2],
  float v482[512][4][4],
  int v483,
  int v484,
  int v485
) {	// L577
  #pragma HLS inline
  #pragma HLS resource variable=v481 core=ram_t2p_bram

  for (int v486 = 0; v486 < 2; v486 += 1) {	// L578
    for (int v487 = 0; v487 < 2; v487 += 1) {	// L579
      for (int v488 = 0; v488 < 2; v488 += 1) {	// L580
        #pragma HLS pipeline II=1
        float v489 = v481[v486][v487][v488];	// L581
        v482[(v486 + (v483 * 2))][(v487 + (v484 * 2))][(v488 + (v485 * 2))] = v489;	// L582
      }
    }
  }
}

void forward_node45(
  float v490[2][2][2],
  float v491[2][2],
  float v492[2][2][2],
  float v493[2][2][2],
  float v494[2][2][2],
  int v495,
  int v496,
  int v497
) {	// L588
  #pragma HLS inline
  #pragma HLS resource variable=v490 core=ram_t2p_bram

  #pragma HLS resource variable=v491 core=ram_t2p_bram

  #pragma HLS resource variable=v492 core=ram_t2p_bram

  #pragma HLS resource variable=v493 core=ram_t2p_bram

  #pragma HLS resource variable=v494 core=ram_t2p_bram

  for (int v498 = 0; v498 < 2; v498 += 1) {	// L590
    for (int v499 = 0; v499 < 2; v499 += 1) {	// L591
      for (int v500 = 0; v500 < 2; v500 += 1) {	// L592
        for (int v501 = 0; v501 < 2; v501 += 1) {	// L593
          #pragma HLS pipeline II=1
          float v502 = v490[v499][v500][v501];	// L594
          float v503 = v493[v499][v500][v501];	// L595
          float v504 = v494[v499][v500][v501];	// L596
          float v505 = (v498 == 0) ? v503 : v504;	// L597
          float v506 = ((v498 + (v497 * 2)) == 0 && v495 == 0 && v496 == 0) ? v502 : v505;	// L598
          float v507 = v492[v498][v500][v501];	// L599
          float v508 = v491[v499][v498];	// L600
          float v509 = v507 * v508;	// L601
          float v510 = v506 + v509;	// L602
          bool v511 = v510 > (float)0.000000;	// L603
          float v512 = v511 ? v510 : (float)0.000000;	// L604
          float v513 = ((((-v498) + (v497 * -2)) + 255) == 0 && ((-v495) + 2) == 0 && ((-v496) + 2) == 0) ? v512 : v510;	// L605
          v494[v499][v500][v501] = v513;	// L606
        }
      }
    }
  }
}

void forward_node46(
  float v514[512][256][3][3],
  float v515[2][2],
  int v516,
  int v517,
  int v518,
  int v519
) {	// L613
  #pragma HLS inline
  #pragma HLS resource variable=v515 core=ram_t2p_bram

  for (int v520 = 0; v520 < 2; v520 += 1) {	// L614
    for (int v521 = 0; v521 < 2; v521 += 1) {	// L615
      #pragma HLS pipeline II=1
      float v522 = v514[(v520 + (v518 * 2))][(v521 + (v519 * 2))][v516][v517];	// L616
      v515[v520][v521] = v522;	// L617
    }
  }
}

void forward_node47(
  float v523[256][4][4],
  float v524[2][2][2],
  int v525,
  int v526,
  int v527,
  int v528,
  int v529
) {	// L622
  #pragma HLS inline
  #pragma HLS resource variable=v524 core=ram_t2p_bram

  for (int v530 = 0; v530 < 2; v530 += 1) {	// L623
    for (int v531 = 0; v531 < 2; v531 += 1) {	// L624
      for (int v532 = 0; v532 < 2; v532 += 1) {	// L625
        #pragma HLS pipeline II=1
        float v533 = v523[(v530 + (v525 * 2))][(((v531 + v526) + (v527 * 2)) - 1)][(((v532 + v528) + (v529 * 2)) - 1)];	// L626
        v524[v530][v531][v532] = v533;	// L627
      }
    }
  }
}

void forward_node48(
  float v534[512][4][4],
  float v535[2][2][2],
  int v536,
  int v537,
  int v538
) {	// L633
  #pragma HLS inline
  #pragma HLS resource variable=v535 core=ram_t2p_bram

  for (int v539 = 0; v539 < 2; v539 += 1) {	// L634
    for (int v540 = 0; v540 < 2; v540 += 1) {	// L635
      for (int v541 = 0; v541 < 2; v541 += 1) {	// L636
        #pragma HLS pipeline II=1
        float v542 = v534[(v539 + (v536 * 2))][(v540 + (v537 * 2))][(v541 + (v538 * 2))];	// L637
        v535[v539][v540][v541] = v542;	// L638
      }
    }
  }
}

void forward_node49(
  float v543[512][4][4],
  float v544[2][2][2],
  int v545,
  int v546,
  int v547
) {	// L644
  #pragma HLS inline
  #pragma HLS resource variable=v544 core=ram_t2p_bram

  for (int v548 = 0; v548 < 2; v548 += 1) {	// L645
    for (int v549 = 0; v549 < 2; v549 += 1) {	// L646
      for (int v550 = 0; v550 < 2; v550 += 1) {	// L647
        #pragma HLS pipeline II=1
        float v551 = v543[(v548 + (v545 * 2))][(v549 + (v546 * 2))][(v550 + (v547 * 2))];	// L648
        v544[v548][v549][v550] = v551;	// L649
      }
    }
  }
}

void forward_node43(
  float v552[512][4][4],
  float v553[512][256][3][3],
  float v554[256][4][4],
  float v555[512][4][4],
  float v556[512][4][4]
) {	// L655
  for (int v557 = 0; v557 < 1179648; v557 += 1) {	// L656
    #pragma HLS dataflow
    int v558 = (v557 % 2);	// L657
    int v559 = ((v557 / 2) % 2);	// L658
    int v560 = (((v557 / 2) / 2) % 256);	// L659
    int v561 = ((((v557 / 2) / 2) / 256) % 3);	// L660
    int v562 = (((((v557 / 2) / 2) / 256) / 3) % 3);	// L661
    int v563 = (((((v557 / 2) / 2) / 256) / 3) / 3);	// L662
    float v564[2][2];	// L663
    #pragma HLS resource variable=v564 core=ram_t2p_bram

    float v565[2][2][2];	// L664
    #pragma HLS resource variable=v565 core=ram_t2p_bram

    float v566[2][2][2];	// L665
    #pragma HLS resource variable=v566 core=ram_t2p_bram

    float v567[2][2][2];	// L666
    #pragma HLS resource variable=v567 core=ram_t2p_bram

    forward_node49(v552, v567, v560, v559, v558);	// L667
    forward_node48(v555, v566, v560, v559, v558);	// L668
    forward_node47(v554, v565, v563, v562, v559, v561, v558);	// L669
    forward_node46(v553, v564, v562, v561, v560, v563);	// L670
    float v568[2][2][2];	// L671
    #pragma HLS resource variable=v568 core=ram_t2p_bram

    forward_node45(v567, v564, v565, v566, v568, v562, v561, v563);	// L672
    forward_node44(v568, v556, v560, v559, v558);	// L673
  }
}

void forward_node51(
  float v569[2][2][2],
  float v570[256][4][4],
  int v571,
  int v572,
  int v573
) {	// L677
  #pragma HLS inline
  #pragma HLS resource variable=v569 core=ram_t2p_bram

  for (int v574 = 0; v574 < 2; v574 += 1) {	// L678
    for (int v575 = 0; v575 < 2; v575 += 1) {	// L679
      for (int v576 = 0; v576 < 2; v576 += 1) {	// L680
        #pragma HLS pipeline II=1
        float v577 = v569[v574][v575][v576];	// L681
        v570[(v574 + (v571 * 2))][(v575 + (v572 * 2))][(v576 + (v573 * 2))] = v577;	// L682
      }
    }
  }
}

void forward_node52(
  float v578[2][2][2],
  float v579[2][2][2],
  float v580[2][2][2]
) {	// L688
  #pragma HLS inline
  #pragma HLS resource variable=v578 core=ram_t2p_bram

  #pragma HLS resource variable=v579 core=ram_t2p_bram

  #pragma HLS resource variable=v580 core=ram_t2p_bram

  for (int v581 = 0; v581 < 2; v581 += 1) {	// L689
    for (int v582 = 0; v582 < 2; v582 += 1) {	// L690
      for (int v583 = 0; v583 < 2; v583 += 1) {	// L691
        #pragma HLS pipeline II=1
        float v584 = v578[v581][v582][v583];	// L692
        float v585 = v579[v581][v582][v583];	// L693
        float v586 = max(v585, v584);	// L694
        v580[v581][v582][v583] = v586;	// L695
      }
    }
  }
}

void forward_node53(
  float v587[256][4][4],
  float v588[2][2][2],
  int v589,
  int v590,
  int v591
) {	// L701
  #pragma HLS inline
  #pragma HLS resource variable=v588 core=ram_t2p_bram

  for (int v592 = 0; v592 < 2; v592 += 1) {	// L702
    for (int v593 = 0; v593 < 2; v593 += 1) {	// L703
      for (int v594 = 0; v594 < 2; v594 += 1) {	// L704
        #pragma HLS pipeline II=1
        float v595 = v587[(v592 + (v589 * 2))][(v593 + (v590 * 2))][(v594 + (v591 * 2))];	// L705
        v588[v592][v593][v594] = v595;	// L706
      }
    }
  }
}

void forward_node54(
  float v596[256][8][8],
  float v597[2][2][2],
  int v598,
  int v599,
  int v600,
  int v601,
  int v602
) {	// L712
  #pragma HLS inline
  #pragma HLS resource variable=v597 core=ram_t2p_bram

  for (int v603 = 0; v603 < 2; v603 += 1) {	// L713
    for (int v604 = 0; v604 < 2; v604 += 1) {	// L714
      for (int v605 = 0; v605 < 2; v605 += 1) {	// L715
        #pragma HLS pipeline II=1
        float v606 = v596[(v603 + (v598 * 2))][(((v604 * 2) + v599) + (v600 * 4))][(((v605 * 2) + v601) + (v602 * 4))];	// L716
        v597[v603][v604][v605] = v606;	// L717
      }
    }
  }
}

void forward_node50(
  float v607[256][8][8],
  float v608[256][4][4],
  float v609[256][4][4]
) {	// L723
  for (int v610 = 0; v610 < 2048; v610 += 1) {	// L724
    #pragma HLS dataflow
    int v611 = (v610 % 2);	// L725
    int v612 = ((v610 / 2) % 2);	// L726
    int v613 = (((v610 / 2) / 2) % 128);	// L727
    int v614 = ((((v610 / 2) / 2) / 128) % 2);	// L728
    int v615 = ((((v610 / 2) / 2) / 128) / 2);	// L729
    float v616[2][2][2];	// L730
    #pragma HLS resource variable=v616 core=ram_t2p_bram

    float v617[2][2][2];	// L731
    #pragma HLS resource variable=v617 core=ram_t2p_bram

    forward_node54(v607, v617, v613, v615, v612, v614, v611);	// L732
    forward_node53(v608, v616, v613, v612, v611);	// L733
    float v618[2][2][2];	// L734
    #pragma HLS resource variable=v618 core=ram_t2p_bram

    forward_node52(v617, v616, v618);	// L735
    forward_node51(v618, v609, v613, v612, v611);	// L736
  }
}

void forward_node56(
  float v619[2][2][2],
  float v620[256][8][8],
  int v621,
  int v622,
  int v623
) {	// L740
  #pragma HLS inline
  #pragma HLS array_partition variable=v619 cyclic factor=2 dim=3
  #pragma HLS resource variable=v619 core=ram_t2p_bram

  #pragma HLS array_partition variable=v620 cyclic factor=2 dim=3

  for (int v624 = 0; v624 < 2; v624 += 1) {	// L741
    for (int v625 = 0; v625 < 2; v625 += 1) {	// L742
      #pragma HLS pipeline II=1
      float v626 = v619[v624][v625][0];	// L743
      v620[(v624 + (v621 * 2))][(v625 + (v622 * 2))][(v623 * 2)] = v626;	// L744
      float v627 = v619[v624][v625][1];	// L745
      v620[(v624 + (v621 * 2))][(v625 + (v622 * 2))][((v623 * 2) + 1)] = v627;	// L746
    }
  }
}

void forward_node57(
  float v628[2][2][2],
  float v629[2][2],
  float v630[2][2][2],
  float v631[2][2][2],
  int v632,
  int v633,
  int v634
) {	// L751
  #pragma HLS inline
  #pragma HLS array_partition variable=v628 cyclic factor=2 dim=3
  #pragma HLS resource variable=v628 core=ram_t2p_bram

  #pragma HLS resource variable=v629 core=ram_t2p_bram

  #pragma HLS array_partition variable=v630 cyclic factor=2 dim=3
  #pragma HLS resource variable=v630 core=ram_t2p_bram

  #pragma HLS array_partition variable=v631 cyclic factor=2 dim=3
  #pragma HLS resource variable=v631 core=ram_t2p_bram

  for (int v635 = 0; v635 < 2; v635 += 1) {	// L753
    for (int v636 = 0; v636 < 2; v636 += 1) {	// L754
      for (int v637 = 0; v637 < 2; v637 += 1) {	// L755
        #pragma HLS pipeline II=1
        float v638 = v628[v635][v637][0];	// L756
        float v639 = v629[v636][v635];	// L757
        float v640 = v630[v636][v637][0];	// L758
        float v641 = v631[v636][v637][0];	// L759
        float v642 = (v635 == 0) ? v640 : v641;	// L760
        float v643 = v638 * v639;	// L761
        float v644 = v642 + v643;	// L762
        bool v645 = v644 > (float)0.000000;	// L763
        float v646 = v645 ? v644 : (float)0.000000;	// L764
        float v647 = ((((-v635) + (v632 * -2)) + 255) == 0 && ((-v634) + 2) == 0 && ((-v633) + 2) == 0) ? v646 : v644;	// L765
        v631[v636][v637][0] = v647;	// L766
        float v648 = v628[v635][v637][1];	// L767
        float v649 = v630[v636][v637][1];	// L768
        float v650 = v631[v636][v637][1];	// L769
        float v651 = (v635 == 0) ? v649 : v650;	// L770
        float v652 = v648 * v639;	// L771
        float v653 = v651 + v652;	// L772
        bool v654 = v653 > (float)0.000000;	// L773
        float v655 = v654 ? v653 : (float)0.000000;	// L774
        float v656 = ((((-v635) + (v632 * -2)) + 255) == 0 && ((-v634) + 2) == 0 && ((-v633) + 2) == 0) ? v655 : v653;	// L775
        v631[v636][v637][1] = v656;	// L776
      }
    }
  }
}

void forward_node58(
  float v657[256][8][8],
  float v658[2][2][2],
  int v659,
  int v660,
  int v661
) {	// L782
  #pragma HLS inline
  #pragma HLS array_partition variable=v657 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v658 cyclic factor=2 dim=3
  #pragma HLS resource variable=v658 core=ram_t2p_bram

  for (int v662 = 0; v662 < 2; v662 += 1) {	// L783
    for (int v663 = 0; v663 < 2; v663 += 1) {	// L784
      #pragma HLS pipeline II=1
      float v664 = v657[(v662 + (v659 * 2))][(v663 + (v660 * 2))][(v661 * 2)];	// L785
      v658[v662][v663][0] = v664;	// L786
      float v665 = v657[(v662 + (v659 * 2))][(v663 + (v660 * 2))][((v661 * 2) + 1)];	// L787
      v658[v662][v663][1] = v665;	// L788
    }
  }
}

void forward_node59(
  float v666[256][256][3][3],
  float v667[2][2],
  int v668,
  int v669,
  int v670,
  int v671
) {	// L793
  #pragma HLS inline
  #pragma HLS resource variable=v667 core=ram_t2p_bram

  for (int v672 = 0; v672 < 2; v672 += 1) {	// L794
    for (int v673 = 0; v673 < 2; v673 += 1) {	// L795
      #pragma HLS pipeline II=1
      float v674 = v666[(v672 + (v670 * 2))][(v673 + (v671 * 2))][v668][v669];	// L796
      v667[v672][v673] = v674;	// L797
    }
  }
}

void forward_node60(
  float v675[256][8][8],
  float v676[2][2][2],
  int v677,
  int v678,
  int v679,
  int v680,
  int v681
) {	// L802
  #pragma HLS inline
  #pragma HLS array_partition variable=v675 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v676 cyclic factor=2 dim=3
  #pragma HLS resource variable=v676 core=ram_t2p_bram

  for (int v682 = 0; v682 < 2; v682 += 1) {	// L803
    for (int v683 = 0; v683 < 2; v683 += 1) {	// L804
      #pragma HLS pipeline II=1
      float v684 = v675[(v682 + (v677 * 2))][(((v683 + v678) + (v679 * 2)) - 1)][((v680 + (v681 * 2)) - 1)];	// L805
      v676[v682][v683][0] = v684;	// L806
      float v685 = v675[(v682 + (v677 * 2))][(((v683 + v678) + (v679 * 2)) - 1)][(v680 + (v681 * 2))];	// L807
      v676[v682][v683][1] = v685;	// L808
    }
  }
}

void forward_node55(
  float v686[256][256][3][3],
  float v687[256][8][8],
  float v688[256][8][8],
  float v689[256][8][8]
) {	// L813
  #pragma HLS array_partition variable=v687 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v688 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v689 cyclic factor=2 dim=3

  for (int v690 = 0; v690 < 2359296; v690 += 1) {	// L814
    #pragma HLS dataflow
    int v691 = (v690 % 4);	// L815
    int v692 = ((v690 / 4) % 4);	// L816
    int v693 = (((v690 / 4) / 4) % 128);	// L817
    int v694 = ((((v690 / 4) / 4) / 128) % 3);	// L818
    int v695 = (((((v690 / 4) / 4) / 128) / 3) % 3);	// L819
    int v696 = (((((v690 / 4) / 4) / 128) / 3) / 3);	// L820
    float v697[2][2][2];	// L821
    #pragma HLS array_partition variable=v697 cyclic factor=2 dim=3
    #pragma HLS resource variable=v697 core=ram_t2p_bram

    float v698[2][2];	// L822
    #pragma HLS resource variable=v698 core=ram_t2p_bram

    float v699[2][2][2];	// L823
    #pragma HLS array_partition variable=v699 cyclic factor=2 dim=3
    #pragma HLS resource variable=v699 core=ram_t2p_bram

    forward_node60(v687, v699, v696, v695, v692, v694, v691);	// L824
    forward_node59(v686, v698, v695, v694, v693, v696);	// L825
    forward_node58(v688, v697, v693, v692, v691);	// L826
    float v700[2][2][2];	// L827
    #pragma HLS array_partition variable=v700 cyclic factor=2 dim=3
    #pragma HLS resource variable=v700 core=ram_t2p_bram

    forward_node57(v699, v698, v697, v700, v696, v694, v695);	// L828
    forward_node56(v700, v689, v693, v692, v691);	// L829
  }
}

void forward_node62(
  float v701[2][2][2],
  float v702[256][8][8],
  int v703,
  int v704,
  int v705
) {	// L833
  #pragma HLS inline
  #pragma HLS array_partition variable=v701 cyclic factor=2 dim=3
  #pragma HLS resource variable=v701 core=ram_t2p_bram

  #pragma HLS array_partition variable=v702 cyclic factor=2 dim=3

  for (int v706 = 0; v706 < 2; v706 += 1) {	// L834
    for (int v707 = 0; v707 < 2; v707 += 1) {	// L835
      #pragma HLS pipeline II=1
      float v708 = v701[v706][v707][0];	// L836
      v702[(v706 + (v703 * 2))][(v707 + (v704 * 2))][(v705 * 2)] = v708;	// L837
      float v709 = v701[v706][v707][1];	// L838
      v702[(v706 + (v703 * 2))][(v707 + (v704 * 2))][((v705 * 2) + 1)] = v709;	// L839
    }
  }
}

void forward_node63(
  float v710[2][2],
  float v711[2][2][2],
  float v712[2][2][2],
  float v713[2][2][2],
  float v714[2][2][2],
  int v715,
  int v716,
  int v717
) {	// L844
  #pragma HLS inline
  #pragma HLS resource variable=v710 core=ram_t2p_bram

  #pragma HLS array_partition variable=v711 cyclic factor=2 dim=3
  #pragma HLS resource variable=v711 core=ram_t2p_bram

  #pragma HLS array_partition variable=v712 cyclic factor=2 dim=3
  #pragma HLS resource variable=v712 core=ram_t2p_bram

  #pragma HLS array_partition variable=v713 cyclic factor=2 dim=3
  #pragma HLS resource variable=v713 core=ram_t2p_bram

  #pragma HLS array_partition variable=v714 cyclic factor=2 dim=3
  #pragma HLS resource variable=v714 core=ram_t2p_bram

  for (int v718 = 0; v718 < 2; v718 += 1) {	// L846
    for (int v719 = 0; v719 < 2; v719 += 1) {	// L847
      for (int v720 = 0; v720 < 2; v720 += 1) {	// L848
        #pragma HLS pipeline II=1
        float v721 = v711[v719][v720][0];	// L849
        float v722 = v713[v719][v720][0];	// L850
        float v723 = v714[v719][v720][0];	// L851
        float v724 = (v718 == 0) ? v722 : v723;	// L852
        float v725 = ((v718 + (v716 * 2)) == 0 && v715 == 0 && v717 == 0) ? v721 : v724;	// L853
        float v726 = v712[v718][v720][0];	// L854
        float v727 = v710[v719][v718];	// L855
        float v728 = v726 * v727;	// L856
        float v729 = v725 + v728;	// L857
        bool v730 = v729 > (float)0.000000;	// L858
        float v731 = v730 ? v729 : (float)0.000000;	// L859
        float v732 = ((((-v718) + (v716 * -2)) + 255) == 0 && ((-v715) + 2) == 0 && ((-v717) + 2) == 0) ? v731 : v729;	// L860
        v714[v719][v720][0] = v732;	// L861
        float v733 = v711[v719][v720][1];	// L862
        float v734 = v713[v719][v720][1];	// L863
        float v735 = v714[v719][v720][1];	// L864
        float v736 = (v718 == 0) ? v734 : v735;	// L865
        float v737 = ((v718 + (v716 * 2)) == 0 && v715 == 0 && v717 == 0) ? v733 : v736;	// L866
        float v738 = v712[v718][v720][1];	// L867
        float v739 = v738 * v727;	// L868
        float v740 = v737 + v739;	// L869
        bool v741 = v740 > (float)0.000000;	// L870
        float v742 = v741 ? v740 : (float)0.000000;	// L871
        float v743 = ((((-v718) + (v716 * -2)) + 255) == 0 && ((-v715) + 2) == 0 && ((-v717) + 2) == 0) ? v742 : v740;	// L872
        v714[v719][v720][1] = v743;	// L873
      }
    }
  }
}

void forward_node64(
  float v744[256][256][3][3],
  float v745[2][2],
  int v746,
  int v747,
  int v748,
  int v749
) {	// L879
  #pragma HLS inline
  #pragma HLS resource variable=v745 core=ram_t2p_bram

  for (int v750 = 0; v750 < 2; v750 += 1) {	// L880
    for (int v751 = 0; v751 < 2; v751 += 1) {	// L881
      #pragma HLS pipeline II=1
      float v752 = v744[(v750 + (v748 * 2))][(v751 + (v749 * 2))][v746][v747];	// L882
      v745[v750][v751] = v752;	// L883
    }
  }
}

void forward_node65(
  float v753[256][8][8],
  float v754[2][2][2],
  int v755,
  int v756,
  int v757,
  int v758,
  int v759
) {	// L888
  #pragma HLS inline
  #pragma HLS array_partition variable=v753 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v754 cyclic factor=2 dim=3
  #pragma HLS resource variable=v754 core=ram_t2p_bram

  for (int v760 = 0; v760 < 2; v760 += 1) {	// L889
    for (int v761 = 0; v761 < 2; v761 += 1) {	// L890
      #pragma HLS pipeline II=1
      float v762 = v753[(v760 + (v755 * 2))][(((v761 + v756) + (v757 * 2)) - 1)][((v758 + (v759 * 2)) - 1)];	// L891
      v754[v760][v761][0] = v762;	// L892
      float v763 = v753[(v760 + (v755 * 2))][(((v761 + v756) + (v757 * 2)) - 1)][(v758 + (v759 * 2))];	// L893
      v754[v760][v761][1] = v763;	// L894
    }
  }
}

void forward_node66(
  float v764[256][8][8],
  float v765[2][2][2],
  int v766,
  int v767,
  int v768
) {	// L899
  #pragma HLS inline
  #pragma HLS array_partition variable=v764 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v765 cyclic factor=2 dim=3
  #pragma HLS resource variable=v765 core=ram_t2p_bram

  for (int v769 = 0; v769 < 2; v769 += 1) {	// L900
    for (int v770 = 0; v770 < 2; v770 += 1) {	// L901
      #pragma HLS pipeline II=1
      float v771 = v764[(v769 + (v766 * 2))][(v770 + (v767 * 2))][(v768 * 2)];	// L902
      v765[v769][v770][0] = v771;	// L903
      float v772 = v764[(v769 + (v766 * 2))][(v770 + (v767 * 2))][((v768 * 2) + 1)];	// L904
      v765[v769][v770][1] = v772;	// L905
    }
  }
}

void forward_node67(
  float v773[256][8][8],
  float v774[2][2][2],
  int v775,
  int v776,
  int v777
) {	// L910
  #pragma HLS inline
  #pragma HLS array_partition variable=v773 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v774 cyclic factor=2 dim=3
  #pragma HLS resource variable=v774 core=ram_t2p_bram

  for (int v778 = 0; v778 < 2; v778 += 1) {	// L911
    for (int v779 = 0; v779 < 2; v779 += 1) {	// L912
      #pragma HLS pipeline II=1
      float v780 = v773[(v778 + (v775 * 2))][(v779 + (v776 * 2))][(v777 * 2)];	// L913
      v774[v778][v779][0] = v780;	// L914
      float v781 = v773[(v778 + (v775 * 2))][(v779 + (v776 * 2))][((v777 * 2) + 1)];	// L915
      v774[v778][v779][1] = v781;	// L916
    }
  }
}

void forward_node61(
  float v782[256][256][3][3],
  float v783[256][8][8],
  float v784[256][8][8],
  float v785[256][8][8],
  float v786[256][8][8]
) {	// L921
  #pragma HLS array_partition variable=v783 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v784 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v785 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v786 cyclic factor=2 dim=3

  for (int v787 = 0; v787 < 2359296; v787 += 1) {	// L922
    #pragma HLS dataflow
    int v788 = (v787 % 4);	// L923
    int v789 = ((v787 / 4) % 4);	// L924
    int v790 = (((v787 / 4) / 4) % 128);	// L925
    int v791 = ((((v787 / 4) / 4) / 128) % 3);	// L926
    int v792 = (((((v787 / 4) / 4) / 128) / 3) % 3);	// L927
    int v793 = (((((v787 / 4) / 4) / 128) / 3) / 3);	// L928
    float v794[2][2];	// L929
    #pragma HLS resource variable=v794 core=ram_t2p_bram

    float v795[2][2][2];	// L930
    #pragma HLS array_partition variable=v795 cyclic factor=2 dim=3
    #pragma HLS resource variable=v795 core=ram_t2p_bram

    float v796[2][2][2];	// L931
    #pragma HLS array_partition variable=v796 cyclic factor=2 dim=3
    #pragma HLS resource variable=v796 core=ram_t2p_bram

    float v797[2][2][2];	// L932
    #pragma HLS array_partition variable=v797 cyclic factor=2 dim=3
    #pragma HLS resource variable=v797 core=ram_t2p_bram

    forward_node67(v784, v797, v790, v789, v788);	// L933
    forward_node66(v785, v796, v790, v789, v788);	// L934
    forward_node65(v783, v795, v793, v792, v789, v791, v788);	// L935
    forward_node64(v782, v794, v792, v791, v790, v793);	// L936
    float v798[2][2][2];	// L937
    #pragma HLS array_partition variable=v798 cyclic factor=2 dim=3
    #pragma HLS resource variable=v798 core=ram_t2p_bram

    forward_node63(v794, v797, v795, v796, v798, v792, v793, v791);	// L938
    forward_node62(v798, v786, v790, v789, v788);	// L939
  }
}

void forward_node69(
  float v799[2][2][2],
  float v800[256][8][8],
  int v801,
  int v802,
  int v803
) {	// L943
  #pragma HLS inline
  #pragma HLS resource variable=v799 core=ram_t2p_bram

  for (int v804 = 0; v804 < 2; v804 += 1) {	// L944
    for (int v805 = 0; v805 < 2; v805 += 1) {	// L945
      for (int v806 = 0; v806 < 2; v806 += 1) {	// L946
        #pragma HLS pipeline II=1
        float v807 = v799[v804][v805][v806];	// L947
        v800[(v804 + (v801 * 2))][(v805 + (v802 * 2))][(v806 + (v803 * 2))] = v807;	// L948
      }
    }
  }
}

void forward_node70(
  float v808[2][2],
  float v809[2][2][2],
  float v810[2][2][2],
  float v811[2][2][2],
  float v812[2][2][2],
  int v813,
  int v814,
  int v815
) {	// L954
  #pragma HLS inline
  #pragma HLS resource variable=v808 core=ram_t2p_bram

  #pragma HLS resource variable=v809 core=ram_t2p_bram

  #pragma HLS resource variable=v810 core=ram_t2p_bram

  #pragma HLS resource variable=v811 core=ram_t2p_bram

  #pragma HLS resource variable=v812 core=ram_t2p_bram

  for (int v816 = 0; v816 < 2; v816 += 1) {	// L956
    for (int v817 = 0; v817 < 2; v817 += 1) {	// L957
      for (int v818 = 0; v818 < 2; v818 += 1) {	// L958
        for (int v819 = 0; v819 < 2; v819 += 1) {	// L959
          #pragma HLS pipeline II=1
          float v820 = v809[v817][v818][v819];	// L960
          float v821 = v811[v817][v818][v819];	// L961
          float v822 = v812[v817][v818][v819];	// L962
          float v823 = (v816 == 0) ? v821 : v822;	// L963
          float v824 = ((v816 + (v814 * 2)) == 0 && v815 == 0 && v813 == 0) ? v820 : v823;	// L964
          float v825 = v810[v816][v818][v819];	// L965
          float v826 = v808[v817][v816];	// L966
          float v827 = v825 * v826;	// L967
          float v828 = v824 + v827;	// L968
          bool v829 = v828 > (float)0.000000;	// L969
          float v830 = v829 ? v828 : (float)0.000000;	// L970
          float v831 = ((((-v816) + (v814 * -2)) + 127) == 0 && ((-v815) + 2) == 0 && ((-v813) + 2) == 0) ? v830 : v828;	// L971
          v812[v817][v818][v819] = v831;	// L972
        }
      }
    }
  }
}

void forward_node71(
  float v832[256][128][3][3],
  float v833[2][2],
  int v834,
  int v835,
  int v836,
  int v837
) {	// L979
  #pragma HLS inline
  #pragma HLS resource variable=v833 core=ram_t2p_bram

  for (int v838 = 0; v838 < 2; v838 += 1) {	// L980
    for (int v839 = 0; v839 < 2; v839 += 1) {	// L981
      #pragma HLS pipeline II=1
      float v840 = v832[(v838 + (v836 * 2))][(v839 + (v837 * 2))][v834][v835];	// L982
      v833[v838][v839] = v840;	// L983
    }
  }
}

void forward_node72(
  float v841[128][8][8],
  float v842[2][2][2],
  int v843,
  int v844,
  int v845,
  int v846,
  int v847
) {	// L988
  #pragma HLS inline
  #pragma HLS resource variable=v842 core=ram_t2p_bram

  for (int v848 = 0; v848 < 2; v848 += 1) {	// L989
    for (int v849 = 0; v849 < 2; v849 += 1) {	// L990
      for (int v850 = 0; v850 < 2; v850 += 1) {	// L991
        #pragma HLS pipeline II=1
        float v851 = v841[(v848 + (v843 * 2))][(((v849 + v844) + (v845 * 2)) - 1)][(((v850 + v846) + (v847 * 2)) - 1)];	// L992
        v842[v848][v849][v850] = v851;	// L993
      }
    }
  }
}

void forward_node73(
  float v852[256][8][8],
  float v853[2][2][2],
  int v854,
  int v855,
  int v856
) {	// L999
  #pragma HLS inline
  #pragma HLS resource variable=v853 core=ram_t2p_bram

  for (int v857 = 0; v857 < 2; v857 += 1) {	// L1000
    for (int v858 = 0; v858 < 2; v858 += 1) {	// L1001
      for (int v859 = 0; v859 < 2; v859 += 1) {	// L1002
        #pragma HLS pipeline II=1
        float v860 = v852[(v857 + (v854 * 2))][(v858 + (v855 * 2))][(v859 + (v856 * 2))];	// L1003
        v853[v857][v858][v859] = v860;	// L1004
      }
    }
  }
}

void forward_node74(
  float v861[256][8][8],
  float v862[2][2][2],
  int v863,
  int v864,
  int v865
) {	// L1010
  #pragma HLS inline
  #pragma HLS resource variable=v862 core=ram_t2p_bram

  for (int v866 = 0; v866 < 2; v866 += 1) {	// L1011
    for (int v867 = 0; v867 < 2; v867 += 1) {	// L1012
      for (int v868 = 0; v868 < 2; v868 += 1) {	// L1013
        #pragma HLS pipeline II=1
        float v869 = v861[(v866 + (v863 * 2))][(v867 + (v864 * 2))][(v868 + (v865 * 2))];	// L1014
        v862[v866][v867][v868] = v869;	// L1015
      }
    }
  }
}

void forward_node68(
  float v870[256][128][3][3],
  float v871[128][8][8],
  float v872[256][8][8],
  float v873[256][8][8],
  float v874[256][8][8]
) {	// L1021
  for (int v875 = 0; v875 < 1179648; v875 += 1) {	// L1022
    #pragma HLS dataflow
    int v876 = (v875 % 4);	// L1023
    int v877 = ((v875 / 4) % 4);	// L1024
    int v878 = (((v875 / 4) / 4) % 128);	// L1025
    int v879 = ((((v875 / 4) / 4) / 128) % 3);	// L1026
    int v880 = (((((v875 / 4) / 4) / 128) / 3) % 3);	// L1027
    int v881 = (((((v875 / 4) / 4) / 128) / 3) / 3);	// L1028
    float v882[2][2];	// L1029
    #pragma HLS resource variable=v882 core=ram_t2p_bram

    float v883[2][2][2];	// L1030
    #pragma HLS resource variable=v883 core=ram_t2p_bram

    float v884[2][2][2];	// L1031
    #pragma HLS resource variable=v884 core=ram_t2p_bram

    float v885[2][2][2];	// L1032
    #pragma HLS resource variable=v885 core=ram_t2p_bram

    forward_node74(v872, v885, v878, v877, v876);	// L1033
    forward_node73(v873, v884, v878, v877, v876);	// L1034
    forward_node72(v871, v883, v881, v880, v877, v879, v876);	// L1035
    forward_node71(v870, v882, v880, v879, v878, v881);	// L1036
    float v886[2][2][2];	// L1037
    #pragma HLS resource variable=v886 core=ram_t2p_bram

    forward_node70(v882, v885, v883, v884, v886, v879, v881, v880);	// L1038
    forward_node69(v886, v874, v878, v877, v876);	// L1039
  }
}

void forward_node76(
  float v887[2][2][2],
  float v888[128][8][8],
  int v889,
  int v890,
  int v891
) {	// L1043
  #pragma HLS inline
  #pragma HLS resource variable=v887 core=ram_t2p_bram

  for (int v892 = 0; v892 < 2; v892 += 1) {	// L1044
    for (int v893 = 0; v893 < 2; v893 += 1) {	// L1045
      for (int v894 = 0; v894 < 2; v894 += 1) {	// L1046
        #pragma HLS pipeline II=1
        float v895 = v887[v892][v893][v894];	// L1047
        v888[(v892 + (v889 * 2))][(v893 + (v890 * 2))][(v894 + (v891 * 2))] = v895;	// L1048
      }
    }
  }
}

void forward_node77(
  float v896[2][2][2],
  float v897[2][2][2],
  float v898[2][2][2]
) {	// L1054
  #pragma HLS inline
  #pragma HLS resource variable=v896 core=ram_t2p_bram

  #pragma HLS resource variable=v897 core=ram_t2p_bram

  #pragma HLS resource variable=v898 core=ram_t2p_bram

  for (int v899 = 0; v899 < 2; v899 += 1) {	// L1055
    for (int v900 = 0; v900 < 2; v900 += 1) {	// L1056
      for (int v901 = 0; v901 < 2; v901 += 1) {	// L1057
        #pragma HLS pipeline II=1
        float v902 = v896[v899][v900][v901];	// L1058
        float v903 = v897[v899][v900][v901];	// L1059
        float v904 = max(v903, v902);	// L1060
        v898[v899][v900][v901] = v904;	// L1061
      }
    }
  }
}

void forward_node78(
  float v905[128][8][8],
  float v906[2][2][2],
  int v907,
  int v908,
  int v909
) {	// L1067
  #pragma HLS inline
  #pragma HLS resource variable=v906 core=ram_t2p_bram

  for (int v910 = 0; v910 < 2; v910 += 1) {	// L1068
    for (int v911 = 0; v911 < 2; v911 += 1) {	// L1069
      for (int v912 = 0; v912 < 2; v912 += 1) {	// L1070
        #pragma HLS pipeline II=1
        float v913 = v905[(v910 + (v907 * 2))][(v911 + (v908 * 2))][(v912 + (v909 * 2))];	// L1071
        v906[v910][v911][v912] = v913;	// L1072
      }
    }
  }
}

void forward_node79(
  float v914[128][16][16],
  float v915[2][2][2],
  int v916,
  int v917,
  int v918,
  int v919,
  int v920
) {	// L1078
  #pragma HLS inline
  #pragma HLS resource variable=v915 core=ram_t2p_bram

  for (int v921 = 0; v921 < 2; v921 += 1) {	// L1079
    for (int v922 = 0; v922 < 2; v922 += 1) {	// L1080
      for (int v923 = 0; v923 < 2; v923 += 1) {	// L1081
        #pragma HLS pipeline II=1
        float v924 = v914[(v921 + (v916 * 2))][(((v922 * 2) + v917) + (v918 * 4))][(((v923 * 2) + v919) + (v920 * 4))];	// L1082
        v915[v921][v922][v923] = v924;	// L1083
      }
    }
  }
}

void forward_node75(
  float v925[128][16][16],
  float v926[128][8][8],
  float v927[128][8][8]
) {	// L1089
  for (int v928 = 0; v928 < 4096; v928 += 1) {	// L1090
    #pragma HLS dataflow
    int v929 = (v928 % 4);	// L1091
    int v930 = ((v928 / 4) % 4);	// L1092
    int v931 = (((v928 / 4) / 4) % 64);	// L1093
    int v932 = ((((v928 / 4) / 4) / 64) % 2);	// L1094
    int v933 = ((((v928 / 4) / 4) / 64) / 2);	// L1095
    float v934[2][2][2];	// L1096
    #pragma HLS resource variable=v934 core=ram_t2p_bram

    float v935[2][2][2];	// L1097
    #pragma HLS resource variable=v935 core=ram_t2p_bram

    forward_node79(v925, v935, v931, v933, v930, v932, v929);	// L1098
    forward_node78(v926, v934, v931, v930, v929);	// L1099
    float v936[2][2][2];	// L1100
    #pragma HLS resource variable=v936 core=ram_t2p_bram

    forward_node77(v935, v934, v936);	// L1101
    forward_node76(v936, v927, v931, v930, v929);	// L1102
  }
}

void forward_node81(
  float v937[2][2][2],
  float v938[128][16][16],
  int v939,
  int v940,
  int v941
) {	// L1106
  #pragma HLS inline
  #pragma HLS array_partition variable=v937 cyclic factor=2 dim=3
  #pragma HLS resource variable=v937 core=ram_t2p_bram

  #pragma HLS array_partition variable=v938 cyclic factor=2 dim=3

  for (int v942 = 0; v942 < 2; v942 += 1) {	// L1107
    for (int v943 = 0; v943 < 2; v943 += 1) {	// L1108
      #pragma HLS pipeline II=1
      float v944 = v937[v942][v943][0];	// L1109
      v938[(v942 + (v939 * 2))][(v943 + (v940 * 2))][(v941 * 2)] = v944;	// L1110
      float v945 = v937[v942][v943][1];	// L1111
      v938[(v942 + (v939 * 2))][(v943 + (v940 * 2))][((v941 * 2) + 1)] = v945;	// L1112
    }
  }
}

void forward_node82(
  float v946[2][2][2],
  float v947[2][2],
  float v948[2][2][2],
  float v949[2][2][2],
  int v950,
  int v951,
  int v952
) {	// L1117
  #pragma HLS inline
  #pragma HLS array_partition variable=v946 cyclic factor=2 dim=3
  #pragma HLS resource variable=v946 core=ram_t2p_bram

  #pragma HLS resource variable=v947 core=ram_t2p_bram

  #pragma HLS array_partition variable=v948 cyclic factor=2 dim=3
  #pragma HLS resource variable=v948 core=ram_t2p_bram

  #pragma HLS array_partition variable=v949 cyclic factor=2 dim=3
  #pragma HLS resource variable=v949 core=ram_t2p_bram

  for (int v953 = 0; v953 < 2; v953 += 1) {	// L1119
    for (int v954 = 0; v954 < 2; v954 += 1) {	// L1120
      for (int v955 = 0; v955 < 2; v955 += 1) {	// L1121
        #pragma HLS pipeline II=1
        float v956 = v946[v953][v955][0];	// L1122
        float v957 = v947[v954][v953];	// L1123
        float v958 = v948[v954][v955][0];	// L1124
        float v959 = v949[v954][v955][0];	// L1125
        float v960 = (v953 == 0) ? v958 : v959;	// L1126
        float v961 = v956 * v957;	// L1127
        float v962 = v960 + v961;	// L1128
        bool v963 = v962 > (float)0.000000;	// L1129
        float v964 = v963 ? v962 : (float)0.000000;	// L1130
        float v965 = ((((-v953) + (v952 * -2)) + 127) == 0 && ((-v951) + 2) == 0 && ((-v950) + 2) == 0) ? v964 : v962;	// L1131
        v949[v954][v955][0] = v965;	// L1132
        float v966 = v946[v953][v955][1];	// L1133
        float v967 = v948[v954][v955][1];	// L1134
        float v968 = v949[v954][v955][1];	// L1135
        float v969 = (v953 == 0) ? v967 : v968;	// L1136
        float v970 = v966 * v957;	// L1137
        float v971 = v969 + v970;	// L1138
        bool v972 = v971 > (float)0.000000;	// L1139
        float v973 = v972 ? v971 : (float)0.000000;	// L1140
        float v974 = ((((-v953) + (v952 * -2)) + 127) == 0 && ((-v951) + 2) == 0 && ((-v950) + 2) == 0) ? v973 : v971;	// L1141
        v949[v954][v955][1] = v974;	// L1142
      }
    }
  }
}

void forward_node83(
  float v975[128][16][16],
  float v976[2][2][2],
  int v977,
  int v978,
  int v979
) {	// L1148
  #pragma HLS inline
  #pragma HLS array_partition variable=v975 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v976 cyclic factor=2 dim=3
  #pragma HLS resource variable=v976 core=ram_t2p_bram

  for (int v980 = 0; v980 < 2; v980 += 1) {	// L1149
    for (int v981 = 0; v981 < 2; v981 += 1) {	// L1150
      #pragma HLS pipeline II=1
      float v982 = v975[(v980 + (v977 * 2))][(v981 + (v978 * 2))][(v979 * 2)];	// L1151
      v976[v980][v981][0] = v982;	// L1152
      float v983 = v975[(v980 + (v977 * 2))][(v981 + (v978 * 2))][((v979 * 2) + 1)];	// L1153
      v976[v980][v981][1] = v983;	// L1154
    }
  }
}

void forward_node84(
  float v984[128][128][3][3],
  float v985[2][2],
  int v986,
  int v987,
  int v988,
  int v989
) {	// L1159
  #pragma HLS inline
  #pragma HLS resource variable=v985 core=ram_t2p_bram

  for (int v990 = 0; v990 < 2; v990 += 1) {	// L1160
    for (int v991 = 0; v991 < 2; v991 += 1) {	// L1161
      #pragma HLS pipeline II=1
      float v992 = v984[(v990 + (v988 * 2))][(v991 + (v989 * 2))][v986][v987];	// L1162
      v985[v990][v991] = v992;	// L1163
    }
  }
}

void forward_node85(
  float v993[128][16][16],
  float v994[2][2][2],
  int v995,
  int v996,
  int v997,
  int v998,
  int v999
) {	// L1168
  #pragma HLS inline
  #pragma HLS array_partition variable=v993 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v994 cyclic factor=2 dim=3
  #pragma HLS resource variable=v994 core=ram_t2p_bram

  for (int v1000 = 0; v1000 < 2; v1000 += 1) {	// L1169
    for (int v1001 = 0; v1001 < 2; v1001 += 1) {	// L1170
      #pragma HLS pipeline II=1
      float v1002 = v993[(v1000 + (v995 * 2))][(((v1001 + v996) + (v997 * 2)) - 1)][((v998 + (v999 * 2)) - 1)];	// L1171
      v994[v1000][v1001][0] = v1002;	// L1172
      float v1003 = v993[(v1000 + (v995 * 2))][(((v1001 + v996) + (v997 * 2)) - 1)][(v998 + (v999 * 2))];	// L1173
      v994[v1000][v1001][1] = v1003;	// L1174
    }
  }
}

void forward_node80(
  float v1004[128][16][16],
  float v1005[128][128][3][3],
  float v1006[128][16][16],
  float v1007[128][16][16]
) {	// L1179
  #pragma HLS array_partition variable=v1004 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v1006 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v1007 cyclic factor=2 dim=3

  for (int v1008 = 0; v1008 < 2359296; v1008 += 1) {	// L1180
    #pragma HLS dataflow
    int v1009 = (v1008 % 8);	// L1181
    int v1010 = ((v1008 / 8) % 8);	// L1182
    int v1011 = (((v1008 / 8) / 8) % 64);	// L1183
    int v1012 = ((((v1008 / 8) / 8) / 64) % 3);	// L1184
    int v1013 = (((((v1008 / 8) / 8) / 64) / 3) % 3);	// L1185
    int v1014 = (((((v1008 / 8) / 8) / 64) / 3) / 3);	// L1186
    float v1015[2][2][2];	// L1187
    #pragma HLS array_partition variable=v1015 cyclic factor=2 dim=3
    #pragma HLS resource variable=v1015 core=ram_t2p_bram

    float v1016[2][2];	// L1188
    #pragma HLS resource variable=v1016 core=ram_t2p_bram

    float v1017[2][2][2];	// L1189
    #pragma HLS array_partition variable=v1017 cyclic factor=2 dim=3
    #pragma HLS resource variable=v1017 core=ram_t2p_bram

    forward_node85(v1004, v1017, v1014, v1013, v1010, v1012, v1009);	// L1190
    forward_node84(v1005, v1016, v1013, v1012, v1011, v1014);	// L1191
    forward_node83(v1006, v1015, v1011, v1010, v1009);	// L1192
    float v1018[2][2][2];	// L1193
    #pragma HLS array_partition variable=v1018 cyclic factor=2 dim=3
    #pragma HLS resource variable=v1018 core=ram_t2p_bram

    forward_node82(v1017, v1016, v1015, v1018, v1012, v1013, v1014);	// L1194
    forward_node81(v1018, v1007, v1011, v1010, v1009);	// L1195
  }
}

void forward_node87(
  float v1019[2][2][2],
  float v1020[128][16][16],
  int v1021,
  int v1022,
  int v1023
) {	// L1199
  #pragma HLS inline
  #pragma HLS resource variable=v1019 core=ram_t2p_bram

  for (int v1024 = 0; v1024 < 2; v1024 += 1) {	// L1200
    for (int v1025 = 0; v1025 < 2; v1025 += 1) {	// L1201
      for (int v1026 = 0; v1026 < 2; v1026 += 1) {	// L1202
        #pragma HLS pipeline II=1
        float v1027 = v1019[v1024][v1025][v1026];	// L1203
        v1020[(v1024 + (v1021 * 2))][(v1025 + (v1022 * 2))][(v1026 + (v1023 * 2))] = v1027;	// L1204
      }
    }
  }
}

void forward_node88(
  float v1028[2][2],
  float v1029[2][2][2],
  float v1030[2][2][2],
  float v1031[2][2][2],
  float v1032[2][2][2],
  int v1033,
  int v1034,
  int v1035
) {	// L1210
  #pragma HLS inline
  #pragma HLS resource variable=v1028 core=ram_t2p_bram

  #pragma HLS resource variable=v1029 core=ram_t2p_bram

  #pragma HLS resource variable=v1030 core=ram_t2p_bram

  #pragma HLS resource variable=v1031 core=ram_t2p_bram

  #pragma HLS resource variable=v1032 core=ram_t2p_bram

  for (int v1036 = 0; v1036 < 2; v1036 += 1) {	// L1212
    for (int v1037 = 0; v1037 < 2; v1037 += 1) {	// L1213
      for (int v1038 = 0; v1038 < 2; v1038 += 1) {	// L1214
        for (int v1039 = 0; v1039 < 2; v1039 += 1) {	// L1215
          #pragma HLS pipeline II=1
          float v1040 = v1030[v1037][v1038][v1039];	// L1216
          float v1041 = v1031[v1037][v1038][v1039];	// L1217
          float v1042 = v1032[v1037][v1038][v1039];	// L1218
          float v1043 = (v1036 == 0) ? v1041 : v1042;	// L1219
          float v1044 = ((v1036 + (v1035 * 2)) == 0 && v1034 == 0 && v1033 == 0) ? v1040 : v1043;	// L1220
          float v1045 = v1029[v1036][v1038][v1039];	// L1221
          float v1046 = v1028[v1037][v1036];	// L1222
          float v1047 = v1045 * v1046;	// L1223
          float v1048 = v1044 + v1047;	// L1224
          bool v1049 = v1048 > (float)0.000000;	// L1225
          float v1050 = v1049 ? v1048 : (float)0.000000;	// L1226
          float v1051 = ((((-v1036) + (v1035 * -2)) + 63) == 0 && ((-v1034) + 2) == 0 && ((-v1033) + 2) == 0) ? v1050 : v1048;	// L1227
          v1032[v1037][v1038][v1039] = v1051;	// L1228
        }
      }
    }
  }
}

void forward_node89(
  float v1052[128][64][3][3],
  float v1053[2][2],
  int v1054,
  int v1055,
  int v1056,
  int v1057
) {	// L1235
  #pragma HLS inline
  #pragma HLS resource variable=v1053 core=ram_t2p_bram

  for (int v1058 = 0; v1058 < 2; v1058 += 1) {	// L1236
    for (int v1059 = 0; v1059 < 2; v1059 += 1) {	// L1237
      #pragma HLS pipeline II=1
      float v1060 = v1052[(v1058 + (v1056 * 2))][(v1059 + (v1057 * 2))][v1054][v1055];	// L1238
      v1053[v1058][v1059] = v1060;	// L1239
    }
  }
}

void forward_node90(
  float v1061[64][16][16],
  float v1062[2][2][2],
  int v1063,
  int v1064,
  int v1065,
  int v1066,
  int v1067
) {	// L1244
  #pragma HLS inline
  #pragma HLS resource variable=v1062 core=ram_t2p_bram

  for (int v1068 = 0; v1068 < 2; v1068 += 1) {	// L1245
    for (int v1069 = 0; v1069 < 2; v1069 += 1) {	// L1246
      for (int v1070 = 0; v1070 < 2; v1070 += 1) {	// L1247
        #pragma HLS pipeline II=1
        float v1071 = v1061[(v1068 + (v1063 * 2))][(((v1069 + v1064) + (v1065 * 2)) - 1)][(((v1070 + v1066) + (v1067 * 2)) - 1)];	// L1248
        v1062[v1068][v1069][v1070] = v1071;	// L1249
      }
    }
  }
}

void forward_node91(
  float v1072[128][16][16],
  float v1073[2][2][2],
  int v1074,
  int v1075,
  int v1076
) {	// L1255
  #pragma HLS inline
  #pragma HLS resource variable=v1073 core=ram_t2p_bram

  for (int v1077 = 0; v1077 < 2; v1077 += 1) {	// L1256
    for (int v1078 = 0; v1078 < 2; v1078 += 1) {	// L1257
      for (int v1079 = 0; v1079 < 2; v1079 += 1) {	// L1258
        #pragma HLS pipeline II=1
        float v1080 = v1072[(v1077 + (v1074 * 2))][(v1078 + (v1075 * 2))][(v1079 + (v1076 * 2))];	// L1259
        v1073[v1077][v1078][v1079] = v1080;	// L1260
      }
    }
  }
}

void forward_node92(
  float v1081[128][16][16],
  float v1082[2][2][2],
  int v1083,
  int v1084,
  int v1085
) {	// L1266
  #pragma HLS inline
  #pragma HLS resource variable=v1082 core=ram_t2p_bram

  for (int v1086 = 0; v1086 < 2; v1086 += 1) {	// L1267
    for (int v1087 = 0; v1087 < 2; v1087 += 1) {	// L1268
      for (int v1088 = 0; v1088 < 2; v1088 += 1) {	// L1269
        #pragma HLS pipeline II=1
        float v1089 = v1081[(v1086 + (v1083 * 2))][(v1087 + (v1084 * 2))][(v1088 + (v1085 * 2))];	// L1270
        v1082[v1086][v1087][v1088] = v1089;	// L1271
      }
    }
  }
}

void forward_node86(
  float v1090[64][16][16],
  float v1091[128][64][3][3],
  float v1092[128][16][16],
  float v1093[128][16][16],
  float v1094[128][16][16]
) {	// L1277
  for (int v1095 = 0; v1095 < 1179648; v1095 += 1) {	// L1278
    #pragma HLS dataflow
    int v1096 = (v1095 % 8);	// L1279
    int v1097 = ((v1095 / 8) % 8);	// L1280
    int v1098 = (((v1095 / 8) / 8) % 64);	// L1281
    int v1099 = ((((v1095 / 8) / 8) / 64) % 3);	// L1282
    int v1100 = (((((v1095 / 8) / 8) / 64) / 3) % 3);	// L1283
    int v1101 = (((((v1095 / 8) / 8) / 64) / 3) / 3);	// L1284
    float v1102[2][2];	// L1285
    #pragma HLS resource variable=v1102 core=ram_t2p_bram

    float v1103[2][2][2];	// L1286
    #pragma HLS resource variable=v1103 core=ram_t2p_bram

    float v1104[2][2][2];	// L1287
    #pragma HLS resource variable=v1104 core=ram_t2p_bram

    float v1105[2][2][2];	// L1288
    #pragma HLS resource variable=v1105 core=ram_t2p_bram

    forward_node92(v1092, v1105, v1098, v1097, v1096);	// L1289
    forward_node91(v1093, v1104, v1098, v1097, v1096);	// L1290
    forward_node90(v1090, v1103, v1101, v1100, v1097, v1099, v1096);	// L1291
    forward_node89(v1091, v1102, v1100, v1099, v1098, v1101);	// L1292
    float v1106[2][2][2];	// L1293
    #pragma HLS resource variable=v1106 core=ram_t2p_bram

    forward_node88(v1102, v1103, v1105, v1104, v1106, v1099, v1100, v1101);	// L1294
    forward_node87(v1106, v1094, v1098, v1097, v1096);	// L1295
  }
}

void forward_node94(
  float v1107[2][2][2],
  float v1108[64][16][16],
  int v1109,
  int v1110,
  int v1111
) {	// L1299
  #pragma HLS inline
  #pragma HLS resource variable=v1107 core=ram_t2p_bram

  for (int v1112 = 0; v1112 < 2; v1112 += 1) {	// L1300
    for (int v1113 = 0; v1113 < 2; v1113 += 1) {	// L1301
      for (int v1114 = 0; v1114 < 2; v1114 += 1) {	// L1302
        #pragma HLS pipeline II=1
        float v1115 = v1107[v1112][v1113][v1114];	// L1303
        v1108[(v1112 + (v1109 * 2))][(v1113 + (v1110 * 2))][(v1114 + (v1111 * 2))] = v1115;	// L1304
      }
    }
  }
}

void forward_node95(
  float v1116[2][2][2],
  float v1117[2][2][2],
  float v1118[2][2][2]
) {	// L1310
  #pragma HLS inline
  #pragma HLS resource variable=v1116 core=ram_t2p_bram

  #pragma HLS resource variable=v1117 core=ram_t2p_bram

  #pragma HLS resource variable=v1118 core=ram_t2p_bram

  for (int v1119 = 0; v1119 < 2; v1119 += 1) {	// L1311
    for (int v1120 = 0; v1120 < 2; v1120 += 1) {	// L1312
      for (int v1121 = 0; v1121 < 2; v1121 += 1) {	// L1313
        #pragma HLS pipeline II=1
        float v1122 = v1116[v1119][v1120][v1121];	// L1314
        float v1123 = v1117[v1119][v1120][v1121];	// L1315
        float v1124 = max(v1123, v1122);	// L1316
        v1118[v1119][v1120][v1121] = v1124;	// L1317
      }
    }
  }
}

void forward_node96(
  float v1125[64][16][16],
  float v1126[2][2][2],
  int v1127,
  int v1128,
  int v1129
) {	// L1323
  #pragma HLS inline
  #pragma HLS resource variable=v1126 core=ram_t2p_bram

  for (int v1130 = 0; v1130 < 2; v1130 += 1) {	// L1324
    for (int v1131 = 0; v1131 < 2; v1131 += 1) {	// L1325
      for (int v1132 = 0; v1132 < 2; v1132 += 1) {	// L1326
        #pragma HLS pipeline II=1
        float v1133 = v1125[(v1130 + (v1127 * 2))][(v1131 + (v1128 * 2))][(v1132 + (v1129 * 2))];	// L1327
        v1126[v1130][v1131][v1132] = v1133;	// L1328
      }
    }
  }
}

void forward_node97(
  float v1134[64][32][32],
  float v1135[2][2][2],
  int v1136,
  int v1137,
  int v1138,
  int v1139,
  int v1140
) {	// L1334
  #pragma HLS inline
  #pragma HLS resource variable=v1135 core=ram_t2p_bram

  for (int v1141 = 0; v1141 < 2; v1141 += 1) {	// L1335
    for (int v1142 = 0; v1142 < 2; v1142 += 1) {	// L1336
      for (int v1143 = 0; v1143 < 2; v1143 += 1) {	// L1337
        #pragma HLS pipeline II=1
        float v1144 = v1134[(v1141 + (v1136 * 2))][(((v1142 * 2) + v1137) + (v1138 * 4))][(((v1143 * 2) + v1139) + (v1140 * 4))];	// L1338
        v1135[v1141][v1142][v1143] = v1144;	// L1339
      }
    }
  }
}

void forward_node93(
  float v1145[64][32][32],
  float v1146[64][16][16],
  float v1147[64][16][16]
) {	// L1345
  for (int v1148 = 0; v1148 < 8192; v1148 += 1) {	// L1346
    #pragma HLS dataflow
    int v1149 = (v1148 % 8);	// L1347
    int v1150 = ((v1148 / 8) % 8);	// L1348
    int v1151 = (((v1148 / 8) / 8) % 32);	// L1349
    int v1152 = ((((v1148 / 8) / 8) / 32) % 2);	// L1350
    int v1153 = ((((v1148 / 8) / 8) / 32) / 2);	// L1351
    float v1154[2][2][2];	// L1352
    #pragma HLS resource variable=v1154 core=ram_t2p_bram

    float v1155[2][2][2];	// L1353
    #pragma HLS resource variable=v1155 core=ram_t2p_bram

    forward_node97(v1145, v1155, v1151, v1153, v1150, v1152, v1149);	// L1354
    forward_node96(v1146, v1154, v1151, v1150, v1149);	// L1355
    float v1156[2][2][2];	// L1356
    #pragma HLS resource variable=v1156 core=ram_t2p_bram

    forward_node95(v1155, v1154, v1156);	// L1357
    forward_node94(v1156, v1147, v1151, v1150, v1149);	// L1358
  }
}

void forward_node99(
  float v1157[2][2][2],
  float v1158[64][32][32],
  int v1159,
  int v1160,
  int v1161
) {	// L1362
  #pragma HLS inline
  #pragma HLS array_partition variable=v1157 cyclic factor=2 dim=3
  #pragma HLS resource variable=v1157 core=ram_t2p_bram

  #pragma HLS array_partition variable=v1158 cyclic factor=2 dim=3

  for (int v1162 = 0; v1162 < 2; v1162 += 1) {	// L1363
    for (int v1163 = 0; v1163 < 2; v1163 += 1) {	// L1364
      #pragma HLS pipeline II=1
      float v1164 = v1157[v1162][v1163][0];	// L1365
      v1158[(v1162 + (v1159 * 2))][(v1163 + (v1160 * 2))][(v1161 * 2)] = v1164;	// L1366
      float v1165 = v1157[v1162][v1163][1];	// L1367
      v1158[(v1162 + (v1159 * 2))][(v1163 + (v1160 * 2))][((v1161 * 2) + 1)] = v1165;	// L1368
    }
  }
}

void forward_node100(
  float v1166[2][2][2],
  float v1167[2][2],
  float v1168[2][2][2],
  float v1169[2][2][2],
  int v1170,
  int v1171,
  int v1172
) {	// L1373
  #pragma HLS inline
  #pragma HLS array_partition variable=v1166 cyclic factor=2 dim=3
  #pragma HLS resource variable=v1166 core=ram_t2p_bram

  #pragma HLS resource variable=v1167 core=ram_t2p_bram

  #pragma HLS array_partition variable=v1168 cyclic factor=2 dim=3
  #pragma HLS resource variable=v1168 core=ram_t2p_bram

  #pragma HLS array_partition variable=v1169 cyclic factor=2 dim=3
  #pragma HLS resource variable=v1169 core=ram_t2p_bram

  for (int v1173 = 0; v1173 < 2; v1173 += 1) {	// L1375
    for (int v1174 = 0; v1174 < 2; v1174 += 1) {	// L1376
      for (int v1175 = 0; v1175 < 2; v1175 += 1) {	// L1377
        #pragma HLS pipeline II=1
        float v1176 = v1166[v1173][v1175][0];	// L1378
        float v1177 = v1167[v1174][v1173];	// L1379
        float v1178 = v1168[v1174][v1175][0];	// L1380
        float v1179 = v1169[v1174][v1175][0];	// L1381
        float v1180 = (v1173 == 0) ? v1178 : v1179;	// L1382
        float v1181 = v1176 * v1177;	// L1383
        float v1182 = v1180 + v1181;	// L1384
        bool v1183 = v1182 > (float)0.000000;	// L1385
        float v1184 = v1183 ? v1182 : (float)0.000000;	// L1386
        float v1185 = ((((-v1173) + (v1172 * -2)) + 63) == 0 && ((-v1170) + 2) == 0 && ((-v1171) + 2) == 0) ? v1184 : v1182;	// L1387
        v1169[v1174][v1175][0] = v1185;	// L1388
        float v1186 = v1166[v1173][v1175][1];	// L1389
        float v1187 = v1168[v1174][v1175][1];	// L1390
        float v1188 = v1169[v1174][v1175][1];	// L1391
        float v1189 = (v1173 == 0) ? v1187 : v1188;	// L1392
        float v1190 = v1186 * v1177;	// L1393
        float v1191 = v1189 + v1190;	// L1394
        bool v1192 = v1191 > (float)0.000000;	// L1395
        float v1193 = v1192 ? v1191 : (float)0.000000;	// L1396
        float v1194 = ((((-v1173) + (v1172 * -2)) + 63) == 0 && ((-v1170) + 2) == 0 && ((-v1171) + 2) == 0) ? v1193 : v1191;	// L1397
        v1169[v1174][v1175][1] = v1194;	// L1398
      }
    }
  }
}

void forward_node101(
  float v1195[64][32][32],
  float v1196[2][2][2],
  int v1197,
  int v1198,
  int v1199
) {	// L1404
  #pragma HLS inline
  #pragma HLS array_partition variable=v1195 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v1196 cyclic factor=2 dim=3
  #pragma HLS resource variable=v1196 core=ram_t2p_bram

  for (int v1200 = 0; v1200 < 2; v1200 += 1) {	// L1405
    for (int v1201 = 0; v1201 < 2; v1201 += 1) {	// L1406
      #pragma HLS pipeline II=1
      float v1202 = v1195[(v1200 + (v1197 * 2))][(v1201 + (v1198 * 2))][(v1199 * 2)];	// L1407
      v1196[v1200][v1201][0] = v1202;	// L1408
      float v1203 = v1195[(v1200 + (v1197 * 2))][(v1201 + (v1198 * 2))][((v1199 * 2) + 1)];	// L1409
      v1196[v1200][v1201][1] = v1203;	// L1410
    }
  }
}

void forward_node102(
  float v1204[64][64][3][3],
  float v1205[2][2],
  int v1206,
  int v1207,
  int v1208,
  int v1209
) {	// L1415
  #pragma HLS inline
  #pragma HLS resource variable=v1205 core=ram_t2p_bram

  for (int v1210 = 0; v1210 < 2; v1210 += 1) {	// L1416
    for (int v1211 = 0; v1211 < 2; v1211 += 1) {	// L1417
      #pragma HLS pipeline II=1
      float v1212 = v1204[(v1210 + (v1208 * 2))][(v1211 + (v1209 * 2))][v1206][v1207];	// L1418
      v1205[v1210][v1211] = v1212;	// L1419
    }
  }
}

void forward_node103(
  float v1213[64][32][32],
  float v1214[2][2][2],
  int v1215,
  int v1216,
  int v1217,
  int v1218,
  int v1219
) {	// L1424
  #pragma HLS inline
  #pragma HLS array_partition variable=v1213 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v1214 cyclic factor=2 dim=3
  #pragma HLS resource variable=v1214 core=ram_t2p_bram

  for (int v1220 = 0; v1220 < 2; v1220 += 1) {	// L1425
    for (int v1221 = 0; v1221 < 2; v1221 += 1) {	// L1426
      #pragma HLS pipeline II=1
      float v1222 = v1213[(v1220 + (v1215 * 2))][(((v1221 + v1216) + (v1217 * 2)) - 1)][((v1218 + (v1219 * 2)) - 1)];	// L1427
      v1214[v1220][v1221][0] = v1222;	// L1428
      float v1223 = v1213[(v1220 + (v1215 * 2))][(((v1221 + v1216) + (v1217 * 2)) - 1)][(v1218 + (v1219 * 2))];	// L1429
      v1214[v1220][v1221][1] = v1223;	// L1430
    }
  }
}

void forward_node98(
  float v1224[64][32][32],
  float v1225[64][64][3][3],
  float v1226[64][32][32],
  float v1227[64][32][32]
) {	// L1435
  #pragma HLS array_partition variable=v1224 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v1226 cyclic factor=2 dim=3

  #pragma HLS array_partition variable=v1227 cyclic factor=2 dim=3

  for (int v1228 = 0; v1228 < 2359296; v1228 += 1) {	// L1436
    #pragma HLS dataflow
    int v1229 = (v1228 % 16);	// L1437
    int v1230 = ((v1228 / 16) % 16);	// L1438
    int v1231 = (((v1228 / 16) / 16) % 32);	// L1439
    int v1232 = ((((v1228 / 16) / 16) / 32) % 3);	// L1440
    int v1233 = (((((v1228 / 16) / 16) / 32) / 3) % 3);	// L1441
    int v1234 = (((((v1228 / 16) / 16) / 32) / 3) / 3);	// L1442
    float v1235[2][2][2];	// L1443
    #pragma HLS array_partition variable=v1235 cyclic factor=2 dim=3
    #pragma HLS resource variable=v1235 core=ram_t2p_bram

    float v1236[2][2];	// L1444
    #pragma HLS resource variable=v1236 core=ram_t2p_bram

    float v1237[2][2][2];	// L1445
    #pragma HLS array_partition variable=v1237 cyclic factor=2 dim=3
    #pragma HLS resource variable=v1237 core=ram_t2p_bram

    forward_node103(v1224, v1237, v1234, v1233, v1230, v1232, v1229);	// L1446
    forward_node102(v1225, v1236, v1233, v1232, v1231, v1234);	// L1447
    forward_node101(v1226, v1235, v1231, v1230, v1229);	// L1448
    float v1238[2][2][2];	// L1449
    #pragma HLS array_partition variable=v1238 cyclic factor=2 dim=3
    #pragma HLS resource variable=v1238 core=ram_t2p_bram

    forward_node100(v1237, v1236, v1235, v1238, v1233, v1232, v1234);	// L1450
    forward_node99(v1238, v1227, v1231, v1230, v1229);	// L1451
  }
}

void forward_node105(
  float v1239[2][2][2],
  float v1240[64][32][32],
  int v1241,
  int v1242,
  int v1243
) {	// L1455
  #pragma HLS inline
  #pragma HLS resource variable=v1239 core=ram_t2p_bram

  for (int v1244 = 0; v1244 < 2; v1244 += 1) {	// L1456
    for (int v1245 = 0; v1245 < 2; v1245 += 1) {	// L1457
      for (int v1246 = 0; v1246 < 2; v1246 += 1) {	// L1458
        #pragma HLS pipeline II=1
        float v1247 = v1239[v1244][v1245][v1246];	// L1459
        v1240[(v1244 + (v1241 * 2))][(v1245 + (v1242 * 2))][(v1246 + (v1243 * 2))] = v1247;	// L1460
      }
    }
  }
}

void forward_node106(
  float v1248[2],
  float v1249[2][2][2],
  float v1250[2][2],
  float v1251[2][2][2],
  float v1252[2][2][2],
  int v1253,
  int v1254,
  int v1255
) {	// L1466
  #pragma HLS inline
  #pragma HLS resource variable=v1248 core=ram_t2p_bram

  #pragma HLS resource variable=v1249 core=ram_t2p_bram

  #pragma HLS resource variable=v1250 core=ram_t2p_bram

  #pragma HLS resource variable=v1251 core=ram_t2p_bram

  #pragma HLS resource variable=v1252 core=ram_t2p_bram

  for (int v1256 = 0; v1256 < 2; v1256 += 1) {	// L1468
    for (int v1257 = 0; v1257 < 2; v1257 += 1) {	// L1469
      for (int v1258 = 0; v1258 < 2; v1258 += 1) {	// L1470
        #pragma HLS pipeline II=1
        float v1259 = v1249[v1256][v1257][v1258];	// L1471
        float v1260 = v1251[v1256][v1257][v1258];	// L1472
        float v1261 = (v1255 == 0 && v1254 == 0 && v1253 == 0) ? v1259 : v1260;	// L1473
        float v1262 = v1250[v1257][v1258];	// L1474
        float v1263 = v1248[v1256];	// L1475
        float v1264 = v1262 * v1263;	// L1476
        float v1265 = v1261 + v1264;	// L1477
        bool v1266 = v1265 > (float)0.000000;	// L1478
        float v1267 = v1266 ? v1265 : (float)0.000000;	// L1479
        float v1268 = (((-v1255) + 2) == 0 && ((-v1254) + 2) == 0 && ((-v1253) + 2) == 0) ? v1267 : v1265;	// L1480
        v1252[v1256][v1257][v1258] = v1268;	// L1481
      }
    }
  }
}

void forward_node107(
  float v1269[64][3][3][3],
  float v1270[2],
  int v1271,
  int v1272,
  int v1273,
  int v1274
) {	// L1487
  #pragma HLS inline
  #pragma HLS resource variable=v1270 core=ram_t2p_bram

  for (int v1275 = 0; v1275 < 2; v1275 += 1) {	// L1488
    #pragma HLS pipeline II=1
    float v1276 = v1269[(v1275 + (v1274 * 2))][v1271][v1272][v1273];	// L1489
    v1270[v1275] = v1276;	// L1490
  }
}

void forward_node108(
  float v1277[3][32][32],
  float v1278[2][2],
  int v1279,
  int v1280,
  int v1281,
  int v1282,
  int v1283
) {	// L1494
  #pragma HLS inline
  #pragma HLS resource variable=v1278 core=ram_t2p_bram

  for (int v1284 = 0; v1284 < 2; v1284 += 1) {	// L1495
    for (int v1285 = 0; v1285 < 2; v1285 += 1) {	// L1496
      #pragma HLS pipeline II=1
      float v1286 = v1277[v1279][(((v1284 + v1280) + (v1281 * 2)) - 1)][(((v1285 + v1282) + (v1283 * 2)) - 1)];	// L1497
      v1278[v1284][v1285] = v1286;	// L1498
    }
  }
}

void forward_node109(
  float v1287[64][32][32],
  float v1288[2][2][2],
  int v1289,
  int v1290,
  int v1291
) {	// L1503
  #pragma HLS inline
  #pragma HLS resource variable=v1288 core=ram_t2p_bram

  for (int v1292 = 0; v1292 < 2; v1292 += 1) {	// L1504
    for (int v1293 = 0; v1293 < 2; v1293 += 1) {	// L1505
      for (int v1294 = 0; v1294 < 2; v1294 += 1) {	// L1506
        #pragma HLS pipeline II=1
        float v1295 = v1287[(v1292 + (v1289 * 2))][(v1293 + (v1290 * 2))][(v1294 + (v1291 * 2))];	// L1507
        v1288[v1292][v1293][v1294] = v1295;	// L1508
      }
    }
  }
}

void forward_node110(
  float v1296[64][32][32],
  float v1297[2][2][2],
  int v1298,
  int v1299,
  int v1300
) {	// L1514
  #pragma HLS inline
  #pragma HLS resource variable=v1297 core=ram_t2p_bram

  for (int v1301 = 0; v1301 < 2; v1301 += 1) {	// L1515
    for (int v1302 = 0; v1302 < 2; v1302 += 1) {	// L1516
      for (int v1303 = 0; v1303 < 2; v1303 += 1) {	// L1517
        #pragma HLS pipeline II=1
        float v1304 = v1296[(v1301 + (v1298 * 2))][(v1302 + (v1299 * 2))][(v1303 + (v1300 * 2))];	// L1518
        v1297[v1301][v1302][v1303] = v1304;	// L1519
      }
    }
  }
}

void forward_node104(
  float v1305[64][3][3][3],
  float v1306[64][32][32],
  float v1307[3][32][32],
  float v1308[64][32][32],
  float v1309[64][32][32]
) {	// L1525
  for (int v1310 = 0; v1310 < 221184; v1310 += 1) {	// L1526
    #pragma HLS dataflow
    int v1311 = (v1310 % 16);	// L1527
    int v1312 = ((v1310 / 16) % 16);	// L1528
    int v1313 = (((v1310 / 16) / 16) % 32);	// L1529
    int v1314 = ((((v1310 / 16) / 16) / 32) % 3);	// L1530
    int v1315 = (((((v1310 / 16) / 16) / 32) / 3) % 3);	// L1531
    int v1316 = (((((v1310 / 16) / 16) / 32) / 3) / 3);	// L1532
    float v1317[2];	// L1533
    #pragma HLS resource variable=v1317 core=ram_t2p_bram

    float v1318[2][2];	// L1534
    #pragma HLS resource variable=v1318 core=ram_t2p_bram

    float v1319[2][2][2];	// L1535
    #pragma HLS resource variable=v1319 core=ram_t2p_bram

    float v1320[2][2][2];	// L1536
    #pragma HLS resource variable=v1320 core=ram_t2p_bram

    forward_node110(v1306, v1320, v1313, v1312, v1311);	// L1537
    forward_node109(v1308, v1319, v1313, v1312, v1311);	// L1538
    forward_node108(v1307, v1318, v1316, v1315, v1312, v1314, v1311);	// L1539
    forward_node107(v1305, v1317, v1316, v1315, v1314, v1313);	// L1540
    float v1321[2][2][2];	// L1541
    #pragma HLS resource variable=v1321 core=ram_t2p_bram

    forward_node106(v1317, v1320, v1318, v1319, v1321, v1314, v1315, v1316);	// L1542
    forward_node105(v1321, v1309, v1313, v1312, v1311);	// L1543
  }
}

/// This is top function.
void forward(
  float v1322[3][32][32],
  float v1323[512],
  float v1324[512],
  float v1325[64][3][3][3],
  float v1326[64][64][3][3],
  float v1327[128][64][3][3],
  float v1328[128][128][3][3],
  float v1329[256][128][3][3],
  float v1330[256][256][3][3],
  float v1331[256][256][3][3],
  float v1332[512][256][3][3],
  float v1333[512][512][3][3],
  float v1334[512][512][3][3],
  float v1335[512][512][3][3],
  float v1336[512][512][3][3],
  float v1337[512][512][3][3],
  float v1338[64][32][32],
  float v1339[64][32][32],
  float v1340[64][32][32],
  float v1341[64][32][32],
  float v1342[64][32][32],
  float v1343[64][32][32],
  float v1344[64][32][32],
  float v1345[64][16][16],
  float v1346[64][16][16],
  float v1347[64][16][16],
  float v1348[128][16][16],
  float v1349[128][16][16],
  float v1350[128][16][16],
  float v1351[128][16][16],
  float v1352[128][16][16],
  float v1353[128][16][16],
  float v1354[128][16][16],
  float v1355[128][8][8],
  float v1356[128][8][8],
  float v1357[128][8][8],
  float v1358[256][8][8],
  float v1359[256][8][8],
  float v1360[256][8][8],
  float v1361[256][8][8],
  float v1362[256][8][8],
  float v1363[256][8][8],
  float v1364[256][8][8],
  float v1365[256][8][8],
  float v1366[256][8][8],
  float v1367[256][8][8],
  float v1368[256][8][8],
  float v1369[256][4][4],
  float v1370[256][4][4],
  float v1371[256][4][4],
  float v1372[512][4][4],
  float v1373[512][4][4],
  float v1374[512][4][4],
  float v1375[512][4][4],
  float v1376[512][4][4],
  float v1377[512][4][4],
  float v1378[512][4][4],
  float v1379[512][4][4],
  float v1380[512][4][4],
  float v1381[512][4][4],
  float v1382[512][4][4],
  float v1383[512][2][2],
  float v1384[512][2][2],
  float v1385[512][2][2],
  float v1386[512][2][2],
  float v1387[512][2][2],
  float v1388[512][2][2],
  float v1389[512][2][2],
  float v1390[512][2][2],
  float v1391[512][2][2],
  float v1392[512][2][2],
  float v1393[512][2][2],
  float v1394[512][2][2],
  float v1395[512][2][2],
  float v1396[512][2][2]
) {	// L1547
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface ap_memory port=v1396
  #pragma HLS stable variable=v1396

  #pragma HLS interface ap_memory port=v1395
  #pragma HLS stable variable=v1395

  #pragma HLS interface ap_memory port=v1394
  #pragma HLS stable variable=v1394

  #pragma HLS interface ap_memory port=v1393
  #pragma HLS stable variable=v1393

  #pragma HLS interface ap_memory port=v1392
  #pragma HLS stable variable=v1392

  #pragma HLS interface ap_memory port=v1391
  #pragma HLS stable variable=v1391

  #pragma HLS interface ap_memory port=v1390
  #pragma HLS stable variable=v1390

  #pragma HLS interface ap_memory port=v1389
  #pragma HLS stable variable=v1389

  #pragma HLS interface ap_memory port=v1388
  #pragma HLS stable variable=v1388

  #pragma HLS interface ap_memory port=v1387
  #pragma HLS stable variable=v1387

  #pragma HLS interface ap_memory port=v1386
  #pragma HLS stable variable=v1386

  #pragma HLS interface ap_memory port=v1385
  #pragma HLS stable variable=v1385

  #pragma HLS interface ap_memory port=v1384
  #pragma HLS stable variable=v1384

  #pragma HLS interface ap_memory port=v1383
  #pragma HLS stable variable=v1383

  #pragma HLS interface ap_memory port=v1382
  #pragma HLS stable variable=v1382
  #pragma HLS array_partition variable=v1382 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1381
  #pragma HLS stable variable=v1381
  #pragma HLS array_partition variable=v1381 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1380
  #pragma HLS stable variable=v1380
  #pragma HLS array_partition variable=v1380 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1379
  #pragma HLS stable variable=v1379
  #pragma HLS array_partition variable=v1379 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1378
  #pragma HLS stable variable=v1378

  #pragma HLS interface ap_memory port=v1377
  #pragma HLS stable variable=v1377

  #pragma HLS interface ap_memory port=v1376
  #pragma HLS stable variable=v1376

  #pragma HLS interface ap_memory port=v1375
  #pragma HLS stable variable=v1375
  #pragma HLS array_partition variable=v1375 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1374
  #pragma HLS stable variable=v1374
  #pragma HLS array_partition variable=v1374 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1373
  #pragma HLS stable variable=v1373
  #pragma HLS array_partition variable=v1373 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1372
  #pragma HLS stable variable=v1372

  #pragma HLS interface ap_memory port=v1371
  #pragma HLS stable variable=v1371

  #pragma HLS interface ap_memory port=v1370
  #pragma HLS stable variable=v1370

  #pragma HLS interface ap_memory port=v1369
  #pragma HLS stable variable=v1369

  #pragma HLS interface ap_memory port=v1368
  #pragma HLS stable variable=v1368
  #pragma HLS array_partition variable=v1368 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1367
  #pragma HLS stable variable=v1367
  #pragma HLS array_partition variable=v1367 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1366
  #pragma HLS stable variable=v1366
  #pragma HLS array_partition variable=v1366 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1365
  #pragma HLS stable variable=v1365
  #pragma HLS array_partition variable=v1365 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1364
  #pragma HLS stable variable=v1364

  #pragma HLS interface ap_memory port=v1363
  #pragma HLS stable variable=v1363

  #pragma HLS interface ap_memory port=v1362
  #pragma HLS stable variable=v1362

  #pragma HLS interface ap_memory port=v1361
  #pragma HLS stable variable=v1361
  #pragma HLS array_partition variable=v1361 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1360
  #pragma HLS stable variable=v1360
  #pragma HLS array_partition variable=v1360 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1359
  #pragma HLS stable variable=v1359
  #pragma HLS array_partition variable=v1359 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1358
  #pragma HLS stable variable=v1358

  #pragma HLS interface ap_memory port=v1357
  #pragma HLS stable variable=v1357

  #pragma HLS interface ap_memory port=v1356
  #pragma HLS stable variable=v1356

  #pragma HLS interface ap_memory port=v1355
  #pragma HLS stable variable=v1355

  #pragma HLS interface ap_memory port=v1354
  #pragma HLS stable variable=v1354
  #pragma HLS array_partition variable=v1354 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1353
  #pragma HLS stable variable=v1353

  #pragma HLS interface ap_memory port=v1352
  #pragma HLS stable variable=v1352

  #pragma HLS interface ap_memory port=v1351
  #pragma HLS stable variable=v1351

  #pragma HLS interface ap_memory port=v1350
  #pragma HLS stable variable=v1350
  #pragma HLS array_partition variable=v1350 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1349
  #pragma HLS stable variable=v1349
  #pragma HLS array_partition variable=v1349 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1348
  #pragma HLS stable variable=v1348

  #pragma HLS interface ap_memory port=v1347
  #pragma HLS stable variable=v1347

  #pragma HLS interface ap_memory port=v1346
  #pragma HLS stable variable=v1346

  #pragma HLS interface ap_memory port=v1345
  #pragma HLS stable variable=v1345

  #pragma HLS interface ap_memory port=v1344
  #pragma HLS stable variable=v1344
  #pragma HLS array_partition variable=v1344 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1343
  #pragma HLS stable variable=v1343

  #pragma HLS interface ap_memory port=v1342
  #pragma HLS stable variable=v1342

  #pragma HLS interface ap_memory port=v1341
  #pragma HLS stable variable=v1341

  #pragma HLS interface ap_memory port=v1340
  #pragma HLS stable variable=v1340
  #pragma HLS array_partition variable=v1340 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1339
  #pragma HLS stable variable=v1339
  #pragma HLS array_partition variable=v1339 cyclic factor=2 dim=3


  #pragma HLS interface ap_memory port=v1338
  #pragma HLS stable variable=v1338

  #pragma HLS interface ap_memory port=v1337
  #pragma HLS stable variable=v1337

  #pragma HLS interface ap_memory port=v1336
  #pragma HLS stable variable=v1336

  #pragma HLS interface ap_memory port=v1335
  #pragma HLS stable variable=v1335

  #pragma HLS interface ap_memory port=v1334
  #pragma HLS stable variable=v1334

  #pragma HLS interface ap_memory port=v1333
  #pragma HLS stable variable=v1333

  #pragma HLS interface ap_memory port=v1332
  #pragma HLS stable variable=v1332

  #pragma HLS interface ap_memory port=v1331
  #pragma HLS stable variable=v1331

  #pragma HLS interface ap_memory port=v1330
  #pragma HLS stable variable=v1330

  #pragma HLS interface ap_memory port=v1329
  #pragma HLS stable variable=v1329

  #pragma HLS interface ap_memory port=v1328
  #pragma HLS stable variable=v1328

  #pragma HLS interface ap_memory port=v1327
  #pragma HLS stable variable=v1327

  #pragma HLS interface ap_memory port=v1326
  #pragma HLS stable variable=v1326

  #pragma HLS interface ap_memory port=v1325
  #pragma HLS stable variable=v1325

  #pragma HLS interface ap_memory port=v1324
  #pragma HLS stable variable=v1324

  #pragma HLS interface ap_memory port=v1323
  #pragma HLS stable variable=v1323

  #pragma HLS interface ap_memory port=v1322
  #pragma HLS stable variable=v1322

  forward_node104(v1325, v1338, v1322, v1343, v1342);	// L1698
  forward_node98(v1344, v1326, v1340, v1339);	// L1699
  forward_node93(v1341, v1346, v1345);	// L1700
  forward_node86(v1347, v1327, v1348, v1353, v1352);	// L1701
  forward_node80(v1354, v1328, v1350, v1349);	// L1702
  forward_node75(v1351, v1356, v1355);	// L1703
  forward_node68(v1329, v1357, v1358, v1364, v1363);	// L1704
  forward_node61(v1330, v1365, v1359, v1367, v1366);	// L1705
  forward_node55(v1331, v1368, v1361, v1360);	// L1706
  forward_node50(v1362, v1370, v1369);	// L1707
  forward_node43(v1372, v1332, v1371, v1378, v1377);	// L1708
  forward_node36(v1373, v1333, v1379, v1381, v1380);	// L1709
  forward_node30(v1334, v1382, v1375, v1374);	// L1710
  forward_node25(v1376, v1384, v1383);	// L1711
  forward_node18(v1335, v1385, v1386, v1392, v1391);	// L1712
  forward_node11(v1393, v1336, v1387, v1395, v1394);	// L1713
  forward_node5(v1337, v1396, v1389, v1388);	// L1714
  forward_node0(v1390, v1323, v1324);	// L1715
}

