module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32>, %arg3: memref<4096x4096xf32>, %arg4: memref<4096x4096xf32>, %arg5: memref<4096x4096xf32>, %arg6: memref<4096x4096xf32>) attributes {resource = #hls.r<lut=0, dsp=2, bram=0>, timing = #hls.t<0 -> 151011334, 151011334, 151011334>, top_func} {
    affine.for %arg7 = 0 to 4096 {
      affine.for %arg8 = 0 to 4096 {
        affine.store %arg1, %arg2[%arg7, %arg8] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32>
      } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=1, minII=1>, parallel, timing = #hls.t<0 -> 4098, 4098, 4098>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=4098, minII=4098>, parallel, timing = #hls.t<0 -> 16785410, 16785410, 16785410>}
    affine.for %arg7 = 0 to 4096 {
      affine.for %arg8 = 0 to 4096 {
        %0 = affine.load %arg4[%arg7, %arg8] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32>
        %1 = arith.addf %0, %arg0 {timing = #hls.t<2 -> 7, 5, 1>} : f32
        affine.store %1, %arg3[%arg7, %arg8] {partition_indices = [0, 0], timing = #hls.t<7 -> 8, 1, 1>} : memref<4096x4096xf32>
      } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=8, minII=8>, parallel, timing = #hls.t<0 -> 32770, 32770, 32770>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=32770, minII=32770>, parallel, timing = #hls.t<16785410 -> 151011332, 134225922, 134225922>}
    return {timing = #hls.t<151011332 -> 151011332, 0, 0>}
  }
}