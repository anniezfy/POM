#pragma HLS array_partition variable=v1 cyclic factor=2 dim=1
#pragma HLS array_partition variable=v1 cyclic factor=2 dim=2
#pragma HLS DEPENDENCE dependent=false type=inter variable=A
for (int i1 = 0; i1 < 2045; i1 += 1) {	
    for (int j1 = max(0, (i1 - 1022)); j1 < min(1023, i1); j1 += 1) {	
        #pragma HLS pipeline II=1
        A[j1+1][i1-j1+1] = A[j1][i1-j1+1] + A[j1+1][i1-j1];
    }
}