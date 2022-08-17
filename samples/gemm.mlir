module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32>, %arg3: memref<4096x4096xf32>, %arg4: memref<4096x4096xf32>, %arg5: memref<4096x4096xf32>, %arg6: memref<4096x4096xf32>) attributes {resource = #hls.r<lut=0, dsp=0, bram=0>, timing = #hls.t<0 -> 33562630, 33562630, 33562630>, top_func} {
    affine.for %arg7 = 0 to 4096 {
      affine.for %arg8 = 0 to 4096 {
        affine.store %arg1, %arg2[%arg7, %arg8] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32>
        affine.store %arg0, %arg3[%arg7, %arg8] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=4096, iterLatency=1, minII=1>, timing = #hls.t<16785410 -> 16789508, 4098, 4098>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=16777216, iterLatency=1, minII=1>, timing = #hls.t<0 -> 16777218, 16777218, 16777218>}
    affine.for %arg7 = 0 to 4096 {
      affine.for %arg8 = 0 to 4096 {
        affine.store %arg0, %arg3[%arg7, %arg8] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32>
      } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=1, minII=1>, timing = #hls.t<0 -> 4098, 4098, 4098>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=4098, minII=4098>, timing = #hls.t<16777218 -> 33562628, 16785410, 16785410>}
    return {timing = #hls.t<33562628 -> 33562628, 0, 0>}
  }
}