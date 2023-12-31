
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
/// Latency=79884097, interval=79884097
/// DSP=45, BRAM=0
void gaussian(
  float v0,
  float v1[4096][4096][3],
  float v2[7],
  float v3[7],
  float v4[4096][4096][3],
  float v5[4096][4096][3]
) {	// L4, [0,79884097)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS array_partition variable=v1 cyclic factor=3 dim=1
  #pragma HLS array_partition variable=v1 cyclic factor=3 dim=2
  #pragma HLS array_partition variable=v1 cyclic factor=3 dim=3
  #pragma HLS resource variable=v1 core=ram_s2p_bram
  #pragma HLS resource variable=v2 core=ram_s2p_bram
  #pragma HLS resource variable=v3 core=ram_s2p_bram
  #pragma HLS array_partition variable=v4 cyclic factor=3 dim=1
  #pragma HLS array_partition variable=v4 cyclic factor=3 dim=2
  #pragma HLS array_partition variable=v4 cyclic factor=3 dim=3
  #pragma HLS resource variable=v4 core=ram_s2p_bram
  #pragma HLS array_partition variable=v5 cyclic factor=3 dim=1
  #pragma HLS array_partition variable=v5 cyclic factor=3 dim=2
  #pragma HLS array_partition variable=v5 cyclic factor=3 dim=3
  #pragma HLS resource variable=v5 core=ram_s2p_bram
  for (int v6 = 0; v6 < 1363; v6 += 1) {	// L5, [0,1857771), iterCycle=1, II=1
    for (int v7 = 0; v7 < 1363; v7 += 1) {	// L6, [78026324,78027689), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v5[(v6 * 3)][(v7 * 3)][0] = v0;	// L7, [0,1)
      v1[(v6 * 3)][(v7 * 3)][0] = v0;	// L8, [0,1)
      v5[(v6 * 3)][((v7 * 3) + 1)][0] = v0;	// L9, [0,1)
      v1[(v6 * 3)][((v7 * 3) + 1)][0] = v0;	// L10, [0,1)
      v5[(v6 * 3)][((v7 * 3) + 2)][0] = v0;	// L11, [0,1)
      v1[(v6 * 3)][((v7 * 3) + 2)][0] = v0;	// L12, [0,1)
      v5[((v6 * 3) + 1)][(v7 * 3)][0] = v0;	// L13, [0,1)
      v1[((v6 * 3) + 1)][(v7 * 3)][0] = v0;	// L14, [0,1)
      v5[((v6 * 3) + 1)][((v7 * 3) + 1)][0] = v0;	// L15, [0,1)
      v1[((v6 * 3) + 1)][((v7 * 3) + 1)][0] = v0;	// L16, [0,1)
      v5[((v6 * 3) + 1)][((v7 * 3) + 2)][0] = v0;	// L17, [0,1)
      v1[((v6 * 3) + 1)][((v7 * 3) + 2)][0] = v0;	// L18, [0,1)
      v5[((v6 * 3) + 2)][(v7 * 3)][0] = v0;	// L19, [0,1)
      v1[((v6 * 3) + 2)][(v7 * 3)][0] = v0;	// L20, [0,1)
      v5[((v6 * 3) + 2)][((v7 * 3) + 1)][0] = v0;	// L21, [0,1)
      v1[((v6 * 3) + 2)][((v7 * 3) + 1)][0] = v0;	// L22, [0,1)
      v5[((v6 * 3) + 2)][((v7 * 3) + 2)][0] = v0;	// L23, [0,1)
      v1[((v6 * 3) + 2)][((v7 * 3) + 2)][0] = v0;	// L24, [0,1)
      v5[(v6 * 3)][(v7 * 3)][1] = v0;	// L25, [0,1)
      v1[(v6 * 3)][(v7 * 3)][1] = v0;	// L26, [0,1)
      v5[(v6 * 3)][((v7 * 3) + 1)][1] = v0;	// L27, [0,1)
      v1[(v6 * 3)][((v7 * 3) + 1)][1] = v0;	// L28, [0,1)
      v5[(v6 * 3)][((v7 * 3) + 2)][1] = v0;	// L29, [0,1)
      v1[(v6 * 3)][((v7 * 3) + 2)][1] = v0;	// L30, [0,1)
      v5[((v6 * 3) + 1)][(v7 * 3)][1] = v0;	// L31, [0,1)
      v1[((v6 * 3) + 1)][(v7 * 3)][1] = v0;	// L32, [0,1)
      v5[((v6 * 3) + 1)][((v7 * 3) + 1)][1] = v0;	// L33, [0,1)
      v1[((v6 * 3) + 1)][((v7 * 3) + 1)][1] = v0;	// L34, [0,1)
      v5[((v6 * 3) + 1)][((v7 * 3) + 2)][1] = v0;	// L35, [0,1)
      v1[((v6 * 3) + 1)][((v7 * 3) + 2)][1] = v0;	// L36, [0,1)
      v5[((v6 * 3) + 2)][(v7 * 3)][1] = v0;	// L37, [0,1)
      v1[((v6 * 3) + 2)][(v7 * 3)][1] = v0;	// L38, [0,1)
      v5[((v6 * 3) + 2)][((v7 * 3) + 1)][1] = v0;	// L39, [0,1)
      v1[((v6 * 3) + 2)][((v7 * 3) + 1)][1] = v0;	// L40, [0,1)
      v5[((v6 * 3) + 2)][((v7 * 3) + 2)][1] = v0;	// L41, [0,1)
      v1[((v6 * 3) + 2)][((v7 * 3) + 2)][1] = v0;	// L42, [0,1)
      v5[(v6 * 3)][(v7 * 3)][2] = v0;	// L43, [0,1)
      v1[(v6 * 3)][(v7 * 3)][2] = v0;	// L44, [0,1)
      v5[(v6 * 3)][((v7 * 3) + 1)][2] = v0;	// L45, [0,1)
      v1[(v6 * 3)][((v7 * 3) + 1)][2] = v0;	// L46, [0,1)
      v5[(v6 * 3)][((v7 * 3) + 2)][2] = v0;	// L47, [0,1)
      v1[(v6 * 3)][((v7 * 3) + 2)][2] = v0;	// L48, [0,1)
      v5[((v6 * 3) + 1)][(v7 * 3)][2] = v0;	// L49, [0,1)
      v1[((v6 * 3) + 1)][(v7 * 3)][2] = v0;	// L50, [0,1)
      v5[((v6 * 3) + 1)][((v7 * 3) + 1)][2] = v0;	// L51, [0,1)
      v1[((v6 * 3) + 1)][((v7 * 3) + 1)][2] = v0;	// L52, [0,1)
      v5[((v6 * 3) + 1)][((v7 * 3) + 2)][2] = v0;	// L53, [0,1)
      v1[((v6 * 3) + 1)][((v7 * 3) + 2)][2] = v0;	// L54, [0,1)
      v5[((v6 * 3) + 2)][(v7 * 3)][2] = v0;	// L55, [0,1)
      v1[((v6 * 3) + 2)][(v7 * 3)][2] = v0;	// L56, [0,1)
      v5[((v6 * 3) + 2)][((v7 * 3) + 1)][2] = v0;	// L57, [0,1)
      v1[((v6 * 3) + 2)][((v7 * 3) + 1)][2] = v0;	// L58, [0,1)
      v5[((v6 * 3) + 2)][((v7 * 3) + 2)][2] = v0;	// L59, [0,1)
      v1[((v6 * 3) + 2)][((v7 * 3) + 2)][2] = v0;	// L60, [0,1)
    }
  }
  for (int v8 = 0; v8 < 7; v8 += 1) {	// L63, [1857771,40870933), iterCycle=14, II=3
    for (int v9 = 0; v9 < 1363; v9 += 1) {	// L64, [39013162,44586482), iterCycle=14, II=3
      for (int v10 = 0; v10 < 1363; v10 += 1) {	// L65, [39013162,39017264), iterCycle=14, II=3
        #pragma HLS pipeline II=1
        float v11 = v4[((v9 * 3) + v8)][(v10 * 3)][0];	// L66, [0,2)
        float v12 = v2[v8];	// L67, [2,4)
        float v13 = v11 * v12;	// L68, [4,8)
        float v14 = v5[(v9 * 3)][(v10 * 3)][0];	// L69, [6,8)
        float v15 = v13 + v14;	// L70, [8,13)
        v5[(v9 * 3)][(v10 * 3)][0] = v15;	// L71, [13,14)
        float v16 = v4[((v9 * 3) + v8)][((v10 * 3) + 1)][0];	// L72, [0,2)
        float v17 = v16 * v12;	// L73, [4,8)
        float v18 = v5[(v9 * 3)][((v10 * 3) + 1)][0];	// L74, [6,8)
        float v19 = v17 + v18;	// L75, [8,13)
        v5[(v9 * 3)][((v10 * 3) + 1)][0] = v19;	// L76, [13,14)
        float v20 = v4[((v9 * 3) + v8)][((v10 * 3) + 2)][0];	// L77, [0,2)
        float v21 = v20 * v12;	// L78, [4,8)
        float v22 = v5[(v9 * 3)][((v10 * 3) + 2)][0];	// L79, [6,8)
        float v23 = v21 + v22;	// L80, [8,13)
        v5[(v9 * 3)][((v10 * 3) + 2)][0] = v23;	// L81, [13,14)
        float v24 = v4[(((v9 * 3) + v8) + 1)][(v10 * 3)][0];	// L82, [1,3)
        float v25 = v24 * v12;	// L83, [4,8)
        float v26 = v5[((v9 * 3) + 1)][(v10 * 3)][0];	// L84, [6,8)
        float v27 = v25 + v26;	// L85, [8,13)
        v5[((v9 * 3) + 1)][(v10 * 3)][0] = v27;	// L86, [13,14)
        float v28 = v4[(((v9 * 3) + v8) + 1)][((v10 * 3) + 1)][0];	// L87, [1,3)
        float v29 = v28 * v12;	// L88, [4,8)
        float v30 = v5[((v9 * 3) + 1)][((v10 * 3) + 1)][0];	// L89, [6,8)
        float v31 = v29 + v30;	// L90, [8,13)
        v5[((v9 * 3) + 1)][((v10 * 3) + 1)][0] = v31;	// L91, [13,14)
        float v32 = v4[(((v9 * 3) + v8) + 1)][((v10 * 3) + 2)][0];	// L92, [1,3)
        float v33 = v32 * v12;	// L93, [4,8)
        float v34 = v5[((v9 * 3) + 1)][((v10 * 3) + 2)][0];	// L94, [6,8)
        float v35 = v33 + v34;	// L95, [8,13)
        v5[((v9 * 3) + 1)][((v10 * 3) + 2)][0] = v35;	// L96, [13,14)
        float v36 = v4[(((v9 * 3) + v8) + 2)][(v10 * 3)][0];	// L97, [2,4)
        float v37 = v36 * v12;	// L98, [4,8)
        float v38 = v5[((v9 * 3) + 2)][(v10 * 3)][0];	// L99, [6,8)
        float v39 = v37 + v38;	// L100, [8,13)
        v5[((v9 * 3) + 2)][(v10 * 3)][0] = v39;	// L101, [13,14)
        float v40 = v4[(((v9 * 3) + v8) + 2)][((v10 * 3) + 1)][0];	// L102, [2,4)
        float v41 = v40 * v12;	// L103, [4,8)
        float v42 = v5[((v9 * 3) + 2)][((v10 * 3) + 1)][0];	// L104, [6,8)
        float v43 = v41 + v42;	// L105, [8,13)
        v5[((v9 * 3) + 2)][((v10 * 3) + 1)][0] = v43;	// L106, [13,14)
        float v44 = v4[(((v9 * 3) + v8) + 2)][((v10 * 3) + 2)][0];	// L107, [2,4)
        float v45 = v44 * v12;	// L108, [4,8)
        float v46 = v5[((v9 * 3) + 2)][((v10 * 3) + 2)][0];	// L109, [6,8)
        float v47 = v45 + v46;	// L110, [8,13)
        v5[((v9 * 3) + 2)][((v10 * 3) + 2)][0] = v47;	// L111, [13,14)
        float v48 = v4[((v9 * 3) + v8)][(v10 * 3)][1];	// L112, [0,2)
        float v49 = v48 * v12;	// L113, [4,8)
        float v50 = v5[(v9 * 3)][(v10 * 3)][1];	// L114, [6,8)
        float v51 = v49 + v50;	// L115, [8,13)
        v5[(v9 * 3)][(v10 * 3)][1] = v51;	// L116, [13,14)
        float v52 = v4[((v9 * 3) + v8)][((v10 * 3) + 1)][1];	// L117, [0,2)
        float v53 = v52 * v12;	// L118, [4,8)
        float v54 = v5[(v9 * 3)][((v10 * 3) + 1)][1];	// L119, [6,8)
        float v55 = v53 + v54;	// L120, [8,13)
        v5[(v9 * 3)][((v10 * 3) + 1)][1] = v55;	// L121, [13,14)
        float v56 = v4[((v9 * 3) + v8)][((v10 * 3) + 2)][1];	// L122, [0,2)
        float v57 = v56 * v12;	// L123, [4,8)
        float v58 = v5[(v9 * 3)][((v10 * 3) + 2)][1];	// L124, [6,8)
        float v59 = v57 + v58;	// L125, [8,13)
        v5[(v9 * 3)][((v10 * 3) + 2)][1] = v59;	// L126, [13,14)
        float v60 = v4[(((v9 * 3) + v8) + 1)][(v10 * 3)][1];	// L127, [1,3)
        float v61 = v60 * v12;	// L128, [4,8)
        float v62 = v5[((v9 * 3) + 1)][(v10 * 3)][1];	// L129, [6,8)
        float v63 = v61 + v62;	// L130, [8,13)
        v5[((v9 * 3) + 1)][(v10 * 3)][1] = v63;	// L131, [13,14)
        float v64 = v4[(((v9 * 3) + v8) + 1)][((v10 * 3) + 1)][1];	// L132, [1,3)
        float v65 = v64 * v12;	// L133, [4,8)
        float v66 = v5[((v9 * 3) + 1)][((v10 * 3) + 1)][1];	// L134, [6,8)
        float v67 = v65 + v66;	// L135, [8,13)
        v5[((v9 * 3) + 1)][((v10 * 3) + 1)][1] = v67;	// L136, [13,14)
        float v68 = v4[(((v9 * 3) + v8) + 1)][((v10 * 3) + 2)][1];	// L137, [1,3)
        float v69 = v68 * v12;	// L138, [4,8)
        float v70 = v5[((v9 * 3) + 1)][((v10 * 3) + 2)][1];	// L139, [6,8)
        float v71 = v69 + v70;	// L140, [8,13)
        v5[((v9 * 3) + 1)][((v10 * 3) + 2)][1] = v71;	// L141, [13,14)
        float v72 = v4[(((v9 * 3) + v8) + 2)][(v10 * 3)][1];	// L142, [2,4)
        float v73 = v72 * v12;	// L143, [4,8)
        float v74 = v5[((v9 * 3) + 2)][(v10 * 3)][1];	// L144, [6,8)
        float v75 = v73 + v74;	// L145, [8,13)
        v5[((v9 * 3) + 2)][(v10 * 3)][1] = v75;	// L146, [13,14)
        float v76 = v4[(((v9 * 3) + v8) + 2)][((v10 * 3) + 1)][1];	// L147, [2,4)
        float v77 = v76 * v12;	// L148, [4,8)
        float v78 = v5[((v9 * 3) + 2)][((v10 * 3) + 1)][1];	// L149, [6,8)
        float v79 = v77 + v78;	// L150, [8,13)
        v5[((v9 * 3) + 2)][((v10 * 3) + 1)][1] = v79;	// L151, [13,14)
        float v80 = v4[(((v9 * 3) + v8) + 2)][((v10 * 3) + 2)][1];	// L152, [2,4)
        float v81 = v80 * v12;	// L153, [4,8)
        float v82 = v5[((v9 * 3) + 2)][((v10 * 3) + 2)][1];	// L154, [6,8)
        float v83 = v81 + v82;	// L155, [8,13)
        v5[((v9 * 3) + 2)][((v10 * 3) + 2)][1] = v83;	// L156, [13,14)
        float v84 = v4[((v9 * 3) + v8)][(v10 * 3)][2];	// L157, [0,2)
        float v85 = v84 * v12;	// L158, [4,8)
        float v86 = v5[(v9 * 3)][(v10 * 3)][2];	// L159, [6,8)
        float v87 = v85 + v86;	// L160, [8,13)
        v5[(v9 * 3)][(v10 * 3)][2] = v87;	// L161, [13,14)
        float v88 = v4[((v9 * 3) + v8)][((v10 * 3) + 1)][2];	// L162, [0,2)
        float v89 = v88 * v12;	// L163, [4,8)
        float v90 = v5[(v9 * 3)][((v10 * 3) + 1)][2];	// L164, [6,8)
        float v91 = v89 + v90;	// L165, [8,13)
        v5[(v9 * 3)][((v10 * 3) + 1)][2] = v91;	// L166, [13,14)
        float v92 = v4[((v9 * 3) + v8)][((v10 * 3) + 2)][2];	// L167, [0,2)
        float v93 = v92 * v12;	// L168, [4,8)
        float v94 = v5[(v9 * 3)][((v10 * 3) + 2)][2];	// L169, [6,8)
        float v95 = v93 + v94;	// L170, [8,13)
        v5[(v9 * 3)][((v10 * 3) + 2)][2] = v95;	// L171, [13,14)
        float v96 = v4[(((v9 * 3) + v8) + 1)][(v10 * 3)][2];	// L172, [1,3)
        float v97 = v96 * v12;	// L173, [4,8)
        float v98 = v5[((v9 * 3) + 1)][(v10 * 3)][2];	// L174, [6,8)
        float v99 = v97 + v98;	// L175, [8,13)
        v5[((v9 * 3) + 1)][(v10 * 3)][2] = v99;	// L176, [13,14)
        float v100 = v4[(((v9 * 3) + v8) + 1)][((v10 * 3) + 1)][2];	// L177, [1,3)
        float v101 = v100 * v12;	// L178, [4,8)
        float v102 = v5[((v9 * 3) + 1)][((v10 * 3) + 1)][2];	// L179, [6,8)
        float v103 = v101 + v102;	// L180, [8,13)
        v5[((v9 * 3) + 1)][((v10 * 3) + 1)][2] = v103;	// L181, [13,14)
        float v104 = v4[(((v9 * 3) + v8) + 1)][((v10 * 3) + 2)][2];	// L182, [1,3)
        float v105 = v104 * v12;	// L183, [4,8)
        float v106 = v5[((v9 * 3) + 1)][((v10 * 3) + 2)][2];	// L184, [6,8)
        float v107 = v105 + v106;	// L185, [8,13)
        v5[((v9 * 3) + 1)][((v10 * 3) + 2)][2] = v107;	// L186, [13,14)
        float v108 = v4[(((v9 * 3) + v8) + 2)][(v10 * 3)][2];	// L187, [2,4)
        float v109 = v108 * v12;	// L188, [4,8)
        float v110 = v5[((v9 * 3) + 2)][(v10 * 3)][2];	// L189, [6,8)
        float v111 = v109 + v110;	// L190, [8,13)
        v5[((v9 * 3) + 2)][(v10 * 3)][2] = v111;	// L191, [13,14)
        float v112 = v4[(((v9 * 3) + v8) + 2)][((v10 * 3) + 1)][2];	// L192, [2,4)
        float v113 = v112 * v12;	// L193, [4,8)
        float v114 = v5[((v9 * 3) + 2)][((v10 * 3) + 1)][2];	// L194, [6,8)
        float v115 = v113 + v114;	// L195, [8,13)
        v5[((v9 * 3) + 2)][((v10 * 3) + 1)][2] = v115;	// L196, [13,14)
        float v116 = v4[(((v9 * 3) + v8) + 2)][((v10 * 3) + 2)][2];	// L197, [2,4)
        float v117 = v116 * v12;	// L198, [4,8)
        float v118 = v5[((v9 * 3) + 2)][((v10 * 3) + 2)][2];	// L199, [6,8)
        float v119 = v117 + v118;	// L200, [8,13)
        v5[((v9 * 3) + 2)][((v10 * 3) + 2)][2] = v119;	// L201, [13,14)
      }
    }
  }
  for (int v120 = 0; v120 < 7; v120 += 1) {	// L205, [40870933,79884095), iterCycle=14, II=3
    for (int v121 = 0; v121 < 1363; v121 += 1) {	// L206, [0,5573320), iterCycle=14, II=3
      for (int v122 = 0; v122 < 1363; v122 += 1) {	// L207, [0,4102), iterCycle=14, II=3
        #pragma HLS pipeline II=1
        float v123 = v5[(v121 * 3)][((v122 * 3) + v120)][0];	// L208, [0,2)
        float v124 = v3[v120];	// L209, [2,4)
        float v125 = v123 * v124;	// L210, [4,8)
        float v126 = v1[(v121 * 3)][(v122 * 3)][0];	// L211, [6,8)
        float v127 = v125 + v126;	// L212, [8,13)
        v1[(v121 * 3)][(v122 * 3)][0] = v127;	// L213, [13,14)
        float v128 = v5[(v121 * 3)][(((v122 * 3) + v120) + 1)][0];	// L214, [1,3)
        float v129 = v128 * v124;	// L215, [4,8)
        float v130 = v1[(v121 * 3)][((v122 * 3) + 1)][0];	// L216, [6,8)
        float v131 = v129 + v130;	// L217, [8,13)
        v1[(v121 * 3)][((v122 * 3) + 1)][0] = v131;	// L218, [13,14)
        float v132 = v5[(v121 * 3)][(((v122 * 3) + v120) + 2)][0];	// L219, [2,4)
        float v133 = v132 * v124;	// L220, [4,8)
        float v134 = v1[(v121 * 3)][((v122 * 3) + 2)][0];	// L221, [6,8)
        float v135 = v133 + v134;	// L222, [8,13)
        v1[(v121 * 3)][((v122 * 3) + 2)][0] = v135;	// L223, [13,14)
        float v136 = v5[((v121 * 3) + 1)][((v122 * 3) + v120)][0];	// L224, [0,2)
        float v137 = v136 * v124;	// L225, [4,8)
        float v138 = v1[((v121 * 3) + 1)][(v122 * 3)][0];	// L226, [6,8)
        float v139 = v137 + v138;	// L227, [8,13)
        v1[((v121 * 3) + 1)][(v122 * 3)][0] = v139;	// L228, [13,14)
        float v140 = v5[((v121 * 3) + 1)][(((v122 * 3) + v120) + 1)][0];	// L229, [1,3)
        float v141 = v140 * v124;	// L230, [4,8)
        float v142 = v1[((v121 * 3) + 1)][((v122 * 3) + 1)][0];	// L231, [6,8)
        float v143 = v141 + v142;	// L232, [8,13)
        v1[((v121 * 3) + 1)][((v122 * 3) + 1)][0] = v143;	// L233, [13,14)
        float v144 = v5[((v121 * 3) + 1)][(((v122 * 3) + v120) + 2)][0];	// L234, [2,4)
        float v145 = v144 * v124;	// L235, [4,8)
        float v146 = v1[((v121 * 3) + 1)][((v122 * 3) + 2)][0];	// L236, [6,8)
        float v147 = v145 + v146;	// L237, [8,13)
        v1[((v121 * 3) + 1)][((v122 * 3) + 2)][0] = v147;	// L238, [13,14)
        float v148 = v5[((v121 * 3) + 2)][((v122 * 3) + v120)][0];	// L239, [0,2)
        float v149 = v148 * v124;	// L240, [4,8)
        float v150 = v1[((v121 * 3) + 2)][(v122 * 3)][0];	// L241, [6,8)
        float v151 = v149 + v150;	// L242, [8,13)
        v1[((v121 * 3) + 2)][(v122 * 3)][0] = v151;	// L243, [13,14)
        float v152 = v5[((v121 * 3) + 2)][(((v122 * 3) + v120) + 1)][0];	// L244, [1,3)
        float v153 = v152 * v124;	// L245, [4,8)
        float v154 = v1[((v121 * 3) + 2)][((v122 * 3) + 1)][0];	// L246, [6,8)
        float v155 = v153 + v154;	// L247, [8,13)
        v1[((v121 * 3) + 2)][((v122 * 3) + 1)][0] = v155;	// L248, [13,14)
        float v156 = v5[((v121 * 3) + 2)][(((v122 * 3) + v120) + 2)][0];	// L249, [2,4)
        float v157 = v156 * v124;	// L250, [4,8)
        float v158 = v1[((v121 * 3) + 2)][((v122 * 3) + 2)][0];	// L251, [6,8)
        float v159 = v157 + v158;	// L252, [8,13)
        v1[((v121 * 3) + 2)][((v122 * 3) + 2)][0] = v159;	// L253, [13,14)
        float v160 = v5[(v121 * 3)][((v122 * 3) + v120)][1];	// L254, [0,2)
        float v161 = v160 * v124;	// L255, [4,8)
        float v162 = v1[(v121 * 3)][(v122 * 3)][1];	// L256, [6,8)
        float v163 = v161 + v162;	// L257, [8,13)
        v1[(v121 * 3)][(v122 * 3)][1] = v163;	// L258, [13,14)
        float v164 = v5[(v121 * 3)][(((v122 * 3) + v120) + 1)][1];	// L259, [1,3)
        float v165 = v164 * v124;	// L260, [4,8)
        float v166 = v1[(v121 * 3)][((v122 * 3) + 1)][1];	// L261, [6,8)
        float v167 = v165 + v166;	// L262, [8,13)
        v1[(v121 * 3)][((v122 * 3) + 1)][1] = v167;	// L263, [13,14)
        float v168 = v5[(v121 * 3)][(((v122 * 3) + v120) + 2)][1];	// L264, [2,4)
        float v169 = v168 * v124;	// L265, [4,8)
        float v170 = v1[(v121 * 3)][((v122 * 3) + 2)][1];	// L266, [6,8)
        float v171 = v169 + v170;	// L267, [8,13)
        v1[(v121 * 3)][((v122 * 3) + 2)][1] = v171;	// L268, [13,14)
        float v172 = v5[((v121 * 3) + 1)][((v122 * 3) + v120)][1];	// L269, [0,2)
        float v173 = v172 * v124;	// L270, [4,8)
        float v174 = v1[((v121 * 3) + 1)][(v122 * 3)][1];	// L271, [6,8)
        float v175 = v173 + v174;	// L272, [8,13)
        v1[((v121 * 3) + 1)][(v122 * 3)][1] = v175;	// L273, [13,14)
        float v176 = v5[((v121 * 3) + 1)][(((v122 * 3) + v120) + 1)][1];	// L274, [1,3)
        float v177 = v176 * v124;	// L275, [4,8)
        float v178 = v1[((v121 * 3) + 1)][((v122 * 3) + 1)][1];	// L276, [6,8)
        float v179 = v177 + v178;	// L277, [8,13)
        v1[((v121 * 3) + 1)][((v122 * 3) + 1)][1] = v179;	// L278, [13,14)
        float v180 = v5[((v121 * 3) + 1)][(((v122 * 3) + v120) + 2)][1];	// L279, [2,4)
        float v181 = v180 * v124;	// L280, [4,8)
        float v182 = v1[((v121 * 3) + 1)][((v122 * 3) + 2)][1];	// L281, [6,8)
        float v183 = v181 + v182;	// L282, [8,13)
        v1[((v121 * 3) + 1)][((v122 * 3) + 2)][1] = v183;	// L283, [13,14)
        float v184 = v5[((v121 * 3) + 2)][((v122 * 3) + v120)][1];	// L284, [0,2)
        float v185 = v184 * v124;	// L285, [4,8)
        float v186 = v1[((v121 * 3) + 2)][(v122 * 3)][1];	// L286, [6,8)
        float v187 = v185 + v186;	// L287, [8,13)
        v1[((v121 * 3) + 2)][(v122 * 3)][1] = v187;	// L288, [13,14)
        float v188 = v5[((v121 * 3) + 2)][(((v122 * 3) + v120) + 1)][1];	// L289, [1,3)
        float v189 = v188 * v124;	// L290, [4,8)
        float v190 = v1[((v121 * 3) + 2)][((v122 * 3) + 1)][1];	// L291, [6,8)
        float v191 = v189 + v190;	// L292, [8,13)
        v1[((v121 * 3) + 2)][((v122 * 3) + 1)][1] = v191;	// L293, [13,14)
        float v192 = v5[((v121 * 3) + 2)][(((v122 * 3) + v120) + 2)][1];	// L294, [2,4)
        float v193 = v192 * v124;	// L295, [4,8)
        float v194 = v1[((v121 * 3) + 2)][((v122 * 3) + 2)][1];	// L296, [6,8)
        float v195 = v193 + v194;	// L297, [8,13)
        v1[((v121 * 3) + 2)][((v122 * 3) + 2)][1] = v195;	// L298, [13,14)
        float v196 = v5[(v121 * 3)][((v122 * 3) + v120)][2];	// L299, [0,2)
        float v197 = v196 * v124;	// L300, [4,8)
        float v198 = v1[(v121 * 3)][(v122 * 3)][2];	// L301, [6,8)
        float v199 = v197 + v198;	// L302, [8,13)
        v1[(v121 * 3)][(v122 * 3)][2] = v199;	// L303, [13,14)
        float v200 = v5[(v121 * 3)][(((v122 * 3) + v120) + 1)][2];	// L304, [1,3)
        float v201 = v200 * v124;	// L305, [4,8)
        float v202 = v1[(v121 * 3)][((v122 * 3) + 1)][2];	// L306, [6,8)
        float v203 = v201 + v202;	// L307, [8,13)
        v1[(v121 * 3)][((v122 * 3) + 1)][2] = v203;	// L308, [13,14)
        float v204 = v5[(v121 * 3)][(((v122 * 3) + v120) + 2)][2];	// L309, [2,4)
        float v205 = v204 * v124;	// L310, [4,8)
        float v206 = v1[(v121 * 3)][((v122 * 3) + 2)][2];	// L311, [6,8)
        float v207 = v205 + v206;	// L312, [8,13)
        v1[(v121 * 3)][((v122 * 3) + 2)][2] = v207;	// L313, [13,14)
        float v208 = v5[((v121 * 3) + 1)][((v122 * 3) + v120)][2];	// L314, [0,2)
        float v209 = v208 * v124;	// L315, [4,8)
        float v210 = v1[((v121 * 3) + 1)][(v122 * 3)][2];	// L316, [6,8)
        float v211 = v209 + v210;	// L317, [8,13)
        v1[((v121 * 3) + 1)][(v122 * 3)][2] = v211;	// L318, [13,14)
        float v212 = v5[((v121 * 3) + 1)][(((v122 * 3) + v120) + 1)][2];	// L319, [1,3)
        float v213 = v212 * v124;	// L320, [4,8)
        float v214 = v1[((v121 * 3) + 1)][((v122 * 3) + 1)][2];	// L321, [6,8)
        float v215 = v213 + v214;	// L322, [8,13)
        v1[((v121 * 3) + 1)][((v122 * 3) + 1)][2] = v215;	// L323, [13,14)
        float v216 = v5[((v121 * 3) + 1)][(((v122 * 3) + v120) + 2)][2];	// L324, [2,4)
        float v217 = v216 * v124;	// L325, [4,8)
        float v218 = v1[((v121 * 3) + 1)][((v122 * 3) + 2)][2];	// L326, [6,8)
        float v219 = v217 + v218;	// L327, [8,13)
        v1[((v121 * 3) + 1)][((v122 * 3) + 2)][2] = v219;	// L328, [13,14)
        float v220 = v5[((v121 * 3) + 2)][((v122 * 3) + v120)][2];	// L329, [0,2)
        float v221 = v220 * v124;	// L330, [4,8)
        float v222 = v1[((v121 * 3) + 2)][(v122 * 3)][2];	// L331, [6,8)
        float v223 = v221 + v222;	// L332, [8,13)
        v1[((v121 * 3) + 2)][(v122 * 3)][2] = v223;	// L333, [13,14)
        float v224 = v5[((v121 * 3) + 2)][(((v122 * 3) + v120) + 1)][2];	// L334, [1,3)
        float v225 = v224 * v124;	// L335, [4,8)
        float v226 = v1[((v121 * 3) + 2)][((v122 * 3) + 1)][2];	// L336, [6,8)
        float v227 = v225 + v226;	// L337, [8,13)
        v1[((v121 * 3) + 2)][((v122 * 3) + 1)][2] = v227;	// L338, [13,14)
        float v228 = v5[((v121 * 3) + 2)][(((v122 * 3) + v120) + 2)][2];	// L339, [2,4)
        float v229 = v228 * v124;	// L340, [4,8)
        float v230 = v1[((v121 * 3) + 2)][((v122 * 3) + 2)][2];	// L341, [6,8)
        float v231 = v229 + v230;	// L342, [8,13)
        v1[((v121 * 3) + 2)][((v122 * 3) + 2)][2] = v231;	// L343, [13,14)
      }
    }
  }
}

