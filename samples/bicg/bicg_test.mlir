module {
  func @bicg_test(%arg0: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg1: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg2: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg3: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (0, d0)>>) attributes {resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 218112004, 218112004, 218112004>, top_func} {
    affine.for %arg5 = 0 to 4096 {
      affine.for %arg6 = 0 to 4096 {
        %0 = affine.load %arg0[%arg5, %arg6] {partition_indices = [0, 0], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %1 = affine.load %arg3[%arg5] {partition_indices = [0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %3 = affine.load %arg4[%arg6] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %4, %arg4[%arg6] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %5 = affine.load %arg0[%arg6, %arg5] {partition_indices = [0, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %6 = affine.load %arg1[%arg5] {partition_indices = [0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %7 = arith.mulf %5, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %8 = affine.load %arg2[%arg6] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %9 = arith.addf %7, %8 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %9, %arg2[%arg6] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
      } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=13, minII=13>, parallel, timing = #hls.t<0 -> 53250, 53250, 53250>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=53250, minII=53250>, resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 218112002, 218112002, 218112002>}
    return
  }
}