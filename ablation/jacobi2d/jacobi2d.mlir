module {
  func @jacobi2d(%arg0: f32, %arg1: memref<4096x4096xf32>, %arg2: memref<4096x4096xf32>) attributes {top_func} {
    affine.for %arg3 = 0 to 4096 {
      affine.for %arg4 = 0 to 4094 {
        affine.for %arg5 = 0 to 4094 {
          %0 = affine.load %arg1[%arg4 + 1, %arg5 + 1] : memref<4096x4096xf32>
          %1 = affine.load %arg1[%arg4 + 1, %arg5] : memref<4096x4096xf32>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg1[%arg4 + 1, %arg5 + 2] : memref<4096x4096xf32>
          %4 = arith.addf %3, %2 : f32
          %5 = affine.load %arg1[%arg4 + 2, %arg5 + 1] : memref<4096x4096xf32>
          %6 = arith.addf %5, %4 : f32
          %7 = affine.load %arg1[%arg4, %arg5 + 1] : memref<4096x4096xf32>
          %8 = arith.addf %7, %6 : f32
          %9 = arith.mulf %8, %arg0 : f32
          affine.store %9, %arg2[%arg4 + 1, %arg5 + 1] : memref<4096x4096xf32>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      affine.for %arg4 = 0 to 4094 {
        affine.for %arg5 = 0 to 4094 {
          %0 = affine.load %arg2[%arg4 + 1, %arg5 + 1] : memref<4096x4096xf32>
          %1 = affine.load %arg2[%arg4 + 1, %arg5] : memref<4096x4096xf32>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg2[%arg4 + 1, %arg5 + 2] : memref<4096x4096xf32>
          %4 = arith.addf %3, %2 : f32
          %5 = affine.load %arg2[%arg4 + 2, %arg5 + 1] : memref<4096x4096xf32>
          %6 = arith.addf %5, %4 : f32
          %7 = affine.load %arg2[%arg4, %arg5 + 1] : memref<4096x4096xf32>
          %8 = arith.addf %7, %6 : f32
          %9 = arith.mulf %8, %arg0 : f32
          affine.store %9, %arg1[%arg4 + 1, %arg5 + 1] : memref<4096x4096xf32>
        } {parallel}
      } {parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    return
  }
}