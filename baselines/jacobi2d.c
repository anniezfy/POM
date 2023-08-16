#define N 4096
void seidel(float A[N][N],float B[N][N]) {
#pragma scop
  for (int t = 0; t < 4096; t++){
      for (int i = 1; i < 4095; i++)
	        for (int j = 1; j < 4095; j++)
	          B[i][j] = 0.2 * (A[i][j] + A[i][j-1] + A[i][1+j] + A[1+i][j] + A[i-1][j]);
      for (int i = 1; i < 4095; i++)
	        for (int j = 1; j < 4095; j++)
	          A[i][j] = 0.2 * (B[i][j] + B[i][j-1] + B[i][1+j] + B[1+i][j] + B[i-1][j]);
    }
#pragma endscop
}
