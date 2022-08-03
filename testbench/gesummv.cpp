
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

void gesummv(
  double v0,
  double v1,
  double v2[32][32],
  double v3[32][32],
  double v4[32],
  double v5[32],
  double v6[32]
) {	// L2
  for (int v7 = 0; v7 < 3; v7 += 1) {	// L3
    for (int v8 = 0; v8 < 3; v8 += 1) {	// L4
      for (int v9 = 0; v9 < 7; v9 += 1) {	// L5
        for (int v10 = 0; v10 < 7; v10 += 1) {	// L6
          double v11 = v2[v9][v10];	// L7
          v3[v9][v10] = v11;	// L8
          double v12 = v2[(v9 - 1)][v10];	// L9
          v3[v9][v10] = v12;	// L10
        }
      }
    }
  }
}

