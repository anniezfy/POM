module {
  func @gemm(%arg0: f32, %arg1: memref<1024x1024xf32>) attributes {top_func} {
    affine.for %arg2 = 0 to 1024 {
      affine.for %arg3 = 0 to 1024 {
        affine.for %arg4 = 0 to 1024 {
          %0 = affine.load %arg1[%arg3, %arg4] : memref<1024x1024xf32>
          %1 = affine.load %arg1[%arg3 - 1, %arg4] : memref<1024x1024xf32>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg1[%arg3 - 3, %arg4] : memref<1024x1024xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg1[%arg3, %arg4] : memref<1024x1024xf32>
        } {parallel}
      }
    }
    return
  }
}