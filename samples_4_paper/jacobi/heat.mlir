module {
  func @heat(%arg0: f32, %arg1: f32, %arg2: memref<1024xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg3: memref<1024xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>) attributes {resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 33538071, 33538071, 33538071>, top_func} {
    affine.for %arg4 = 0 to 4096 {
      affine.for %arg5 = 0 to 2047 {
        %0 = affine.load %arg3[%arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<4118 -> 4120, 2, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %1 = arith.mulf %arg1, %0 {timing = #hls.t<4113 -> 4117, 4, 1>} : f32
        %2 = affine.load %arg3[%arg5 * 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<4119 -> 4121, 2, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %3 = arith.subf %1, %2 {timing = #hls.t<4108 -> 4113, 5, 1>} : f32
        %4 = affine.load %arg3[%arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<4117 -> 4119, 2, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %5 = arith.addf %4, %3 {timing = #hls.t<4103 -> 4108, 5, 1>} : f32
        %6 = arith.mulf %5, %arg0 {timing = #hls.t<4099 -> 4103, 4, 1>} : f32
        affine.store %6, %arg2[%arg5 * 2 + 1] {partition_indices = [1], timing = #hls.t<4098 -> 4099, 1, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %7 = arith.mulf %arg1, %4 {timing = #hls.t<4113 -> 4117, 4, 1>} : f32
        %8 = arith.subf %7, %0 {timing = #hls.t<4108 -> 4113, 5, 1>} : f32
        %9 = affine.load %arg3[%arg5 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<4108 -> 4110, 2, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %10 = arith.addf %9, %8 {timing = #hls.t<4103 -> 4108, 5, 1>} : f32
        %11 = arith.mulf %10, %arg0 {timing = #hls.t<4099 -> 4103, 4, 1>} : f32
        affine.store %11, %arg2[%arg5 * 2 + 2] {partition_indices = [0], timing = #hls.t<4098 -> 4099, 1, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=23, minII=4>, parallel, timing = #hls.t<4098 -> 12307, 8209, 8209>}
      affine.for %arg5 = 0 to 2047 {
        %0 = affine.load %arg2[%arg5 * 2 + 1] {partition_indices = [1], timing = #hls.t<2 -> 4, 2, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        affine.store %0, %arg3[%arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<1 -> 2, 1, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %1 = affine.load %arg2[%arg5 * 2 + 2] {partition_indices = [0], timing = #hls.t<1 -> 3, 2, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        affine.store %1, %arg3[%arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<0 -> 1, 1, 1>} : memref<1024xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=4, minII=2>, parallel, timing = #hls.t<0 -> 4098, 4098, 4098>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=8384512, iterLatency=23, minII=4>, resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 33538069, 33538069, 33538069>}
    return
  }
}