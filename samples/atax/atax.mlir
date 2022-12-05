module {
  func @atax(%arg0: f32, %arg1: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>, %arg2: memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>, %arg3: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>) attributes {resource = #hls.r<lut=0, dsp=160, bram=0>, timing = #hls.t<0 -> 1056800, 1056800, 1056800>, top_func} {
    affine.for %arg5 = 0 to 4096 {
      affine.store %arg0, %arg4[%arg5] {max_mux_size = 32 : i64, partition_indices = [-1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
    } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    affine.for %arg5 = 0 to 4096 {
      affine.store %arg0, %arg2[%arg5] {max_mux_size = 32 : i64, partition_indices = [-1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
    } {parallel}
    affine.for %arg5 = 0 to 4096 {
      affine.for %arg6 = 0 to 128 {
        %0 = affine.load %arg1[%arg6 * 32, %arg5] {max_mux_size = 32 : i64, partition_indices = [0, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %1 = affine.load %arg3[%arg5] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg2[%arg6 * 32] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg2[%arg6 * 32] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %5 = affine.load %arg1[%arg6 * 32 + 1, %arg5] {max_mux_size = 32 : i64, partition_indices = [1, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %6 = arith.mulf %5, %1 : f32
        %7 = affine.load %arg2[%arg6 * 32 + 1] {partition_indices = [1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %8 = arith.addf %6, %7 : f32
        affine.store %8, %arg2[%arg6 * 32 + 1] {partition_indices = [1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %9 = affine.load %arg1[%arg6 * 32 + 2, %arg5] {max_mux_size = 32 : i64, partition_indices = [2, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %10 = arith.mulf %9, %1 : f32
        %11 = affine.load %arg2[%arg6 * 32 + 2] {partition_indices = [2]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %12 = arith.addf %10, %11 : f32
        affine.store %12, %arg2[%arg6 * 32 + 2] {partition_indices = [2]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %13 = affine.load %arg1[%arg6 * 32 + 3, %arg5] {max_mux_size = 32 : i64, partition_indices = [3, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %14 = arith.mulf %13, %1 : f32
        %15 = affine.load %arg2[%arg6 * 32 + 3] {partition_indices = [3]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %16 = arith.addf %14, %15 : f32
        affine.store %16, %arg2[%arg6 * 32 + 3] {partition_indices = [3]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %17 = affine.load %arg1[%arg6 * 32 + 4, %arg5] {max_mux_size = 32 : i64, partition_indices = [4, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %18 = arith.mulf %17, %1 : f32
        %19 = affine.load %arg2[%arg6 * 32 + 4] {partition_indices = [4]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %20 = arith.addf %18, %19 : f32
        affine.store %20, %arg2[%arg6 * 32 + 4] {partition_indices = [4]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %21 = affine.load %arg1[%arg6 * 32 + 5, %arg5] {max_mux_size = 32 : i64, partition_indices = [5, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %22 = arith.mulf %21, %1 : f32
        %23 = affine.load %arg2[%arg6 * 32 + 5] {partition_indices = [5]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %24 = arith.addf %22, %23 : f32
        affine.store %24, %arg2[%arg6 * 32 + 5] {partition_indices = [5]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %25 = affine.load %arg1[%arg6 * 32 + 6, %arg5] {max_mux_size = 32 : i64, partition_indices = [6, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %26 = arith.mulf %25, %1 : f32
        %27 = affine.load %arg2[%arg6 * 32 + 6] {partition_indices = [6]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %28 = arith.addf %26, %27 : f32
        affine.store %28, %arg2[%arg6 * 32 + 6] {partition_indices = [6]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %29 = affine.load %arg1[%arg6 * 32 + 7, %arg5] {max_mux_size = 32 : i64, partition_indices = [7, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %30 = arith.mulf %29, %1 : f32
        %31 = affine.load %arg2[%arg6 * 32 + 7] {partition_indices = [7]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %32 = arith.addf %30, %31 : f32
        affine.store %32, %arg2[%arg6 * 32 + 7] {partition_indices = [7]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %33 = affine.load %arg1[%arg6 * 32 + 8, %arg5] {max_mux_size = 32 : i64, partition_indices = [8, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %34 = arith.mulf %33, %1 : f32
        %35 = affine.load %arg2[%arg6 * 32 + 8] {partition_indices = [8]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %36 = arith.addf %34, %35 : f32
        affine.store %36, %arg2[%arg6 * 32 + 8] {partition_indices = [8]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %37 = affine.load %arg1[%arg6 * 32 + 9, %arg5] {max_mux_size = 32 : i64, partition_indices = [9, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %38 = arith.mulf %37, %1 : f32
        %39 = affine.load %arg2[%arg6 * 32 + 9] {partition_indices = [9]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %40 = arith.addf %38, %39 : f32
        affine.store %40, %arg2[%arg6 * 32 + 9] {partition_indices = [9]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %41 = affine.load %arg1[%arg6 * 32 + 10, %arg5] {max_mux_size = 32 : i64, partition_indices = [10, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %42 = arith.mulf %41, %1 : f32
        %43 = affine.load %arg2[%arg6 * 32 + 10] {partition_indices = [10]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %44 = arith.addf %42, %43 : f32
        affine.store %44, %arg2[%arg6 * 32 + 10] {partition_indices = [10]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %45 = affine.load %arg1[%arg6 * 32 + 11, %arg5] {max_mux_size = 32 : i64, partition_indices = [11, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %46 = arith.mulf %45, %1 : f32
        %47 = affine.load %arg2[%arg6 * 32 + 11] {partition_indices = [11]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %48 = arith.addf %46, %47 : f32
        affine.store %48, %arg2[%arg6 * 32 + 11] {partition_indices = [11]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %49 = affine.load %arg1[%arg6 * 32 + 12, %arg5] {max_mux_size = 32 : i64, partition_indices = [12, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %50 = arith.mulf %49, %1 : f32
        %51 = affine.load %arg2[%arg6 * 32 + 12] {partition_indices = [12]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %52 = arith.addf %50, %51 : f32
        affine.store %52, %arg2[%arg6 * 32 + 12] {partition_indices = [12]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %53 = affine.load %arg1[%arg6 * 32 + 13, %arg5] {max_mux_size = 32 : i64, partition_indices = [13, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %54 = arith.mulf %53, %1 : f32
        %55 = affine.load %arg2[%arg6 * 32 + 13] {partition_indices = [13]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %56 = arith.addf %54, %55 : f32
        affine.store %56, %arg2[%arg6 * 32 + 13] {partition_indices = [13]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %57 = affine.load %arg1[%arg6 * 32 + 14, %arg5] {max_mux_size = 32 : i64, partition_indices = [14, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %58 = arith.mulf %57, %1 : f32
        %59 = affine.load %arg2[%arg6 * 32 + 14] {partition_indices = [14]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %60 = arith.addf %58, %59 : f32
        affine.store %60, %arg2[%arg6 * 32 + 14] {partition_indices = [14]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %61 = affine.load %arg1[%arg6 * 32 + 15, %arg5] {max_mux_size = 32 : i64, partition_indices = [15, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %62 = arith.mulf %61, %1 : f32
        %63 = affine.load %arg2[%arg6 * 32 + 15] {partition_indices = [15]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %64 = arith.addf %62, %63 : f32
        affine.store %64, %arg2[%arg6 * 32 + 15] {partition_indices = [15]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %65 = affine.load %arg1[%arg6 * 32 + 16, %arg5] {max_mux_size = 32 : i64, partition_indices = [16, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %66 = arith.mulf %65, %1 : f32
        %67 = affine.load %arg2[%arg6 * 32 + 16] {partition_indices = [16]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %68 = arith.addf %66, %67 : f32
        affine.store %68, %arg2[%arg6 * 32 + 16] {partition_indices = [16]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %69 = affine.load %arg1[%arg6 * 32 + 17, %arg5] {max_mux_size = 32 : i64, partition_indices = [17, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %70 = arith.mulf %69, %1 : f32
        %71 = affine.load %arg2[%arg6 * 32 + 17] {partition_indices = [17]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %72 = arith.addf %70, %71 : f32
        affine.store %72, %arg2[%arg6 * 32 + 17] {partition_indices = [17]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %73 = affine.load %arg1[%arg6 * 32 + 18, %arg5] {max_mux_size = 32 : i64, partition_indices = [18, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %74 = arith.mulf %73, %1 : f32
        %75 = affine.load %arg2[%arg6 * 32 + 18] {partition_indices = [18]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %76 = arith.addf %74, %75 : f32
        affine.store %76, %arg2[%arg6 * 32 + 18] {partition_indices = [18]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %77 = affine.load %arg1[%arg6 * 32 + 19, %arg5] {max_mux_size = 32 : i64, partition_indices = [19, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %78 = arith.mulf %77, %1 : f32
        %79 = affine.load %arg2[%arg6 * 32 + 19] {partition_indices = [19]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %80 = arith.addf %78, %79 : f32
        affine.store %80, %arg2[%arg6 * 32 + 19] {partition_indices = [19]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %81 = affine.load %arg1[%arg6 * 32 + 20, %arg5] {max_mux_size = 32 : i64, partition_indices = [20, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %82 = arith.mulf %81, %1 : f32
        %83 = affine.load %arg2[%arg6 * 32 + 20] {partition_indices = [20]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %84 = arith.addf %82, %83 : f32
        affine.store %84, %arg2[%arg6 * 32 + 20] {partition_indices = [20]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %85 = affine.load %arg1[%arg6 * 32 + 21, %arg5] {max_mux_size = 32 : i64, partition_indices = [21, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %86 = arith.mulf %85, %1 : f32
        %87 = affine.load %arg2[%arg6 * 32 + 21] {partition_indices = [21]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %88 = arith.addf %86, %87 : f32
        affine.store %88, %arg2[%arg6 * 32 + 21] {partition_indices = [21]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %89 = affine.load %arg1[%arg6 * 32 + 22, %arg5] {max_mux_size = 32 : i64, partition_indices = [22, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %90 = arith.mulf %89, %1 : f32
        %91 = affine.load %arg2[%arg6 * 32 + 22] {partition_indices = [22]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %92 = arith.addf %90, %91 : f32
        affine.store %92, %arg2[%arg6 * 32 + 22] {partition_indices = [22]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %93 = affine.load %arg1[%arg6 * 32 + 23, %arg5] {max_mux_size = 32 : i64, partition_indices = [23, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %94 = arith.mulf %93, %1 : f32
        %95 = affine.load %arg2[%arg6 * 32 + 23] {partition_indices = [23]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %96 = arith.addf %94, %95 : f32
        affine.store %96, %arg2[%arg6 * 32 + 23] {partition_indices = [23]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %97 = affine.load %arg1[%arg6 * 32 + 24, %arg5] {max_mux_size = 32 : i64, partition_indices = [24, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %98 = arith.mulf %97, %1 : f32
        %99 = affine.load %arg2[%arg6 * 32 + 24] {partition_indices = [24]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %100 = arith.addf %98, %99 : f32
        affine.store %100, %arg2[%arg6 * 32 + 24] {partition_indices = [24]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %101 = affine.load %arg1[%arg6 * 32 + 25, %arg5] {max_mux_size = 32 : i64, partition_indices = [25, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %102 = arith.mulf %101, %1 : f32
        %103 = affine.load %arg2[%arg6 * 32 + 25] {partition_indices = [25]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %104 = arith.addf %102, %103 : f32
        affine.store %104, %arg2[%arg6 * 32 + 25] {partition_indices = [25]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %105 = affine.load %arg1[%arg6 * 32 + 26, %arg5] {max_mux_size = 32 : i64, partition_indices = [26, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %106 = arith.mulf %105, %1 : f32
        %107 = affine.load %arg2[%arg6 * 32 + 26] {partition_indices = [26]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %108 = arith.addf %106, %107 : f32
        affine.store %108, %arg2[%arg6 * 32 + 26] {partition_indices = [26]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %109 = affine.load %arg1[%arg6 * 32 + 27, %arg5] {max_mux_size = 32 : i64, partition_indices = [27, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %110 = arith.mulf %109, %1 : f32
        %111 = affine.load %arg2[%arg6 * 32 + 27] {partition_indices = [27]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %112 = arith.addf %110, %111 : f32
        affine.store %112, %arg2[%arg6 * 32 + 27] {partition_indices = [27]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %113 = affine.load %arg1[%arg6 * 32 + 28, %arg5] {max_mux_size = 32 : i64, partition_indices = [28, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %114 = arith.mulf %113, %1 : f32
        %115 = affine.load %arg2[%arg6 * 32 + 28] {partition_indices = [28]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %116 = arith.addf %114, %115 : f32
        affine.store %116, %arg2[%arg6 * 32 + 28] {partition_indices = [28]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %117 = affine.load %arg1[%arg6 * 32 + 29, %arg5] {max_mux_size = 32 : i64, partition_indices = [29, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %118 = arith.mulf %117, %1 : f32
        %119 = affine.load %arg2[%arg6 * 32 + 29] {partition_indices = [29]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %120 = arith.addf %118, %119 : f32
        affine.store %120, %arg2[%arg6 * 32 + 29] {partition_indices = [29]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %121 = affine.load %arg1[%arg6 * 32 + 30, %arg5] {max_mux_size = 32 : i64, partition_indices = [30, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %122 = arith.mulf %121, %1 : f32
        %123 = affine.load %arg2[%arg6 * 32 + 30] {partition_indices = [30]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %124 = arith.addf %122, %123 : f32
        affine.store %124, %arg2[%arg6 * 32 + 30] {partition_indices = [30]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %125 = affine.load %arg1[%arg6 * 32 + 31, %arg5] {max_mux_size = 32 : i64, partition_indices = [31, -1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %126 = arith.mulf %125, %1 : f32
        %127 = affine.load %arg2[%arg6 * 32 + 31] {partition_indices = [31]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %128 = arith.addf %126, %127 : f32
        affine.store %128, %arg2[%arg6 * 32 + 31] {partition_indices = [31]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg5 = 0 to 4096 {
      affine.for %arg6 = 0 to 128 {
        %0 = affine.load %arg1[%arg5, %arg6 * 32] {max_mux_size = 32 : i64, partition_indices = [-1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %1 = affine.load %arg2[%arg5] {max_mux_size = 32 : i64, partition_indices = [-1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %3 = affine.load %arg4[%arg6 * 32] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %4, %arg4[%arg6 * 32] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %5 = affine.load %arg1[%arg5, %arg6 * 32 + 1] {max_mux_size = 32 : i64, partition_indices = [-1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %6 = arith.mulf %5, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %7 = affine.load %arg4[%arg6 * 32 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %8 = arith.addf %6, %7 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %8, %arg4[%arg6 * 32 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %9 = affine.load %arg1[%arg5, %arg6 * 32 + 2] {max_mux_size = 32 : i64, partition_indices = [-1, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %10 = arith.mulf %9, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %11 = affine.load %arg4[%arg6 * 32 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %12 = arith.addf %10, %11 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %12, %arg4[%arg6 * 32 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %13 = affine.load %arg1[%arg5, %arg6 * 32 + 3] {max_mux_size = 32 : i64, partition_indices = [-1, 3], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %14 = arith.mulf %13, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %15 = affine.load %arg4[%arg6 * 32 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %16 = arith.addf %14, %15 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %16, %arg4[%arg6 * 32 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %17 = affine.load %arg1[%arg5, %arg6 * 32 + 4] {max_mux_size = 32 : i64, partition_indices = [-1, 4], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %18 = arith.mulf %17, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %19 = affine.load %arg4[%arg6 * 32 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %20, %arg4[%arg6 * 32 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %21 = affine.load %arg1[%arg5, %arg6 * 32 + 5] {max_mux_size = 32 : i64, partition_indices = [-1, 5], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %22 = arith.mulf %21, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %23 = affine.load %arg4[%arg6 * 32 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %24 = arith.addf %22, %23 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %24, %arg4[%arg6 * 32 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %25 = affine.load %arg1[%arg5, %arg6 * 32 + 6] {max_mux_size = 32 : i64, partition_indices = [-1, 6], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %26 = arith.mulf %25, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %27 = affine.load %arg4[%arg6 * 32 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %28 = arith.addf %26, %27 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %28, %arg4[%arg6 * 32 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %29 = affine.load %arg1[%arg5, %arg6 * 32 + 7] {max_mux_size = 32 : i64, partition_indices = [-1, 7], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %30 = arith.mulf %29, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %31 = affine.load %arg4[%arg6 * 32 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %32 = arith.addf %30, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %32, %arg4[%arg6 * 32 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %33 = affine.load %arg1[%arg5, %arg6 * 32 + 8] {max_mux_size = 32 : i64, partition_indices = [-1, 8], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %34 = arith.mulf %33, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %35 = affine.load %arg4[%arg6 * 32 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %36 = arith.addf %34, %35 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %36, %arg4[%arg6 * 32 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %37 = affine.load %arg1[%arg5, %arg6 * 32 + 9] {max_mux_size = 32 : i64, partition_indices = [-1, 9], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %38 = arith.mulf %37, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %39 = affine.load %arg4[%arg6 * 32 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %40 = arith.addf %38, %39 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %40, %arg4[%arg6 * 32 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %41 = affine.load %arg1[%arg5, %arg6 * 32 + 10] {max_mux_size = 32 : i64, partition_indices = [-1, 10], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %42 = arith.mulf %41, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %43 = affine.load %arg4[%arg6 * 32 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %44 = arith.addf %42, %43 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %44, %arg4[%arg6 * 32 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %45 = affine.load %arg1[%arg5, %arg6 * 32 + 11] {max_mux_size = 32 : i64, partition_indices = [-1, 11], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %46 = arith.mulf %45, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %47 = affine.load %arg4[%arg6 * 32 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %48 = arith.addf %46, %47 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %48, %arg4[%arg6 * 32 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %49 = affine.load %arg1[%arg5, %arg6 * 32 + 12] {max_mux_size = 32 : i64, partition_indices = [-1, 12], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %50 = arith.mulf %49, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %51 = affine.load %arg4[%arg6 * 32 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %52 = arith.addf %50, %51 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %52, %arg4[%arg6 * 32 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %53 = affine.load %arg1[%arg5, %arg6 * 32 + 13] {max_mux_size = 32 : i64, partition_indices = [-1, 13], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %54 = arith.mulf %53, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %55 = affine.load %arg4[%arg6 * 32 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %56 = arith.addf %54, %55 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %56, %arg4[%arg6 * 32 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %57 = affine.load %arg1[%arg5, %arg6 * 32 + 14] {max_mux_size = 32 : i64, partition_indices = [-1, 14], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %58 = arith.mulf %57, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %59 = affine.load %arg4[%arg6 * 32 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %60 = arith.addf %58, %59 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %60, %arg4[%arg6 * 32 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %61 = affine.load %arg1[%arg5, %arg6 * 32 + 15] {max_mux_size = 32 : i64, partition_indices = [-1, 15], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %62 = arith.mulf %61, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %63 = affine.load %arg4[%arg6 * 32 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %64 = arith.addf %62, %63 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %64, %arg4[%arg6 * 32 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %65 = affine.load %arg1[%arg5, %arg6 * 32 + 16] {max_mux_size = 32 : i64, partition_indices = [-1, 16], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %66 = arith.mulf %65, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %67 = affine.load %arg4[%arg6 * 32 + 16] {partition_indices = [16], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %68 = arith.addf %66, %67 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %68, %arg4[%arg6 * 32 + 16] {partition_indices = [16], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %69 = affine.load %arg1[%arg5, %arg6 * 32 + 17] {max_mux_size = 32 : i64, partition_indices = [-1, 17], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %70 = arith.mulf %69, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %71 = affine.load %arg4[%arg6 * 32 + 17] {partition_indices = [17], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %72 = arith.addf %70, %71 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %72, %arg4[%arg6 * 32 + 17] {partition_indices = [17], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %73 = affine.load %arg1[%arg5, %arg6 * 32 + 18] {max_mux_size = 32 : i64, partition_indices = [-1, 18], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %74 = arith.mulf %73, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %75 = affine.load %arg4[%arg6 * 32 + 18] {partition_indices = [18], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %76 = arith.addf %74, %75 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %76, %arg4[%arg6 * 32 + 18] {partition_indices = [18], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %77 = affine.load %arg1[%arg5, %arg6 * 32 + 19] {max_mux_size = 32 : i64, partition_indices = [-1, 19], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %78 = arith.mulf %77, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %79 = affine.load %arg4[%arg6 * 32 + 19] {partition_indices = [19], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %80 = arith.addf %78, %79 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %80, %arg4[%arg6 * 32 + 19] {partition_indices = [19], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %81 = affine.load %arg1[%arg5, %arg6 * 32 + 20] {max_mux_size = 32 : i64, partition_indices = [-1, 20], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %82 = arith.mulf %81, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %83 = affine.load %arg4[%arg6 * 32 + 20] {partition_indices = [20], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %84 = arith.addf %82, %83 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %84, %arg4[%arg6 * 32 + 20] {partition_indices = [20], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %85 = affine.load %arg1[%arg5, %arg6 * 32 + 21] {max_mux_size = 32 : i64, partition_indices = [-1, 21], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %86 = arith.mulf %85, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %87 = affine.load %arg4[%arg6 * 32 + 21] {partition_indices = [21], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %88 = arith.addf %86, %87 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %88, %arg4[%arg6 * 32 + 21] {partition_indices = [21], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %89 = affine.load %arg1[%arg5, %arg6 * 32 + 22] {max_mux_size = 32 : i64, partition_indices = [-1, 22], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %90 = arith.mulf %89, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %91 = affine.load %arg4[%arg6 * 32 + 22] {partition_indices = [22], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %92 = arith.addf %90, %91 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %92, %arg4[%arg6 * 32 + 22] {partition_indices = [22], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %93 = affine.load %arg1[%arg5, %arg6 * 32 + 23] {max_mux_size = 32 : i64, partition_indices = [-1, 23], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %94 = arith.mulf %93, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %95 = affine.load %arg4[%arg6 * 32 + 23] {partition_indices = [23], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %96 = arith.addf %94, %95 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %96, %arg4[%arg6 * 32 + 23] {partition_indices = [23], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %97 = affine.load %arg1[%arg5, %arg6 * 32 + 24] {max_mux_size = 32 : i64, partition_indices = [-1, 24], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %98 = arith.mulf %97, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %99 = affine.load %arg4[%arg6 * 32 + 24] {partition_indices = [24], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %100 = arith.addf %98, %99 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %100, %arg4[%arg6 * 32 + 24] {partition_indices = [24], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %101 = affine.load %arg1[%arg5, %arg6 * 32 + 25] {max_mux_size = 32 : i64, partition_indices = [-1, 25], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %102 = arith.mulf %101, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %103 = affine.load %arg4[%arg6 * 32 + 25] {partition_indices = [25], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %104 = arith.addf %102, %103 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %104, %arg4[%arg6 * 32 + 25] {partition_indices = [25], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %105 = affine.load %arg1[%arg5, %arg6 * 32 + 26] {max_mux_size = 32 : i64, partition_indices = [-1, 26], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %106 = arith.mulf %105, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %107 = affine.load %arg4[%arg6 * 32 + 26] {partition_indices = [26], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %108 = arith.addf %106, %107 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %108, %arg4[%arg6 * 32 + 26] {partition_indices = [26], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %109 = affine.load %arg1[%arg5, %arg6 * 32 + 27] {max_mux_size = 32 : i64, partition_indices = [-1, 27], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %110 = arith.mulf %109, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %111 = affine.load %arg4[%arg6 * 32 + 27] {partition_indices = [27], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %112 = arith.addf %110, %111 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %112, %arg4[%arg6 * 32 + 27] {partition_indices = [27], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %113 = affine.load %arg1[%arg5, %arg6 * 32 + 28] {max_mux_size = 32 : i64, partition_indices = [-1, 28], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %114 = arith.mulf %113, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %115 = affine.load %arg4[%arg6 * 32 + 28] {partition_indices = [28], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %116 = arith.addf %114, %115 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %116, %arg4[%arg6 * 32 + 28] {partition_indices = [28], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %117 = affine.load %arg1[%arg5, %arg6 * 32 + 29] {max_mux_size = 32 : i64, partition_indices = [-1, 29], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %118 = arith.mulf %117, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %119 = affine.load %arg4[%arg6 * 32 + 29] {partition_indices = [29], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %120 = arith.addf %118, %119 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %120, %arg4[%arg6 * 32 + 29] {partition_indices = [29], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %121 = affine.load %arg1[%arg5, %arg6 * 32 + 30] {max_mux_size = 32 : i64, partition_indices = [-1, 30], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %122 = arith.mulf %121, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %123 = affine.load %arg4[%arg6 * 32 + 30] {partition_indices = [30], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %124 = arith.addf %122, %123 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %124, %arg4[%arg6 * 32 + 30] {partition_indices = [30], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %125 = affine.load %arg1[%arg5, %arg6 * 32 + 31] {max_mux_size = 32 : i64, partition_indices = [-1, 31], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 32, d1 mod 32, d0 floordiv 32, d1 floordiv 32)>>
        %126 = arith.mulf %125, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %127 = affine.load %arg4[%arg6 * 32 + 31] {partition_indices = [31], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
        %128 = arith.addf %126, %127 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %128, %arg4[%arg6 * 32 + 31] {partition_indices = [31], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 32, d0 floordiv 32)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=128, iterLatency=12, minII=1>, parallel, timing = #hls.t<0 -> 141, 141, 141>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=524288, iterLatency=12, minII=1>, resource = #hls.r<lut=0, dsp=160, bram=0>, timing = #hls.t<0 -> 524301, 524301, 524301>}
    return
  }
}