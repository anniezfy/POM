module {
  func @jacobi(%arg0: f32, %arg1: memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>, %arg2: memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>) attributes {resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 33538067, 33538067, 33538067>, top_func} {
    affine.for %arg3 = 0 to 4096 {
      affine.for %arg4 = 0 to 2047 {
        %0 = affine.load %arg2[%arg4 * 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<8222 -> 8224, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %1 = affine.load %arg2[%arg4 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<8221 -> 8223, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %2 = arith.addf %0, %1 {timing = #hls.t<8216 -> 8221, 5, 1>} : f32
        %3 = affine.load %arg2[%arg4 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<8220 -> 8222, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %4 = arith.addf %3, %2 {timing = #hls.t<8211 -> 8216, 5, 1>} : f32
        %5 = arith.mulf %4, %arg0 {timing = #hls.t<8207 -> 8211, 4, 1>} : f32
        affine.store %5, %arg1[%arg4 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<8206 -> 8207, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %6 = arith.addf %1, %3 {timing = #hls.t<8215 -> 8220, 5, 1>} : f32
        %7 = affine.load %arg2[%arg4 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<8215 -> 8217, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %8 = arith.addf %7, %6 {timing = #hls.t<8210 -> 8215, 5, 1>} : f32
        %9 = arith.mulf %8, %arg0 {timing = #hls.t<8206 -> 8210, 4, 1>} : f32
        affine.store %9, %arg1[%arg4 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<8205 -> 8206, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=19, minII=4>, parallel, timing = #hls.t<8205 -> 16410, 8205, 8205>}
      affine.for %arg4 = 0 to 2047 {
        %0 = affine.load %arg1[%arg4 * 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %1 = affine.load %arg1[%arg4 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %2 = arith.addf %0, %1 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %3 = affine.load %arg1[%arg4 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %4 = arith.addf %3, %2 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %5 = arith.mulf %4, %arg0 {timing = #hls.t<2 -> 6, 4, 1>} : f32
        affine.store %5, %arg2[%arg4 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<1 -> 2, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %6 = arith.addf %1, %3 {timing = #hls.t<10 -> 15, 5, 1>} : f32
        %7 = affine.load %arg1[%arg4 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
        %8 = arith.addf %7, %6 {timing = #hls.t<5 -> 10, 5, 1>} : f32
        %9 = arith.mulf %8, %arg0 {timing = #hls.t<1 -> 5, 4, 1>} : f32
        affine.store %9, %arg2[%arg4 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=19, minII=4>, parallel, timing = #hls.t<0 -> 8205, 8205, 8205>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=8384512, iterLatency=19, minII=4>, resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 33538065, 33538065, 33538065>}
    return
  }
}