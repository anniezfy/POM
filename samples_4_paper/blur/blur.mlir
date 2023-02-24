module {
  func @blur(%arg0: f32, %arg1: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>) attributes {resource = #hls.r<lut=0, dsp=4, bram=0>, timing = #hls.t<0 -> 137304768573, 137304768573, 137304768573>, top_func} {
    affine.for %arg4 = 0 to 4096 {
      affine.for %arg5 = 0 to 2047 {
        affine.for %arg6 = 0 to 2047 {
          %0 = affine.load %arg1[%arg5 * 2, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [0, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %1 = affine.load %arg1[%arg5 * 2, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [0, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %2 = arith.addf %0, %1 : f32
          %3 = affine.load %arg1[%arg5 * 2, %arg6 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [0, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %4 = arith.addf %3, %2 : f32
          %5 = arith.divf %4, %arg0 : f32
          affine.store %5, %arg2[%arg5 * 2, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %6 = arith.addf %1, %3 : f32
          %7 = affine.load %arg1[%arg5 * 2, %arg6 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [0, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %8 = arith.addf %7, %6 : f32
          %9 = arith.divf %8, %arg0 : f32
          affine.store %9, %arg2[%arg5 * 2, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %10 = affine.load %arg1[%arg5 * 2 + 1, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [1, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %11 = affine.load %arg1[%arg5 * 2 + 1, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [1, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %12 = arith.addf %10, %11 : f32
          %13 = affine.load %arg1[%arg5 * 2 + 1, %arg6 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [1, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %14 = arith.addf %13, %12 : f32
          %15 = arith.divf %14, %arg0 : f32
          affine.store %15, %arg2[%arg5 * 2 + 1, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %16 = arith.addf %11, %13 : f32
          %17 = affine.load %arg1[%arg5 * 2 + 1, %arg6 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [1, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>>
          %18 = arith.addf %17, %16 : f32
          %19 = arith.divf %18, %arg0 : f32
          affine.store %19, %arg2[%arg5 * 2 + 1, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg4 = 0 to 4096 {
      affine.for %arg5 = 0 to 2047 {
        affine.for %arg6 = 0 to 2047 {
          %0 = affine.load %arg2[%arg5 * 2, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %1 = affine.load %arg2[%arg5 * 2 + 1, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %2 = arith.addf %0, %1 {timing = #hls.t<22 -> 27, 5, 1>} : f32
          %3 = affine.load %arg2[%arg5 * 2 + 2, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %4 = arith.addf %3, %2 {timing = #hls.t<17 -> 22, 5, 1>} : f32
          %5 = arith.divf %4, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
          affine.store %5, %arg3[%arg5 * 2, %arg6 * 2] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %6 = affine.load %arg2[%arg5 * 2, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %7 = affine.load %arg2[%arg5 * 2 + 1, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %8 = arith.addf %6, %7 {timing = #hls.t<22 -> 27, 5, 1>} : f32
          %9 = affine.load %arg2[%arg5 * 2 + 2, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %10 = arith.addf %9, %8 {timing = #hls.t<17 -> 22, 5, 1>} : f32
          %11 = arith.divf %10, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
          affine.store %11, %arg3[%arg5 * 2, %arg6 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %12 = arith.addf %1, %3 {timing = #hls.t<22 -> 27, 5, 1>} : f32
          %13 = affine.load %arg2[%arg5 * 2 + 3, %arg6 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %14 = arith.addf %13, %12 {timing = #hls.t<17 -> 22, 5, 1>} : f32
          %15 = arith.divf %14, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
          affine.store %15, %arg3[%arg5 * 2 + 1, %arg6 * 2] {partition_indices = [1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
          %16 = arith.addf %7, %9 {timing = #hls.t<22 -> 27, 5, 1>} : f32
          %17 = affine.load %arg2[%arg5 * 2 + 3, %arg6 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %18 = arith.addf %17, %16 {timing = #hls.t<17 -> 22, 5, 1>} : f32
          %19 = arith.divf %18, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
          affine.store %19, %arg3[%arg5 * 2 + 1, %arg6 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=31, minII=4>, parallel, timing = #hls.t<0 -> 8217, 8217, 8217>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=4190209, iterLatency=31, minII=4>, parallel, timing = #hls.t<0 -> 16760865, 16760865, 16760865>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=17163096064, iterLatency=31, minII=4>, resource = #hls.r<lut=0, dsp=4, bram=0>, timing = #hls.t<0 -> 68652384285, 68652384285, 68652384285>}
    return
  }
}