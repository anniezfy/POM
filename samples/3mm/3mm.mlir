module {
  func @"3mm"(%arg0: f32, %arg1: memref<32xf32>, %arg2: memref<32xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 4 {
        %0 = affine.load %arg1[%arg4 * 8] : memref<32xf32>
        %1 = affine.load %arg2[%arg3] : memref<32xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg1[%arg4 * 8] : memref<32xf32>
        %3 = affine.load %arg1[%arg4 * 8 + 1] : memref<32xf32>
        %4 = arith.addf %3, %1 : f32
        affine.store %4, %arg1[%arg4 * 8 + 1] : memref<32xf32>
        %5 = affine.load %arg1[%arg4 * 8 + 2] : memref<32xf32>
        %6 = arith.addf %5, %1 : f32
        affine.store %6, %arg1[%arg4 * 8 + 2] : memref<32xf32>
        %7 = affine.load %arg1[%arg4 * 8 + 3] : memref<32xf32>
        %8 = arith.addf %7, %1 : f32
        affine.store %8, %arg1[%arg4 * 8 + 3] : memref<32xf32>
        %9 = affine.load %arg1[%arg4 * 8 + 4] : memref<32xf32>
        %10 = arith.addf %9, %1 : f32
        affine.store %10, %arg1[%arg4 * 8 + 4] : memref<32xf32>
        %11 = affine.load %arg1[%arg4 * 8 + 5] : memref<32xf32>
        %12 = arith.addf %11, %1 : f32
        affine.store %12, %arg1[%arg4 * 8 + 5] : memref<32xf32>
        %13 = affine.load %arg1[%arg4 * 8 + 6] : memref<32xf32>
        %14 = arith.addf %13, %1 : f32
        affine.store %14, %arg1[%arg4 * 8 + 6] : memref<32xf32>
        %15 = affine.load %arg1[%arg4 * 8 + 7] : memref<32xf32>
        %16 = arith.addf %15, %1 : f32
        affine.store %16, %arg1[%arg4 * 8 + 7] : memref<32xf32>
      } {parallel}
    }
    return
  }
}