module {
  func @sediel(%arg0: f32, %arg1: memref<4096x4096xf32>) attributes {top_func} {
    affine.for %arg2 = 0 to 4096 {
      affine.for %arg3 = 1 to 4096 {
        affine.for %arg4 = 1 to 4096 {
          %0 = affine.load %arg1[%arg3 - 1, %arg4 - 1] : memref<4096x4096xf32>
          %1 = affine.load %arg1[%arg3 - 1, %arg4] : memref<4096x4096xf32>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg1[%arg3 - 1, %arg4 + 1] : memref<4096x4096xf32>
          %4 = arith.addf %3, %2 : f32
          %5 = affine.load %arg1[%arg3, %arg4 - 1] : memref<4096x4096xf32>
          %6 = arith.addf %5, %2 : f32
          %7 = affine.load %arg1[%arg3, %arg4] : memref<4096x4096xf32>
          %8 = arith.addf %7, %2 : f32
          %9 = affine.load %arg1[%arg3, %arg4 + 1] : memref<4096x4096xf32>
          %10 = arith.addf %9, %2 : f32
          %11 = affine.load %arg1[%arg3 + 1, %arg4 - 1] : memref<4096x4096xf32>
          %12 = arith.addf %11, %2 : f32
          %13 = affine.load %arg1[%arg3 + 1, %arg4] : memref<4096x4096xf32>
          %14 = arith.addf %13, %2 : f32
          %15 = affine.load %arg1[%arg3 + 1, %arg4 + 1] : memref<4096x4096xf32>
          %16 = arith.addf %15, %2 : f32
          %17 = arith.mulf %2, %arg0 : f32
          affine.store %16, %arg1[%arg3, %arg4] : memref<4096x4096xf32>
        }
      }
    }
    return
  }
}