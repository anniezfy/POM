module {
  func @vgg(%arg0: f32, %arg1: memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>, %arg2: memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>, %arg3: memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>, %arg4: memref<2x64x34x34xf32>, %arg5: memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>) attributes {resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 3547157, 3547157, 3547157>, top_func} {
    affine.for %arg6 = 0 to 2 {
      affine.for %arg7 = 0 to 64 {
        affine.for %arg8 = 0 to 8 {
          affine.for %arg9 = 0 to 4 {
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8] {partition_indices = [0, 0, 0, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 1] {partition_indices = [0, 0, 0, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 2] {partition_indices = [0, 0, 0, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 3] {partition_indices = [0, 0, 0, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 4] {partition_indices = [0, 0, 0, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 5] {partition_indices = [0, 0, 0, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 6] {partition_indices = [0, 0, 0, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 7] {partition_indices = [0, 0, 0, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8] {partition_indices = [0, 0, 1, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 1] {partition_indices = [0, 0, 1, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 2] {partition_indices = [0, 0, 1, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 3] {partition_indices = [0, 0, 1, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 4] {partition_indices = [0, 0, 1, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 5] {partition_indices = [0, 0, 1, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 6] {partition_indices = [0, 0, 1, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 7] {partition_indices = [0, 0, 1, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8] {partition_indices = [0, 0, 2, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 1] {partition_indices = [0, 0, 2, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 2] {partition_indices = [0, 0, 2, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 3] {partition_indices = [0, 0, 2, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 4] {partition_indices = [0, 0, 2, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 5] {partition_indices = [0, 0, 2, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 6] {partition_indices = [0, 0, 2, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 7] {partition_indices = [0, 0, 2, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8] {partition_indices = [0, 0, 3, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 1] {partition_indices = [0, 0, 3, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 2] {partition_indices = [0, 0, 3, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 3] {partition_indices = [0, 0, 3, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 4] {partition_indices = [0, 0, 3, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 5] {partition_indices = [0, 0, 3, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 6] {partition_indices = [0, 0, 3, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %arg0, %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 7] {partition_indices = [0, 0, 3, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg6 = 0 to 3 {
      affine.for %arg7 = 0 to 3 {
        affine.for %arg8 = 0 to 3 {
          affine.for %arg9 = 0 to 2 {
            affine.for %arg10 = 0 to 64 {
              affine.for %arg11 = 0 to 8 {
                affine.for %arg12 = 0 to 4 {
                  %0 = affine.load %arg2[%arg10, %arg6, %arg7, %arg8] {partition_indices = [0, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>
                  %1 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %2 = arith.mulf %0, %1 : f32
                  %3 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8] {partition_indices = [0, 0, 0, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %4 = arith.addf %2, %3 : f32
                  affine.store %4, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8] {partition_indices = [0, 0, 0, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %5 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8 + 1] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %6 = arith.mulf %0, %5 : f32
                  %7 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 1] {partition_indices = [0, 0, 0, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %8 = arith.addf %6, %7 : f32
                  affine.store %8, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 1] {partition_indices = [0, 0, 0, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %9 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8 + 2] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %10 = arith.mulf %0, %9 : f32
                  %11 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 2] {partition_indices = [0, 0, 0, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %12 = arith.addf %10, %11 : f32
                  affine.store %12, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 2] {partition_indices = [0, 0, 0, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %13 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8 + 3] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %14 = arith.mulf %0, %13 : f32
                  %15 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 3] {partition_indices = [0, 0, 0, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %16 = arith.addf %14, %15 : f32
                  affine.store %16, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 3] {partition_indices = [0, 0, 0, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %17 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8 + 4] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %18 = arith.mulf %0, %17 : f32
                  %19 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 4] {partition_indices = [0, 0, 0, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %20 = arith.addf %18, %19 : f32
                  affine.store %20, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 4] {partition_indices = [0, 0, 0, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %21 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8 + 5] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %22 = arith.mulf %0, %21 : f32
                  %23 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 5] {partition_indices = [0, 0, 0, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %24 = arith.addf %22, %23 : f32
                  affine.store %24, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 5] {partition_indices = [0, 0, 0, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %25 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8 + 6] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %26 = arith.mulf %0, %25 : f32
                  %27 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 6] {partition_indices = [0, 0, 0, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %28 = arith.addf %26, %27 : f32
                  affine.store %28, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 6] {partition_indices = [0, 0, 0, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %29 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7, %arg12 * 8 + %arg8 + 7] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %30 = arith.mulf %0, %29 : f32
                  %31 = affine.load %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 7] {partition_indices = [0, 0, 0, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %32 = arith.addf %30, %31 : f32
                  affine.store %32, %arg1[%arg9, %arg10, %arg11 * 4, %arg12 * 8 + 7] {partition_indices = [0, 0, 0, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %33 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %34 = arith.mulf %0, %33 : f32
                  %35 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8] {partition_indices = [0, 0, 1, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %36 = arith.addf %34, %35 : f32
                  affine.store %36, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8] {partition_indices = [0, 0, 1, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %37 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8 + 1] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %38 = arith.mulf %0, %37 : f32
                  %39 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 1] {partition_indices = [0, 0, 1, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %40 = arith.addf %38, %39 : f32
                  affine.store %40, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 1] {partition_indices = [0, 0, 1, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %41 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8 + 2] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %42 = arith.mulf %0, %41 : f32
                  %43 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 2] {partition_indices = [0, 0, 1, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %44 = arith.addf %42, %43 : f32
                  affine.store %44, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 2] {partition_indices = [0, 0, 1, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %45 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8 + 3] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %46 = arith.mulf %0, %45 : f32
                  %47 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 3] {partition_indices = [0, 0, 1, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %48 = arith.addf %46, %47 : f32
                  affine.store %48, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 3] {partition_indices = [0, 0, 1, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %49 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8 + 4] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %50 = arith.mulf %0, %49 : f32
                  %51 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 4] {partition_indices = [0, 0, 1, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %52 = arith.addf %50, %51 : f32
                  affine.store %52, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 4] {partition_indices = [0, 0, 1, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %53 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8 + 5] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %54 = arith.mulf %0, %53 : f32
                  %55 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 5] {partition_indices = [0, 0, 1, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %56 = arith.addf %54, %55 : f32
                  affine.store %56, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 5] {partition_indices = [0, 0, 1, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %57 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8 + 6] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %58 = arith.mulf %0, %57 : f32
                  %59 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 6] {partition_indices = [0, 0, 1, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %60 = arith.addf %58, %59 : f32
                  affine.store %60, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 6] {partition_indices = [0, 0, 1, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %61 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 1, %arg12 * 8 + %arg8 + 7] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %62 = arith.mulf %0, %61 : f32
                  %63 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 7] {partition_indices = [0, 0, 1, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %64 = arith.addf %62, %63 : f32
                  affine.store %64, %arg1[%arg9, %arg10, %arg11 * 4 + 1, %arg12 * 8 + 7] {partition_indices = [0, 0, 1, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %65 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %66 = arith.mulf %0, %65 : f32
                  %67 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8] {partition_indices = [0, 0, 2, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %68 = arith.addf %66, %67 : f32
                  affine.store %68, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8] {partition_indices = [0, 0, 2, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %69 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8 + 1] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %70 = arith.mulf %0, %69 : f32
                  %71 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 1] {partition_indices = [0, 0, 2, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %72 = arith.addf %70, %71 : f32
                  affine.store %72, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 1] {partition_indices = [0, 0, 2, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %73 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8 + 2] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %74 = arith.mulf %0, %73 : f32
                  %75 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 2] {partition_indices = [0, 0, 2, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %76 = arith.addf %74, %75 : f32
                  affine.store %76, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 2] {partition_indices = [0, 0, 2, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %77 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8 + 3] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %78 = arith.mulf %0, %77 : f32
                  %79 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 3] {partition_indices = [0, 0, 2, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %80 = arith.addf %78, %79 : f32
                  affine.store %80, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 3] {partition_indices = [0, 0, 2, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %81 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8 + 4] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %82 = arith.mulf %0, %81 : f32
                  %83 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 4] {partition_indices = [0, 0, 2, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %84 = arith.addf %82, %83 : f32
                  affine.store %84, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 4] {partition_indices = [0, 0, 2, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %85 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8 + 5] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %86 = arith.mulf %0, %85 : f32
                  %87 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 5] {partition_indices = [0, 0, 2, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %88 = arith.addf %86, %87 : f32
                  affine.store %88, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 5] {partition_indices = [0, 0, 2, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %89 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8 + 6] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %90 = arith.mulf %0, %89 : f32
                  %91 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 6] {partition_indices = [0, 0, 2, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %92 = arith.addf %90, %91 : f32
                  affine.store %92, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 6] {partition_indices = [0, 0, 2, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %93 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 2, %arg12 * 8 + %arg8 + 7] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %94 = arith.mulf %0, %93 : f32
                  %95 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 7] {partition_indices = [0, 0, 2, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %96 = arith.addf %94, %95 : f32
                  affine.store %96, %arg1[%arg9, %arg10, %arg11 * 4 + 2, %arg12 * 8 + 7] {partition_indices = [0, 0, 2, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %97 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %98 = arith.mulf %0, %97 : f32
                  %99 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8] {partition_indices = [0, 0, 3, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %100 = arith.addf %98, %99 : f32
                  affine.store %100, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8] {partition_indices = [0, 0, 3, 0]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %101 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8 + 1] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %102 = arith.mulf %0, %101 : f32
                  %103 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 1] {partition_indices = [0, 0, 3, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %104 = arith.addf %102, %103 : f32
                  affine.store %104, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 1] {partition_indices = [0, 0, 3, 1]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %105 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8 + 2] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %106 = arith.mulf %0, %105 : f32
                  %107 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 2] {partition_indices = [0, 0, 3, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %108 = arith.addf %106, %107 : f32
                  affine.store %108, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 2] {partition_indices = [0, 0, 3, 2]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %109 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8 + 3] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %110 = arith.mulf %0, %109 : f32
                  %111 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 3] {partition_indices = [0, 0, 3, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %112 = arith.addf %110, %111 : f32
                  affine.store %112, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 3] {partition_indices = [0, 0, 3, 3]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %113 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8 + 4] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %114 = arith.mulf %0, %113 : f32
                  %115 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 4] {partition_indices = [0, 0, 3, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %116 = arith.addf %114, %115 : f32
                  affine.store %116, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 4] {partition_indices = [0, 0, 3, 4]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %117 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8 + 5] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %118 = arith.mulf %0, %117 : f32
                  %119 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 5] {partition_indices = [0, 0, 3, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %120 = arith.addf %118, %119 : f32
                  affine.store %120, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 5] {partition_indices = [0, 0, 3, 5]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %121 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8 + 6] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %122 = arith.mulf %0, %121 : f32
                  %123 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 6] {partition_indices = [0, 0, 3, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %124 = arith.addf %122, %123 : f32
                  affine.store %124, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 6] {partition_indices = [0, 0, 3, 6]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %125 = affine.load %arg3[%arg9, %arg6, %arg11 * 4 + %arg7 + 3, %arg12 * 8 + %arg8 + 7] {max_mux_size = 8 : i64, partition_indices = [0, 0, -1, -1]} : memref<2x3x34x34xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %126 = arith.mulf %0, %125 : f32
                  %127 = affine.load %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 7] {partition_indices = [0, 0, 3, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                  %128 = arith.addf %126, %127 : f32
                  affine.store %128, %arg1[%arg9, %arg10, %arg11 * 4 + 3, %arg12 * 8 + 7] {partition_indices = [0, 0, 3, 7]} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
                } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
              } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg6 = 0 to 2 {
      affine.for %arg7 = 0 to 64 {
        affine.for %arg8 = 0 to 8 {
          affine.for %arg9 = 0 to 4 {
            %0 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8] {partition_indices = [0, 0, 0, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %0, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8] {partition_indices = [0, 0, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %1 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 1] {partition_indices = [0, 0, 0, 1], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %1, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 1] {partition_indices = [0, 0, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %2 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 2] {partition_indices = [0, 0, 0, 2], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %2, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 2] {partition_indices = [0, 0, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %3 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 3] {partition_indices = [0, 0, 0, 3], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %3, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 3] {partition_indices = [0, 0, 0, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %4 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 4] {partition_indices = [0, 0, 0, 4], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %4, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 4] {partition_indices = [0, 0, 0, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %5 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 5] {partition_indices = [0, 0, 0, 5], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %5, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 5] {partition_indices = [0, 0, 0, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %6 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 6] {partition_indices = [0, 0, 0, 6], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %6, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 6] {partition_indices = [0, 0, 0, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %7 = affine.load %arg1[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 7] {partition_indices = [0, 0, 0, 7], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %7, %arg5[%arg6, %arg7, %arg8 * 4, %arg9 * 8 + 7] {partition_indices = [0, 0, 0, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %8 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8] {partition_indices = [0, 0, 1, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %8, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8] {partition_indices = [0, 0, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %9 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 1] {partition_indices = [0, 0, 1, 1], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %9, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 1] {partition_indices = [0, 0, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %10 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 2] {partition_indices = [0, 0, 1, 2], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %10, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 2] {partition_indices = [0, 0, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %11 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 3] {partition_indices = [0, 0, 1, 3], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %11, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 3] {partition_indices = [0, 0, 1, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %12 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 4] {partition_indices = [0, 0, 1, 4], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %12, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 4] {partition_indices = [0, 0, 1, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %13 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 5] {partition_indices = [0, 0, 1, 5], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %13, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 5] {partition_indices = [0, 0, 1, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %14 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 6] {partition_indices = [0, 0, 1, 6], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %14, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 6] {partition_indices = [0, 0, 1, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %15 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 7] {partition_indices = [0, 0, 1, 7], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %15, %arg5[%arg6, %arg7, %arg8 * 4 + 1, %arg9 * 8 + 7] {partition_indices = [0, 0, 1, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %16 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8] {partition_indices = [0, 0, 2, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %16, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8] {partition_indices = [0, 0, 2, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %17 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 1] {partition_indices = [0, 0, 2, 1], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %17, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 1] {partition_indices = [0, 0, 2, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %18 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 2] {partition_indices = [0, 0, 2, 2], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %18, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 2] {partition_indices = [0, 0, 2, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %19 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 3] {partition_indices = [0, 0, 2, 3], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %19, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 3] {partition_indices = [0, 0, 2, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %20 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 4] {partition_indices = [0, 0, 2, 4], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %20, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 4] {partition_indices = [0, 0, 2, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %21 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 5] {partition_indices = [0, 0, 2, 5], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %21, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 5] {partition_indices = [0, 0, 2, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %22 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 6] {partition_indices = [0, 0, 2, 6], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %22, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 6] {partition_indices = [0, 0, 2, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %23 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 7] {partition_indices = [0, 0, 2, 7], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %23, %arg5[%arg6, %arg7, %arg8 * 4 + 2, %arg9 * 8 + 7] {partition_indices = [0, 0, 2, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %24 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8] {partition_indices = [0, 0, 3, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %24, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8] {partition_indices = [0, 0, 3, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %25 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 1] {partition_indices = [0, 0, 3, 1], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %25, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 1] {partition_indices = [0, 0, 3, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %26 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 2] {partition_indices = [0, 0, 3, 2], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %26, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 2] {partition_indices = [0, 0, 3, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %27 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 3] {partition_indices = [0, 0, 3, 3], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %27, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 3] {partition_indices = [0, 0, 3, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %28 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 4] {partition_indices = [0, 0, 3, 4], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %28, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 4] {partition_indices = [0, 0, 3, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %29 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 5] {partition_indices = [0, 0, 3, 5], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %29, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 5] {partition_indices = [0, 0, 3, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %30 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 6] {partition_indices = [0, 0, 3, 6], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %30, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 6] {partition_indices = [0, 0, 3, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            %31 = affine.load %arg1[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 7] {partition_indices = [0, 0, 3, 7], timing = #hls.t<1 -> 3, 2, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
            affine.store %31, %arg5[%arg6, %arg7, %arg8 * 4 + 3, %arg9 * 8 + 7] {partition_indices = [0, 0, 3, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<2x64x32x32xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 4, d3 mod 8, d0, d1, d2 floordiv 4, d3 floordiv 8)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=4, iterLatency=3, minII=1>, parallel, timing = #hls.t<0 -> 8, 8, 8>}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=32, iterLatency=3, minII=1>, parallel, timing = #hls.t<0 -> 36, 36, 36>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=2048, iterLatency=3, minII=1>, parallel, timing = #hls.t<0 -> 2052, 2052, 2052>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=4096, iterLatency=3, minII=1>, parallel, resource = #hls.r<lut=0, dsp=0, bram=0>, timing = #hls.t<0 -> 4100, 4100, 4100>}
    return
  }
}