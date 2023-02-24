
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
/// Latency=33521733, interval=33521733
/// DSP=12, BRAM=0
void blur(
  float v0,
  float v1[4096][4096][3],
  float v2[4096][4096][3],
  float v3[4096][4096][3]
) {	// L5, [0,33521733)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3

  #pragma HLS array_partition variable=v1 cyclic factor=4 dim=1
  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=2
  #pragma HLS array_partition variable=v1 cyclic factor=3 dim=3
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=2
  #pragma HLS array_partition variable=v2 cyclic factor=3 dim=3
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v3 cyclic factor=4 dim=2
  #pragma HLS array_partition variable=v3 cyclic factor=3 dim=3
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  for (int v4 = 0; v4 < 2047; v4 += 1) {	// L6, [0,16760866), iterCycle=32, II=4
    for (int v5 = 0; v5 < 2047; v5 += 1) {	// L7, [16760865,16769083), iterCycle=32, II=4
      #pragma HLS pipeline II=1
      float v6 = v3[(v4 * 2)][(v5 * 2)][0];	// L8, [0,2)
      float v7 = v3[(v4 * 2)][((v5 * 2) + 1)][0];	// L9, [1,3)
      float v8 = v6 + v7;	// L10, [4,9)
      float v9 = v3[(v4 * 2)][((v5 * 2) + 2)][0];	// L11, [2,4)
      float v10 = v9 + v8;	// L12, [9,14)
      float v11 = v10 / v0;	// L13, [14,30)
      v1[(v4 * 2)][(v5 * 2)][0] = v11;	// L14, [30,31)
      float v12 = v7 + v9;	// L15, [4,9)
      float v13 = v3[(v4 * 2)][((v5 * 2) + 3)][0];	// L16, [7,9)
      float v14 = v13 + v12;	// L17, [9,14)
      float v15 = v14 / v0;	// L18, [14,30)
      v1[(v4 * 2)][((v5 * 2) + 1)][0] = v15;	// L19, [30,31)
      float v16 = v3[((v4 * 2) + 1)][(v5 * 2)][0];	// L20, [1,3)
      float v17 = v3[((v4 * 2) + 1)][((v5 * 2) + 1)][0];	// L21, [2,4)
      float v18 = v16 + v17;	// L22, [5,10)
      float v19 = v3[((v4 * 2) + 1)][((v5 * 2) + 2)][0];	// L23, [3,5)
      float v20 = v19 + v18;	// L24, [10,15)
      float v21 = v20 / v0;	// L25, [15,31)
      v1[((v4 * 2) + 1)][(v5 * 2)][0] = v21;	// L26, [31,32)
      float v22 = v17 + v19;	// L27, [5,10)
      float v23 = v3[((v4 * 2) + 1)][((v5 * 2) + 3)][0];	// L28, [8,10)
      float v24 = v23 + v22;	// L29, [10,15)
      float v25 = v24 / v0;	// L30, [15,31)
      v1[((v4 * 2) + 1)][((v5 * 2) + 1)][0] = v25;	// L31, [31,32)
      float v26 = v3[(v4 * 2)][(v5 * 2)][1];	// L32, [0,2)
      float v27 = v3[(v4 * 2)][((v5 * 2) + 1)][1];	// L33, [1,3)
      float v28 = v26 + v27;	// L34, [4,9)
      float v29 = v3[(v4 * 2)][((v5 * 2) + 2)][1];	// L35, [2,4)
      float v30 = v29 + v28;	// L36, [9,14)
      float v31 = v30 / v0;	// L37, [14,30)
      v1[(v4 * 2)][(v5 * 2)][1] = v31;	// L38, [30,31)
      float v32 = v27 + v29;	// L39, [4,9)
      float v33 = v3[(v4 * 2)][((v5 * 2) + 3)][1];	// L40, [7,9)
      float v34 = v33 + v32;	// L41, [9,14)
      float v35 = v34 / v0;	// L42, [14,30)
      v1[(v4 * 2)][((v5 * 2) + 1)][1] = v35;	// L43, [30,31)
      float v36 = v3[((v4 * 2) + 1)][(v5 * 2)][1];	// L44, [1,3)
      float v37 = v3[((v4 * 2) + 1)][((v5 * 2) + 1)][1];	// L45, [2,4)
      float v38 = v36 + v37;	// L46, [5,10)
      float v39 = v3[((v4 * 2) + 1)][((v5 * 2) + 2)][1];	// L47, [3,5)
      float v40 = v39 + v38;	// L48, [10,15)
      float v41 = v40 / v0;	// L49, [15,31)
      v1[((v4 * 2) + 1)][(v5 * 2)][1] = v41;	// L50, [31,32)
      float v42 = v37 + v39;	// L51, [5,10)
      float v43 = v3[((v4 * 2) + 1)][((v5 * 2) + 3)][1];	// L52, [8,10)
      float v44 = v43 + v42;	// L53, [10,15)
      float v45 = v44 / v0;	// L54, [15,31)
      v1[((v4 * 2) + 1)][((v5 * 2) + 1)][1] = v45;	// L55, [31,32)
      float v46 = v3[(v4 * 2)][(v5 * 2)][2];	// L56, [0,2)
      float v47 = v3[(v4 * 2)][((v5 * 2) + 1)][2];	// L57, [1,3)
      float v48 = v46 + v47;	// L58, [4,9)
      float v49 = v3[(v4 * 2)][((v5 * 2) + 2)][2];	// L59, [2,4)
      float v50 = v49 + v48;	// L60, [9,14)
      float v51 = v50 / v0;	// L61, [14,30)
      v1[(v4 * 2)][(v5 * 2)][2] = v51;	// L62, [30,31)
      float v52 = v47 + v49;	// L63, [4,9)
      float v53 = v3[(v4 * 2)][((v5 * 2) + 3)][2];	// L64, [7,9)
      float v54 = v53 + v52;	// L65, [9,14)
      float v55 = v54 / v0;	// L66, [14,30)
      v1[(v4 * 2)][((v5 * 2) + 1)][2] = v55;	// L67, [30,31)
      float v56 = v3[((v4 * 2) + 1)][(v5 * 2)][2];	// L68, [1,3)
      float v57 = v3[((v4 * 2) + 1)][((v5 * 2) + 1)][2];	// L69, [2,4)
      float v58 = v56 + v57;	// L70, [5,10)
      float v59 = v3[((v4 * 2) + 1)][((v5 * 2) + 2)][2];	// L71, [3,5)
      float v60 = v59 + v58;	// L72, [10,15)
      float v61 = v60 / v0;	// L73, [15,31)
      v1[((v4 * 2) + 1)][(v5 * 2)][2] = v61;	// L74, [31,32)
      float v62 = v57 + v59;	// L75, [5,10)
      float v63 = v3[((v4 * 2) + 1)][((v5 * 2) + 3)][2];	// L76, [8,10)
      float v64 = v63 + v62;	// L77, [10,15)
      float v65 = v64 / v0;	// L78, [15,31)
      v1[((v4 * 2) + 1)][((v5 * 2) + 1)][2] = v65;	// L79, [31,32)
    }
  }
  for (int v66 = 0; v66 < 2047; v66 += 1) {	// L82, [16760866,33521731), iterCycle=31, II=4
    for (int v67 = 0; v67 < 2047; v67 += 1) {	// L83, [0,8217), iterCycle=31, II=4
      #pragma HLS pipeline II=1
      float v68 = v1[(v66 * 2)][(v67 * 2)][0];	// L84, [0,2)
      float v69 = v1[((v66 * 2) + 1)][(v67 * 2)][0];	// L85, [1,3)
      float v70 = v68 + v69;	// L86, [4,9)
      float v71 = v1[((v66 * 2) + 2)][(v67 * 2)][0];	// L87, [2,4)
      float v72 = v71 + v70;	// L88, [9,14)
      float v73 = v72 / v0;	// L89, [14,30)
      v2[(v66 * 2)][(v67 * 2)][0] = v73;	// L90, [30,31)
      float v74 = v1[(v66 * 2)][((v67 * 2) + 1)][0];	// L91, [0,2)
      float v75 = v1[((v66 * 2) + 1)][((v67 * 2) + 1)][0];	// L92, [1,3)
      float v76 = v74 + v75;	// L93, [4,9)
      float v77 = v1[((v66 * 2) + 2)][((v67 * 2) + 1)][0];	// L94, [2,4)
      float v78 = v77 + v76;	// L95, [9,14)
      float v79 = v78 / v0;	// L96, [14,30)
      v2[(v66 * 2)][((v67 * 2) + 1)][0] = v79;	// L97, [30,31)
      float v80 = v69 + v71;	// L98, [4,9)
      float v81 = v1[((v66 * 2) + 3)][(v67 * 2)][0];	// L99, [7,9)
      float v82 = v81 + v80;	// L100, [9,14)
      float v83 = v82 / v0;	// L101, [14,30)
      v2[((v66 * 2) + 1)][(v67 * 2)][0] = v83;	// L102, [30,31)
      float v84 = v75 + v77;	// L103, [4,9)
      float v85 = v1[((v66 * 2) + 3)][((v67 * 2) + 1)][0];	// L104, [7,9)
      float v86 = v85 + v84;	// L105, [9,14)
      float v87 = v86 / v0;	// L106, [14,30)
      v2[((v66 * 2) + 1)][((v67 * 2) + 1)][0] = v87;	// L107, [30,31)
      float v88 = v1[(v66 * 2)][(v67 * 2)][1];	// L108, [0,2)
      float v89 = v1[((v66 * 2) + 1)][(v67 * 2)][1];	// L109, [1,3)
      float v90 = v88 + v89;	// L110, [4,9)
      float v91 = v1[((v66 * 2) + 2)][(v67 * 2)][1];	// L111, [2,4)
      float v92 = v91 + v90;	// L112, [9,14)
      float v93 = v92 / v0;	// L113, [14,30)
      v2[(v66 * 2)][(v67 * 2)][1] = v93;	// L114, [30,31)
      float v94 = v1[(v66 * 2)][((v67 * 2) + 1)][1];	// L115, [0,2)
      float v95 = v1[((v66 * 2) + 1)][((v67 * 2) + 1)][1];	// L116, [1,3)
      float v96 = v94 + v95;	// L117, [4,9)
      float v97 = v1[((v66 * 2) + 2)][((v67 * 2) + 1)][1];	// L118, [2,4)
      float v98 = v97 + v96;	// L119, [9,14)
      float v99 = v98 / v0;	// L120, [14,30)
      v2[(v66 * 2)][((v67 * 2) + 1)][1] = v99;	// L121, [30,31)
      float v100 = v89 + v91;	// L122, [4,9)
      float v101 = v1[((v66 * 2) + 3)][(v67 * 2)][1];	// L123, [7,9)
      float v102 = v101 + v100;	// L124, [9,14)
      float v103 = v102 / v0;	// L125, [14,30)
      v2[((v66 * 2) + 1)][(v67 * 2)][1] = v103;	// L126, [30,31)
      float v104 = v95 + v97;	// L127, [4,9)
      float v105 = v1[((v66 * 2) + 3)][((v67 * 2) + 1)][1];	// L128, [7,9)
      float v106 = v105 + v104;	// L129, [9,14)
      float v107 = v106 / v0;	// L130, [14,30)
      v2[((v66 * 2) + 1)][((v67 * 2) + 1)][1] = v107;	// L131, [30,31)
      float v108 = v1[(v66 * 2)][(v67 * 2)][2];	// L132, [0,2)
      float v109 = v1[((v66 * 2) + 1)][(v67 * 2)][2];	// L133, [1,3)
      float v110 = v108 + v109;	// L134, [4,9)
      float v111 = v1[((v66 * 2) + 2)][(v67 * 2)][2];	// L135, [2,4)
      float v112 = v111 + v110;	// L136, [9,14)
      float v113 = v112 / v0;	// L137, [14,30)
      v2[(v66 * 2)][(v67 * 2)][2] = v113;	// L138, [30,31)
      float v114 = v1[(v66 * 2)][((v67 * 2) + 1)][2];	// L139, [0,2)
      float v115 = v1[((v66 * 2) + 1)][((v67 * 2) + 1)][2];	// L140, [1,3)
      float v116 = v114 + v115;	// L141, [4,9)
      float v117 = v1[((v66 * 2) + 2)][((v67 * 2) + 1)][2];	// L142, [2,4)
      float v118 = v117 + v116;	// L143, [9,14)
      float v119 = v118 / v0;	// L144, [14,30)
      v2[(v66 * 2)][((v67 * 2) + 1)][2] = v119;	// L145, [30,31)
      float v120 = v109 + v111;	// L146, [4,9)
      float v121 = v1[((v66 * 2) + 3)][(v67 * 2)][2];	// L147, [7,9)
      float v122 = v121 + v120;	// L148, [9,14)
      float v123 = v122 / v0;	// L149, [14,30)
      v2[((v66 * 2) + 1)][(v67 * 2)][2] = v123;	// L150, [30,31)
      float v124 = v115 + v117;	// L151, [4,9)
      float v125 = v1[((v66 * 2) + 3)][((v67 * 2) + 1)][2];	// L152, [7,9)
      float v126 = v125 + v124;	// L153, [9,14)
      float v127 = v126 / v0;	// L154, [14,30)
      v2[((v66 * 2) + 1)][((v67 * 2) + 1)][2] = v127;	// L155, [30,31)
    }
  }
}

