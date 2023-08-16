module {
  func @jacobi(%arg0: f32, %arg1: memref<4096xf32>, %arg2: memref<4096xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 4096 {
      affine.for %arg4 = 0 to 4094 {
        %0 = affine.load %arg2[%arg4] : memref<4096xf32>
        %1 = affine.load %arg2[%arg4 + 1] : memref<4096xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = affine.load %arg2[%arg4 + 2] : memref<4096xf32>
        %4 = arith.addf %3, %2 : f32
        %5 = arith.mulf %4, %arg0 : f32
        affine.store %5, %arg1[%arg4 + 1] : memref<4096xf32>
      } {parallel}
      affine.for %arg4 = 0 to 4094 {
        %0 = affine.load %arg1[%arg4] : memref<4096xf32>
        %1 = affine.load %arg1[%arg4 + 1] : memref<4096xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = affine.load %arg1[%arg4 + 2] : memref<4096xf32>
        %4 = arith.addf %3, %2 : f32
        %5 = arith.mulf %4, %arg0 : f32
        affine.store %5, %arg2[%arg4 + 1] : memref<4096xf32>
      } {parallel}
    }
    return
  }
}