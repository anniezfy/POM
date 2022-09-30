module {
  func @gesummv(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg5: memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg6: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>) attributes {resource = #hls.r<lut=0, dsp=160, bram=0>, timing = #hls.t<0 -> 1114179, 1114179, 1114179>, top_func} {
    affine.for %arg7 = 0 to 512 {
      affine.for %arg8 = 0 to 256 {
        %0 = affine.load %arg2[%arg8 * 16, %arg7 * 8] {partition_indices = [0, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1 = affine.load %arg5[%arg7 * 8] {partition_indices = [0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %3 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %4, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %5 = affine.load %arg3[%arg8 * 64, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %6 = affine.load %arg5[%arg7 * 2] {partition_indices = [0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %7 = arith.mulf %5, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %8 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %9 = arith.addf %7, %8 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %9, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %10 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8] {partition_indices = [1, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %11 = arith.mulf %10, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %12 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %13 = arith.addf %11, %12 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %13, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %14 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %15 = arith.mulf %14, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %16 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %17 = arith.addf %15, %16 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %17, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %18 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8] {partition_indices = [2, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %19 = arith.mulf %18, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %20 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %21 = arith.addf %19, %20 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %21, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %22 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %23 = arith.mulf %22, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %24 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %25 = arith.addf %23, %24 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %25, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %26 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8] {partition_indices = [3, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %27 = arith.mulf %26, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %28 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %29 = arith.addf %27, %28 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %29, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %30 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %31 = arith.mulf %30, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %32 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %33 = arith.addf %31, %32 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %33, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %34 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8] {partition_indices = [4, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %35 = arith.mulf %34, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %36 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %37 = arith.addf %35, %36 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %37, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %38 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %39 = arith.mulf %38, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %40 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %41 = arith.addf %39, %40 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %41, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %42 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8] {partition_indices = [5, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %43 = arith.mulf %42, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %44 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %45 = arith.addf %43, %44 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %45, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %46 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %47 = arith.mulf %46, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %48 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %49 = arith.addf %47, %48 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %49, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %50 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8] {partition_indices = [6, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %51 = arith.mulf %50, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %52 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %53 = arith.addf %51, %52 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %53, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %54 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %55 = arith.mulf %54, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %56 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %57 = arith.addf %55, %56 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %57, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %58 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8] {partition_indices = [7, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %59 = arith.mulf %58, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %60 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %61 = arith.addf %59, %60 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %61, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %62 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %63 = arith.mulf %62, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %64 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %65 = arith.addf %63, %64 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %65, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %66 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8] {partition_indices = [8, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %67 = arith.mulf %66, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %68 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %69 = arith.addf %67, %68 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %69, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %70 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %71 = arith.mulf %70, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %72 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %73 = arith.addf %71, %72 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %73, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %74 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8] {partition_indices = [9, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %75 = arith.mulf %74, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %76 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %77 = arith.addf %75, %76 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %77, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %78 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %79 = arith.mulf %78, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %80 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %81 = arith.addf %79, %80 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %81, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %82 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8] {partition_indices = [10, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %83 = arith.mulf %82, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %84 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %85 = arith.addf %83, %84 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %85, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %86 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %87 = arith.mulf %86, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %88 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %89 = arith.addf %87, %88 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %89, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %90 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8] {partition_indices = [11, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %91 = arith.mulf %90, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %92 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %93 = arith.addf %91, %92 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %93, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %94 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %95 = arith.mulf %94, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %96 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %97 = arith.addf %95, %96 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %97, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %98 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8] {partition_indices = [12, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %99 = arith.mulf %98, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %100 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %101 = arith.addf %99, %100 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %101, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %102 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %103 = arith.mulf %102, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %104 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %105 = arith.addf %103, %104 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %105, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %106 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8] {partition_indices = [13, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %107 = arith.mulf %106, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %108 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %109 = arith.addf %107, %108 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %109, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %110 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %111 = arith.mulf %110, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %112 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %113 = arith.addf %111, %112 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %113, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %114 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8] {partition_indices = [14, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %115 = arith.mulf %114, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %116 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %117 = arith.addf %115, %116 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %117, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %118 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %119 = arith.mulf %118, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %120 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %121 = arith.addf %119, %120 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %121, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %122 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8] {partition_indices = [15, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %123 = arith.mulf %122, %1 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %124 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %125 = arith.addf %123, %124 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %125, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %126 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %127 = arith.mulf %126, %6 {timing = #hls.t<3 -> 7, 4, 1>} : f32
        %128 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %129 = arith.addf %127, %128 {timing = #hls.t<7 -> 12, 5, 1>} : f32
        affine.store %129, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<12 -> 13, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %130 = affine.load %arg2[%arg8 * 16, %arg7 * 8 + 1] {partition_indices = [0, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %131 = affine.load %arg5[%arg7 * 8 + 1] {partition_indices = [1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %132 = arith.mulf %130, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %133 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %134 = arith.addf %132, %133 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %134, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %135 = affine.load %arg3[%arg8 * 64, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %136 = affine.load %arg5[%arg7 * 2 + 1] {partition_indices = [1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %137 = arith.mulf %135, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %138 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %139 = arith.addf %137, %138 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %139, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %140 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8 + 1] {partition_indices = [1, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %141 = arith.mulf %140, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %142 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %143 = arith.addf %141, %142 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %143, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %144 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %145 = arith.mulf %144, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %146 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %147 = arith.addf %145, %146 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %147, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %148 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8 + 1] {partition_indices = [2, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %149 = arith.mulf %148, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %150 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %151 = arith.addf %149, %150 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %151, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %152 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %153 = arith.mulf %152, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %154 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %155 = arith.addf %153, %154 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %155, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %156 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8 + 1] {partition_indices = [3, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %157 = arith.mulf %156, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %158 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %159 = arith.addf %157, %158 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %159, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %160 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %161 = arith.mulf %160, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %162 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %163 = arith.addf %161, %162 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %163, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %164 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8 + 1] {partition_indices = [4, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %165 = arith.mulf %164, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %166 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %167 = arith.addf %165, %166 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %167, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %168 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %169 = arith.mulf %168, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %170 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %171 = arith.addf %169, %170 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %171, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %172 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8 + 1] {partition_indices = [5, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %173 = arith.mulf %172, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %174 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %175 = arith.addf %173, %174 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %175, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %176 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %177 = arith.mulf %176, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %178 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %179 = arith.addf %177, %178 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %179, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %180 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8 + 1] {partition_indices = [6, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %181 = arith.mulf %180, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %182 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %183 = arith.addf %181, %182 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %183, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %184 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %185 = arith.mulf %184, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %186 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %187 = arith.addf %185, %186 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %187, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %188 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8 + 1] {partition_indices = [7, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %189 = arith.mulf %188, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %190 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %191 = arith.addf %189, %190 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %191, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %192 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %193 = arith.mulf %192, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %194 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %195 = arith.addf %193, %194 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %195, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %196 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8 + 1] {partition_indices = [8, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %197 = arith.mulf %196, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %198 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %199 = arith.addf %197, %198 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %199, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %200 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %201 = arith.mulf %200, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %202 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %203 = arith.addf %201, %202 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %203, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %204 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8 + 1] {partition_indices = [9, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %205 = arith.mulf %204, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %206 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %207 = arith.addf %205, %206 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %207, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %208 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %209 = arith.mulf %208, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %210 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %211 = arith.addf %209, %210 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %211, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %212 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8 + 1] {partition_indices = [10, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %213 = arith.mulf %212, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %214 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %215 = arith.addf %213, %214 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %215, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %216 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %217 = arith.mulf %216, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %218 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %219 = arith.addf %217, %218 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %219, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %220 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8 + 1] {partition_indices = [11, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %221 = arith.mulf %220, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %222 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %223 = arith.addf %221, %222 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %223, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %224 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %225 = arith.mulf %224, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %226 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %227 = arith.addf %225, %226 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %227, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %228 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8 + 1] {partition_indices = [12, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %229 = arith.mulf %228, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %230 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %231 = arith.addf %229, %230 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %231, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %232 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %233 = arith.mulf %232, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %234 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %235 = arith.addf %233, %234 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %235, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %236 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8 + 1] {partition_indices = [13, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %237 = arith.mulf %236, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %238 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %239 = arith.addf %237, %238 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %239, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %240 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %241 = arith.mulf %240, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %242 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %243 = arith.addf %241, %242 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %243, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %244 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8 + 1] {partition_indices = [14, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %245 = arith.mulf %244, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %246 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %247 = arith.addf %245, %246 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %247, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %248 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %249 = arith.mulf %248, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %250 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %251 = arith.addf %249, %250 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %251, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %252 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8 + 1] {partition_indices = [15, 1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %253 = arith.mulf %252, %131 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %254 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %255 = arith.addf %253, %254 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %255, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %256 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %257 = arith.mulf %256, %136 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %258 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %259 = arith.addf %257, %258 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %259, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %260 = affine.load %arg2[%arg8 * 16, %arg7 * 8 + 2] {partition_indices = [0, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %261 = affine.load %arg5[%arg7 * 8 + 2] {partition_indices = [0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %262 = arith.mulf %260, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %263 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %264 = arith.addf %262, %263 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %264, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %265 = affine.load %arg3[%arg8 * 64, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %266 = affine.load %arg5[%arg7 * 2 + 2] {partition_indices = [0], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %267 = arith.mulf %265, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %268 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %269 = arith.addf %267, %268 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %269, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %270 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8 + 2] {partition_indices = [1, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %271 = arith.mulf %270, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %272 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %273 = arith.addf %271, %272 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %273, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %274 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %275 = arith.mulf %274, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %276 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %277 = arith.addf %275, %276 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %277, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %278 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8 + 2] {partition_indices = [2, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %279 = arith.mulf %278, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %280 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %281 = arith.addf %279, %280 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %281, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %282 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %283 = arith.mulf %282, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %284 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %285 = arith.addf %283, %284 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %285, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %286 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8 + 2] {partition_indices = [3, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %287 = arith.mulf %286, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %288 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %289 = arith.addf %287, %288 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %289, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %290 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %291 = arith.mulf %290, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %292 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %293 = arith.addf %291, %292 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %293, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %294 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8 + 2] {partition_indices = [4, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %295 = arith.mulf %294, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %296 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %297 = arith.addf %295, %296 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %297, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %298 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %299 = arith.mulf %298, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %300 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %301 = arith.addf %299, %300 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %301, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %302 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8 + 2] {partition_indices = [5, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %303 = arith.mulf %302, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %304 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %305 = arith.addf %303, %304 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %305, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %306 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %307 = arith.mulf %306, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %308 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %309 = arith.addf %307, %308 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %309, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %310 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8 + 2] {partition_indices = [6, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %311 = arith.mulf %310, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %312 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %313 = arith.addf %311, %312 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %313, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %314 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %315 = arith.mulf %314, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %316 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %317 = arith.addf %315, %316 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %317, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %318 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8 + 2] {partition_indices = [7, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %319 = arith.mulf %318, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %320 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %321 = arith.addf %319, %320 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %321, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %322 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %323 = arith.mulf %322, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %324 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %325 = arith.addf %323, %324 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %325, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %326 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8 + 2] {partition_indices = [8, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %327 = arith.mulf %326, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %328 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %329 = arith.addf %327, %328 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %329, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %330 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %331 = arith.mulf %330, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %332 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %333 = arith.addf %331, %332 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %333, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %334 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8 + 2] {partition_indices = [9, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %335 = arith.mulf %334, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %336 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %337 = arith.addf %335, %336 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %337, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %338 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %339 = arith.mulf %338, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %340 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %341 = arith.addf %339, %340 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %341, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %342 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8 + 2] {partition_indices = [10, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %343 = arith.mulf %342, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %344 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %345 = arith.addf %343, %344 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %345, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %346 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %347 = arith.mulf %346, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %348 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %349 = arith.addf %347, %348 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %349, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %350 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8 + 2] {partition_indices = [11, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %351 = arith.mulf %350, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %352 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %353 = arith.addf %351, %352 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %353, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %354 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %355 = arith.mulf %354, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %356 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %357 = arith.addf %355, %356 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %357, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %358 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8 + 2] {partition_indices = [12, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %359 = arith.mulf %358, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %360 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %361 = arith.addf %359, %360 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %361, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %362 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %363 = arith.mulf %362, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %364 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %365 = arith.addf %363, %364 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %365, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %366 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8 + 2] {partition_indices = [13, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %367 = arith.mulf %366, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %368 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %369 = arith.addf %367, %368 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %369, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %370 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %371 = arith.mulf %370, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %372 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %373 = arith.addf %371, %372 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %373, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %374 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8 + 2] {partition_indices = [14, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %375 = arith.mulf %374, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %376 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %377 = arith.addf %375, %376 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %377, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %378 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %379 = arith.mulf %378, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %380 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %381 = arith.addf %379, %380 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %381, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %382 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8 + 2] {partition_indices = [15, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %383 = arith.mulf %382, %261 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %384 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %385 = arith.addf %383, %384 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %385, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %386 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %387 = arith.mulf %386, %266 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %388 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %389 = arith.addf %387, %388 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %389, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %390 = affine.load %arg2[%arg8 * 16, %arg7 * 8 + 3] {partition_indices = [0, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %391 = affine.load %arg5[%arg7 * 8 + 3] {partition_indices = [1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %392 = arith.mulf %390, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %393 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %394 = arith.addf %392, %393 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %394, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %395 = affine.load %arg3[%arg8 * 64, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %396 = affine.load %arg5[%arg7 * 2 + 3] {partition_indices = [1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %397 = arith.mulf %395, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %398 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %399 = arith.addf %397, %398 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %399, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %400 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8 + 3] {partition_indices = [1, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %401 = arith.mulf %400, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %402 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %403 = arith.addf %401, %402 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %403, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %404 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %405 = arith.mulf %404, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %406 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %407 = arith.addf %405, %406 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %407, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %408 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8 + 3] {partition_indices = [2, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %409 = arith.mulf %408, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %410 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %411 = arith.addf %409, %410 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %411, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %412 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %413 = arith.mulf %412, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %414 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %415 = arith.addf %413, %414 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %415, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %416 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8 + 3] {partition_indices = [3, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %417 = arith.mulf %416, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %418 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %419 = arith.addf %417, %418 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %419, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %420 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %421 = arith.mulf %420, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %422 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %423 = arith.addf %421, %422 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %423, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %424 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8 + 3] {partition_indices = [4, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %425 = arith.mulf %424, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %426 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %427 = arith.addf %425, %426 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %427, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %428 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %429 = arith.mulf %428, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %430 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %431 = arith.addf %429, %430 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %431, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %432 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8 + 3] {partition_indices = [5, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %433 = arith.mulf %432, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %434 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %435 = arith.addf %433, %434 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %435, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %436 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %437 = arith.mulf %436, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %438 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %439 = arith.addf %437, %438 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %439, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %440 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8 + 3] {partition_indices = [6, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %441 = arith.mulf %440, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %442 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %443 = arith.addf %441, %442 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %443, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %444 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %445 = arith.mulf %444, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %446 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %447 = arith.addf %445, %446 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %447, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %448 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8 + 3] {partition_indices = [7, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %449 = arith.mulf %448, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %450 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %451 = arith.addf %449, %450 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %451, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %452 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %453 = arith.mulf %452, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %454 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %455 = arith.addf %453, %454 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %455, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %456 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8 + 3] {partition_indices = [8, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %457 = arith.mulf %456, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %458 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %459 = arith.addf %457, %458 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %459, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %460 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %461 = arith.mulf %460, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %462 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %463 = arith.addf %461, %462 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %463, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %464 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8 + 3] {partition_indices = [9, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %465 = arith.mulf %464, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %466 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %467 = arith.addf %465, %466 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %467, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %468 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %469 = arith.mulf %468, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %470 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %471 = arith.addf %469, %470 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %471, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %472 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8 + 3] {partition_indices = [10, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %473 = arith.mulf %472, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %474 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %475 = arith.addf %473, %474 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %475, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %476 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %477 = arith.mulf %476, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %478 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %479 = arith.addf %477, %478 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %479, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %480 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8 + 3] {partition_indices = [11, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %481 = arith.mulf %480, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %482 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %483 = arith.addf %481, %482 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %483, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %484 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %485 = arith.mulf %484, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %486 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %487 = arith.addf %485, %486 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %487, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %488 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8 + 3] {partition_indices = [12, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %489 = arith.mulf %488, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %490 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %491 = arith.addf %489, %490 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %491, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %492 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %493 = arith.mulf %492, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %494 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %495 = arith.addf %493, %494 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %495, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %496 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8 + 3] {partition_indices = [13, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %497 = arith.mulf %496, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %498 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %499 = arith.addf %497, %498 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %499, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %500 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %501 = arith.mulf %500, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %502 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %503 = arith.addf %501, %502 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %503, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %504 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8 + 3] {partition_indices = [14, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %505 = arith.mulf %504, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %506 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %507 = arith.addf %505, %506 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %507, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %508 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %509 = arith.mulf %508, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %510 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %511 = arith.addf %509, %510 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %511, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %512 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8 + 3] {partition_indices = [15, 3], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %513 = arith.mulf %512, %391 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %514 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %515 = arith.addf %513, %514 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %515, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %516 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %517 = arith.mulf %516, %396 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %518 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %519 = arith.addf %517, %518 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %519, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %520 = affine.load %arg2[%arg8 * 16, %arg7 * 8 + 4] {partition_indices = [0, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %521 = affine.load %arg5[%arg7 * 8 + 4] {partition_indices = [0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %522 = arith.mulf %520, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %523 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %524 = arith.addf %522, %523 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %524, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %525 = affine.load %arg3[%arg8 * 64, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %526 = affine.load %arg5[%arg7 * 2 + 4] {partition_indices = [0], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %527 = arith.mulf %525, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %528 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %529 = arith.addf %527, %528 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %529, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %530 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8 + 4] {partition_indices = [1, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %531 = arith.mulf %530, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %532 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %533 = arith.addf %531, %532 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %533, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %534 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %535 = arith.mulf %534, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %536 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %537 = arith.addf %535, %536 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %537, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %538 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8 + 4] {partition_indices = [2, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %539 = arith.mulf %538, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %540 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %541 = arith.addf %539, %540 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %541, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %542 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %543 = arith.mulf %542, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %544 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %545 = arith.addf %543, %544 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %545, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %546 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8 + 4] {partition_indices = [3, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %547 = arith.mulf %546, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %548 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %549 = arith.addf %547, %548 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %549, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %550 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %551 = arith.mulf %550, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %552 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %553 = arith.addf %551, %552 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %553, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %554 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8 + 4] {partition_indices = [4, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %555 = arith.mulf %554, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %556 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %557 = arith.addf %555, %556 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %557, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %558 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %559 = arith.mulf %558, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %560 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %561 = arith.addf %559, %560 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %561, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %562 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8 + 4] {partition_indices = [5, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %563 = arith.mulf %562, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %564 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %565 = arith.addf %563, %564 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %565, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %566 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %567 = arith.mulf %566, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %568 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %569 = arith.addf %567, %568 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %569, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %570 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8 + 4] {partition_indices = [6, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %571 = arith.mulf %570, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %572 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %573 = arith.addf %571, %572 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %573, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %574 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %575 = arith.mulf %574, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %576 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %577 = arith.addf %575, %576 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %577, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %578 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8 + 4] {partition_indices = [7, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %579 = arith.mulf %578, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %580 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %581 = arith.addf %579, %580 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %581, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %582 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %583 = arith.mulf %582, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %584 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %585 = arith.addf %583, %584 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %585, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %586 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8 + 4] {partition_indices = [8, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %587 = arith.mulf %586, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %588 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %589 = arith.addf %587, %588 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %589, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %590 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %591 = arith.mulf %590, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %592 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %593 = arith.addf %591, %592 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %593, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %594 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8 + 4] {partition_indices = [9, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %595 = arith.mulf %594, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %596 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %597 = arith.addf %595, %596 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %597, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %598 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %599 = arith.mulf %598, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %600 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %601 = arith.addf %599, %600 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %601, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %602 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8 + 4] {partition_indices = [10, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %603 = arith.mulf %602, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %604 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %605 = arith.addf %603, %604 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %605, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %606 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %607 = arith.mulf %606, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %608 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %609 = arith.addf %607, %608 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %609, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %610 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8 + 4] {partition_indices = [11, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %611 = arith.mulf %610, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %612 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %613 = arith.addf %611, %612 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %613, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %614 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %615 = arith.mulf %614, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %616 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %617 = arith.addf %615, %616 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %617, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %618 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8 + 4] {partition_indices = [12, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %619 = arith.mulf %618, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %620 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %621 = arith.addf %619, %620 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %621, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %622 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %623 = arith.mulf %622, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %624 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %625 = arith.addf %623, %624 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %625, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %626 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8 + 4] {partition_indices = [13, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %627 = arith.mulf %626, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %628 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %629 = arith.addf %627, %628 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %629, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %630 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %631 = arith.mulf %630, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %632 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %633 = arith.addf %631, %632 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %633, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %634 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8 + 4] {partition_indices = [14, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %635 = arith.mulf %634, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %636 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %637 = arith.addf %635, %636 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %637, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %638 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %639 = arith.mulf %638, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %640 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %641 = arith.addf %639, %640 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %641, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %642 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8 + 4] {partition_indices = [15, 4], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %643 = arith.mulf %642, %521 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %644 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %645 = arith.addf %643, %644 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %645, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %646 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %647 = arith.mulf %646, %526 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %648 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %649 = arith.addf %647, %648 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %649, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %650 = affine.load %arg2[%arg8 * 16, %arg7 * 8 + 5] {partition_indices = [0, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %651 = affine.load %arg5[%arg7 * 8 + 5] {partition_indices = [1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %652 = arith.mulf %650, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %653 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %654 = arith.addf %652, %653 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %654, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %655 = affine.load %arg3[%arg8 * 64, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %656 = affine.load %arg5[%arg7 * 2 + 5] {partition_indices = [1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %657 = arith.mulf %655, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %658 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %659 = arith.addf %657, %658 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %659, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %660 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8 + 5] {partition_indices = [1, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %661 = arith.mulf %660, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %662 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %663 = arith.addf %661, %662 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %663, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %664 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %665 = arith.mulf %664, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %666 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %667 = arith.addf %665, %666 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %667, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %668 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8 + 5] {partition_indices = [2, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %669 = arith.mulf %668, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %670 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %671 = arith.addf %669, %670 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %671, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %672 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %673 = arith.mulf %672, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %674 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %675 = arith.addf %673, %674 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %675, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %676 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8 + 5] {partition_indices = [3, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %677 = arith.mulf %676, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %678 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %679 = arith.addf %677, %678 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %679, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %680 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %681 = arith.mulf %680, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %682 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %683 = arith.addf %681, %682 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %683, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %684 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8 + 5] {partition_indices = [4, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %685 = arith.mulf %684, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %686 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %687 = arith.addf %685, %686 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %687, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %688 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %689 = arith.mulf %688, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %690 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %691 = arith.addf %689, %690 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %691, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %692 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8 + 5] {partition_indices = [5, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %693 = arith.mulf %692, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %694 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %695 = arith.addf %693, %694 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %695, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %696 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %697 = arith.mulf %696, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %698 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %699 = arith.addf %697, %698 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %699, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %700 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8 + 5] {partition_indices = [6, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %701 = arith.mulf %700, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %702 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %703 = arith.addf %701, %702 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %703, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %704 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %705 = arith.mulf %704, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %706 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %707 = arith.addf %705, %706 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %707, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %708 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8 + 5] {partition_indices = [7, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %709 = arith.mulf %708, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %710 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %711 = arith.addf %709, %710 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %711, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %712 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %713 = arith.mulf %712, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %714 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %715 = arith.addf %713, %714 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %715, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %716 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8 + 5] {partition_indices = [8, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %717 = arith.mulf %716, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %718 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %719 = arith.addf %717, %718 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %719, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %720 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %721 = arith.mulf %720, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %722 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %723 = arith.addf %721, %722 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %723, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %724 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8 + 5] {partition_indices = [9, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %725 = arith.mulf %724, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %726 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %727 = arith.addf %725, %726 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %727, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %728 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %729 = arith.mulf %728, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %730 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %731 = arith.addf %729, %730 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %731, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %732 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8 + 5] {partition_indices = [10, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %733 = arith.mulf %732, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %734 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %735 = arith.addf %733, %734 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %735, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %736 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %737 = arith.mulf %736, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %738 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %739 = arith.addf %737, %738 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %739, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %740 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8 + 5] {partition_indices = [11, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %741 = arith.mulf %740, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %742 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %743 = arith.addf %741, %742 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %743, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %744 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %745 = arith.mulf %744, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %746 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %747 = arith.addf %745, %746 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %747, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %748 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8 + 5] {partition_indices = [12, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %749 = arith.mulf %748, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %750 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %751 = arith.addf %749, %750 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %751, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %752 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %753 = arith.mulf %752, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %754 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %755 = arith.addf %753, %754 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %755, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %756 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8 + 5] {partition_indices = [13, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %757 = arith.mulf %756, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %758 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %759 = arith.addf %757, %758 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %759, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %760 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %761 = arith.mulf %760, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %762 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %763 = arith.addf %761, %762 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %763, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %764 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8 + 5] {partition_indices = [14, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %765 = arith.mulf %764, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %766 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %767 = arith.addf %765, %766 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %767, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %768 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %769 = arith.mulf %768, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %770 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %771 = arith.addf %769, %770 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %771, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %772 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8 + 5] {partition_indices = [15, 5], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %773 = arith.mulf %772, %651 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %774 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %775 = arith.addf %773, %774 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %775, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %776 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %777 = arith.mulf %776, %656 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %778 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %779 = arith.addf %777, %778 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %779, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %780 = affine.load %arg2[%arg8 * 16, %arg7 * 8 + 6] {partition_indices = [0, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %781 = affine.load %arg5[%arg7 * 8 + 6] {partition_indices = [0], timing = #hls.t<48 -> 50, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %782 = arith.mulf %780, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %783 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %784 = arith.addf %782, %783 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %784, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %785 = affine.load %arg3[%arg8 * 64, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %786 = affine.load %arg5[%arg7 * 2 + 6] {partition_indices = [0], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %787 = arith.mulf %785, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %788 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %789 = arith.addf %787, %788 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %789, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %790 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8 + 6] {partition_indices = [1, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %791 = arith.mulf %790, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %792 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %793 = arith.addf %791, %792 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %793, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %794 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %795 = arith.mulf %794, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %796 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %797 = arith.addf %795, %796 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %797, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %798 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8 + 6] {partition_indices = [2, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %799 = arith.mulf %798, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %800 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %801 = arith.addf %799, %800 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %801, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %802 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %803 = arith.mulf %802, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %804 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %805 = arith.addf %803, %804 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %805, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %806 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8 + 6] {partition_indices = [3, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %807 = arith.mulf %806, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %808 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %809 = arith.addf %807, %808 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %809, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %810 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %811 = arith.mulf %810, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %812 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %813 = arith.addf %811, %812 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %813, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %814 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8 + 6] {partition_indices = [4, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %815 = arith.mulf %814, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %816 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %817 = arith.addf %815, %816 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %817, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %818 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %819 = arith.mulf %818, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %820 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %821 = arith.addf %819, %820 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %821, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %822 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8 + 6] {partition_indices = [5, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %823 = arith.mulf %822, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %824 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %825 = arith.addf %823, %824 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %825, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %826 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %827 = arith.mulf %826, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %828 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %829 = arith.addf %827, %828 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %829, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %830 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8 + 6] {partition_indices = [6, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %831 = arith.mulf %830, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %832 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %833 = arith.addf %831, %832 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %833, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %834 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %835 = arith.mulf %834, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %836 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %837 = arith.addf %835, %836 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %837, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %838 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8 + 6] {partition_indices = [7, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %839 = arith.mulf %838, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %840 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %841 = arith.addf %839, %840 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %841, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %842 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %843 = arith.mulf %842, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %844 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %845 = arith.addf %843, %844 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %845, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %846 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8 + 6] {partition_indices = [8, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %847 = arith.mulf %846, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %848 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %849 = arith.addf %847, %848 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %849, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %850 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %851 = arith.mulf %850, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %852 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %853 = arith.addf %851, %852 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %853, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %854 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8 + 6] {partition_indices = [9, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %855 = arith.mulf %854, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %856 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %857 = arith.addf %855, %856 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %857, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %858 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %859 = arith.mulf %858, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %860 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %861 = arith.addf %859, %860 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %861, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %862 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8 + 6] {partition_indices = [10, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %863 = arith.mulf %862, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %864 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %865 = arith.addf %863, %864 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %865, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %866 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %867 = arith.mulf %866, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %868 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %869 = arith.addf %867, %868 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %869, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %870 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8 + 6] {partition_indices = [11, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %871 = arith.mulf %870, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %872 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %873 = arith.addf %871, %872 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %873, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %874 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %875 = arith.mulf %874, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %876 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %877 = arith.addf %875, %876 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %877, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %878 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8 + 6] {partition_indices = [12, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %879 = arith.mulf %878, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %880 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %881 = arith.addf %879, %880 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %881, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %882 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %883 = arith.mulf %882, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %884 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %885 = arith.addf %883, %884 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %885, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %886 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8 + 6] {partition_indices = [13, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %887 = arith.mulf %886, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %888 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %889 = arith.addf %887, %888 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %889, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %890 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %891 = arith.mulf %890, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %892 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %893 = arith.addf %891, %892 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %893, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %894 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8 + 6] {partition_indices = [14, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %895 = arith.mulf %894, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %896 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %897 = arith.addf %895, %896 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %897, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %898 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %899 = arith.mulf %898, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %900 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %901 = arith.addf %899, %900 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %901, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %902 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8 + 6] {partition_indices = [15, 6], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %903 = arith.mulf %902, %781 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %904 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %905 = arith.addf %903, %904 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %905, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %906 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %907 = arith.mulf %906, %786 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %908 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %909 = arith.addf %907, %908 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %909, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %910 = affine.load %arg2[%arg8 * 16, %arg7 * 8 + 7] {partition_indices = [0, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %911 = affine.load %arg5[%arg7 * 8 + 7] {partition_indices = [1], timing = #hls.t<56 -> 58, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %912 = arith.mulf %910, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %913 = affine.load %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %914 = arith.addf %912, %913 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %914, %arg4[%arg8 * 16] {partition_indices = [0], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %915 = affine.load %arg3[%arg8 * 64, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %916 = affine.load %arg5[%arg7 * 2 + 7] {partition_indices = [1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %917 = arith.mulf %915, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %918 = affine.load %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %919 = arith.addf %917, %918 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %919, %arg6[%arg8 * 64] {partition_indices = [0], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %920 = affine.load %arg2[%arg8 * 16 + 1, %arg7 * 8 + 7] {partition_indices = [1, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %921 = arith.mulf %920, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %922 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %923 = arith.addf %921, %922 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %923, %arg4[%arg8 * 16 + 1] {partition_indices = [1], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %924 = affine.load %arg3[%arg8 * 64 + 1, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [1, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %925 = arith.mulf %924, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %926 = affine.load %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %927 = arith.addf %925, %926 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %927, %arg6[%arg8 * 64 + 1] {partition_indices = [1], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %928 = affine.load %arg2[%arg8 * 16 + 2, %arg7 * 8 + 7] {partition_indices = [2, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %929 = arith.mulf %928, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %930 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %931 = arith.addf %929, %930 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %931, %arg4[%arg8 * 16 + 2] {partition_indices = [2], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %932 = affine.load %arg3[%arg8 * 64 + 2, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [2, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %933 = arith.mulf %932, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %934 = affine.load %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %935 = arith.addf %933, %934 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %935, %arg6[%arg8 * 64 + 2] {partition_indices = [2], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %936 = affine.load %arg2[%arg8 * 16 + 3, %arg7 * 8 + 7] {partition_indices = [3, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %937 = arith.mulf %936, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %938 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %939 = arith.addf %937, %938 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %939, %arg4[%arg8 * 16 + 3] {partition_indices = [3], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %940 = affine.load %arg3[%arg8 * 64 + 3, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [3, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %941 = arith.mulf %940, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %942 = affine.load %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %943 = arith.addf %941, %942 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %943, %arg6[%arg8 * 64 + 3] {partition_indices = [3], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %944 = affine.load %arg2[%arg8 * 16 + 4, %arg7 * 8 + 7] {partition_indices = [4, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %945 = arith.mulf %944, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %946 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %947 = arith.addf %945, %946 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %947, %arg4[%arg8 * 16 + 4] {partition_indices = [4], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %948 = affine.load %arg3[%arg8 * 64 + 4, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [4, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %949 = arith.mulf %948, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %950 = affine.load %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %951 = arith.addf %949, %950 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %951, %arg6[%arg8 * 64 + 4] {partition_indices = [4], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %952 = affine.load %arg2[%arg8 * 16 + 5, %arg7 * 8 + 7] {partition_indices = [5, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %953 = arith.mulf %952, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %954 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %955 = arith.addf %953, %954 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %955, %arg4[%arg8 * 16 + 5] {partition_indices = [5], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %956 = affine.load %arg3[%arg8 * 64 + 5, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [5, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %957 = arith.mulf %956, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %958 = affine.load %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %959 = arith.addf %957, %958 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %959, %arg6[%arg8 * 64 + 5] {partition_indices = [5], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %960 = affine.load %arg2[%arg8 * 16 + 6, %arg7 * 8 + 7] {partition_indices = [6, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %961 = arith.mulf %960, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %962 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %963 = arith.addf %961, %962 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %963, %arg4[%arg8 * 16 + 6] {partition_indices = [6], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %964 = affine.load %arg3[%arg8 * 64 + 6, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [6, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %965 = arith.mulf %964, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %966 = affine.load %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %967 = arith.addf %965, %966 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %967, %arg6[%arg8 * 64 + 6] {partition_indices = [6], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %968 = affine.load %arg2[%arg8 * 16 + 7, %arg7 * 8 + 7] {partition_indices = [7, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %969 = arith.mulf %968, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %970 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %971 = arith.addf %969, %970 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %971, %arg4[%arg8 * 16 + 7] {partition_indices = [7], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %972 = affine.load %arg3[%arg8 * 64 + 7, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [7, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %973 = arith.mulf %972, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %974 = affine.load %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %975 = arith.addf %973, %974 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %975, %arg6[%arg8 * 64 + 7] {partition_indices = [7], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %976 = affine.load %arg2[%arg8 * 16 + 8, %arg7 * 8 + 7] {partition_indices = [8, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %977 = arith.mulf %976, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %978 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %979 = arith.addf %977, %978 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %979, %arg4[%arg8 * 16 + 8] {partition_indices = [8], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %980 = affine.load %arg3[%arg8 * 64 + 8, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [8, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %981 = arith.mulf %980, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %982 = affine.load %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %983 = arith.addf %981, %982 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %983, %arg6[%arg8 * 64 + 8] {partition_indices = [8], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %984 = affine.load %arg2[%arg8 * 16 + 9, %arg7 * 8 + 7] {partition_indices = [9, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %985 = arith.mulf %984, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %986 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %987 = arith.addf %985, %986 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %987, %arg4[%arg8 * 16 + 9] {partition_indices = [9], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %988 = affine.load %arg3[%arg8 * 64 + 9, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [9, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %989 = arith.mulf %988, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %990 = affine.load %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %991 = arith.addf %989, %990 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %991, %arg6[%arg8 * 64 + 9] {partition_indices = [9], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %992 = affine.load %arg2[%arg8 * 16 + 10, %arg7 * 8 + 7] {partition_indices = [10, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %993 = arith.mulf %992, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %994 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %995 = arith.addf %993, %994 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %995, %arg4[%arg8 * 16 + 10] {partition_indices = [10], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %996 = affine.load %arg3[%arg8 * 64 + 10, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [10, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %997 = arith.mulf %996, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %998 = affine.load %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %999 = arith.addf %997, %998 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %999, %arg6[%arg8 * 64 + 10] {partition_indices = [10], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1000 = affine.load %arg2[%arg8 * 16 + 11, %arg7 * 8 + 7] {partition_indices = [11, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1001 = arith.mulf %1000, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1002 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1003 = arith.addf %1001, %1002 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1003, %arg4[%arg8 * 16 + 11] {partition_indices = [11], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1004 = affine.load %arg3[%arg8 * 64 + 11, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [11, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1005 = arith.mulf %1004, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1006 = affine.load %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1007 = arith.addf %1005, %1006 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1007, %arg6[%arg8 * 64 + 11] {partition_indices = [11], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1008 = affine.load %arg2[%arg8 * 16 + 12, %arg7 * 8 + 7] {partition_indices = [12, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1009 = arith.mulf %1008, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1010 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1011 = arith.addf %1009, %1010 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1011, %arg4[%arg8 * 16 + 12] {partition_indices = [12], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1012 = affine.load %arg3[%arg8 * 64 + 12, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [12, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1013 = arith.mulf %1012, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1014 = affine.load %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1015 = arith.addf %1013, %1014 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1015, %arg6[%arg8 * 64 + 12] {partition_indices = [12], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1016 = affine.load %arg2[%arg8 * 16 + 13, %arg7 * 8 + 7] {partition_indices = [13, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1017 = arith.mulf %1016, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1018 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1019 = arith.addf %1017, %1018 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1019, %arg4[%arg8 * 16 + 13] {partition_indices = [13], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1020 = affine.load %arg3[%arg8 * 64 + 13, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [13, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1021 = arith.mulf %1020, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1022 = affine.load %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1023 = arith.addf %1021, %1022 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1023, %arg6[%arg8 * 64 + 13] {partition_indices = [13], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1024 = affine.load %arg2[%arg8 * 16 + 14, %arg7 * 8 + 7] {partition_indices = [14, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1025 = arith.mulf %1024, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1026 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1027 = arith.addf %1025, %1026 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1027, %arg4[%arg8 * 16 + 14] {partition_indices = [14], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1028 = affine.load %arg3[%arg8 * 64 + 14, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [14, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1029 = arith.mulf %1028, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1030 = affine.load %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1031 = arith.addf %1029, %1030 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1031, %arg6[%arg8 * 64 + 14] {partition_indices = [14], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1032 = affine.load %arg2[%arg8 * 16 + 15, %arg7 * 8 + 7] {partition_indices = [15, 7], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1033 = arith.mulf %1032, %911 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1034 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1035 = arith.addf %1033, %1034 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1035, %arg4[%arg8 * 16 + 15] {partition_indices = [15], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1036 = affine.load %arg3[%arg8 * 64 + 15, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [15, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        %1037 = arith.mulf %1036, %916 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %1038 = affine.load %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %1039 = arith.addf %1037, %1038 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %1039, %arg6[%arg8 * 64 + 15] {partition_indices = [15], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=256, iterLatency=69, minII=8>, parallel, timing = #hls.t<65538 -> 67649, 2111, 2111>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=131072, iterLatency=69, minII=8>, timing = #hls.t<0 -> 1048639, 1048639, 1048639>}
    affine.for %arg7 = 0 to 4096 {
      %0 = affine.load %arg4[%arg7] {max_mux_size = 16 : i64, partition_indices = [-1], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      %1 = arith.mulf %arg0, %0 {timing = #hls.t<2 -> 6, 4, 1>} : f32
      %2 = arith.addf %arg1, %1 {timing = #hls.t<6 -> 11, 5, 1>} : f32
      %3 = affine.load %arg6[%arg7] {max_mux_size = 16 : i64, partition_indices = [-1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      %4 = arith.mulf %2, %3 {timing = #hls.t<11 -> 15, 4, 1>} : f32
      affine.store %4, %arg6[%arg7] {max_mux_size = 16 : i64, partition_indices = [-1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=16, minII=16>, parallel, timing = #hls.t<1048639 -> 1114177, 65538, 65538>}
    return {timing = #hls.t<1114177 -> 1114177, 0, 0>}
  }
}