module {
  func @sediel(%arg0: f32, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 1024 {
      affine.for %arg4 = 0 to 1024 {
        affine.for %arg5 = 0 to 1024 {
          %0 = affine.load %arg1[%arg4 - 1, %arg5] : memref<1024x1024xf32>
          %1 = affine.load %arg1[%arg4 - 1, %arg5] : memref<1024x1024xf32>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg1[%arg4 - 1, %arg5 + 1] : memref<1024x1024xf32>
          %4 = arith.addf %3, %2 : f32
          %5 = affine.load %arg1[%arg4, %arg5 - 1] : memref<1024x1024xf32>
          %6 = arith.addf %5, %4 : f32
          %7 = affine.load %arg1[%arg4, %arg5] : memref<1024x1024xf32>
          %8 = arith.addf %7, %6 : f32
          %9 = affine.load %arg1[%arg4, %arg5 + 1] : memref<1024x1024xf32>
          %10 = arith.addf %9, %8 : f32
          %11 = affine.load %arg1[%arg4 + 1, %arg5 - 1] : memref<1024x1024xf32>
          %12 = arith.addf %11, %10 : f32
          %13 = affine.load %arg1[%arg4 + 1, %arg5] : memref<1024x1024xf32>
          %14 = arith.addf %13, %12 : f32
          %15 = affine.load %arg1[%arg4 + 1, %arg5 + 1] : memref<1024x1024xf32>
          %16 = arith.addf %15, %14 : f32
          %17 = arith.mulf %16, %arg0 : f32
          affine.store %17, %arg1[%arg4, %arg5] : memref<1024x1024xf32>
        }
      }
    }
    return
  }
}