module {
  func @test_max(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: memref<32xf32>, %arg4: memref<32xf32>) attributes {top_func} {
    affine.for %arg5 = 0 to 128 {
      affine.for %arg6 = 0 to 32 {
        %0 = arith.mulf %arg1, %arg2 : f32
        affine.store %0, %arg3[%arg6] : memref<32xf32>
      } {parallel}
    }
    affine.for %arg5 = 0 to 128 {
      affine.for %arg6 = 0 to 32 {
        %0 = arith.mulf %arg1, %arg2 : f32
        affine.store %0, %arg3[%arg6] : memref<32xf32>
      } {parallel}
    }
    affine.for %arg5 = 0 to 128 {
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg3[%arg6 + %arg5] : memref<32xf32>
        %1 = affine.load %arg4[%arg6 * 2 + %arg5] : memref<32xf32>
        %2 = arith.maxf %0, %1 : f32
        affine.store %2, %arg4[%arg6] : memref<32xf32>
      }
    }
    return
  }
}