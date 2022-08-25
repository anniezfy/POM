module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: memref<1024x1024xf32>, %arg3: memref<1024x1024xf32>, %arg4: memref<1024x1024xf32>) attributes {resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 17189310470, 17189310470, 17189310470>, top_func} {
    affine.for %arg5 = 0 to 1024 {
      affine.for %arg6 = 0 to 1024 {
        %0 = affine.load %arg4[%arg5, %arg6] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<1024x1024xf32>
        %1 = arith.mulf %0, %arg1 {timing = #hls.t<2 -> 6, 4, 1>} : f32
        affine.store %1, %arg4[%arg5, %arg6] {partition_indices = [0, 0], timing = #hls.t<6 -> 7, 1, 1>} : memref<1024x1024xf32>
      } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=7, minII=7>, timing = #hls.t<0 -> 7170, 7170, 7170>}
    } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=7170, minII=7170>, timing = #hls.t<0 -> 7342082, 7342082, 7342082>}
    affine.for %arg5 = 0 to 1024 {
      affine.for %arg6 = 0 to 1024 {
        affine.for %arg7 = 0 to 1024 {
          %0 = affine.load %arg2[%arg5, %arg7] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<1024x1024xf32>
          %1 = arith.mulf %arg0, %0 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %2 = affine.load %arg3[%arg7, %arg6] {partition_indices = [0, 0], timing = #hls.t<4 -> 6, 2, 1>} : memref<1024x1024xf32>
          %3 = arith.mulf %2, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %4 = affine.load %arg4[%arg5, %arg6] {partition_indices = [0, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<1024x1024xf32>
          %5 = arith.addf %3, %4 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %5, %arg4[%arg5, %arg6] {partition_indices = [0, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<1024x1024xf32>
        } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=16, minII=16>, timing = #hls.t<0 -> 16386, 16386, 16386>}
      } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=16386, minII=16386>, timing = #hls.t<0 -> 16779266, 16779266, 16779266>}
    } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=16779266, minII=16779266>, timing = #hls.t<7342082 -> 17189310468, 17181968386, 17181968386>}
    return {timing = #hls.t<17189310468 -> 17189310468, 0, 0>}
  }
}