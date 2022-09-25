module {
  func @bicg(%arg0: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>, %arg1: memref<4096xf32>, %arg2: memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>, %arg3: memref<4096xf32>, %arg4: memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>) attributes {resource = #hls.r<lut=0, dsp=98, bram=0>, timing = #hls.t<0 -> 38011908, 38011908, 38011908>, top_func} {
    affine.for %arg5 = 0 to 512 {
      affine.for %arg6 = 0 to 512 {
        %0 = affine.load %arg0[%arg5 * 8, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %1 = affine.load %arg3[%arg5 * 8] {partition_indices = [0], timing = #hls.t<90 -> 92, 2, 1>} : memref<4096xf32>
        %2 = arith.mulf %0, %1 {timing = #hls.t<93 -> 97, 4, 1>} : f32
        %3 = affine.load %arg0[%arg6 * 8, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<2 -> 4, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %4 = affine.load %arg1[%arg5 * 8] {partition_indices = [0], timing = #hls.t<90 -> 92, 2, 1>} : memref<4096xf32>
        %5 = arith.mulf %3, %4 {timing = #hls.t<93 -> 97, 4, 1>} : f32
        %6 = affine.load %arg0[%arg5 * 8, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<3 -> 5, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %7 = arith.mulf %6, %1 {timing = #hls.t<94 -> 98, 4, 1>} : f32
        %8 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %9 = arith.mulf %8, %4 {timing = #hls.t<94 -> 98, 4, 1>} : f32
        %10 = affine.load %arg0[%arg5 * 8, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %11 = arith.mulf %10, %1 {timing = #hls.t<95 -> 99, 4, 1>} : f32
        %12 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %13 = arith.mulf %12, %4 {timing = #hls.t<95 -> 99, 4, 1>} : f32
        %14 = affine.load %arg0[%arg5 * 8, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<7 -> 9, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %15 = arith.mulf %14, %1 {timing = #hls.t<96 -> 100, 4, 1>} : f32
        %16 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %17 = arith.mulf %16, %4 {timing = #hls.t<96 -> 100, 4, 1>} : f32
        %18 = affine.load %arg0[%arg5 * 8, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %19 = arith.mulf %18, %1 {timing = #hls.t<97 -> 101, 4, 1>} : f32
        %20 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %21 = arith.mulf %20, %4 {timing = #hls.t<97 -> 101, 4, 1>} : f32
        %22 = affine.load %arg0[%arg5 * 8, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %23 = arith.mulf %22, %1 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %24 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %25 = arith.mulf %24, %4 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %26 = affine.load %arg0[%arg5 * 8, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<13 -> 15, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %27 = arith.mulf %26, %1 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %28 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %29 = arith.mulf %28, %4 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %30 = affine.load %arg0[%arg5 * 8, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %31 = arith.mulf %30, %1 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %32 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %33 = arith.mulf %32, %4 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %34 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %35 = affine.load %arg3[%arg5 * 8 + 1] {partition_indices = [0], timing = #hls.t<91 -> 93, 2, 1>} : memref<4096xf32>
        %36 = arith.mulf %34, %35 {timing = #hls.t<93 -> 97, 4, 1>} : f32
        %37 = arith.addf %36, %2 {timing = #hls.t<97 -> 102, 5, 1>} : f32
        %38 = affine.load %arg0[%arg6 * 8, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %39 = affine.load %arg1[%arg5 * 8 + 1] {partition_indices = [0], timing = #hls.t<91 -> 93, 2, 1>} : memref<4096xf32>
        %40 = arith.mulf %38, %39 {timing = #hls.t<93 -> 97, 4, 1>} : f32
        %41 = arith.addf %40, %5 {timing = #hls.t<97 -> 102, 5, 1>} : f32
        %42 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %43 = arith.mulf %42, %35 {timing = #hls.t<94 -> 98, 4, 1>} : f32
        %44 = arith.addf %43, %7 {timing = #hls.t<98 -> 103, 5, 1>} : f32
        %45 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %46 = arith.mulf %45, %39 {timing = #hls.t<94 -> 98, 4, 1>} : f32
        %47 = arith.addf %46, %9 {timing = #hls.t<98 -> 103, 5, 1>} : f32
        %48 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %49 = arith.mulf %48, %35 {timing = #hls.t<95 -> 99, 4, 1>} : f32
        %50 = arith.addf %49, %11 {timing = #hls.t<99 -> 104, 5, 1>} : f32
        %51 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %52 = arith.mulf %51, %39 {timing = #hls.t<95 -> 99, 4, 1>} : f32
        %53 = arith.addf %52, %13 {timing = #hls.t<99 -> 104, 5, 1>} : f32
        %54 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %55 = arith.mulf %54, %35 {timing = #hls.t<96 -> 100, 4, 1>} : f32
        %56 = arith.addf %55, %15 {timing = #hls.t<100 -> 105, 5, 1>} : f32
        %57 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %58 = arith.mulf %57, %39 {timing = #hls.t<96 -> 100, 4, 1>} : f32
        %59 = arith.addf %58, %17 {timing = #hls.t<100 -> 105, 5, 1>} : f32
        %60 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %61 = arith.mulf %60, %35 {timing = #hls.t<97 -> 101, 4, 1>} : f32
        %62 = arith.addf %61, %19 {timing = #hls.t<101 -> 106, 5, 1>} : f32
        %63 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<26 -> 28, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %64 = arith.mulf %63, %39 {timing = #hls.t<97 -> 101, 4, 1>} : f32
        %65 = arith.addf %64, %21 {timing = #hls.t<101 -> 106, 5, 1>} : f32
        %66 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %67 = arith.mulf %66, %35 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %68 = arith.addf %67, %23 {timing = #hls.t<102 -> 107, 5, 1>} : f32
        %69 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %70 = arith.mulf %69, %39 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %71 = arith.addf %70, %25 {timing = #hls.t<102 -> 107, 5, 1>} : f32
        %72 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %73 = arith.mulf %72, %35 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %74 = arith.addf %73, %27 {timing = #hls.t<103 -> 108, 5, 1>} : f32
        %75 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %76 = arith.mulf %75, %39 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %77 = arith.addf %76, %29 {timing = #hls.t<103 -> 108, 5, 1>} : f32
        %78 = affine.load %arg0[%arg5 * 8 + 1, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %79 = arith.mulf %78, %35 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %80 = arith.addf %79, %31 {timing = #hls.t<104 -> 109, 5, 1>} : f32
        %81 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %82 = arith.mulf %81, %39 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %83 = arith.addf %82, %33 {timing = #hls.t<104 -> 109, 5, 1>} : f32
        %84 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %85 = affine.load %arg3[%arg5 * 8 + 2] {partition_indices = [0], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096xf32>
        %86 = arith.mulf %84, %85 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %87 = arith.addf %86, %37 {timing = #hls.t<102 -> 107, 5, 1>} : f32
        %88 = affine.load %arg0[%arg6 * 8, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<34 -> 36, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %89 = affine.load %arg1[%arg5 * 8 + 2] {partition_indices = [0], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096xf32>
        %90 = arith.mulf %88, %89 {timing = #hls.t<98 -> 102, 4, 1>} : f32
        %91 = arith.addf %90, %41 {timing = #hls.t<102 -> 107, 5, 1>} : f32
        %92 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<35 -> 37, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %93 = arith.mulf %92, %85 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %94 = arith.addf %93, %44 {timing = #hls.t<103 -> 108, 5, 1>} : f32
        %95 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<37 -> 39, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %96 = arith.mulf %95, %89 {timing = #hls.t<99 -> 103, 4, 1>} : f32
        %97 = arith.addf %96, %47 {timing = #hls.t<103 -> 108, 5, 1>} : f32
        %98 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<36 -> 38, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %99 = arith.mulf %98, %85 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %100 = arith.addf %99, %50 {timing = #hls.t<104 -> 109, 5, 1>} : f32
        %101 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %102 = arith.mulf %101, %89 {timing = #hls.t<100 -> 104, 4, 1>} : f32
        %103 = arith.addf %102, %53 {timing = #hls.t<104 -> 109, 5, 1>} : f32
        %104 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %105 = arith.mulf %104, %85 {timing = #hls.t<101 -> 105, 4, 1>} : f32
        %106 = arith.addf %105, %56 {timing = #hls.t<105 -> 110, 5, 1>} : f32
        %107 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %108 = arith.mulf %107, %89 {timing = #hls.t<101 -> 105, 4, 1>} : f32
        %109 = arith.addf %108, %59 {timing = #hls.t<105 -> 110, 5, 1>} : f32
        %110 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %111 = arith.mulf %110, %85 {timing = #hls.t<102 -> 106, 4, 1>} : f32
        %112 = arith.addf %111, %62 {timing = #hls.t<106 -> 111, 5, 1>} : f32
        %113 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<42 -> 44, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %114 = arith.mulf %113, %89 {timing = #hls.t<102 -> 106, 4, 1>} : f32
        %115 = arith.addf %114, %65 {timing = #hls.t<106 -> 111, 5, 1>} : f32
        %116 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<43 -> 45, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %117 = arith.mulf %116, %85 {timing = #hls.t<103 -> 107, 4, 1>} : f32
        %118 = arith.addf %117, %68 {timing = #hls.t<107 -> 112, 5, 1>} : f32
        %119 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<44 -> 46, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %120 = arith.mulf %119, %89 {timing = #hls.t<103 -> 107, 4, 1>} : f32
        %121 = arith.addf %120, %71 {timing = #hls.t<107 -> 112, 5, 1>} : f32
        %122 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<45 -> 47, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %123 = arith.mulf %122, %85 {timing = #hls.t<104 -> 108, 4, 1>} : f32
        %124 = arith.addf %123, %74 {timing = #hls.t<108 -> 113, 5, 1>} : f32
        %125 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<46 -> 48, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %126 = arith.mulf %125, %89 {timing = #hls.t<104 -> 108, 4, 1>} : f32
        %127 = arith.addf %126, %77 {timing = #hls.t<108 -> 113, 5, 1>} : f32
        %128 = affine.load %arg0[%arg5 * 8 + 2, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<47 -> 49, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %129 = arith.mulf %128, %85 {timing = #hls.t<105 -> 109, 4, 1>} : f32
        %130 = arith.addf %129, %80 {timing = #hls.t<109 -> 114, 5, 1>} : f32
        %131 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<48 -> 50, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %132 = arith.mulf %131, %89 {timing = #hls.t<105 -> 109, 4, 1>} : f32
        %133 = arith.addf %132, %83 {timing = #hls.t<109 -> 114, 5, 1>} : f32
        %134 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %135 = affine.load %arg3[%arg5 * 8 + 3] {partition_indices = [0], timing = #hls.t<101 -> 103, 2, 1>} : memref<4096xf32>
        %136 = arith.mulf %134, %135 {timing = #hls.t<103 -> 107, 4, 1>} : f32
        %137 = arith.addf %136, %87 {timing = #hls.t<107 -> 112, 5, 1>} : f32
        %138 = affine.load %arg0[%arg6 * 8, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<50 -> 52, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %139 = affine.load %arg1[%arg5 * 8 + 3] {partition_indices = [0], timing = #hls.t<101 -> 103, 2, 1>} : memref<4096xf32>
        %140 = arith.mulf %138, %139 {timing = #hls.t<103 -> 107, 4, 1>} : f32
        %141 = arith.addf %140, %91 {timing = #hls.t<107 -> 112, 5, 1>} : f32
        %142 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<51 -> 53, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %143 = arith.mulf %142, %135 {timing = #hls.t<104 -> 108, 4, 1>} : f32
        %144 = arith.addf %143, %94 {timing = #hls.t<108 -> 113, 5, 1>} : f32
        %145 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<52 -> 54, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %146 = arith.mulf %145, %139 {timing = #hls.t<104 -> 108, 4, 1>} : f32
        %147 = arith.addf %146, %97 {timing = #hls.t<108 -> 113, 5, 1>} : f32
        %148 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<53 -> 55, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %149 = arith.mulf %148, %135 {timing = #hls.t<105 -> 109, 4, 1>} : f32
        %150 = arith.addf %149, %100 {timing = #hls.t<109 -> 114, 5, 1>} : f32
        %151 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<55 -> 57, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %152 = arith.mulf %151, %139 {timing = #hls.t<105 -> 109, 4, 1>} : f32
        %153 = arith.addf %152, %103 {timing = #hls.t<109 -> 114, 5, 1>} : f32
        %154 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<54 -> 56, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %155 = arith.mulf %154, %135 {timing = #hls.t<106 -> 110, 4, 1>} : f32
        %156 = arith.addf %155, %106 {timing = #hls.t<110 -> 115, 5, 1>} : f32
        %157 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<56 -> 58, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %158 = arith.mulf %157, %139 {timing = #hls.t<106 -> 110, 4, 1>} : f32
        %159 = arith.addf %158, %109 {timing = #hls.t<110 -> 115, 5, 1>} : f32
        %160 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %161 = arith.mulf %160, %135 {timing = #hls.t<107 -> 111, 4, 1>} : f32
        %162 = arith.addf %161, %112 {timing = #hls.t<111 -> 116, 5, 1>} : f32
        %163 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<58 -> 60, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %164 = arith.mulf %163, %139 {timing = #hls.t<107 -> 111, 4, 1>} : f32
        %165 = arith.addf %164, %115 {timing = #hls.t<111 -> 116, 5, 1>} : f32
        %166 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<59 -> 61, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %167 = arith.mulf %166, %135 {timing = #hls.t<108 -> 112, 4, 1>} : f32
        %168 = arith.addf %167, %118 {timing = #hls.t<112 -> 117, 5, 1>} : f32
        %169 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<60 -> 62, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %170 = arith.mulf %169, %139 {timing = #hls.t<108 -> 112, 4, 1>} : f32
        %171 = arith.addf %170, %121 {timing = #hls.t<112 -> 117, 5, 1>} : f32
        %172 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<61 -> 63, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %173 = arith.mulf %172, %135 {timing = #hls.t<109 -> 113, 4, 1>} : f32
        %174 = arith.addf %173, %124 {timing = #hls.t<113 -> 118, 5, 1>} : f32
        %175 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<62 -> 64, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %176 = arith.mulf %175, %139 {timing = #hls.t<109 -> 113, 4, 1>} : f32
        %177 = arith.addf %176, %127 {timing = #hls.t<113 -> 118, 5, 1>} : f32
        %178 = affine.load %arg0[%arg5 * 8 + 3, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<63 -> 65, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %179 = arith.mulf %178, %135 {timing = #hls.t<110 -> 114, 4, 1>} : f32
        %180 = arith.addf %179, %130 {timing = #hls.t<114 -> 119, 5, 1>} : f32
        %181 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<64 -> 66, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %182 = arith.mulf %181, %139 {timing = #hls.t<110 -> 114, 4, 1>} : f32
        %183 = arith.addf %182, %133 {timing = #hls.t<114 -> 119, 5, 1>} : f32
        %184 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<65 -> 67, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %185 = affine.load %arg3[%arg5 * 8 + 4] {partition_indices = [0], timing = #hls.t<106 -> 108, 2, 1>} : memref<4096xf32>
        %186 = arith.mulf %184, %185 {timing = #hls.t<108 -> 112, 4, 1>} : f32
        %187 = arith.addf %186, %137 {timing = #hls.t<112 -> 117, 5, 1>} : f32
        %188 = affine.load %arg0[%arg6 * 8, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<66 -> 68, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %189 = affine.load %arg1[%arg5 * 8 + 4] {partition_indices = [0], timing = #hls.t<106 -> 108, 2, 1>} : memref<4096xf32>
        %190 = arith.mulf %188, %189 {timing = #hls.t<108 -> 112, 4, 1>} : f32
        %191 = arith.addf %190, %141 {timing = #hls.t<112 -> 117, 5, 1>} : f32
        %192 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<67 -> 69, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %193 = arith.mulf %192, %185 {timing = #hls.t<109 -> 113, 4, 1>} : f32
        %194 = arith.addf %193, %144 {timing = #hls.t<113 -> 118, 5, 1>} : f32
        %195 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<68 -> 70, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %196 = arith.mulf %195, %189 {timing = #hls.t<109 -> 113, 4, 1>} : f32
        %197 = arith.addf %196, %147 {timing = #hls.t<113 -> 118, 5, 1>} : f32
        %198 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<69 -> 71, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %199 = arith.mulf %198, %185 {timing = #hls.t<110 -> 114, 4, 1>} : f32
        %200 = arith.addf %199, %150 {timing = #hls.t<114 -> 119, 5, 1>} : f32
        %201 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<70 -> 72, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %202 = arith.mulf %201, %189 {timing = #hls.t<110 -> 114, 4, 1>} : f32
        %203 = arith.addf %202, %153 {timing = #hls.t<114 -> 119, 5, 1>} : f32
        %204 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<71 -> 73, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %205 = arith.mulf %204, %185 {timing = #hls.t<111 -> 115, 4, 1>} : f32
        %206 = arith.addf %205, %156 {timing = #hls.t<115 -> 120, 5, 1>} : f32
        %207 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<73 -> 75, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %208 = arith.mulf %207, %189 {timing = #hls.t<111 -> 115, 4, 1>} : f32
        %209 = arith.addf %208, %159 {timing = #hls.t<115 -> 120, 5, 1>} : f32
        %210 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<72 -> 74, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %211 = arith.mulf %210, %185 {timing = #hls.t<112 -> 116, 4, 1>} : f32
        %212 = arith.addf %211, %162 {timing = #hls.t<116 -> 121, 5, 1>} : f32
        %213 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<74 -> 76, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %214 = arith.mulf %213, %189 {timing = #hls.t<112 -> 116, 4, 1>} : f32
        %215 = arith.addf %214, %165 {timing = #hls.t<116 -> 121, 5, 1>} : f32
        %216 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<75 -> 77, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %217 = arith.mulf %216, %185 {timing = #hls.t<113 -> 117, 4, 1>} : f32
        %218 = arith.addf %217, %168 {timing = #hls.t<117 -> 122, 5, 1>} : f32
        %219 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<76 -> 78, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %220 = arith.mulf %219, %189 {timing = #hls.t<113 -> 117, 4, 1>} : f32
        %221 = arith.addf %220, %171 {timing = #hls.t<117 -> 122, 5, 1>} : f32
        %222 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<77 -> 79, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %223 = arith.mulf %222, %185 {timing = #hls.t<114 -> 118, 4, 1>} : f32
        %224 = arith.addf %223, %174 {timing = #hls.t<118 -> 123, 5, 1>} : f32
        %225 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<78 -> 80, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %226 = arith.mulf %225, %189 {timing = #hls.t<114 -> 118, 4, 1>} : f32
        %227 = arith.addf %226, %177 {timing = #hls.t<118 -> 123, 5, 1>} : f32
        %228 = affine.load %arg0[%arg5 * 8 + 4, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<79 -> 81, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %229 = arith.mulf %228, %185 {timing = #hls.t<115 -> 119, 4, 1>} : f32
        %230 = arith.addf %229, %180 {timing = #hls.t<119 -> 124, 5, 1>} : f32
        %231 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<80 -> 82, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %232 = arith.mulf %231, %189 {timing = #hls.t<115 -> 119, 4, 1>} : f32
        %233 = arith.addf %232, %183 {timing = #hls.t<119 -> 124, 5, 1>} : f32
        %234 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<81 -> 83, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %235 = affine.load %arg3[%arg5 * 8 + 5] {partition_indices = [0], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096xf32>
        %236 = arith.mulf %234, %235 {timing = #hls.t<113 -> 117, 4, 1>} : f32
        %237 = arith.addf %236, %187 {timing = #hls.t<117 -> 122, 5, 1>} : f32
        %238 = affine.load %arg0[%arg6 * 8, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<82 -> 84, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %239 = affine.load %arg1[%arg5 * 8 + 5] {partition_indices = [0], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096xf32>
        %240 = arith.mulf %238, %239 {timing = #hls.t<113 -> 117, 4, 1>} : f32
        %241 = arith.addf %240, %191 {timing = #hls.t<117 -> 122, 5, 1>} : f32
        %242 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<83 -> 85, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %243 = arith.mulf %242, %235 {timing = #hls.t<114 -> 118, 4, 1>} : f32
        %244 = arith.addf %243, %194 {timing = #hls.t<118 -> 123, 5, 1>} : f32
        %245 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<84 -> 86, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %246 = arith.mulf %245, %239 {timing = #hls.t<114 -> 118, 4, 1>} : f32
        %247 = arith.addf %246, %197 {timing = #hls.t<118 -> 123, 5, 1>} : f32
        %248 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<85 -> 87, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %249 = arith.mulf %248, %235 {timing = #hls.t<115 -> 119, 4, 1>} : f32
        %250 = arith.addf %249, %200 {timing = #hls.t<119 -> 124, 5, 1>} : f32
        %251 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<86 -> 88, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %252 = arith.mulf %251, %239 {timing = #hls.t<115 -> 119, 4, 1>} : f32
        %253 = arith.addf %252, %203 {timing = #hls.t<119 -> 124, 5, 1>} : f32
        %254 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<87 -> 89, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %255 = arith.mulf %254, %235 {timing = #hls.t<116 -> 120, 4, 1>} : f32
        %256 = arith.addf %255, %206 {timing = #hls.t<120 -> 125, 5, 1>} : f32
        %257 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<88 -> 90, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %258 = arith.mulf %257, %239 {timing = #hls.t<116 -> 120, 4, 1>} : f32
        %259 = arith.addf %258, %209 {timing = #hls.t<120 -> 125, 5, 1>} : f32
        %260 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<89 -> 91, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %261 = arith.mulf %260, %235 {timing = #hls.t<117 -> 121, 4, 1>} : f32
        %262 = arith.addf %261, %212 {timing = #hls.t<121 -> 126, 5, 1>} : f32
        %263 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<91 -> 93, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %264 = arith.mulf %263, %239 {timing = #hls.t<117 -> 121, 4, 1>} : f32
        %265 = arith.addf %264, %215 {timing = #hls.t<121 -> 126, 5, 1>} : f32
        %266 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<90 -> 92, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %267 = arith.mulf %266, %235 {timing = #hls.t<118 -> 122, 4, 1>} : f32
        %268 = arith.addf %267, %218 {timing = #hls.t<122 -> 127, 5, 1>} : f32
        %269 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<92 -> 94, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %270 = arith.mulf %269, %239 {timing = #hls.t<118 -> 122, 4, 1>} : f32
        %271 = arith.addf %270, %221 {timing = #hls.t<122 -> 127, 5, 1>} : f32
        %272 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<93 -> 95, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %273 = arith.mulf %272, %235 {timing = #hls.t<119 -> 123, 4, 1>} : f32
        %274 = arith.addf %273, %224 {timing = #hls.t<123 -> 128, 5, 1>} : f32
        %275 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<94 -> 96, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %276 = arith.mulf %275, %239 {timing = #hls.t<119 -> 123, 4, 1>} : f32
        %277 = arith.addf %276, %227 {timing = #hls.t<123 -> 128, 5, 1>} : f32
        %278 = affine.load %arg0[%arg5 * 8 + 5, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<95 -> 97, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %279 = arith.mulf %278, %235 {timing = #hls.t<120 -> 124, 4, 1>} : f32
        %280 = arith.addf %279, %230 {timing = #hls.t<124 -> 129, 5, 1>} : f32
        %281 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %282 = arith.mulf %281, %239 {timing = #hls.t<120 -> 124, 4, 1>} : f32
        %283 = arith.addf %282, %233 {timing = #hls.t<124 -> 129, 5, 1>} : f32
        %284 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<97 -> 99, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %285 = affine.load %arg3[%arg5 * 8 + 6] {partition_indices = [0], timing = #hls.t<116 -> 118, 2, 1>} : memref<4096xf32>
        %286 = arith.mulf %284, %285 {timing = #hls.t<118 -> 122, 4, 1>} : f32
        %287 = arith.addf %286, %237 {timing = #hls.t<122 -> 127, 5, 1>} : f32
        %288 = affine.load %arg0[%arg6 * 8, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<98 -> 100, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %289 = affine.load %arg1[%arg5 * 8 + 6] {partition_indices = [0], timing = #hls.t<116 -> 118, 2, 1>} : memref<4096xf32>
        %290 = arith.mulf %288, %289 {timing = #hls.t<118 -> 122, 4, 1>} : f32
        %291 = arith.addf %290, %241 {timing = #hls.t<122 -> 127, 5, 1>} : f32
        %292 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<99 -> 101, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %293 = arith.mulf %292, %285 {timing = #hls.t<119 -> 123, 4, 1>} : f32
        %294 = arith.addf %293, %244 {timing = #hls.t<123 -> 128, 5, 1>} : f32
        %295 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<100 -> 102, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %296 = arith.mulf %295, %289 {timing = #hls.t<119 -> 123, 4, 1>} : f32
        %297 = arith.addf %296, %247 {timing = #hls.t<123 -> 128, 5, 1>} : f32
        %298 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<101 -> 103, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %299 = arith.mulf %298, %285 {timing = #hls.t<120 -> 124, 4, 1>} : f32
        %300 = arith.addf %299, %250 {timing = #hls.t<124 -> 129, 5, 1>} : f32
        %301 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<102 -> 104, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %302 = arith.mulf %301, %289 {timing = #hls.t<120 -> 124, 4, 1>} : f32
        %303 = arith.addf %302, %253 {timing = #hls.t<124 -> 129, 5, 1>} : f32
        %304 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<103 -> 105, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %305 = arith.mulf %304, %285 {timing = #hls.t<121 -> 125, 4, 1>} : f32
        %306 = arith.addf %305, %256 {timing = #hls.t<125 -> 130, 5, 1>} : f32
        %307 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<104 -> 106, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %308 = arith.mulf %307, %289 {timing = #hls.t<121 -> 125, 4, 1>} : f32
        %309 = arith.addf %308, %259 {timing = #hls.t<125 -> 130, 5, 1>} : f32
        %310 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<105 -> 107, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %311 = arith.mulf %310, %285 {timing = #hls.t<122 -> 126, 4, 1>} : f32
        %312 = arith.addf %311, %262 {timing = #hls.t<126 -> 131, 5, 1>} : f32
        %313 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<106 -> 108, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %314 = arith.mulf %313, %289 {timing = #hls.t<122 -> 126, 4, 1>} : f32
        %315 = arith.addf %314, %265 {timing = #hls.t<126 -> 131, 5, 1>} : f32
        %316 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<107 -> 109, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %317 = arith.mulf %316, %285 {timing = #hls.t<123 -> 127, 4, 1>} : f32
        %318 = arith.addf %317, %268 {timing = #hls.t<127 -> 132, 5, 1>} : f32
        %319 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<109 -> 111, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %320 = arith.mulf %319, %289 {timing = #hls.t<123 -> 127, 4, 1>} : f32
        %321 = arith.addf %320, %271 {timing = #hls.t<127 -> 132, 5, 1>} : f32
        %322 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<108 -> 110, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %323 = arith.mulf %322, %285 {timing = #hls.t<124 -> 128, 4, 1>} : f32
        %324 = arith.addf %323, %274 {timing = #hls.t<128 -> 133, 5, 1>} : f32
        %325 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<110 -> 112, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %326 = arith.mulf %325, %289 {timing = #hls.t<124 -> 128, 4, 1>} : f32
        %327 = arith.addf %326, %277 {timing = #hls.t<128 -> 133, 5, 1>} : f32
        %328 = affine.load %arg0[%arg5 * 8 + 6, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %329 = arith.mulf %328, %285 {timing = #hls.t<125 -> 129, 4, 1>} : f32
        %330 = arith.addf %329, %280 {timing = #hls.t<129 -> 134, 5, 1>} : f32
        %331 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<112 -> 114, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %332 = arith.mulf %331, %289 {timing = #hls.t<125 -> 129, 4, 1>} : f32
        %333 = arith.addf %332, %283 {timing = #hls.t<129 -> 134, 5, 1>} : f32
        %334 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<113 -> 115, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %335 = affine.load %arg3[%arg5 * 8 + 7] {partition_indices = [0], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096xf32>
        %336 = arith.mulf %334, %335 {timing = #hls.t<123 -> 127, 4, 1>} : f32
        %337 = arith.addf %336, %287 {timing = #hls.t<127 -> 132, 5, 1>} : f32
        %338 = affine.load %arg4[%arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<130 -> 132, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %339 = arith.addf %337, %338 {timing = #hls.t<132 -> 137, 5, 1>} : f32
        affine.store %339, %arg4[%arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<137 -> 138, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %340 = affine.load %arg0[%arg6 * 8, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<114 -> 116, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %341 = affine.load %arg1[%arg5 * 8 + 7] {partition_indices = [0], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096xf32>
        %342 = arith.mulf %340, %341 {timing = #hls.t<123 -> 127, 4, 1>} : f32
        %343 = arith.addf %342, %291 {timing = #hls.t<127 -> 132, 5, 1>} : f32
        %344 = affine.load %arg2[%arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<130 -> 132, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %345 = arith.addf %343, %344 {timing = #hls.t<132 -> 137, 5, 1>} : f32
        affine.store %345, %arg2[%arg6 * 8] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<137 -> 138, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %346 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<115 -> 117, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %347 = arith.mulf %346, %335 {timing = #hls.t<124 -> 128, 4, 1>} : f32
        %348 = arith.addf %347, %294 {timing = #hls.t<128 -> 133, 5, 1>} : f32
        %349 = affine.load %arg4[%arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<131 -> 133, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %350 = arith.addf %348, %349 {timing = #hls.t<133 -> 138, 5, 1>} : f32
        affine.store %350, %arg4[%arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<138 -> 139, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %351 = affine.load %arg0[%arg6 * 8 + 1, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<116 -> 118, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %352 = arith.mulf %351, %341 {timing = #hls.t<124 -> 128, 4, 1>} : f32
        %353 = arith.addf %352, %297 {timing = #hls.t<128 -> 133, 5, 1>} : f32
        %354 = affine.load %arg2[%arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<131 -> 133, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %355 = arith.addf %353, %354 {timing = #hls.t<133 -> 138, 5, 1>} : f32
        affine.store %355, %arg2[%arg6 * 8 + 1] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<138 -> 139, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %356 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<117 -> 119, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %357 = arith.mulf %356, %335 {timing = #hls.t<125 -> 129, 4, 1>} : f32
        %358 = arith.addf %357, %300 {timing = #hls.t<129 -> 134, 5, 1>} : f32
        %359 = affine.load %arg4[%arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<132 -> 134, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %360 = arith.addf %358, %359 {timing = #hls.t<134 -> 139, 5, 1>} : f32
        affine.store %360, %arg4[%arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<139 -> 140, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %361 = affine.load %arg0[%arg6 * 8 + 2, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<118 -> 120, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %362 = arith.mulf %361, %341 {timing = #hls.t<125 -> 129, 4, 1>} : f32
        %363 = arith.addf %362, %303 {timing = #hls.t<129 -> 134, 5, 1>} : f32
        %364 = affine.load %arg2[%arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<132 -> 134, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %365 = arith.addf %363, %364 {timing = #hls.t<134 -> 139, 5, 1>} : f32
        affine.store %365, %arg2[%arg6 * 8 + 2] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<139 -> 140, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %366 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<119 -> 121, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %367 = arith.mulf %366, %335 {timing = #hls.t<126 -> 130, 4, 1>} : f32
        %368 = arith.addf %367, %306 {timing = #hls.t<130 -> 135, 5, 1>} : f32
        %369 = affine.load %arg4[%arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<133 -> 135, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %370 = arith.addf %368, %369 {timing = #hls.t<135 -> 140, 5, 1>} : f32
        affine.store %370, %arg4[%arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<140 -> 141, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %371 = affine.load %arg0[%arg6 * 8 + 3, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<120 -> 122, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %372 = arith.mulf %371, %341 {timing = #hls.t<126 -> 130, 4, 1>} : f32
        %373 = arith.addf %372, %309 {timing = #hls.t<130 -> 135, 5, 1>} : f32
        %374 = affine.load %arg2[%arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<133 -> 135, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %375 = arith.addf %373, %374 {timing = #hls.t<135 -> 140, 5, 1>} : f32
        affine.store %375, %arg2[%arg6 * 8 + 3] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<140 -> 141, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %376 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %377 = arith.mulf %376, %335 {timing = #hls.t<127 -> 131, 4, 1>} : f32
        %378 = arith.addf %377, %312 {timing = #hls.t<131 -> 136, 5, 1>} : f32
        %379 = affine.load %arg4[%arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<134 -> 136, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %380 = arith.addf %378, %379 {timing = #hls.t<136 -> 141, 5, 1>} : f32
        affine.store %380, %arg4[%arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<141 -> 142, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %381 = affine.load %arg0[%arg6 * 8 + 4, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<122 -> 124, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %382 = arith.mulf %381, %341 {timing = #hls.t<127 -> 131, 4, 1>} : f32
        %383 = arith.addf %382, %315 {timing = #hls.t<131 -> 136, 5, 1>} : f32
        %384 = affine.load %arg2[%arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<134 -> 136, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %385 = arith.addf %383, %384 {timing = #hls.t<136 -> 141, 5, 1>} : f32
        affine.store %385, %arg2[%arg6 * 8 + 4] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<141 -> 142, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %386 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<123 -> 125, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %387 = arith.mulf %386, %335 {timing = #hls.t<128 -> 132, 4, 1>} : f32
        %388 = arith.addf %387, %318 {timing = #hls.t<132 -> 137, 5, 1>} : f32
        %389 = affine.load %arg4[%arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %390 = arith.addf %388, %389 {timing = #hls.t<137 -> 142, 5, 1>} : f32
        affine.store %390, %arg4[%arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<142 -> 143, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %391 = affine.load %arg0[%arg6 * 8 + 5, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<124 -> 126, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %392 = arith.mulf %391, %341 {timing = #hls.t<128 -> 132, 4, 1>} : f32
        %393 = arith.addf %392, %321 {timing = #hls.t<132 -> 137, 5, 1>} : f32
        %394 = affine.load %arg2[%arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %395 = arith.addf %393, %394 {timing = #hls.t<137 -> 142, 5, 1>} : f32
        affine.store %395, %arg2[%arg6 * 8 + 5] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<142 -> 143, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %396 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<125 -> 127, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %397 = arith.mulf %396, %335 {timing = #hls.t<129 -> 133, 4, 1>} : f32
        %398 = arith.addf %397, %324 {timing = #hls.t<133 -> 138, 5, 1>} : f32
        %399 = affine.load %arg4[%arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<136 -> 138, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %400 = arith.addf %398, %399 {timing = #hls.t<138 -> 143, 5, 1>} : f32
        affine.store %400, %arg4[%arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<143 -> 144, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %401 = affine.load %arg0[%arg6 * 8 + 6, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<127 -> 129, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %402 = arith.mulf %401, %341 {timing = #hls.t<129 -> 133, 4, 1>} : f32
        %403 = arith.addf %402, %327 {timing = #hls.t<133 -> 138, 5, 1>} : f32
        %404 = affine.load %arg2[%arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<136 -> 138, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %405 = arith.addf %403, %404 {timing = #hls.t<138 -> 143, 5, 1>} : f32
        affine.store %405, %arg2[%arg6 * 8 + 6] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<143 -> 144, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %406 = affine.load %arg0[%arg5 * 8 + 7, %arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<126 -> 128, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %407 = arith.mulf %406, %335 {timing = #hls.t<130 -> 134, 4, 1>} : f32
        %408 = arith.addf %407, %330 {timing = #hls.t<134 -> 139, 5, 1>} : f32
        %409 = affine.load %arg4[%arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %410 = arith.addf %408, %409 {timing = #hls.t<139 -> 144, 5, 1>} : f32
        affine.store %410, %arg4[%arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<144 -> 145, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %411 = affine.load %arg0[%arg6 * 8 + 7, %arg5 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1, -1], timing = #hls.t<128 -> 130, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 64, d0 floordiv 32, d1 floordiv 64)>>
        %412 = arith.mulf %411, %341 {timing = #hls.t<130 -> 134, 4, 1>} : f32
        %413 = arith.addf %412, %333 {timing = #hls.t<134 -> 139, 5, 1>} : f32
        %414 = affine.load %arg2[%arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
        %415 = arith.addf %413, %414 {timing = #hls.t<139 -> 144, 5, 1>} : f32
        affine.store %415, %arg2[%arg6 * 8 + 7] {max_mux_size = 64 : i64, partition_indices = [-1], timing = #hls.t<144 -> 145, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 64, d0 floordiv 64)>>
      } {loop_info = #hls.l<flattenTripCount=512, iterLatency=145, minII=145>, parallel, timing = #hls.t<0 -> 74242, 74242, 74242>}
    } {loop_info = #hls.l<flattenTripCount=512, iterLatency=74242, minII=74242>, timing = #hls.t<0 -> 38011906, 38011906, 38011906>}
    return {timing = #hls.t<38011906 -> 38011906, 0, 0>}
  }
}