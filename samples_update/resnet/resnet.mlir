module {
  func @resnet(%arg0: f32, %arg1: memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>, %arg2: memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>, %arg3: memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>, %arg4: memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>, %arg5: memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, d3 mod 2, d0, d1, d2, d3 floordiv 2)>>, %arg6: memref<2x64x32x32xf32>) attributes {resource = #hls.r<lut=0, dsp=40, bram=0>, timing = #hls.t<0 -> 75939899, 75939899, 75939899>, top_func} {
    affine.for %arg7 = 0 to 3 {
      affine.for %arg8 = 0 to 3 {
        affine.for %arg9 = 0 to 3 {
          affine.for %arg10 = 0 to 2 {
            affine.for %arg11 = 0 to 8 {
              affine.for %arg12 = 0 to 32 {
                affine.for %arg13 = 0 to 16 {
                  %0 = affine.load %arg3[%arg11 * 8, %arg7, %arg8, %arg9] {partition_indices = [0, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %1 = affine.load %arg5[%arg10, %arg7, %arg12 + %arg8, %arg13 * 2 + %arg9] {max_mux_size = 2 : i64, partition_indices = [0, 0, 0, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, d3 mod 2, d0, d1, d2, d3 floordiv 2)>>
                  %2 = arith.mulf %0, %1 : f32
                  %3 = affine.load %arg1[%arg10, %arg11 * 8, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %4 = arith.addf %2, %3 : f32
                  affine.store %4, %arg1[%arg10, %arg11 * 8, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %5 = affine.load %arg5[%arg10, %arg7, %arg12 + %arg8, %arg13 * 2 + %arg9 + 1] {max_mux_size = 2 : i64, partition_indices = [0, 0, 0, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, d3 mod 2, d0, d1, d2, d3 floordiv 2)>>
                  %6 = arith.mulf %0, %5 : f32
                  %7 = affine.load %arg1[%arg10, %arg11 * 8, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %8 = arith.addf %6, %7 : f32
                  affine.store %8, %arg1[%arg10, %arg11 * 8, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %9 = affine.load %arg3[%arg11 * 8 + 1, %arg7, %arg8, %arg9] {partition_indices = [1, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %10 = arith.mulf %9, %1 : f32
                  %11 = affine.load %arg1[%arg10, %arg11 * 8 + 1, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 1, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %12 = arith.addf %10, %11 : f32
                  affine.store %12, %arg1[%arg10, %arg11 * 8 + 1, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 1, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %13 = arith.mulf %9, %5 : f32
                  %14 = affine.load %arg1[%arg10, %arg11 * 8 + 1, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 1, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %15 = arith.addf %13, %14 : f32
                  affine.store %15, %arg1[%arg10, %arg11 * 8 + 1, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 1, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %16 = affine.load %arg3[%arg11 * 8 + 2, %arg7, %arg8, %arg9] {partition_indices = [2, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %17 = arith.mulf %16, %1 : f32
                  %18 = affine.load %arg1[%arg10, %arg11 * 8 + 2, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 2, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %19 = arith.addf %17, %18 : f32
                  affine.store %19, %arg1[%arg10, %arg11 * 8 + 2, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 2, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %20 = arith.mulf %16, %5 : f32
                  %21 = affine.load %arg1[%arg10, %arg11 * 8 + 2, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 2, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %22 = arith.addf %20, %21 : f32
                  affine.store %22, %arg1[%arg10, %arg11 * 8 + 2, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 2, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %23 = affine.load %arg3[%arg11 * 8 + 3, %arg7, %arg8, %arg9] {partition_indices = [3, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %24 = arith.mulf %23, %1 : f32
                  %25 = affine.load %arg1[%arg10, %arg11 * 8 + 3, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 3, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %26 = arith.addf %24, %25 : f32
                  affine.store %26, %arg1[%arg10, %arg11 * 8 + 3, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 3, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %27 = arith.mulf %23, %5 : f32
                  %28 = affine.load %arg1[%arg10, %arg11 * 8 + 3, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 3, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %29 = arith.addf %27, %28 : f32
                  affine.store %29, %arg1[%arg10, %arg11 * 8 + 3, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 3, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %30 = affine.load %arg3[%arg11 * 8 + 4, %arg7, %arg8, %arg9] {partition_indices = [4, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %31 = arith.mulf %30, %1 : f32
                  %32 = affine.load %arg1[%arg10, %arg11 * 8 + 4, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 4, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %33 = arith.addf %31, %32 : f32
                  affine.store %33, %arg1[%arg10, %arg11 * 8 + 4, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 4, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %34 = arith.mulf %30, %5 : f32
                  %35 = affine.load %arg1[%arg10, %arg11 * 8 + 4, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 4, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %36 = arith.addf %34, %35 : f32
                  affine.store %36, %arg1[%arg10, %arg11 * 8 + 4, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 4, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %37 = affine.load %arg3[%arg11 * 8 + 5, %arg7, %arg8, %arg9] {partition_indices = [5, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %38 = arith.mulf %37, %1 : f32
                  %39 = affine.load %arg1[%arg10, %arg11 * 8 + 5, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 5, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %40 = arith.addf %38, %39 : f32
                  affine.store %40, %arg1[%arg10, %arg11 * 8 + 5, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 5, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %41 = arith.mulf %37, %5 : f32
                  %42 = affine.load %arg1[%arg10, %arg11 * 8 + 5, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 5, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %43 = arith.addf %41, %42 : f32
                  affine.store %43, %arg1[%arg10, %arg11 * 8 + 5, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 5, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %44 = affine.load %arg3[%arg11 * 8 + 6, %arg7, %arg8, %arg9] {partition_indices = [6, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %45 = arith.mulf %44, %1 : f32
                  %46 = affine.load %arg1[%arg10, %arg11 * 8 + 6, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 6, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %47 = arith.addf %45, %46 : f32
                  affine.store %47, %arg1[%arg10, %arg11 * 8 + 6, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 6, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %48 = arith.mulf %44, %5 : f32
                  %49 = affine.load %arg1[%arg10, %arg11 * 8 + 6, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 6, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %50 = arith.addf %48, %49 : f32
                  affine.store %50, %arg1[%arg10, %arg11 * 8 + 6, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 6, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %51 = affine.load %arg3[%arg11 * 8 + 7, %arg7, %arg8, %arg9] {partition_indices = [7, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 8, 0, 0, 0, d0 floordiv 8, d1, d2, d3)>>
                  %52 = arith.mulf %51, %1 : f32
                  %53 = affine.load %arg1[%arg10, %arg11 * 8 + 7, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 7, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %54 = arith.addf %52, %53 : f32
                  affine.store %54, %arg1[%arg10, %arg11 * 8 + 7, %arg12, %arg13 * 2] {max_mux_size = 16 : i64, partition_indices = [0, 7, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %55 = arith.mulf %51, %5 : f32
                  %56 = affine.load %arg1[%arg10, %arg11 * 8 + 7, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 7, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %57 = arith.addf %55, %56 : f32
                  affine.store %57, %arg1[%arg10, %arg11 * 8 + 7, %arg12, %arg13 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 7, -1, -1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
              } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg7 = 0 to 64 {
      affine.for %arg8 = 0 to 3 {
        affine.for %arg9 = 0 to 3 {
          affine.for %arg10 = 0 to 2 {
            affine.for %arg11 = 0 to 64 {
              affine.for %arg12 = 0 to 16 {
                affine.for %arg13 = 0 to 2 {
                  %0 = affine.load %arg4[%arg11, %arg7, %arg8, %arg9] {partition_indices = [0, 0, 0, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>
                  %1 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<72 -> 74, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %3 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16] {partition_indices = [0, 0, 0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %4, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16] {partition_indices = [0, 0, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %5 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 1] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<70 -> 72, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %6 = arith.mulf %0, %5 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %7 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 1] {partition_indices = [0, 0, 0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %8 = arith.addf %6, %7 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %8, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 1] {partition_indices = [0, 0, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %9 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 2] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<68 -> 70, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %10 = arith.mulf %0, %9 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %11 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 2] {partition_indices = [0, 0, 0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %12 = arith.addf %10, %11 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %12, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 2] {partition_indices = [0, 0, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %13 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 3] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<66 -> 68, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %14 = arith.mulf %0, %13 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %15 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 3] {partition_indices = [0, 0, 0, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %16 = arith.addf %14, %15 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %16, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 3] {partition_indices = [0, 0, 0, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %17 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 4] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<64 -> 66, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %18 = arith.mulf %0, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %19 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 4] {partition_indices = [0, 0, 0, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %20, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 4] {partition_indices = [0, 0, 0, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %21 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 5] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<62 -> 64, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %22 = arith.mulf %0, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %23 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 5] {partition_indices = [0, 0, 0, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %24 = arith.addf %22, %23 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %24, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 5] {partition_indices = [0, 0, 0, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %25 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 6] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<60 -> 62, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %26 = arith.mulf %0, %25 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %27 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 6] {partition_indices = [0, 0, 0, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %28 = arith.addf %26, %27 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %28, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 6] {partition_indices = [0, 0, 0, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %29 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 7] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<58 -> 60, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %30 = arith.mulf %0, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %31 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 7] {partition_indices = [0, 0, 0, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %32 = arith.addf %30, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %32, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 7] {partition_indices = [0, 0, 0, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %33 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 8] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<56 -> 58, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %34 = arith.mulf %0, %33 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %35 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 8] {partition_indices = [0, 0, 0, 8], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %36 = arith.addf %34, %35 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %36, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 8] {partition_indices = [0, 0, 0, 8], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %37 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 9] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<54 -> 56, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %38 = arith.mulf %0, %37 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %39 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 9] {partition_indices = [0, 0, 0, 9], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %40 = arith.addf %38, %39 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %40, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 9] {partition_indices = [0, 0, 0, 9], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %41 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 10] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<52 -> 54, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %42 = arith.mulf %0, %41 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %43 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 10] {partition_indices = [0, 0, 0, 10], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %44 = arith.addf %42, %43 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %44, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 10] {partition_indices = [0, 0, 0, 10], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %45 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 11] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<50 -> 52, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %46 = arith.mulf %0, %45 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %47 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 11] {partition_indices = [0, 0, 0, 11], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %48 = arith.addf %46, %47 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %48, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 11] {partition_indices = [0, 0, 0, 11], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %49 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 12] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<48 -> 50, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %50 = arith.mulf %0, %49 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %51 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 12] {partition_indices = [0, 0, 0, 12], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %52 = arith.addf %50, %51 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %52, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 12] {partition_indices = [0, 0, 0, 12], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %53 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 13] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<46 -> 48, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %54 = arith.mulf %0, %53 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %55 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 13] {partition_indices = [0, 0, 0, 13], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %56 = arith.addf %54, %55 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %56, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 13] {partition_indices = [0, 0, 0, 13], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %57 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 14] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<44 -> 46, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %58 = arith.mulf %0, %57 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %59 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 14] {partition_indices = [0, 0, 0, 14], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %60 = arith.addf %58, %59 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %60, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 14] {partition_indices = [0, 0, 0, 14], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %61 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8, %arg13 * 16 + %arg9 + 15] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<42 -> 44, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %62 = arith.mulf %0, %61 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %63 = affine.load %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 15] {partition_indices = [0, 0, 0, 15], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %64 = arith.addf %62, %63 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %64, %arg2[%arg10, %arg11, %arg12 * 2, %arg13 * 16 + 15] {partition_indices = [0, 0, 0, 15], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %65 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<40 -> 42, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %66 = arith.mulf %0, %65 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %67 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16] {partition_indices = [0, 0, 1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %68 = arith.addf %66, %67 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %68, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16] {partition_indices = [0, 0, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %69 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 1] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<38 -> 40, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %70 = arith.mulf %0, %69 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %71 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 1] {partition_indices = [0, 0, 1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %72 = arith.addf %70, %71 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %72, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 1] {partition_indices = [0, 0, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %73 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 2] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<36 -> 38, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %74 = arith.mulf %0, %73 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %75 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 2] {partition_indices = [0, 0, 1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %76 = arith.addf %74, %75 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %76, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 2] {partition_indices = [0, 0, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %77 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 3] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<34 -> 36, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %78 = arith.mulf %0, %77 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %79 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 3] {partition_indices = [0, 0, 1, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %80 = arith.addf %78, %79 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %80, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 3] {partition_indices = [0, 0, 1, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %81 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 4] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<32 -> 34, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %82 = arith.mulf %0, %81 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %83 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 4] {partition_indices = [0, 0, 1, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %84 = arith.addf %82, %83 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %84, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 4] {partition_indices = [0, 0, 1, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %85 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 5] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<30 -> 32, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %86 = arith.mulf %0, %85 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %87 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 5] {partition_indices = [0, 0, 1, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %88 = arith.addf %86, %87 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %88, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 5] {partition_indices = [0, 0, 1, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %89 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 6] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<28 -> 30, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %90 = arith.mulf %0, %89 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %91 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 6] {partition_indices = [0, 0, 1, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %92 = arith.addf %90, %91 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %92, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 6] {partition_indices = [0, 0, 1, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %93 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 7] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<26 -> 28, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %94 = arith.mulf %0, %93 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %95 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 7] {partition_indices = [0, 0, 1, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %96 = arith.addf %94, %95 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %96, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 7] {partition_indices = [0, 0, 1, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %97 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 8] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %98 = arith.mulf %0, %97 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %99 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 8] {partition_indices = [0, 0, 1, 8], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %100 = arith.addf %98, %99 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %100, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 8] {partition_indices = [0, 0, 1, 8], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %101 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 9] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %102 = arith.mulf %0, %101 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %103 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 9] {partition_indices = [0, 0, 1, 9], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %104 = arith.addf %102, %103 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %104, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 9] {partition_indices = [0, 0, 1, 9], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %105 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 10] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %106 = arith.mulf %0, %105 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %107 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 10] {partition_indices = [0, 0, 1, 10], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %108 = arith.addf %106, %107 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %108, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 10] {partition_indices = [0, 0, 1, 10], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %109 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 11] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %110 = arith.mulf %0, %109 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %111 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 11] {partition_indices = [0, 0, 1, 11], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %112 = arith.addf %110, %111 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %112, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 11] {partition_indices = [0, 0, 1, 11], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %113 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 12] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %114 = arith.mulf %0, %113 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %115 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 12] {partition_indices = [0, 0, 1, 12], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %116 = arith.addf %114, %115 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %116, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 12] {partition_indices = [0, 0, 1, 12], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %117 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 13] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %118 = arith.mulf %0, %117 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %119 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 13] {partition_indices = [0, 0, 1, 13], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %120 = arith.addf %118, %119 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %120, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 13] {partition_indices = [0, 0, 1, 13], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %121 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 14] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %122 = arith.mulf %0, %121 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %123 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 14] {partition_indices = [0, 0, 1, 14], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %124 = arith.addf %122, %123 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %124, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 14] {partition_indices = [0, 0, 1, 14], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %125 = affine.load %arg1[%arg10, %arg7, %arg12 * 2 + %arg8 + 1, %arg13 * 16 + %arg9 + 15] {max_mux_size = 16 : i64, partition_indices = [0, -1, -1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, d1 mod 8, d2 mod 2, d3 mod 16, d0, d1 floordiv 8, d2 floordiv 2, d3 floordiv 16)>>
                  %126 = arith.mulf %0, %125 {timing = #hls.t<6 -> 10, 4, 1>} : f32
                  %127 = affine.load %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 15] {partition_indices = [0, 0, 1, 15], timing = #hls.t<6 -> 8, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                  %128 = arith.addf %126, %127 {timing = #hls.t<1 -> 6, 5, 1>} : f32
                  affine.store %128, %arg2[%arg10, %arg11, %arg12 * 2 + 1, %arg13 * 16 + 15] {partition_indices = [0, 0, 1, 15], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 16, d0, d1, d2 floordiv 2, d3 floordiv 16)>>
                } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2, iterLatency=74, minII=32>, parallel, timing = #hls.t<0 -> 108, 108, 108>}
              } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=32, iterLatency=74, minII=32>, parallel, timing = #hls.t<0 -> 1068, 1068, 1068>}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=2048, iterLatency=74, minII=32>, parallel, timing = #hls.t<0 -> 65580, 65580, 65580>}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=4096, iterLatency=74, minII=32>, parallel, timing = #hls.t<0 -> 131116, 131116, 131116>}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=12288, iterLatency=74, minII=32>, timing = #hls.t<0 -> 393260, 393260, 393260>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=36864, iterLatency=74, minII=32>, timing = #hls.t<0 -> 1179692, 1179692, 1179692>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=2359296, iterLatency=74, minII=32>, resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 75497516, 75497516, 75497516>}
    return
  }
}