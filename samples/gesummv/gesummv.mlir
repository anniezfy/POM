module {
  func @gesummv(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg4: memref<4096x4096xf32>, %arg5: memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg6: memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg7: memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>) attributes {resource = #hls.r<lut=0, dsp=20, bram=0>, timing = #hls.t<0 -> 83890180, 83890180, 83890180>, top_func} {
    affine.for %arg8 = 0 to 2048 {
      affine.for %arg9 = 0 to 2048 {
        %0 = affine.load %arg2[%arg9 * 2, %arg8 * 2] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = affine.load %arg6[%arg8 * 2] {partition_indices = [0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<2 -> 6, 4, 1>} : f32
        %3 = affine.load %arg5[%arg9 * 2] {partition_indices = [0], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        affine.store %4, %arg5[%arg9 * 2] {partition_indices = [0], timing = #hls.t<11 -> 12, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %5 = affine.load %arg3[%arg9 * 2, %arg8 * 2] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %6 = arith.mulf %5, %1 {timing = #hls.t<2 -> 6, 4, 1>} : f32
        %7 = affine.load %arg7[%arg9 * 2] {partition_indices = [0], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %8 = arith.addf %6, %7 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        affine.store %8, %arg7[%arg9 * 2] {partition_indices = [0], timing = #hls.t<11 -> 12, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %9 = affine.load %arg2[%arg9 * 2 + 1, %arg8 * 2] {partition_indices = [1, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %10 = arith.mulf %9, %1 {timing = #hls.t<2 -> 6, 4, 1>} : f32
        %11 = affine.load %arg5[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %12 = arith.addf %10, %11 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        affine.store %12, %arg5[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<11 -> 12, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %13 = affine.load %arg3[%arg9 * 2 + 1, %arg8 * 2] {partition_indices = [1, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %14 = arith.mulf %13, %1 {timing = #hls.t<2 -> 6, 4, 1>} : f32
        %15 = affine.load %arg7[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %16 = arith.addf %14, %15 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        affine.store %16, %arg7[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<11 -> 12, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %17 = affine.load %arg2[%arg9 * 2, %arg8 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %18 = affine.load %arg6[%arg8 * 2 + 1] {partition_indices = [1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %19 = arith.mulf %17, %18 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %20 = affine.load %arg5[%arg9 * 2] {partition_indices = [0], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %21 = arith.addf %19, %20 {timing = #hls.t<14 -> 19, 5, 1>} : f32
        affine.store %21, %arg5[%arg9 * 2] {partition_indices = [0], timing = #hls.t<19 -> 20, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %22 = affine.load %arg3[%arg9 * 2, %arg8 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %23 = arith.mulf %22, %18 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %24 = affine.load %arg7[%arg9 * 2] {partition_indices = [0], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %25 = arith.addf %23, %24 {timing = #hls.t<14 -> 19, 5, 1>} : f32
        affine.store %25, %arg7[%arg9 * 2] {partition_indices = [0], timing = #hls.t<19 -> 20, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %26 = affine.load %arg2[%arg9 * 2 + 1, %arg8 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %27 = arith.mulf %26, %18 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %28 = affine.load %arg5[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %29 = arith.addf %27, %28 {timing = #hls.t<14 -> 19, 5, 1>} : f32
        affine.store %29, %arg5[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<19 -> 20, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %30 = affine.load %arg3[%arg9 * 2 + 1, %arg8 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %31 = arith.mulf %30, %18 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %32 = affine.load %arg7[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %33 = arith.addf %31, %32 {timing = #hls.t<14 -> 19, 5, 1>} : f32
        affine.store %33, %arg7[%arg9 * 2 + 1] {partition_indices = [1], timing = #hls.t<19 -> 20, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
      } {loop_info = #hls.l<flattenTripCount=2048, iterLatency=20, minII=20>, parallel, timing = #hls.t<0 -> 40962, 40962, 40962>}
    } {loop_info = #hls.l<flattenTripCount=2048, iterLatency=40962, minII=40962>, timing = #hls.t<0 -> 83890178, 83890178, 83890178>}
    return {timing = #hls.t<83890178 -> 83890178, 0, 0>}
  }
}