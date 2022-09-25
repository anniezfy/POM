module {
  func @bicg(%arg0: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg1: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg2: memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>, %arg3: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>) attributes {resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 16842768, 16842768, 16842768>, top_func} {
    affine.for %arg5 = 0 to 4096 {
      affine.for %arg6 = 0 to 16 {
        %0 = affine.load %arg0[%arg5, %arg6 * 64] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = affine.load %arg3[%arg5] {partition_indices = [0], timing = #hls.t<2 -> 4, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<4 -> 8, 4, 1>} : f32
        %3 = affine.load %arg4[%arg6 * 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<8 -> 13, 5, 1>} : f32
        affine.store %4, %arg4[%arg6 * 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<13 -> 14, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %5 = affine.load %arg0[%arg6 * 64, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<1 -> 3, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %6 = affine.load %arg1[%arg5] {partition_indices = [0], timing = #hls.t<2 -> 4, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %7 = arith.mulf %5, %6 {timing = #hls.t<4 -> 8, 4, 1>} : f32
        %8 = affine.load %arg2[%arg6 * 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %9 = arith.addf %7, %8 {timing = #hls.t<8 -> 13, 5, 1>} : f32
        affine.store %9, %arg2[%arg6 * 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<13 -> 14, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %10 = affine.load %arg0[%arg5, %arg6 * 64 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<2 -> 4, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %11 = arith.mulf %10, %1 {timing = #hls.t<5 -> 9, 4, 1>} : f32
        %12 = affine.load %arg4[%arg6 * 64 + 1] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<7 -> 9, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %13 = arith.addf %11, %12 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %13, %arg4[%arg6 * 64 + 1] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<14 -> 15, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %14 = affine.load %arg0[%arg6 * 64 + 1, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<3 -> 5, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %15 = arith.mulf %14, %6 {timing = #hls.t<5 -> 9, 4, 1>} : f32
        %16 = affine.load %arg2[%arg6 * 64 + 1] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<7 -> 9, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %17 = arith.addf %15, %16 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %17, %arg2[%arg6 * 64 + 1] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<14 -> 15, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %18 = affine.load %arg0[%arg5, %arg6 * 64 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<2 -> 4, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %19 = arith.mulf %18, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %20 = affine.load %arg4[%arg6 * 64 + 2] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %21 = arith.addf %19, %20 {timing = #hls.t<10 -> 15, 5, 1>} : f32
        affine.store %21, %arg4[%arg6 * 64 + 2] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %22 = affine.load %arg0[%arg6 * 64 + 2, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<3 -> 5, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %23 = arith.mulf %22, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %24 = affine.load %arg2[%arg6 * 64 + 2] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %25 = arith.addf %23, %24 {timing = #hls.t<10 -> 15, 5, 1>} : f32
        affine.store %25, %arg2[%arg6 * 64 + 2] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %26 = affine.load %arg0[%arg5, %arg6 * 64 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %27 = arith.mulf %26, %1 {timing = #hls.t<7 -> 11, 4, 1>} : f32
        %28 = affine.load %arg4[%arg6 * 64 + 3] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %29 = arith.addf %27, %28 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        affine.store %29, %arg4[%arg6 * 64 + 3] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<16 -> 17, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %30 = affine.load %arg0[%arg6 * 64 + 3, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %31 = arith.mulf %30, %6 {timing = #hls.t<7 -> 11, 4, 1>} : f32
        %32 = affine.load %arg2[%arg6 * 64 + 3] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %33 = arith.addf %31, %32 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        affine.store %33, %arg2[%arg6 * 64 + 3] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<16 -> 17, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %34 = affine.load %arg0[%arg5, %arg6 * 64 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %35 = arith.mulf %34, %1 {timing = #hls.t<8 -> 12, 4, 1>} : f32
        %36 = affine.load %arg4[%arg6 * 64 + 4] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %37 = arith.addf %35, %36 {timing = #hls.t<12 -> 17, 5, 1>} : f32
        affine.store %37, %arg4[%arg6 * 64 + 4] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<17 -> 18, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %38 = affine.load %arg0[%arg6 * 64 + 4, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %39 = arith.mulf %38, %6 {timing = #hls.t<8 -> 12, 4, 1>} : f32
        %40 = affine.load %arg2[%arg6 * 64 + 4] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %41 = arith.addf %39, %40 {timing = #hls.t<12 -> 17, 5, 1>} : f32
        affine.store %41, %arg2[%arg6 * 64 + 4] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<17 -> 18, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %42 = affine.load %arg0[%arg5, %arg6 * 64 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %43 = arith.mulf %42, %1 {timing = #hls.t<9 -> 13, 4, 1>} : f32
        %44 = affine.load %arg4[%arg6 * 64 + 5] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %45 = arith.addf %43, %44 {timing = #hls.t<13 -> 18, 5, 1>} : f32
        affine.store %45, %arg4[%arg6 * 64 + 5] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<18 -> 19, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %46 = affine.load %arg0[%arg6 * 64 + 5, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<7 -> 9, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %47 = arith.mulf %46, %6 {timing = #hls.t<9 -> 13, 4, 1>} : f32
        %48 = affine.load %arg2[%arg6 * 64 + 5] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %49 = arith.addf %47, %48 {timing = #hls.t<13 -> 18, 5, 1>} : f32
        affine.store %49, %arg2[%arg6 * 64 + 5] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<18 -> 19, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %50 = affine.load %arg0[%arg5, %arg6 * 64 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %51 = arith.mulf %50, %1 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %52 = affine.load %arg4[%arg6 * 64 + 6] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %53 = arith.addf %51, %52 {timing = #hls.t<14 -> 19, 5, 1>} : f32
        affine.store %53, %arg4[%arg6 * 64 + 6] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<19 -> 20, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %54 = affine.load %arg0[%arg6 * 64 + 6, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<7 -> 9, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %55 = arith.mulf %54, %6 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %56 = affine.load %arg2[%arg6 * 64 + 6] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %57 = arith.addf %55, %56 {timing = #hls.t<14 -> 19, 5, 1>} : f32
        affine.store %57, %arg2[%arg6 * 64 + 6] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<19 -> 20, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %58 = affine.load %arg0[%arg5, %arg6 * 64 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %59 = arith.mulf %58, %1 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %60 = affine.load %arg4[%arg6 * 64 + 7] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %61 = arith.addf %59, %60 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %61, %arg4[%arg6 * 64 + 7] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %62 = affine.load %arg0[%arg6 * 64 + 7, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %63 = arith.mulf %62, %6 {timing = #hls.t<11 -> 15, 4, 1>} : f32
        %64 = affine.load %arg2[%arg6 * 64 + 7] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %65 = arith.addf %63, %64 {timing = #hls.t<15 -> 20, 5, 1>} : f32
        affine.store %65, %arg2[%arg6 * 64 + 7] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<20 -> 21, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %66 = affine.load %arg0[%arg5, %arg6 * 64 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %67 = arith.mulf %66, %1 {timing = #hls.t<12 -> 16, 4, 1>} : f32
        %68 = affine.load %arg4[%arg6 * 64 + 8] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %69 = arith.addf %67, %68 {timing = #hls.t<16 -> 21, 5, 1>} : f32
        affine.store %69, %arg4[%arg6 * 64 + 8] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<21 -> 22, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %70 = affine.load %arg0[%arg6 * 64 + 8, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %71 = arith.mulf %70, %6 {timing = #hls.t<12 -> 16, 4, 1>} : f32
        %72 = affine.load %arg2[%arg6 * 64 + 8] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %73 = arith.addf %71, %72 {timing = #hls.t<16 -> 21, 5, 1>} : f32
        affine.store %73, %arg2[%arg6 * 64 + 8] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<21 -> 22, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %74 = affine.load %arg0[%arg5, %arg6 * 64 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %75 = arith.mulf %74, %1 {timing = #hls.t<13 -> 17, 4, 1>} : f32
        %76 = affine.load %arg4[%arg6 * 64 + 9] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %77 = arith.addf %75, %76 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        affine.store %77, %arg4[%arg6 * 64 + 9] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<22 -> 23, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %78 = affine.load %arg0[%arg6 * 64 + 9, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %79 = arith.mulf %78, %6 {timing = #hls.t<13 -> 17, 4, 1>} : f32
        %80 = affine.load %arg2[%arg6 * 64 + 9] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %81 = arith.addf %79, %80 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        affine.store %81, %arg2[%arg6 * 64 + 9] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<22 -> 23, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %82 = affine.load %arg0[%arg5, %arg6 * 64 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %83 = arith.mulf %82, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %84 = affine.load %arg4[%arg6 * 64 + 10] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %85 = arith.addf %83, %84 {timing = #hls.t<18 -> 23, 5, 1>} : f32
        affine.store %85, %arg4[%arg6 * 64 + 10] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %86 = affine.load %arg0[%arg6 * 64 + 10, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %87 = arith.mulf %86, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %88 = affine.load %arg2[%arg6 * 64 + 10] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %89 = arith.addf %87, %88 {timing = #hls.t<18 -> 23, 5, 1>} : f32
        affine.store %89, %arg2[%arg6 * 64 + 10] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %90 = affine.load %arg0[%arg5, %arg6 * 64 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %91 = arith.mulf %90, %1 {timing = #hls.t<15 -> 19, 4, 1>} : f32
        %92 = affine.load %arg4[%arg6 * 64 + 11] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %93 = arith.addf %91, %92 {timing = #hls.t<19 -> 24, 5, 1>} : f32
        affine.store %93, %arg4[%arg6 * 64 + 11] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<24 -> 25, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %94 = affine.load %arg0[%arg6 * 64 + 11, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %95 = arith.mulf %94, %6 {timing = #hls.t<15 -> 19, 4, 1>} : f32
        %96 = affine.load %arg2[%arg6 * 64 + 11] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %97 = arith.addf %95, %96 {timing = #hls.t<19 -> 24, 5, 1>} : f32
        affine.store %97, %arg2[%arg6 * 64 + 11] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<24 -> 25, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %98 = affine.load %arg0[%arg5, %arg6 * 64 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %99 = arith.mulf %98, %1 {timing = #hls.t<16 -> 20, 4, 1>} : f32
        %100 = affine.load %arg4[%arg6 * 64 + 12] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %101 = arith.addf %99, %100 {timing = #hls.t<20 -> 25, 5, 1>} : f32
        affine.store %101, %arg4[%arg6 * 64 + 12] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<25 -> 26, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %102 = affine.load %arg0[%arg6 * 64 + 12, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %103 = arith.mulf %102, %6 {timing = #hls.t<16 -> 20, 4, 1>} : f32
        %104 = affine.load %arg2[%arg6 * 64 + 12] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %105 = arith.addf %103, %104 {timing = #hls.t<20 -> 25, 5, 1>} : f32
        affine.store %105, %arg2[%arg6 * 64 + 12] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<25 -> 26, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %106 = affine.load %arg0[%arg5, %arg6 * 64 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %107 = arith.mulf %106, %1 {timing = #hls.t<17 -> 21, 4, 1>} : f32
        %108 = affine.load %arg4[%arg6 * 64 + 13] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %109 = arith.addf %107, %108 {timing = #hls.t<21 -> 26, 5, 1>} : f32
        affine.store %109, %arg4[%arg6 * 64 + 13] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<26 -> 27, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %110 = affine.load %arg0[%arg6 * 64 + 13, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %111 = arith.mulf %110, %6 {timing = #hls.t<17 -> 21, 4, 1>} : f32
        %112 = affine.load %arg2[%arg6 * 64 + 13] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %113 = arith.addf %111, %112 {timing = #hls.t<21 -> 26, 5, 1>} : f32
        affine.store %113, %arg2[%arg6 * 64 + 13] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<26 -> 27, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %114 = affine.load %arg0[%arg5, %arg6 * 64 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %115 = arith.mulf %114, %1 {timing = #hls.t<18 -> 22, 4, 1>} : f32
        %116 = affine.load %arg4[%arg6 * 64 + 14] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %117 = arith.addf %115, %116 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        affine.store %117, %arg4[%arg6 * 64 + 14] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<27 -> 28, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %118 = affine.load %arg0[%arg6 * 64 + 14, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %119 = arith.mulf %118, %6 {timing = #hls.t<18 -> 22, 4, 1>} : f32
        %120 = affine.load %arg2[%arg6 * 64 + 14] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %121 = arith.addf %119, %120 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        affine.store %121, %arg2[%arg6 * 64 + 14] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<27 -> 28, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %122 = affine.load %arg0[%arg5, %arg6 * 64 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %123 = arith.mulf %122, %1 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %124 = affine.load %arg4[%arg6 * 64 + 15] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %125 = arith.addf %123, %124 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %125, %arg4[%arg6 * 64 + 15] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %126 = affine.load %arg0[%arg6 * 64 + 15, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %127 = arith.mulf %126, %6 {timing = #hls.t<19 -> 23, 4, 1>} : f32
        %128 = affine.load %arg2[%arg6 * 64 + 15] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %129 = arith.addf %127, %128 {timing = #hls.t<23 -> 28, 5, 1>} : f32
        affine.store %129, %arg2[%arg6 * 64 + 15] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<28 -> 29, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %130 = affine.load %arg0[%arg5, %arg6 * 64 + 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %131 = arith.mulf %130, %1 {timing = #hls.t<20 -> 24, 4, 1>} : f32
        %132 = affine.load %arg4[%arg6 * 64 + 16] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %133 = arith.addf %131, %132 {timing = #hls.t<24 -> 29, 5, 1>} : f32
        affine.store %133, %arg4[%arg6 * 64 + 16] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<29 -> 30, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %134 = affine.load %arg0[%arg6 * 64 + 16, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %135 = arith.mulf %134, %6 {timing = #hls.t<20 -> 24, 4, 1>} : f32
        %136 = affine.load %arg2[%arg6 * 64 + 16] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %137 = arith.addf %135, %136 {timing = #hls.t<24 -> 29, 5, 1>} : f32
        affine.store %137, %arg2[%arg6 * 64 + 16] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<29 -> 30, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %138 = affine.load %arg0[%arg5, %arg6 * 64 + 17] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %139 = arith.mulf %138, %1 {timing = #hls.t<21 -> 25, 4, 1>} : f32
        %140 = affine.load %arg4[%arg6 * 64 + 17] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %141 = arith.addf %139, %140 {timing = #hls.t<25 -> 30, 5, 1>} : f32
        affine.store %141, %arg4[%arg6 * 64 + 17] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<30 -> 31, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %142 = affine.load %arg0[%arg6 * 64 + 17, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %143 = arith.mulf %142, %6 {timing = #hls.t<21 -> 25, 4, 1>} : f32
        %144 = affine.load %arg2[%arg6 * 64 + 17] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %145 = arith.addf %143, %144 {timing = #hls.t<25 -> 30, 5, 1>} : f32
        affine.store %145, %arg2[%arg6 * 64 + 17] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<30 -> 31, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %146 = affine.load %arg0[%arg5, %arg6 * 64 + 18] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %147 = arith.mulf %146, %1 {timing = #hls.t<22 -> 26, 4, 1>} : f32
        %148 = affine.load %arg4[%arg6 * 64 + 18] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %149 = arith.addf %147, %148 {timing = #hls.t<26 -> 31, 5, 1>} : f32
        affine.store %149, %arg4[%arg6 * 64 + 18] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %150 = affine.load %arg0[%arg6 * 64 + 18, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %151 = arith.mulf %150, %6 {timing = #hls.t<22 -> 26, 4, 1>} : f32
        %152 = affine.load %arg2[%arg6 * 64 + 18] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %153 = arith.addf %151, %152 {timing = #hls.t<26 -> 31, 5, 1>} : f32
        affine.store %153, %arg2[%arg6 * 64 + 18] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %154 = affine.load %arg0[%arg5, %arg6 * 64 + 19] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %155 = arith.mulf %154, %1 {timing = #hls.t<23 -> 27, 4, 1>} : f32
        %156 = affine.load %arg4[%arg6 * 64 + 19] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %157 = arith.addf %155, %156 {timing = #hls.t<27 -> 32, 5, 1>} : f32
        affine.store %157, %arg4[%arg6 * 64 + 19] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<32 -> 33, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %158 = affine.load %arg0[%arg6 * 64 + 19, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %159 = arith.mulf %158, %6 {timing = #hls.t<23 -> 27, 4, 1>} : f32
        %160 = affine.load %arg2[%arg6 * 64 + 19] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %161 = arith.addf %159, %160 {timing = #hls.t<27 -> 32, 5, 1>} : f32
        affine.store %161, %arg2[%arg6 * 64 + 19] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<32 -> 33, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %162 = affine.load %arg0[%arg5, %arg6 * 64 + 20] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %163 = arith.mulf %162, %1 {timing = #hls.t<24 -> 28, 4, 1>} : f32
        %164 = affine.load %arg4[%arg6 * 64 + 20] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %165 = arith.addf %163, %164 {timing = #hls.t<28 -> 33, 5, 1>} : f32
        affine.store %165, %arg4[%arg6 * 64 + 20] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<33 -> 34, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %166 = affine.load %arg0[%arg6 * 64 + 20, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %167 = arith.mulf %166, %6 {timing = #hls.t<24 -> 28, 4, 1>} : f32
        %168 = affine.load %arg2[%arg6 * 64 + 20] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %169 = arith.addf %167, %168 {timing = #hls.t<28 -> 33, 5, 1>} : f32
        affine.store %169, %arg2[%arg6 * 64 + 20] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<33 -> 34, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %170 = affine.load %arg0[%arg5, %arg6 * 64 + 21] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %171 = arith.mulf %170, %1 {timing = #hls.t<25 -> 29, 4, 1>} : f32
        %172 = affine.load %arg4[%arg6 * 64 + 21] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %173 = arith.addf %171, %172 {timing = #hls.t<29 -> 34, 5, 1>} : f32
        affine.store %173, %arg4[%arg6 * 64 + 21] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<34 -> 35, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %174 = affine.load %arg0[%arg6 * 64 + 21, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %175 = arith.mulf %174, %6 {timing = #hls.t<25 -> 29, 4, 1>} : f32
        %176 = affine.load %arg2[%arg6 * 64 + 21] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %177 = arith.addf %175, %176 {timing = #hls.t<29 -> 34, 5, 1>} : f32
        affine.store %177, %arg2[%arg6 * 64 + 21] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<34 -> 35, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %178 = affine.load %arg0[%arg5, %arg6 * 64 + 22] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %179 = arith.mulf %178, %1 {timing = #hls.t<26 -> 30, 4, 1>} : f32
        %180 = affine.load %arg4[%arg6 * 64 + 22] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %181 = arith.addf %179, %180 {timing = #hls.t<30 -> 35, 5, 1>} : f32
        affine.store %181, %arg4[%arg6 * 64 + 22] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<35 -> 36, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %182 = affine.load %arg0[%arg6 * 64 + 22, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %183 = arith.mulf %182, %6 {timing = #hls.t<26 -> 30, 4, 1>} : f32
        %184 = affine.load %arg2[%arg6 * 64 + 22] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %185 = arith.addf %183, %184 {timing = #hls.t<30 -> 35, 5, 1>} : f32
        affine.store %185, %arg2[%arg6 * 64 + 22] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<35 -> 36, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %186 = affine.load %arg0[%arg5, %arg6 * 64 + 23] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %187 = arith.mulf %186, %1 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %188 = affine.load %arg4[%arg6 * 64 + 23] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %189 = arith.addf %187, %188 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %189, %arg4[%arg6 * 64 + 23] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %190 = affine.load %arg0[%arg6 * 64 + 23, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %191 = arith.mulf %190, %6 {timing = #hls.t<27 -> 31, 4, 1>} : f32
        %192 = affine.load %arg2[%arg6 * 64 + 23] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %193 = arith.addf %191, %192 {timing = #hls.t<31 -> 36, 5, 1>} : f32
        affine.store %193, %arg2[%arg6 * 64 + 23] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<36 -> 37, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %194 = affine.load %arg0[%arg5, %arg6 * 64 + 24] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %195 = arith.mulf %194, %1 {timing = #hls.t<28 -> 32, 4, 1>} : f32
        %196 = affine.load %arg4[%arg6 * 64 + 24] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %197 = arith.addf %195, %196 {timing = #hls.t<32 -> 37, 5, 1>} : f32
        affine.store %197, %arg4[%arg6 * 64 + 24] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<37 -> 38, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %198 = affine.load %arg0[%arg6 * 64 + 24, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %199 = arith.mulf %198, %6 {timing = #hls.t<28 -> 32, 4, 1>} : f32
        %200 = affine.load %arg2[%arg6 * 64 + 24] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %201 = arith.addf %199, %200 {timing = #hls.t<32 -> 37, 5, 1>} : f32
        affine.store %201, %arg2[%arg6 * 64 + 24] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<37 -> 38, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %202 = affine.load %arg0[%arg5, %arg6 * 64 + 25] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %203 = arith.mulf %202, %1 {timing = #hls.t<29 -> 33, 4, 1>} : f32
        %204 = affine.load %arg4[%arg6 * 64 + 25] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %205 = arith.addf %203, %204 {timing = #hls.t<33 -> 38, 5, 1>} : f32
        affine.store %205, %arg4[%arg6 * 64 + 25] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<38 -> 39, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %206 = affine.load %arg0[%arg6 * 64 + 25, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %207 = arith.mulf %206, %6 {timing = #hls.t<29 -> 33, 4, 1>} : f32
        %208 = affine.load %arg2[%arg6 * 64 + 25] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %209 = arith.addf %207, %208 {timing = #hls.t<33 -> 38, 5, 1>} : f32
        affine.store %209, %arg2[%arg6 * 64 + 25] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<38 -> 39, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %210 = affine.load %arg0[%arg5, %arg6 * 64 + 26] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %211 = arith.mulf %210, %1 {timing = #hls.t<30 -> 34, 4, 1>} : f32
        %212 = affine.load %arg4[%arg6 * 64 + 26] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %213 = arith.addf %211, %212 {timing = #hls.t<34 -> 39, 5, 1>} : f32
        affine.store %213, %arg4[%arg6 * 64 + 26] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %214 = affine.load %arg0[%arg6 * 64 + 26, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %215 = arith.mulf %214, %6 {timing = #hls.t<30 -> 34, 4, 1>} : f32
        %216 = affine.load %arg2[%arg6 * 64 + 26] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %217 = arith.addf %215, %216 {timing = #hls.t<34 -> 39, 5, 1>} : f32
        affine.store %217, %arg2[%arg6 * 64 + 26] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %218 = affine.load %arg0[%arg5, %arg6 * 64 + 27] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %219 = arith.mulf %218, %1 {timing = #hls.t<31 -> 35, 4, 1>} : f32
        %220 = affine.load %arg4[%arg6 * 64 + 27] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %221 = arith.addf %219, %220 {timing = #hls.t<35 -> 40, 5, 1>} : f32
        affine.store %221, %arg4[%arg6 * 64 + 27] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<40 -> 41, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %222 = affine.load %arg0[%arg6 * 64 + 27, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %223 = arith.mulf %222, %6 {timing = #hls.t<31 -> 35, 4, 1>} : f32
        %224 = affine.load %arg2[%arg6 * 64 + 27] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %225 = arith.addf %223, %224 {timing = #hls.t<35 -> 40, 5, 1>} : f32
        affine.store %225, %arg2[%arg6 * 64 + 27] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<40 -> 41, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %226 = affine.load %arg0[%arg5, %arg6 * 64 + 28] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %227 = arith.mulf %226, %1 {timing = #hls.t<32 -> 36, 4, 1>} : f32
        %228 = affine.load %arg4[%arg6 * 64 + 28] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %229 = arith.addf %227, %228 {timing = #hls.t<36 -> 41, 5, 1>} : f32
        affine.store %229, %arg4[%arg6 * 64 + 28] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<41 -> 42, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %230 = affine.load %arg0[%arg6 * 64 + 28, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %231 = arith.mulf %230, %6 {timing = #hls.t<32 -> 36, 4, 1>} : f32
        %232 = affine.load %arg2[%arg6 * 64 + 28] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %233 = arith.addf %231, %232 {timing = #hls.t<36 -> 41, 5, 1>} : f32
        affine.store %233, %arg2[%arg6 * 64 + 28] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<41 -> 42, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %234 = affine.load %arg0[%arg5, %arg6 * 64 + 29] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %235 = arith.mulf %234, %1 {timing = #hls.t<33 -> 37, 4, 1>} : f32
        %236 = affine.load %arg4[%arg6 * 64 + 29] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<35 -> 37, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %237 = arith.addf %235, %236 {timing = #hls.t<37 -> 42, 5, 1>} : f32
        affine.store %237, %arg4[%arg6 * 64 + 29] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<42 -> 43, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %238 = affine.load %arg0[%arg6 * 64 + 29, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %239 = arith.mulf %238, %6 {timing = #hls.t<33 -> 37, 4, 1>} : f32
        %240 = affine.load %arg2[%arg6 * 64 + 29] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<35 -> 37, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %241 = arith.addf %239, %240 {timing = #hls.t<37 -> 42, 5, 1>} : f32
        affine.store %241, %arg2[%arg6 * 64 + 29] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<42 -> 43, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %242 = affine.load %arg0[%arg5, %arg6 * 64 + 30] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %243 = arith.mulf %242, %1 {timing = #hls.t<34 -> 38, 4, 1>} : f32
        %244 = affine.load %arg4[%arg6 * 64 + 30] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<36 -> 38, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %245 = arith.addf %243, %244 {timing = #hls.t<38 -> 43, 5, 1>} : f32
        affine.store %245, %arg4[%arg6 * 64 + 30] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<43 -> 44, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %246 = affine.load %arg0[%arg6 * 64 + 30, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %247 = arith.mulf %246, %6 {timing = #hls.t<34 -> 38, 4, 1>} : f32
        %248 = affine.load %arg2[%arg6 * 64 + 30] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<36 -> 38, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %249 = arith.addf %247, %248 {timing = #hls.t<38 -> 43, 5, 1>} : f32
        affine.store %249, %arg2[%arg6 * 64 + 30] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<43 -> 44, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %250 = affine.load %arg0[%arg5, %arg6 * 64 + 31] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %251 = arith.mulf %250, %1 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %252 = affine.load %arg4[%arg6 * 64 + 31] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %253 = arith.addf %251, %252 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %253, %arg4[%arg6 * 64 + 31] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %254 = affine.load %arg0[%arg6 * 64 + 31, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %255 = arith.mulf %254, %6 {timing = #hls.t<35 -> 39, 4, 1>} : f32
        %256 = affine.load %arg2[%arg6 * 64 + 31] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %257 = arith.addf %255, %256 {timing = #hls.t<39 -> 44, 5, 1>} : f32
        affine.store %257, %arg2[%arg6 * 64 + 31] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<44 -> 45, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %258 = affine.load %arg0[%arg5, %arg6 * 64 + 32] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %259 = arith.mulf %258, %1 {timing = #hls.t<36 -> 40, 4, 1>} : f32
        %260 = affine.load %arg4[%arg6 * 64 + 32] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %261 = arith.addf %259, %260 {timing = #hls.t<40 -> 45, 5, 1>} : f32
        affine.store %261, %arg4[%arg6 * 64 + 32] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<45 -> 46, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %262 = affine.load %arg0[%arg6 * 64 + 32, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %263 = arith.mulf %262, %6 {timing = #hls.t<36 -> 40, 4, 1>} : f32
        %264 = affine.load %arg2[%arg6 * 64 + 32] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %265 = arith.addf %263, %264 {timing = #hls.t<40 -> 45, 5, 1>} : f32
        affine.store %265, %arg2[%arg6 * 64 + 32] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<45 -> 46, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %266 = affine.load %arg0[%arg5, %arg6 * 64 + 33] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %267 = arith.mulf %266, %1 {timing = #hls.t<37 -> 41, 4, 1>} : f32
        %268 = affine.load %arg4[%arg6 * 64 + 33] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %269 = arith.addf %267, %268 {timing = #hls.t<41 -> 46, 5, 1>} : f32
        affine.store %269, %arg4[%arg6 * 64 + 33] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<46 -> 47, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %270 = affine.load %arg0[%arg6 * 64 + 33, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<35 -> 37, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %271 = arith.mulf %270, %6 {timing = #hls.t<37 -> 41, 4, 1>} : f32
        %272 = affine.load %arg2[%arg6 * 64 + 33] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %273 = arith.addf %271, %272 {timing = #hls.t<41 -> 46, 5, 1>} : f32
        affine.store %273, %arg2[%arg6 * 64 + 33] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<46 -> 47, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %274 = affine.load %arg0[%arg5, %arg6 * 64 + 34] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %275 = arith.mulf %274, %1 {timing = #hls.t<38 -> 42, 4, 1>} : f32
        %276 = affine.load %arg4[%arg6 * 64 + 34] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %277 = arith.addf %275, %276 {timing = #hls.t<42 -> 47, 5, 1>} : f32
        affine.store %277, %arg4[%arg6 * 64 + 34] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<47 -> 48, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %278 = affine.load %arg0[%arg6 * 64 + 34, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<35 -> 37, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %279 = arith.mulf %278, %6 {timing = #hls.t<38 -> 42, 4, 1>} : f32
        %280 = affine.load %arg2[%arg6 * 64 + 34] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %281 = arith.addf %279, %280 {timing = #hls.t<42 -> 47, 5, 1>} : f32
        affine.store %281, %arg2[%arg6 * 64 + 34] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<47 -> 48, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %282 = affine.load %arg0[%arg5, %arg6 * 64 + 35] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<36 -> 38, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %283 = arith.mulf %282, %1 {timing = #hls.t<39 -> 43, 4, 1>} : f32
        %284 = affine.load %arg4[%arg6 * 64 + 35] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %285 = arith.addf %283, %284 {timing = #hls.t<43 -> 48, 5, 1>} : f32
        affine.store %285, %arg4[%arg6 * 64 + 35] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<48 -> 49, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %286 = affine.load %arg0[%arg6 * 64 + 35, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %287 = arith.mulf %286, %6 {timing = #hls.t<39 -> 43, 4, 1>} : f32
        %288 = affine.load %arg2[%arg6 * 64 + 35] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %289 = arith.addf %287, %288 {timing = #hls.t<43 -> 48, 5, 1>} : f32
        affine.store %289, %arg2[%arg6 * 64 + 35] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<48 -> 49, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %290 = affine.load %arg0[%arg5, %arg6 * 64 + 36] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<36 -> 38, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %291 = arith.mulf %290, %1 {timing = #hls.t<40 -> 44, 4, 1>} : f32
        %292 = affine.load %arg4[%arg6 * 64 + 36] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<42 -> 44, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %293 = arith.addf %291, %292 {timing = #hls.t<44 -> 49, 5, 1>} : f32
        affine.store %293, %arg4[%arg6 * 64 + 36] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<49 -> 50, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %294 = affine.load %arg0[%arg6 * 64 + 36, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %295 = arith.mulf %294, %6 {timing = #hls.t<40 -> 44, 4, 1>} : f32
        %296 = affine.load %arg2[%arg6 * 64 + 36] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<42 -> 44, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %297 = arith.addf %295, %296 {timing = #hls.t<44 -> 49, 5, 1>} : f32
        affine.store %297, %arg2[%arg6 * 64 + 36] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<49 -> 50, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %298 = affine.load %arg0[%arg5, %arg6 * 64 + 37] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %299 = arith.mulf %298, %1 {timing = #hls.t<41 -> 45, 4, 1>} : f32
        %300 = affine.load %arg4[%arg6 * 64 + 37] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<43 -> 45, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %301 = arith.addf %299, %300 {timing = #hls.t<45 -> 50, 5, 1>} : f32
        affine.store %301, %arg4[%arg6 * 64 + 37] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<50 -> 51, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %302 = affine.load %arg0[%arg6 * 64 + 37, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %303 = arith.mulf %302, %6 {timing = #hls.t<41 -> 45, 4, 1>} : f32
        %304 = affine.load %arg2[%arg6 * 64 + 37] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<43 -> 45, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %305 = arith.addf %303, %304 {timing = #hls.t<45 -> 50, 5, 1>} : f32
        affine.store %305, %arg2[%arg6 * 64 + 37] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<50 -> 51, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %306 = affine.load %arg0[%arg5, %arg6 * 64 + 38] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %307 = arith.mulf %306, %1 {timing = #hls.t<42 -> 46, 4, 1>} : f32
        %308 = affine.load %arg4[%arg6 * 64 + 38] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<44 -> 46, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %309 = arith.addf %307, %308 {timing = #hls.t<46 -> 51, 5, 1>} : f32
        affine.store %309, %arg4[%arg6 * 64 + 38] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<51 -> 52, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %310 = affine.load %arg0[%arg6 * 64 + 38, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %311 = arith.mulf %310, %6 {timing = #hls.t<42 -> 46, 4, 1>} : f32
        %312 = affine.load %arg2[%arg6 * 64 + 38] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<44 -> 46, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %313 = arith.addf %311, %312 {timing = #hls.t<46 -> 51, 5, 1>} : f32
        affine.store %313, %arg2[%arg6 * 64 + 38] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<51 -> 52, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %314 = affine.load %arg0[%arg5, %arg6 * 64 + 39] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %315 = arith.mulf %314, %1 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %316 = affine.load %arg4[%arg6 * 64 + 39] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %317 = arith.addf %315, %316 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %317, %arg4[%arg6 * 64 + 39] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %318 = affine.load %arg0[%arg6 * 64 + 39, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %319 = arith.mulf %318, %6 {timing = #hls.t<43 -> 47, 4, 1>} : f32
        %320 = affine.load %arg2[%arg6 * 64 + 39] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %321 = arith.addf %319, %320 {timing = #hls.t<47 -> 52, 5, 1>} : f32
        affine.store %321, %arg2[%arg6 * 64 + 39] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<52 -> 53, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %322 = affine.load %arg0[%arg5, %arg6 * 64 + 40] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %323 = arith.mulf %322, %1 {timing = #hls.t<44 -> 48, 4, 1>} : f32
        %324 = affine.load %arg4[%arg6 * 64 + 40] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<46 -> 48, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %325 = arith.addf %323, %324 {timing = #hls.t<48 -> 53, 5, 1>} : f32
        affine.store %325, %arg4[%arg6 * 64 + 40] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<53 -> 54, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %326 = affine.load %arg0[%arg6 * 64 + 40, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %327 = arith.mulf %326, %6 {timing = #hls.t<44 -> 48, 4, 1>} : f32
        %328 = affine.load %arg2[%arg6 * 64 + 40] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<46 -> 48, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %329 = arith.addf %327, %328 {timing = #hls.t<48 -> 53, 5, 1>} : f32
        affine.store %329, %arg2[%arg6 * 64 + 40] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<53 -> 54, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %330 = affine.load %arg0[%arg5, %arg6 * 64 + 41] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<42 -> 44, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %331 = arith.mulf %330, %1 {timing = #hls.t<45 -> 49, 4, 1>} : f32
        %332 = affine.load %arg4[%arg6 * 64 + 41] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<47 -> 49, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %333 = arith.addf %331, %332 {timing = #hls.t<49 -> 54, 5, 1>} : f32
        affine.store %333, %arg4[%arg6 * 64 + 41] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<54 -> 55, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %334 = affine.load %arg0[%arg6 * 64 + 41, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<43 -> 45, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %335 = arith.mulf %334, %6 {timing = #hls.t<45 -> 49, 4, 1>} : f32
        %336 = affine.load %arg2[%arg6 * 64 + 41] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<47 -> 49, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %337 = arith.addf %335, %336 {timing = #hls.t<49 -> 54, 5, 1>} : f32
        affine.store %337, %arg2[%arg6 * 64 + 41] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<54 -> 55, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %338 = affine.load %arg0[%arg5, %arg6 * 64 + 42] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<42 -> 44, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %339 = arith.mulf %338, %1 {timing = #hls.t<46 -> 50, 4, 1>} : f32
        %340 = affine.load %arg4[%arg6 * 64 + 42] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<48 -> 50, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %341 = arith.addf %339, %340 {timing = #hls.t<50 -> 55, 5, 1>} : f32
        affine.store %341, %arg4[%arg6 * 64 + 42] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<55 -> 56, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %342 = affine.load %arg0[%arg6 * 64 + 42, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<43 -> 45, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %343 = arith.mulf %342, %6 {timing = #hls.t<46 -> 50, 4, 1>} : f32
        %344 = affine.load %arg2[%arg6 * 64 + 42] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<48 -> 50, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %345 = arith.addf %343, %344 {timing = #hls.t<50 -> 55, 5, 1>} : f32
        affine.store %345, %arg2[%arg6 * 64 + 42] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<55 -> 56, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %346 = affine.load %arg0[%arg5, %arg6 * 64 + 43] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<44 -> 46, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %347 = arith.mulf %346, %1 {timing = #hls.t<47 -> 51, 4, 1>} : f32
        %348 = affine.load %arg4[%arg6 * 64 + 43] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %349 = arith.addf %347, %348 {timing = #hls.t<51 -> 56, 5, 1>} : f32
        affine.store %349, %arg4[%arg6 * 64 + 43] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<56 -> 57, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %350 = affine.load %arg0[%arg6 * 64 + 43, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %351 = arith.mulf %350, %6 {timing = #hls.t<47 -> 51, 4, 1>} : f32
        %352 = affine.load %arg2[%arg6 * 64 + 43] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %353 = arith.addf %351, %352 {timing = #hls.t<51 -> 56, 5, 1>} : f32
        affine.store %353, %arg2[%arg6 * 64 + 43] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<56 -> 57, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %354 = affine.load %arg0[%arg5, %arg6 * 64 + 44] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<44 -> 46, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %355 = arith.mulf %354, %1 {timing = #hls.t<48 -> 52, 4, 1>} : f32
        %356 = affine.load %arg4[%arg6 * 64 + 44] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<50 -> 52, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %357 = arith.addf %355, %356 {timing = #hls.t<52 -> 57, 5, 1>} : f32
        affine.store %357, %arg4[%arg6 * 64 + 44] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<57 -> 58, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %358 = affine.load %arg0[%arg6 * 64 + 44, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %359 = arith.mulf %358, %6 {timing = #hls.t<48 -> 52, 4, 1>} : f32
        %360 = affine.load %arg2[%arg6 * 64 + 44] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<50 -> 52, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %361 = arith.addf %359, %360 {timing = #hls.t<52 -> 57, 5, 1>} : f32
        affine.store %361, %arg2[%arg6 * 64 + 44] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<57 -> 58, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %362 = affine.load %arg0[%arg5, %arg6 * 64 + 45] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<46 -> 48, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %363 = arith.mulf %362, %1 {timing = #hls.t<49 -> 53, 4, 1>} : f32
        %364 = affine.load %arg4[%arg6 * 64 + 45] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<51 -> 53, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %365 = arith.addf %363, %364 {timing = #hls.t<53 -> 58, 5, 1>} : f32
        affine.store %365, %arg4[%arg6 * 64 + 45] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<58 -> 59, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %366 = affine.load %arg0[%arg6 * 64 + 45, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<47 -> 49, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %367 = arith.mulf %366, %6 {timing = #hls.t<49 -> 53, 4, 1>} : f32
        %368 = affine.load %arg2[%arg6 * 64 + 45] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<51 -> 53, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %369 = arith.addf %367, %368 {timing = #hls.t<53 -> 58, 5, 1>} : f32
        affine.store %369, %arg2[%arg6 * 64 + 45] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<58 -> 59, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %370 = affine.load %arg0[%arg5, %arg6 * 64 + 46] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<46 -> 48, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %371 = arith.mulf %370, %1 {timing = #hls.t<50 -> 54, 4, 1>} : f32
        %372 = affine.load %arg4[%arg6 * 64 + 46] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<52 -> 54, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %373 = arith.addf %371, %372 {timing = #hls.t<54 -> 59, 5, 1>} : f32
        affine.store %373, %arg4[%arg6 * 64 + 46] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<59 -> 60, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %374 = affine.load %arg0[%arg6 * 64 + 46, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<47 -> 49, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %375 = arith.mulf %374, %6 {timing = #hls.t<50 -> 54, 4, 1>} : f32
        %376 = affine.load %arg2[%arg6 * 64 + 46] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<52 -> 54, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %377 = arith.addf %375, %376 {timing = #hls.t<54 -> 59, 5, 1>} : f32
        affine.store %377, %arg2[%arg6 * 64 + 46] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<59 -> 60, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %378 = affine.load %arg0[%arg5, %arg6 * 64 + 47] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<48 -> 50, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %379 = arith.mulf %378, %1 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %380 = affine.load %arg4[%arg6 * 64 + 47] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %381 = arith.addf %379, %380 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %381, %arg4[%arg6 * 64 + 47] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %382 = affine.load %arg0[%arg6 * 64 + 47, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %383 = arith.mulf %382, %6 {timing = #hls.t<51 -> 55, 4, 1>} : f32
        %384 = affine.load %arg2[%arg6 * 64 + 47] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %385 = arith.addf %383, %384 {timing = #hls.t<55 -> 60, 5, 1>} : f32
        affine.store %385, %arg2[%arg6 * 64 + 47] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<60 -> 61, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %386 = affine.load %arg0[%arg5, %arg6 * 64 + 48] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<48 -> 50, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %387 = arith.mulf %386, %1 {timing = #hls.t<52 -> 56, 4, 1>} : f32
        %388 = affine.load %arg4[%arg6 * 64 + 48] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<54 -> 56, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %389 = arith.addf %387, %388 {timing = #hls.t<56 -> 61, 5, 1>} : f32
        affine.store %389, %arg4[%arg6 * 64 + 48] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<61 -> 62, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %390 = affine.load %arg0[%arg6 * 64 + 48, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %391 = arith.mulf %390, %6 {timing = #hls.t<52 -> 56, 4, 1>} : f32
        %392 = affine.load %arg2[%arg6 * 64 + 48] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<54 -> 56, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %393 = arith.addf %391, %392 {timing = #hls.t<56 -> 61, 5, 1>} : f32
        affine.store %393, %arg2[%arg6 * 64 + 48] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<61 -> 62, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %394 = affine.load %arg0[%arg5, %arg6 * 64 + 49] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<50 -> 52, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %395 = arith.mulf %394, %1 {timing = #hls.t<53 -> 57, 4, 1>} : f32
        %396 = affine.load %arg4[%arg6 * 64 + 49] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<55 -> 57, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %397 = arith.addf %395, %396 {timing = #hls.t<57 -> 62, 5, 1>} : f32
        affine.store %397, %arg4[%arg6 * 64 + 49] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<62 -> 63, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %398 = affine.load %arg0[%arg6 * 64 + 49, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<51 -> 53, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %399 = arith.mulf %398, %6 {timing = #hls.t<53 -> 57, 4, 1>} : f32
        %400 = affine.load %arg2[%arg6 * 64 + 49] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<55 -> 57, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %401 = arith.addf %399, %400 {timing = #hls.t<57 -> 62, 5, 1>} : f32
        affine.store %401, %arg2[%arg6 * 64 + 49] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<62 -> 63, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %402 = affine.load %arg0[%arg5, %arg6 * 64 + 50] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<50 -> 52, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %403 = arith.mulf %402, %1 {timing = #hls.t<54 -> 58, 4, 1>} : f32
        %404 = affine.load %arg4[%arg6 * 64 + 50] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<56 -> 58, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %405 = arith.addf %403, %404 {timing = #hls.t<58 -> 63, 5, 1>} : f32
        affine.store %405, %arg4[%arg6 * 64 + 50] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<63 -> 64, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %406 = affine.load %arg0[%arg6 * 64 + 50, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<51 -> 53, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %407 = arith.mulf %406, %6 {timing = #hls.t<54 -> 58, 4, 1>} : f32
        %408 = affine.load %arg2[%arg6 * 64 + 50] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<56 -> 58, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %409 = arith.addf %407, %408 {timing = #hls.t<58 -> 63, 5, 1>} : f32
        affine.store %409, %arg2[%arg6 * 64 + 50] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<63 -> 64, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %410 = affine.load %arg0[%arg5, %arg6 * 64 + 51] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<52 -> 54, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %411 = arith.mulf %410, %1 {timing = #hls.t<55 -> 59, 4, 1>} : f32
        %412 = affine.load %arg4[%arg6 * 64 + 51] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %413 = arith.addf %411, %412 {timing = #hls.t<59 -> 64, 5, 1>} : f32
        affine.store %413, %arg4[%arg6 * 64 + 51] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<64 -> 65, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %414 = affine.load %arg0[%arg6 * 64 + 51, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %415 = arith.mulf %414, %6 {timing = #hls.t<55 -> 59, 4, 1>} : f32
        %416 = affine.load %arg2[%arg6 * 64 + 51] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %417 = arith.addf %415, %416 {timing = #hls.t<59 -> 64, 5, 1>} : f32
        affine.store %417, %arg2[%arg6 * 64 + 51] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<64 -> 65, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %418 = affine.load %arg0[%arg5, %arg6 * 64 + 52] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<52 -> 54, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %419 = arith.mulf %418, %1 {timing = #hls.t<56 -> 60, 4, 1>} : f32
        %420 = affine.load %arg4[%arg6 * 64 + 52] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<58 -> 60, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %421 = arith.addf %419, %420 {timing = #hls.t<60 -> 65, 5, 1>} : f32
        affine.store %421, %arg4[%arg6 * 64 + 52] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<65 -> 66, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %422 = affine.load %arg0[%arg6 * 64 + 52, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %423 = arith.mulf %422, %6 {timing = #hls.t<56 -> 60, 4, 1>} : f32
        %424 = affine.load %arg2[%arg6 * 64 + 52] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<58 -> 60, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %425 = arith.addf %423, %424 {timing = #hls.t<60 -> 65, 5, 1>} : f32
        affine.store %425, %arg2[%arg6 * 64 + 52] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<65 -> 66, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %426 = affine.load %arg0[%arg5, %arg6 * 64 + 53] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<54 -> 56, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %427 = arith.mulf %426, %1 {timing = #hls.t<57 -> 61, 4, 1>} : f32
        %428 = affine.load %arg4[%arg6 * 64 + 53] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<59 -> 61, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %429 = arith.addf %427, %428 {timing = #hls.t<61 -> 66, 5, 1>} : f32
        affine.store %429, %arg4[%arg6 * 64 + 53] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<66 -> 67, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %430 = affine.load %arg0[%arg6 * 64 + 53, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<55 -> 57, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %431 = arith.mulf %430, %6 {timing = #hls.t<57 -> 61, 4, 1>} : f32
        %432 = affine.load %arg2[%arg6 * 64 + 53] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<59 -> 61, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %433 = arith.addf %431, %432 {timing = #hls.t<61 -> 66, 5, 1>} : f32
        affine.store %433, %arg2[%arg6 * 64 + 53] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<66 -> 67, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %434 = affine.load %arg0[%arg5, %arg6 * 64 + 54] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<54 -> 56, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %435 = arith.mulf %434, %1 {timing = #hls.t<58 -> 62, 4, 1>} : f32
        %436 = affine.load %arg4[%arg6 * 64 + 54] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<60 -> 62, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %437 = arith.addf %435, %436 {timing = #hls.t<62 -> 67, 5, 1>} : f32
        affine.store %437, %arg4[%arg6 * 64 + 54] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<67 -> 68, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %438 = affine.load %arg0[%arg6 * 64 + 54, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<55 -> 57, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %439 = arith.mulf %438, %6 {timing = #hls.t<58 -> 62, 4, 1>} : f32
        %440 = affine.load %arg2[%arg6 * 64 + 54] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<60 -> 62, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %441 = arith.addf %439, %440 {timing = #hls.t<62 -> 67, 5, 1>} : f32
        affine.store %441, %arg2[%arg6 * 64 + 54] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<67 -> 68, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %442 = affine.load %arg0[%arg5, %arg6 * 64 + 55] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<56 -> 58, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %443 = arith.mulf %442, %1 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %444 = affine.load %arg4[%arg6 * 64 + 55] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %445 = arith.addf %443, %444 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %445, %arg4[%arg6 * 64 + 55] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %446 = affine.load %arg0[%arg6 * 64 + 55, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %447 = arith.mulf %446, %6 {timing = #hls.t<59 -> 63, 4, 1>} : f32
        %448 = affine.load %arg2[%arg6 * 64 + 55] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %449 = arith.addf %447, %448 {timing = #hls.t<63 -> 68, 5, 1>} : f32
        affine.store %449, %arg2[%arg6 * 64 + 55] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<68 -> 69, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %450 = affine.load %arg0[%arg5, %arg6 * 64 + 56] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<56 -> 58, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %451 = arith.mulf %450, %1 {timing = #hls.t<60 -> 64, 4, 1>} : f32
        %452 = affine.load %arg4[%arg6 * 64 + 56] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<62 -> 64, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %453 = arith.addf %451, %452 {timing = #hls.t<64 -> 69, 5, 1>} : f32
        affine.store %453, %arg4[%arg6 * 64 + 56] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<69 -> 70, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %454 = affine.load %arg0[%arg6 * 64 + 56, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %455 = arith.mulf %454, %6 {timing = #hls.t<60 -> 64, 4, 1>} : f32
        %456 = affine.load %arg2[%arg6 * 64 + 56] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<62 -> 64, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %457 = arith.addf %455, %456 {timing = #hls.t<64 -> 69, 5, 1>} : f32
        affine.store %457, %arg2[%arg6 * 64 + 56] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<69 -> 70, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %458 = affine.load %arg0[%arg5, %arg6 * 64 + 57] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<58 -> 60, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %459 = arith.mulf %458, %1 {timing = #hls.t<61 -> 65, 4, 1>} : f32
        %460 = affine.load %arg4[%arg6 * 64 + 57] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<63 -> 65, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %461 = arith.addf %459, %460 {timing = #hls.t<65 -> 70, 5, 1>} : f32
        affine.store %461, %arg4[%arg6 * 64 + 57] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<70 -> 71, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %462 = affine.load %arg0[%arg6 * 64 + 57, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<59 -> 61, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %463 = arith.mulf %462, %6 {timing = #hls.t<61 -> 65, 4, 1>} : f32
        %464 = affine.load %arg2[%arg6 * 64 + 57] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<63 -> 65, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %465 = arith.addf %463, %464 {timing = #hls.t<65 -> 70, 5, 1>} : f32
        affine.store %465, %arg2[%arg6 * 64 + 57] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<70 -> 71, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %466 = affine.load %arg0[%arg5, %arg6 * 64 + 58] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<58 -> 60, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %467 = arith.mulf %466, %1 {timing = #hls.t<62 -> 66, 4, 1>} : f32
        %468 = affine.load %arg4[%arg6 * 64 + 58] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<64 -> 66, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %469 = arith.addf %467, %468 {timing = #hls.t<66 -> 71, 5, 1>} : f32
        affine.store %469, %arg4[%arg6 * 64 + 58] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<71 -> 72, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %470 = affine.load %arg0[%arg6 * 64 + 58, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<59 -> 61, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %471 = arith.mulf %470, %6 {timing = #hls.t<62 -> 66, 4, 1>} : f32
        %472 = affine.load %arg2[%arg6 * 64 + 58] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<64 -> 66, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %473 = arith.addf %471, %472 {timing = #hls.t<66 -> 71, 5, 1>} : f32
        affine.store %473, %arg2[%arg6 * 64 + 58] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<71 -> 72, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %474 = affine.load %arg0[%arg5, %arg6 * 64 + 59] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<60 -> 62, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %475 = arith.mulf %474, %1 {timing = #hls.t<63 -> 67, 4, 1>} : f32
        %476 = affine.load %arg4[%arg6 * 64 + 59] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<65 -> 67, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %477 = arith.addf %475, %476 {timing = #hls.t<67 -> 72, 5, 1>} : f32
        affine.store %477, %arg4[%arg6 * 64 + 59] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<72 -> 73, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %478 = affine.load %arg0[%arg6 * 64 + 59, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %479 = arith.mulf %478, %6 {timing = #hls.t<63 -> 67, 4, 1>} : f32
        %480 = affine.load %arg2[%arg6 * 64 + 59] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<65 -> 67, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %481 = arith.addf %479, %480 {timing = #hls.t<67 -> 72, 5, 1>} : f32
        affine.store %481, %arg2[%arg6 * 64 + 59] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<72 -> 73, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %482 = affine.load %arg0[%arg5, %arg6 * 64 + 60] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<60 -> 62, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %483 = arith.mulf %482, %1 {timing = #hls.t<64 -> 68, 4, 1>} : f32
        %484 = affine.load %arg4[%arg6 * 64 + 60] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<66 -> 68, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %485 = arith.addf %483, %484 {timing = #hls.t<68 -> 73, 5, 1>} : f32
        affine.store %485, %arg4[%arg6 * 64 + 60] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<73 -> 74, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %486 = affine.load %arg0[%arg6 * 64 + 60, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %487 = arith.mulf %486, %6 {timing = #hls.t<64 -> 68, 4, 1>} : f32
        %488 = affine.load %arg2[%arg6 * 64 + 60] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<66 -> 68, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %489 = arith.addf %487, %488 {timing = #hls.t<68 -> 73, 5, 1>} : f32
        affine.store %489, %arg2[%arg6 * 64 + 60] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<73 -> 74, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %490 = affine.load %arg0[%arg5, %arg6 * 64 + 61] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<62 -> 64, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %491 = arith.mulf %490, %1 {timing = #hls.t<65 -> 69, 4, 1>} : f32
        %492 = affine.load %arg4[%arg6 * 64 + 61] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<67 -> 69, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %493 = arith.addf %491, %492 {timing = #hls.t<69 -> 74, 5, 1>} : f32
        affine.store %493, %arg4[%arg6 * 64 + 61] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<74 -> 75, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %494 = affine.load %arg0[%arg6 * 64 + 61, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<63 -> 65, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %495 = arith.mulf %494, %6 {timing = #hls.t<65 -> 69, 4, 1>} : f32
        %496 = affine.load %arg2[%arg6 * 64 + 61] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<67 -> 69, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %497 = arith.addf %495, %496 {timing = #hls.t<69 -> 74, 5, 1>} : f32
        affine.store %497, %arg2[%arg6 * 64 + 61] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<74 -> 75, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %498 = affine.load %arg0[%arg5, %arg6 * 64 + 62] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<62 -> 64, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %499 = arith.mulf %498, %1 {timing = #hls.t<66 -> 70, 4, 1>} : f32
        %500 = affine.load %arg4[%arg6 * 64 + 62] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<68 -> 70, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %501 = arith.addf %499, %500 {timing = #hls.t<70 -> 75, 5, 1>} : f32
        affine.store %501, %arg4[%arg6 * 64 + 62] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<75 -> 76, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %502 = affine.load %arg0[%arg6 * 64 + 62, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<63 -> 65, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %503 = arith.mulf %502, %6 {timing = #hls.t<66 -> 70, 4, 1>} : f32
        %504 = affine.load %arg2[%arg6 * 64 + 62] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<68 -> 70, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %505 = arith.addf %503, %504 {timing = #hls.t<70 -> 75, 5, 1>} : f32
        affine.store %505, %arg2[%arg6 * 64 + 62] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<75 -> 76, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %506 = affine.load %arg0[%arg5, %arg6 * 64 + 63] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<64 -> 66, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %507 = arith.mulf %506, %1 {timing = #hls.t<67 -> 71, 4, 1>} : f32
        %508 = affine.load %arg4[%arg6 * 64 + 63] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<69 -> 71, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %509 = arith.addf %507, %508 {timing = #hls.t<71 -> 76, 5, 1>} : f32
        affine.store %509, %arg4[%arg6 * 64 + 63] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<76 -> 77, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %510 = affine.load %arg0[%arg6 * 64 + 63, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<65 -> 67, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %511 = arith.mulf %510, %6 {timing = #hls.t<67 -> 71, 4, 1>} : f32
        %512 = affine.load %arg2[%arg6 * 64 + 63] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<69 -> 71, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %513 = arith.addf %511, %512 {timing = #hls.t<71 -> 76, 5, 1>} : f32
        affine.store %513, %arg2[%arg6 * 64 + 63] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<76 -> 77, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %514 = affine.load %arg0[%arg5, %arg6 * 64 + 64] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<64 -> 66, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %515 = arith.mulf %514, %1 {timing = #hls.t<68 -> 72, 4, 1>} : f32
        %516 = affine.load %arg4[%arg6 * 64 + 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<70 -> 72, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %517 = arith.addf %515, %516 {timing = #hls.t<72 -> 77, 5, 1>} : f32
        affine.store %517, %arg4[%arg6 * 64 + 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<77 -> 78, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %518 = affine.load %arg0[%arg6 * 64 + 64, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<65 -> 67, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %519 = arith.mulf %518, %6 {timing = #hls.t<68 -> 72, 4, 1>} : f32
        %520 = affine.load %arg2[%arg6 * 64 + 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<70 -> 72, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %521 = arith.addf %519, %520 {timing = #hls.t<72 -> 77, 5, 1>} : f32
        affine.store %521, %arg2[%arg6 * 64 + 64] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<77 -> 78, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %522 = affine.load %arg0[%arg5, %arg6 * 64 + 65] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<66 -> 68, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %523 = arith.mulf %522, %1 {timing = #hls.t<69 -> 73, 4, 1>} : f32
        %524 = affine.load %arg4[%arg6 * 64 + 65] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<71 -> 73, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %525 = arith.addf %523, %524 {timing = #hls.t<73 -> 78, 5, 1>} : f32
        affine.store %525, %arg4[%arg6 * 64 + 65] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<78 -> 79, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %526 = affine.load %arg0[%arg6 * 64 + 65, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<67 -> 69, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %527 = arith.mulf %526, %6 {timing = #hls.t<69 -> 73, 4, 1>} : f32
        %528 = affine.load %arg2[%arg6 * 64 + 65] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<71 -> 73, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %529 = arith.addf %527, %528 {timing = #hls.t<73 -> 78, 5, 1>} : f32
        affine.store %529, %arg2[%arg6 * 64 + 65] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<78 -> 79, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %530 = affine.load %arg0[%arg5, %arg6 * 64 + 66] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<66 -> 68, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %531 = arith.mulf %530, %1 {timing = #hls.t<70 -> 74, 4, 1>} : f32
        %532 = affine.load %arg4[%arg6 * 64 + 66] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<72 -> 74, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %533 = arith.addf %531, %532 {timing = #hls.t<74 -> 79, 5, 1>} : f32
        affine.store %533, %arg4[%arg6 * 64 + 66] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<79 -> 80, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %534 = affine.load %arg0[%arg6 * 64 + 66, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<67 -> 69, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %535 = arith.mulf %534, %6 {timing = #hls.t<70 -> 74, 4, 1>} : f32
        %536 = affine.load %arg2[%arg6 * 64 + 66] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<72 -> 74, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %537 = arith.addf %535, %536 {timing = #hls.t<74 -> 79, 5, 1>} : f32
        affine.store %537, %arg2[%arg6 * 64 + 66] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<79 -> 80, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %538 = affine.load %arg0[%arg5, %arg6 * 64 + 67] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<68 -> 70, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %539 = arith.mulf %538, %1 {timing = #hls.t<71 -> 75, 4, 1>} : f32
        %540 = affine.load %arg4[%arg6 * 64 + 67] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<73 -> 75, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %541 = arith.addf %539, %540 {timing = #hls.t<75 -> 80, 5, 1>} : f32
        affine.store %541, %arg4[%arg6 * 64 + 67] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<80 -> 81, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %542 = affine.load %arg0[%arg6 * 64 + 67, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<69 -> 71, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %543 = arith.mulf %542, %6 {timing = #hls.t<71 -> 75, 4, 1>} : f32
        %544 = affine.load %arg2[%arg6 * 64 + 67] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<73 -> 75, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %545 = arith.addf %543, %544 {timing = #hls.t<75 -> 80, 5, 1>} : f32
        affine.store %545, %arg2[%arg6 * 64 + 67] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<80 -> 81, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %546 = affine.load %arg0[%arg5, %arg6 * 64 + 68] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<68 -> 70, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %547 = arith.mulf %546, %1 {timing = #hls.t<72 -> 76, 4, 1>} : f32
        %548 = affine.load %arg4[%arg6 * 64 + 68] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<74 -> 76, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %549 = arith.addf %547, %548 {timing = #hls.t<76 -> 81, 5, 1>} : f32
        affine.store %549, %arg4[%arg6 * 64 + 68] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<81 -> 82, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %550 = affine.load %arg0[%arg6 * 64 + 68, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<69 -> 71, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %551 = arith.mulf %550, %6 {timing = #hls.t<72 -> 76, 4, 1>} : f32
        %552 = affine.load %arg2[%arg6 * 64 + 68] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<74 -> 76, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %553 = arith.addf %551, %552 {timing = #hls.t<76 -> 81, 5, 1>} : f32
        affine.store %553, %arg2[%arg6 * 64 + 68] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<81 -> 82, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %554 = affine.load %arg0[%arg5, %arg6 * 64 + 69] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<70 -> 72, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %555 = arith.mulf %554, %1 {timing = #hls.t<73 -> 77, 4, 1>} : f32
        %556 = affine.load %arg4[%arg6 * 64 + 69] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<75 -> 77, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %557 = arith.addf %555, %556 {timing = #hls.t<77 -> 82, 5, 1>} : f32
        affine.store %557, %arg4[%arg6 * 64 + 69] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<82 -> 83, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %558 = affine.load %arg0[%arg6 * 64 + 69, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<71 -> 73, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %559 = arith.mulf %558, %6 {timing = #hls.t<73 -> 77, 4, 1>} : f32
        %560 = affine.load %arg2[%arg6 * 64 + 69] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<75 -> 77, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %561 = arith.addf %559, %560 {timing = #hls.t<77 -> 82, 5, 1>} : f32
        affine.store %561, %arg2[%arg6 * 64 + 69] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<82 -> 83, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %562 = affine.load %arg0[%arg5, %arg6 * 64 + 70] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<70 -> 72, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %563 = arith.mulf %562, %1 {timing = #hls.t<74 -> 78, 4, 1>} : f32
        %564 = affine.load %arg4[%arg6 * 64 + 70] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<76 -> 78, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %565 = arith.addf %563, %564 {timing = #hls.t<78 -> 83, 5, 1>} : f32
        affine.store %565, %arg4[%arg6 * 64 + 70] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<83 -> 84, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %566 = affine.load %arg0[%arg6 * 64 + 70, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<71 -> 73, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %567 = arith.mulf %566, %6 {timing = #hls.t<74 -> 78, 4, 1>} : f32
        %568 = affine.load %arg2[%arg6 * 64 + 70] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<76 -> 78, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %569 = arith.addf %567, %568 {timing = #hls.t<78 -> 83, 5, 1>} : f32
        affine.store %569, %arg2[%arg6 * 64 + 70] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<83 -> 84, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %570 = affine.load %arg0[%arg5, %arg6 * 64 + 71] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<72 -> 74, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %571 = arith.mulf %570, %1 {timing = #hls.t<75 -> 79, 4, 1>} : f32
        %572 = affine.load %arg4[%arg6 * 64 + 71] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<77 -> 79, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %573 = arith.addf %571, %572 {timing = #hls.t<79 -> 84, 5, 1>} : f32
        affine.store %573, %arg4[%arg6 * 64 + 71] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<84 -> 85, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %574 = affine.load %arg0[%arg6 * 64 + 71, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<73 -> 75, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %575 = arith.mulf %574, %6 {timing = #hls.t<75 -> 79, 4, 1>} : f32
        %576 = affine.load %arg2[%arg6 * 64 + 71] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<77 -> 79, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %577 = arith.addf %575, %576 {timing = #hls.t<79 -> 84, 5, 1>} : f32
        affine.store %577, %arg2[%arg6 * 64 + 71] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<84 -> 85, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %578 = affine.load %arg0[%arg5, %arg6 * 64 + 72] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<72 -> 74, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %579 = arith.mulf %578, %1 {timing = #hls.t<76 -> 80, 4, 1>} : f32
        %580 = affine.load %arg4[%arg6 * 64 + 72] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<78 -> 80, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %581 = arith.addf %579, %580 {timing = #hls.t<80 -> 85, 5, 1>} : f32
        affine.store %581, %arg4[%arg6 * 64 + 72] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<85 -> 86, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %582 = affine.load %arg0[%arg6 * 64 + 72, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<73 -> 75, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %583 = arith.mulf %582, %6 {timing = #hls.t<76 -> 80, 4, 1>} : f32
        %584 = affine.load %arg2[%arg6 * 64 + 72] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<78 -> 80, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %585 = arith.addf %583, %584 {timing = #hls.t<80 -> 85, 5, 1>} : f32
        affine.store %585, %arg2[%arg6 * 64 + 72] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<85 -> 86, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %586 = affine.load %arg0[%arg5, %arg6 * 64 + 73] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<74 -> 76, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %587 = arith.mulf %586, %1 {timing = #hls.t<77 -> 81, 4, 1>} : f32
        %588 = affine.load %arg4[%arg6 * 64 + 73] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<79 -> 81, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %589 = arith.addf %587, %588 {timing = #hls.t<81 -> 86, 5, 1>} : f32
        affine.store %589, %arg4[%arg6 * 64 + 73] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<86 -> 87, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %590 = affine.load %arg0[%arg6 * 64 + 73, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<75 -> 77, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %591 = arith.mulf %590, %6 {timing = #hls.t<77 -> 81, 4, 1>} : f32
        %592 = affine.load %arg2[%arg6 * 64 + 73] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<79 -> 81, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %593 = arith.addf %591, %592 {timing = #hls.t<81 -> 86, 5, 1>} : f32
        affine.store %593, %arg2[%arg6 * 64 + 73] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<86 -> 87, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %594 = affine.load %arg0[%arg5, %arg6 * 64 + 74] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<74 -> 76, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %595 = arith.mulf %594, %1 {timing = #hls.t<78 -> 82, 4, 1>} : f32
        %596 = affine.load %arg4[%arg6 * 64 + 74] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<80 -> 82, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %597 = arith.addf %595, %596 {timing = #hls.t<82 -> 87, 5, 1>} : f32
        affine.store %597, %arg4[%arg6 * 64 + 74] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<87 -> 88, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %598 = affine.load %arg0[%arg6 * 64 + 74, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<75 -> 77, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %599 = arith.mulf %598, %6 {timing = #hls.t<78 -> 82, 4, 1>} : f32
        %600 = affine.load %arg2[%arg6 * 64 + 74] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<80 -> 82, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %601 = arith.addf %599, %600 {timing = #hls.t<82 -> 87, 5, 1>} : f32
        affine.store %601, %arg2[%arg6 * 64 + 74] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<87 -> 88, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %602 = affine.load %arg0[%arg5, %arg6 * 64 + 75] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<76 -> 78, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %603 = arith.mulf %602, %1 {timing = #hls.t<79 -> 83, 4, 1>} : f32
        %604 = affine.load %arg4[%arg6 * 64 + 75] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<81 -> 83, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %605 = arith.addf %603, %604 {timing = #hls.t<83 -> 88, 5, 1>} : f32
        affine.store %605, %arg4[%arg6 * 64 + 75] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<88 -> 89, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %606 = affine.load %arg0[%arg6 * 64 + 75, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<77 -> 79, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %607 = arith.mulf %606, %6 {timing = #hls.t<79 -> 83, 4, 1>} : f32
        %608 = affine.load %arg2[%arg6 * 64 + 75] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<81 -> 83, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %609 = arith.addf %607, %608 {timing = #hls.t<83 -> 88, 5, 1>} : f32
        affine.store %609, %arg2[%arg6 * 64 + 75] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<88 -> 89, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %610 = affine.load %arg0[%arg5, %arg6 * 64 + 76] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<76 -> 78, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %611 = arith.mulf %610, %1 {timing = #hls.t<80 -> 84, 4, 1>} : f32
        %612 = affine.load %arg4[%arg6 * 64 + 76] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<82 -> 84, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %613 = arith.addf %611, %612 {timing = #hls.t<84 -> 89, 5, 1>} : f32
        affine.store %613, %arg4[%arg6 * 64 + 76] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<89 -> 90, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %614 = affine.load %arg0[%arg6 * 64 + 76, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<77 -> 79, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %615 = arith.mulf %614, %6 {timing = #hls.t<80 -> 84, 4, 1>} : f32
        %616 = affine.load %arg2[%arg6 * 64 + 76] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<82 -> 84, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %617 = arith.addf %615, %616 {timing = #hls.t<84 -> 89, 5, 1>} : f32
        affine.store %617, %arg2[%arg6 * 64 + 76] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<89 -> 90, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %618 = affine.load %arg0[%arg5, %arg6 * 64 + 77] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<78 -> 80, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %619 = arith.mulf %618, %1 {timing = #hls.t<81 -> 85, 4, 1>} : f32
        %620 = affine.load %arg4[%arg6 * 64 + 77] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<83 -> 85, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %621 = arith.addf %619, %620 {timing = #hls.t<85 -> 90, 5, 1>} : f32
        affine.store %621, %arg4[%arg6 * 64 + 77] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<90 -> 91, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %622 = affine.load %arg0[%arg6 * 64 + 77, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<79 -> 81, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %623 = arith.mulf %622, %6 {timing = #hls.t<81 -> 85, 4, 1>} : f32
        %624 = affine.load %arg2[%arg6 * 64 + 77] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<83 -> 85, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %625 = arith.addf %623, %624 {timing = #hls.t<85 -> 90, 5, 1>} : f32
        affine.store %625, %arg2[%arg6 * 64 + 77] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<90 -> 91, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %626 = affine.load %arg0[%arg5, %arg6 * 64 + 78] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<78 -> 80, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %627 = arith.mulf %626, %1 {timing = #hls.t<82 -> 86, 4, 1>} : f32
        %628 = affine.load %arg4[%arg6 * 64 + 78] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<84 -> 86, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %629 = arith.addf %627, %628 {timing = #hls.t<86 -> 91, 5, 1>} : f32
        affine.store %629, %arg4[%arg6 * 64 + 78] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<91 -> 92, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %630 = affine.load %arg0[%arg6 * 64 + 78, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<79 -> 81, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %631 = arith.mulf %630, %6 {timing = #hls.t<82 -> 86, 4, 1>} : f32
        %632 = affine.load %arg2[%arg6 * 64 + 78] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<84 -> 86, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %633 = arith.addf %631, %632 {timing = #hls.t<86 -> 91, 5, 1>} : f32
        affine.store %633, %arg2[%arg6 * 64 + 78] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<91 -> 92, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %634 = affine.load %arg0[%arg5, %arg6 * 64 + 79] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<80 -> 82, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %635 = arith.mulf %634, %1 {timing = #hls.t<83 -> 87, 4, 1>} : f32
        %636 = affine.load %arg4[%arg6 * 64 + 79] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<85 -> 87, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %637 = arith.addf %635, %636 {timing = #hls.t<87 -> 92, 5, 1>} : f32
        affine.store %637, %arg4[%arg6 * 64 + 79] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<92 -> 93, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %638 = affine.load %arg0[%arg6 * 64 + 79, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<81 -> 83, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %639 = arith.mulf %638, %6 {timing = #hls.t<83 -> 87, 4, 1>} : f32
        %640 = affine.load %arg2[%arg6 * 64 + 79] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<85 -> 87, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %641 = arith.addf %639, %640 {timing = #hls.t<87 -> 92, 5, 1>} : f32
        affine.store %641, %arg2[%arg6 * 64 + 79] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<92 -> 93, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %642 = affine.load %arg0[%arg5, %arg6 * 64 + 80] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<80 -> 82, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %643 = arith.mulf %642, %1 {timing = #hls.t<84 -> 88, 4, 1>} : f32
        %644 = affine.load %arg4[%arg6 * 64 + 80] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<86 -> 88, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %645 = arith.addf %643, %644 {timing = #hls.t<88 -> 93, 5, 1>} : f32
        affine.store %645, %arg4[%arg6 * 64 + 80] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<93 -> 94, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %646 = affine.load %arg0[%arg6 * 64 + 80, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<81 -> 83, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %647 = arith.mulf %646, %6 {timing = #hls.t<84 -> 88, 4, 1>} : f32
        %648 = affine.load %arg2[%arg6 * 64 + 80] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<86 -> 88, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %649 = arith.addf %647, %648 {timing = #hls.t<88 -> 93, 5, 1>} : f32
        affine.store %649, %arg2[%arg6 * 64 + 80] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<93 -> 94, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %650 = affine.load %arg0[%arg5, %arg6 * 64 + 81] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<82 -> 84, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %651 = arith.mulf %650, %1 {timing = #hls.t<85 -> 89, 4, 1>} : f32
        %652 = affine.load %arg4[%arg6 * 64 + 81] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<87 -> 89, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %653 = arith.addf %651, %652 {timing = #hls.t<89 -> 94, 5, 1>} : f32
        affine.store %653, %arg4[%arg6 * 64 + 81] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<94 -> 95, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %654 = affine.load %arg0[%arg6 * 64 + 81, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<83 -> 85, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %655 = arith.mulf %654, %6 {timing = #hls.t<85 -> 89, 4, 1>} : f32
        %656 = affine.load %arg2[%arg6 * 64 + 81] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<87 -> 89, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %657 = arith.addf %655, %656 {timing = #hls.t<89 -> 94, 5, 1>} : f32
        affine.store %657, %arg2[%arg6 * 64 + 81] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<94 -> 95, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %658 = affine.load %arg0[%arg5, %arg6 * 64 + 82] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<82 -> 84, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %659 = arith.mulf %658, %1 {timing = #hls.t<86 -> 90, 4, 1>} : f32
        %660 = affine.load %arg4[%arg6 * 64 + 82] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<88 -> 90, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %661 = arith.addf %659, %660 {timing = #hls.t<90 -> 95, 5, 1>} : f32
        affine.store %661, %arg4[%arg6 * 64 + 82] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<95 -> 96, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %662 = affine.load %arg0[%arg6 * 64 + 82, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<83 -> 85, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %663 = arith.mulf %662, %6 {timing = #hls.t<86 -> 90, 4, 1>} : f32
        %664 = affine.load %arg2[%arg6 * 64 + 82] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<88 -> 90, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %665 = arith.addf %663, %664 {timing = #hls.t<90 -> 95, 5, 1>} : f32
        affine.store %665, %arg2[%arg6 * 64 + 82] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<95 -> 96, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %666 = affine.load %arg0[%arg5, %arg6 * 64 + 83] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<84 -> 86, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %667 = arith.mulf %666, %1 {timing = #hls.t<87 -> 91, 4, 1>} : f32
        %668 = affine.load %arg4[%arg6 * 64 + 83] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<89 -> 91, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %669 = arith.addf %667, %668 {timing = #hls.t<91 -> 96, 5, 1>} : f32
        affine.store %669, %arg4[%arg6 * 64 + 83] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<96 -> 97, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %670 = affine.load %arg0[%arg6 * 64 + 83, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<85 -> 87, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %671 = arith.mulf %670, %6 {timing = #hls.t<87 -> 91, 4, 1>} : f32
        %672 = affine.load %arg2[%arg6 * 64 + 83] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<89 -> 91, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %673 = arith.addf %671, %672 {timing = #hls.t<91 -> 96, 5, 1>} : f32
        affine.store %673, %arg2[%arg6 * 64 + 83] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<96 -> 97, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %674 = affine.load %arg0[%arg5, %arg6 * 64 + 84] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<84 -> 86, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %675 = arith.mulf %674, %1 {timing = #hls.t<88 -> 92, 4, 1>} : f32
        %676 = affine.load %arg4[%arg6 * 64 + 84] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<90 -> 92, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %677 = arith.addf %675, %676 {timing = #hls.t<92 -> 97, 5, 1>} : f32
        affine.store %677, %arg4[%arg6 * 64 + 84] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<97 -> 98, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %678 = affine.load %arg0[%arg6 * 64 + 84, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<85 -> 87, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %679 = arith.mulf %678, %6 {timing = #hls.t<88 -> 92, 4, 1>} : f32
        %680 = affine.load %arg2[%arg6 * 64 + 84] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<90 -> 92, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %681 = arith.addf %679, %680 {timing = #hls.t<92 -> 97, 5, 1>} : f32
        affine.store %681, %arg2[%arg6 * 64 + 84] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<97 -> 98, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %682 = affine.load %arg0[%arg5, %arg6 * 64 + 85] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<86 -> 88, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %683 = arith.mulf %682, %1 {timing = #hls.t<89 -> 93, 4, 1>} : f32
        %684 = affine.load %arg4[%arg6 * 64 + 85] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<91 -> 93, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %685 = arith.addf %683, %684 {timing = #hls.t<93 -> 98, 5, 1>} : f32
        affine.store %685, %arg4[%arg6 * 64 + 85] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<98 -> 99, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %686 = affine.load %arg0[%arg6 * 64 + 85, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<87 -> 89, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %687 = arith.mulf %686, %6 {timing = #hls.t<89 -> 93, 4, 1>} : f32
        %688 = affine.load %arg2[%arg6 * 64 + 85] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<91 -> 93, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %689 = arith.addf %687, %688 {timing = #hls.t<93 -> 98, 5, 1>} : f32
        affine.store %689, %arg2[%arg6 * 64 + 85] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<98 -> 99, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %690 = affine.load %arg0[%arg5, %arg6 * 64 + 86] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<86 -> 88, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %691 = arith.mulf %690, %1 {timing = #hls.t<90 -> 94, 4, 1>} : f32
        %692 = affine.load %arg4[%arg6 * 64 + 86] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<92 -> 94, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %693 = arith.addf %691, %692 {timing = #hls.t<94 -> 99, 5, 1>} : f32
        affine.store %693, %arg4[%arg6 * 64 + 86] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<99 -> 100, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %694 = affine.load %arg0[%arg6 * 64 + 86, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<87 -> 89, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %695 = arith.mulf %694, %6 {timing = #hls.t<90 -> 94, 4, 1>} : f32
        %696 = affine.load %arg2[%arg6 * 64 + 86] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<92 -> 94, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %697 = arith.addf %695, %696 {timing = #hls.t<94 -> 99, 5, 1>} : f32
        affine.store %697, %arg2[%arg6 * 64 + 86] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<99 -> 100, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %698 = affine.load %arg0[%arg5, %arg6 * 64 + 87] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<88 -> 90, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %699 = arith.mulf %698, %1 {timing = #hls.t<91 -> 95, 4, 1>} : f32
        %700 = affine.load %arg4[%arg6 * 64 + 87] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<93 -> 95, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %701 = arith.addf %699, %700 {timing = #hls.t<95 -> 100, 5, 1>} : f32
        affine.store %701, %arg4[%arg6 * 64 + 87] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<100 -> 101, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %702 = affine.load %arg0[%arg6 * 64 + 87, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<89 -> 91, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %703 = arith.mulf %702, %6 {timing = #hls.t<91 -> 95, 4, 1>} : f32
        %704 = affine.load %arg2[%arg6 * 64 + 87] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<93 -> 95, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %705 = arith.addf %703, %704 {timing = #hls.t<95 -> 100, 5, 1>} : f32
        affine.store %705, %arg2[%arg6 * 64 + 87] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<100 -> 101, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %706 = affine.load %arg0[%arg5, %arg6 * 64 + 88] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<88 -> 90, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %707 = arith.mulf %706, %1 {timing = #hls.t<92 -> 96, 4, 1>} : f32
        %708 = affine.load %arg4[%arg6 * 64 + 88] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<94 -> 96, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %709 = arith.addf %707, %708 {timing = #hls.t<96 -> 101, 5, 1>} : f32
        affine.store %709, %arg4[%arg6 * 64 + 88] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<101 -> 102, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %710 = affine.load %arg0[%arg6 * 64 + 88, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<89 -> 91, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %711 = arith.mulf %710, %6 {timing = #hls.t<92 -> 96, 4, 1>} : f32
        %712 = affine.load %arg2[%arg6 * 64 + 88] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<94 -> 96, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %713 = arith.addf %711, %712 {timing = #hls.t<96 -> 101, 5, 1>} : f32
        affine.store %713, %arg2[%arg6 * 64 + 88] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<101 -> 102, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %714 = affine.load %arg0[%arg5, %arg6 * 64 + 89] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<90 -> 92, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %715 = arith.mulf %714, %1 {timing = #hls.t<93 -> 97, 4, 1>} : f32
        %716 = affine.load %arg4[%arg6 * 64 + 89] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<95 -> 97, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %717 = arith.addf %715, %716 {timing = #hls.t<97 -> 102, 5, 1>} : f32
        affine.store %717, %arg4[%arg6 * 64 + 89] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<102 -> 103, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %718 = affine.load %arg0[%arg6 * 64 + 89, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<91 -> 93, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %719 = arith.mulf %718, %6 {timing = #hls.t<93 -> 97, 4, 1>} : f32
        %720 = affine.load %arg2[%arg6 * 64 + 89] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<95 -> 97, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %721 = arith.addf %719, %720 {timing = #hls.t<97 -> 102, 5, 1>} : f32
        affine.store %721, %arg2[%arg6 * 64 + 89] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<102 -> 103, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %722 = affine.load %arg0[%arg5, %arg6 * 64 + 90] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<90 -> 92, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %723 = arith.mulf %722, %1 {timing = #hls.t<94 -> 98, 4, 1>} : f32
        %724 = affine.load %arg4[%arg6 * 64 + 90] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %725 = arith.addf %723, %724 {timing = #hls.t<98 -> 103, 5, 1>} : f32
        affine.store %725, %arg4[%arg6 * 64 + 90] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<103 -> 104, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %726 = affine.load %arg0[%arg6 * 64 + 90, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<91 -> 93, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %727 = arith.mulf %726, %6 {timing = #hls.t<94 -> 98, 4, 1>} : f32
        %728 = affine.load %arg2[%arg6 * 64 + 90] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %729 = arith.addf %727, %728 {timing = #hls.t<98 -> 103, 5, 1>} : f32
        affine.store %729, %arg2[%arg6 * 64 + 90] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<103 -> 104, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %730 = affine.load %arg0[%arg5, %arg6 * 64 + 91] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<92 -> 94, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %731 = arith.mulf %730, %1 {timing = #hls.t<95 -> 99, 4, 1>} : f32
        %732 = affine.load %arg4[%arg6 * 64 + 91] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<97 -> 99, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %733 = arith.addf %731, %732 {timing = #hls.t<99 -> 104, 5, 1>} : f32
        affine.store %733, %arg4[%arg6 * 64 + 91] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<104 -> 105, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %734 = affine.load %arg0[%arg6 * 64 + 91, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<93 -> 95, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %735 = arith.mulf %734, %6 {timing = #hls.t<95 -> 99, 4, 1>} : f32
        %736 = affine.load %arg2[%arg6 * 64 + 91] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<97 -> 99, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %737 = arith.addf %735, %736 {timing = #hls.t<99 -> 104, 5, 1>} : f32
        affine.store %737, %arg2[%arg6 * 64 + 91] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<104 -> 105, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %738 = affine.load %arg0[%arg5, %arg6 * 64 + 92] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<92 -> 94, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %739 = arith.mulf %738, %1 {timing = #hls.t<96 -> 100, 4, 1>} : f32
        %740 = affine.load %arg4[%arg6 * 64 + 92] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<98 -> 100, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %741 = arith.addf %739, %740 {timing = #hls.t<100 -> 105, 5, 1>} : f32
        affine.store %741, %arg4[%arg6 * 64 + 92] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<105 -> 106, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %742 = affine.load %arg0[%arg6 * 64 + 92, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<93 -> 95, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %743 = arith.mulf %742, %6 {timing = #hls.t<96 -> 100, 4, 1>} : f32
        %744 = affine.load %arg2[%arg6 * 64 + 92] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<98 -> 100, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %745 = arith.addf %743, %744 {timing = #hls.t<100 -> 105, 5, 1>} : f32
        affine.store %745, %arg2[%arg6 * 64 + 92] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<105 -> 106, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %746 = affine.load %arg0[%arg5, %arg6 * 64 + 93] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<94 -> 96, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %747 = arith.mulf %746, %1 {timing = #hls.t<97 -> 101, 4, 1>} : f32
        %748 = affine.load %arg4[%arg6 * 64 + 93] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<99 -> 101, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %749 = arith.addf %747, %748 {timing = #hls.t<101 -> 106, 5, 1>} : f32
        affine.store %749, %arg4[%arg6 * 64 + 93] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<106 -> 107, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %750 = affine.load %arg0[%arg6 * 64 + 93, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<95 -> 97, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %751 = arith.mulf %750, %6 {timing = #hls.t<97 -> 101, 4, 1>} : f32
        %752 = affine.load %arg2[%arg6 * 64 + 93] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<99 -> 101, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %753 = arith.addf %751, %752 {timing = #hls.t<101 -> 106, 5, 1>} : f32
        affine.store %753, %arg2[%arg6 * 64 + 93] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<106 -> 107, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %754 = affine.load %arg0[%arg5, %arg6 * 64 + 94] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<94 -> 96, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %755 = arith.mulf %754, %1 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %756 = affine.load %arg4[%arg6 * 64 + 94] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<100 -> 102, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %757 = arith.addf %755, %756 {timing = #hls.t<102 -> 107, 5, 1>} : f32
        affine.store %757, %arg4[%arg6 * 64 + 94] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<107 -> 108, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %758 = affine.load %arg0[%arg6 * 64 + 94, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<95 -> 97, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %759 = arith.mulf %758, %6 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %760 = affine.load %arg2[%arg6 * 64 + 94] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<100 -> 102, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %761 = arith.addf %759, %760 {timing = #hls.t<102 -> 107, 5, 1>} : f32
        affine.store %761, %arg2[%arg6 * 64 + 94] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<107 -> 108, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %762 = affine.load %arg0[%arg5, %arg6 * 64 + 95] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %763 = arith.mulf %762, %1 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %764 = affine.load %arg4[%arg6 * 64 + 95] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<101 -> 103, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %765 = arith.addf %763, %764 {timing = #hls.t<103 -> 108, 5, 1>} : f32
        affine.store %765, %arg4[%arg6 * 64 + 95] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<108 -> 109, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %766 = affine.load %arg0[%arg6 * 64 + 95, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<97 -> 99, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %767 = arith.mulf %766, %6 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %768 = affine.load %arg2[%arg6 * 64 + 95] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<101 -> 103, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %769 = arith.addf %767, %768 {timing = #hls.t<103 -> 108, 5, 1>} : f32
        affine.store %769, %arg2[%arg6 * 64 + 95] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<108 -> 109, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %770 = affine.load %arg0[%arg5, %arg6 * 64 + 96] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %771 = arith.mulf %770, %1 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %772 = affine.load %arg4[%arg6 * 64 + 96] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<102 -> 104, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %773 = arith.addf %771, %772 {timing = #hls.t<104 -> 109, 5, 1>} : f32
        affine.store %773, %arg4[%arg6 * 64 + 96] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<109 -> 110, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %774 = affine.load %arg0[%arg6 * 64 + 96, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<97 -> 99, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %775 = arith.mulf %774, %6 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %776 = affine.load %arg2[%arg6 * 64 + 96] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<102 -> 104, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %777 = arith.addf %775, %776 {timing = #hls.t<104 -> 109, 5, 1>} : f32
        affine.store %777, %arg2[%arg6 * 64 + 96] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<109 -> 110, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %778 = affine.load %arg0[%arg5, %arg6 * 64 + 97] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<98 -> 100, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %779 = arith.mulf %778, %1 {timing = #hls.t<101 -> 105, 4, 1>} : f32
        %780 = affine.load %arg4[%arg6 * 64 + 97] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<103 -> 105, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %781 = arith.addf %779, %780 {timing = #hls.t<105 -> 110, 5, 1>} : f32
        affine.store %781, %arg4[%arg6 * 64 + 97] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<110 -> 111, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %782 = affine.load %arg0[%arg6 * 64 + 97, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<99 -> 101, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %783 = arith.mulf %782, %6 {timing = #hls.t<101 -> 105, 4, 1>} : f32
        %784 = affine.load %arg2[%arg6 * 64 + 97] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<103 -> 105, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %785 = arith.addf %783, %784 {timing = #hls.t<105 -> 110, 5, 1>} : f32
        affine.store %785, %arg2[%arg6 * 64 + 97] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<110 -> 111, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %786 = affine.load %arg0[%arg5, %arg6 * 64 + 98] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<98 -> 100, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %787 = arith.mulf %786, %1 {timing = #hls.t<102 -> 106, 4, 1>} : f32
        %788 = affine.load %arg4[%arg6 * 64 + 98] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<104 -> 106, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %789 = arith.addf %787, %788 {timing = #hls.t<106 -> 111, 5, 1>} : f32
        affine.store %789, %arg4[%arg6 * 64 + 98] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<111 -> 112, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %790 = affine.load %arg0[%arg6 * 64 + 98, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<99 -> 101, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %791 = arith.mulf %790, %6 {timing = #hls.t<102 -> 106, 4, 1>} : f32
        %792 = affine.load %arg2[%arg6 * 64 + 98] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<104 -> 106, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %793 = arith.addf %791, %792 {timing = #hls.t<106 -> 111, 5, 1>} : f32
        affine.store %793, %arg2[%arg6 * 64 + 98] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<111 -> 112, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %794 = affine.load %arg0[%arg5, %arg6 * 64 + 99] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<100 -> 102, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %795 = arith.mulf %794, %1 {timing = #hls.t<103 -> 107, 4, 1>} : f32
        %796 = affine.load %arg4[%arg6 * 64 + 99] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<105 -> 107, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %797 = arith.addf %795, %796 {timing = #hls.t<107 -> 112, 5, 1>} : f32
        affine.store %797, %arg4[%arg6 * 64 + 99] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<112 -> 113, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %798 = affine.load %arg0[%arg6 * 64 + 99, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<101 -> 103, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %799 = arith.mulf %798, %6 {timing = #hls.t<103 -> 107, 4, 1>} : f32
        %800 = affine.load %arg2[%arg6 * 64 + 99] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<105 -> 107, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %801 = arith.addf %799, %800 {timing = #hls.t<107 -> 112, 5, 1>} : f32
        affine.store %801, %arg2[%arg6 * 64 + 99] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<112 -> 113, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %802 = affine.load %arg0[%arg5, %arg6 * 64 + 100] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<100 -> 102, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %803 = arith.mulf %802, %1 {timing = #hls.t<104 -> 108, 4, 1>} : f32
        %804 = affine.load %arg4[%arg6 * 64 + 100] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<106 -> 108, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %805 = arith.addf %803, %804 {timing = #hls.t<108 -> 113, 5, 1>} : f32
        affine.store %805, %arg4[%arg6 * 64 + 100] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<113 -> 114, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %806 = affine.load %arg0[%arg6 * 64 + 100, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<101 -> 103, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %807 = arith.mulf %806, %6 {timing = #hls.t<104 -> 108, 4, 1>} : f32
        %808 = affine.load %arg2[%arg6 * 64 + 100] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<106 -> 108, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %809 = arith.addf %807, %808 {timing = #hls.t<108 -> 113, 5, 1>} : f32
        affine.store %809, %arg2[%arg6 * 64 + 100] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<113 -> 114, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %810 = affine.load %arg0[%arg5, %arg6 * 64 + 101] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<102 -> 104, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %811 = arith.mulf %810, %1 {timing = #hls.t<105 -> 109, 4, 1>} : f32
        %812 = affine.load %arg4[%arg6 * 64 + 101] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<107 -> 109, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %813 = arith.addf %811, %812 {timing = #hls.t<109 -> 114, 5, 1>} : f32
        affine.store %813, %arg4[%arg6 * 64 + 101] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<114 -> 115, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %814 = affine.load %arg0[%arg6 * 64 + 101, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<103 -> 105, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %815 = arith.mulf %814, %6 {timing = #hls.t<105 -> 109, 4, 1>} : f32
        %816 = affine.load %arg2[%arg6 * 64 + 101] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<107 -> 109, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %817 = arith.addf %815, %816 {timing = #hls.t<109 -> 114, 5, 1>} : f32
        affine.store %817, %arg2[%arg6 * 64 + 101] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<114 -> 115, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %818 = affine.load %arg0[%arg5, %arg6 * 64 + 102] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<102 -> 104, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %819 = arith.mulf %818, %1 {timing = #hls.t<106 -> 110, 4, 1>} : f32
        %820 = affine.load %arg4[%arg6 * 64 + 102] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<108 -> 110, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %821 = arith.addf %819, %820 {timing = #hls.t<110 -> 115, 5, 1>} : f32
        affine.store %821, %arg4[%arg6 * 64 + 102] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<115 -> 116, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %822 = affine.load %arg0[%arg6 * 64 + 102, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<103 -> 105, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %823 = arith.mulf %822, %6 {timing = #hls.t<106 -> 110, 4, 1>} : f32
        %824 = affine.load %arg2[%arg6 * 64 + 102] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<108 -> 110, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %825 = arith.addf %823, %824 {timing = #hls.t<110 -> 115, 5, 1>} : f32
        affine.store %825, %arg2[%arg6 * 64 + 102] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<115 -> 116, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %826 = affine.load %arg0[%arg5, %arg6 * 64 + 103] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<104 -> 106, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %827 = arith.mulf %826, %1 {timing = #hls.t<107 -> 111, 4, 1>} : f32
        %828 = affine.load %arg4[%arg6 * 64 + 103] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<109 -> 111, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %829 = arith.addf %827, %828 {timing = #hls.t<111 -> 116, 5, 1>} : f32
        affine.store %829, %arg4[%arg6 * 64 + 103] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<116 -> 117, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %830 = affine.load %arg0[%arg6 * 64 + 103, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<105 -> 107, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %831 = arith.mulf %830, %6 {timing = #hls.t<107 -> 111, 4, 1>} : f32
        %832 = affine.load %arg2[%arg6 * 64 + 103] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<109 -> 111, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %833 = arith.addf %831, %832 {timing = #hls.t<111 -> 116, 5, 1>} : f32
        affine.store %833, %arg2[%arg6 * 64 + 103] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<116 -> 117, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %834 = affine.load %arg0[%arg5, %arg6 * 64 + 104] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<104 -> 106, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %835 = arith.mulf %834, %1 {timing = #hls.t<108 -> 112, 4, 1>} : f32
        %836 = affine.load %arg4[%arg6 * 64 + 104] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<110 -> 112, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %837 = arith.addf %835, %836 {timing = #hls.t<112 -> 117, 5, 1>} : f32
        affine.store %837, %arg4[%arg6 * 64 + 104] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<117 -> 118, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %838 = affine.load %arg0[%arg6 * 64 + 104, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<105 -> 107, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %839 = arith.mulf %838, %6 {timing = #hls.t<108 -> 112, 4, 1>} : f32
        %840 = affine.load %arg2[%arg6 * 64 + 104] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<110 -> 112, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %841 = arith.addf %839, %840 {timing = #hls.t<112 -> 117, 5, 1>} : f32
        affine.store %841, %arg2[%arg6 * 64 + 104] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<117 -> 118, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %842 = affine.load %arg0[%arg5, %arg6 * 64 + 105] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<106 -> 108, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %843 = arith.mulf %842, %1 {timing = #hls.t<109 -> 113, 4, 1>} : f32
        %844 = affine.load %arg4[%arg6 * 64 + 105] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %845 = arith.addf %843, %844 {timing = #hls.t<113 -> 118, 5, 1>} : f32
        affine.store %845, %arg4[%arg6 * 64 + 105] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<118 -> 119, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %846 = affine.load %arg0[%arg6 * 64 + 105, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<107 -> 109, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %847 = arith.mulf %846, %6 {timing = #hls.t<109 -> 113, 4, 1>} : f32
        %848 = affine.load %arg2[%arg6 * 64 + 105] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %849 = arith.addf %847, %848 {timing = #hls.t<113 -> 118, 5, 1>} : f32
        affine.store %849, %arg2[%arg6 * 64 + 105] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<118 -> 119, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %850 = affine.load %arg0[%arg5, %arg6 * 64 + 106] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<106 -> 108, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %851 = arith.mulf %850, %1 {timing = #hls.t<110 -> 114, 4, 1>} : f32
        %852 = affine.load %arg4[%arg6 * 64 + 106] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<112 -> 114, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %853 = arith.addf %851, %852 {timing = #hls.t<114 -> 119, 5, 1>} : f32
        affine.store %853, %arg4[%arg6 * 64 + 106] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<119 -> 120, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %854 = affine.load %arg0[%arg6 * 64 + 106, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<107 -> 109, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %855 = arith.mulf %854, %6 {timing = #hls.t<110 -> 114, 4, 1>} : f32
        %856 = affine.load %arg2[%arg6 * 64 + 106] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<112 -> 114, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %857 = arith.addf %855, %856 {timing = #hls.t<114 -> 119, 5, 1>} : f32
        affine.store %857, %arg2[%arg6 * 64 + 106] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<119 -> 120, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %858 = affine.load %arg0[%arg5, %arg6 * 64 + 107] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<108 -> 110, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %859 = arith.mulf %858, %1 {timing = #hls.t<111 -> 115, 4, 1>} : f32
        %860 = affine.load %arg4[%arg6 * 64 + 107] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<113 -> 115, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %861 = arith.addf %859, %860 {timing = #hls.t<115 -> 120, 5, 1>} : f32
        affine.store %861, %arg4[%arg6 * 64 + 107] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<120 -> 121, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %862 = affine.load %arg0[%arg6 * 64 + 107, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<109 -> 111, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %863 = arith.mulf %862, %6 {timing = #hls.t<111 -> 115, 4, 1>} : f32
        %864 = affine.load %arg2[%arg6 * 64 + 107] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<113 -> 115, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %865 = arith.addf %863, %864 {timing = #hls.t<115 -> 120, 5, 1>} : f32
        affine.store %865, %arg2[%arg6 * 64 + 107] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<120 -> 121, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %866 = affine.load %arg0[%arg5, %arg6 * 64 + 108] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<108 -> 110, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %867 = arith.mulf %866, %1 {timing = #hls.t<112 -> 116, 4, 1>} : f32
        %868 = affine.load %arg4[%arg6 * 64 + 108] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<114 -> 116, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %869 = arith.addf %867, %868 {timing = #hls.t<116 -> 121, 5, 1>} : f32
        affine.store %869, %arg4[%arg6 * 64 + 108] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<121 -> 122, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %870 = affine.load %arg0[%arg6 * 64 + 108, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<109 -> 111, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %871 = arith.mulf %870, %6 {timing = #hls.t<112 -> 116, 4, 1>} : f32
        %872 = affine.load %arg2[%arg6 * 64 + 108] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<114 -> 116, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %873 = arith.addf %871, %872 {timing = #hls.t<116 -> 121, 5, 1>} : f32
        affine.store %873, %arg2[%arg6 * 64 + 108] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<121 -> 122, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %874 = affine.load %arg0[%arg5, %arg6 * 64 + 109] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<110 -> 112, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %875 = arith.mulf %874, %1 {timing = #hls.t<113 -> 117, 4, 1>} : f32
        %876 = affine.load %arg4[%arg6 * 64 + 109] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<115 -> 117, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %877 = arith.addf %875, %876 {timing = #hls.t<117 -> 122, 5, 1>} : f32
        affine.store %877, %arg4[%arg6 * 64 + 109] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<122 -> 123, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %878 = affine.load %arg0[%arg6 * 64 + 109, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %879 = arith.mulf %878, %6 {timing = #hls.t<113 -> 117, 4, 1>} : f32
        %880 = affine.load %arg2[%arg6 * 64 + 109] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<115 -> 117, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %881 = arith.addf %879, %880 {timing = #hls.t<117 -> 122, 5, 1>} : f32
        affine.store %881, %arg2[%arg6 * 64 + 109] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<122 -> 123, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %882 = affine.load %arg0[%arg5, %arg6 * 64 + 110] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<110 -> 112, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %883 = arith.mulf %882, %1 {timing = #hls.t<114 -> 118, 4, 1>} : f32
        %884 = affine.load %arg4[%arg6 * 64 + 110] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<116 -> 118, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %885 = arith.addf %883, %884 {timing = #hls.t<118 -> 123, 5, 1>} : f32
        affine.store %885, %arg4[%arg6 * 64 + 110] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<123 -> 124, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %886 = affine.load %arg0[%arg6 * 64 + 110, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %887 = arith.mulf %886, %6 {timing = #hls.t<114 -> 118, 4, 1>} : f32
        %888 = affine.load %arg2[%arg6 * 64 + 110] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<116 -> 118, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %889 = arith.addf %887, %888 {timing = #hls.t<118 -> 123, 5, 1>} : f32
        affine.store %889, %arg2[%arg6 * 64 + 110] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<123 -> 124, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %890 = affine.load %arg0[%arg5, %arg6 * 64 + 111] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<112 -> 114, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %891 = arith.mulf %890, %1 {timing = #hls.t<115 -> 119, 4, 1>} : f32
        %892 = affine.load %arg4[%arg6 * 64 + 111] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<117 -> 119, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %893 = arith.addf %891, %892 {timing = #hls.t<119 -> 124, 5, 1>} : f32
        affine.store %893, %arg4[%arg6 * 64 + 111] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<124 -> 125, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %894 = affine.load %arg0[%arg6 * 64 + 111, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<113 -> 115, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %895 = arith.mulf %894, %6 {timing = #hls.t<115 -> 119, 4, 1>} : f32
        %896 = affine.load %arg2[%arg6 * 64 + 111] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<117 -> 119, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %897 = arith.addf %895, %896 {timing = #hls.t<119 -> 124, 5, 1>} : f32
        affine.store %897, %arg2[%arg6 * 64 + 111] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<124 -> 125, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %898 = affine.load %arg0[%arg5, %arg6 * 64 + 112] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<112 -> 114, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %899 = arith.mulf %898, %1 {timing = #hls.t<116 -> 120, 4, 1>} : f32
        %900 = affine.load %arg4[%arg6 * 64 + 112] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<118 -> 120, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %901 = arith.addf %899, %900 {timing = #hls.t<120 -> 125, 5, 1>} : f32
        affine.store %901, %arg4[%arg6 * 64 + 112] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<125 -> 126, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %902 = affine.load %arg0[%arg6 * 64 + 112, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<113 -> 115, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %903 = arith.mulf %902, %6 {timing = #hls.t<116 -> 120, 4, 1>} : f32
        %904 = affine.load %arg2[%arg6 * 64 + 112] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<118 -> 120, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %905 = arith.addf %903, %904 {timing = #hls.t<120 -> 125, 5, 1>} : f32
        affine.store %905, %arg2[%arg6 * 64 + 112] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<125 -> 126, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %906 = affine.load %arg0[%arg5, %arg6 * 64 + 113] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<114 -> 116, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %907 = arith.mulf %906, %1 {timing = #hls.t<117 -> 121, 4, 1>} : f32
        %908 = affine.load %arg4[%arg6 * 64 + 113] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<119 -> 121, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %909 = arith.addf %907, %908 {timing = #hls.t<121 -> 126, 5, 1>} : f32
        affine.store %909, %arg4[%arg6 * 64 + 113] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<126 -> 127, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %910 = affine.load %arg0[%arg6 * 64 + 113, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<115 -> 117, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %911 = arith.mulf %910, %6 {timing = #hls.t<117 -> 121, 4, 1>} : f32
        %912 = affine.load %arg2[%arg6 * 64 + 113] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<119 -> 121, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %913 = arith.addf %911, %912 {timing = #hls.t<121 -> 126, 5, 1>} : f32
        affine.store %913, %arg2[%arg6 * 64 + 113] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<126 -> 127, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %914 = affine.load %arg0[%arg5, %arg6 * 64 + 114] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<114 -> 116, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %915 = arith.mulf %914, %1 {timing = #hls.t<118 -> 122, 4, 1>} : f32
        %916 = affine.load %arg4[%arg6 * 64 + 114] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<120 -> 122, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %917 = arith.addf %915, %916 {timing = #hls.t<122 -> 127, 5, 1>} : f32
        affine.store %917, %arg4[%arg6 * 64 + 114] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<127 -> 128, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %918 = affine.load %arg0[%arg6 * 64 + 114, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<115 -> 117, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %919 = arith.mulf %918, %6 {timing = #hls.t<118 -> 122, 4, 1>} : f32
        %920 = affine.load %arg2[%arg6 * 64 + 114] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<120 -> 122, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %921 = arith.addf %919, %920 {timing = #hls.t<122 -> 127, 5, 1>} : f32
        affine.store %921, %arg2[%arg6 * 64 + 114] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<127 -> 128, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %922 = affine.load %arg0[%arg5, %arg6 * 64 + 115] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<116 -> 118, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %923 = arith.mulf %922, %1 {timing = #hls.t<119 -> 123, 4, 1>} : f32
        %924 = affine.load %arg4[%arg6 * 64 + 115] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %925 = arith.addf %923, %924 {timing = #hls.t<123 -> 128, 5, 1>} : f32
        affine.store %925, %arg4[%arg6 * 64 + 115] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<128 -> 129, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %926 = affine.load %arg0[%arg6 * 64 + 115, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<117 -> 119, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %927 = arith.mulf %926, %6 {timing = #hls.t<119 -> 123, 4, 1>} : f32
        %928 = affine.load %arg2[%arg6 * 64 + 115] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %929 = arith.addf %927, %928 {timing = #hls.t<123 -> 128, 5, 1>} : f32
        affine.store %929, %arg2[%arg6 * 64 + 115] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<128 -> 129, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %930 = affine.load %arg0[%arg5, %arg6 * 64 + 116] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<116 -> 118, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %931 = arith.mulf %930, %1 {timing = #hls.t<120 -> 124, 4, 1>} : f32
        %932 = affine.load %arg4[%arg6 * 64 + 116] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<122 -> 124, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %933 = arith.addf %931, %932 {timing = #hls.t<124 -> 129, 5, 1>} : f32
        affine.store %933, %arg4[%arg6 * 64 + 116] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<129 -> 130, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %934 = affine.load %arg0[%arg6 * 64 + 116, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<117 -> 119, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %935 = arith.mulf %934, %6 {timing = #hls.t<120 -> 124, 4, 1>} : f32
        %936 = affine.load %arg2[%arg6 * 64 + 116] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<122 -> 124, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %937 = arith.addf %935, %936 {timing = #hls.t<124 -> 129, 5, 1>} : f32
        affine.store %937, %arg2[%arg6 * 64 + 116] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<129 -> 130, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %938 = affine.load %arg0[%arg5, %arg6 * 64 + 117] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<118 -> 120, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %939 = arith.mulf %938, %1 {timing = #hls.t<121 -> 125, 4, 1>} : f32
        %940 = affine.load %arg4[%arg6 * 64 + 117] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<123 -> 125, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %941 = arith.addf %939, %940 {timing = #hls.t<125 -> 130, 5, 1>} : f32
        affine.store %941, %arg4[%arg6 * 64 + 117] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<130 -> 131, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %942 = affine.load %arg0[%arg6 * 64 + 117, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<119 -> 121, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %943 = arith.mulf %942, %6 {timing = #hls.t<121 -> 125, 4, 1>} : f32
        %944 = affine.load %arg2[%arg6 * 64 + 117] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<123 -> 125, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %945 = arith.addf %943, %944 {timing = #hls.t<125 -> 130, 5, 1>} : f32
        affine.store %945, %arg2[%arg6 * 64 + 117] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<130 -> 131, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %946 = affine.load %arg0[%arg5, %arg6 * 64 + 118] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<118 -> 120, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %947 = arith.mulf %946, %1 {timing = #hls.t<122 -> 126, 4, 1>} : f32
        %948 = affine.load %arg4[%arg6 * 64 + 118] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<124 -> 126, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %949 = arith.addf %947, %948 {timing = #hls.t<126 -> 131, 5, 1>} : f32
        affine.store %949, %arg4[%arg6 * 64 + 118] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<131 -> 132, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %950 = affine.load %arg0[%arg6 * 64 + 118, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<119 -> 121, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %951 = arith.mulf %950, %6 {timing = #hls.t<122 -> 126, 4, 1>} : f32
        %952 = affine.load %arg2[%arg6 * 64 + 118] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<124 -> 126, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %953 = arith.addf %951, %952 {timing = #hls.t<126 -> 131, 5, 1>} : f32
        affine.store %953, %arg2[%arg6 * 64 + 118] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<131 -> 132, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %954 = affine.load %arg0[%arg5, %arg6 * 64 + 119] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<120 -> 122, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %955 = arith.mulf %954, %1 {timing = #hls.t<123 -> 127, 4, 1>} : f32
        %956 = affine.load %arg4[%arg6 * 64 + 119] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<125 -> 127, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %957 = arith.addf %955, %956 {timing = #hls.t<127 -> 132, 5, 1>} : f32
        affine.store %957, %arg4[%arg6 * 64 + 119] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<132 -> 133, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %958 = affine.load %arg0[%arg6 * 64 + 119, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %959 = arith.mulf %958, %6 {timing = #hls.t<123 -> 127, 4, 1>} : f32
        %960 = affine.load %arg2[%arg6 * 64 + 119] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<125 -> 127, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %961 = arith.addf %959, %960 {timing = #hls.t<127 -> 132, 5, 1>} : f32
        affine.store %961, %arg2[%arg6 * 64 + 119] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<132 -> 133, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %962 = affine.load %arg0[%arg5, %arg6 * 64 + 120] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<120 -> 122, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %963 = arith.mulf %962, %1 {timing = #hls.t<124 -> 128, 4, 1>} : f32
        %964 = affine.load %arg4[%arg6 * 64 + 120] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<126 -> 128, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %965 = arith.addf %963, %964 {timing = #hls.t<128 -> 133, 5, 1>} : f32
        affine.store %965, %arg4[%arg6 * 64 + 120] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<133 -> 134, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %966 = affine.load %arg0[%arg6 * 64 + 120, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %967 = arith.mulf %966, %6 {timing = #hls.t<124 -> 128, 4, 1>} : f32
        %968 = affine.load %arg2[%arg6 * 64 + 120] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<126 -> 128, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %969 = arith.addf %967, %968 {timing = #hls.t<128 -> 133, 5, 1>} : f32
        affine.store %969, %arg2[%arg6 * 64 + 120] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<133 -> 134, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %970 = affine.load %arg0[%arg5, %arg6 * 64 + 121] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<122 -> 124, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %971 = arith.mulf %970, %1 {timing = #hls.t<125 -> 129, 4, 1>} : f32
        %972 = affine.load %arg4[%arg6 * 64 + 121] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<127 -> 129, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %973 = arith.addf %971, %972 {timing = #hls.t<129 -> 134, 5, 1>} : f32
        affine.store %973, %arg4[%arg6 * 64 + 121] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<134 -> 135, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %974 = affine.load %arg0[%arg6 * 64 + 121, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<123 -> 125, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %975 = arith.mulf %974, %6 {timing = #hls.t<125 -> 129, 4, 1>} : f32
        %976 = affine.load %arg2[%arg6 * 64 + 121] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<127 -> 129, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %977 = arith.addf %975, %976 {timing = #hls.t<129 -> 134, 5, 1>} : f32
        affine.store %977, %arg2[%arg6 * 64 + 121] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<134 -> 135, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %978 = affine.load %arg0[%arg5, %arg6 * 64 + 122] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<122 -> 124, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %979 = arith.mulf %978, %1 {timing = #hls.t<126 -> 130, 4, 1>} : f32
        %980 = affine.load %arg4[%arg6 * 64 + 122] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<128 -> 130, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %981 = arith.addf %979, %980 {timing = #hls.t<130 -> 135, 5, 1>} : f32
        affine.store %981, %arg4[%arg6 * 64 + 122] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<135 -> 136, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %982 = affine.load %arg0[%arg6 * 64 + 122, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<123 -> 125, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %983 = arith.mulf %982, %6 {timing = #hls.t<126 -> 130, 4, 1>} : f32
        %984 = affine.load %arg2[%arg6 * 64 + 122] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<128 -> 130, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %985 = arith.addf %983, %984 {timing = #hls.t<130 -> 135, 5, 1>} : f32
        affine.store %985, %arg2[%arg6 * 64 + 122] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<135 -> 136, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %986 = affine.load %arg0[%arg5, %arg6 * 64 + 123] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<124 -> 126, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %987 = arith.mulf %986, %1 {timing = #hls.t<127 -> 131, 4, 1>} : f32
        %988 = affine.load %arg4[%arg6 * 64 + 123] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<129 -> 131, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %989 = arith.addf %987, %988 {timing = #hls.t<131 -> 136, 5, 1>} : f32
        affine.store %989, %arg4[%arg6 * 64 + 123] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<136 -> 137, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %990 = affine.load %arg0[%arg6 * 64 + 123, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<125 -> 127, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %991 = arith.mulf %990, %6 {timing = #hls.t<127 -> 131, 4, 1>} : f32
        %992 = affine.load %arg2[%arg6 * 64 + 123] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<129 -> 131, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %993 = arith.addf %991, %992 {timing = #hls.t<131 -> 136, 5, 1>} : f32
        affine.store %993, %arg2[%arg6 * 64 + 123] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<136 -> 137, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %994 = affine.load %arg0[%arg5, %arg6 * 64 + 124] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<124 -> 126, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %995 = arith.mulf %994, %1 {timing = #hls.t<128 -> 132, 4, 1>} : f32
        %996 = affine.load %arg4[%arg6 * 64 + 124] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<130 -> 132, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %997 = arith.addf %995, %996 {timing = #hls.t<132 -> 137, 5, 1>} : f32
        affine.store %997, %arg4[%arg6 * 64 + 124] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<137 -> 138, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %998 = affine.load %arg0[%arg6 * 64 + 124, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<125 -> 127, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %999 = arith.mulf %998, %6 {timing = #hls.t<128 -> 132, 4, 1>} : f32
        %1000 = affine.load %arg2[%arg6 * 64 + 124] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<130 -> 132, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1001 = arith.addf %999, %1000 {timing = #hls.t<132 -> 137, 5, 1>} : f32
        affine.store %1001, %arg2[%arg6 * 64 + 124] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<137 -> 138, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1002 = affine.load %arg0[%arg5, %arg6 * 64 + 125] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<126 -> 128, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1003 = arith.mulf %1002, %1 {timing = #hls.t<129 -> 133, 4, 1>} : f32
        %1004 = affine.load %arg4[%arg6 * 64 + 125] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<131 -> 133, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1005 = arith.addf %1003, %1004 {timing = #hls.t<133 -> 138, 5, 1>} : f32
        affine.store %1005, %arg4[%arg6 * 64 + 125] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<138 -> 139, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1006 = affine.load %arg0[%arg6 * 64 + 125, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<127 -> 129, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1007 = arith.mulf %1006, %6 {timing = #hls.t<129 -> 133, 4, 1>} : f32
        %1008 = affine.load %arg2[%arg6 * 64 + 125] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<131 -> 133, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1009 = arith.addf %1007, %1008 {timing = #hls.t<133 -> 138, 5, 1>} : f32
        affine.store %1009, %arg2[%arg6 * 64 + 125] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<138 -> 139, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1010 = affine.load %arg0[%arg5, %arg6 * 64 + 126] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<126 -> 128, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1011 = arith.mulf %1010, %1 {timing = #hls.t<130 -> 134, 4, 1>} : f32
        %1012 = affine.load %arg4[%arg6 * 64 + 126] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<132 -> 134, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1013 = arith.addf %1011, %1012 {timing = #hls.t<134 -> 139, 5, 1>} : f32
        affine.store %1013, %arg4[%arg6 * 64 + 126] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<139 -> 140, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1014 = affine.load %arg0[%arg6 * 64 + 126, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<127 -> 129, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1015 = arith.mulf %1014, %6 {timing = #hls.t<130 -> 134, 4, 1>} : f32
        %1016 = affine.load %arg2[%arg6 * 64 + 126] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<132 -> 134, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1017 = arith.addf %1015, %1016 {timing = #hls.t<134 -> 139, 5, 1>} : f32
        affine.store %1017, %arg2[%arg6 * 64 + 126] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<139 -> 140, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1018 = affine.load %arg0[%arg5, %arg6 * 64 + 127] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<128 -> 130, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1019 = arith.mulf %1018, %1 {timing = #hls.t<131 -> 135, 4, 1>} : f32
        %1020 = affine.load %arg4[%arg6 * 64 + 127] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<133 -> 135, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1021 = arith.addf %1019, %1020 {timing = #hls.t<135 -> 140, 5, 1>} : f32
        affine.store %1021, %arg4[%arg6 * 64 + 127] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<140 -> 141, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1022 = affine.load %arg0[%arg6 * 64 + 127, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<129 -> 131, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1023 = arith.mulf %1022, %6 {timing = #hls.t<131 -> 135, 4, 1>} : f32
        %1024 = affine.load %arg2[%arg6 * 64 + 127] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<133 -> 135, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1025 = arith.addf %1023, %1024 {timing = #hls.t<135 -> 140, 5, 1>} : f32
        affine.store %1025, %arg2[%arg6 * 64 + 127] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<140 -> 141, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1026 = affine.load %arg0[%arg5, %arg6 * 64 + 128] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<128 -> 130, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1027 = arith.mulf %1026, %1 {timing = #hls.t<132 -> 136, 4, 1>} : f32
        %1028 = affine.load %arg4[%arg6 * 64 + 128] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<134 -> 136, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1029 = arith.addf %1027, %1028 {timing = #hls.t<136 -> 141, 5, 1>} : f32
        affine.store %1029, %arg4[%arg6 * 64 + 128] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<141 -> 142, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1030 = affine.load %arg0[%arg6 * 64 + 128, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<129 -> 131, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1031 = arith.mulf %1030, %6 {timing = #hls.t<132 -> 136, 4, 1>} : f32
        %1032 = affine.load %arg2[%arg6 * 64 + 128] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<134 -> 136, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1033 = arith.addf %1031, %1032 {timing = #hls.t<136 -> 141, 5, 1>} : f32
        affine.store %1033, %arg2[%arg6 * 64 + 128] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<141 -> 142, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1034 = affine.load %arg0[%arg5, %arg6 * 64 + 129] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<130 -> 132, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1035 = arith.mulf %1034, %1 {timing = #hls.t<133 -> 137, 4, 1>} : f32
        %1036 = affine.load %arg4[%arg6 * 64 + 129] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1037 = arith.addf %1035, %1036 {timing = #hls.t<137 -> 142, 5, 1>} : f32
        affine.store %1037, %arg4[%arg6 * 64 + 129] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<142 -> 143, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1038 = affine.load %arg0[%arg6 * 64 + 129, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<131 -> 133, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1039 = arith.mulf %1038, %6 {timing = #hls.t<133 -> 137, 4, 1>} : f32
        %1040 = affine.load %arg2[%arg6 * 64 + 129] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1041 = arith.addf %1039, %1040 {timing = #hls.t<137 -> 142, 5, 1>} : f32
        affine.store %1041, %arg2[%arg6 * 64 + 129] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<142 -> 143, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1042 = affine.load %arg0[%arg5, %arg6 * 64 + 130] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<130 -> 132, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1043 = arith.mulf %1042, %1 {timing = #hls.t<134 -> 138, 4, 1>} : f32
        %1044 = affine.load %arg4[%arg6 * 64 + 130] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<136 -> 138, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1045 = arith.addf %1043, %1044 {timing = #hls.t<138 -> 143, 5, 1>} : f32
        affine.store %1045, %arg4[%arg6 * 64 + 130] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<143 -> 144, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1046 = affine.load %arg0[%arg6 * 64 + 130, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<131 -> 133, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1047 = arith.mulf %1046, %6 {timing = #hls.t<134 -> 138, 4, 1>} : f32
        %1048 = affine.load %arg2[%arg6 * 64 + 130] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<136 -> 138, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1049 = arith.addf %1047, %1048 {timing = #hls.t<138 -> 143, 5, 1>} : f32
        affine.store %1049, %arg2[%arg6 * 64 + 130] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<143 -> 144, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1050 = affine.load %arg0[%arg5, %arg6 * 64 + 131] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<132 -> 134, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1051 = arith.mulf %1050, %1 {timing = #hls.t<135 -> 139, 4, 1>} : f32
        %1052 = affine.load %arg4[%arg6 * 64 + 131] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1053 = arith.addf %1051, %1052 {timing = #hls.t<139 -> 144, 5, 1>} : f32
        affine.store %1053, %arg4[%arg6 * 64 + 131] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<144 -> 145, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1054 = affine.load %arg0[%arg6 * 64 + 131, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<133 -> 135, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1055 = arith.mulf %1054, %6 {timing = #hls.t<135 -> 139, 4, 1>} : f32
        %1056 = affine.load %arg2[%arg6 * 64 + 131] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1057 = arith.addf %1055, %1056 {timing = #hls.t<139 -> 144, 5, 1>} : f32
        affine.store %1057, %arg2[%arg6 * 64 + 131] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<144 -> 145, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1058 = affine.load %arg0[%arg5, %arg6 * 64 + 132] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<132 -> 134, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1059 = arith.mulf %1058, %1 {timing = #hls.t<136 -> 140, 4, 1>} : f32
        %1060 = affine.load %arg4[%arg6 * 64 + 132] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<138 -> 140, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1061 = arith.addf %1059, %1060 {timing = #hls.t<140 -> 145, 5, 1>} : f32
        affine.store %1061, %arg4[%arg6 * 64 + 132] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<145 -> 146, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1062 = affine.load %arg0[%arg6 * 64 + 132, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<133 -> 135, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1063 = arith.mulf %1062, %6 {timing = #hls.t<136 -> 140, 4, 1>} : f32
        %1064 = affine.load %arg2[%arg6 * 64 + 132] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<138 -> 140, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1065 = arith.addf %1063, %1064 {timing = #hls.t<140 -> 145, 5, 1>} : f32
        affine.store %1065, %arg2[%arg6 * 64 + 132] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<145 -> 146, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1066 = affine.load %arg0[%arg5, %arg6 * 64 + 133] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<134 -> 136, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1067 = arith.mulf %1066, %1 {timing = #hls.t<137 -> 141, 4, 1>} : f32
        %1068 = affine.load %arg4[%arg6 * 64 + 133] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<139 -> 141, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1069 = arith.addf %1067, %1068 {timing = #hls.t<141 -> 146, 5, 1>} : f32
        affine.store %1069, %arg4[%arg6 * 64 + 133] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<146 -> 147, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1070 = affine.load %arg0[%arg6 * 64 + 133, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1071 = arith.mulf %1070, %6 {timing = #hls.t<137 -> 141, 4, 1>} : f32
        %1072 = affine.load %arg2[%arg6 * 64 + 133] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<139 -> 141, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1073 = arith.addf %1071, %1072 {timing = #hls.t<141 -> 146, 5, 1>} : f32
        affine.store %1073, %arg2[%arg6 * 64 + 133] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<146 -> 147, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1074 = affine.load %arg0[%arg5, %arg6 * 64 + 134] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<134 -> 136, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1075 = arith.mulf %1074, %1 {timing = #hls.t<138 -> 142, 4, 1>} : f32
        %1076 = affine.load %arg4[%arg6 * 64 + 134] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<140 -> 142, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1077 = arith.addf %1075, %1076 {timing = #hls.t<142 -> 147, 5, 1>} : f32
        affine.store %1077, %arg4[%arg6 * 64 + 134] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<147 -> 148, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1078 = affine.load %arg0[%arg6 * 64 + 134, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1079 = arith.mulf %1078, %6 {timing = #hls.t<138 -> 142, 4, 1>} : f32
        %1080 = affine.load %arg2[%arg6 * 64 + 134] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<140 -> 142, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1081 = arith.addf %1079, %1080 {timing = #hls.t<142 -> 147, 5, 1>} : f32
        affine.store %1081, %arg2[%arg6 * 64 + 134] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<147 -> 148, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1082 = affine.load %arg0[%arg5, %arg6 * 64 + 135] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<136 -> 138, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1083 = arith.mulf %1082, %1 {timing = #hls.t<139 -> 143, 4, 1>} : f32
        %1084 = affine.load %arg4[%arg6 * 64 + 135] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<141 -> 143, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1085 = arith.addf %1083, %1084 {timing = #hls.t<143 -> 148, 5, 1>} : f32
        affine.store %1085, %arg4[%arg6 * 64 + 135] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<148 -> 149, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1086 = affine.load %arg0[%arg6 * 64 + 135, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1087 = arith.mulf %1086, %6 {timing = #hls.t<139 -> 143, 4, 1>} : f32
        %1088 = affine.load %arg2[%arg6 * 64 + 135] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<141 -> 143, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1089 = arith.addf %1087, %1088 {timing = #hls.t<143 -> 148, 5, 1>} : f32
        affine.store %1089, %arg2[%arg6 * 64 + 135] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<148 -> 149, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1090 = affine.load %arg0[%arg5, %arg6 * 64 + 136] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<136 -> 138, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1091 = arith.mulf %1090, %1 {timing = #hls.t<140 -> 144, 4, 1>} : f32
        %1092 = affine.load %arg4[%arg6 * 64 + 136] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<142 -> 144, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1093 = arith.addf %1091, %1092 {timing = #hls.t<144 -> 149, 5, 1>} : f32
        affine.store %1093, %arg4[%arg6 * 64 + 136] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<149 -> 150, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1094 = affine.load %arg0[%arg6 * 64 + 136, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1095 = arith.mulf %1094, %6 {timing = #hls.t<140 -> 144, 4, 1>} : f32
        %1096 = affine.load %arg2[%arg6 * 64 + 136] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<142 -> 144, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1097 = arith.addf %1095, %1096 {timing = #hls.t<144 -> 149, 5, 1>} : f32
        affine.store %1097, %arg2[%arg6 * 64 + 136] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<149 -> 150, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1098 = affine.load %arg0[%arg5, %arg6 * 64 + 137] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<138 -> 140, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1099 = arith.mulf %1098, %1 {timing = #hls.t<141 -> 145, 4, 1>} : f32
        %1100 = affine.load %arg4[%arg6 * 64 + 137] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<143 -> 145, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1101 = arith.addf %1099, %1100 {timing = #hls.t<145 -> 150, 5, 1>} : f32
        affine.store %1101, %arg4[%arg6 * 64 + 137] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<150 -> 151, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1102 = affine.load %arg0[%arg6 * 64 + 137, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<139 -> 141, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1103 = arith.mulf %1102, %6 {timing = #hls.t<141 -> 145, 4, 1>} : f32
        %1104 = affine.load %arg2[%arg6 * 64 + 137] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<143 -> 145, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1105 = arith.addf %1103, %1104 {timing = #hls.t<145 -> 150, 5, 1>} : f32
        affine.store %1105, %arg2[%arg6 * 64 + 137] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<150 -> 151, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1106 = affine.load %arg0[%arg5, %arg6 * 64 + 138] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<138 -> 140, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1107 = arith.mulf %1106, %1 {timing = #hls.t<142 -> 146, 4, 1>} : f32
        %1108 = affine.load %arg4[%arg6 * 64 + 138] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<144 -> 146, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1109 = arith.addf %1107, %1108 {timing = #hls.t<146 -> 151, 5, 1>} : f32
        affine.store %1109, %arg4[%arg6 * 64 + 138] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<151 -> 152, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1110 = affine.load %arg0[%arg6 * 64 + 138, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<139 -> 141, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1111 = arith.mulf %1110, %6 {timing = #hls.t<142 -> 146, 4, 1>} : f32
        %1112 = affine.load %arg2[%arg6 * 64 + 138] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<144 -> 146, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1113 = arith.addf %1111, %1112 {timing = #hls.t<146 -> 151, 5, 1>} : f32
        affine.store %1113, %arg2[%arg6 * 64 + 138] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<151 -> 152, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1114 = affine.load %arg0[%arg5, %arg6 * 64 + 139] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<140 -> 142, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1115 = arith.mulf %1114, %1 {timing = #hls.t<143 -> 147, 4, 1>} : f32
        %1116 = affine.load %arg4[%arg6 * 64 + 139] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<145 -> 147, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1117 = arith.addf %1115, %1116 {timing = #hls.t<147 -> 152, 5, 1>} : f32
        affine.store %1117, %arg4[%arg6 * 64 + 139] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<152 -> 153, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1118 = affine.load %arg0[%arg6 * 64 + 139, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<141 -> 143, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1119 = arith.mulf %1118, %6 {timing = #hls.t<143 -> 147, 4, 1>} : f32
        %1120 = affine.load %arg2[%arg6 * 64 + 139] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<145 -> 147, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1121 = arith.addf %1119, %1120 {timing = #hls.t<147 -> 152, 5, 1>} : f32
        affine.store %1121, %arg2[%arg6 * 64 + 139] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<152 -> 153, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1122 = affine.load %arg0[%arg5, %arg6 * 64 + 140] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<140 -> 142, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1123 = arith.mulf %1122, %1 {timing = #hls.t<144 -> 148, 4, 1>} : f32
        %1124 = affine.load %arg4[%arg6 * 64 + 140] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<146 -> 148, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1125 = arith.addf %1123, %1124 {timing = #hls.t<148 -> 153, 5, 1>} : f32
        affine.store %1125, %arg4[%arg6 * 64 + 140] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<153 -> 154, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1126 = affine.load %arg0[%arg6 * 64 + 140, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<141 -> 143, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1127 = arith.mulf %1126, %6 {timing = #hls.t<144 -> 148, 4, 1>} : f32
        %1128 = affine.load %arg2[%arg6 * 64 + 140] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<146 -> 148, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1129 = arith.addf %1127, %1128 {timing = #hls.t<148 -> 153, 5, 1>} : f32
        affine.store %1129, %arg2[%arg6 * 64 + 140] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<153 -> 154, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1130 = affine.load %arg0[%arg5, %arg6 * 64 + 141] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<142 -> 144, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1131 = arith.mulf %1130, %1 {timing = #hls.t<145 -> 149, 4, 1>} : f32
        %1132 = affine.load %arg4[%arg6 * 64 + 141] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<147 -> 149, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1133 = arith.addf %1131, %1132 {timing = #hls.t<149 -> 154, 5, 1>} : f32
        affine.store %1133, %arg4[%arg6 * 64 + 141] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<154 -> 155, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1134 = affine.load %arg0[%arg6 * 64 + 141, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<143 -> 145, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1135 = arith.mulf %1134, %6 {timing = #hls.t<145 -> 149, 4, 1>} : f32
        %1136 = affine.load %arg2[%arg6 * 64 + 141] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<147 -> 149, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1137 = arith.addf %1135, %1136 {timing = #hls.t<149 -> 154, 5, 1>} : f32
        affine.store %1137, %arg2[%arg6 * 64 + 141] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<154 -> 155, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1138 = affine.load %arg0[%arg5, %arg6 * 64 + 142] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<142 -> 144, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1139 = arith.mulf %1138, %1 {timing = #hls.t<146 -> 150, 4, 1>} : f32
        %1140 = affine.load %arg4[%arg6 * 64 + 142] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<148 -> 150, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1141 = arith.addf %1139, %1140 {timing = #hls.t<150 -> 155, 5, 1>} : f32
        affine.store %1141, %arg4[%arg6 * 64 + 142] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<155 -> 156, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1142 = affine.load %arg0[%arg6 * 64 + 142, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<143 -> 145, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1143 = arith.mulf %1142, %6 {timing = #hls.t<146 -> 150, 4, 1>} : f32
        %1144 = affine.load %arg2[%arg6 * 64 + 142] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<148 -> 150, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1145 = arith.addf %1143, %1144 {timing = #hls.t<150 -> 155, 5, 1>} : f32
        affine.store %1145, %arg2[%arg6 * 64 + 142] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<155 -> 156, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1146 = affine.load %arg0[%arg5, %arg6 * 64 + 143] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<144 -> 146, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1147 = arith.mulf %1146, %1 {timing = #hls.t<147 -> 151, 4, 1>} : f32
        %1148 = affine.load %arg4[%arg6 * 64 + 143] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<149 -> 151, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1149 = arith.addf %1147, %1148 {timing = #hls.t<151 -> 156, 5, 1>} : f32
        affine.store %1149, %arg4[%arg6 * 64 + 143] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<156 -> 157, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1150 = affine.load %arg0[%arg6 * 64 + 143, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<145 -> 147, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1151 = arith.mulf %1150, %6 {timing = #hls.t<147 -> 151, 4, 1>} : f32
        %1152 = affine.load %arg2[%arg6 * 64 + 143] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<149 -> 151, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1153 = arith.addf %1151, %1152 {timing = #hls.t<151 -> 156, 5, 1>} : f32
        affine.store %1153, %arg2[%arg6 * 64 + 143] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<156 -> 157, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1154 = affine.load %arg0[%arg5, %arg6 * 64 + 144] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<144 -> 146, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1155 = arith.mulf %1154, %1 {timing = #hls.t<148 -> 152, 4, 1>} : f32
        %1156 = affine.load %arg4[%arg6 * 64 + 144] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<150 -> 152, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1157 = arith.addf %1155, %1156 {timing = #hls.t<152 -> 157, 5, 1>} : f32
        affine.store %1157, %arg4[%arg6 * 64 + 144] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<157 -> 158, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1158 = affine.load %arg0[%arg6 * 64 + 144, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<145 -> 147, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1159 = arith.mulf %1158, %6 {timing = #hls.t<148 -> 152, 4, 1>} : f32
        %1160 = affine.load %arg2[%arg6 * 64 + 144] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<150 -> 152, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1161 = arith.addf %1159, %1160 {timing = #hls.t<152 -> 157, 5, 1>} : f32
        affine.store %1161, %arg2[%arg6 * 64 + 144] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<157 -> 158, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1162 = affine.load %arg0[%arg5, %arg6 * 64 + 145] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<146 -> 148, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1163 = arith.mulf %1162, %1 {timing = #hls.t<149 -> 153, 4, 1>} : f32
        %1164 = affine.load %arg4[%arg6 * 64 + 145] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<151 -> 153, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1165 = arith.addf %1163, %1164 {timing = #hls.t<153 -> 158, 5, 1>} : f32
        affine.store %1165, %arg4[%arg6 * 64 + 145] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<158 -> 159, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1166 = affine.load %arg0[%arg6 * 64 + 145, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<147 -> 149, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1167 = arith.mulf %1166, %6 {timing = #hls.t<149 -> 153, 4, 1>} : f32
        %1168 = affine.load %arg2[%arg6 * 64 + 145] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<151 -> 153, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1169 = arith.addf %1167, %1168 {timing = #hls.t<153 -> 158, 5, 1>} : f32
        affine.store %1169, %arg2[%arg6 * 64 + 145] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<158 -> 159, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1170 = affine.load %arg0[%arg5, %arg6 * 64 + 146] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<146 -> 148, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1171 = arith.mulf %1170, %1 {timing = #hls.t<150 -> 154, 4, 1>} : f32
        %1172 = affine.load %arg4[%arg6 * 64 + 146] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<152 -> 154, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1173 = arith.addf %1171, %1172 {timing = #hls.t<154 -> 159, 5, 1>} : f32
        affine.store %1173, %arg4[%arg6 * 64 + 146] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<159 -> 160, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1174 = affine.load %arg0[%arg6 * 64 + 146, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<147 -> 149, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1175 = arith.mulf %1174, %6 {timing = #hls.t<150 -> 154, 4, 1>} : f32
        %1176 = affine.load %arg2[%arg6 * 64 + 146] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<152 -> 154, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1177 = arith.addf %1175, %1176 {timing = #hls.t<154 -> 159, 5, 1>} : f32
        affine.store %1177, %arg2[%arg6 * 64 + 146] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<159 -> 160, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1178 = affine.load %arg0[%arg5, %arg6 * 64 + 147] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<148 -> 150, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1179 = arith.mulf %1178, %1 {timing = #hls.t<151 -> 155, 4, 1>} : f32
        %1180 = affine.load %arg4[%arg6 * 64 + 147] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<153 -> 155, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1181 = arith.addf %1179, %1180 {timing = #hls.t<155 -> 160, 5, 1>} : f32
        affine.store %1181, %arg4[%arg6 * 64 + 147] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<160 -> 161, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1182 = affine.load %arg0[%arg6 * 64 + 147, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<149 -> 151, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1183 = arith.mulf %1182, %6 {timing = #hls.t<151 -> 155, 4, 1>} : f32
        %1184 = affine.load %arg2[%arg6 * 64 + 147] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<153 -> 155, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1185 = arith.addf %1183, %1184 {timing = #hls.t<155 -> 160, 5, 1>} : f32
        affine.store %1185, %arg2[%arg6 * 64 + 147] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<160 -> 161, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1186 = affine.load %arg0[%arg5, %arg6 * 64 + 148] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<148 -> 150, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1187 = arith.mulf %1186, %1 {timing = #hls.t<152 -> 156, 4, 1>} : f32
        %1188 = affine.load %arg4[%arg6 * 64 + 148] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<154 -> 156, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1189 = arith.addf %1187, %1188 {timing = #hls.t<156 -> 161, 5, 1>} : f32
        affine.store %1189, %arg4[%arg6 * 64 + 148] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<161 -> 162, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1190 = affine.load %arg0[%arg6 * 64 + 148, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<149 -> 151, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1191 = arith.mulf %1190, %6 {timing = #hls.t<152 -> 156, 4, 1>} : f32
        %1192 = affine.load %arg2[%arg6 * 64 + 148] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<154 -> 156, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1193 = arith.addf %1191, %1192 {timing = #hls.t<156 -> 161, 5, 1>} : f32
        affine.store %1193, %arg2[%arg6 * 64 + 148] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<161 -> 162, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1194 = affine.load %arg0[%arg5, %arg6 * 64 + 149] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<150 -> 152, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1195 = arith.mulf %1194, %1 {timing = #hls.t<153 -> 157, 4, 1>} : f32
        %1196 = affine.load %arg4[%arg6 * 64 + 149] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<155 -> 157, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1197 = arith.addf %1195, %1196 {timing = #hls.t<157 -> 162, 5, 1>} : f32
        affine.store %1197, %arg4[%arg6 * 64 + 149] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<162 -> 163, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1198 = affine.load %arg0[%arg6 * 64 + 149, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<151 -> 153, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1199 = arith.mulf %1198, %6 {timing = #hls.t<153 -> 157, 4, 1>} : f32
        %1200 = affine.load %arg2[%arg6 * 64 + 149] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<155 -> 157, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1201 = arith.addf %1199, %1200 {timing = #hls.t<157 -> 162, 5, 1>} : f32
        affine.store %1201, %arg2[%arg6 * 64 + 149] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<162 -> 163, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1202 = affine.load %arg0[%arg5, %arg6 * 64 + 150] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<150 -> 152, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1203 = arith.mulf %1202, %1 {timing = #hls.t<154 -> 158, 4, 1>} : f32
        %1204 = affine.load %arg4[%arg6 * 64 + 150] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<156 -> 158, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1205 = arith.addf %1203, %1204 {timing = #hls.t<158 -> 163, 5, 1>} : f32
        affine.store %1205, %arg4[%arg6 * 64 + 150] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<163 -> 164, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1206 = affine.load %arg0[%arg6 * 64 + 150, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<151 -> 153, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1207 = arith.mulf %1206, %6 {timing = #hls.t<154 -> 158, 4, 1>} : f32
        %1208 = affine.load %arg2[%arg6 * 64 + 150] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<156 -> 158, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1209 = arith.addf %1207, %1208 {timing = #hls.t<158 -> 163, 5, 1>} : f32
        affine.store %1209, %arg2[%arg6 * 64 + 150] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<163 -> 164, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1210 = affine.load %arg0[%arg5, %arg6 * 64 + 151] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<152 -> 154, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1211 = arith.mulf %1210, %1 {timing = #hls.t<155 -> 159, 4, 1>} : f32
        %1212 = affine.load %arg4[%arg6 * 64 + 151] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<157 -> 159, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1213 = arith.addf %1211, %1212 {timing = #hls.t<159 -> 164, 5, 1>} : f32
        affine.store %1213, %arg4[%arg6 * 64 + 151] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<164 -> 165, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1214 = affine.load %arg0[%arg6 * 64 + 151, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<153 -> 155, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1215 = arith.mulf %1214, %6 {timing = #hls.t<155 -> 159, 4, 1>} : f32
        %1216 = affine.load %arg2[%arg6 * 64 + 151] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<157 -> 159, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1217 = arith.addf %1215, %1216 {timing = #hls.t<159 -> 164, 5, 1>} : f32
        affine.store %1217, %arg2[%arg6 * 64 + 151] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<164 -> 165, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1218 = affine.load %arg0[%arg5, %arg6 * 64 + 152] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<152 -> 154, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1219 = arith.mulf %1218, %1 {timing = #hls.t<156 -> 160, 4, 1>} : f32
        %1220 = affine.load %arg4[%arg6 * 64 + 152] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<158 -> 160, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1221 = arith.addf %1219, %1220 {timing = #hls.t<160 -> 165, 5, 1>} : f32
        affine.store %1221, %arg4[%arg6 * 64 + 152] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<165 -> 166, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1222 = affine.load %arg0[%arg6 * 64 + 152, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<153 -> 155, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1223 = arith.mulf %1222, %6 {timing = #hls.t<156 -> 160, 4, 1>} : f32
        %1224 = affine.load %arg2[%arg6 * 64 + 152] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<158 -> 160, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1225 = arith.addf %1223, %1224 {timing = #hls.t<160 -> 165, 5, 1>} : f32
        affine.store %1225, %arg2[%arg6 * 64 + 152] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<165 -> 166, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1226 = affine.load %arg0[%arg5, %arg6 * 64 + 153] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<154 -> 156, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1227 = arith.mulf %1226, %1 {timing = #hls.t<157 -> 161, 4, 1>} : f32
        %1228 = affine.load %arg4[%arg6 * 64 + 153] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<159 -> 161, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1229 = arith.addf %1227, %1228 {timing = #hls.t<161 -> 166, 5, 1>} : f32
        affine.store %1229, %arg4[%arg6 * 64 + 153] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<166 -> 167, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1230 = affine.load %arg0[%arg6 * 64 + 153, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<155 -> 157, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1231 = arith.mulf %1230, %6 {timing = #hls.t<157 -> 161, 4, 1>} : f32
        %1232 = affine.load %arg2[%arg6 * 64 + 153] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<159 -> 161, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1233 = arith.addf %1231, %1232 {timing = #hls.t<161 -> 166, 5, 1>} : f32
        affine.store %1233, %arg2[%arg6 * 64 + 153] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<166 -> 167, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1234 = affine.load %arg0[%arg5, %arg6 * 64 + 154] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<154 -> 156, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1235 = arith.mulf %1234, %1 {timing = #hls.t<158 -> 162, 4, 1>} : f32
        %1236 = affine.load %arg4[%arg6 * 64 + 154] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<160 -> 162, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1237 = arith.addf %1235, %1236 {timing = #hls.t<162 -> 167, 5, 1>} : f32
        affine.store %1237, %arg4[%arg6 * 64 + 154] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<167 -> 168, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1238 = affine.load %arg0[%arg6 * 64 + 154, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<155 -> 157, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1239 = arith.mulf %1238, %6 {timing = #hls.t<158 -> 162, 4, 1>} : f32
        %1240 = affine.load %arg2[%arg6 * 64 + 154] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<160 -> 162, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1241 = arith.addf %1239, %1240 {timing = #hls.t<162 -> 167, 5, 1>} : f32
        affine.store %1241, %arg2[%arg6 * 64 + 154] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<167 -> 168, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1242 = affine.load %arg0[%arg5, %arg6 * 64 + 155] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<156 -> 158, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1243 = arith.mulf %1242, %1 {timing = #hls.t<159 -> 163, 4, 1>} : f32
        %1244 = affine.load %arg4[%arg6 * 64 + 155] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<161 -> 163, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1245 = arith.addf %1243, %1244 {timing = #hls.t<163 -> 168, 5, 1>} : f32
        affine.store %1245, %arg4[%arg6 * 64 + 155] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<168 -> 169, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1246 = affine.load %arg0[%arg6 * 64 + 155, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<157 -> 159, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1247 = arith.mulf %1246, %6 {timing = #hls.t<159 -> 163, 4, 1>} : f32
        %1248 = affine.load %arg2[%arg6 * 64 + 155] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<161 -> 163, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1249 = arith.addf %1247, %1248 {timing = #hls.t<163 -> 168, 5, 1>} : f32
        affine.store %1249, %arg2[%arg6 * 64 + 155] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<168 -> 169, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1250 = affine.load %arg0[%arg5, %arg6 * 64 + 156] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<156 -> 158, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1251 = arith.mulf %1250, %1 {timing = #hls.t<160 -> 164, 4, 1>} : f32
        %1252 = affine.load %arg4[%arg6 * 64 + 156] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<162 -> 164, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1253 = arith.addf %1251, %1252 {timing = #hls.t<164 -> 169, 5, 1>} : f32
        affine.store %1253, %arg4[%arg6 * 64 + 156] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<169 -> 170, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1254 = affine.load %arg0[%arg6 * 64 + 156, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<157 -> 159, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1255 = arith.mulf %1254, %6 {timing = #hls.t<160 -> 164, 4, 1>} : f32
        %1256 = affine.load %arg2[%arg6 * 64 + 156] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<162 -> 164, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1257 = arith.addf %1255, %1256 {timing = #hls.t<164 -> 169, 5, 1>} : f32
        affine.store %1257, %arg2[%arg6 * 64 + 156] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<169 -> 170, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1258 = affine.load %arg0[%arg5, %arg6 * 64 + 157] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<158 -> 160, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1259 = arith.mulf %1258, %1 {timing = #hls.t<161 -> 165, 4, 1>} : f32
        %1260 = affine.load %arg4[%arg6 * 64 + 157] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<163 -> 165, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1261 = arith.addf %1259, %1260 {timing = #hls.t<165 -> 170, 5, 1>} : f32
        affine.store %1261, %arg4[%arg6 * 64 + 157] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<170 -> 171, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1262 = affine.load %arg0[%arg6 * 64 + 157, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<159 -> 161, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1263 = arith.mulf %1262, %6 {timing = #hls.t<161 -> 165, 4, 1>} : f32
        %1264 = affine.load %arg2[%arg6 * 64 + 157] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<163 -> 165, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1265 = arith.addf %1263, %1264 {timing = #hls.t<165 -> 170, 5, 1>} : f32
        affine.store %1265, %arg2[%arg6 * 64 + 157] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<170 -> 171, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1266 = affine.load %arg0[%arg5, %arg6 * 64 + 158] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<158 -> 160, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1267 = arith.mulf %1266, %1 {timing = #hls.t<162 -> 166, 4, 1>} : f32
        %1268 = affine.load %arg4[%arg6 * 64 + 158] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<164 -> 166, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1269 = arith.addf %1267, %1268 {timing = #hls.t<166 -> 171, 5, 1>} : f32
        affine.store %1269, %arg4[%arg6 * 64 + 158] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<171 -> 172, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1270 = affine.load %arg0[%arg6 * 64 + 158, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<159 -> 161, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1271 = arith.mulf %1270, %6 {timing = #hls.t<162 -> 166, 4, 1>} : f32
        %1272 = affine.load %arg2[%arg6 * 64 + 158] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<164 -> 166, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1273 = arith.addf %1271, %1272 {timing = #hls.t<166 -> 171, 5, 1>} : f32
        affine.store %1273, %arg2[%arg6 * 64 + 158] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<171 -> 172, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1274 = affine.load %arg0[%arg5, %arg6 * 64 + 159] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<160 -> 162, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1275 = arith.mulf %1274, %1 {timing = #hls.t<163 -> 167, 4, 1>} : f32
        %1276 = affine.load %arg4[%arg6 * 64 + 159] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<165 -> 167, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1277 = arith.addf %1275, %1276 {timing = #hls.t<167 -> 172, 5, 1>} : f32
        affine.store %1277, %arg4[%arg6 * 64 + 159] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<172 -> 173, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1278 = affine.load %arg0[%arg6 * 64 + 159, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<161 -> 163, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1279 = arith.mulf %1278, %6 {timing = #hls.t<163 -> 167, 4, 1>} : f32
        %1280 = affine.load %arg2[%arg6 * 64 + 159] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<165 -> 167, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1281 = arith.addf %1279, %1280 {timing = #hls.t<167 -> 172, 5, 1>} : f32
        affine.store %1281, %arg2[%arg6 * 64 + 159] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<172 -> 173, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1282 = affine.load %arg0[%arg5, %arg6 * 64 + 160] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<160 -> 162, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1283 = arith.mulf %1282, %1 {timing = #hls.t<164 -> 168, 4, 1>} : f32
        %1284 = affine.load %arg4[%arg6 * 64 + 160] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<166 -> 168, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1285 = arith.addf %1283, %1284 {timing = #hls.t<168 -> 173, 5, 1>} : f32
        affine.store %1285, %arg4[%arg6 * 64 + 160] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<173 -> 174, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1286 = affine.load %arg0[%arg6 * 64 + 160, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<161 -> 163, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1287 = arith.mulf %1286, %6 {timing = #hls.t<164 -> 168, 4, 1>} : f32
        %1288 = affine.load %arg2[%arg6 * 64 + 160] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<166 -> 168, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1289 = arith.addf %1287, %1288 {timing = #hls.t<168 -> 173, 5, 1>} : f32
        affine.store %1289, %arg2[%arg6 * 64 + 160] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<173 -> 174, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1290 = affine.load %arg0[%arg5, %arg6 * 64 + 161] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<162 -> 164, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1291 = arith.mulf %1290, %1 {timing = #hls.t<165 -> 169, 4, 1>} : f32
        %1292 = affine.load %arg4[%arg6 * 64 + 161] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<167 -> 169, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1293 = arith.addf %1291, %1292 {timing = #hls.t<169 -> 174, 5, 1>} : f32
        affine.store %1293, %arg4[%arg6 * 64 + 161] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<174 -> 175, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1294 = affine.load %arg0[%arg6 * 64 + 161, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<163 -> 165, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1295 = arith.mulf %1294, %6 {timing = #hls.t<165 -> 169, 4, 1>} : f32
        %1296 = affine.load %arg2[%arg6 * 64 + 161] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<167 -> 169, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1297 = arith.addf %1295, %1296 {timing = #hls.t<169 -> 174, 5, 1>} : f32
        affine.store %1297, %arg2[%arg6 * 64 + 161] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<174 -> 175, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1298 = affine.load %arg0[%arg5, %arg6 * 64 + 162] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<162 -> 164, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1299 = arith.mulf %1298, %1 {timing = #hls.t<166 -> 170, 4, 1>} : f32
        %1300 = affine.load %arg4[%arg6 * 64 + 162] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<168 -> 170, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1301 = arith.addf %1299, %1300 {timing = #hls.t<170 -> 175, 5, 1>} : f32
        affine.store %1301, %arg4[%arg6 * 64 + 162] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<175 -> 176, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1302 = affine.load %arg0[%arg6 * 64 + 162, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<163 -> 165, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1303 = arith.mulf %1302, %6 {timing = #hls.t<166 -> 170, 4, 1>} : f32
        %1304 = affine.load %arg2[%arg6 * 64 + 162] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<168 -> 170, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1305 = arith.addf %1303, %1304 {timing = #hls.t<170 -> 175, 5, 1>} : f32
        affine.store %1305, %arg2[%arg6 * 64 + 162] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<175 -> 176, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1306 = affine.load %arg0[%arg5, %arg6 * 64 + 163] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<164 -> 166, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1307 = arith.mulf %1306, %1 {timing = #hls.t<167 -> 171, 4, 1>} : f32
        %1308 = affine.load %arg4[%arg6 * 64 + 163] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<169 -> 171, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1309 = arith.addf %1307, %1308 {timing = #hls.t<171 -> 176, 5, 1>} : f32
        affine.store %1309, %arg4[%arg6 * 64 + 163] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<176 -> 177, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1310 = affine.load %arg0[%arg6 * 64 + 163, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<165 -> 167, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1311 = arith.mulf %1310, %6 {timing = #hls.t<167 -> 171, 4, 1>} : f32
        %1312 = affine.load %arg2[%arg6 * 64 + 163] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<169 -> 171, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1313 = arith.addf %1311, %1312 {timing = #hls.t<171 -> 176, 5, 1>} : f32
        affine.store %1313, %arg2[%arg6 * 64 + 163] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<176 -> 177, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1314 = affine.load %arg0[%arg5, %arg6 * 64 + 164] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<164 -> 166, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1315 = arith.mulf %1314, %1 {timing = #hls.t<168 -> 172, 4, 1>} : f32
        %1316 = affine.load %arg4[%arg6 * 64 + 164] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<170 -> 172, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1317 = arith.addf %1315, %1316 {timing = #hls.t<172 -> 177, 5, 1>} : f32
        affine.store %1317, %arg4[%arg6 * 64 + 164] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<177 -> 178, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1318 = affine.load %arg0[%arg6 * 64 + 164, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<165 -> 167, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1319 = arith.mulf %1318, %6 {timing = #hls.t<168 -> 172, 4, 1>} : f32
        %1320 = affine.load %arg2[%arg6 * 64 + 164] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<170 -> 172, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1321 = arith.addf %1319, %1320 {timing = #hls.t<172 -> 177, 5, 1>} : f32
        affine.store %1321, %arg2[%arg6 * 64 + 164] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<177 -> 178, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1322 = affine.load %arg0[%arg5, %arg6 * 64 + 165] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<166 -> 168, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1323 = arith.mulf %1322, %1 {timing = #hls.t<169 -> 173, 4, 1>} : f32
        %1324 = affine.load %arg4[%arg6 * 64 + 165] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<171 -> 173, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1325 = arith.addf %1323, %1324 {timing = #hls.t<173 -> 178, 5, 1>} : f32
        affine.store %1325, %arg4[%arg6 * 64 + 165] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<178 -> 179, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1326 = affine.load %arg0[%arg6 * 64 + 165, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<167 -> 169, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1327 = arith.mulf %1326, %6 {timing = #hls.t<169 -> 173, 4, 1>} : f32
        %1328 = affine.load %arg2[%arg6 * 64 + 165] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<171 -> 173, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1329 = arith.addf %1327, %1328 {timing = #hls.t<173 -> 178, 5, 1>} : f32
        affine.store %1329, %arg2[%arg6 * 64 + 165] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<178 -> 179, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1330 = affine.load %arg0[%arg5, %arg6 * 64 + 166] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<166 -> 168, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1331 = arith.mulf %1330, %1 {timing = #hls.t<170 -> 174, 4, 1>} : f32
        %1332 = affine.load %arg4[%arg6 * 64 + 166] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<172 -> 174, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1333 = arith.addf %1331, %1332 {timing = #hls.t<174 -> 179, 5, 1>} : f32
        affine.store %1333, %arg4[%arg6 * 64 + 166] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<179 -> 180, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1334 = affine.load %arg0[%arg6 * 64 + 166, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<167 -> 169, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1335 = arith.mulf %1334, %6 {timing = #hls.t<170 -> 174, 4, 1>} : f32
        %1336 = affine.load %arg2[%arg6 * 64 + 166] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<172 -> 174, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1337 = arith.addf %1335, %1336 {timing = #hls.t<174 -> 179, 5, 1>} : f32
        affine.store %1337, %arg2[%arg6 * 64 + 166] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<179 -> 180, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1338 = affine.load %arg0[%arg5, %arg6 * 64 + 167] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<168 -> 170, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1339 = arith.mulf %1338, %1 {timing = #hls.t<171 -> 175, 4, 1>} : f32
        %1340 = affine.load %arg4[%arg6 * 64 + 167] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<173 -> 175, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1341 = arith.addf %1339, %1340 {timing = #hls.t<175 -> 180, 5, 1>} : f32
        affine.store %1341, %arg4[%arg6 * 64 + 167] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<180 -> 181, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1342 = affine.load %arg0[%arg6 * 64 + 167, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<169 -> 171, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1343 = arith.mulf %1342, %6 {timing = #hls.t<171 -> 175, 4, 1>} : f32
        %1344 = affine.load %arg2[%arg6 * 64 + 167] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<173 -> 175, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1345 = arith.addf %1343, %1344 {timing = #hls.t<175 -> 180, 5, 1>} : f32
        affine.store %1345, %arg2[%arg6 * 64 + 167] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<180 -> 181, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1346 = affine.load %arg0[%arg5, %arg6 * 64 + 168] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<168 -> 170, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1347 = arith.mulf %1346, %1 {timing = #hls.t<172 -> 176, 4, 1>} : f32
        %1348 = affine.load %arg4[%arg6 * 64 + 168] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<174 -> 176, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1349 = arith.addf %1347, %1348 {timing = #hls.t<176 -> 181, 5, 1>} : f32
        affine.store %1349, %arg4[%arg6 * 64 + 168] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<181 -> 182, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1350 = affine.load %arg0[%arg6 * 64 + 168, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<169 -> 171, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1351 = arith.mulf %1350, %6 {timing = #hls.t<172 -> 176, 4, 1>} : f32
        %1352 = affine.load %arg2[%arg6 * 64 + 168] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<174 -> 176, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1353 = arith.addf %1351, %1352 {timing = #hls.t<176 -> 181, 5, 1>} : f32
        affine.store %1353, %arg2[%arg6 * 64 + 168] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<181 -> 182, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1354 = affine.load %arg0[%arg5, %arg6 * 64 + 169] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<170 -> 172, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1355 = arith.mulf %1354, %1 {timing = #hls.t<173 -> 177, 4, 1>} : f32
        %1356 = affine.load %arg4[%arg6 * 64 + 169] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<175 -> 177, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1357 = arith.addf %1355, %1356 {timing = #hls.t<177 -> 182, 5, 1>} : f32
        affine.store %1357, %arg4[%arg6 * 64 + 169] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<182 -> 183, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1358 = affine.load %arg0[%arg6 * 64 + 169, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<171 -> 173, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1359 = arith.mulf %1358, %6 {timing = #hls.t<173 -> 177, 4, 1>} : f32
        %1360 = affine.load %arg2[%arg6 * 64 + 169] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<175 -> 177, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1361 = arith.addf %1359, %1360 {timing = #hls.t<177 -> 182, 5, 1>} : f32
        affine.store %1361, %arg2[%arg6 * 64 + 169] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<182 -> 183, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1362 = affine.load %arg0[%arg5, %arg6 * 64 + 170] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<170 -> 172, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1363 = arith.mulf %1362, %1 {timing = #hls.t<174 -> 178, 4, 1>} : f32
        %1364 = affine.load %arg4[%arg6 * 64 + 170] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<176 -> 178, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1365 = arith.addf %1363, %1364 {timing = #hls.t<178 -> 183, 5, 1>} : f32
        affine.store %1365, %arg4[%arg6 * 64 + 170] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<183 -> 184, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1366 = affine.load %arg0[%arg6 * 64 + 170, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<171 -> 173, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1367 = arith.mulf %1366, %6 {timing = #hls.t<174 -> 178, 4, 1>} : f32
        %1368 = affine.load %arg2[%arg6 * 64 + 170] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<176 -> 178, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1369 = arith.addf %1367, %1368 {timing = #hls.t<178 -> 183, 5, 1>} : f32
        affine.store %1369, %arg2[%arg6 * 64 + 170] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<183 -> 184, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1370 = affine.load %arg0[%arg5, %arg6 * 64 + 171] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<172 -> 174, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1371 = arith.mulf %1370, %1 {timing = #hls.t<175 -> 179, 4, 1>} : f32
        %1372 = affine.load %arg4[%arg6 * 64 + 171] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<177 -> 179, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1373 = arith.addf %1371, %1372 {timing = #hls.t<179 -> 184, 5, 1>} : f32
        affine.store %1373, %arg4[%arg6 * 64 + 171] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<184 -> 185, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1374 = affine.load %arg0[%arg6 * 64 + 171, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<173 -> 175, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1375 = arith.mulf %1374, %6 {timing = #hls.t<175 -> 179, 4, 1>} : f32
        %1376 = affine.load %arg2[%arg6 * 64 + 171] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<177 -> 179, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1377 = arith.addf %1375, %1376 {timing = #hls.t<179 -> 184, 5, 1>} : f32
        affine.store %1377, %arg2[%arg6 * 64 + 171] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<184 -> 185, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1378 = affine.load %arg0[%arg5, %arg6 * 64 + 172] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<172 -> 174, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1379 = arith.mulf %1378, %1 {timing = #hls.t<176 -> 180, 4, 1>} : f32
        %1380 = affine.load %arg4[%arg6 * 64 + 172] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<178 -> 180, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1381 = arith.addf %1379, %1380 {timing = #hls.t<180 -> 185, 5, 1>} : f32
        affine.store %1381, %arg4[%arg6 * 64 + 172] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<185 -> 186, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1382 = affine.load %arg0[%arg6 * 64 + 172, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<173 -> 175, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1383 = arith.mulf %1382, %6 {timing = #hls.t<176 -> 180, 4, 1>} : f32
        %1384 = affine.load %arg2[%arg6 * 64 + 172] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<178 -> 180, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1385 = arith.addf %1383, %1384 {timing = #hls.t<180 -> 185, 5, 1>} : f32
        affine.store %1385, %arg2[%arg6 * 64 + 172] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<185 -> 186, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1386 = affine.load %arg0[%arg5, %arg6 * 64 + 173] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<174 -> 176, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1387 = arith.mulf %1386, %1 {timing = #hls.t<177 -> 181, 4, 1>} : f32
        %1388 = affine.load %arg4[%arg6 * 64 + 173] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<179 -> 181, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1389 = arith.addf %1387, %1388 {timing = #hls.t<181 -> 186, 5, 1>} : f32
        affine.store %1389, %arg4[%arg6 * 64 + 173] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<186 -> 187, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1390 = affine.load %arg0[%arg6 * 64 + 173, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<175 -> 177, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1391 = arith.mulf %1390, %6 {timing = #hls.t<177 -> 181, 4, 1>} : f32
        %1392 = affine.load %arg2[%arg6 * 64 + 173] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<179 -> 181, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1393 = arith.addf %1391, %1392 {timing = #hls.t<181 -> 186, 5, 1>} : f32
        affine.store %1393, %arg2[%arg6 * 64 + 173] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<186 -> 187, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1394 = affine.load %arg0[%arg5, %arg6 * 64 + 174] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<174 -> 176, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1395 = arith.mulf %1394, %1 {timing = #hls.t<178 -> 182, 4, 1>} : f32
        %1396 = affine.load %arg4[%arg6 * 64 + 174] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<180 -> 182, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1397 = arith.addf %1395, %1396 {timing = #hls.t<182 -> 187, 5, 1>} : f32
        affine.store %1397, %arg4[%arg6 * 64 + 174] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<187 -> 188, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1398 = affine.load %arg0[%arg6 * 64 + 174, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<175 -> 177, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1399 = arith.mulf %1398, %6 {timing = #hls.t<178 -> 182, 4, 1>} : f32
        %1400 = affine.load %arg2[%arg6 * 64 + 174] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<180 -> 182, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1401 = arith.addf %1399, %1400 {timing = #hls.t<182 -> 187, 5, 1>} : f32
        affine.store %1401, %arg2[%arg6 * 64 + 174] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<187 -> 188, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1402 = affine.load %arg0[%arg5, %arg6 * 64 + 175] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<176 -> 178, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1403 = arith.mulf %1402, %1 {timing = #hls.t<179 -> 183, 4, 1>} : f32
        %1404 = affine.load %arg4[%arg6 * 64 + 175] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<181 -> 183, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1405 = arith.addf %1403, %1404 {timing = #hls.t<183 -> 188, 5, 1>} : f32
        affine.store %1405, %arg4[%arg6 * 64 + 175] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<188 -> 189, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1406 = affine.load %arg0[%arg6 * 64 + 175, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<177 -> 179, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1407 = arith.mulf %1406, %6 {timing = #hls.t<179 -> 183, 4, 1>} : f32
        %1408 = affine.load %arg2[%arg6 * 64 + 175] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<181 -> 183, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1409 = arith.addf %1407, %1408 {timing = #hls.t<183 -> 188, 5, 1>} : f32
        affine.store %1409, %arg2[%arg6 * 64 + 175] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<188 -> 189, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1410 = affine.load %arg0[%arg5, %arg6 * 64 + 176] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<176 -> 178, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1411 = arith.mulf %1410, %1 {timing = #hls.t<180 -> 184, 4, 1>} : f32
        %1412 = affine.load %arg4[%arg6 * 64 + 176] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<182 -> 184, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1413 = arith.addf %1411, %1412 {timing = #hls.t<184 -> 189, 5, 1>} : f32
        affine.store %1413, %arg4[%arg6 * 64 + 176] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<189 -> 190, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1414 = affine.load %arg0[%arg6 * 64 + 176, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<177 -> 179, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1415 = arith.mulf %1414, %6 {timing = #hls.t<180 -> 184, 4, 1>} : f32
        %1416 = affine.load %arg2[%arg6 * 64 + 176] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<182 -> 184, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1417 = arith.addf %1415, %1416 {timing = #hls.t<184 -> 189, 5, 1>} : f32
        affine.store %1417, %arg2[%arg6 * 64 + 176] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<189 -> 190, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1418 = affine.load %arg0[%arg5, %arg6 * 64 + 177] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<178 -> 180, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1419 = arith.mulf %1418, %1 {timing = #hls.t<181 -> 185, 4, 1>} : f32
        %1420 = affine.load %arg4[%arg6 * 64 + 177] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<183 -> 185, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1421 = arith.addf %1419, %1420 {timing = #hls.t<185 -> 190, 5, 1>} : f32
        affine.store %1421, %arg4[%arg6 * 64 + 177] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<190 -> 191, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1422 = affine.load %arg0[%arg6 * 64 + 177, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<179 -> 181, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1423 = arith.mulf %1422, %6 {timing = #hls.t<181 -> 185, 4, 1>} : f32
        %1424 = affine.load %arg2[%arg6 * 64 + 177] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<183 -> 185, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1425 = arith.addf %1423, %1424 {timing = #hls.t<185 -> 190, 5, 1>} : f32
        affine.store %1425, %arg2[%arg6 * 64 + 177] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<190 -> 191, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1426 = affine.load %arg0[%arg5, %arg6 * 64 + 178] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<178 -> 180, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1427 = arith.mulf %1426, %1 {timing = #hls.t<182 -> 186, 4, 1>} : f32
        %1428 = affine.load %arg4[%arg6 * 64 + 178] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<184 -> 186, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1429 = arith.addf %1427, %1428 {timing = #hls.t<186 -> 191, 5, 1>} : f32
        affine.store %1429, %arg4[%arg6 * 64 + 178] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<191 -> 192, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1430 = affine.load %arg0[%arg6 * 64 + 178, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<179 -> 181, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1431 = arith.mulf %1430, %6 {timing = #hls.t<182 -> 186, 4, 1>} : f32
        %1432 = affine.load %arg2[%arg6 * 64 + 178] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<184 -> 186, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1433 = arith.addf %1431, %1432 {timing = #hls.t<186 -> 191, 5, 1>} : f32
        affine.store %1433, %arg2[%arg6 * 64 + 178] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<191 -> 192, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1434 = affine.load %arg0[%arg5, %arg6 * 64 + 179] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<180 -> 182, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1435 = arith.mulf %1434, %1 {timing = #hls.t<183 -> 187, 4, 1>} : f32
        %1436 = affine.load %arg4[%arg6 * 64 + 179] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<185 -> 187, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1437 = arith.addf %1435, %1436 {timing = #hls.t<187 -> 192, 5, 1>} : f32
        affine.store %1437, %arg4[%arg6 * 64 + 179] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<192 -> 193, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1438 = affine.load %arg0[%arg6 * 64 + 179, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<181 -> 183, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1439 = arith.mulf %1438, %6 {timing = #hls.t<183 -> 187, 4, 1>} : f32
        %1440 = affine.load %arg2[%arg6 * 64 + 179] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<185 -> 187, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1441 = arith.addf %1439, %1440 {timing = #hls.t<187 -> 192, 5, 1>} : f32
        affine.store %1441, %arg2[%arg6 * 64 + 179] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<192 -> 193, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1442 = affine.load %arg0[%arg5, %arg6 * 64 + 180] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<180 -> 182, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1443 = arith.mulf %1442, %1 {timing = #hls.t<184 -> 188, 4, 1>} : f32
        %1444 = affine.load %arg4[%arg6 * 64 + 180] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<186 -> 188, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1445 = arith.addf %1443, %1444 {timing = #hls.t<188 -> 193, 5, 1>} : f32
        affine.store %1445, %arg4[%arg6 * 64 + 180] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<193 -> 194, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1446 = affine.load %arg0[%arg6 * 64 + 180, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<181 -> 183, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1447 = arith.mulf %1446, %6 {timing = #hls.t<184 -> 188, 4, 1>} : f32
        %1448 = affine.load %arg2[%arg6 * 64 + 180] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<186 -> 188, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1449 = arith.addf %1447, %1448 {timing = #hls.t<188 -> 193, 5, 1>} : f32
        affine.store %1449, %arg2[%arg6 * 64 + 180] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<193 -> 194, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1450 = affine.load %arg0[%arg5, %arg6 * 64 + 181] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<182 -> 184, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1451 = arith.mulf %1450, %1 {timing = #hls.t<185 -> 189, 4, 1>} : f32
        %1452 = affine.load %arg4[%arg6 * 64 + 181] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<187 -> 189, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1453 = arith.addf %1451, %1452 {timing = #hls.t<189 -> 194, 5, 1>} : f32
        affine.store %1453, %arg4[%arg6 * 64 + 181] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<194 -> 195, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1454 = affine.load %arg0[%arg6 * 64 + 181, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<183 -> 185, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1455 = arith.mulf %1454, %6 {timing = #hls.t<185 -> 189, 4, 1>} : f32
        %1456 = affine.load %arg2[%arg6 * 64 + 181] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<187 -> 189, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1457 = arith.addf %1455, %1456 {timing = #hls.t<189 -> 194, 5, 1>} : f32
        affine.store %1457, %arg2[%arg6 * 64 + 181] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<194 -> 195, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1458 = affine.load %arg0[%arg5, %arg6 * 64 + 182] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<182 -> 184, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1459 = arith.mulf %1458, %1 {timing = #hls.t<186 -> 190, 4, 1>} : f32
        %1460 = affine.load %arg4[%arg6 * 64 + 182] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<188 -> 190, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1461 = arith.addf %1459, %1460 {timing = #hls.t<190 -> 195, 5, 1>} : f32
        affine.store %1461, %arg4[%arg6 * 64 + 182] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<195 -> 196, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1462 = affine.load %arg0[%arg6 * 64 + 182, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<183 -> 185, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1463 = arith.mulf %1462, %6 {timing = #hls.t<186 -> 190, 4, 1>} : f32
        %1464 = affine.load %arg2[%arg6 * 64 + 182] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<188 -> 190, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1465 = arith.addf %1463, %1464 {timing = #hls.t<190 -> 195, 5, 1>} : f32
        affine.store %1465, %arg2[%arg6 * 64 + 182] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<195 -> 196, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1466 = affine.load %arg0[%arg5, %arg6 * 64 + 183] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<184 -> 186, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1467 = arith.mulf %1466, %1 {timing = #hls.t<187 -> 191, 4, 1>} : f32
        %1468 = affine.load %arg4[%arg6 * 64 + 183] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<189 -> 191, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1469 = arith.addf %1467, %1468 {timing = #hls.t<191 -> 196, 5, 1>} : f32
        affine.store %1469, %arg4[%arg6 * 64 + 183] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<196 -> 197, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1470 = affine.load %arg0[%arg6 * 64 + 183, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<185 -> 187, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1471 = arith.mulf %1470, %6 {timing = #hls.t<187 -> 191, 4, 1>} : f32
        %1472 = affine.load %arg2[%arg6 * 64 + 183] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<189 -> 191, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1473 = arith.addf %1471, %1472 {timing = #hls.t<191 -> 196, 5, 1>} : f32
        affine.store %1473, %arg2[%arg6 * 64 + 183] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<196 -> 197, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1474 = affine.load %arg0[%arg5, %arg6 * 64 + 184] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<184 -> 186, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1475 = arith.mulf %1474, %1 {timing = #hls.t<188 -> 192, 4, 1>} : f32
        %1476 = affine.load %arg4[%arg6 * 64 + 184] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<190 -> 192, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1477 = arith.addf %1475, %1476 {timing = #hls.t<192 -> 197, 5, 1>} : f32
        affine.store %1477, %arg4[%arg6 * 64 + 184] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<197 -> 198, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1478 = affine.load %arg0[%arg6 * 64 + 184, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<185 -> 187, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1479 = arith.mulf %1478, %6 {timing = #hls.t<188 -> 192, 4, 1>} : f32
        %1480 = affine.load %arg2[%arg6 * 64 + 184] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<190 -> 192, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1481 = arith.addf %1479, %1480 {timing = #hls.t<192 -> 197, 5, 1>} : f32
        affine.store %1481, %arg2[%arg6 * 64 + 184] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<197 -> 198, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1482 = affine.load %arg0[%arg5, %arg6 * 64 + 185] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<186 -> 188, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1483 = arith.mulf %1482, %1 {timing = #hls.t<189 -> 193, 4, 1>} : f32
        %1484 = affine.load %arg4[%arg6 * 64 + 185] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<191 -> 193, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1485 = arith.addf %1483, %1484 {timing = #hls.t<193 -> 198, 5, 1>} : f32
        affine.store %1485, %arg4[%arg6 * 64 + 185] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<198 -> 199, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1486 = affine.load %arg0[%arg6 * 64 + 185, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<187 -> 189, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1487 = arith.mulf %1486, %6 {timing = #hls.t<189 -> 193, 4, 1>} : f32
        %1488 = affine.load %arg2[%arg6 * 64 + 185] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<191 -> 193, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1489 = arith.addf %1487, %1488 {timing = #hls.t<193 -> 198, 5, 1>} : f32
        affine.store %1489, %arg2[%arg6 * 64 + 185] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<198 -> 199, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1490 = affine.load %arg0[%arg5, %arg6 * 64 + 186] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<186 -> 188, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1491 = arith.mulf %1490, %1 {timing = #hls.t<190 -> 194, 4, 1>} : f32
        %1492 = affine.load %arg4[%arg6 * 64 + 186] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<192 -> 194, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1493 = arith.addf %1491, %1492 {timing = #hls.t<194 -> 199, 5, 1>} : f32
        affine.store %1493, %arg4[%arg6 * 64 + 186] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<199 -> 200, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1494 = affine.load %arg0[%arg6 * 64 + 186, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<187 -> 189, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1495 = arith.mulf %1494, %6 {timing = #hls.t<190 -> 194, 4, 1>} : f32
        %1496 = affine.load %arg2[%arg6 * 64 + 186] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<192 -> 194, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1497 = arith.addf %1495, %1496 {timing = #hls.t<194 -> 199, 5, 1>} : f32
        affine.store %1497, %arg2[%arg6 * 64 + 186] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<199 -> 200, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1498 = affine.load %arg0[%arg5, %arg6 * 64 + 187] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<188 -> 190, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1499 = arith.mulf %1498, %1 {timing = #hls.t<191 -> 195, 4, 1>} : f32
        %1500 = affine.load %arg4[%arg6 * 64 + 187] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<193 -> 195, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1501 = arith.addf %1499, %1500 {timing = #hls.t<195 -> 200, 5, 1>} : f32
        affine.store %1501, %arg4[%arg6 * 64 + 187] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<200 -> 201, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1502 = affine.load %arg0[%arg6 * 64 + 187, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<189 -> 191, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1503 = arith.mulf %1502, %6 {timing = #hls.t<191 -> 195, 4, 1>} : f32
        %1504 = affine.load %arg2[%arg6 * 64 + 187] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<193 -> 195, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1505 = arith.addf %1503, %1504 {timing = #hls.t<195 -> 200, 5, 1>} : f32
        affine.store %1505, %arg2[%arg6 * 64 + 187] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<200 -> 201, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1506 = affine.load %arg0[%arg5, %arg6 * 64 + 188] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<188 -> 190, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1507 = arith.mulf %1506, %1 {timing = #hls.t<192 -> 196, 4, 1>} : f32
        %1508 = affine.load %arg4[%arg6 * 64 + 188] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<194 -> 196, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1509 = arith.addf %1507, %1508 {timing = #hls.t<196 -> 201, 5, 1>} : f32
        affine.store %1509, %arg4[%arg6 * 64 + 188] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<201 -> 202, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1510 = affine.load %arg0[%arg6 * 64 + 188, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<189 -> 191, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1511 = arith.mulf %1510, %6 {timing = #hls.t<192 -> 196, 4, 1>} : f32
        %1512 = affine.load %arg2[%arg6 * 64 + 188] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<194 -> 196, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1513 = arith.addf %1511, %1512 {timing = #hls.t<196 -> 201, 5, 1>} : f32
        affine.store %1513, %arg2[%arg6 * 64 + 188] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<201 -> 202, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1514 = affine.load %arg0[%arg5, %arg6 * 64 + 189] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<190 -> 192, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1515 = arith.mulf %1514, %1 {timing = #hls.t<193 -> 197, 4, 1>} : f32
        %1516 = affine.load %arg4[%arg6 * 64 + 189] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<195 -> 197, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1517 = arith.addf %1515, %1516 {timing = #hls.t<197 -> 202, 5, 1>} : f32
        affine.store %1517, %arg4[%arg6 * 64 + 189] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<202 -> 203, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1518 = affine.load %arg0[%arg6 * 64 + 189, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<191 -> 193, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1519 = arith.mulf %1518, %6 {timing = #hls.t<193 -> 197, 4, 1>} : f32
        %1520 = affine.load %arg2[%arg6 * 64 + 189] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<195 -> 197, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1521 = arith.addf %1519, %1520 {timing = #hls.t<197 -> 202, 5, 1>} : f32
        affine.store %1521, %arg2[%arg6 * 64 + 189] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<202 -> 203, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1522 = affine.load %arg0[%arg5, %arg6 * 64 + 190] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<190 -> 192, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1523 = arith.mulf %1522, %1 {timing = #hls.t<194 -> 198, 4, 1>} : f32
        %1524 = affine.load %arg4[%arg6 * 64 + 190] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<196 -> 198, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1525 = arith.addf %1523, %1524 {timing = #hls.t<198 -> 203, 5, 1>} : f32
        affine.store %1525, %arg4[%arg6 * 64 + 190] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<203 -> 204, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1526 = affine.load %arg0[%arg6 * 64 + 190, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<191 -> 193, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1527 = arith.mulf %1526, %6 {timing = #hls.t<194 -> 198, 4, 1>} : f32
        %1528 = affine.load %arg2[%arg6 * 64 + 190] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<196 -> 198, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1529 = arith.addf %1527, %1528 {timing = #hls.t<198 -> 203, 5, 1>} : f32
        affine.store %1529, %arg2[%arg6 * 64 + 190] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<203 -> 204, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1530 = affine.load %arg0[%arg5, %arg6 * 64 + 191] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<192 -> 194, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1531 = arith.mulf %1530, %1 {timing = #hls.t<195 -> 199, 4, 1>} : f32
        %1532 = affine.load %arg4[%arg6 * 64 + 191] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<197 -> 199, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1533 = arith.addf %1531, %1532 {timing = #hls.t<199 -> 204, 5, 1>} : f32
        affine.store %1533, %arg4[%arg6 * 64 + 191] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<204 -> 205, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1534 = affine.load %arg0[%arg6 * 64 + 191, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<193 -> 195, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1535 = arith.mulf %1534, %6 {timing = #hls.t<195 -> 199, 4, 1>} : f32
        %1536 = affine.load %arg2[%arg6 * 64 + 191] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<197 -> 199, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1537 = arith.addf %1535, %1536 {timing = #hls.t<199 -> 204, 5, 1>} : f32
        affine.store %1537, %arg2[%arg6 * 64 + 191] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<204 -> 205, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1538 = affine.load %arg0[%arg5, %arg6 * 64 + 192] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<192 -> 194, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1539 = arith.mulf %1538, %1 {timing = #hls.t<196 -> 200, 4, 1>} : f32
        %1540 = affine.load %arg4[%arg6 * 64 + 192] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<198 -> 200, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1541 = arith.addf %1539, %1540 {timing = #hls.t<200 -> 205, 5, 1>} : f32
        affine.store %1541, %arg4[%arg6 * 64 + 192] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<205 -> 206, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1542 = affine.load %arg0[%arg6 * 64 + 192, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<193 -> 195, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1543 = arith.mulf %1542, %6 {timing = #hls.t<196 -> 200, 4, 1>} : f32
        %1544 = affine.load %arg2[%arg6 * 64 + 192] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<198 -> 200, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1545 = arith.addf %1543, %1544 {timing = #hls.t<200 -> 205, 5, 1>} : f32
        affine.store %1545, %arg2[%arg6 * 64 + 192] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<205 -> 206, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1546 = affine.load %arg0[%arg5, %arg6 * 64 + 193] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<194 -> 196, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1547 = arith.mulf %1546, %1 {timing = #hls.t<197 -> 201, 4, 1>} : f32
        %1548 = affine.load %arg4[%arg6 * 64 + 193] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<199 -> 201, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1549 = arith.addf %1547, %1548 {timing = #hls.t<201 -> 206, 5, 1>} : f32
        affine.store %1549, %arg4[%arg6 * 64 + 193] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<206 -> 207, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1550 = affine.load %arg0[%arg6 * 64 + 193, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<195 -> 197, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1551 = arith.mulf %1550, %6 {timing = #hls.t<197 -> 201, 4, 1>} : f32
        %1552 = affine.load %arg2[%arg6 * 64 + 193] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<199 -> 201, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1553 = arith.addf %1551, %1552 {timing = #hls.t<201 -> 206, 5, 1>} : f32
        affine.store %1553, %arg2[%arg6 * 64 + 193] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<206 -> 207, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1554 = affine.load %arg0[%arg5, %arg6 * 64 + 194] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<194 -> 196, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1555 = arith.mulf %1554, %1 {timing = #hls.t<198 -> 202, 4, 1>} : f32
        %1556 = affine.load %arg4[%arg6 * 64 + 194] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<200 -> 202, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1557 = arith.addf %1555, %1556 {timing = #hls.t<202 -> 207, 5, 1>} : f32
        affine.store %1557, %arg4[%arg6 * 64 + 194] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<207 -> 208, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1558 = affine.load %arg0[%arg6 * 64 + 194, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<195 -> 197, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1559 = arith.mulf %1558, %6 {timing = #hls.t<198 -> 202, 4, 1>} : f32
        %1560 = affine.load %arg2[%arg6 * 64 + 194] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<200 -> 202, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1561 = arith.addf %1559, %1560 {timing = #hls.t<202 -> 207, 5, 1>} : f32
        affine.store %1561, %arg2[%arg6 * 64 + 194] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<207 -> 208, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1562 = affine.load %arg0[%arg5, %arg6 * 64 + 195] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<196 -> 198, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1563 = arith.mulf %1562, %1 {timing = #hls.t<199 -> 203, 4, 1>} : f32
        %1564 = affine.load %arg4[%arg6 * 64 + 195] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<201 -> 203, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1565 = arith.addf %1563, %1564 {timing = #hls.t<203 -> 208, 5, 1>} : f32
        affine.store %1565, %arg4[%arg6 * 64 + 195] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<208 -> 209, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1566 = affine.load %arg0[%arg6 * 64 + 195, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<197 -> 199, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1567 = arith.mulf %1566, %6 {timing = #hls.t<199 -> 203, 4, 1>} : f32
        %1568 = affine.load %arg2[%arg6 * 64 + 195] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<201 -> 203, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1569 = arith.addf %1567, %1568 {timing = #hls.t<203 -> 208, 5, 1>} : f32
        affine.store %1569, %arg2[%arg6 * 64 + 195] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<208 -> 209, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1570 = affine.load %arg0[%arg5, %arg6 * 64 + 196] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<196 -> 198, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1571 = arith.mulf %1570, %1 {timing = #hls.t<200 -> 204, 4, 1>} : f32
        %1572 = affine.load %arg4[%arg6 * 64 + 196] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<202 -> 204, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1573 = arith.addf %1571, %1572 {timing = #hls.t<204 -> 209, 5, 1>} : f32
        affine.store %1573, %arg4[%arg6 * 64 + 196] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<209 -> 210, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1574 = affine.load %arg0[%arg6 * 64 + 196, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<197 -> 199, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1575 = arith.mulf %1574, %6 {timing = #hls.t<200 -> 204, 4, 1>} : f32
        %1576 = affine.load %arg2[%arg6 * 64 + 196] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<202 -> 204, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1577 = arith.addf %1575, %1576 {timing = #hls.t<204 -> 209, 5, 1>} : f32
        affine.store %1577, %arg2[%arg6 * 64 + 196] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<209 -> 210, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1578 = affine.load %arg0[%arg5, %arg6 * 64 + 197] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<198 -> 200, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1579 = arith.mulf %1578, %1 {timing = #hls.t<201 -> 205, 4, 1>} : f32
        %1580 = affine.load %arg4[%arg6 * 64 + 197] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<203 -> 205, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1581 = arith.addf %1579, %1580 {timing = #hls.t<205 -> 210, 5, 1>} : f32
        affine.store %1581, %arg4[%arg6 * 64 + 197] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<210 -> 211, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1582 = affine.load %arg0[%arg6 * 64 + 197, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<199 -> 201, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1583 = arith.mulf %1582, %6 {timing = #hls.t<201 -> 205, 4, 1>} : f32
        %1584 = affine.load %arg2[%arg6 * 64 + 197] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<203 -> 205, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1585 = arith.addf %1583, %1584 {timing = #hls.t<205 -> 210, 5, 1>} : f32
        affine.store %1585, %arg2[%arg6 * 64 + 197] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<210 -> 211, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1586 = affine.load %arg0[%arg5, %arg6 * 64 + 198] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<198 -> 200, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1587 = arith.mulf %1586, %1 {timing = #hls.t<202 -> 206, 4, 1>} : f32
        %1588 = affine.load %arg4[%arg6 * 64 + 198] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<204 -> 206, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1589 = arith.addf %1587, %1588 {timing = #hls.t<206 -> 211, 5, 1>} : f32
        affine.store %1589, %arg4[%arg6 * 64 + 198] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<211 -> 212, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1590 = affine.load %arg0[%arg6 * 64 + 198, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<199 -> 201, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1591 = arith.mulf %1590, %6 {timing = #hls.t<202 -> 206, 4, 1>} : f32
        %1592 = affine.load %arg2[%arg6 * 64 + 198] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<204 -> 206, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1593 = arith.addf %1591, %1592 {timing = #hls.t<206 -> 211, 5, 1>} : f32
        affine.store %1593, %arg2[%arg6 * 64 + 198] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<211 -> 212, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1594 = affine.load %arg0[%arg5, %arg6 * 64 + 199] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<200 -> 202, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1595 = arith.mulf %1594, %1 {timing = #hls.t<203 -> 207, 4, 1>} : f32
        %1596 = affine.load %arg4[%arg6 * 64 + 199] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<205 -> 207, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1597 = arith.addf %1595, %1596 {timing = #hls.t<207 -> 212, 5, 1>} : f32
        affine.store %1597, %arg4[%arg6 * 64 + 199] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<212 -> 213, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1598 = affine.load %arg0[%arg6 * 64 + 199, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<201 -> 203, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1599 = arith.mulf %1598, %6 {timing = #hls.t<203 -> 207, 4, 1>} : f32
        %1600 = affine.load %arg2[%arg6 * 64 + 199] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<205 -> 207, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1601 = arith.addf %1599, %1600 {timing = #hls.t<207 -> 212, 5, 1>} : f32
        affine.store %1601, %arg2[%arg6 * 64 + 199] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<212 -> 213, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1602 = affine.load %arg0[%arg5, %arg6 * 64 + 200] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<200 -> 202, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1603 = arith.mulf %1602, %1 {timing = #hls.t<204 -> 208, 4, 1>} : f32
        %1604 = affine.load %arg4[%arg6 * 64 + 200] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<206 -> 208, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1605 = arith.addf %1603, %1604 {timing = #hls.t<208 -> 213, 5, 1>} : f32
        affine.store %1605, %arg4[%arg6 * 64 + 200] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<213 -> 214, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1606 = affine.load %arg0[%arg6 * 64 + 200, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<201 -> 203, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1607 = arith.mulf %1606, %6 {timing = #hls.t<204 -> 208, 4, 1>} : f32
        %1608 = affine.load %arg2[%arg6 * 64 + 200] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<206 -> 208, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1609 = arith.addf %1607, %1608 {timing = #hls.t<208 -> 213, 5, 1>} : f32
        affine.store %1609, %arg2[%arg6 * 64 + 200] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<213 -> 214, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1610 = affine.load %arg0[%arg5, %arg6 * 64 + 201] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<202 -> 204, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1611 = arith.mulf %1610, %1 {timing = #hls.t<205 -> 209, 4, 1>} : f32
        %1612 = affine.load %arg4[%arg6 * 64 + 201] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<207 -> 209, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1613 = arith.addf %1611, %1612 {timing = #hls.t<209 -> 214, 5, 1>} : f32
        affine.store %1613, %arg4[%arg6 * 64 + 201] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<214 -> 215, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1614 = affine.load %arg0[%arg6 * 64 + 201, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<203 -> 205, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1615 = arith.mulf %1614, %6 {timing = #hls.t<205 -> 209, 4, 1>} : f32
        %1616 = affine.load %arg2[%arg6 * 64 + 201] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<207 -> 209, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1617 = arith.addf %1615, %1616 {timing = #hls.t<209 -> 214, 5, 1>} : f32
        affine.store %1617, %arg2[%arg6 * 64 + 201] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<214 -> 215, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1618 = affine.load %arg0[%arg5, %arg6 * 64 + 202] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<202 -> 204, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1619 = arith.mulf %1618, %1 {timing = #hls.t<206 -> 210, 4, 1>} : f32
        %1620 = affine.load %arg4[%arg6 * 64 + 202] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<208 -> 210, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1621 = arith.addf %1619, %1620 {timing = #hls.t<210 -> 215, 5, 1>} : f32
        affine.store %1621, %arg4[%arg6 * 64 + 202] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<215 -> 216, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1622 = affine.load %arg0[%arg6 * 64 + 202, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<203 -> 205, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1623 = arith.mulf %1622, %6 {timing = #hls.t<206 -> 210, 4, 1>} : f32
        %1624 = affine.load %arg2[%arg6 * 64 + 202] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<208 -> 210, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1625 = arith.addf %1623, %1624 {timing = #hls.t<210 -> 215, 5, 1>} : f32
        affine.store %1625, %arg2[%arg6 * 64 + 202] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<215 -> 216, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1626 = affine.load %arg0[%arg5, %arg6 * 64 + 203] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<204 -> 206, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1627 = arith.mulf %1626, %1 {timing = #hls.t<207 -> 211, 4, 1>} : f32
        %1628 = affine.load %arg4[%arg6 * 64 + 203] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<209 -> 211, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1629 = arith.addf %1627, %1628 {timing = #hls.t<211 -> 216, 5, 1>} : f32
        affine.store %1629, %arg4[%arg6 * 64 + 203] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<216 -> 217, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1630 = affine.load %arg0[%arg6 * 64 + 203, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<205 -> 207, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1631 = arith.mulf %1630, %6 {timing = #hls.t<207 -> 211, 4, 1>} : f32
        %1632 = affine.load %arg2[%arg6 * 64 + 203] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<209 -> 211, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1633 = arith.addf %1631, %1632 {timing = #hls.t<211 -> 216, 5, 1>} : f32
        affine.store %1633, %arg2[%arg6 * 64 + 203] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<216 -> 217, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1634 = affine.load %arg0[%arg5, %arg6 * 64 + 204] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<204 -> 206, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1635 = arith.mulf %1634, %1 {timing = #hls.t<208 -> 212, 4, 1>} : f32
        %1636 = affine.load %arg4[%arg6 * 64 + 204] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<210 -> 212, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1637 = arith.addf %1635, %1636 {timing = #hls.t<212 -> 217, 5, 1>} : f32
        affine.store %1637, %arg4[%arg6 * 64 + 204] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<217 -> 218, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1638 = affine.load %arg0[%arg6 * 64 + 204, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<205 -> 207, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1639 = arith.mulf %1638, %6 {timing = #hls.t<208 -> 212, 4, 1>} : f32
        %1640 = affine.load %arg2[%arg6 * 64 + 204] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<210 -> 212, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1641 = arith.addf %1639, %1640 {timing = #hls.t<212 -> 217, 5, 1>} : f32
        affine.store %1641, %arg2[%arg6 * 64 + 204] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<217 -> 218, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1642 = affine.load %arg0[%arg5, %arg6 * 64 + 205] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<206 -> 208, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1643 = arith.mulf %1642, %1 {timing = #hls.t<209 -> 213, 4, 1>} : f32
        %1644 = affine.load %arg4[%arg6 * 64 + 205] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<211 -> 213, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1645 = arith.addf %1643, %1644 {timing = #hls.t<213 -> 218, 5, 1>} : f32
        affine.store %1645, %arg4[%arg6 * 64 + 205] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<218 -> 219, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1646 = affine.load %arg0[%arg6 * 64 + 205, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<207 -> 209, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1647 = arith.mulf %1646, %6 {timing = #hls.t<209 -> 213, 4, 1>} : f32
        %1648 = affine.load %arg2[%arg6 * 64 + 205] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<211 -> 213, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1649 = arith.addf %1647, %1648 {timing = #hls.t<213 -> 218, 5, 1>} : f32
        affine.store %1649, %arg2[%arg6 * 64 + 205] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<218 -> 219, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1650 = affine.load %arg0[%arg5, %arg6 * 64 + 206] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<206 -> 208, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1651 = arith.mulf %1650, %1 {timing = #hls.t<210 -> 214, 4, 1>} : f32
        %1652 = affine.load %arg4[%arg6 * 64 + 206] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<212 -> 214, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1653 = arith.addf %1651, %1652 {timing = #hls.t<214 -> 219, 5, 1>} : f32
        affine.store %1653, %arg4[%arg6 * 64 + 206] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<219 -> 220, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1654 = affine.load %arg0[%arg6 * 64 + 206, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<207 -> 209, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1655 = arith.mulf %1654, %6 {timing = #hls.t<210 -> 214, 4, 1>} : f32
        %1656 = affine.load %arg2[%arg6 * 64 + 206] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<212 -> 214, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1657 = arith.addf %1655, %1656 {timing = #hls.t<214 -> 219, 5, 1>} : f32
        affine.store %1657, %arg2[%arg6 * 64 + 206] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<219 -> 220, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1658 = affine.load %arg0[%arg5, %arg6 * 64 + 207] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<208 -> 210, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1659 = arith.mulf %1658, %1 {timing = #hls.t<211 -> 215, 4, 1>} : f32
        %1660 = affine.load %arg4[%arg6 * 64 + 207] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<213 -> 215, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1661 = arith.addf %1659, %1660 {timing = #hls.t<215 -> 220, 5, 1>} : f32
        affine.store %1661, %arg4[%arg6 * 64 + 207] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<220 -> 221, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1662 = affine.load %arg0[%arg6 * 64 + 207, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<209 -> 211, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1663 = arith.mulf %1662, %6 {timing = #hls.t<211 -> 215, 4, 1>} : f32
        %1664 = affine.load %arg2[%arg6 * 64 + 207] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<213 -> 215, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1665 = arith.addf %1663, %1664 {timing = #hls.t<215 -> 220, 5, 1>} : f32
        affine.store %1665, %arg2[%arg6 * 64 + 207] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<220 -> 221, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1666 = affine.load %arg0[%arg5, %arg6 * 64 + 208] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<208 -> 210, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1667 = arith.mulf %1666, %1 {timing = #hls.t<212 -> 216, 4, 1>} : f32
        %1668 = affine.load %arg4[%arg6 * 64 + 208] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<214 -> 216, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1669 = arith.addf %1667, %1668 {timing = #hls.t<216 -> 221, 5, 1>} : f32
        affine.store %1669, %arg4[%arg6 * 64 + 208] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<221 -> 222, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1670 = affine.load %arg0[%arg6 * 64 + 208, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<209 -> 211, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1671 = arith.mulf %1670, %6 {timing = #hls.t<212 -> 216, 4, 1>} : f32
        %1672 = affine.load %arg2[%arg6 * 64 + 208] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<214 -> 216, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1673 = arith.addf %1671, %1672 {timing = #hls.t<216 -> 221, 5, 1>} : f32
        affine.store %1673, %arg2[%arg6 * 64 + 208] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<221 -> 222, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1674 = affine.load %arg0[%arg5, %arg6 * 64 + 209] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<210 -> 212, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1675 = arith.mulf %1674, %1 {timing = #hls.t<213 -> 217, 4, 1>} : f32
        %1676 = affine.load %arg4[%arg6 * 64 + 209] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<215 -> 217, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1677 = arith.addf %1675, %1676 {timing = #hls.t<217 -> 222, 5, 1>} : f32
        affine.store %1677, %arg4[%arg6 * 64 + 209] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<222 -> 223, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1678 = affine.load %arg0[%arg6 * 64 + 209, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<211 -> 213, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1679 = arith.mulf %1678, %6 {timing = #hls.t<213 -> 217, 4, 1>} : f32
        %1680 = affine.load %arg2[%arg6 * 64 + 209] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<215 -> 217, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1681 = arith.addf %1679, %1680 {timing = #hls.t<217 -> 222, 5, 1>} : f32
        affine.store %1681, %arg2[%arg6 * 64 + 209] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<222 -> 223, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1682 = affine.load %arg0[%arg5, %arg6 * 64 + 210] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<210 -> 212, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1683 = arith.mulf %1682, %1 {timing = #hls.t<214 -> 218, 4, 1>} : f32
        %1684 = affine.load %arg4[%arg6 * 64 + 210] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<216 -> 218, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1685 = arith.addf %1683, %1684 {timing = #hls.t<218 -> 223, 5, 1>} : f32
        affine.store %1685, %arg4[%arg6 * 64 + 210] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<223 -> 224, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1686 = affine.load %arg0[%arg6 * 64 + 210, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<211 -> 213, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1687 = arith.mulf %1686, %6 {timing = #hls.t<214 -> 218, 4, 1>} : f32
        %1688 = affine.load %arg2[%arg6 * 64 + 210] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<216 -> 218, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1689 = arith.addf %1687, %1688 {timing = #hls.t<218 -> 223, 5, 1>} : f32
        affine.store %1689, %arg2[%arg6 * 64 + 210] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<223 -> 224, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1690 = affine.load %arg0[%arg5, %arg6 * 64 + 211] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<212 -> 214, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1691 = arith.mulf %1690, %1 {timing = #hls.t<215 -> 219, 4, 1>} : f32
        %1692 = affine.load %arg4[%arg6 * 64 + 211] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<217 -> 219, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1693 = arith.addf %1691, %1692 {timing = #hls.t<219 -> 224, 5, 1>} : f32
        affine.store %1693, %arg4[%arg6 * 64 + 211] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<224 -> 225, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1694 = affine.load %arg0[%arg6 * 64 + 211, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<213 -> 215, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1695 = arith.mulf %1694, %6 {timing = #hls.t<215 -> 219, 4, 1>} : f32
        %1696 = affine.load %arg2[%arg6 * 64 + 211] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<217 -> 219, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1697 = arith.addf %1695, %1696 {timing = #hls.t<219 -> 224, 5, 1>} : f32
        affine.store %1697, %arg2[%arg6 * 64 + 211] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<224 -> 225, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1698 = affine.load %arg0[%arg5, %arg6 * 64 + 212] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<212 -> 214, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1699 = arith.mulf %1698, %1 {timing = #hls.t<216 -> 220, 4, 1>} : f32
        %1700 = affine.load %arg4[%arg6 * 64 + 212] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<218 -> 220, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1701 = arith.addf %1699, %1700 {timing = #hls.t<220 -> 225, 5, 1>} : f32
        affine.store %1701, %arg4[%arg6 * 64 + 212] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<225 -> 226, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1702 = affine.load %arg0[%arg6 * 64 + 212, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<213 -> 215, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1703 = arith.mulf %1702, %6 {timing = #hls.t<216 -> 220, 4, 1>} : f32
        %1704 = affine.load %arg2[%arg6 * 64 + 212] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<218 -> 220, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1705 = arith.addf %1703, %1704 {timing = #hls.t<220 -> 225, 5, 1>} : f32
        affine.store %1705, %arg2[%arg6 * 64 + 212] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<225 -> 226, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1706 = affine.load %arg0[%arg5, %arg6 * 64 + 213] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<214 -> 216, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1707 = arith.mulf %1706, %1 {timing = #hls.t<217 -> 221, 4, 1>} : f32
        %1708 = affine.load %arg4[%arg6 * 64 + 213] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<219 -> 221, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1709 = arith.addf %1707, %1708 {timing = #hls.t<221 -> 226, 5, 1>} : f32
        affine.store %1709, %arg4[%arg6 * 64 + 213] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<226 -> 227, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1710 = affine.load %arg0[%arg6 * 64 + 213, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<215 -> 217, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1711 = arith.mulf %1710, %6 {timing = #hls.t<217 -> 221, 4, 1>} : f32
        %1712 = affine.load %arg2[%arg6 * 64 + 213] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<219 -> 221, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1713 = arith.addf %1711, %1712 {timing = #hls.t<221 -> 226, 5, 1>} : f32
        affine.store %1713, %arg2[%arg6 * 64 + 213] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<226 -> 227, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1714 = affine.load %arg0[%arg5, %arg6 * 64 + 214] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<214 -> 216, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1715 = arith.mulf %1714, %1 {timing = #hls.t<218 -> 222, 4, 1>} : f32
        %1716 = affine.load %arg4[%arg6 * 64 + 214] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<220 -> 222, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1717 = arith.addf %1715, %1716 {timing = #hls.t<222 -> 227, 5, 1>} : f32
        affine.store %1717, %arg4[%arg6 * 64 + 214] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<227 -> 228, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1718 = affine.load %arg0[%arg6 * 64 + 214, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<215 -> 217, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1719 = arith.mulf %1718, %6 {timing = #hls.t<218 -> 222, 4, 1>} : f32
        %1720 = affine.load %arg2[%arg6 * 64 + 214] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<220 -> 222, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1721 = arith.addf %1719, %1720 {timing = #hls.t<222 -> 227, 5, 1>} : f32
        affine.store %1721, %arg2[%arg6 * 64 + 214] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<227 -> 228, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1722 = affine.load %arg0[%arg5, %arg6 * 64 + 215] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<216 -> 218, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1723 = arith.mulf %1722, %1 {timing = #hls.t<219 -> 223, 4, 1>} : f32
        %1724 = affine.load %arg4[%arg6 * 64 + 215] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<221 -> 223, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1725 = arith.addf %1723, %1724 {timing = #hls.t<223 -> 228, 5, 1>} : f32
        affine.store %1725, %arg4[%arg6 * 64 + 215] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<228 -> 229, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1726 = affine.load %arg0[%arg6 * 64 + 215, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<217 -> 219, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1727 = arith.mulf %1726, %6 {timing = #hls.t<219 -> 223, 4, 1>} : f32
        %1728 = affine.load %arg2[%arg6 * 64 + 215] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<221 -> 223, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1729 = arith.addf %1727, %1728 {timing = #hls.t<223 -> 228, 5, 1>} : f32
        affine.store %1729, %arg2[%arg6 * 64 + 215] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<228 -> 229, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1730 = affine.load %arg0[%arg5, %arg6 * 64 + 216] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<216 -> 218, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1731 = arith.mulf %1730, %1 {timing = #hls.t<220 -> 224, 4, 1>} : f32
        %1732 = affine.load %arg4[%arg6 * 64 + 216] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<222 -> 224, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1733 = arith.addf %1731, %1732 {timing = #hls.t<224 -> 229, 5, 1>} : f32
        affine.store %1733, %arg4[%arg6 * 64 + 216] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<229 -> 230, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1734 = affine.load %arg0[%arg6 * 64 + 216, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<217 -> 219, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1735 = arith.mulf %1734, %6 {timing = #hls.t<220 -> 224, 4, 1>} : f32
        %1736 = affine.load %arg2[%arg6 * 64 + 216] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<222 -> 224, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1737 = arith.addf %1735, %1736 {timing = #hls.t<224 -> 229, 5, 1>} : f32
        affine.store %1737, %arg2[%arg6 * 64 + 216] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<229 -> 230, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1738 = affine.load %arg0[%arg5, %arg6 * 64 + 217] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<218 -> 220, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1739 = arith.mulf %1738, %1 {timing = #hls.t<221 -> 225, 4, 1>} : f32
        %1740 = affine.load %arg4[%arg6 * 64 + 217] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<223 -> 225, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1741 = arith.addf %1739, %1740 {timing = #hls.t<225 -> 230, 5, 1>} : f32
        affine.store %1741, %arg4[%arg6 * 64 + 217] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<230 -> 231, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1742 = affine.load %arg0[%arg6 * 64 + 217, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<219 -> 221, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1743 = arith.mulf %1742, %6 {timing = #hls.t<221 -> 225, 4, 1>} : f32
        %1744 = affine.load %arg2[%arg6 * 64 + 217] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<223 -> 225, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1745 = arith.addf %1743, %1744 {timing = #hls.t<225 -> 230, 5, 1>} : f32
        affine.store %1745, %arg2[%arg6 * 64 + 217] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<230 -> 231, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1746 = affine.load %arg0[%arg5, %arg6 * 64 + 218] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<218 -> 220, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1747 = arith.mulf %1746, %1 {timing = #hls.t<222 -> 226, 4, 1>} : f32
        %1748 = affine.load %arg4[%arg6 * 64 + 218] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<224 -> 226, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1749 = arith.addf %1747, %1748 {timing = #hls.t<226 -> 231, 5, 1>} : f32
        affine.store %1749, %arg4[%arg6 * 64 + 218] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<231 -> 232, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1750 = affine.load %arg0[%arg6 * 64 + 218, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<219 -> 221, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1751 = arith.mulf %1750, %6 {timing = #hls.t<222 -> 226, 4, 1>} : f32
        %1752 = affine.load %arg2[%arg6 * 64 + 218] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<224 -> 226, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1753 = arith.addf %1751, %1752 {timing = #hls.t<226 -> 231, 5, 1>} : f32
        affine.store %1753, %arg2[%arg6 * 64 + 218] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<231 -> 232, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1754 = affine.load %arg0[%arg5, %arg6 * 64 + 219] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<220 -> 222, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1755 = arith.mulf %1754, %1 {timing = #hls.t<223 -> 227, 4, 1>} : f32
        %1756 = affine.load %arg4[%arg6 * 64 + 219] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<225 -> 227, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1757 = arith.addf %1755, %1756 {timing = #hls.t<227 -> 232, 5, 1>} : f32
        affine.store %1757, %arg4[%arg6 * 64 + 219] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<232 -> 233, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1758 = affine.load %arg0[%arg6 * 64 + 219, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<221 -> 223, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1759 = arith.mulf %1758, %6 {timing = #hls.t<223 -> 227, 4, 1>} : f32
        %1760 = affine.load %arg2[%arg6 * 64 + 219] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<225 -> 227, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1761 = arith.addf %1759, %1760 {timing = #hls.t<227 -> 232, 5, 1>} : f32
        affine.store %1761, %arg2[%arg6 * 64 + 219] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<232 -> 233, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1762 = affine.load %arg0[%arg5, %arg6 * 64 + 220] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<220 -> 222, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1763 = arith.mulf %1762, %1 {timing = #hls.t<224 -> 228, 4, 1>} : f32
        %1764 = affine.load %arg4[%arg6 * 64 + 220] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<226 -> 228, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1765 = arith.addf %1763, %1764 {timing = #hls.t<228 -> 233, 5, 1>} : f32
        affine.store %1765, %arg4[%arg6 * 64 + 220] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<233 -> 234, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1766 = affine.load %arg0[%arg6 * 64 + 220, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<221 -> 223, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1767 = arith.mulf %1766, %6 {timing = #hls.t<224 -> 228, 4, 1>} : f32
        %1768 = affine.load %arg2[%arg6 * 64 + 220] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<226 -> 228, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1769 = arith.addf %1767, %1768 {timing = #hls.t<228 -> 233, 5, 1>} : f32
        affine.store %1769, %arg2[%arg6 * 64 + 220] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<233 -> 234, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1770 = affine.load %arg0[%arg5, %arg6 * 64 + 221] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<222 -> 224, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1771 = arith.mulf %1770, %1 {timing = #hls.t<225 -> 229, 4, 1>} : f32
        %1772 = affine.load %arg4[%arg6 * 64 + 221] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<227 -> 229, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1773 = arith.addf %1771, %1772 {timing = #hls.t<229 -> 234, 5, 1>} : f32
        affine.store %1773, %arg4[%arg6 * 64 + 221] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<234 -> 235, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1774 = affine.load %arg0[%arg6 * 64 + 221, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<223 -> 225, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1775 = arith.mulf %1774, %6 {timing = #hls.t<225 -> 229, 4, 1>} : f32
        %1776 = affine.load %arg2[%arg6 * 64 + 221] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<227 -> 229, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1777 = arith.addf %1775, %1776 {timing = #hls.t<229 -> 234, 5, 1>} : f32
        affine.store %1777, %arg2[%arg6 * 64 + 221] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<234 -> 235, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1778 = affine.load %arg0[%arg5, %arg6 * 64 + 222] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<222 -> 224, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1779 = arith.mulf %1778, %1 {timing = #hls.t<226 -> 230, 4, 1>} : f32
        %1780 = affine.load %arg4[%arg6 * 64 + 222] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<228 -> 230, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1781 = arith.addf %1779, %1780 {timing = #hls.t<230 -> 235, 5, 1>} : f32
        affine.store %1781, %arg4[%arg6 * 64 + 222] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<235 -> 236, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1782 = affine.load %arg0[%arg6 * 64 + 222, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<223 -> 225, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1783 = arith.mulf %1782, %6 {timing = #hls.t<226 -> 230, 4, 1>} : f32
        %1784 = affine.load %arg2[%arg6 * 64 + 222] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<228 -> 230, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1785 = arith.addf %1783, %1784 {timing = #hls.t<230 -> 235, 5, 1>} : f32
        affine.store %1785, %arg2[%arg6 * 64 + 222] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<235 -> 236, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1786 = affine.load %arg0[%arg5, %arg6 * 64 + 223] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<224 -> 226, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1787 = arith.mulf %1786, %1 {timing = #hls.t<227 -> 231, 4, 1>} : f32
        %1788 = affine.load %arg4[%arg6 * 64 + 223] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<229 -> 231, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1789 = arith.addf %1787, %1788 {timing = #hls.t<231 -> 236, 5, 1>} : f32
        affine.store %1789, %arg4[%arg6 * 64 + 223] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<236 -> 237, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1790 = affine.load %arg0[%arg6 * 64 + 223, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<225 -> 227, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1791 = arith.mulf %1790, %6 {timing = #hls.t<227 -> 231, 4, 1>} : f32
        %1792 = affine.load %arg2[%arg6 * 64 + 223] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<229 -> 231, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1793 = arith.addf %1791, %1792 {timing = #hls.t<231 -> 236, 5, 1>} : f32
        affine.store %1793, %arg2[%arg6 * 64 + 223] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<236 -> 237, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1794 = affine.load %arg0[%arg5, %arg6 * 64 + 224] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<224 -> 226, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1795 = arith.mulf %1794, %1 {timing = #hls.t<228 -> 232, 4, 1>} : f32
        %1796 = affine.load %arg4[%arg6 * 64 + 224] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<230 -> 232, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1797 = arith.addf %1795, %1796 {timing = #hls.t<232 -> 237, 5, 1>} : f32
        affine.store %1797, %arg4[%arg6 * 64 + 224] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<237 -> 238, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1798 = affine.load %arg0[%arg6 * 64 + 224, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<225 -> 227, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1799 = arith.mulf %1798, %6 {timing = #hls.t<228 -> 232, 4, 1>} : f32
        %1800 = affine.load %arg2[%arg6 * 64 + 224] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<230 -> 232, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1801 = arith.addf %1799, %1800 {timing = #hls.t<232 -> 237, 5, 1>} : f32
        affine.store %1801, %arg2[%arg6 * 64 + 224] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<237 -> 238, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1802 = affine.load %arg0[%arg5, %arg6 * 64 + 225] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<226 -> 228, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1803 = arith.mulf %1802, %1 {timing = #hls.t<229 -> 233, 4, 1>} : f32
        %1804 = affine.load %arg4[%arg6 * 64 + 225] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<231 -> 233, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1805 = arith.addf %1803, %1804 {timing = #hls.t<233 -> 238, 5, 1>} : f32
        affine.store %1805, %arg4[%arg6 * 64 + 225] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<238 -> 239, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1806 = affine.load %arg0[%arg6 * 64 + 225, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<227 -> 229, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1807 = arith.mulf %1806, %6 {timing = #hls.t<229 -> 233, 4, 1>} : f32
        %1808 = affine.load %arg2[%arg6 * 64 + 225] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<231 -> 233, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1809 = arith.addf %1807, %1808 {timing = #hls.t<233 -> 238, 5, 1>} : f32
        affine.store %1809, %arg2[%arg6 * 64 + 225] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<238 -> 239, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1810 = affine.load %arg0[%arg5, %arg6 * 64 + 226] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<226 -> 228, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1811 = arith.mulf %1810, %1 {timing = #hls.t<230 -> 234, 4, 1>} : f32
        %1812 = affine.load %arg4[%arg6 * 64 + 226] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<232 -> 234, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1813 = arith.addf %1811, %1812 {timing = #hls.t<234 -> 239, 5, 1>} : f32
        affine.store %1813, %arg4[%arg6 * 64 + 226] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<239 -> 240, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1814 = affine.load %arg0[%arg6 * 64 + 226, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<227 -> 229, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1815 = arith.mulf %1814, %6 {timing = #hls.t<230 -> 234, 4, 1>} : f32
        %1816 = affine.load %arg2[%arg6 * 64 + 226] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<232 -> 234, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1817 = arith.addf %1815, %1816 {timing = #hls.t<234 -> 239, 5, 1>} : f32
        affine.store %1817, %arg2[%arg6 * 64 + 226] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<239 -> 240, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1818 = affine.load %arg0[%arg5, %arg6 * 64 + 227] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<228 -> 230, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1819 = arith.mulf %1818, %1 {timing = #hls.t<231 -> 235, 4, 1>} : f32
        %1820 = affine.load %arg4[%arg6 * 64 + 227] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<233 -> 235, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1821 = arith.addf %1819, %1820 {timing = #hls.t<235 -> 240, 5, 1>} : f32
        affine.store %1821, %arg4[%arg6 * 64 + 227] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<240 -> 241, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1822 = affine.load %arg0[%arg6 * 64 + 227, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<229 -> 231, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1823 = arith.mulf %1822, %6 {timing = #hls.t<231 -> 235, 4, 1>} : f32
        %1824 = affine.load %arg2[%arg6 * 64 + 227] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<233 -> 235, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1825 = arith.addf %1823, %1824 {timing = #hls.t<235 -> 240, 5, 1>} : f32
        affine.store %1825, %arg2[%arg6 * 64 + 227] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<240 -> 241, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1826 = affine.load %arg0[%arg5, %arg6 * 64 + 228] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<228 -> 230, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1827 = arith.mulf %1826, %1 {timing = #hls.t<232 -> 236, 4, 1>} : f32
        %1828 = affine.load %arg4[%arg6 * 64 + 228] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<234 -> 236, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1829 = arith.addf %1827, %1828 {timing = #hls.t<236 -> 241, 5, 1>} : f32
        affine.store %1829, %arg4[%arg6 * 64 + 228] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<241 -> 242, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1830 = affine.load %arg0[%arg6 * 64 + 228, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<229 -> 231, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1831 = arith.mulf %1830, %6 {timing = #hls.t<232 -> 236, 4, 1>} : f32
        %1832 = affine.load %arg2[%arg6 * 64 + 228] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<234 -> 236, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1833 = arith.addf %1831, %1832 {timing = #hls.t<236 -> 241, 5, 1>} : f32
        affine.store %1833, %arg2[%arg6 * 64 + 228] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<241 -> 242, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1834 = affine.load %arg0[%arg5, %arg6 * 64 + 229] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<230 -> 232, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1835 = arith.mulf %1834, %1 {timing = #hls.t<233 -> 237, 4, 1>} : f32
        %1836 = affine.load %arg4[%arg6 * 64 + 229] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<235 -> 237, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1837 = arith.addf %1835, %1836 {timing = #hls.t<237 -> 242, 5, 1>} : f32
        affine.store %1837, %arg4[%arg6 * 64 + 229] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<242 -> 243, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1838 = affine.load %arg0[%arg6 * 64 + 229, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<231 -> 233, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1839 = arith.mulf %1838, %6 {timing = #hls.t<233 -> 237, 4, 1>} : f32
        %1840 = affine.load %arg2[%arg6 * 64 + 229] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<235 -> 237, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1841 = arith.addf %1839, %1840 {timing = #hls.t<237 -> 242, 5, 1>} : f32
        affine.store %1841, %arg2[%arg6 * 64 + 229] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<242 -> 243, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1842 = affine.load %arg0[%arg5, %arg6 * 64 + 230] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<230 -> 232, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1843 = arith.mulf %1842, %1 {timing = #hls.t<234 -> 238, 4, 1>} : f32
        %1844 = affine.load %arg4[%arg6 * 64 + 230] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<236 -> 238, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1845 = arith.addf %1843, %1844 {timing = #hls.t<238 -> 243, 5, 1>} : f32
        affine.store %1845, %arg4[%arg6 * 64 + 230] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<243 -> 244, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1846 = affine.load %arg0[%arg6 * 64 + 230, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<231 -> 233, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1847 = arith.mulf %1846, %6 {timing = #hls.t<234 -> 238, 4, 1>} : f32
        %1848 = affine.load %arg2[%arg6 * 64 + 230] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<236 -> 238, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1849 = arith.addf %1847, %1848 {timing = #hls.t<238 -> 243, 5, 1>} : f32
        affine.store %1849, %arg2[%arg6 * 64 + 230] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<243 -> 244, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1850 = affine.load %arg0[%arg5, %arg6 * 64 + 231] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<232 -> 234, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1851 = arith.mulf %1850, %1 {timing = #hls.t<235 -> 239, 4, 1>} : f32
        %1852 = affine.load %arg4[%arg6 * 64 + 231] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<237 -> 239, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1853 = arith.addf %1851, %1852 {timing = #hls.t<239 -> 244, 5, 1>} : f32
        affine.store %1853, %arg4[%arg6 * 64 + 231] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<244 -> 245, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1854 = affine.load %arg0[%arg6 * 64 + 231, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<233 -> 235, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1855 = arith.mulf %1854, %6 {timing = #hls.t<235 -> 239, 4, 1>} : f32
        %1856 = affine.load %arg2[%arg6 * 64 + 231] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<237 -> 239, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1857 = arith.addf %1855, %1856 {timing = #hls.t<239 -> 244, 5, 1>} : f32
        affine.store %1857, %arg2[%arg6 * 64 + 231] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<244 -> 245, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1858 = affine.load %arg0[%arg5, %arg6 * 64 + 232] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<232 -> 234, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1859 = arith.mulf %1858, %1 {timing = #hls.t<236 -> 240, 4, 1>} : f32
        %1860 = affine.load %arg4[%arg6 * 64 + 232] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<238 -> 240, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1861 = arith.addf %1859, %1860 {timing = #hls.t<240 -> 245, 5, 1>} : f32
        affine.store %1861, %arg4[%arg6 * 64 + 232] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<245 -> 246, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1862 = affine.load %arg0[%arg6 * 64 + 232, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<233 -> 235, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1863 = arith.mulf %1862, %6 {timing = #hls.t<236 -> 240, 4, 1>} : f32
        %1864 = affine.load %arg2[%arg6 * 64 + 232] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<238 -> 240, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1865 = arith.addf %1863, %1864 {timing = #hls.t<240 -> 245, 5, 1>} : f32
        affine.store %1865, %arg2[%arg6 * 64 + 232] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<245 -> 246, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1866 = affine.load %arg0[%arg5, %arg6 * 64 + 233] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<234 -> 236, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1867 = arith.mulf %1866, %1 {timing = #hls.t<237 -> 241, 4, 1>} : f32
        %1868 = affine.load %arg4[%arg6 * 64 + 233] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<239 -> 241, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1869 = arith.addf %1867, %1868 {timing = #hls.t<241 -> 246, 5, 1>} : f32
        affine.store %1869, %arg4[%arg6 * 64 + 233] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<246 -> 247, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1870 = affine.load %arg0[%arg6 * 64 + 233, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<235 -> 237, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1871 = arith.mulf %1870, %6 {timing = #hls.t<237 -> 241, 4, 1>} : f32
        %1872 = affine.load %arg2[%arg6 * 64 + 233] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<239 -> 241, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1873 = arith.addf %1871, %1872 {timing = #hls.t<241 -> 246, 5, 1>} : f32
        affine.store %1873, %arg2[%arg6 * 64 + 233] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<246 -> 247, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1874 = affine.load %arg0[%arg5, %arg6 * 64 + 234] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<234 -> 236, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1875 = arith.mulf %1874, %1 {timing = #hls.t<238 -> 242, 4, 1>} : f32
        %1876 = affine.load %arg4[%arg6 * 64 + 234] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<240 -> 242, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1877 = arith.addf %1875, %1876 {timing = #hls.t<242 -> 247, 5, 1>} : f32
        affine.store %1877, %arg4[%arg6 * 64 + 234] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<247 -> 248, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1878 = affine.load %arg0[%arg6 * 64 + 234, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<235 -> 237, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1879 = arith.mulf %1878, %6 {timing = #hls.t<238 -> 242, 4, 1>} : f32
        %1880 = affine.load %arg2[%arg6 * 64 + 234] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<240 -> 242, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1881 = arith.addf %1879, %1880 {timing = #hls.t<242 -> 247, 5, 1>} : f32
        affine.store %1881, %arg2[%arg6 * 64 + 234] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<247 -> 248, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1882 = affine.load %arg0[%arg5, %arg6 * 64 + 235] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<236 -> 238, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1883 = arith.mulf %1882, %1 {timing = #hls.t<239 -> 243, 4, 1>} : f32
        %1884 = affine.load %arg4[%arg6 * 64 + 235] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<241 -> 243, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1885 = arith.addf %1883, %1884 {timing = #hls.t<243 -> 248, 5, 1>} : f32
        affine.store %1885, %arg4[%arg6 * 64 + 235] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<248 -> 249, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1886 = affine.load %arg0[%arg6 * 64 + 235, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<237 -> 239, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1887 = arith.mulf %1886, %6 {timing = #hls.t<239 -> 243, 4, 1>} : f32
        %1888 = affine.load %arg2[%arg6 * 64 + 235] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<241 -> 243, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1889 = arith.addf %1887, %1888 {timing = #hls.t<243 -> 248, 5, 1>} : f32
        affine.store %1889, %arg2[%arg6 * 64 + 235] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<248 -> 249, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1890 = affine.load %arg0[%arg5, %arg6 * 64 + 236] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<236 -> 238, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1891 = arith.mulf %1890, %1 {timing = #hls.t<240 -> 244, 4, 1>} : f32
        %1892 = affine.load %arg4[%arg6 * 64 + 236] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<242 -> 244, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1893 = arith.addf %1891, %1892 {timing = #hls.t<244 -> 249, 5, 1>} : f32
        affine.store %1893, %arg4[%arg6 * 64 + 236] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<249 -> 250, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1894 = affine.load %arg0[%arg6 * 64 + 236, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<237 -> 239, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1895 = arith.mulf %1894, %6 {timing = #hls.t<240 -> 244, 4, 1>} : f32
        %1896 = affine.load %arg2[%arg6 * 64 + 236] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<242 -> 244, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1897 = arith.addf %1895, %1896 {timing = #hls.t<244 -> 249, 5, 1>} : f32
        affine.store %1897, %arg2[%arg6 * 64 + 236] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<249 -> 250, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1898 = affine.load %arg0[%arg5, %arg6 * 64 + 237] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<238 -> 240, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1899 = arith.mulf %1898, %1 {timing = #hls.t<241 -> 245, 4, 1>} : f32
        %1900 = affine.load %arg4[%arg6 * 64 + 237] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<243 -> 245, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1901 = arith.addf %1899, %1900 {timing = #hls.t<245 -> 250, 5, 1>} : f32
        affine.store %1901, %arg4[%arg6 * 64 + 237] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<250 -> 251, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1902 = affine.load %arg0[%arg6 * 64 + 237, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<239 -> 241, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1903 = arith.mulf %1902, %6 {timing = #hls.t<241 -> 245, 4, 1>} : f32
        %1904 = affine.load %arg2[%arg6 * 64 + 237] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<243 -> 245, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1905 = arith.addf %1903, %1904 {timing = #hls.t<245 -> 250, 5, 1>} : f32
        affine.store %1905, %arg2[%arg6 * 64 + 237] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<250 -> 251, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1906 = affine.load %arg0[%arg5, %arg6 * 64 + 238] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<238 -> 240, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1907 = arith.mulf %1906, %1 {timing = #hls.t<242 -> 246, 4, 1>} : f32
        %1908 = affine.load %arg4[%arg6 * 64 + 238] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<244 -> 246, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1909 = arith.addf %1907, %1908 {timing = #hls.t<246 -> 251, 5, 1>} : f32
        affine.store %1909, %arg4[%arg6 * 64 + 238] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<251 -> 252, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1910 = affine.load %arg0[%arg6 * 64 + 238, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<239 -> 241, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1911 = arith.mulf %1910, %6 {timing = #hls.t<242 -> 246, 4, 1>} : f32
        %1912 = affine.load %arg2[%arg6 * 64 + 238] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<244 -> 246, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1913 = arith.addf %1911, %1912 {timing = #hls.t<246 -> 251, 5, 1>} : f32
        affine.store %1913, %arg2[%arg6 * 64 + 238] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<251 -> 252, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1914 = affine.load %arg0[%arg5, %arg6 * 64 + 239] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<240 -> 242, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1915 = arith.mulf %1914, %1 {timing = #hls.t<243 -> 247, 4, 1>} : f32
        %1916 = affine.load %arg4[%arg6 * 64 + 239] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<245 -> 247, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1917 = arith.addf %1915, %1916 {timing = #hls.t<247 -> 252, 5, 1>} : f32
        affine.store %1917, %arg4[%arg6 * 64 + 239] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<252 -> 253, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1918 = affine.load %arg0[%arg6 * 64 + 239, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<241 -> 243, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1919 = arith.mulf %1918, %6 {timing = #hls.t<243 -> 247, 4, 1>} : f32
        %1920 = affine.load %arg2[%arg6 * 64 + 239] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<245 -> 247, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1921 = arith.addf %1919, %1920 {timing = #hls.t<247 -> 252, 5, 1>} : f32
        affine.store %1921, %arg2[%arg6 * 64 + 239] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<252 -> 253, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1922 = affine.load %arg0[%arg5, %arg6 * 64 + 240] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<240 -> 242, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1923 = arith.mulf %1922, %1 {timing = #hls.t<244 -> 248, 4, 1>} : f32
        %1924 = affine.load %arg4[%arg6 * 64 + 240] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<246 -> 248, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1925 = arith.addf %1923, %1924 {timing = #hls.t<248 -> 253, 5, 1>} : f32
        affine.store %1925, %arg4[%arg6 * 64 + 240] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<253 -> 254, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1926 = affine.load %arg0[%arg6 * 64 + 240, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<241 -> 243, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1927 = arith.mulf %1926, %6 {timing = #hls.t<244 -> 248, 4, 1>} : f32
        %1928 = affine.load %arg2[%arg6 * 64 + 240] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<246 -> 248, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1929 = arith.addf %1927, %1928 {timing = #hls.t<248 -> 253, 5, 1>} : f32
        affine.store %1929, %arg2[%arg6 * 64 + 240] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<253 -> 254, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1930 = affine.load %arg0[%arg5, %arg6 * 64 + 241] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<242 -> 244, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1931 = arith.mulf %1930, %1 {timing = #hls.t<245 -> 249, 4, 1>} : f32
        %1932 = affine.load %arg4[%arg6 * 64 + 241] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<247 -> 249, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1933 = arith.addf %1931, %1932 {timing = #hls.t<249 -> 254, 5, 1>} : f32
        affine.store %1933, %arg4[%arg6 * 64 + 241] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<254 -> 255, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1934 = affine.load %arg0[%arg6 * 64 + 241, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<243 -> 245, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1935 = arith.mulf %1934, %6 {timing = #hls.t<245 -> 249, 4, 1>} : f32
        %1936 = affine.load %arg2[%arg6 * 64 + 241] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<247 -> 249, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1937 = arith.addf %1935, %1936 {timing = #hls.t<249 -> 254, 5, 1>} : f32
        affine.store %1937, %arg2[%arg6 * 64 + 241] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<254 -> 255, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1938 = affine.load %arg0[%arg5, %arg6 * 64 + 242] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<242 -> 244, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1939 = arith.mulf %1938, %1 {timing = #hls.t<246 -> 250, 4, 1>} : f32
        %1940 = affine.load %arg4[%arg6 * 64 + 242] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<248 -> 250, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1941 = arith.addf %1939, %1940 {timing = #hls.t<250 -> 255, 5, 1>} : f32
        affine.store %1941, %arg4[%arg6 * 64 + 242] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<255 -> 256, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1942 = affine.load %arg0[%arg6 * 64 + 242, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<243 -> 245, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1943 = arith.mulf %1942, %6 {timing = #hls.t<246 -> 250, 4, 1>} : f32
        %1944 = affine.load %arg2[%arg6 * 64 + 242] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<248 -> 250, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1945 = arith.addf %1943, %1944 {timing = #hls.t<250 -> 255, 5, 1>} : f32
        affine.store %1945, %arg2[%arg6 * 64 + 242] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<255 -> 256, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1946 = affine.load %arg0[%arg5, %arg6 * 64 + 243] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<244 -> 246, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1947 = arith.mulf %1946, %1 {timing = #hls.t<247 -> 251, 4, 1>} : f32
        %1948 = affine.load %arg4[%arg6 * 64 + 243] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<249 -> 251, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1949 = arith.addf %1947, %1948 {timing = #hls.t<251 -> 256, 5, 1>} : f32
        affine.store %1949, %arg4[%arg6 * 64 + 243] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<256 -> 257, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1950 = affine.load %arg0[%arg6 * 64 + 243, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<245 -> 247, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1951 = arith.mulf %1950, %6 {timing = #hls.t<247 -> 251, 4, 1>} : f32
        %1952 = affine.load %arg2[%arg6 * 64 + 243] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<249 -> 251, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1953 = arith.addf %1951, %1952 {timing = #hls.t<251 -> 256, 5, 1>} : f32
        affine.store %1953, %arg2[%arg6 * 64 + 243] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<256 -> 257, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1954 = affine.load %arg0[%arg5, %arg6 * 64 + 244] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<244 -> 246, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1955 = arith.mulf %1954, %1 {timing = #hls.t<248 -> 252, 4, 1>} : f32
        %1956 = affine.load %arg4[%arg6 * 64 + 244] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<250 -> 252, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1957 = arith.addf %1955, %1956 {timing = #hls.t<252 -> 257, 5, 1>} : f32
        affine.store %1957, %arg4[%arg6 * 64 + 244] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<257 -> 258, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1958 = affine.load %arg0[%arg6 * 64 + 244, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<245 -> 247, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1959 = arith.mulf %1958, %6 {timing = #hls.t<248 -> 252, 4, 1>} : f32
        %1960 = affine.load %arg2[%arg6 * 64 + 244] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<250 -> 252, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1961 = arith.addf %1959, %1960 {timing = #hls.t<252 -> 257, 5, 1>} : f32
        affine.store %1961, %arg2[%arg6 * 64 + 244] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<257 -> 258, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1962 = affine.load %arg0[%arg5, %arg6 * 64 + 245] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<246 -> 248, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1963 = arith.mulf %1962, %1 {timing = #hls.t<249 -> 253, 4, 1>} : f32
        %1964 = affine.load %arg4[%arg6 * 64 + 245] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<251 -> 253, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1965 = arith.addf %1963, %1964 {timing = #hls.t<253 -> 258, 5, 1>} : f32
        affine.store %1965, %arg4[%arg6 * 64 + 245] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<258 -> 259, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1966 = affine.load %arg0[%arg6 * 64 + 245, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<247 -> 249, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1967 = arith.mulf %1966, %6 {timing = #hls.t<249 -> 253, 4, 1>} : f32
        %1968 = affine.load %arg2[%arg6 * 64 + 245] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<251 -> 253, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1969 = arith.addf %1967, %1968 {timing = #hls.t<253 -> 258, 5, 1>} : f32
        affine.store %1969, %arg2[%arg6 * 64 + 245] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<258 -> 259, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1970 = affine.load %arg0[%arg5, %arg6 * 64 + 246] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<246 -> 248, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1971 = arith.mulf %1970, %1 {timing = #hls.t<250 -> 254, 4, 1>} : f32
        %1972 = affine.load %arg4[%arg6 * 64 + 246] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<252 -> 254, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1973 = arith.addf %1971, %1972 {timing = #hls.t<254 -> 259, 5, 1>} : f32
        affine.store %1973, %arg4[%arg6 * 64 + 246] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<259 -> 260, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1974 = affine.load %arg0[%arg6 * 64 + 246, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<247 -> 249, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1975 = arith.mulf %1974, %6 {timing = #hls.t<250 -> 254, 4, 1>} : f32
        %1976 = affine.load %arg2[%arg6 * 64 + 246] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<252 -> 254, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1977 = arith.addf %1975, %1976 {timing = #hls.t<254 -> 259, 5, 1>} : f32
        affine.store %1977, %arg2[%arg6 * 64 + 246] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<259 -> 260, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1978 = affine.load %arg0[%arg5, %arg6 * 64 + 247] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<248 -> 250, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1979 = arith.mulf %1978, %1 {timing = #hls.t<251 -> 255, 4, 1>} : f32
        %1980 = affine.load %arg4[%arg6 * 64 + 247] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<253 -> 255, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1981 = arith.addf %1979, %1980 {timing = #hls.t<255 -> 260, 5, 1>} : f32
        affine.store %1981, %arg4[%arg6 * 64 + 247] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<260 -> 261, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1982 = affine.load %arg0[%arg6 * 64 + 247, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<249 -> 251, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1983 = arith.mulf %1982, %6 {timing = #hls.t<251 -> 255, 4, 1>} : f32
        %1984 = affine.load %arg2[%arg6 * 64 + 247] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<253 -> 255, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1985 = arith.addf %1983, %1984 {timing = #hls.t<255 -> 260, 5, 1>} : f32
        affine.store %1985, %arg2[%arg6 * 64 + 247] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<260 -> 261, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1986 = affine.load %arg0[%arg5, %arg6 * 64 + 248] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<248 -> 250, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1987 = arith.mulf %1986, %1 {timing = #hls.t<252 -> 256, 4, 1>} : f32
        %1988 = affine.load %arg4[%arg6 * 64 + 248] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<254 -> 256, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1989 = arith.addf %1987, %1988 {timing = #hls.t<256 -> 261, 5, 1>} : f32
        affine.store %1989, %arg4[%arg6 * 64 + 248] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<261 -> 262, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1990 = affine.load %arg0[%arg6 * 64 + 248, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<249 -> 251, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1991 = arith.mulf %1990, %6 {timing = #hls.t<252 -> 256, 4, 1>} : f32
        %1992 = affine.load %arg2[%arg6 * 64 + 248] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<254 -> 256, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1993 = arith.addf %1991, %1992 {timing = #hls.t<256 -> 261, 5, 1>} : f32
        affine.store %1993, %arg2[%arg6 * 64 + 248] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<261 -> 262, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1994 = affine.load %arg0[%arg5, %arg6 * 64 + 249] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<250 -> 252, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1995 = arith.mulf %1994, %1 {timing = #hls.t<253 -> 257, 4, 1>} : f32
        %1996 = affine.load %arg4[%arg6 * 64 + 249] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<255 -> 257, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1997 = arith.addf %1995, %1996 {timing = #hls.t<257 -> 262, 5, 1>} : f32
        affine.store %1997, %arg4[%arg6 * 64 + 249] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<262 -> 263, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %1998 = affine.load %arg0[%arg6 * 64 + 249, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<251 -> 253, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1999 = arith.mulf %1998, %6 {timing = #hls.t<253 -> 257, 4, 1>} : f32
        %2000 = affine.load %arg2[%arg6 * 64 + 249] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<255 -> 257, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2001 = arith.addf %1999, %2000 {timing = #hls.t<257 -> 262, 5, 1>} : f32
        affine.store %2001, %arg2[%arg6 * 64 + 249] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<262 -> 263, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2002 = affine.load %arg0[%arg5, %arg6 * 64 + 250] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<250 -> 252, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2003 = arith.mulf %2002, %1 {timing = #hls.t<254 -> 258, 4, 1>} : f32
        %2004 = affine.load %arg4[%arg6 * 64 + 250] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<256 -> 258, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2005 = arith.addf %2003, %2004 {timing = #hls.t<258 -> 263, 5, 1>} : f32
        affine.store %2005, %arg4[%arg6 * 64 + 250] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<263 -> 264, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2006 = affine.load %arg0[%arg6 * 64 + 250, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<251 -> 253, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2007 = arith.mulf %2006, %6 {timing = #hls.t<254 -> 258, 4, 1>} : f32
        %2008 = affine.load %arg2[%arg6 * 64 + 250] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<256 -> 258, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2009 = arith.addf %2007, %2008 {timing = #hls.t<258 -> 263, 5, 1>} : f32
        affine.store %2009, %arg2[%arg6 * 64 + 250] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<263 -> 264, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2010 = affine.load %arg0[%arg5, %arg6 * 64 + 251] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<252 -> 254, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2011 = arith.mulf %2010, %1 {timing = #hls.t<255 -> 259, 4, 1>} : f32
        %2012 = affine.load %arg4[%arg6 * 64 + 251] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<257 -> 259, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2013 = arith.addf %2011, %2012 {timing = #hls.t<259 -> 264, 5, 1>} : f32
        affine.store %2013, %arg4[%arg6 * 64 + 251] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<264 -> 265, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2014 = affine.load %arg0[%arg6 * 64 + 251, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<253 -> 255, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2015 = arith.mulf %2014, %6 {timing = #hls.t<255 -> 259, 4, 1>} : f32
        %2016 = affine.load %arg2[%arg6 * 64 + 251] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<257 -> 259, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2017 = arith.addf %2015, %2016 {timing = #hls.t<259 -> 264, 5, 1>} : f32
        affine.store %2017, %arg2[%arg6 * 64 + 251] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<264 -> 265, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2018 = affine.load %arg0[%arg5, %arg6 * 64 + 252] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<252 -> 254, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2019 = arith.mulf %2018, %1 {timing = #hls.t<256 -> 260, 4, 1>} : f32
        %2020 = affine.load %arg4[%arg6 * 64 + 252] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<258 -> 260, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2021 = arith.addf %2019, %2020 {timing = #hls.t<260 -> 265, 5, 1>} : f32
        affine.store %2021, %arg4[%arg6 * 64 + 252] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<265 -> 266, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2022 = affine.load %arg0[%arg6 * 64 + 252, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<253 -> 255, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2023 = arith.mulf %2022, %6 {timing = #hls.t<256 -> 260, 4, 1>} : f32
        %2024 = affine.load %arg2[%arg6 * 64 + 252] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<258 -> 260, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2025 = arith.addf %2023, %2024 {timing = #hls.t<260 -> 265, 5, 1>} : f32
        affine.store %2025, %arg2[%arg6 * 64 + 252] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<265 -> 266, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2026 = affine.load %arg0[%arg5, %arg6 * 64 + 253] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<254 -> 256, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2027 = arith.mulf %2026, %1 {timing = #hls.t<257 -> 261, 4, 1>} : f32
        %2028 = affine.load %arg4[%arg6 * 64 + 253] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<259 -> 261, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2029 = arith.addf %2027, %2028 {timing = #hls.t<261 -> 266, 5, 1>} : f32
        affine.store %2029, %arg4[%arg6 * 64 + 253] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<266 -> 267, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2030 = affine.load %arg0[%arg6 * 64 + 253, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<255 -> 257, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2031 = arith.mulf %2030, %6 {timing = #hls.t<257 -> 261, 4, 1>} : f32
        %2032 = affine.load %arg2[%arg6 * 64 + 253] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<259 -> 261, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2033 = arith.addf %2031, %2032 {timing = #hls.t<261 -> 266, 5, 1>} : f32
        affine.store %2033, %arg2[%arg6 * 64 + 253] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<266 -> 267, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2034 = affine.load %arg0[%arg5, %arg6 * 64 + 254] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<254 -> 256, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2035 = arith.mulf %2034, %1 {timing = #hls.t<258 -> 262, 4, 1>} : f32
        %2036 = affine.load %arg4[%arg6 * 64 + 254] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<260 -> 262, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2037 = arith.addf %2035, %2036 {timing = #hls.t<262 -> 267, 5, 1>} : f32
        affine.store %2037, %arg4[%arg6 * 64 + 254] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<267 -> 268, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2038 = affine.load %arg0[%arg6 * 64 + 254, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<255 -> 257, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2039 = arith.mulf %2038, %6 {timing = #hls.t<258 -> 262, 4, 1>} : f32
        %2040 = affine.load %arg2[%arg6 * 64 + 254] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<260 -> 262, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2041 = arith.addf %2039, %2040 {timing = #hls.t<262 -> 267, 5, 1>} : f32
        affine.store %2041, %arg2[%arg6 * 64 + 254] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<267 -> 268, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2042 = affine.load %arg0[%arg5, %arg6 * 64 + 255] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<256 -> 258, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2043 = arith.mulf %2042, %1 {timing = #hls.t<259 -> 263, 4, 1>} : f32
        %2044 = affine.load %arg4[%arg6 * 64 + 255] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<261 -> 263, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2045 = arith.addf %2043, %2044 {timing = #hls.t<263 -> 268, 5, 1>} : f32
        affine.store %2045, %arg4[%arg6 * 64 + 255] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<268 -> 269, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2046 = affine.load %arg0[%arg6 * 64 + 255, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<257 -> 259, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %2047 = arith.mulf %2046, %6 {timing = #hls.t<259 -> 263, 4, 1>} : f32
        %2048 = affine.load %arg2[%arg6 * 64 + 255] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<261 -> 263, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
        %2049 = arith.addf %2047, %2048 {timing = #hls.t<263 -> 268, 5, 1>} : f32
        affine.store %2049, %arg2[%arg6 * 64 + 255] {max_mux_size = 256 : i64, partition_indices = [-1], timing = #hls.t<268 -> 269, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 256, d0 floordiv 256)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=16, iterLatency=269, minII=257>, timing = #hls.t<0 -> 4126, 4126, 4126>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=65536, iterLatency=269, minII=257>, timing = #hls.t<0 -> 16842766, 16842766, 16842766>}
    return {timing = #hls.t<16842766 -> 16842766, 0, 0>}
  }
}