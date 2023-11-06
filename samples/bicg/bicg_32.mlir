module {
  func @bicg_32(%arg0: memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg1: memref<32xf32, affine_map<(d0) -> (0, d0)>>, %arg2: memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg3: memref<32xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>) attributes {resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 1167, 1167, 1167>, top_func} {
    affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 2 {
        %0 = affine.load %arg0[%arg5, %arg6 * 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<27 -> 29, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = affine.load %arg3[%arg5] {partition_indices = [0], timing = #hls.t<10 -> 12, 2, 1>} : memref<32xf32, affine_map<(d0) -> (0, d0)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %3 = affine.load %arg4[%arg6 * 16] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %4, %arg4[%arg6 * 16] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %5 = affine.load %arg0[%arg6 * 16, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<26 -> 28, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %6 = affine.load %arg1[%arg5] {partition_indices = [0], timing = #hls.t<10 -> 12, 2, 1>} : memref<32xf32, affine_map<(d0) -> (0, d0)>>
        %7 = arith.mulf %5, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %8 = affine.load %arg2[%arg6 * 16] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %9 = arith.addf %7, %8 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %9, %arg2[%arg6 * 16] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %10 = affine.load %arg0[%arg5, %arg6 * 16 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<25 -> 27, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %11 = arith.mulf %10, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %12 = affine.load %arg4[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %13 = arith.addf %11, %12 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %13, %arg4[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %14 = affine.load %arg0[%arg6 * 16 + 1, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %15 = arith.mulf %14, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %16 = affine.load %arg2[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %17 = arith.addf %15, %16 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %17, %arg2[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %18 = affine.load %arg0[%arg5, %arg6 * 16 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<25 -> 27, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %19 = arith.mulf %18, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %20 = affine.load %arg4[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %21 = arith.addf %19, %20 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %21, %arg4[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %22 = affine.load %arg0[%arg6 * 16 + 2, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %23 = arith.mulf %22, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %24 = affine.load %arg2[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %25 = arith.addf %23, %24 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %25, %arg2[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %26 = affine.load %arg0[%arg5, %arg6 * 16 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<23 -> 25, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %27 = arith.mulf %26, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %28 = affine.load %arg4[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %29 = arith.addf %27, %28 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %29, %arg4[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %30 = affine.load %arg0[%arg6 * 16 + 3, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %31 = arith.mulf %30, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %32 = affine.load %arg2[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %33 = arith.addf %31, %32 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %33, %arg2[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %34 = affine.load %arg0[%arg5, %arg6 * 16 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<23 -> 25, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %35 = arith.mulf %34, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %36 = affine.load %arg4[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %37 = arith.addf %35, %36 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %37, %arg4[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %38 = affine.load %arg0[%arg6 * 16 + 4, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %39 = arith.mulf %38, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %40 = affine.load %arg2[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %41 = arith.addf %39, %40 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %41, %arg2[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %42 = affine.load %arg0[%arg5, %arg6 * 16 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<21 -> 23, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %43 = arith.mulf %42, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %44 = affine.load %arg4[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %45 = arith.addf %43, %44 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %45, %arg4[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %46 = affine.load %arg0[%arg6 * 16 + 5, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %47 = arith.mulf %46, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %48 = affine.load %arg2[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %49 = arith.addf %47, %48 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %49, %arg2[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %50 = affine.load %arg0[%arg5, %arg6 * 16 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<21 -> 23, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %51 = arith.mulf %50, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %52 = affine.load %arg4[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %53 = arith.addf %51, %52 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %53, %arg4[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %54 = affine.load %arg0[%arg6 * 16 + 6, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %55 = arith.mulf %54, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %56 = affine.load %arg2[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %57 = arith.addf %55, %56 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %57, %arg2[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %58 = affine.load %arg0[%arg5, %arg6 * 16 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<19 -> 21, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %59 = arith.mulf %58, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %60 = affine.load %arg4[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %61 = arith.addf %59, %60 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %61, %arg4[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %62 = affine.load %arg0[%arg6 * 16 + 7, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %63 = arith.mulf %62, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %64 = affine.load %arg2[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %65 = arith.addf %63, %64 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %65, %arg2[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %66 = affine.load %arg0[%arg5, %arg6 * 16 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<19 -> 21, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %67 = arith.mulf %66, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %68 = affine.load %arg4[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %69 = arith.addf %67, %68 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %69, %arg4[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %70 = affine.load %arg0[%arg6 * 16 + 8, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %71 = arith.mulf %70, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %72 = affine.load %arg2[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %73 = arith.addf %71, %72 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %73, %arg2[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %74 = affine.load %arg0[%arg5, %arg6 * 16 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<17 -> 19, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %75 = arith.mulf %74, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %76 = affine.load %arg4[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %77 = arith.addf %75, %76 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %77, %arg4[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %78 = affine.load %arg0[%arg6 * 16 + 9, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %79 = arith.mulf %78, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %80 = affine.load %arg2[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %81 = arith.addf %79, %80 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %81, %arg2[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %82 = affine.load %arg0[%arg5, %arg6 * 16 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<17 -> 19, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %83 = arith.mulf %82, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %84 = affine.load %arg4[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %85 = arith.addf %83, %84 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %85, %arg4[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %86 = affine.load %arg0[%arg6 * 16 + 10, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %87 = arith.mulf %86, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %88 = affine.load %arg2[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %89 = arith.addf %87, %88 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %89, %arg2[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %90 = affine.load %arg0[%arg5, %arg6 * 16 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<15 -> 17, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %91 = arith.mulf %90, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %92 = affine.load %arg4[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %93 = arith.addf %91, %92 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %93, %arg4[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %94 = affine.load %arg0[%arg6 * 16 + 11, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %95 = arith.mulf %94, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %96 = affine.load %arg2[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %97 = arith.addf %95, %96 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %97, %arg2[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %98 = affine.load %arg0[%arg5, %arg6 * 16 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<15 -> 17, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %99 = arith.mulf %98, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %100 = affine.load %arg4[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %101 = arith.addf %99, %100 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %101, %arg4[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %102 = affine.load %arg0[%arg6 * 16 + 12, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %103 = arith.mulf %102, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %104 = affine.load %arg2[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %105 = arith.addf %103, %104 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %105, %arg2[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %106 = affine.load %arg0[%arg5, %arg6 * 16 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<13 -> 15, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %107 = arith.mulf %106, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %108 = affine.load %arg4[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %109 = arith.addf %107, %108 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %109, %arg4[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %110 = affine.load %arg0[%arg6 * 16 + 13, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %111 = arith.mulf %110, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %112 = affine.load %arg2[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %113 = arith.addf %111, %112 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %113, %arg2[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %114 = affine.load %arg0[%arg5, %arg6 * 16 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<13 -> 15, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %115 = arith.mulf %114, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %116 = affine.load %arg4[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %117 = arith.addf %115, %116 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %117, %arg4[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %118 = affine.load %arg0[%arg6 * 16 + 14, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %119 = arith.mulf %118, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %120 = affine.load %arg2[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %121 = arith.addf %119, %120 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %121, %arg2[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %122 = affine.load %arg0[%arg5, %arg6 * 16 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<11 -> 13, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %123 = arith.mulf %122, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %124 = affine.load %arg4[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %125 = arith.addf %123, %124 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %125, %arg4[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %126 = affine.load %arg0[%arg6 * 16 + 15, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %127 = arith.mulf %126, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %128 = affine.load %arg2[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %129 = arith.addf %127, %128 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %129, %arg2[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<32xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2, iterLatency=29, minII=18>, parallel, timing = #hls.t<0 -> 49, 49, 49>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=64, iterLatency=29, minII=18>, resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 1165, 1165, 1165>}
    return
  }
}