module {
  func @sediel(%arg0: f32, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 1024 {
      affine.for %arg4 = 0 to 1024 {
        affine.for %arg5 = 0 to 1024 {
          %0 = affine.load %arg1[%arg4 - 1, %arg5] : memref<1024x1024xf32>
          %1 = arith.addf %0, %0 : f32
          %2 = affine.load %arg1[%arg4 - 1, %arg5 + 1] : memref<1024x1024xf32>
          %3 = arith.addf %2, %1 : f32
          %4 = affine.load %arg1[%arg4, %arg5 - 1] : memref<1024x1024xf32>
          %5 = arith.addf %4, %3 : f32
          %6 = affine.load %arg1[%arg4, %arg5 + 1] : memref<1024x1024xf32>
          %7 = arith.addf %6, %5 : f32
          %8 = affine.load %arg1[%arg4 + 1, %arg5 - 1] : memref<1024x1024xf32>
          %9 = arith.addf %8, %7 : f32
          %10 = affine.load %arg1[%arg4 + 1, %arg5] : memref<1024x1024xf32>
          %11 = arith.addf %10, %9 : f32
          %12 = affine.load %arg1[%arg4 + 1, %arg5 + 1] : memref<1024x1024xf32>
          %13 = arith.addf %12, %11 : f32
          %14 = arith.mulf %13, %arg0 : f32
          %15 = affine.load %arg1[%arg4, %arg5] : memref<1024x1024xf32>
          %16 = arith.addf %15, %14 : f32
          affine.store %16, %arg1[%arg4, %arg5] : memref<1024x1024xf32>
        }
      }
    }
    return
  }
}