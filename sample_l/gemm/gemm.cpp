
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
/// Latency=4297064475, interval=4297064475
/// DSP=83, BRAM=0
void gemm(
  float v0,
  float v1,
  float v2[4096][4096],
  float v3[4096][4096],
  float v4[4096][4096]
) {	// L5, [0,4297064475)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=16 dim=2
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=8 dim=1
  #pragma HLS array_partition variable=v4 cyclic factor=16 dim=2
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 512; v5 += 1) {	// L6, [0,2097160), iterCycle=14, II=8
    for (int v6 = 0; v6 < 512; v6 += 1) {	// L7, [4294967313,4294971417), iterCycle=14, II=8
      #pragma HLS pipeline II=1
      float v7 = v4[(v5 * 8)][(v6 * 8)];	// L8, [0,2)
      float v8 = v7 * v1;	// L9, [2,6)
      v4[(v5 * 8)][(v6 * 8)] = v8;	// L10, [6,7)
      float v9 = v4[(v5 * 8)][((v6 * 8) + 1)];	// L11, [1,3)
      float v10 = v9 * v1;	// L12, [3,7)
      v4[(v5 * 8)][((v6 * 8) + 1)] = v10;	// L13, [7,8)
      float v11 = v4[(v5 * 8)][((v6 * 8) + 2)];	// L14, [2,4)
      float v12 = v11 * v1;	// L15, [4,8)
      v4[(v5 * 8)][((v6 * 8) + 2)] = v12;	// L16, [8,9)
      float v13 = v4[(v5 * 8)][((v6 * 8) + 3)];	// L17, [3,5)
      float v14 = v13 * v1;	// L18, [5,9)
      v4[(v5 * 8)][((v6 * 8) + 3)] = v14;	// L19, [9,10)
      float v15 = v4[(v5 * 8)][((v6 * 8) + 4)];	// L20, [4,6)
      float v16 = v15 * v1;	// L21, [6,10)
      v4[(v5 * 8)][((v6 * 8) + 4)] = v16;	// L22, [10,11)
      float v17 = v4[(v5 * 8)][((v6 * 8) + 5)];	// L23, [5,7)
      float v18 = v17 * v1;	// L24, [7,11)
      v4[(v5 * 8)][((v6 * 8) + 5)] = v18;	// L25, [11,12)
      float v19 = v4[(v5 * 8)][((v6 * 8) + 6)];	// L26, [6,8)
      float v20 = v19 * v1;	// L27, [8,12)
      v4[(v5 * 8)][((v6 * 8) + 6)] = v20;	// L28, [12,13)
      float v21 = v4[(v5 * 8)][((v6 * 8) + 7)];	// L29, [7,9)
      float v22 = v21 * v1;	// L30, [9,13)
      v4[(v5 * 8)][((v6 * 8) + 7)] = v22;	// L31, [13,14)
      float v23 = v4[((v5 * 8) + 1)][(v6 * 8)];	// L32, [0,2)
      float v24 = v23 * v1;	// L33, [2,6)
      v4[((v5 * 8) + 1)][(v6 * 8)] = v24;	// L34, [6,7)
      float v25 = v4[((v5 * 8) + 1)][((v6 * 8) + 1)];	// L35, [1,3)
      float v26 = v25 * v1;	// L36, [3,7)
      v4[((v5 * 8) + 1)][((v6 * 8) + 1)] = v26;	// L37, [7,8)
      float v27 = v4[((v5 * 8) + 1)][((v6 * 8) + 2)];	// L38, [2,4)
      float v28 = v27 * v1;	// L39, [4,8)
      v4[((v5 * 8) + 1)][((v6 * 8) + 2)] = v28;	// L40, [8,9)
      float v29 = v4[((v5 * 8) + 1)][((v6 * 8) + 3)];	// L41, [3,5)
      float v30 = v29 * v1;	// L42, [5,9)
      v4[((v5 * 8) + 1)][((v6 * 8) + 3)] = v30;	// L43, [9,10)
      float v31 = v4[((v5 * 8) + 1)][((v6 * 8) + 4)];	// L44, [4,6)
      float v32 = v31 * v1;	// L45, [6,10)
      v4[((v5 * 8) + 1)][((v6 * 8) + 4)] = v32;	// L46, [10,11)
      float v33 = v4[((v5 * 8) + 1)][((v6 * 8) + 5)];	// L47, [5,7)
      float v34 = v33 * v1;	// L48, [7,11)
      v4[((v5 * 8) + 1)][((v6 * 8) + 5)] = v34;	// L49, [11,12)
      float v35 = v4[((v5 * 8) + 1)][((v6 * 8) + 6)];	// L50, [6,8)
      float v36 = v35 * v1;	// L51, [8,12)
      v4[((v5 * 8) + 1)][((v6 * 8) + 6)] = v36;	// L52, [12,13)
      float v37 = v4[((v5 * 8) + 1)][((v6 * 8) + 7)];	// L53, [7,9)
      float v38 = v37 * v1;	// L54, [9,13)
      v4[((v5 * 8) + 1)][((v6 * 8) + 7)] = v38;	// L55, [13,14)
      float v39 = v4[((v5 * 8) + 2)][(v6 * 8)];	// L56, [0,2)
      float v40 = v39 * v1;	// L57, [2,6)
      v4[((v5 * 8) + 2)][(v6 * 8)] = v40;	// L58, [6,7)
      float v41 = v4[((v5 * 8) + 2)][((v6 * 8) + 1)];	// L59, [1,3)
      float v42 = v41 * v1;	// L60, [3,7)
      v4[((v5 * 8) + 2)][((v6 * 8) + 1)] = v42;	// L61, [7,8)
      float v43 = v4[((v5 * 8) + 2)][((v6 * 8) + 2)];	// L62, [2,4)
      float v44 = v43 * v1;	// L63, [4,8)
      v4[((v5 * 8) + 2)][((v6 * 8) + 2)] = v44;	// L64, [8,9)
      float v45 = v4[((v5 * 8) + 2)][((v6 * 8) + 3)];	// L65, [3,5)
      float v46 = v45 * v1;	// L66, [5,9)
      v4[((v5 * 8) + 2)][((v6 * 8) + 3)] = v46;	// L67, [9,10)
      float v47 = v4[((v5 * 8) + 2)][((v6 * 8) + 4)];	// L68, [4,6)
      float v48 = v47 * v1;	// L69, [6,10)
      v4[((v5 * 8) + 2)][((v6 * 8) + 4)] = v48;	// L70, [10,11)
      float v49 = v4[((v5 * 8) + 2)][((v6 * 8) + 5)];	// L71, [5,7)
      float v50 = v49 * v1;	// L72, [7,11)
      v4[((v5 * 8) + 2)][((v6 * 8) + 5)] = v50;	// L73, [11,12)
      float v51 = v4[((v5 * 8) + 2)][((v6 * 8) + 6)];	// L74, [6,8)
      float v52 = v51 * v1;	// L75, [8,12)
      v4[((v5 * 8) + 2)][((v6 * 8) + 6)] = v52;	// L76, [12,13)
      float v53 = v4[((v5 * 8) + 2)][((v6 * 8) + 7)];	// L77, [7,9)
      float v54 = v53 * v1;	// L78, [9,13)
      v4[((v5 * 8) + 2)][((v6 * 8) + 7)] = v54;	// L79, [13,14)
      float v55 = v4[((v5 * 8) + 3)][(v6 * 8)];	// L80, [0,2)
      float v56 = v55 * v1;	// L81, [2,6)
      v4[((v5 * 8) + 3)][(v6 * 8)] = v56;	// L82, [6,7)
      float v57 = v4[((v5 * 8) + 3)][((v6 * 8) + 1)];	// L83, [1,3)
      float v58 = v57 * v1;	// L84, [3,7)
      v4[((v5 * 8) + 3)][((v6 * 8) + 1)] = v58;	// L85, [7,8)
      float v59 = v4[((v5 * 8) + 3)][((v6 * 8) + 2)];	// L86, [2,4)
      float v60 = v59 * v1;	// L87, [4,8)
      v4[((v5 * 8) + 3)][((v6 * 8) + 2)] = v60;	// L88, [8,9)
      float v61 = v4[((v5 * 8) + 3)][((v6 * 8) + 3)];	// L89, [3,5)
      float v62 = v61 * v1;	// L90, [5,9)
      v4[((v5 * 8) + 3)][((v6 * 8) + 3)] = v62;	// L91, [9,10)
      float v63 = v4[((v5 * 8) + 3)][((v6 * 8) + 4)];	// L92, [4,6)
      float v64 = v63 * v1;	// L93, [6,10)
      v4[((v5 * 8) + 3)][((v6 * 8) + 4)] = v64;	// L94, [10,11)
      float v65 = v4[((v5 * 8) + 3)][((v6 * 8) + 5)];	// L95, [5,7)
      float v66 = v65 * v1;	// L96, [7,11)
      v4[((v5 * 8) + 3)][((v6 * 8) + 5)] = v66;	// L97, [11,12)
      float v67 = v4[((v5 * 8) + 3)][((v6 * 8) + 6)];	// L98, [6,8)
      float v68 = v67 * v1;	// L99, [8,12)
      v4[((v5 * 8) + 3)][((v6 * 8) + 6)] = v68;	// L100, [12,13)
      float v69 = v4[((v5 * 8) + 3)][((v6 * 8) + 7)];	// L101, [7,9)
      float v70 = v69 * v1;	// L102, [9,13)
      v4[((v5 * 8) + 3)][((v6 * 8) + 7)] = v70;	// L103, [13,14)
      float v71 = v4[((v5 * 8) + 4)][(v6 * 8)];	// L104, [0,2)
      float v72 = v71 * v1;	// L105, [2,6)
      v4[((v5 * 8) + 4)][(v6 * 8)] = v72;	// L106, [6,7)
      float v73 = v4[((v5 * 8) + 4)][((v6 * 8) + 1)];	// L107, [1,3)
      float v74 = v73 * v1;	// L108, [3,7)
      v4[((v5 * 8) + 4)][((v6 * 8) + 1)] = v74;	// L109, [7,8)
      float v75 = v4[((v5 * 8) + 4)][((v6 * 8) + 2)];	// L110, [2,4)
      float v76 = v75 * v1;	// L111, [4,8)
      v4[((v5 * 8) + 4)][((v6 * 8) + 2)] = v76;	// L112, [8,9)
      float v77 = v4[((v5 * 8) + 4)][((v6 * 8) + 3)];	// L113, [3,5)
      float v78 = v77 * v1;	// L114, [5,9)
      v4[((v5 * 8) + 4)][((v6 * 8) + 3)] = v78;	// L115, [9,10)
      float v79 = v4[((v5 * 8) + 4)][((v6 * 8) + 4)];	// L116, [4,6)
      float v80 = v79 * v1;	// L117, [6,10)
      v4[((v5 * 8) + 4)][((v6 * 8) + 4)] = v80;	// L118, [10,11)
      float v81 = v4[((v5 * 8) + 4)][((v6 * 8) + 5)];	// L119, [5,7)
      float v82 = v81 * v1;	// L120, [7,11)
      v4[((v5 * 8) + 4)][((v6 * 8) + 5)] = v82;	// L121, [11,12)
      float v83 = v4[((v5 * 8) + 4)][((v6 * 8) + 6)];	// L122, [6,8)
      float v84 = v83 * v1;	// L123, [8,12)
      v4[((v5 * 8) + 4)][((v6 * 8) + 6)] = v84;	// L124, [12,13)
      float v85 = v4[((v5 * 8) + 4)][((v6 * 8) + 7)];	// L125, [7,9)
      float v86 = v85 * v1;	// L126, [9,13)
      v4[((v5 * 8) + 4)][((v6 * 8) + 7)] = v86;	// L127, [13,14)
      float v87 = v4[((v5 * 8) + 5)][(v6 * 8)];	// L128, [0,2)
      float v88 = v87 * v1;	// L129, [2,6)
      v4[((v5 * 8) + 5)][(v6 * 8)] = v88;	// L130, [6,7)
      float v89 = v4[((v5 * 8) + 5)][((v6 * 8) + 1)];	// L131, [1,3)
      float v90 = v89 * v1;	// L132, [3,7)
      v4[((v5 * 8) + 5)][((v6 * 8) + 1)] = v90;	// L133, [7,8)
      float v91 = v4[((v5 * 8) + 5)][((v6 * 8) + 2)];	// L134, [2,4)
      float v92 = v91 * v1;	// L135, [4,8)
      v4[((v5 * 8) + 5)][((v6 * 8) + 2)] = v92;	// L136, [8,9)
      float v93 = v4[((v5 * 8) + 5)][((v6 * 8) + 3)];	// L137, [3,5)
      float v94 = v93 * v1;	// L138, [5,9)
      v4[((v5 * 8) + 5)][((v6 * 8) + 3)] = v94;	// L139, [9,10)
      float v95 = v4[((v5 * 8) + 5)][((v6 * 8) + 4)];	// L140, [4,6)
      float v96 = v95 * v1;	// L141, [6,10)
      v4[((v5 * 8) + 5)][((v6 * 8) + 4)] = v96;	// L142, [10,11)
      float v97 = v4[((v5 * 8) + 5)][((v6 * 8) + 5)];	// L143, [5,7)
      float v98 = v97 * v1;	// L144, [7,11)
      v4[((v5 * 8) + 5)][((v6 * 8) + 5)] = v98;	// L145, [11,12)
      float v99 = v4[((v5 * 8) + 5)][((v6 * 8) + 6)];	// L146, [6,8)
      float v100 = v99 * v1;	// L147, [8,12)
      v4[((v5 * 8) + 5)][((v6 * 8) + 6)] = v100;	// L148, [12,13)
      float v101 = v4[((v5 * 8) + 5)][((v6 * 8) + 7)];	// L149, [7,9)
      float v102 = v101 * v1;	// L150, [9,13)
      v4[((v5 * 8) + 5)][((v6 * 8) + 7)] = v102;	// L151, [13,14)
      float v103 = v4[((v5 * 8) + 6)][(v6 * 8)];	// L152, [0,2)
      float v104 = v103 * v1;	// L153, [2,6)
      v4[((v5 * 8) + 6)][(v6 * 8)] = v104;	// L154, [6,7)
      float v105 = v4[((v5 * 8) + 6)][((v6 * 8) + 1)];	// L155, [1,3)
      float v106 = v105 * v1;	// L156, [3,7)
      v4[((v5 * 8) + 6)][((v6 * 8) + 1)] = v106;	// L157, [7,8)
      float v107 = v4[((v5 * 8) + 6)][((v6 * 8) + 2)];	// L158, [2,4)
      float v108 = v107 * v1;	// L159, [4,8)
      v4[((v5 * 8) + 6)][((v6 * 8) + 2)] = v108;	// L160, [8,9)
      float v109 = v4[((v5 * 8) + 6)][((v6 * 8) + 3)];	// L161, [3,5)
      float v110 = v109 * v1;	// L162, [5,9)
      v4[((v5 * 8) + 6)][((v6 * 8) + 3)] = v110;	// L163, [9,10)
      float v111 = v4[((v5 * 8) + 6)][((v6 * 8) + 4)];	// L164, [4,6)
      float v112 = v111 * v1;	// L165, [6,10)
      v4[((v5 * 8) + 6)][((v6 * 8) + 4)] = v112;	// L166, [10,11)
      float v113 = v4[((v5 * 8) + 6)][((v6 * 8) + 5)];	// L167, [5,7)
      float v114 = v113 * v1;	// L168, [7,11)
      v4[((v5 * 8) + 6)][((v6 * 8) + 5)] = v114;	// L169, [11,12)
      float v115 = v4[((v5 * 8) + 6)][((v6 * 8) + 6)];	// L170, [6,8)
      float v116 = v115 * v1;	// L171, [8,12)
      v4[((v5 * 8) + 6)][((v6 * 8) + 6)] = v116;	// L172, [12,13)
      float v117 = v4[((v5 * 8) + 6)][((v6 * 8) + 7)];	// L173, [7,9)
      float v118 = v117 * v1;	// L174, [9,13)
      v4[((v5 * 8) + 6)][((v6 * 8) + 7)] = v118;	// L175, [13,14)
      float v119 = v4[((v5 * 8) + 7)][(v6 * 8)];	// L176, [0,2)
      float v120 = v119 * v1;	// L177, [2,6)
      v4[((v5 * 8) + 7)][(v6 * 8)] = v120;	// L178, [6,7)
      float v121 = v4[((v5 * 8) + 7)][((v6 * 8) + 1)];	// L179, [1,3)
      float v122 = v121 * v1;	// L180, [3,7)
      v4[((v5 * 8) + 7)][((v6 * 8) + 1)] = v122;	// L181, [7,8)
      float v123 = v4[((v5 * 8) + 7)][((v6 * 8) + 2)];	// L182, [2,4)
      float v124 = v123 * v1;	// L183, [4,8)
      v4[((v5 * 8) + 7)][((v6 * 8) + 2)] = v124;	// L184, [8,9)
      float v125 = v4[((v5 * 8) + 7)][((v6 * 8) + 3)];	// L185, [3,5)
      float v126 = v125 * v1;	// L186, [5,9)
      v4[((v5 * 8) + 7)][((v6 * 8) + 3)] = v126;	// L187, [9,10)
      float v127 = v4[((v5 * 8) + 7)][((v6 * 8) + 4)];	// L188, [4,6)
      float v128 = v127 * v1;	// L189, [6,10)
      v4[((v5 * 8) + 7)][((v6 * 8) + 4)] = v128;	// L190, [10,11)
      float v129 = v4[((v5 * 8) + 7)][((v6 * 8) + 5)];	// L191, [5,7)
      float v130 = v129 * v1;	// L192, [7,11)
      v4[((v5 * 8) + 7)][((v6 * 8) + 5)] = v130;	// L193, [11,12)
      float v131 = v4[((v5 * 8) + 7)][((v6 * 8) + 6)];	// L194, [6,8)
      float v132 = v131 * v1;	// L195, [8,12)
      v4[((v5 * 8) + 7)][((v6 * 8) + 6)] = v132;	// L196, [12,13)
      float v133 = v4[((v5 * 8) + 7)][((v6 * 8) + 7)];	// L197, [7,9)
      float v134 = v133 * v1;	// L198, [9,13)
      v4[((v5 * 8) + 7)][((v6 * 8) + 7)] = v134;	// L199, [13,14)
    }
  }
  for (int v135 = 0; v135 < 4096; v135 += 1) {	// L202, [2097160,4297064473), iterCycle=17, II=2
    for (int v136 = 0; v136 < 2048; v136 += 1) {	// L203, [0,1048593), iterCycle=17, II=2
      for (int v137 = 0; v137 < 256; v137 += 1) {	// L204, [0,529), iterCycle=17, II=2
        #pragma HLS pipeline II=1
        float v138 = v2[(v136 * 2)][v135];	// L205, [0,2)
        float v139 = v0 * v138;	// L206, [2,6)
        float v140 = v3[v135][(v137 * 16)];	// L207, [4,6)
        float v141 = v140 * v139;	// L208, [6,10)
        float v142 = v4[(v136 * 2)][(v137 * 16)];	// L209, [8,10)
        float v143 = v141 + v142;	// L210, [10,15)
        v4[(v136 * 2)][(v137 * 16)] = v143;	// L211, [15,16)
        float v144 = v3[v135][((v137 * 16) + 1)];	// L212, [4,6)
        float v145 = v144 * v139;	// L213, [6,10)
        float v146 = v4[(v136 * 2)][((v137 * 16) + 1)];	// L214, [8,10)
        float v147 = v145 + v146;	// L215, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 1)] = v147;	// L216, [15,16)
        float v148 = v3[v135][((v137 * 16) + 2)];	// L217, [4,6)
        float v149 = v148 * v139;	// L218, [6,10)
        float v150 = v4[(v136 * 2)][((v137 * 16) + 2)];	// L219, [8,10)
        float v151 = v149 + v150;	// L220, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 2)] = v151;	// L221, [15,16)
        float v152 = v3[v135][((v137 * 16) + 3)];	// L222, [4,6)
        float v153 = v152 * v139;	// L223, [6,10)
        float v154 = v4[(v136 * 2)][((v137 * 16) + 3)];	// L224, [8,10)
        float v155 = v153 + v154;	// L225, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 3)] = v155;	// L226, [15,16)
        float v156 = v3[v135][((v137 * 16) + 4)];	// L227, [4,6)
        float v157 = v156 * v139;	// L228, [6,10)
        float v158 = v4[(v136 * 2)][((v137 * 16) + 4)];	// L229, [8,10)
        float v159 = v157 + v158;	// L230, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 4)] = v159;	// L231, [15,16)
        float v160 = v3[v135][((v137 * 16) + 5)];	// L232, [4,6)
        float v161 = v160 * v139;	// L233, [6,10)
        float v162 = v4[(v136 * 2)][((v137 * 16) + 5)];	// L234, [8,10)
        float v163 = v161 + v162;	// L235, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 5)] = v163;	// L236, [15,16)
        float v164 = v3[v135][((v137 * 16) + 6)];	// L237, [4,6)
        float v165 = v164 * v139;	// L238, [6,10)
        float v166 = v4[(v136 * 2)][((v137 * 16) + 6)];	// L239, [8,10)
        float v167 = v165 + v166;	// L240, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 6)] = v167;	// L241, [15,16)
        float v168 = v3[v135][((v137 * 16) + 7)];	// L242, [4,6)
        float v169 = v168 * v139;	// L243, [6,10)
        float v170 = v4[(v136 * 2)][((v137 * 16) + 7)];	// L244, [8,10)
        float v171 = v169 + v170;	// L245, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 7)] = v171;	// L246, [15,16)
        float v172 = v3[v135][((v137 * 16) + 8)];	// L247, [4,6)
        float v173 = v172 * v139;	// L248, [6,10)
        float v174 = v4[(v136 * 2)][((v137 * 16) + 8)];	// L249, [8,10)
        float v175 = v173 + v174;	// L250, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 8)] = v175;	// L251, [15,16)
        float v176 = v3[v135][((v137 * 16) + 9)];	// L252, [4,6)
        float v177 = v176 * v139;	// L253, [6,10)
        float v178 = v4[(v136 * 2)][((v137 * 16) + 9)];	// L254, [8,10)
        float v179 = v177 + v178;	// L255, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 9)] = v179;	// L256, [15,16)
        float v180 = v3[v135][((v137 * 16) + 10)];	// L257, [4,6)
        float v181 = v180 * v139;	// L258, [6,10)
        float v182 = v4[(v136 * 2)][((v137 * 16) + 10)];	// L259, [8,10)
        float v183 = v181 + v182;	// L260, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 10)] = v183;	// L261, [15,16)
        float v184 = v3[v135][((v137 * 16) + 11)];	// L262, [4,6)
        float v185 = v184 * v139;	// L263, [6,10)
        float v186 = v4[(v136 * 2)][((v137 * 16) + 11)];	// L264, [8,10)
        float v187 = v185 + v186;	// L265, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 11)] = v187;	// L266, [15,16)
        float v188 = v3[v135][((v137 * 16) + 12)];	// L267, [4,6)
        float v189 = v188 * v139;	// L268, [6,10)
        float v190 = v4[(v136 * 2)][((v137 * 16) + 12)];	// L269, [8,10)
        float v191 = v189 + v190;	// L270, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 12)] = v191;	// L271, [15,16)
        float v192 = v3[v135][((v137 * 16) + 13)];	// L272, [4,6)
        float v193 = v192 * v139;	// L273, [6,10)
        float v194 = v4[(v136 * 2)][((v137 * 16) + 13)];	// L274, [8,10)
        float v195 = v193 + v194;	// L275, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 13)] = v195;	// L276, [15,16)
        float v196 = v3[v135][((v137 * 16) + 14)];	// L277, [4,6)
        float v197 = v196 * v139;	// L278, [6,10)
        float v198 = v4[(v136 * 2)][((v137 * 16) + 14)];	// L279, [8,10)
        float v199 = v197 + v198;	// L280, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 14)] = v199;	// L281, [15,16)
        float v200 = v3[v135][((v137 * 16) + 15)];	// L282, [4,6)
        float v201 = v200 * v139;	// L283, [6,10)
        float v202 = v4[(v136 * 2)][((v137 * 16) + 15)];	// L284, [8,10)
        float v203 = v201 + v202;	// L285, [10,15)
        v4[(v136 * 2)][((v137 * 16) + 15)] = v203;	// L286, [15,16)
        float v204 = v2[((v136 * 2) + 1)][v135];	// L287, [1,3)
        float v205 = v0 * v204;	// L288, [3,7)
        float v206 = v140 * v205;	// L289, [7,11)
        float v207 = v4[((v136 * 2) + 1)][(v137 * 16)];	// L290, [9,11)
        float v208 = v206 + v207;	// L291, [11,16)
        v4[((v136 * 2) + 1)][(v137 * 16)] = v208;	// L292, [16,17)
        float v209 = v144 * v205;	// L293, [7,11)
        float v210 = v4[((v136 * 2) + 1)][((v137 * 16) + 1)];	// L294, [9,11)
        float v211 = v209 + v210;	// L295, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 1)] = v211;	// L296, [16,17)
        float v212 = v148 * v205;	// L297, [7,11)
        float v213 = v4[((v136 * 2) + 1)][((v137 * 16) + 2)];	// L298, [9,11)
        float v214 = v212 + v213;	// L299, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 2)] = v214;	// L300, [16,17)
        float v215 = v152 * v205;	// L301, [7,11)
        float v216 = v4[((v136 * 2) + 1)][((v137 * 16) + 3)];	// L302, [9,11)
        float v217 = v215 + v216;	// L303, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 3)] = v217;	// L304, [16,17)
        float v218 = v156 * v205;	// L305, [7,11)
        float v219 = v4[((v136 * 2) + 1)][((v137 * 16) + 4)];	// L306, [9,11)
        float v220 = v218 + v219;	// L307, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 4)] = v220;	// L308, [16,17)
        float v221 = v160 * v205;	// L309, [7,11)
        float v222 = v4[((v136 * 2) + 1)][((v137 * 16) + 5)];	// L310, [9,11)
        float v223 = v221 + v222;	// L311, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 5)] = v223;	// L312, [16,17)
        float v224 = v164 * v205;	// L313, [7,11)
        float v225 = v4[((v136 * 2) + 1)][((v137 * 16) + 6)];	// L314, [9,11)
        float v226 = v224 + v225;	// L315, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 6)] = v226;	// L316, [16,17)
        float v227 = v168 * v205;	// L317, [7,11)
        float v228 = v4[((v136 * 2) + 1)][((v137 * 16) + 7)];	// L318, [9,11)
        float v229 = v227 + v228;	// L319, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 7)] = v229;	// L320, [16,17)
        float v230 = v172 * v205;	// L321, [7,11)
        float v231 = v4[((v136 * 2) + 1)][((v137 * 16) + 8)];	// L322, [9,11)
        float v232 = v230 + v231;	// L323, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 8)] = v232;	// L324, [16,17)
        float v233 = v176 * v205;	// L325, [7,11)
        float v234 = v4[((v136 * 2) + 1)][((v137 * 16) + 9)];	// L326, [9,11)
        float v235 = v233 + v234;	// L327, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 9)] = v235;	// L328, [16,17)
        float v236 = v180 * v205;	// L329, [7,11)
        float v237 = v4[((v136 * 2) + 1)][((v137 * 16) + 10)];	// L330, [9,11)
        float v238 = v236 + v237;	// L331, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 10)] = v238;	// L332, [16,17)
        float v239 = v184 * v205;	// L333, [7,11)
        float v240 = v4[((v136 * 2) + 1)][((v137 * 16) + 11)];	// L334, [9,11)
        float v241 = v239 + v240;	// L335, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 11)] = v241;	// L336, [16,17)
        float v242 = v188 * v205;	// L337, [7,11)
        float v243 = v4[((v136 * 2) + 1)][((v137 * 16) + 12)];	// L338, [9,11)
        float v244 = v242 + v243;	// L339, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 12)] = v244;	// L340, [16,17)
        float v245 = v192 * v205;	// L341, [7,11)
        float v246 = v4[((v136 * 2) + 1)][((v137 * 16) + 13)];	// L342, [9,11)
        float v247 = v245 + v246;	// L343, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 13)] = v247;	// L344, [16,17)
        float v248 = v196 * v205;	// L345, [7,11)
        float v249 = v4[((v136 * 2) + 1)][((v137 * 16) + 14)];	// L346, [9,11)
        float v250 = v248 + v249;	// L347, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 14)] = v250;	// L348, [16,17)
        float v251 = v200 * v205;	// L349, [7,11)
        float v252 = v4[((v136 * 2) + 1)][((v137 * 16) + 15)];	// L350, [9,11)
        float v253 = v251 + v252;	// L351, [11,16)
        v4[((v136 * 2) + 1)][((v137 * 16) + 15)] = v253;	// L352, [16,17)
      }
    }
  }
}

