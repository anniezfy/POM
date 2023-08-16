module {
  func @edgeDetect(%arg0: f32, %arg1: memref<4096x4096x3xf32>, %arg2: memref<4096x4096x3xf32>, %arg3: memref<4096x4096x3xf32>) attributes {top_func} {
    affine.for %arg4 = 0 to 4094 {
      affine.for %arg5 = 0 to 4094 {
        affine.for %arg6 = 0 to 3 {
          %0 = affine.load %arg2[%arg4, %arg5, %arg6] : memref<4096x4096x3xf32>
          %1 = affine.load %arg2[%arg4, %arg5 + 1, %arg6] : memref<4096x4096x3xf32>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg2[%arg4, %arg5 + 2, %arg6] : memref<4096x4096x3xf32>
          %4 = arith.addf %3, %2 : f32
          %5 = affine.load %arg2[%arg4 + 1, %arg5, %arg6] : memref<4096x4096x3xf32>
          %6 = arith.addf %5, %4 : f32
          %7 = affine.load %arg2[%arg4 + 1, %arg5 + 2, %arg6] : memref<4096x4096x3xf32>
          %8 = arith.addf %7, %6 : f32
          %9 = affine.load %arg2[%arg4 + 2, %arg5, %arg6] : memref<4096x4096x3xf32>
          %10 = arith.addf %9, %8 : f32
          %11 = affine.load %arg2[%arg4 + 2, %arg5 + 1, %arg6] : memref<4096x4096x3xf32>
          %12 = arith.addf %11, %10 : f32
          %13 = affine.load %arg2[%arg4 + 2, %arg5 + 2, %arg6] : memref<4096x4096x3xf32>
          %14 = arith.addf %13, %12 : f32
          %15 = arith.divf %14, %arg0 : f32
          affine.store %15, %arg3[%arg4, %arg5, %arg6] : memref<4096x4096x3xf32>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg4 = 0 to 4094 {
      affine.for %arg5 = 0 to 4094 {
        affine.for %arg6 = 0 to 3 {
          %0 = affine.load %arg3[%arg4 + 1, %arg5 + 1, %arg6] : memref<4096x4096x3xf32>
          %1 = affine.load %arg3[%arg4 + 2, %arg5, %arg6] : memref<4096x4096x3xf32>
          %2 = arith.subf %0, %1 : f32
          %3 = affine.load %arg3[%arg4 + 2, %arg5 + 1, %arg6] : memref<4096x4096x3xf32>
          %4 = arith.addf %3, %2 : f32
          %5 = affine.load %arg3[%arg4 + 1, %arg5, %arg6] : memref<4096x4096x3xf32>
          %6 = arith.subf %5, %4 : f32
          affine.store %6, %arg1[%arg4, %arg5, %arg6] : memref<4096x4096x3xf32>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    return
  }
}