module {
  func @"3mm"(%arg0: f32, %arg1: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 2, d0, d1 floordiv 2)>>, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg4: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>, %arg5: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>, %arg6: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>, %arg7: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>) attributes {resource = #hls.r<lut=0, dsp=80, bram=0>, timing = #hls.t<0 -> 12918980662, 12918980662, 12918980662>, top_func} {
    affine.for %arg8 = 0 to 2048 {
      affine.for %arg9 = 0 to 256 {
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 2] {partition_indices = [0, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 3] {partition_indices = [0, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 4] {partition_indices = [0, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 5] {partition_indices = [0, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 6] {partition_indices = [0, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 7] {partition_indices = [0, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 8] {partition_indices = [0, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 9] {partition_indices = [0, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 10] {partition_indices = [0, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 11] {partition_indices = [0, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 12] {partition_indices = [0, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 13] {partition_indices = [0, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 14] {partition_indices = [0, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 15] {partition_indices = [0, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16] {partition_indices = [1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 1] {partition_indices = [1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 2] {partition_indices = [1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 3] {partition_indices = [1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 4] {partition_indices = [1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 5] {partition_indices = [1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 6] {partition_indices = [1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 7] {partition_indices = [1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 8] {partition_indices = [1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 9] {partition_indices = [1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 10] {partition_indices = [1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 11] {partition_indices = [1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 12] {partition_indices = [1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 13] {partition_indices = [1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 14] {partition_indices = [1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 15] {partition_indices = [1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 2048 {
      affine.for %arg9 = 0 to 4096 {
        affine.for %arg10 = 0 to 256 {
          %0 = affine.load %arg1[%arg9, %arg8 * 2] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 2, d0, d1 floordiv 2)>>
          %1 = affine.load %arg2[%arg8 * 2, %arg10 * 16] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg5[%arg9, %arg10 * 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg5[%arg9, %arg10 * 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %5 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %6 = arith.mulf %0, %5 : f32
          %7 = affine.load %arg5[%arg9, %arg10 * 16 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %arg5[%arg9, %arg10 * 16 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %9 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 2] {partition_indices = [0, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %10 = arith.mulf %0, %9 : f32
          %11 = affine.load %arg5[%arg9, %arg10 * 16 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %12 = arith.addf %10, %11 : f32
          affine.store %12, %arg5[%arg9, %arg10 * 16 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %13 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 3] {partition_indices = [0, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %14 = arith.mulf %0, %13 : f32
          %15 = affine.load %arg5[%arg9, %arg10 * 16 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %16 = arith.addf %14, %15 : f32
          affine.store %16, %arg5[%arg9, %arg10 * 16 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %17 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 4] {partition_indices = [0, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %18 = arith.mulf %0, %17 : f32
          %19 = affine.load %arg5[%arg9, %arg10 * 16 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %20 = arith.addf %18, %19 : f32
          affine.store %20, %arg5[%arg9, %arg10 * 16 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %21 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 5] {partition_indices = [0, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %22 = arith.mulf %0, %21 : f32
          %23 = affine.load %arg5[%arg9, %arg10 * 16 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %24 = arith.addf %22, %23 : f32
          affine.store %24, %arg5[%arg9, %arg10 * 16 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %25 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 6] {partition_indices = [0, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %26 = arith.mulf %0, %25 : f32
          %27 = affine.load %arg5[%arg9, %arg10 * 16 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %28 = arith.addf %26, %27 : f32
          affine.store %28, %arg5[%arg9, %arg10 * 16 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %29 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 7] {partition_indices = [0, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %30 = arith.mulf %0, %29 : f32
          %31 = affine.load %arg5[%arg9, %arg10 * 16 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %32 = arith.addf %30, %31 : f32
          affine.store %32, %arg5[%arg9, %arg10 * 16 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %33 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 8] {partition_indices = [0, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %34 = arith.mulf %0, %33 : f32
          %35 = affine.load %arg5[%arg9, %arg10 * 16 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %36 = arith.addf %34, %35 : f32
          affine.store %36, %arg5[%arg9, %arg10 * 16 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %37 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 9] {partition_indices = [0, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %38 = arith.mulf %0, %37 : f32
          %39 = affine.load %arg5[%arg9, %arg10 * 16 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %40 = arith.addf %38, %39 : f32
          affine.store %40, %arg5[%arg9, %arg10 * 16 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %41 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 10] {partition_indices = [0, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %42 = arith.mulf %0, %41 : f32
          %43 = affine.load %arg5[%arg9, %arg10 * 16 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %44 = arith.addf %42, %43 : f32
          affine.store %44, %arg5[%arg9, %arg10 * 16 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %45 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 11] {partition_indices = [0, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %46 = arith.mulf %0, %45 : f32
          %47 = affine.load %arg5[%arg9, %arg10 * 16 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %48 = arith.addf %46, %47 : f32
          affine.store %48, %arg5[%arg9, %arg10 * 16 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %49 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 12] {partition_indices = [0, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %50 = arith.mulf %0, %49 : f32
          %51 = affine.load %arg5[%arg9, %arg10 * 16 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %52 = arith.addf %50, %51 : f32
          affine.store %52, %arg5[%arg9, %arg10 * 16 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %53 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 13] {partition_indices = [0, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %54 = arith.mulf %0, %53 : f32
          %55 = affine.load %arg5[%arg9, %arg10 * 16 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %56 = arith.addf %54, %55 : f32
          affine.store %56, %arg5[%arg9, %arg10 * 16 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %57 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 14] {partition_indices = [0, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %58 = arith.mulf %0, %57 : f32
          %59 = affine.load %arg5[%arg9, %arg10 * 16 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %60 = arith.addf %58, %59 : f32
          affine.store %60, %arg5[%arg9, %arg10 * 16 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %61 = affine.load %arg2[%arg8 * 2, %arg10 * 16 + 15] {partition_indices = [0, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %62 = arith.mulf %0, %61 : f32
          %63 = affine.load %arg5[%arg9, %arg10 * 16 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %64 = arith.addf %62, %63 : f32
          affine.store %64, %arg5[%arg9, %arg10 * 16 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %65 = affine.load %arg1[%arg9, %arg8 * 2 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 2, d0, d1 floordiv 2)>>
          %66 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16] {partition_indices = [1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %67 = arith.mulf %65, %66 : f32
          %68 = affine.load %arg5[%arg9, %arg10 * 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %69 = arith.addf %67, %68 : f32
          affine.store %69, %arg5[%arg9, %arg10 * 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %70 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 1] {partition_indices = [1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %71 = arith.mulf %65, %70 : f32
          %72 = affine.load %arg5[%arg9, %arg10 * 16 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %73 = arith.addf %71, %72 : f32
          affine.store %73, %arg5[%arg9, %arg10 * 16 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %74 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 2] {partition_indices = [1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %75 = arith.mulf %65, %74 : f32
          %76 = affine.load %arg5[%arg9, %arg10 * 16 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %77 = arith.addf %75, %76 : f32
          affine.store %77, %arg5[%arg9, %arg10 * 16 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %78 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 3] {partition_indices = [1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %79 = arith.mulf %65, %78 : f32
          %80 = affine.load %arg5[%arg9, %arg10 * 16 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %81 = arith.addf %79, %80 : f32
          affine.store %81, %arg5[%arg9, %arg10 * 16 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %82 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 4] {partition_indices = [1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %83 = arith.mulf %65, %82 : f32
          %84 = affine.load %arg5[%arg9, %arg10 * 16 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %85 = arith.addf %83, %84 : f32
          affine.store %85, %arg5[%arg9, %arg10 * 16 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %86 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 5] {partition_indices = [1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %87 = arith.mulf %65, %86 : f32
          %88 = affine.load %arg5[%arg9, %arg10 * 16 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %89 = arith.addf %87, %88 : f32
          affine.store %89, %arg5[%arg9, %arg10 * 16 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %90 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 6] {partition_indices = [1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %91 = arith.mulf %65, %90 : f32
          %92 = affine.load %arg5[%arg9, %arg10 * 16 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %93 = arith.addf %91, %92 : f32
          affine.store %93, %arg5[%arg9, %arg10 * 16 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %94 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 7] {partition_indices = [1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %95 = arith.mulf %65, %94 : f32
          %96 = affine.load %arg5[%arg9, %arg10 * 16 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %97 = arith.addf %95, %96 : f32
          affine.store %97, %arg5[%arg9, %arg10 * 16 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %98 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 8] {partition_indices = [1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %99 = arith.mulf %65, %98 : f32
          %100 = affine.load %arg5[%arg9, %arg10 * 16 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %101 = arith.addf %99, %100 : f32
          affine.store %101, %arg5[%arg9, %arg10 * 16 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %102 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 9] {partition_indices = [1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %103 = arith.mulf %65, %102 : f32
          %104 = affine.load %arg5[%arg9, %arg10 * 16 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %105 = arith.addf %103, %104 : f32
          affine.store %105, %arg5[%arg9, %arg10 * 16 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %106 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 10] {partition_indices = [1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %107 = arith.mulf %65, %106 : f32
          %108 = affine.load %arg5[%arg9, %arg10 * 16 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %109 = arith.addf %107, %108 : f32
          affine.store %109, %arg5[%arg9, %arg10 * 16 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %110 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 11] {partition_indices = [1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %111 = arith.mulf %65, %110 : f32
          %112 = affine.load %arg5[%arg9, %arg10 * 16 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %113 = arith.addf %111, %112 : f32
          affine.store %113, %arg5[%arg9, %arg10 * 16 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %114 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 12] {partition_indices = [1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %115 = arith.mulf %65, %114 : f32
          %116 = affine.load %arg5[%arg9, %arg10 * 16 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %117 = arith.addf %115, %116 : f32
          affine.store %117, %arg5[%arg9, %arg10 * 16 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %118 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 13] {partition_indices = [1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %119 = arith.mulf %65, %118 : f32
          %120 = affine.load %arg5[%arg9, %arg10 * 16 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %121 = arith.addf %119, %120 : f32
          affine.store %121, %arg5[%arg9, %arg10 * 16 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %122 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 14] {partition_indices = [1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %123 = arith.mulf %65, %122 : f32
          %124 = affine.load %arg5[%arg9, %arg10 * 16 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %125 = arith.addf %123, %124 : f32
          affine.store %125, %arg5[%arg9, %arg10 * 16 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %126 = affine.load %arg2[%arg8 * 2 + 1, %arg10 * 16 + 15] {partition_indices = [1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %127 = arith.mulf %65, %126 : f32
          %128 = affine.load %arg5[%arg9, %arg10 * 16 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %129 = arith.addf %127, %128 : f32
          affine.store %129, %arg5[%arg9, %arg10 * 16 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        affine.store %arg0, %arg6[%arg8, %arg9] {max_mux_size = 8 : i64, partition_indices = [-1, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 2048 {
        affine.for %arg10 = 0 to 512 {
          %0 = affine.load %arg3[%arg9 * 2, %arg8] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %1 = affine.load %arg4[%arg8, %arg10 * 8] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg6[%arg9 * 2, %arg10 * 8] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg6[%arg9 * 2, %arg10 * 8] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %5 = affine.load %arg4[%arg8, %arg10 * 8 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %6 = arith.mulf %0, %5 : f32
          %7 = affine.load %arg6[%arg9 * 2, %arg10 * 8 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %arg6[%arg9 * 2, %arg10 * 8 + 1] {partition_indices = [0, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %9 = affine.load %arg4[%arg8, %arg10 * 8 + 2] {partition_indices = [0, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %10 = arith.mulf %0, %9 : f32
          %11 = affine.load %arg6[%arg9 * 2, %arg10 * 8 + 2] {partition_indices = [0, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %12 = arith.addf %10, %11 : f32
          affine.store %12, %arg6[%arg9 * 2, %arg10 * 8 + 2] {partition_indices = [0, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %13 = affine.load %arg4[%arg8, %arg10 * 8 + 3] {partition_indices = [0, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %14 = arith.mulf %0, %13 : f32
          %15 = affine.load %arg6[%arg9 * 2, %arg10 * 8 + 3] {partition_indices = [0, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %16 = arith.addf %14, %15 : f32
          affine.store %16, %arg6[%arg9 * 2, %arg10 * 8 + 3] {partition_indices = [0, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %17 = affine.load %arg4[%arg8, %arg10 * 8 + 4] {partition_indices = [0, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %18 = arith.mulf %0, %17 : f32
          %19 = affine.load %arg6[%arg9 * 2, %arg10 * 8 + 4] {partition_indices = [0, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %20 = arith.addf %18, %19 : f32
          affine.store %20, %arg6[%arg9 * 2, %arg10 * 8 + 4] {partition_indices = [0, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %21 = affine.load %arg4[%arg8, %arg10 * 8 + 5] {partition_indices = [0, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %22 = arith.mulf %0, %21 : f32
          %23 = affine.load %arg6[%arg9 * 2, %arg10 * 8 + 5] {partition_indices = [0, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %24 = arith.addf %22, %23 : f32
          affine.store %24, %arg6[%arg9 * 2, %arg10 * 8 + 5] {partition_indices = [0, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %25 = affine.load %arg4[%arg8, %arg10 * 8 + 6] {partition_indices = [0, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %26 = arith.mulf %0, %25 : f32
          %27 = affine.load %arg6[%arg9 * 2, %arg10 * 8 + 6] {partition_indices = [0, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %28 = arith.addf %26, %27 : f32
          affine.store %28, %arg6[%arg9 * 2, %arg10 * 8 + 6] {partition_indices = [0, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %29 = affine.load %arg4[%arg8, %arg10 * 8 + 7] {partition_indices = [0, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %30 = arith.mulf %0, %29 : f32
          %31 = affine.load %arg6[%arg9 * 2, %arg10 * 8 + 7] {partition_indices = [0, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %32 = arith.addf %30, %31 : f32
          affine.store %32, %arg6[%arg9 * 2, %arg10 * 8 + 7] {partition_indices = [0, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %33 = affine.load %arg3[%arg9 * 2 + 1, %arg8] {partition_indices = [1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %34 = arith.mulf %33, %1 : f32
          %35 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8] {partition_indices = [1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %36 = arith.addf %34, %35 : f32
          affine.store %36, %arg6[%arg9 * 2 + 1, %arg10 * 8] {partition_indices = [1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %37 = arith.mulf %33, %5 : f32
          %38 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8 + 1] {partition_indices = [1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %39 = arith.addf %37, %38 : f32
          affine.store %39, %arg6[%arg9 * 2 + 1, %arg10 * 8 + 1] {partition_indices = [1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %40 = arith.mulf %33, %9 : f32
          %41 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8 + 2] {partition_indices = [1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %42 = arith.addf %40, %41 : f32
          affine.store %42, %arg6[%arg9 * 2 + 1, %arg10 * 8 + 2] {partition_indices = [1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %43 = arith.mulf %33, %13 : f32
          %44 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8 + 3] {partition_indices = [1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %45 = arith.addf %43, %44 : f32
          affine.store %45, %arg6[%arg9 * 2 + 1, %arg10 * 8 + 3] {partition_indices = [1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %46 = arith.mulf %33, %17 : f32
          %47 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8 + 4] {partition_indices = [1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %48 = arith.addf %46, %47 : f32
          affine.store %48, %arg6[%arg9 * 2 + 1, %arg10 * 8 + 4] {partition_indices = [1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %49 = arith.mulf %33, %21 : f32
          %50 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8 + 5] {partition_indices = [1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %51 = arith.addf %49, %50 : f32
          affine.store %51, %arg6[%arg9 * 2 + 1, %arg10 * 8 + 5] {partition_indices = [1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %52 = arith.mulf %33, %25 : f32
          %53 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8 + 6] {partition_indices = [1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %54 = arith.addf %52, %53 : f32
          affine.store %54, %arg6[%arg9 * 2 + 1, %arg10 * 8 + 6] {partition_indices = [1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %55 = arith.mulf %33, %29 : f32
          %56 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 8 + 7] {partition_indices = [1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %57 = arith.addf %55, %56 : f32
          affine.store %57, %arg6[%arg9 * 2 + 1, %arg10 * 8 + 7] {partition_indices = [1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        affine.store %arg0, %arg7[%arg8, %arg9] {max_mux_size = 8 : i64, partition_indices = [-1, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 2048 {
        affine.for %arg10 = 0 to 512 {
          %0 = affine.load %arg5[%arg9 * 2, %arg8] {max_mux_size = 16 : i64, partition_indices = [0, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %1 = affine.load %arg6[%arg8, %arg10 * 8] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %3 = affine.load %arg7[%arg9 * 2, %arg10 * 8] {partition_indices = [0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %4, %arg7[%arg9 * 2, %arg10 * 8] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %5 = affine.load %arg6[%arg8, %arg10 * 8 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %6 = arith.mulf %0, %5 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %7 = affine.load %arg7[%arg9 * 2, %arg10 * 8 + 1] {partition_indices = [0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %8 = arith.addf %6, %7 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %8, %arg7[%arg9 * 2, %arg10 * 8 + 1] {partition_indices = [0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %9 = affine.load %arg6[%arg8, %arg10 * 8 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %10 = arith.mulf %0, %9 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %11 = affine.load %arg7[%arg9 * 2, %arg10 * 8 + 2] {partition_indices = [0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %12 = arith.addf %10, %11 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %12, %arg7[%arg9 * 2, %arg10 * 8 + 2] {partition_indices = [0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %13 = affine.load %arg6[%arg8, %arg10 * 8 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %14 = arith.mulf %0, %13 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %15 = affine.load %arg7[%arg9 * 2, %arg10 * 8 + 3] {partition_indices = [0, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %16 = arith.addf %14, %15 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %16, %arg7[%arg9 * 2, %arg10 * 8 + 3] {partition_indices = [0, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %17 = affine.load %arg6[%arg8, %arg10 * 8 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %18 = arith.mulf %0, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %19 = affine.load %arg7[%arg9 * 2, %arg10 * 8 + 4] {partition_indices = [0, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %20, %arg7[%arg9 * 2, %arg10 * 8 + 4] {partition_indices = [0, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %21 = affine.load %arg6[%arg8, %arg10 * 8 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %22 = arith.mulf %0, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %23 = affine.load %arg7[%arg9 * 2, %arg10 * 8 + 5] {partition_indices = [0, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %24 = arith.addf %22, %23 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %24, %arg7[%arg9 * 2, %arg10 * 8 + 5] {partition_indices = [0, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %25 = affine.load %arg6[%arg8, %arg10 * 8 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %26 = arith.mulf %0, %25 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %27 = affine.load %arg7[%arg9 * 2, %arg10 * 8 + 6] {partition_indices = [0, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %28 = arith.addf %26, %27 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %28, %arg7[%arg9 * 2, %arg10 * 8 + 6] {partition_indices = [0, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %29 = affine.load %arg6[%arg8, %arg10 * 8 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %30 = arith.mulf %0, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %31 = affine.load %arg7[%arg9 * 2, %arg10 * 8 + 7] {partition_indices = [0, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %32 = arith.addf %30, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %32, %arg7[%arg9 * 2, %arg10 * 8 + 7] {partition_indices = [0, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %33 = affine.load %arg5[%arg9 * 2 + 1, %arg8] {max_mux_size = 16 : i64, partition_indices = [1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %34 = arith.mulf %33, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %35 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8] {partition_indices = [1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %36 = arith.addf %34, %35 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %36, %arg7[%arg9 * 2 + 1, %arg10 * 8] {partition_indices = [1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %37 = arith.mulf %33, %5 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %38 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8 + 1] {partition_indices = [1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %39 = arith.addf %37, %38 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %39, %arg7[%arg9 * 2 + 1, %arg10 * 8 + 1] {partition_indices = [1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %40 = arith.mulf %33, %9 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %41 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8 + 2] {partition_indices = [1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %42 = arith.addf %40, %41 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %42, %arg7[%arg9 * 2 + 1, %arg10 * 8 + 2] {partition_indices = [1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %43 = arith.mulf %33, %13 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %44 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8 + 3] {partition_indices = [1, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %45 = arith.addf %43, %44 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %45, %arg7[%arg9 * 2 + 1, %arg10 * 8 + 3] {partition_indices = [1, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %46 = arith.mulf %33, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %47 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8 + 4] {partition_indices = [1, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %48 = arith.addf %46, %47 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %48, %arg7[%arg9 * 2 + 1, %arg10 * 8 + 4] {partition_indices = [1, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %49 = arith.mulf %33, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %50 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8 + 5] {partition_indices = [1, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %51 = arith.addf %49, %50 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %51, %arg7[%arg9 * 2 + 1, %arg10 * 8 + 5] {partition_indices = [1, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %52 = arith.mulf %33, %25 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %53 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8 + 6] {partition_indices = [1, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %54 = arith.addf %52, %53 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %54, %arg7[%arg9 * 2 + 1, %arg10 * 8 + 6] {partition_indices = [1, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %55 = arith.mulf %33, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %56 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 8 + 7] {partition_indices = [1, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
          %57 = arith.addf %55, %56 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %57, %arg7[%arg9 * 2 + 1, %arg10 * 8 + 7] {partition_indices = [1, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=512, iterLatency=12, minII=1>, parallel, timing = #hls.t<0 -> 525, 525, 525>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=1048576, iterLatency=12, minII=1>, parallel, timing = #hls.t<0 -> 1048589, 1048589, 1048589>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=4294967296, iterLatency=12, minII=1>, resource = #hls.r<lut=0, dsp=80, bram=0>, timing = #hls.t<0 -> 4294967309, 4294967309, 4294967309>}
    return
  }
}