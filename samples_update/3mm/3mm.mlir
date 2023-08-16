module {
  func @"3mm"(%arg0: f32, %arg1: memref<32xf32>, %arg2: memref<32xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.store %arg0, %arg1[%arg3] : memref<32xf32>
        affine.for %arg5 = 0 to 32 {
          affine.store %arg0, %arg1[%arg3] : memref<32xf32>
        }
      }
    } {parallel}
    return
  }
}