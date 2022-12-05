module {
  func @gemver(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>, %arg3: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg5: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg6: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg7: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg8: memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg9: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg10: memref<4096xf32, affine_map<(d0) -> (0, d0)>>) attributes {resource = #hls.r<lut=0, dsp=160, bram=0>, timing = #hls.t<0 -> 3178552, 3178552, 3178552>, top_func} {
    affine.for %arg11 = 0 to 4096 {
      affine.for %arg12 = 0 to 256 {
        %0 = affine.load %arg3[%arg11] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %1 = affine.load %arg5[%arg12 * 16] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg4[%arg11] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %4 = affine.load %arg6[%arg12 * 16] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %5 = arith.mulf %3, %4 : f32
        %6 = arith.addf %5, %2 : f32
        %7 = affine.load %arg2[%arg11, %arg12 * 16] {max_mux_size = 16 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %8 = arith.addf %6, %7 : f32
        affine.store %8, %arg2[%arg11, %arg12 * 16] {max_mux_size = 16 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %9 = affine.load %arg5[%arg12 * 16 + 1] {partition_indices = [1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %10 = arith.mulf %0, %9 : f32
        %11 = affine.load %arg6[%arg12 * 16 + 1] {partition_indices = [1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %12 = arith.mulf %3, %11 : f32
        %13 = arith.addf %12, %10 : f32
        %14 = affine.load %arg2[%arg11, %arg12 * 16 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %15 = arith.addf %13, %14 : f32
        affine.store %15, %arg2[%arg11, %arg12 * 16 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %16 = affine.load %arg5[%arg12 * 16 + 2] {partition_indices = [2]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %17 = arith.mulf %0, %16 : f32
        %18 = affine.load %arg6[%arg12 * 16 + 2] {partition_indices = [2]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %19 = arith.mulf %3, %18 : f32
        %20 = arith.addf %19, %17 : f32
        %21 = affine.load %arg2[%arg11, %arg12 * 16 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %22 = arith.addf %20, %21 : f32
        affine.store %22, %arg2[%arg11, %arg12 * 16 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %23 = affine.load %arg5[%arg12 * 16 + 3] {partition_indices = [3]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %24 = arith.mulf %0, %23 : f32
        %25 = affine.load %arg6[%arg12 * 16 + 3] {partition_indices = [3]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %26 = arith.mulf %3, %25 : f32
        %27 = arith.addf %26, %24 : f32
        %28 = affine.load %arg2[%arg11, %arg12 * 16 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %29 = arith.addf %27, %28 : f32
        affine.store %29, %arg2[%arg11, %arg12 * 16 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %30 = affine.load %arg5[%arg12 * 16 + 4] {partition_indices = [4]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %31 = arith.mulf %0, %30 : f32
        %32 = affine.load %arg6[%arg12 * 16 + 4] {partition_indices = [4]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %33 = arith.mulf %3, %32 : f32
        %34 = arith.addf %33, %31 : f32
        %35 = affine.load %arg2[%arg11, %arg12 * 16 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %36 = arith.addf %34, %35 : f32
        affine.store %36, %arg2[%arg11, %arg12 * 16 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %37 = affine.load %arg5[%arg12 * 16 + 5] {partition_indices = [5]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %38 = arith.mulf %0, %37 : f32
        %39 = affine.load %arg6[%arg12 * 16 + 5] {partition_indices = [5]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %40 = arith.mulf %3, %39 : f32
        %41 = arith.addf %40, %38 : f32
        %42 = affine.load %arg2[%arg11, %arg12 * 16 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %43 = arith.addf %41, %42 : f32
        affine.store %43, %arg2[%arg11, %arg12 * 16 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %44 = affine.load %arg5[%arg12 * 16 + 6] {partition_indices = [6]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %45 = arith.mulf %0, %44 : f32
        %46 = affine.load %arg6[%arg12 * 16 + 6] {partition_indices = [6]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %47 = arith.mulf %3, %46 : f32
        %48 = arith.addf %47, %45 : f32
        %49 = affine.load %arg2[%arg11, %arg12 * 16 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %50 = arith.addf %48, %49 : f32
        affine.store %50, %arg2[%arg11, %arg12 * 16 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %51 = affine.load %arg5[%arg12 * 16 + 7] {partition_indices = [7]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %52 = arith.mulf %0, %51 : f32
        %53 = affine.load %arg6[%arg12 * 16 + 7] {partition_indices = [7]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %54 = arith.mulf %3, %53 : f32
        %55 = arith.addf %54, %52 : f32
        %56 = affine.load %arg2[%arg11, %arg12 * 16 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %57 = arith.addf %55, %56 : f32
        affine.store %57, %arg2[%arg11, %arg12 * 16 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %58 = affine.load %arg5[%arg12 * 16 + 8] {partition_indices = [8]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %59 = arith.mulf %0, %58 : f32
        %60 = affine.load %arg6[%arg12 * 16 + 8] {partition_indices = [8]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %61 = arith.mulf %3, %60 : f32
        %62 = arith.addf %61, %59 : f32
        %63 = affine.load %arg2[%arg11, %arg12 * 16 + 8] {max_mux_size = 16 : i64, partition_indices = [-1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %64 = arith.addf %62, %63 : f32
        affine.store %64, %arg2[%arg11, %arg12 * 16 + 8] {max_mux_size = 16 : i64, partition_indices = [-1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %65 = affine.load %arg5[%arg12 * 16 + 9] {partition_indices = [9]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %66 = arith.mulf %0, %65 : f32
        %67 = affine.load %arg6[%arg12 * 16 + 9] {partition_indices = [9]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %68 = arith.mulf %3, %67 : f32
        %69 = arith.addf %68, %66 : f32
        %70 = affine.load %arg2[%arg11, %arg12 * 16 + 9] {max_mux_size = 16 : i64, partition_indices = [-1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %71 = arith.addf %69, %70 : f32
        affine.store %71, %arg2[%arg11, %arg12 * 16 + 9] {max_mux_size = 16 : i64, partition_indices = [-1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %72 = affine.load %arg5[%arg12 * 16 + 10] {partition_indices = [10]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %73 = arith.mulf %0, %72 : f32
        %74 = affine.load %arg6[%arg12 * 16 + 10] {partition_indices = [10]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %75 = arith.mulf %3, %74 : f32
        %76 = arith.addf %75, %73 : f32
        %77 = affine.load %arg2[%arg11, %arg12 * 16 + 10] {max_mux_size = 16 : i64, partition_indices = [-1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %78 = arith.addf %76, %77 : f32
        affine.store %78, %arg2[%arg11, %arg12 * 16 + 10] {max_mux_size = 16 : i64, partition_indices = [-1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %79 = affine.load %arg5[%arg12 * 16 + 11] {partition_indices = [11]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %80 = arith.mulf %0, %79 : f32
        %81 = affine.load %arg6[%arg12 * 16 + 11] {partition_indices = [11]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %82 = arith.mulf %3, %81 : f32
        %83 = arith.addf %82, %80 : f32
        %84 = affine.load %arg2[%arg11, %arg12 * 16 + 11] {max_mux_size = 16 : i64, partition_indices = [-1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %85 = arith.addf %83, %84 : f32
        affine.store %85, %arg2[%arg11, %arg12 * 16 + 11] {max_mux_size = 16 : i64, partition_indices = [-1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %86 = affine.load %arg5[%arg12 * 16 + 12] {partition_indices = [12]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %87 = arith.mulf %0, %86 : f32
        %88 = affine.load %arg6[%arg12 * 16 + 12] {partition_indices = [12]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %89 = arith.mulf %3, %88 : f32
        %90 = arith.addf %89, %87 : f32
        %91 = affine.load %arg2[%arg11, %arg12 * 16 + 12] {max_mux_size = 16 : i64, partition_indices = [-1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %92 = arith.addf %90, %91 : f32
        affine.store %92, %arg2[%arg11, %arg12 * 16 + 12] {max_mux_size = 16 : i64, partition_indices = [-1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %93 = affine.load %arg5[%arg12 * 16 + 13] {partition_indices = [13]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %94 = arith.mulf %0, %93 : f32
        %95 = affine.load %arg6[%arg12 * 16 + 13] {partition_indices = [13]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %96 = arith.mulf %3, %95 : f32
        %97 = arith.addf %96, %94 : f32
        %98 = affine.load %arg2[%arg11, %arg12 * 16 + 13] {max_mux_size = 16 : i64, partition_indices = [-1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %99 = arith.addf %97, %98 : f32
        affine.store %99, %arg2[%arg11, %arg12 * 16 + 13] {max_mux_size = 16 : i64, partition_indices = [-1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %100 = affine.load %arg5[%arg12 * 16 + 14] {partition_indices = [14]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %101 = arith.mulf %0, %100 : f32
        %102 = affine.load %arg6[%arg12 * 16 + 14] {partition_indices = [14]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %103 = arith.mulf %3, %102 : f32
        %104 = arith.addf %103, %101 : f32
        %105 = affine.load %arg2[%arg11, %arg12 * 16 + 14] {max_mux_size = 16 : i64, partition_indices = [-1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %106 = arith.addf %104, %105 : f32
        affine.store %106, %arg2[%arg11, %arg12 * 16 + 14] {max_mux_size = 16 : i64, partition_indices = [-1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %107 = affine.load %arg5[%arg12 * 16 + 15] {partition_indices = [15]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %108 = arith.mulf %0, %107 : f32
        %109 = affine.load %arg6[%arg12 * 16 + 15] {partition_indices = [15]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %110 = arith.mulf %3, %109 : f32
        %111 = arith.addf %110, %108 : f32
        %112 = affine.load %arg2[%arg11, %arg12 * 16 + 15] {max_mux_size = 16 : i64, partition_indices = [-1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %113 = arith.addf %111, %112 : f32
        affine.store %113, %arg2[%arg11, %arg12 * 16 + 15] {max_mux_size = 16 : i64, partition_indices = [-1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg11 = 0 to 4096 {
      affine.for %arg12 = 0 to 256 {
        %0 = affine.load %arg2[%arg11, %arg12 * 16] {max_mux_size = 16 : i64, partition_indices = [-1, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %1 = arith.mulf %arg1, %0 : f32
        %2 = affine.load %arg9[%arg11] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %3 = arith.mulf %2, %1 : f32
        %4 = affine.load %arg8[%arg12 * 16] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %5 = arith.addf %3, %4 : f32
        affine.store %5, %arg8[%arg12 * 16] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %6 = affine.load %arg2[%arg11, %arg12 * 16 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 1]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %7 = arith.mulf %arg1, %6 : f32
        %8 = arith.mulf %2, %7 : f32
        %9 = affine.load %arg8[%arg12 * 16 + 1] {partition_indices = [1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %10 = arith.addf %8, %9 : f32
        affine.store %10, %arg8[%arg12 * 16 + 1] {partition_indices = [1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %11 = affine.load %arg2[%arg11, %arg12 * 16 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, 2]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %12 = arith.mulf %arg1, %11 : f32
        %13 = arith.mulf %2, %12 : f32
        %14 = affine.load %arg8[%arg12 * 16 + 2] {partition_indices = [2]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %15 = arith.addf %13, %14 : f32
        affine.store %15, %arg8[%arg12 * 16 + 2] {partition_indices = [2]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %16 = affine.load %arg2[%arg11, %arg12 * 16 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, 3]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %17 = arith.mulf %arg1, %16 : f32
        %18 = arith.mulf %2, %17 : f32
        %19 = affine.load %arg8[%arg12 * 16 + 3] {partition_indices = [3]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %20 = arith.addf %18, %19 : f32
        affine.store %20, %arg8[%arg12 * 16 + 3] {partition_indices = [3]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %21 = affine.load %arg2[%arg11, %arg12 * 16 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, 4]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %22 = arith.mulf %arg1, %21 : f32
        %23 = arith.mulf %2, %22 : f32
        %24 = affine.load %arg8[%arg12 * 16 + 4] {partition_indices = [4]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %25 = arith.addf %23, %24 : f32
        affine.store %25, %arg8[%arg12 * 16 + 4] {partition_indices = [4]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %26 = affine.load %arg2[%arg11, %arg12 * 16 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, 5]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %27 = arith.mulf %arg1, %26 : f32
        %28 = arith.mulf %2, %27 : f32
        %29 = affine.load %arg8[%arg12 * 16 + 5] {partition_indices = [5]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %30 = arith.addf %28, %29 : f32
        affine.store %30, %arg8[%arg12 * 16 + 5] {partition_indices = [5]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %31 = affine.load %arg2[%arg11, %arg12 * 16 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, 6]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %32 = arith.mulf %arg1, %31 : f32
        %33 = arith.mulf %2, %32 : f32
        %34 = affine.load %arg8[%arg12 * 16 + 6] {partition_indices = [6]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %35 = arith.addf %33, %34 : f32
        affine.store %35, %arg8[%arg12 * 16 + 6] {partition_indices = [6]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %36 = affine.load %arg2[%arg11, %arg12 * 16 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, 7]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %37 = arith.mulf %arg1, %36 : f32
        %38 = arith.mulf %2, %37 : f32
        %39 = affine.load %arg8[%arg12 * 16 + 7] {partition_indices = [7]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %40 = arith.addf %38, %39 : f32
        affine.store %40, %arg8[%arg12 * 16 + 7] {partition_indices = [7]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %41 = affine.load %arg2[%arg11, %arg12 * 16 + 8] {max_mux_size = 16 : i64, partition_indices = [-1, 8]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %42 = arith.mulf %arg1, %41 : f32
        %43 = arith.mulf %2, %42 : f32
        %44 = affine.load %arg8[%arg12 * 16 + 8] {partition_indices = [8]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %45 = arith.addf %43, %44 : f32
        affine.store %45, %arg8[%arg12 * 16 + 8] {partition_indices = [8]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %46 = affine.load %arg2[%arg11, %arg12 * 16 + 9] {max_mux_size = 16 : i64, partition_indices = [-1, 9]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %47 = arith.mulf %arg1, %46 : f32
        %48 = arith.mulf %2, %47 : f32
        %49 = affine.load %arg8[%arg12 * 16 + 9] {partition_indices = [9]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %50 = arith.addf %48, %49 : f32
        affine.store %50, %arg8[%arg12 * 16 + 9] {partition_indices = [9]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %51 = affine.load %arg2[%arg11, %arg12 * 16 + 10] {max_mux_size = 16 : i64, partition_indices = [-1, 10]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %52 = arith.mulf %arg1, %51 : f32
        %53 = arith.mulf %2, %52 : f32
        %54 = affine.load %arg8[%arg12 * 16 + 10] {partition_indices = [10]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %55 = arith.addf %53, %54 : f32
        affine.store %55, %arg8[%arg12 * 16 + 10] {partition_indices = [10]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %56 = affine.load %arg2[%arg11, %arg12 * 16 + 11] {max_mux_size = 16 : i64, partition_indices = [-1, 11]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %57 = arith.mulf %arg1, %56 : f32
        %58 = arith.mulf %2, %57 : f32
        %59 = affine.load %arg8[%arg12 * 16 + 11] {partition_indices = [11]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %60 = arith.addf %58, %59 : f32
        affine.store %60, %arg8[%arg12 * 16 + 11] {partition_indices = [11]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %61 = affine.load %arg2[%arg11, %arg12 * 16 + 12] {max_mux_size = 16 : i64, partition_indices = [-1, 12]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %62 = arith.mulf %arg1, %61 : f32
        %63 = arith.mulf %2, %62 : f32
        %64 = affine.load %arg8[%arg12 * 16 + 12] {partition_indices = [12]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %65 = arith.addf %63, %64 : f32
        affine.store %65, %arg8[%arg12 * 16 + 12] {partition_indices = [12]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %66 = affine.load %arg2[%arg11, %arg12 * 16 + 13] {max_mux_size = 16 : i64, partition_indices = [-1, 13]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %67 = arith.mulf %arg1, %66 : f32
        %68 = arith.mulf %2, %67 : f32
        %69 = affine.load %arg8[%arg12 * 16 + 13] {partition_indices = [13]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %70 = arith.addf %68, %69 : f32
        affine.store %70, %arg8[%arg12 * 16 + 13] {partition_indices = [13]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %71 = affine.load %arg2[%arg11, %arg12 * 16 + 14] {max_mux_size = 16 : i64, partition_indices = [-1, 14]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %72 = arith.mulf %arg1, %71 : f32
        %73 = arith.mulf %2, %72 : f32
        %74 = affine.load %arg8[%arg12 * 16 + 14] {partition_indices = [14]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %75 = arith.addf %73, %74 : f32
        affine.store %75, %arg8[%arg12 * 16 + 14] {partition_indices = [14]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %76 = affine.load %arg2[%arg11, %arg12 * 16 + 15] {max_mux_size = 16 : i64, partition_indices = [-1, 15]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %77 = arith.mulf %arg1, %76 : f32
        %78 = arith.mulf %2, %77 : f32
        %79 = affine.load %arg8[%arg12 * 16 + 15] {partition_indices = [15]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %80 = arith.addf %78, %79 : f32
        affine.store %80, %arg8[%arg12 * 16 + 15] {partition_indices = [15]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg11 = 0 to 4096 {
      %0 = affine.load %arg8[%arg11] {max_mux_size = 16 : i64, partition_indices = [-1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      %1 = affine.load %arg10[%arg11] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %arg8[%arg11] {max_mux_size = 16 : i64, partition_indices = [-1]} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
    } {parallel}
    affine.for %arg11 = 0 to 4096 {
      affine.for %arg12 = 0 to 256 {
        %0 = affine.load %arg2[%arg12 * 16, %arg11] {max_mux_size = 16 : i64, partition_indices = [0, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %1 = arith.mulf %arg0, %0 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %2 = affine.load %arg8[%arg11] {max_mux_size = 16 : i64, partition_indices = [-1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %3 = arith.mulf %2, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %4 = affine.load %arg7[%arg12 * 16] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %5 = arith.addf %3, %4 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %5, %arg7[%arg12 * 16] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %6 = affine.load %arg2[%arg12 * 16 + 1, %arg11] {max_mux_size = 16 : i64, partition_indices = [1, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %7 = arith.mulf %arg0, %6 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %8 = arith.mulf %2, %7 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %9 = affine.load %arg7[%arg12 * 16 + 1] {partition_indices = [1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %10 = arith.addf %8, %9 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %10, %arg7[%arg12 * 16 + 1] {partition_indices = [1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %11 = affine.load %arg2[%arg12 * 16 + 2, %arg11] {max_mux_size = 16 : i64, partition_indices = [2, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %12 = arith.mulf %arg0, %11 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %13 = arith.mulf %2, %12 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %14 = affine.load %arg7[%arg12 * 16 + 2] {partition_indices = [2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %15 = arith.addf %13, %14 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %15, %arg7[%arg12 * 16 + 2] {partition_indices = [2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %16 = affine.load %arg2[%arg12 * 16 + 3, %arg11] {max_mux_size = 16 : i64, partition_indices = [3, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %17 = arith.mulf %arg0, %16 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %18 = arith.mulf %2, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %19 = affine.load %arg7[%arg12 * 16 + 3] {partition_indices = [3], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %20, %arg7[%arg12 * 16 + 3] {partition_indices = [3], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %21 = affine.load %arg2[%arg12 * 16 + 4, %arg11] {max_mux_size = 16 : i64, partition_indices = [4, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %22 = arith.mulf %arg0, %21 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %23 = arith.mulf %2, %22 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %24 = affine.load %arg7[%arg12 * 16 + 4] {partition_indices = [4], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %25 = arith.addf %23, %24 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %25, %arg7[%arg12 * 16 + 4] {partition_indices = [4], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %26 = affine.load %arg2[%arg12 * 16 + 5, %arg11] {max_mux_size = 16 : i64, partition_indices = [5, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %27 = arith.mulf %arg0, %26 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %28 = arith.mulf %2, %27 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %29 = affine.load %arg7[%arg12 * 16 + 5] {partition_indices = [5], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %30 = arith.addf %28, %29 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %30, %arg7[%arg12 * 16 + 5] {partition_indices = [5], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %31 = affine.load %arg2[%arg12 * 16 + 6, %arg11] {max_mux_size = 16 : i64, partition_indices = [6, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %32 = arith.mulf %arg0, %31 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %33 = arith.mulf %2, %32 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %34 = affine.load %arg7[%arg12 * 16 + 6] {partition_indices = [6], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %35 = arith.addf %33, %34 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %35, %arg7[%arg12 * 16 + 6] {partition_indices = [6], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %36 = affine.load %arg2[%arg12 * 16 + 7, %arg11] {max_mux_size = 16 : i64, partition_indices = [7, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %37 = arith.mulf %arg0, %36 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %38 = arith.mulf %2, %37 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %39 = affine.load %arg7[%arg12 * 16 + 7] {partition_indices = [7], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %40 = arith.addf %38, %39 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %40, %arg7[%arg12 * 16 + 7] {partition_indices = [7], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %41 = affine.load %arg2[%arg12 * 16 + 8, %arg11] {max_mux_size = 16 : i64, partition_indices = [8, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %42 = arith.mulf %arg0, %41 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %43 = arith.mulf %2, %42 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %44 = affine.load %arg7[%arg12 * 16 + 8] {partition_indices = [8], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %45 = arith.addf %43, %44 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %45, %arg7[%arg12 * 16 + 8] {partition_indices = [8], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %46 = affine.load %arg2[%arg12 * 16 + 9, %arg11] {max_mux_size = 16 : i64, partition_indices = [9, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %47 = arith.mulf %arg0, %46 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %48 = arith.mulf %2, %47 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %49 = affine.load %arg7[%arg12 * 16 + 9] {partition_indices = [9], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %50 = arith.addf %48, %49 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %50, %arg7[%arg12 * 16 + 9] {partition_indices = [9], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %51 = affine.load %arg2[%arg12 * 16 + 10, %arg11] {max_mux_size = 16 : i64, partition_indices = [10, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %52 = arith.mulf %arg0, %51 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %53 = arith.mulf %2, %52 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %54 = affine.load %arg7[%arg12 * 16 + 10] {partition_indices = [10], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %55 = arith.addf %53, %54 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %55, %arg7[%arg12 * 16 + 10] {partition_indices = [10], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %56 = affine.load %arg2[%arg12 * 16 + 11, %arg11] {max_mux_size = 16 : i64, partition_indices = [11, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %57 = arith.mulf %arg0, %56 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %58 = arith.mulf %2, %57 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %59 = affine.load %arg7[%arg12 * 16 + 11] {partition_indices = [11], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %60 = arith.addf %58, %59 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %60, %arg7[%arg12 * 16 + 11] {partition_indices = [11], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %61 = affine.load %arg2[%arg12 * 16 + 12, %arg11] {max_mux_size = 16 : i64, partition_indices = [12, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %62 = arith.mulf %arg0, %61 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %63 = arith.mulf %2, %62 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %64 = affine.load %arg7[%arg12 * 16 + 12] {partition_indices = [12], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %65 = arith.addf %63, %64 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %65, %arg7[%arg12 * 16 + 12] {partition_indices = [12], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %66 = affine.load %arg2[%arg12 * 16 + 13, %arg11] {max_mux_size = 16 : i64, partition_indices = [13, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %67 = arith.mulf %arg0, %66 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %68 = arith.mulf %2, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %69 = affine.load %arg7[%arg12 * 16 + 13] {partition_indices = [13], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %70 = arith.addf %68, %69 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %70, %arg7[%arg12 * 16 + 13] {partition_indices = [13], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %71 = affine.load %arg2[%arg12 * 16 + 14, %arg11] {max_mux_size = 16 : i64, partition_indices = [14, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %72 = arith.mulf %arg0, %71 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %73 = arith.mulf %2, %72 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %74 = affine.load %arg7[%arg12 * 16 + 14] {partition_indices = [14], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %75 = arith.addf %73, %74 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %75, %arg7[%arg12 * 16 + 14] {partition_indices = [14], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %76 = affine.load %arg2[%arg12 * 16 + 15, %arg11] {max_mux_size = 16 : i64, partition_indices = [15, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>>
        %77 = arith.mulf %arg0, %76 {timing = #hls.t<10 -> 14, 4, 1>} : f32
        %78 = arith.mulf %2, %77 {timing = #hls.t<6 -> 10, 4, 1>} : f32
        %79 = affine.load %arg7[%arg12 * 16 + 15] {partition_indices = [15], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %80 = arith.addf %78, %79 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %80, %arg7[%arg12 * 16 + 15] {partition_indices = [15], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=256, iterLatency=16, minII=1>, parallel, timing = #hls.t<0 -> 273, 273, 273>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=1048576, iterLatency=16, minII=1>, resource = #hls.r<lut=0, dsp=128, bram=0>, timing = #hls.t<0 -> 1048593, 1048593, 1048593>}
    return
  }
}