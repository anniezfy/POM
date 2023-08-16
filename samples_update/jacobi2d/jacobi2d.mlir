module {
  func @jacobi2d(%arg0: f32, %arg1: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>) attributes {resource = #hls.r<lut=0, dsp=20, bram=0>, timing = #hls.t<0 -> 205957152794, 205957152794, 205957152794>, top_func} {
    affine.for %arg3 = 0 to 4096 {
      affine.for %arg4 = 0 to 2047 {
        affine.for %arg5 = 0 to 2047 {
          %0 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471234 -> 142471236, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %1 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471233 -> 142471235, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %2 = arith.addf %0, %1 {timing = #hls.t<142471225 -> 142471230, 5, 1>} : f32
          %3 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471231 -> 142471233, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %4 = arith.addf %3, %2 {timing = #hls.t<142471220 -> 142471225, 5, 1>} : f32
          %5 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471229 -> 142471231, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %6 = arith.addf %5, %4 {timing = #hls.t<142471215 -> 142471220, 5, 1>} : f32
          %7 = affine.load %arg1[%arg4 * 2, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471225 -> 142471227, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %8 = arith.addf %7, %6 {timing = #hls.t<142471210 -> 142471215, 5, 1>} : f32
          %9 = arith.mulf %8, %arg0 {timing = #hls.t<142471206 -> 142471210, 4, 1>} : f32
          affine.store %9, %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471205 -> 142471206, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %10 = arith.addf %3, %0 {timing = #hls.t<142471224 -> 142471229, 5, 1>} : f32
          %11 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471224 -> 142471226, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %12 = arith.addf %11, %10 {timing = #hls.t<142471219 -> 142471224, 5, 1>} : f32
          %13 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471232 -> 142471234, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %14 = arith.addf %13, %12 {timing = #hls.t<142471214 -> 142471219, 5, 1>} : f32
          %15 = affine.load %arg1[%arg4 * 2, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471230 -> 142471232, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %16 = arith.addf %15, %14 {timing = #hls.t<142471209 -> 142471214, 5, 1>} : f32
          %17 = arith.mulf %16, %arg0 {timing = #hls.t<142471205 -> 142471209, 4, 1>} : f32
          affine.store %17, %arg2[%arg4 * 2 + 1, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471204 -> 142471205, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %18 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471228 -> 142471230, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %19 = arith.addf %5, %18 {timing = #hls.t<142471223 -> 142471228, 5, 1>} : f32
          %20 = arith.addf %13, %19 {timing = #hls.t<142471218 -> 142471223, 5, 1>} : f32
          %21 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471218 -> 142471220, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %22 = arith.addf %21, %20 {timing = #hls.t<142471213 -> 142471218, 5, 1>} : f32
          %23 = arith.addf %0, %22 {timing = #hls.t<142471208 -> 142471213, 5, 1>} : f32
          %24 = arith.mulf %23, %arg0 {timing = #hls.t<142471204 -> 142471208, 4, 1>} : f32
          affine.store %24, %arg2[%arg4 * 2 + 2, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471203 -> 142471204, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %25 = arith.addf %13, %5 {timing = #hls.t<142471222 -> 142471227, 5, 1>} : f32
          %26 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471222 -> 142471224, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %27 = arith.addf %26, %25 {timing = #hls.t<142471217 -> 142471222, 5, 1>} : f32
          %28 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471217 -> 142471219, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %29 = arith.addf %28, %27 {timing = #hls.t<142471212 -> 142471217, 5, 1>} : f32
          %30 = arith.addf %3, %29 {timing = #hls.t<142471207 -> 142471212, 5, 1>} : f32
          %31 = arith.mulf %30, %arg0 {timing = #hls.t<142471203 -> 142471207, 4, 1>} : f32
          affine.store %31, %arg2[%arg4 * 2 + 2, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<142471202 -> 142471203, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=34, minII=12>, parallel, timing = #hls.t<142471202 -> 142495790, 24588, 24588>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=4190209, iterLatency=34, minII=12>, parallel, timing = #hls.t<142471202 -> 192753734, 50282532, 50282532>}
      affine.for %arg4 = 0 to 2047 {
        affine.for %arg5 = 0 to 2047 {
          %0 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %1 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %2 = arith.addf %0, %1 {timing = #hls.t<23 -> 28, 5, 1>} : f32
          %3 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %4 = arith.addf %3, %2 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          %5 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %6 = arith.addf %5, %4 {timing = #hls.t<13 -> 18, 5, 1>} : f32
          %7 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %8 = arith.addf %7, %6 {timing = #hls.t<8 -> 13, 5, 1>} : f32
          %9 = arith.mulf %8, %arg0 {timing = #hls.t<4 -> 8, 4, 1>} : f32
          affine.store %9, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<3 -> 4, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %10 = arith.addf %3, %0 {timing = #hls.t<22 -> 27, 5, 1>} : f32
          %11 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %12 = arith.addf %11, %10 {timing = #hls.t<17 -> 22, 5, 1>} : f32
          %13 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %14 = arith.addf %13, %12 {timing = #hls.t<12 -> 17, 5, 1>} : f32
          %15 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %16 = arith.addf %15, %14 {timing = #hls.t<7 -> 12, 5, 1>} : f32
          %17 = arith.mulf %16, %arg0 {timing = #hls.t<3 -> 7, 4, 1>} : f32
          affine.store %17, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<2 -> 3, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %18 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %19 = arith.addf %5, %18 {timing = #hls.t<21 -> 26, 5, 1>} : f32
          %20 = arith.addf %13, %19 {timing = #hls.t<16 -> 21, 5, 1>} : f32
          %21 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %22 = arith.addf %21, %20 {timing = #hls.t<11 -> 16, 5, 1>} : f32
          %23 = arith.addf %0, %22 {timing = #hls.t<6 -> 11, 5, 1>} : f32
          %24 = arith.mulf %23, %arg0 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          affine.store %24, %arg1[%arg4 * 2 + 2, %arg5 * 2 + 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<1 -> 2, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %25 = arith.addf %13, %5 {timing = #hls.t<20 -> 25, 5, 1>} : f32
          %26 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 3] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %27 = arith.addf %26, %25 {timing = #hls.t<15 -> 20, 5, 1>} : f32
          %28 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
          %29 = arith.addf %28, %27 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          %30 = arith.addf %3, %29 {timing = #hls.t<5 -> 10, 5, 1>} : f32
          %31 = arith.mulf %30, %arg0 {timing = #hls.t<1 -> 5, 4, 1>} : f32
          affine.store %31, %arg1[%arg4 * 2 + 2, %arg5 * 2 + 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>>
        } {loop_info = #hls.l<flattenTripCount=2047, iterLatency=34, minII=34>, parallel, timing = #hls.t<0 -> 69600, 69600, 69600>}
      } {loop_info = #hls.l<flattenTripCount=2047, iterLatency=69600, minII=69600>, parallel, timing = #hls.t<0 -> 142471202, 142471202, 142471202>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=17163096064, iterLatency=34, minII=12>, resource = #hls.r<lut=0, dsp=20, bram=0>, timing = #hls.t<0 -> 205957152792, 205957152792, 205957152792>}
    return
  }
}