module {
  func @sediel(%arg0: f32, %arg1: memref<4096x4096xf32>) attributes {resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 892950597636, 892950597636, 892950597636>, top_func} {
    affine.for %arg2 = 0 to 4096 {
      affine.for %arg3 = 1 to 4096 {
        affine.for %arg4 = 1 to 4096 {
          %0 = affine.load %arg1[%arg3 - 1, %arg4 - 1] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32>
          %1 = affine.load %arg1[%arg3 - 1, %arg4] {partition_indices = [0, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32>
          %2 = arith.addf %0, %1 {timing = #hls.t<3 -> 8, 5, 1>} : f32
          %3 = arith.mulf %2, %arg0 {timing = #hls.t<8 -> 12, 4, 1>} : f32
          affine.store %3, %arg1[%arg3, %arg4] {partition_indices = [0, 0], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096x4096xf32>
        } {loop_info = #hls.l<flattenTripCount=4095, iterLatency=13, minII=13>, timing = #hls.t<0 -> 53237, 53237, 53237>}
      } {loop_info = #hls.l<flattenTripCount=4095, iterLatency=53237, minII=53237>, timing = #hls.t<0 -> 218005517, 218005517, 218005517>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=218005517, minII=218005517>, timing = #hls.t<0 -> 892950597634, 892950597634, 892950597634>}
    return {timing = #hls.t<892950597634 -> 892950597634, 0, 0>}
  }
}