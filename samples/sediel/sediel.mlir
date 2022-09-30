module {
  func @sediel(%arg0: f32, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 1024 {
      affine.for %arg4 = 0 to 2047 {
        affine.for %arg5 = max affine_map<(d0) -> (0, d0 - 1024)>(%arg4) to min affine_map<(d0) -> (1024, d0)>(%arg4) {
          affine.store %arg0, %arg1[%arg4, %arg5] : memref<1024x1024xf32>
        } {parallel}
      } {parallel}
    }
    return
  }
}