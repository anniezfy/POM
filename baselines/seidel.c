#define N 4096
void seidel(float A[N][N]) {
#pragma scop
  for (int t = 0; t <= 4095; t++)
    for (int i = 1; i<= 4094; i++)
      for (int j = 1; j<=4094; j++)
	A[i][j] = (A[i-1][j-1] + A[i-1][j] + A[i-1][j+1]
		   + A[i][j-1] + A[i][j] + A[i][j+1]
		   + A[i+1][j-1] + A[i+1][j] + A[i+1][j+1])/9.0;
#pragma endscop
}
