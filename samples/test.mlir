module {
  func @test(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: memref<4096x4096xf32>) attributes {top_func} {
    affine.for %arg4 = 0 to 4096 {
      affine.for %arg5 = 1 to 4096 {
        affine.for %arg6 = 1 to 4096 {
          %0 = affine.load %arg3[%arg5 - 1, %arg6] : memref<4096x4096xf32>
          %1 = arith.addf %0, %arg1 : f32
          %2 = affine.load %arg3[%arg5 - 1, %arg6] : memref<4096x4096xf32>
          %3 = arith.addf %arg2, %2 : f32
          %4 = arith.addf %3, %1 : f32
          affine.store %4, %arg3[%arg5, %arg6] : memref<4096x4096xf32>
        } {parallel}
      }
    }
    return
  }
}