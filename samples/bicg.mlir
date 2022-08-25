module {
  func @bicg(%arg0: memref<4096x4096xf32>, %arg1: memref<4096xf32>, %arg2: memref<4096xf32>, %arg3: memref<4096xf32>, %arg4: memref<4096xf32>) attributes {top_func} {
    affine.for %arg5 = 0 to 4096 {
      affine.for %arg6 = 0 to 4096 {
        %0 = affine.load %arg0[%arg5, %arg6] : memref<4096x4096xf32>
        %1 = affine.load %arg3[%arg5] : memref<4096xf32>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg4[%arg6] : memref<4096xf32>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg4[%arg6] : memref<4096xf32>
        %5 = affine.load %arg0[%arg5, %arg6] : memref<4096x4096xf32>
        %6 = affine.load %arg1[%arg6] : memref<4096xf32>
        %7 = arith.mulf %5, %6 : f32
        %8 = affine.load %arg2[%arg5] : memref<4096xf32>
        %9 = arith.addf %7, %8 : f32
        affine.store %9, %arg2[%arg5] : memref<4096xf32>
      }
    }
    return
  }
}