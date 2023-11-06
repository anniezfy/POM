module {
  func @gemm_64(%arg0: f32, %arg1: f32, %arg2: memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg3: memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>, %arg4: memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>) attributes {resource = #hls.r<lut=0, dsp=166, bram=0>, timing = #hls.t<0 -> 8347, 8347, 8347>, top_func} {
    affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 4 {
        %0 = affine.load %arg4[%arg5 * 2, %arg6 * 16] {partition_indices = [0, 0]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg4[%arg5 * 2, %arg6 * 16] {partition_indices = [0, 0]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %2 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 1] {partition_indices = [0, 1]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %3 = arith.mulf %2, %arg1 : f32
        affine.store %3, %arg4[%arg5 * 2, %arg6 * 16 + 1] {partition_indices = [0, 1]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %4 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 2] {partition_indices = [0, 2]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %5 = arith.mulf %4, %arg1 : f32
        affine.store %5, %arg4[%arg5 * 2, %arg6 * 16 + 2] {partition_indices = [0, 2]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %6 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 3] {partition_indices = [0, 3]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %7 = arith.mulf %6, %arg1 : f32
        affine.store %7, %arg4[%arg5 * 2, %arg6 * 16 + 3] {partition_indices = [0, 3]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %8 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 4] {partition_indices = [0, 4]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %9 = arith.mulf %8, %arg1 : f32
        affine.store %9, %arg4[%arg5 * 2, %arg6 * 16 + 4] {partition_indices = [0, 4]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %10 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 5] {partition_indices = [0, 5]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %11 = arith.mulf %10, %arg1 : f32
        affine.store %11, %arg4[%arg5 * 2, %arg6 * 16 + 5] {partition_indices = [0, 5]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %12 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 6] {partition_indices = [0, 6]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %13 = arith.mulf %12, %arg1 : f32
        affine.store %13, %arg4[%arg5 * 2, %arg6 * 16 + 6] {partition_indices = [0, 6]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %14 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 7] {partition_indices = [0, 7]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %15 = arith.mulf %14, %arg1 : f32
        affine.store %15, %arg4[%arg5 * 2, %arg6 * 16 + 7] {partition_indices = [0, 7]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %16 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 8] {partition_indices = [0, 8]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %17 = arith.mulf %16, %arg1 : f32
        affine.store %17, %arg4[%arg5 * 2, %arg6 * 16 + 8] {partition_indices = [0, 8]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %18 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 9] {partition_indices = [0, 9]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %19 = arith.mulf %18, %arg1 : f32
        affine.store %19, %arg4[%arg5 * 2, %arg6 * 16 + 9] {partition_indices = [0, 9]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %20 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 10] {partition_indices = [0, 10]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %21 = arith.mulf %20, %arg1 : f32
        affine.store %21, %arg4[%arg5 * 2, %arg6 * 16 + 10] {partition_indices = [0, 10]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %22 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 11] {partition_indices = [0, 11]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %23 = arith.mulf %22, %arg1 : f32
        affine.store %23, %arg4[%arg5 * 2, %arg6 * 16 + 11] {partition_indices = [0, 11]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %24 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 12] {partition_indices = [0, 12]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %25 = arith.mulf %24, %arg1 : f32
        affine.store %25, %arg4[%arg5 * 2, %arg6 * 16 + 12] {partition_indices = [0, 12]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %26 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 13] {partition_indices = [0, 13]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %27 = arith.mulf %26, %arg1 : f32
        affine.store %27, %arg4[%arg5 * 2, %arg6 * 16 + 13] {partition_indices = [0, 13]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %28 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 14] {partition_indices = [0, 14]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %29 = arith.mulf %28, %arg1 : f32
        affine.store %29, %arg4[%arg5 * 2, %arg6 * 16 + 14] {partition_indices = [0, 14]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %30 = affine.load %arg4[%arg5 * 2, %arg6 * 16 + 15] {partition_indices = [0, 15]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %31 = arith.mulf %30, %arg1 : f32
        affine.store %31, %arg4[%arg5 * 2, %arg6 * 16 + 15] {partition_indices = [0, 15]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %32 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16] {partition_indices = [1, 0]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %33 = arith.mulf %32, %arg1 : f32
        affine.store %33, %arg4[%arg5 * 2 + 1, %arg6 * 16] {partition_indices = [1, 0]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %34 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 1] {partition_indices = [1, 1]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %35 = arith.mulf %34, %arg1 : f32
        affine.store %35, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 1] {partition_indices = [1, 1]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %36 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 2] {partition_indices = [1, 2]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %37 = arith.mulf %36, %arg1 : f32
        affine.store %37, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 2] {partition_indices = [1, 2]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %38 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 3] {partition_indices = [1, 3]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %39 = arith.mulf %38, %arg1 : f32
        affine.store %39, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 3] {partition_indices = [1, 3]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %40 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 4] {partition_indices = [1, 4]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %41 = arith.mulf %40, %arg1 : f32
        affine.store %41, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 4] {partition_indices = [1, 4]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %42 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 5] {partition_indices = [1, 5]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %43 = arith.mulf %42, %arg1 : f32
        affine.store %43, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 5] {partition_indices = [1, 5]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %44 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 6] {partition_indices = [1, 6]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %45 = arith.mulf %44, %arg1 : f32
        affine.store %45, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 6] {partition_indices = [1, 6]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %46 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 7] {partition_indices = [1, 7]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %47 = arith.mulf %46, %arg1 : f32
        affine.store %47, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 7] {partition_indices = [1, 7]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %48 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 8] {partition_indices = [1, 8]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %49 = arith.mulf %48, %arg1 : f32
        affine.store %49, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 8] {partition_indices = [1, 8]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %50 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 9] {partition_indices = [1, 9]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %51 = arith.mulf %50, %arg1 : f32
        affine.store %51, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 9] {partition_indices = [1, 9]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %52 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 10] {partition_indices = [1, 10]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %53 = arith.mulf %52, %arg1 : f32
        affine.store %53, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 10] {partition_indices = [1, 10]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %54 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 11] {partition_indices = [1, 11]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %55 = arith.mulf %54, %arg1 : f32
        affine.store %55, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 11] {partition_indices = [1, 11]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %56 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 12] {partition_indices = [1, 12]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %57 = arith.mulf %56, %arg1 : f32
        affine.store %57, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 12] {partition_indices = [1, 12]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %58 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 13] {partition_indices = [1, 13]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %59 = arith.mulf %58, %arg1 : f32
        affine.store %59, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 13] {partition_indices = [1, 13]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %60 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 14] {partition_indices = [1, 14]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %61 = arith.mulf %60, %arg1 : f32
        affine.store %61, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 14] {partition_indices = [1, 14]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %62 = affine.load %arg4[%arg5 * 2 + 1, %arg6 * 16 + 15] {partition_indices = [1, 15]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        %63 = arith.mulf %62, %arg1 : f32
        affine.store %63, %arg4[%arg5 * 2 + 1, %arg6 * 16 + 15] {partition_indices = [1, 15]} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg5 = 0 to 64 {
      affine.for %arg6 = 0 to 32 {
        affine.for %arg7 = 0 to 4 {
          %0 = affine.load %arg2[%arg6 * 2, %arg5] {partition_indices = [0, 0], timing = #hls.t<14 -> 16, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %1 = arith.mulf %arg0, %0 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %2 = affine.load %arg3[%arg5, %arg7 * 16] {partition_indices = [0, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %3 = arith.mulf %2, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %4 = affine.load %arg4[%arg6 * 2, %arg7 * 16] {partition_indices = [0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %5 = arith.addf %3, %4 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %5, %arg4[%arg6 * 2, %arg7 * 16] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %6 = affine.load %arg3[%arg5, %arg7 * 16 + 1] {partition_indices = [0, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %7 = arith.mulf %6, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %8 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 1] {partition_indices = [0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %9 = arith.addf %7, %8 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %9, %arg4[%arg6 * 2, %arg7 * 16 + 1] {partition_indices = [0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %10 = affine.load %arg3[%arg5, %arg7 * 16 + 2] {partition_indices = [0, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %11 = arith.mulf %10, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %12 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 2] {partition_indices = [0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %13 = arith.addf %11, %12 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %13, %arg4[%arg6 * 2, %arg7 * 16 + 2] {partition_indices = [0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %14 = affine.load %arg3[%arg5, %arg7 * 16 + 3] {partition_indices = [0, 3], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %15 = arith.mulf %14, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %16 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 3] {partition_indices = [0, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %17 = arith.addf %15, %16 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %17, %arg4[%arg6 * 2, %arg7 * 16 + 3] {partition_indices = [0, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %18 = affine.load %arg3[%arg5, %arg7 * 16 + 4] {partition_indices = [0, 4], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %19 = arith.mulf %18, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %20 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 4] {partition_indices = [0, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %21 = arith.addf %19, %20 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %21, %arg4[%arg6 * 2, %arg7 * 16 + 4] {partition_indices = [0, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %22 = affine.load %arg3[%arg5, %arg7 * 16 + 5] {partition_indices = [0, 5], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %23 = arith.mulf %22, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %24 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 5] {partition_indices = [0, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %25 = arith.addf %23, %24 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %25, %arg4[%arg6 * 2, %arg7 * 16 + 5] {partition_indices = [0, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %26 = affine.load %arg3[%arg5, %arg7 * 16 + 6] {partition_indices = [0, 6], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %27 = arith.mulf %26, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %28 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 6] {partition_indices = [0, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %29 = arith.addf %27, %28 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %29, %arg4[%arg6 * 2, %arg7 * 16 + 6] {partition_indices = [0, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %30 = affine.load %arg3[%arg5, %arg7 * 16 + 7] {partition_indices = [0, 7], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %31 = arith.mulf %30, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %32 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 7] {partition_indices = [0, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %33 = arith.addf %31, %32 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %33, %arg4[%arg6 * 2, %arg7 * 16 + 7] {partition_indices = [0, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %34 = affine.load %arg3[%arg5, %arg7 * 16 + 8] {partition_indices = [0, 8], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %35 = arith.mulf %34, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %36 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 8] {partition_indices = [0, 8], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %37 = arith.addf %35, %36 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %37, %arg4[%arg6 * 2, %arg7 * 16 + 8] {partition_indices = [0, 8], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %38 = affine.load %arg3[%arg5, %arg7 * 16 + 9] {partition_indices = [0, 9], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %39 = arith.mulf %38, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %40 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 9] {partition_indices = [0, 9], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %41 = arith.addf %39, %40 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %41, %arg4[%arg6 * 2, %arg7 * 16 + 9] {partition_indices = [0, 9], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %42 = affine.load %arg3[%arg5, %arg7 * 16 + 10] {partition_indices = [0, 10], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %43 = arith.mulf %42, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %44 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 10] {partition_indices = [0, 10], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %45 = arith.addf %43, %44 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %45, %arg4[%arg6 * 2, %arg7 * 16 + 10] {partition_indices = [0, 10], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %46 = affine.load %arg3[%arg5, %arg7 * 16 + 11] {partition_indices = [0, 11], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %47 = arith.mulf %46, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %48 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 11] {partition_indices = [0, 11], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %49 = arith.addf %47, %48 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %49, %arg4[%arg6 * 2, %arg7 * 16 + 11] {partition_indices = [0, 11], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %50 = affine.load %arg3[%arg5, %arg7 * 16 + 12] {partition_indices = [0, 12], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %51 = arith.mulf %50, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %52 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 12] {partition_indices = [0, 12], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %53 = arith.addf %51, %52 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %53, %arg4[%arg6 * 2, %arg7 * 16 + 12] {partition_indices = [0, 12], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %54 = affine.load %arg3[%arg5, %arg7 * 16 + 13] {partition_indices = [0, 13], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %55 = arith.mulf %54, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %56 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 13] {partition_indices = [0, 13], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %57 = arith.addf %55, %56 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %57, %arg4[%arg6 * 2, %arg7 * 16 + 13] {partition_indices = [0, 13], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %58 = affine.load %arg3[%arg5, %arg7 * 16 + 14] {partition_indices = [0, 14], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %59 = arith.mulf %58, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %60 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 14] {partition_indices = [0, 14], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %61 = arith.addf %59, %60 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %61, %arg4[%arg6 * 2, %arg7 * 16 + 14] {partition_indices = [0, 14], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %62 = affine.load %arg3[%arg5, %arg7 * 16 + 15] {partition_indices = [0, 15], timing = #hls.t<10 -> 12, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %63 = arith.mulf %62, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %64 = affine.load %arg4[%arg6 * 2, %arg7 * 16 + 15] {partition_indices = [0, 15], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %65 = arith.addf %63, %64 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %65, %arg4[%arg6 * 2, %arg7 * 16 + 15] {partition_indices = [0, 15], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %66 = affine.load %arg2[%arg6 * 2 + 1, %arg5] {partition_indices = [1, 0], timing = #hls.t<14 -> 16, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %67 = arith.mulf %arg0, %66 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %68 = arith.mulf %2, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %69 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16] {partition_indices = [1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %70 = arith.addf %68, %69 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %70, %arg4[%arg6 * 2 + 1, %arg7 * 16] {partition_indices = [1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %71 = arith.mulf %6, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %72 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 1] {partition_indices = [1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %73 = arith.addf %71, %72 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %73, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 1] {partition_indices = [1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %74 = arith.mulf %10, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %75 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 2] {partition_indices = [1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %76 = arith.addf %74, %75 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %76, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 2] {partition_indices = [1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %77 = arith.mulf %14, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %78 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 3] {partition_indices = [1, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %79 = arith.addf %77, %78 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %79, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 3] {partition_indices = [1, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %80 = arith.mulf %18, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %81 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 4] {partition_indices = [1, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %82 = arith.addf %80, %81 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %82, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 4] {partition_indices = [1, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %83 = arith.mulf %22, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %84 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 5] {partition_indices = [1, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %85 = arith.addf %83, %84 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %85, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 5] {partition_indices = [1, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %86 = arith.mulf %26, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %87 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 6] {partition_indices = [1, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %88 = arith.addf %86, %87 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %88, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 6] {partition_indices = [1, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %89 = arith.mulf %30, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %90 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 7] {partition_indices = [1, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %91 = arith.addf %89, %90 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %91, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 7] {partition_indices = [1, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %92 = arith.mulf %34, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %93 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 8] {partition_indices = [1, 8], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %94 = arith.addf %92, %93 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %94, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 8] {partition_indices = [1, 8], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %95 = arith.mulf %38, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %96 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 9] {partition_indices = [1, 9], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %97 = arith.addf %95, %96 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %97, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 9] {partition_indices = [1, 9], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %98 = arith.mulf %42, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %99 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 10] {partition_indices = [1, 10], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %100 = arith.addf %98, %99 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %100, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 10] {partition_indices = [1, 10], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %101 = arith.mulf %46, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %102 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 11] {partition_indices = [1, 11], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %103 = arith.addf %101, %102 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %103, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 11] {partition_indices = [1, 11], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %104 = arith.mulf %50, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %105 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 12] {partition_indices = [1, 12], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %106 = arith.addf %104, %105 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %106, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 12] {partition_indices = [1, 12], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %107 = arith.mulf %54, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %108 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 13] {partition_indices = [1, 13], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %109 = arith.addf %107, %108 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %109, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 13] {partition_indices = [1, 13], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %110 = arith.mulf %58, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %111 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 14] {partition_indices = [1, 14], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %112 = arith.addf %110, %111 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %112, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 14] {partition_indices = [1, 14], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %113 = arith.mulf %62, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %114 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 16 + 15] {partition_indices = [1, 15], timing = #hls.t<6 -> 8, 2, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %115 = arith.addf %113, %114 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %115, %arg4[%arg6 * 2 + 1, %arg7 * 16 + 15] {partition_indices = [1, 15], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=4, iterLatency=16, minII=1>, parallel, timing = #hls.t<0 -> 21, 21, 21>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=128, iterLatency=16, minII=1>, parallel, timing = #hls.t<0 -> 145, 145, 145>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=8192, iterLatency=16, minII=1>, resource = #hls.r<lut=0, dsp=166, bram=0>, timing = #hls.t<0 -> 8209, 8209, 8209>}
    return
  }
}