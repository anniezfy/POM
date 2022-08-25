module {
  func @sediel(%arg0: f32, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>) attributes {resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 50467964932, 50467964932, 50467964932>, top_func} {
    affine.for %arg3 = 0 to 1024 {
      affine.for %arg4 = 0 to 1024 {
        affine.for %arg5 = 0 to 1024 {
          %0 = affine.load %arg1[%arg4 - 1, %arg5] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<1024x1024xf32>
          %1 = affine.load %arg1[%arg4 - 1, %arg5] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<1024x1024xf32>
          %2 = arith.addf %0, %1 {timing = #hls.t<2 -> 7, 5, 1>} : f32
          %3 = affine.load %arg1[%arg4 - 1, %arg5 + 1] {partition_indices = [0, 0], timing = #hls.t<5 -> 7, 2, 1>} : memref<1024x1024xf32>
          %4 = arith.addf %3, %2 {timing = #hls.t<7 -> 12, 5, 1>} : f32
          %5 = affine.load %arg1[%arg4, %arg5 - 1] {partition_indices = [0, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<1024x1024xf32>
          %6 = arith.addf %5, %4 {timing = #hls.t<12 -> 17, 5, 1>} : f32
          %7 = affine.load %arg1[%arg4, %arg5] {partition_indices = [0, 0], timing = #hls.t<15 -> 17, 2, 1>} : memref<1024x1024xf32>
          %8 = arith.addf %7, %6 {timing = #hls.t<17 -> 22, 5, 1>} : f32
          %9 = affine.load %arg1[%arg4, %arg5 + 1] {partition_indices = [0, 0], timing = #hls.t<20 -> 22, 2, 1>} : memref<1024x1024xf32>
          %10 = arith.addf %9, %8 {timing = #hls.t<22 -> 27, 5, 1>} : f32
          %11 = affine.load %arg1[%arg4 + 1, %arg5 - 1] {partition_indices = [0, 0], timing = #hls.t<25 -> 27, 2, 1>} : memref<1024x1024xf32>
          %12 = arith.addf %11, %10 {timing = #hls.t<27 -> 32, 5, 1>} : f32
          %13 = affine.load %arg1[%arg4 + 1, %arg5] {partition_indices = [0, 0], timing = #hls.t<30 -> 32, 2, 1>} : memref<1024x1024xf32>
          %14 = arith.addf %13, %12 {timing = #hls.t<32 -> 37, 5, 1>} : f32
          %15 = affine.load %arg1[%arg4 + 1, %arg5 + 1] {partition_indices = [0, 0], timing = #hls.t<35 -> 37, 2, 1>} : memref<1024x1024xf32>
          %16 = arith.addf %15, %14 {timing = #hls.t<37 -> 42, 5, 1>} : f32
          %17 = arith.mulf %16, %arg0 {timing = #hls.t<42 -> 46, 4, 1>} : f32
          affine.store %17, %arg1[%arg4, %arg5] {partition_indices = [0, 0], timing = #hls.t<46 -> 47, 1, 1>} : memref<1024x1024xf32>
        } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=47, minII=47>, timing = #hls.t<0 -> 48130, 48130, 48130>}
      } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=48130, minII=48130>, timing = #hls.t<0 -> 49285122, 49285122, 49285122>}
    } {loop_info = #hls.l<flattenTripCount=1024, iterLatency=49285122, minII=49285122>, timing = #hls.t<0 -> 50467964930, 50467964930, 50467964930>}
    return {timing = #hls.t<50467964930 -> 50467964930, 0, 0>}
  }
}