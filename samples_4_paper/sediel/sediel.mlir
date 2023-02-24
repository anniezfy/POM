module {
  func @sediel(%arg0: f32, %arg1: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>, %arg2: memref<4096x4096xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 4096 {
      affine.for %arg4 = 0 to 12280 {
        affine.for %arg5 = max affine_map<(d0) -> (0, d0 floordiv 2 - 2046)>(%arg4) to min affine_map<(d0) -> (4094, d0 floordiv 2)>(%arg4) {
          %0 = affine.load %arg1[%arg5, %arg5 * -2 + %arg4 + 1] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %1 = affine.load %arg1[%arg5, %arg5 * -2 + %arg4] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg1[%arg5, %arg5 * -2 + %arg4 + 2] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %4 = arith.addf %3, %2 : f32
          %5 = affine.load %arg1[%arg5 + 1, %arg5 * -2 + %arg4] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %6 = arith.addf %5, %4 : f32
          %7 = affine.load %arg1[%arg5 + 1, %arg5 * -2 + %arg4 + 1] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %8 = arith.addf %7, %6 : f32
          %9 = affine.load %arg1[%arg5 + 1, %arg5 * -2 + %arg4 + 2] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %10 = arith.addf %9, %8 : f32
          %11 = affine.load %arg1[%arg5 + 2, %arg5 * -2 + %arg4] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %12 = arith.addf %11, %10 : f32
          %13 = affine.load %arg1[%arg5 + 2, %arg5 * -2 + %arg4 + 1] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %14 = arith.addf %13, %12 : f32
          %15 = affine.load %arg1[%arg5 + 2, %arg5 * -2 + %arg4 + 2] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
          %16 = arith.addf %15, %14 : f32
          %17 = arith.divf %16, %arg0 : f32
          affine.store %17, %arg1[%arg5 + 1, %arg5 * -2 + %arg4 + 1] : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 3, d1 mod 3, d0 floordiv 3, d1 floordiv 3)>>
        } {parallel}
      }
    }
    return
  }
}