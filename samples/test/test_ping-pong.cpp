
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
/// Latency=3680189, interval=3680189
/// DSP=20, BRAM=1426
void test(
  float v0,
  float v1,
  float v2[3][64][64],
  float v17[64][3][3][3]
) {	// L5, [0,3680189)
    #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v17

  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v17 cyclic factor=4 dim=1
  #pragma HLS resource variable=v17 core=ram_s2p_bram

  float v25[3][66][66];	// L6, [0,0)
  #pragma HLS resource variable=v25 core=ram_s2p_bram

  float v26[64][64][64];	// L7, [50728,50728)
  #pragma HLS array_partition variable=v26 cyclic factor=4 dim=1
  #pragma HLS resource variable=v26 core=ram_s2p_bram

  float v27[64][64][64];	// L8, [2090679,2090679)
  #pragma HLS resource variable=v27 core=ram_s2p_bram

  float v28[64][64][64];	// L9, [2885433,2885433)
  #pragma HLS resource variable=v28 core=ram_s2p_bram

  for (int v29 = 0; v29 < 3; v29 += 1) {	// L10, [0,13472), iterCycle=4490, II=4490
    for (int v30 = 0; v30 < 66; v30 += 1) {	// L11, [0,4490), iterCycle=68, II=68
      for (int v31 = 0; v31 < 66; v31 += 1) {	// L12, [0,68), iterCycle=1, II=1
        v25[v29][v30][v31] = v0;
        // v25_1[v29][v30][v31] = v0;// L13, [0,1)
      }
    }
  }
  for (int v36 = 0; v36 < 64; v36 += 1) {	// L25, [50728,321194), iterCycle=4226, II=4226
    for (int v37 = 0; v37 < 64; v37 += 1) {	// L26, [0,4226), iterCycle=66, II=66
      for (int v38 = 0; v38 < 64; v38 += 1) {	// L27, [0,66), iterCycle=1, II=1
        v26[v36][v37][v38] = v0;	// L28, [0,1)
      }
    }
  }
  for (int v32 = 0; v32 < 3; v32 += 1) {	// L17, [13472,50728), iterCycle=12418, II=12418
    for (int v33 = 0; v33 < 64; v33 += 1) {	// L18, [0,12418), iterCycle=194, II=194
      for (int v34 = 0; v34 < 64; v34 += 1) {	// L19, [0,194), iterCycle=3, II=3
        float v35 = v2[v32][v33][v34];	// L20, [0,2)
        v25[v32][(v33 + 1)][(v34 + 1)] = v35;	// L21, [2,3)
      }
    }
  }

  float ping_buffer[4][3][3][3];
  float pong_buffer[4][3][3][3];
  for (int co = 0; co < 4; co += 1) {	
    for (int ci = 0; ci < 3; co += 1) {	           
        for (int h = 0; h < 3; h += 1) {
          for (int w = 0; w < 3; w += 1) {		
          float v35 = v17[co][ci][h][w];	
          ping_buffer[co][ci][h][w] = v35;	
        }
      }
    }
  }
  for (int v39 = 0; v39 < 3; v39 += 1) {	// L32, [321194,2090679), iterCycle=12, II=1
    for (int v40 = 0; v40 < 3; v40 += 1) {	// L33, [1589508,2179345), iterCycle=12, II=1
      for (int v41 = 0; v41 < 3; v41 += 1) {	// L34, [1589508,1786129), iterCycle=12, II=1
        for (int v42 = 0; v42 < 16; v42 += 1) {
          if(v42%2==0) {
            for (int v43 = 0; v43 < 64; v43 += 1) {	// L36, [1589508,1593617), iterCycle=12, II=1
              for (int v44 = 0; v44 < 64; v44 += 1) {	// L37, [1589508,1589585), iterCycle=12, II=1
                #pragma HLS pipeline II=1
                  float v45 = v25[v39][(v43 + v40)][(v44 + v41)];	// L38, [0,2)
                  float v46 = ping_buffer[(v42 * 4)%4][v39][v40][v41];	// L39, [0,2)
                  float v47 = v45 * v46;	// L40, [2,6)
                  float v48 = v26[(v42 * 4)][v43][v44];	// L41, [4,6)
                  float v49 = v47 + v48;	// L42, [6,11)
                  v26[(v42 * 4)][v43][v44] = v49;	// L43, [11,12)
                  float v50 = ping_buffer[((v42 * 4)%4 + 1)][v39][v40][v41];	// L44, [0,2)
                  float v51 = v45 * v50;	// L45, [2,6)
                  float v52 = v26[((v42 * 4) + 1)][v43][v44];	// L46, [4,6)
                  float v53 = v51 + v52;	// L47, [6,11)
                  v26[((v42 * 4) + 1)][v43][v44] = v53;	// L48, [11,12)
                  float v54 = ping_buffer[((v42 * 4)%4 + 2)][v39][v40][v41];	// L49, [0,2)
                  float v55 = v45 * v54;	// L50, [2,6)
                  float v56 = v26[((v42 * 4) + 2)][v43][v44];	// L51, [4,6)
                  float v57 = v55 + v56;	// L52, [6,11)
                  v26[((v42 * 4) + 2)][v43][v44] = v57;	// L53, [11,12)
                  float v58 = ping_buffer[((v42 * 4)%4 + 3)][v39][v40][v41];	// L54, [0,2)
                  float v59 = v45 * v58;	// L55, [2,6)
                  float v60 = v26[((v42 * 4) + 3)][v43][v44];	// L56, [4,6)
                  float v61 = v59 + v60;	// L57, [6,11)
                  v26[((v42 * 4) + 3)][v43][v44] = v61;	// L58, [11,12)
              }
            }
            float t1 = v17[(v42+1) * 4][v39][v40][v41];	
            pong_buffer[((v42+1) * 4)%4][v39][v40][v41] = t1;
            float t2 = v17[(v42+1) * 4+1][v39][v40][v41];	
            pong_buffer[((v42+1) * 4+1)%4][v39][v40][v41] = t2;
            float t3 = v17[(v42+1) * 4+2][v39][v40][v41];	
            pong_buffer[((v42+1) * 4+2)%4][v39][v40][v41] = t3;
            float t4 = v17[(v42+1) * 4+3][v39][v40][v41];	
            pong_buffer[((v42+1) * 4+3)%4][v39][v40][v41] = t4;
          }else{
            for (int v43 = 0; v43 < 64; v43 += 1) {	// L36, [1589508,1593617), iterCycle=12, II=1
              for (int v44 = 0; v44 < 64; v44 += 1) {	// L37, [1589508,1589585), iterCycle=12, II=1
                #pragma HLS pipeline II=1
                  float v45 = v25[v39][(v43 + v40)][(v44 + v41)];	// L38, [0,2)
                  float v46 = pong_buffer[(v42 * 4)%4][v39][v40][v41];	// L39, [0,2)
                  float v47 = v45 * v46;	// L40, [2,6)
                  float v48 = v26[(v42 * 4)][v43][v44];	// L41, [4,6)
                  float v49 = v47 + v48;	// L42, [6,11)
                  v26[(v42 * 4)][v43][v44] = v49;	// L43, [11,12)
                  float v50 = pong_buffer[((v42 * 4)%4 + 1)][v39][v40][v41];	// L44, [0,2)
                  float v51 = v45 * v50;	// L45, [2,6)
                  float v52 = v26[((v42 * 4) + 1)][v43][v44];	// L46, [4,6)
                  float v53 = v51 + v52;	// L47, [6,11)
                  v26[((v42 * 4) + 1)][v43][v44] = v53;	// L48, [11,12)
                  float v54 = pong_buffer[((v42 * 4)%4 + 2)][v39][v40][v41];	// L49, [0,2)
                  float v55 = v45 * v54;	// L50, [2,6)
                  float v56 = v26[((v42 * 4) + 2)][v43][v44];	// L51, [4,6)
                  float v57 = v55 + v56;	// L52, [6,11)
                  v26[((v42 * 4) + 2)][v43][v44] = v57;	// L53, [11,12)
                  float v58 = pong_buffer[((v42 * 4)%4 + 3)][v39][v40][v41];	// L54, [0,2)
                  float v59 = v45 * v58;	// L55, [2,6)
                  float v60 = v26[((v42 * 4) + 3)][v43][v44];	// L56, [4,6)
                  float v61 = v59 + v60;	// L57, [6,11)
                  v26[((v42 * 4) + 3)][v43][v44] = v61;	// L58, [11,12)
              }
            }
            float t1 = v17[(v42+1) * 4][v39][v40][v41];	
            ping_buffer[((v42+1) * 4)%4][v39][v40][v41] = t1;
            float t2 = v17[(v42+1) * 4+1][v39][v40][v41];	
            ping_buffer[((v42+1) * 4+1)%4][v39][v40][v41] = t2;
            float t3 = v17[(v42+1) * 4+2][v39][v40][v41];	
            pong_buffer[((v42+1) * 4+2)%4][v39][v40][v41] = t3;
            float t4 = v17[(v42+1) * 4+3][v39][v40][v41];	
            pong_buffer[((v42+1) * 4+3)%4][v39][v40][v41] = t4;
          }
          
        }
      }
    }
  }
  for (int v62 = 0; v62 < 64; v62 += 1) {	// L65, [2090679,2885433), iterCycle=12418, II=12418
    for (int v63 = 0; v63 < 64; v63 += 1) {	// L66, [0,12418), iterCycle=194, II=194
      for (int v64 = 0; v64 < 64; v64 += 1) {	// L67, [0,194), iterCycle=3, II=3
        float v65 = v26[v62][v63][v64];	// L68, [0,2)
        v27[v62][v63][v64] = v65;	// L69, [2,3)
      }
    }
  }
  for (int v66 = 0; v66 < 64; v66 += 1) {	// L73, [2885433,3680187), iterCycle=12418, II=12418
    for (int v67 = 0; v67 < 64; v67 += 1) {	// L74, [0,12418), iterCycle=194, II=194
      for (int v68 = 0; v68 < 64; v68 += 1) {	// L75, [0,194), iterCycle=3, II=3
        float v69 = v27[v66][v67][v68];	// L76, [0,2)
        float v70 = max(v69, v0);	// L77, [2,2)
        v28[v66][v67][v68] = v70;	// L78, [2,3)
      }
    }
  }
}

