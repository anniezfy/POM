module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32>, %arg3: memref<4096x4096xf32>, %arg4: memref<4096x4096xf32>) attributes {top_func} {
    affine.for %arg5 = 0 to 512 {
      affine.for %arg6 = 0 to 512 {
        affine.for %arg7 = 0 to 256 {
          affine.for %arg8 = 0 to 8 {
            affine.for %arg9 = 0 to 8 {
              affine.for %arg10 = 0 to 16 {
                %0 = affine.load %arg4[%arg8 + %arg5 * 8, %arg9 + %arg6 * 8] : memref<4096x4096xf32>
                %1 = arith.mulf %0, %arg1 : f32
                affine.store %1, %arg4[%arg8 + %arg5 * 8, %arg9 + %arg6 * 8] : memref<4096x4096xf32>
                %2 = affine.load %arg2[%arg8 + %arg5 * 8, %arg10 + %arg7 * 16] : memref<4096x4096xf32>
                %3 = arith.mulf %arg0, %2 : f32
                %4 = affine.load %arg3[%arg10 + %arg7 * 16, %arg9 + %arg6 * 8] : memref<4096x4096xf32>
                %5 = arith.mulf %4, %3 : f32
                %6 = affine.load %arg4[%arg8 + %arg5 * 8, %arg9 + %arg6 * 8] : memref<4096x4096xf32>
                %7 = arith.addf %5, %6 : f32
                affine.store %7, %arg4[%arg8 + %arg5 * 8, %arg9 + %arg6 * 8] : memref<4096x4096xf32>
              }
            } {parallel}
          } {parallel}
        }
      } {parallel}
    } {parallel}
    return
  }
}