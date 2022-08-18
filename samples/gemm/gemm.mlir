module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32>, %arg3: memref<4096x4096xf32>, %arg4: memref<4096x4096xf32>, %arg5: memref<4096x4096xf32>, %arg6: memref<4096x4096xf32>) attributes {top_func} {
    affine.for %arg7 = 0 to 4096 {
      affine.for %arg8 = 0 to 4096 {
        affine.store %arg1, %arg4[%arg7, %arg8] : memref<4096x4096xf32>
        affine.for %arg9 = 0 to 4096 {
          %0 = affine.load %arg2[%arg7, %arg9] : memref<4096x4096xf32>
          %1 = arith.mulf %arg0, %0 : f32
          %2 = affine.load %arg3[%arg9, %arg8] : memref<4096x4096xf32>
          %3 = arith.mulf %2, %1 : f32
          %4 = affine.load %arg4[%arg7, %arg8] : memref<4096x4096xf32>
          %5 = arith.addf %1, %4 : f32
          affine.store %5, %arg4[%arg7, %arg8] : memref<4096x4096xf32>
        }
      } 
    } 
    return
  }
}