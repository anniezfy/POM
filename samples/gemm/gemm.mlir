module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: memref<32xf32>, %arg3: memref<32xf32>, %arg4: memref<32xf32>) attributes {top_func} {
    affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 4 {
        affine.store %arg0, %arg3[%arg6 * 8] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 1] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 2] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 3] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 4] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 5] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 6] : memref<32xf32>
        affine.store %arg0, %arg3[%arg6 * 8 + 7] : memref<32xf32>
      } {parallel}
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg3[%arg6] : memref<32xf32>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg4[%arg6] : memref<32xf32>
      } {parallel}
    }
    affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg2[%arg6] : memref<32xf32>
        %1 = affine.load %arg4[%arg6] : memref<32xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg2[%arg6] : memref<32xf32>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    return
  }
}