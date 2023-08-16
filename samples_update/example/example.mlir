module {
  func @example(%arg0: f32, %arg1: memref<1024x1024xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg2: memref<1024x1024xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 2045 {
      affine.for %arg4 = max affine_map<(d0) -> (0, d0 - 1022)>(%arg3) to min affine_map<(d0) -> (1023, d0)>(%arg3) {
        %0 = affine.load %arg1[%arg4, -%arg4 + %arg3 + 1] : memref<1024x1024xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = affine.load %arg1[%arg4 + 1, -%arg4 + %arg3] : memref<1024x1024xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg1[%arg4 + 1, -%arg4 + %arg3 + 1] : memref<1024x1024xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
      } {parallel}
    }
    return
  }
}