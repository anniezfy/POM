module {
  func @"2mm"(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg4: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>, %arg5: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>, %arg6: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>, %arg7: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>) attributes {resource = #hls.r<lut=0, dsp=43, bram=0>, timing = #hls.t<0 -> 17197695018, 17197695018, 17197695018>, top_func} {
    affine.for %arg8 = 0 to 2048 {
      affine.for %arg9 = 0 to 512 {
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8 + 2] {partition_indices = [0, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8 + 3] {partition_indices = [0, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8 + 4] {partition_indices = [0, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8 + 5] {partition_indices = [0, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8 + 6] {partition_indices = [0, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2, %arg9 * 8 + 7] {partition_indices = [0, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8] {partition_indices = [1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8 + 1] {partition_indices = [1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8 + 2] {partition_indices = [1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8 + 3] {partition_indices = [1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8 + 4] {partition_indices = [1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8 + 5] {partition_indices = [1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8 + 6] {partition_indices = [1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        affine.store %arg2, %arg7[%arg8 * 2 + 1, %arg9 * 8 + 7] {partition_indices = [1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        affine.for %arg10 = 0 to 512 {
          %0 = affine.load %arg3[%arg9, %arg8] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
          %1 = arith.mulf %arg0, %0 : f32
          %2 = affine.load %arg4[%arg8, %arg10 * 8] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %3 = arith.mulf %2, %1 : f32
          %4 = affine.load %arg7[%arg9, %arg10 * 8] {max_mux_size = 2 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %5 = arith.addf %3, %4 : f32
          affine.store %5, %arg7[%arg9, %arg10 * 8] {max_mux_size = 2 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %6 = affine.load %arg4[%arg8, %arg10 * 8 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %7 = arith.mulf %6, %1 : f32
          %8 = affine.load %arg7[%arg9, %arg10 * 8 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %9 = arith.addf %7, %8 : f32
          affine.store %9, %arg7[%arg9, %arg10 * 8 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %10 = affine.load %arg4[%arg8, %arg10 * 8 + 2] {partition_indices = [0, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %11 = arith.mulf %10, %1 : f32
          %12 = affine.load %arg7[%arg9, %arg10 * 8 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %13 = arith.addf %11, %12 : f32
          affine.store %13, %arg7[%arg9, %arg10 * 8 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %14 = affine.load %arg4[%arg8, %arg10 * 8 + 3] {partition_indices = [0, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %15 = arith.mulf %14, %1 : f32
          %16 = affine.load %arg7[%arg9, %arg10 * 8 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %17 = arith.addf %15, %16 : f32
          affine.store %17, %arg7[%arg9, %arg10 * 8 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %18 = affine.load %arg4[%arg8, %arg10 * 8 + 4] {partition_indices = [0, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %19 = arith.mulf %18, %1 : f32
          %20 = affine.load %arg7[%arg9, %arg10 * 8 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %21 = arith.addf %19, %20 : f32
          affine.store %21, %arg7[%arg9, %arg10 * 8 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %22 = affine.load %arg4[%arg8, %arg10 * 8 + 5] {partition_indices = [0, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %23 = arith.mulf %22, %1 : f32
          %24 = affine.load %arg7[%arg9, %arg10 * 8 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %25 = arith.addf %23, %24 : f32
          affine.store %25, %arg7[%arg9, %arg10 * 8 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %26 = affine.load %arg4[%arg8, %arg10 * 8 + 6] {partition_indices = [0, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %27 = arith.mulf %26, %1 : f32
          %28 = affine.load %arg7[%arg9, %arg10 * 8 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %29 = arith.addf %27, %28 : f32
          affine.store %29, %arg7[%arg9, %arg10 * 8 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %30 = affine.load %arg4[%arg8, %arg10 * 8 + 7] {partition_indices = [0, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %31 = arith.mulf %30, %1 : f32
          %32 = affine.load %arg7[%arg9, %arg10 * 8 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %33 = arith.addf %31, %32 : f32
          affine.store %33, %arg7[%arg9, %arg10 * 8 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        %0 = affine.load %arg6[%arg8, %arg9] {max_mux_size = 8 : i64, partition_indices = [0, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg6[%arg8, %arg9] {max_mux_size = 8 : i64, partition_indices = [0, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        affine.for %arg10 = 0 to 512 {
          %0 = affine.load %arg7[%arg9, %arg8] {max_mux_size = 8 : i64, partition_indices = [-1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %1 = affine.load %arg5[%arg8, %arg10 * 8] {partition_indices = [0, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %3 = affine.load %arg6[%arg9, %arg10 * 8] {partition_indices = [0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %4, %arg6[%arg9, %arg10 * 8] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %5 = affine.load %arg5[%arg8, %arg10 * 8 + 1] {partition_indices = [0, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %6 = arith.mulf %0, %5 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %7 = affine.load %arg6[%arg9, %arg10 * 8 + 1] {partition_indices = [0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %8 = arith.addf %6, %7 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %8, %arg6[%arg9, %arg10 * 8 + 1] {partition_indices = [0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %9 = affine.load %arg5[%arg8, %arg10 * 8 + 2] {partition_indices = [0, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %10 = arith.mulf %0, %9 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %11 = affine.load %arg6[%arg9, %arg10 * 8 + 2] {partition_indices = [0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %12 = arith.addf %10, %11 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %12, %arg6[%arg9, %arg10 * 8 + 2] {partition_indices = [0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %13 = affine.load %arg5[%arg8, %arg10 * 8 + 3] {partition_indices = [0, 3], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %14 = arith.mulf %0, %13 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %15 = affine.load %arg6[%arg9, %arg10 * 8 + 3] {partition_indices = [0, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %16 = arith.addf %14, %15 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %16, %arg6[%arg9, %arg10 * 8 + 3] {partition_indices = [0, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %17 = affine.load %arg5[%arg8, %arg10 * 8 + 4] {partition_indices = [0, 4], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %18 = arith.mulf %0, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %19 = affine.load %arg6[%arg9, %arg10 * 8 + 4] {partition_indices = [0, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %20, %arg6[%arg9, %arg10 * 8 + 4] {partition_indices = [0, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %21 = affine.load %arg5[%arg8, %arg10 * 8 + 5] {partition_indices = [0, 5], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %22 = arith.mulf %0, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %23 = affine.load %arg6[%arg9, %arg10 * 8 + 5] {partition_indices = [0, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %24 = arith.addf %22, %23 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %24, %arg6[%arg9, %arg10 * 8 + 5] {partition_indices = [0, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %25 = affine.load %arg5[%arg8, %arg10 * 8 + 6] {partition_indices = [0, 6], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %26 = arith.mulf %0, %25 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %27 = affine.load %arg6[%arg9, %arg10 * 8 + 6] {partition_indices = [0, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %28 = arith.addf %26, %27 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %28, %arg6[%arg9, %arg10 * 8 + 6] {partition_indices = [0, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %29 = affine.load %arg5[%arg8, %arg10 * 8 + 7] {partition_indices = [0, 7], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %30 = arith.mulf %0, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %31 = affine.load %arg6[%arg9, %arg10 * 8 + 7] {partition_indices = [0, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %32 = arith.addf %30, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %32, %arg6[%arg9, %arg10 * 8 + 7] {partition_indices = [0, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=512, iterLatency=12, minII=1>, parallel, timing = #hls.t<0 -> 525, 525, 525>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=2097152, iterLatency=12, minII=1>, parallel, timing = #hls.t<0 -> 2097165, 2097165, 2097165>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=8589934592, iterLatency=12, minII=1>, resource = #hls.r<lut=0, dsp=40, bram=0>, timing = #hls.t<0 -> 8589934605, 8589934605, 8589934605>}
    return
  }
}