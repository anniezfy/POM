module {
  func @test(%arg0: memref<128x128xf32>, %arg1: memref<128xf32>) attributes {top_func} {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3 - 1, %arg2] : memref<128x128xf32>
        %1 = affine.load %arg0[%arg3, %arg2 - 1] : memref<128x128xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = affine.load %arg0[%arg3 + 1, %arg2] : memref<128x128xf32>
        %4 = arith.addf %3, %2 : f32
        %5 = affine.load %arg0[%arg3, %arg2 + 1] : memref<128x128xf32>
        %6 = arith.addf %5, %4 : f32
        affine.store %6, %arg0[%arg3, %arg2] : memref<128x128xf32>
      }
    }
    return
  }
}