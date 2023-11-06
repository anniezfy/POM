module {
  func @bicg_4096(%arg0: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>, %arg1: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg2: memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>, %arg3: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>) attributes {resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 17825807, 17825807, 17825807>, top_func} {
    affine.for %arg5 = 0 to 4096 {
      affine.for %arg6 = 0 to 128 {
        %0 = affine.load %arg0[%arg5, %arg6 * 32] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<43 -> 45, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %1 = affine.load %arg3[%arg5] {partition_indices = [0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %3 = affine.load %arg4[%arg6 * 32] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %4, %arg4[%arg6 * 32] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %5 = affine.load %arg0[%arg6 * 32, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<42 -> 44, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %6 = affine.load %arg1[%arg5] {partition_indices = [0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %7 = arith.mulf %5, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %8 = affine.load %arg2[%arg6 * 32] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %9 = arith.addf %7, %8 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %9, %arg2[%arg6 * 32] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %10 = affine.load %arg0[%arg5, %arg6 * 32 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %11 = arith.mulf %10, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %12 = affine.load %arg4[%arg6 * 32 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %13 = arith.addf %11, %12 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %13, %arg4[%arg6 * 32 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %14 = affine.load %arg0[%arg6 * 32 + 1, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %15 = arith.mulf %14, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %16 = affine.load %arg2[%arg6 * 32 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %17 = arith.addf %15, %16 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %17, %arg2[%arg6 * 32 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %18 = affine.load %arg0[%arg5, %arg6 * 32 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %19 = arith.mulf %18, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %20 = affine.load %arg4[%arg6 * 32 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %21 = arith.addf %19, %20 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %21, %arg4[%arg6 * 32 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %22 = affine.load %arg0[%arg6 * 32 + 2, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %23 = arith.mulf %22, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %24 = affine.load %arg2[%arg6 * 32 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %25 = arith.addf %23, %24 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %25, %arg2[%arg6 * 32 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %26 = affine.load %arg0[%arg5, %arg6 * 32 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %27 = arith.mulf %26, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %28 = affine.load %arg4[%arg6 * 32 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %29 = arith.addf %27, %28 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %29, %arg4[%arg6 * 32 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %30 = affine.load %arg0[%arg6 * 32 + 3, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %31 = arith.mulf %30, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %32 = affine.load %arg2[%arg6 * 32 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %33 = arith.addf %31, %32 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %33, %arg2[%arg6 * 32 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %34 = affine.load %arg0[%arg5, %arg6 * 32 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %35 = arith.mulf %34, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %36 = affine.load %arg4[%arg6 * 32 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %37 = arith.addf %35, %36 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %37, %arg4[%arg6 * 32 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %38 = affine.load %arg0[%arg6 * 32 + 4, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %39 = arith.mulf %38, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %40 = affine.load %arg2[%arg6 * 32 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %41 = arith.addf %39, %40 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %41, %arg2[%arg6 * 32 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %42 = affine.load %arg0[%arg5, %arg6 * 32 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %43 = arith.mulf %42, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %44 = affine.load %arg4[%arg6 * 32 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %45 = arith.addf %43, %44 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %45, %arg4[%arg6 * 32 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %46 = affine.load %arg0[%arg6 * 32 + 5, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<36 -> 38, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %47 = arith.mulf %46, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %48 = affine.load %arg2[%arg6 * 32 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %49 = arith.addf %47, %48 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %49, %arg2[%arg6 * 32 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %50 = affine.load %arg0[%arg5, %arg6 * 32 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %51 = arith.mulf %50, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %52 = affine.load %arg4[%arg6 * 32 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %53 = arith.addf %51, %52 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %53, %arg4[%arg6 * 32 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %54 = affine.load %arg0[%arg6 * 32 + 6, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<36 -> 38, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %55 = arith.mulf %54, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %56 = affine.load %arg2[%arg6 * 32 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %57 = arith.addf %55, %56 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %57, %arg2[%arg6 * 32 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %58 = affine.load %arg0[%arg5, %arg6 * 32 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<35 -> 37, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %59 = arith.mulf %58, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %60 = affine.load %arg4[%arg6 * 32 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %61 = arith.addf %59, %60 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %61, %arg4[%arg6 * 32 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %62 = affine.load %arg0[%arg6 * 32 + 7, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %63 = arith.mulf %62, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %64 = affine.load %arg2[%arg6 * 32 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %65 = arith.addf %63, %64 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %65, %arg2[%arg6 * 32 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %66 = affine.load %arg0[%arg5, %arg6 * 32 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<35 -> 37, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %67 = arith.mulf %66, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %68 = affine.load %arg4[%arg6 * 32 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %69 = arith.addf %67, %68 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %69, %arg4[%arg6 * 32 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %70 = affine.load %arg0[%arg6 * 32 + 8, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %71 = arith.mulf %70, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %72 = affine.load %arg2[%arg6 * 32 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %73 = arith.addf %71, %72 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %73, %arg2[%arg6 * 32 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %74 = affine.load %arg0[%arg5, %arg6 * 32 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %75 = arith.mulf %74, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %76 = affine.load %arg4[%arg6 * 32 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %77 = arith.addf %75, %76 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %77, %arg4[%arg6 * 32 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %78 = affine.load %arg0[%arg6 * 32 + 9, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %79 = arith.mulf %78, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %80 = affine.load %arg2[%arg6 * 32 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %81 = arith.addf %79, %80 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %81, %arg2[%arg6 * 32 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %82 = affine.load %arg0[%arg5, %arg6 * 32 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %83 = arith.mulf %82, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %84 = affine.load %arg4[%arg6 * 32 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %85 = arith.addf %83, %84 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %85, %arg4[%arg6 * 32 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %86 = affine.load %arg0[%arg6 * 32 + 10, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %87 = arith.mulf %86, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %88 = affine.load %arg2[%arg6 * 32 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %89 = arith.addf %87, %88 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %89, %arg2[%arg6 * 32 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %90 = affine.load %arg0[%arg5, %arg6 * 32 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %91 = arith.mulf %90, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %92 = affine.load %arg4[%arg6 * 32 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %93 = arith.addf %91, %92 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %93, %arg4[%arg6 * 32 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %94 = affine.load %arg0[%arg6 * 32 + 11, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %95 = arith.mulf %94, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %96 = affine.load %arg2[%arg6 * 32 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %97 = arith.addf %95, %96 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %97, %arg2[%arg6 * 32 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %98 = affine.load %arg0[%arg5, %arg6 * 32 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %99 = arith.mulf %98, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %100 = affine.load %arg4[%arg6 * 32 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %101 = arith.addf %99, %100 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %101, %arg4[%arg6 * 32 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %102 = affine.load %arg0[%arg6 * 32 + 12, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %103 = arith.mulf %102, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %104 = affine.load %arg2[%arg6 * 32 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %105 = arith.addf %103, %104 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %105, %arg2[%arg6 * 32 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %106 = affine.load %arg0[%arg5, %arg6 * 32 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %107 = arith.mulf %106, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %108 = affine.load %arg4[%arg6 * 32 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %109 = arith.addf %107, %108 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %109, %arg4[%arg6 * 32 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %110 = affine.load %arg0[%arg6 * 32 + 13, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %111 = arith.mulf %110, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %112 = affine.load %arg2[%arg6 * 32 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %113 = arith.addf %111, %112 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %113, %arg2[%arg6 * 32 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %114 = affine.load %arg0[%arg5, %arg6 * 32 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %115 = arith.mulf %114, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %116 = affine.load %arg4[%arg6 * 32 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %117 = arith.addf %115, %116 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %117, %arg4[%arg6 * 32 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %118 = affine.load %arg0[%arg6 * 32 + 14, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %119 = arith.mulf %118, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %120 = affine.load %arg2[%arg6 * 32 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %121 = arith.addf %119, %120 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %121, %arg2[%arg6 * 32 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %122 = affine.load %arg0[%arg5, %arg6 * 32 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %123 = arith.mulf %122, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %124 = affine.load %arg4[%arg6 * 32 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %125 = arith.addf %123, %124 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %125, %arg4[%arg6 * 32 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %126 = affine.load %arg0[%arg6 * 32 + 15, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %127 = arith.mulf %126, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %128 = affine.load %arg2[%arg6 * 32 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %129 = arith.addf %127, %128 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %129, %arg2[%arg6 * 32 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %130 = affine.load %arg0[%arg5, %arg6 * 32 + 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %131 = arith.mulf %130, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %132 = affine.load %arg4[%arg6 * 32 + 16] {partition_indices = [16], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %133 = arith.addf %131, %132 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %133, %arg4[%arg6 * 32 + 16] {partition_indices = [16], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %134 = affine.load %arg0[%arg6 * 32 + 16, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %135 = arith.mulf %134, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %136 = affine.load %arg2[%arg6 * 32 + 16] {partition_indices = [16], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %137 = arith.addf %135, %136 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %137, %arg2[%arg6 * 32 + 16] {partition_indices = [16], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %138 = affine.load %arg0[%arg5, %arg6 * 32 + 17] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %139 = arith.mulf %138, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %140 = affine.load %arg4[%arg6 * 32 + 17] {partition_indices = [17], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %141 = arith.addf %139, %140 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %141, %arg4[%arg6 * 32 + 17] {partition_indices = [17], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %142 = affine.load %arg0[%arg6 * 32 + 17, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %143 = arith.mulf %142, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %144 = affine.load %arg2[%arg6 * 32 + 17] {partition_indices = [17], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %145 = arith.addf %143, %144 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %145, %arg2[%arg6 * 32 + 17] {partition_indices = [17], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %146 = affine.load %arg0[%arg5, %arg6 * 32 + 18] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %147 = arith.mulf %146, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %148 = affine.load %arg4[%arg6 * 32 + 18] {partition_indices = [18], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %149 = arith.addf %147, %148 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %149, %arg4[%arg6 * 32 + 18] {partition_indices = [18], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %150 = affine.load %arg0[%arg6 * 32 + 18, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %151 = arith.mulf %150, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %152 = affine.load %arg2[%arg6 * 32 + 18] {partition_indices = [18], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %153 = arith.addf %151, %152 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %153, %arg2[%arg6 * 32 + 18] {partition_indices = [18], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %154 = affine.load %arg0[%arg5, %arg6 * 32 + 19] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %155 = arith.mulf %154, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %156 = affine.load %arg4[%arg6 * 32 + 19] {partition_indices = [19], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %157 = arith.addf %155, %156 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %157, %arg4[%arg6 * 32 + 19] {partition_indices = [19], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %158 = affine.load %arg0[%arg6 * 32 + 19, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %159 = arith.mulf %158, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %160 = affine.load %arg2[%arg6 * 32 + 19] {partition_indices = [19], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %161 = arith.addf %159, %160 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %161, %arg2[%arg6 * 32 + 19] {partition_indices = [19], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %162 = affine.load %arg0[%arg5, %arg6 * 32 + 20] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %163 = arith.mulf %162, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %164 = affine.load %arg4[%arg6 * 32 + 20] {partition_indices = [20], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %165 = arith.addf %163, %164 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %165, %arg4[%arg6 * 32 + 20] {partition_indices = [20], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %166 = affine.load %arg0[%arg6 * 32 + 20, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %167 = arith.mulf %166, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %168 = affine.load %arg2[%arg6 * 32 + 20] {partition_indices = [20], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %169 = arith.addf %167, %168 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %169, %arg2[%arg6 * 32 + 20] {partition_indices = [20], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %170 = affine.load %arg0[%arg5, %arg6 * 32 + 21] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %171 = arith.mulf %170, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %172 = affine.load %arg4[%arg6 * 32 + 21] {partition_indices = [21], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %173 = arith.addf %171, %172 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %173, %arg4[%arg6 * 32 + 21] {partition_indices = [21], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %174 = affine.load %arg0[%arg6 * 32 + 21, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %175 = arith.mulf %174, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %176 = affine.load %arg2[%arg6 * 32 + 21] {partition_indices = [21], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %177 = arith.addf %175, %176 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %177, %arg2[%arg6 * 32 + 21] {partition_indices = [21], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %178 = affine.load %arg0[%arg5, %arg6 * 32 + 22] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %179 = arith.mulf %178, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %180 = affine.load %arg4[%arg6 * 32 + 22] {partition_indices = [22], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %181 = arith.addf %179, %180 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %181, %arg4[%arg6 * 32 + 22] {partition_indices = [22], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %182 = affine.load %arg0[%arg6 * 32 + 22, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %183 = arith.mulf %182, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %184 = affine.load %arg2[%arg6 * 32 + 22] {partition_indices = [22], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %185 = arith.addf %183, %184 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %185, %arg2[%arg6 * 32 + 22] {partition_indices = [22], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %186 = affine.load %arg0[%arg5, %arg6 * 32 + 23] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %187 = arith.mulf %186, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %188 = affine.load %arg4[%arg6 * 32 + 23] {partition_indices = [23], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %189 = arith.addf %187, %188 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %189, %arg4[%arg6 * 32 + 23] {partition_indices = [23], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %190 = affine.load %arg0[%arg6 * 32 + 23, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %191 = arith.mulf %190, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %192 = affine.load %arg2[%arg6 * 32 + 23] {partition_indices = [23], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %193 = arith.addf %191, %192 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %193, %arg2[%arg6 * 32 + 23] {partition_indices = [23], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %194 = affine.load %arg0[%arg5, %arg6 * 32 + 24] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %195 = arith.mulf %194, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %196 = affine.load %arg4[%arg6 * 32 + 24] {partition_indices = [24], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %197 = arith.addf %195, %196 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %197, %arg4[%arg6 * 32 + 24] {partition_indices = [24], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %198 = affine.load %arg0[%arg6 * 32 + 24, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %199 = arith.mulf %198, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %200 = affine.load %arg2[%arg6 * 32 + 24] {partition_indices = [24], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %201 = arith.addf %199, %200 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %201, %arg2[%arg6 * 32 + 24] {partition_indices = [24], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %202 = affine.load %arg0[%arg5, %arg6 * 32 + 25] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %203 = arith.mulf %202, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %204 = affine.load %arg4[%arg6 * 32 + 25] {partition_indices = [25], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %205 = arith.addf %203, %204 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %205, %arg4[%arg6 * 32 + 25] {partition_indices = [25], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %206 = affine.load %arg0[%arg6 * 32 + 25, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %207 = arith.mulf %206, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %208 = affine.load %arg2[%arg6 * 32 + 25] {partition_indices = [25], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %209 = arith.addf %207, %208 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %209, %arg2[%arg6 * 32 + 25] {partition_indices = [25], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %210 = affine.load %arg0[%arg5, %arg6 * 32 + 26] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %211 = arith.mulf %210, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %212 = affine.load %arg4[%arg6 * 32 + 26] {partition_indices = [26], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %213 = arith.addf %211, %212 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %213, %arg4[%arg6 * 32 + 26] {partition_indices = [26], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %214 = affine.load %arg0[%arg6 * 32 + 26, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %215 = arith.mulf %214, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %216 = affine.load %arg2[%arg6 * 32 + 26] {partition_indices = [26], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %217 = arith.addf %215, %216 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %217, %arg2[%arg6 * 32 + 26] {partition_indices = [26], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %218 = affine.load %arg0[%arg5, %arg6 * 32 + 27] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %219 = arith.mulf %218, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %220 = affine.load %arg4[%arg6 * 32 + 27] {partition_indices = [27], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %221 = arith.addf %219, %220 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %221, %arg4[%arg6 * 32 + 27] {partition_indices = [27], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %222 = affine.load %arg0[%arg6 * 32 + 27, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %223 = arith.mulf %222, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %224 = affine.load %arg2[%arg6 * 32 + 27] {partition_indices = [27], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %225 = arith.addf %223, %224 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %225, %arg2[%arg6 * 32 + 27] {partition_indices = [27], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %226 = affine.load %arg0[%arg5, %arg6 * 32 + 28] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %227 = arith.mulf %226, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %228 = affine.load %arg4[%arg6 * 32 + 28] {partition_indices = [28], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %229 = arith.addf %227, %228 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %229, %arg4[%arg6 * 32 + 28] {partition_indices = [28], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %230 = affine.load %arg0[%arg6 * 32 + 28, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %231 = arith.mulf %230, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %232 = affine.load %arg2[%arg6 * 32 + 28] {partition_indices = [28], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %233 = arith.addf %231, %232 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %233, %arg2[%arg6 * 32 + 28] {partition_indices = [28], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %234 = affine.load %arg0[%arg5, %arg6 * 32 + 29] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %235 = arith.mulf %234, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %236 = affine.load %arg4[%arg6 * 32 + 29] {partition_indices = [29], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %237 = arith.addf %235, %236 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %237, %arg4[%arg6 * 32 + 29] {partition_indices = [29], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %238 = affine.load %arg0[%arg6 * 32 + 29, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %239 = arith.mulf %238, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %240 = affine.load %arg2[%arg6 * 32 + 29] {partition_indices = [29], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %241 = arith.addf %239, %240 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %241, %arg2[%arg6 * 32 + 29] {partition_indices = [29], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %242 = affine.load %arg0[%arg5, %arg6 * 32 + 30] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %243 = arith.mulf %242, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %244 = affine.load %arg4[%arg6 * 32 + 30] {partition_indices = [30], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %245 = arith.addf %243, %244 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %245, %arg4[%arg6 * 32 + 30] {partition_indices = [30], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %246 = affine.load %arg0[%arg6 * 32 + 30, %arg5] {max_mux_size = 2 : i64, partition_indices = [0, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %247 = arith.mulf %246, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %248 = affine.load %arg2[%arg6 * 32 + 30] {partition_indices = [30], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %249 = arith.addf %247, %248 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %249, %arg2[%arg6 * 32 + 30] {partition_indices = [30], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %250 = affine.load %arg0[%arg5, %arg6 * 32 + 31] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %251 = arith.mulf %250, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %252 = affine.load %arg4[%arg6 * 32 + 31] {partition_indices = [31], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %253 = arith.addf %251, %252 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %253, %arg4[%arg6 * 32 + 31] {partition_indices = [31], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %254 = affine.load %arg0[%arg6 * 32 + 31, %arg5] {max_mux_size = 2 : i64, partition_indices = [1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 2, d0 floordiv 2, d1 floordiv 2)>>
        %255 = arith.mulf %254, %6 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %256 = affine.load %arg2[%arg6 * 32 + 31] {partition_indices = [31], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %257 = arith.addf %255, %256 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %257, %arg2[%arg6 * 32 + 31] {partition_indices = [31], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=128, iterLatency=45, minII=34>, parallel, timing = #hls.t<0 -> 4365, 4365, 4365>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=524288, iterLatency=45, minII=34>, resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 17825805, 17825805, 17825805>}
    return
  }
}