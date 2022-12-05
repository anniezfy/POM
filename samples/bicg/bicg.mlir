module {
  func @bicg(%arg0: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg1: memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg2: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg3: memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>) attributes {resource = #hls.r<lut=0, dsp=15, bram=0>, timing = #hls.t<0 -> 13107215, 13107215, 13107215>, top_func} {
    affine.for %arg5 = 0 to 2048 {
      affine.for %arg6 = 0 to 256 {
        %0 = affine.load %arg0[%arg5 * 2, %arg6 * 16] {partition_indices = [0, 0], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = affine.load %arg3[%arg5 * 2] {partition_indices = [0], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %3 = affine.load %arg4[%arg6 * 16] {partition_indices = [0], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %4, %arg4[%arg6 * 16] {partition_indices = [0], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %5 = affine.load %arg0[%arg6 * 16, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %6 = affine.load %arg1[%arg5] {max_mux_size = 2 : i64, partition_indices = [-1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %7 = arith.mulf %5, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %8 = affine.load %arg2[%arg6 * 16] {partition_indices = [0], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %9 = arith.addf %7, %8 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %9, %arg2[%arg6 * 16] {partition_indices = [0], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %10 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 1] {partition_indices = [0, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %11 = arith.mulf %10, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %12 = affine.load %arg4[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %13 = arith.addf %11, %12 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %13, %arg4[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %14 = affine.load %arg0[%arg6 * 16 + 1, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %15 = arith.mulf %14, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %16 = affine.load %arg2[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %17 = arith.addf %15, %16 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %17, %arg2[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %18 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 2] {partition_indices = [0, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %19 = arith.mulf %18, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %20 = affine.load %arg4[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %21 = arith.addf %19, %20 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %21, %arg4[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %22 = affine.load %arg0[%arg6 * 16 + 2, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %23 = arith.mulf %22, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %24 = affine.load %arg2[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %25 = arith.addf %23, %24 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %25, %arg2[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %26 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 3] {partition_indices = [0, 1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %27 = arith.mulf %26, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %28 = affine.load %arg4[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %29 = arith.addf %27, %28 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %29, %arg4[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %30 = affine.load %arg0[%arg6 * 16 + 3, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %31 = arith.mulf %30, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %32 = affine.load %arg2[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %33 = arith.addf %31, %32 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %33, %arg2[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %34 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 4] {partition_indices = [0, 0], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %35 = arith.mulf %34, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %36 = affine.load %arg4[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %37 = arith.addf %35, %36 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %37, %arg4[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %38 = affine.load %arg0[%arg6 * 16 + 4, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %39 = arith.mulf %38, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %40 = affine.load %arg2[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %41 = arith.addf %39, %40 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %41, %arg2[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %42 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 5] {partition_indices = [0, 1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %43 = arith.mulf %42, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %44 = affine.load %arg4[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %45 = arith.addf %43, %44 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %45, %arg4[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %46 = affine.load %arg0[%arg6 * 16 + 5, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %47 = arith.mulf %46, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %48 = affine.load %arg2[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %49 = arith.addf %47, %48 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %49, %arg2[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %50 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 6] {partition_indices = [0, 0], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %51 = arith.mulf %50, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %52 = affine.load %arg4[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %53 = arith.addf %51, %52 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %53, %arg4[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %54 = affine.load %arg0[%arg6 * 16 + 6, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %55 = arith.mulf %54, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %56 = affine.load %arg2[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %57 = arith.addf %55, %56 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %57, %arg2[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %58 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 7] {partition_indices = [0, 1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %59 = arith.mulf %58, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %60 = affine.load %arg4[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %61 = arith.addf %59, %60 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %61, %arg4[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %62 = affine.load %arg0[%arg6 * 16 + 7, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %63 = arith.mulf %62, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %64 = affine.load %arg2[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %65 = arith.addf %63, %64 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %65, %arg2[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %66 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 8] {partition_indices = [0, 0], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %67 = arith.mulf %66, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %68 = affine.load %arg4[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %69 = arith.addf %67, %68 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %69, %arg4[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %70 = affine.load %arg0[%arg6 * 16 + 8, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %71 = arith.mulf %70, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %72 = affine.load %arg2[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %73 = arith.addf %71, %72 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %73, %arg2[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %74 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 9] {partition_indices = [0, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %75 = arith.mulf %74, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %76 = affine.load %arg4[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %77 = arith.addf %75, %76 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %77, %arg4[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %78 = affine.load %arg0[%arg6 * 16 + 9, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %79 = arith.mulf %78, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %80 = affine.load %arg2[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %81 = arith.addf %79, %80 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %81, %arg2[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %82 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 10] {partition_indices = [0, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %83 = arith.mulf %82, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %84 = affine.load %arg4[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %85 = arith.addf %83, %84 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %85, %arg4[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %86 = affine.load %arg0[%arg6 * 16 + 10, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %87 = arith.mulf %86, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %88 = affine.load %arg2[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %89 = arith.addf %87, %88 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %89, %arg2[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %90 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 11] {partition_indices = [0, 1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %91 = arith.mulf %90, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %92 = affine.load %arg4[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %93 = arith.addf %91, %92 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %93, %arg4[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %94 = affine.load %arg0[%arg6 * 16 + 11, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %95 = arith.mulf %94, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %96 = affine.load %arg2[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %97 = arith.addf %95, %96 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %97, %arg2[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %98 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 12] {partition_indices = [0, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %99 = arith.mulf %98, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %100 = affine.load %arg4[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %101 = arith.addf %99, %100 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %101, %arg4[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %102 = affine.load %arg0[%arg6 * 16 + 12, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %103 = arith.mulf %102, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %104 = affine.load %arg2[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %105 = arith.addf %103, %104 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %105, %arg2[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %106 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 13] {partition_indices = [0, 1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %107 = arith.mulf %106, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %108 = affine.load %arg4[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %109 = arith.addf %107, %108 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %109, %arg4[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %110 = affine.load %arg0[%arg6 * 16 + 13, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %111 = arith.mulf %110, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %112 = affine.load %arg2[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %113 = arith.addf %111, %112 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %113, %arg2[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %114 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 14] {partition_indices = [0, 0], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %115 = arith.mulf %114, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %116 = affine.load %arg4[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %117 = arith.addf %115, %116 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %117, %arg4[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %118 = affine.load %arg0[%arg6 * 16 + 14, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %119 = arith.mulf %118, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %120 = affine.load %arg2[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %121 = arith.addf %119, %120 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %121, %arg2[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %122 = affine.load %arg0[%arg5 * 2, %arg6 * 16 + 15] {partition_indices = [0, 1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %123 = arith.mulf %122, %1 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %124 = affine.load %arg4[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %125 = arith.addf %123, %124 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %125, %arg4[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %126 = affine.load %arg0[%arg6 * 16 + 15, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %127 = arith.mulf %126, %6 {timing = #hls.t<14 -> 18, 4, 1>} : f32
        %128 = affine.load %arg2[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %129 = arith.addf %127, %128 {timing = #hls.t<9 -> 14, 5, 1>} : f32
        affine.store %129, %arg2[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %130 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16] {partition_indices = [1, 0], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %131 = affine.load %arg3[%arg5 * 2 + 1] {partition_indices = [1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %132 = arith.mulf %130, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %133 = affine.load %arg4[%arg6 * 16] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %134 = arith.addf %132, %133 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %134, %arg4[%arg6 * 16] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %135 = affine.load %arg0[%arg6 * 16, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %136 = affine.load %arg1[%arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [-1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>>
        %137 = arith.mulf %135, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %138 = affine.load %arg2[%arg6 * 16] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %139 = arith.addf %137, %138 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %139, %arg2[%arg6 * 16] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %140 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 1] {partition_indices = [1, 1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %141 = arith.mulf %140, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %142 = affine.load %arg4[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %143 = arith.addf %141, %142 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %143, %arg4[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %144 = affine.load %arg0[%arg6 * 16 + 1, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %145 = arith.mulf %144, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %146 = affine.load %arg2[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %147 = arith.addf %145, %146 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %147, %arg2[%arg6 * 16 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %148 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 2] {partition_indices = [1, 0], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %149 = arith.mulf %148, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %150 = affine.load %arg4[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %151 = arith.addf %149, %150 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %151, %arg4[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %152 = affine.load %arg0[%arg6 * 16 + 2, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %153 = arith.mulf %152, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %154 = affine.load %arg2[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %155 = arith.addf %153, %154 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %155, %arg2[%arg6 * 16 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %156 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 3] {partition_indices = [1, 1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %157 = arith.mulf %156, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %158 = affine.load %arg4[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %159 = arith.addf %157, %158 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %159, %arg4[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %160 = affine.load %arg0[%arg6 * 16 + 3, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %161 = arith.mulf %160, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %162 = affine.load %arg2[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %163 = arith.addf %161, %162 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %163, %arg2[%arg6 * 16 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %164 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 4] {partition_indices = [1, 0], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %165 = arith.mulf %164, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %166 = affine.load %arg4[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %167 = arith.addf %165, %166 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %167, %arg4[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %168 = affine.load %arg0[%arg6 * 16 + 4, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %169 = arith.mulf %168, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %170 = affine.load %arg2[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %171 = arith.addf %169, %170 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %171, %arg2[%arg6 * 16 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %172 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 5] {partition_indices = [1, 1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %173 = arith.mulf %172, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %174 = affine.load %arg4[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %175 = arith.addf %173, %174 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %175, %arg4[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %176 = affine.load %arg0[%arg6 * 16 + 5, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %177 = arith.mulf %176, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %178 = affine.load %arg2[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %179 = arith.addf %177, %178 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %179, %arg2[%arg6 * 16 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %180 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 6] {partition_indices = [1, 0], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %181 = arith.mulf %180, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %182 = affine.load %arg4[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %183 = arith.addf %181, %182 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %183, %arg4[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %184 = affine.load %arg0[%arg6 * 16 + 6, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %185 = arith.mulf %184, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %186 = affine.load %arg2[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %187 = arith.addf %185, %186 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %187, %arg2[%arg6 * 16 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %188 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 7] {partition_indices = [1, 1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %189 = arith.mulf %188, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %190 = affine.load %arg4[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %191 = arith.addf %189, %190 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %191, %arg4[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %192 = affine.load %arg0[%arg6 * 16 + 7, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %193 = arith.mulf %192, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %194 = affine.load %arg2[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %195 = arith.addf %193, %194 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %195, %arg2[%arg6 * 16 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %196 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 8] {partition_indices = [1, 0], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %197 = arith.mulf %196, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %198 = affine.load %arg4[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %199 = arith.addf %197, %198 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %199, %arg4[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %200 = affine.load %arg0[%arg6 * 16 + 8, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %201 = arith.mulf %200, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %202 = affine.load %arg2[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %203 = arith.addf %201, %202 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %203, %arg2[%arg6 * 16 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %204 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 9] {partition_indices = [1, 1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %205 = arith.mulf %204, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %206 = affine.load %arg4[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %207 = arith.addf %205, %206 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %207, %arg4[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %208 = affine.load %arg0[%arg6 * 16 + 9, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %209 = arith.mulf %208, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %210 = affine.load %arg2[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %211 = arith.addf %209, %210 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %211, %arg2[%arg6 * 16 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %212 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 10] {partition_indices = [1, 0], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %213 = arith.mulf %212, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %214 = affine.load %arg4[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %215 = arith.addf %213, %214 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %215, %arg4[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %216 = affine.load %arg0[%arg6 * 16 + 10, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %217 = arith.mulf %216, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %218 = affine.load %arg2[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %219 = arith.addf %217, %218 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %219, %arg2[%arg6 * 16 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %220 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 11] {partition_indices = [1, 1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %221 = arith.mulf %220, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %222 = affine.load %arg4[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %223 = arith.addf %221, %222 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %223, %arg4[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %224 = affine.load %arg0[%arg6 * 16 + 11, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %225 = arith.mulf %224, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %226 = affine.load %arg2[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %227 = arith.addf %225, %226 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %227, %arg2[%arg6 * 16 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %228 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 12] {partition_indices = [1, 0], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %229 = arith.mulf %228, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %230 = affine.load %arg4[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %231 = arith.addf %229, %230 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %231, %arg4[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %232 = affine.load %arg0[%arg6 * 16 + 12, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %233 = arith.mulf %232, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %234 = affine.load %arg2[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %235 = arith.addf %233, %234 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %235, %arg2[%arg6 * 16 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %236 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 13] {partition_indices = [1, 1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %237 = arith.mulf %236, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %238 = affine.load %arg4[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %239 = arith.addf %237, %238 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %239, %arg4[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %240 = affine.load %arg0[%arg6 * 16 + 13, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %241 = arith.mulf %240, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %242 = affine.load %arg2[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %243 = arith.addf %241, %242 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %243, %arg2[%arg6 * 16 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %244 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 14] {partition_indices = [1, 0], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %245 = arith.mulf %244, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %246 = affine.load %arg4[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %247 = arith.addf %245, %246 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %247, %arg4[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %248 = affine.load %arg0[%arg6 * 16 + 14, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %249 = arith.mulf %248, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %250 = affine.load %arg2[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %251 = arith.addf %249, %250 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %251, %arg2[%arg6 * 16 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %252 = affine.load %arg0[%arg5 * 2 + 1, %arg6 * 16 + 15] {partition_indices = [1, 1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %253 = arith.mulf %252, %131 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %254 = affine.load %arg4[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %255 = arith.addf %253, %254 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %255, %arg4[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %256 = affine.load %arg0[%arg6 * 16 + 15, %arg5 + 1] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %257 = arith.mulf %256, %136 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %258 = affine.load %arg2[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %259 = arith.addf %257, %258 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %259, %arg2[%arg6 * 16 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=256, iterLatency=36, minII=25>, parallel, timing = #hls.t<0 -> 6413, 6413, 6413>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=524288, iterLatency=36, minII=25>, resource = #hls.r<lut=0, dsp=15, bram=0>, timing = #hls.t<0 -> 13107213, 13107213, 13107213>}
    return
  }
}