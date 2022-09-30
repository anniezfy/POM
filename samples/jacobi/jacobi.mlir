module {
  func @jacobi(%arg0: f32, %arg1: memref<1024xf32>, %arg2: memref<1024xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 2045 {
      affine.for %arg4 = max affine_map<(d0) -> (1, d0 - 1023)>(%arg3) to min affine_map<(d0) -> (1023, d0 + 1)>(%arg3) {
        %0 = affine.load %arg2[%arg4 - 1] : memref<1024xf32>
        %1 = affine.load %arg2[%arg4 + 1] : memref<1024xf32>
        %2 = arith.addf %1, %0 : f32
        %3 = arith.mulf %2, %arg0 : f32
        %4 = affine.load %arg2[%arg4] : memref<1024xf32>
        %5 = arith.addf %3, %4 : f32
        affine.store %5, %arg2[%arg4] : memref<1024xf32>
      }
    }
    return
  }
}