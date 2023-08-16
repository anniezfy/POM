module {
  func @"3mm"(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: memref<32xf32>, %arg4: memref<32xf32>) attributes {top_func} {
    affine.for %arg5 = 0 to 128 {
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg4[%arg6] : memref<32xf32>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg3[%arg6] : memref<32xf32>
      } {parallel}
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg3[%arg6] : memref<32xf32>
        %1 = arith.mulf %0, %arg2 : f32
        affine.if affine_set<(d0) : (d0 == 0)>(%arg6) {
          affine.store %1, %arg4[%arg6] : memref<32xf32>
        }
      } {parallel}
    }
    return
  }
}