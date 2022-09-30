module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>, %arg4: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>, %arg5: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg6: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg7: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>) attributes {resource = #hls.r<lut=0, dsp=208, bram=0>, timing = #hls.t<0 -> 826949001262, 826949001262, 826949001262>, top_func} {
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        affine.store %arg2, %arg7[%arg8, %arg9] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
      } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=1, minII=1>, parallel, timing = #hls.t<0 -> 4098, 4098, 4098>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=4098, minII=4098>, parallel, timing = #hls.t<0 -> 16785410, 16785410, 16785410>}
    affine.for %arg8 = 0 to 1024 {
      affine.for %arg9 = 0 to 2048 {
        affine.for %arg10 = 0 to 256 {
          %0 = affine.load %arg3[%arg10 * 16, %arg8 * 4] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %1 = arith.mulf %arg0, %0 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %2 = affine.load %arg4[%arg8 * 4, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %3 = arith.mulf %2, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %4 = affine.load %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %5 = arith.addf %3, %4 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %5, %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %6 = affine.load %arg3[%arg10 * 16 + 1, %arg8 * 4] {partition_indices = [1, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %7 = arith.mulf %arg0, %6 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %8 = arith.mulf %2, %7 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %9 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %10 = arith.addf %8, %9 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %10, %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %11 = affine.load %arg3[%arg10 * 16 + 2, %arg8 * 4] {partition_indices = [2, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %12 = arith.mulf %arg0, %11 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %13 = arith.mulf %2, %12 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %14 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %15 = arith.addf %13, %14 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %15, %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %16 = affine.load %arg3[%arg10 * 16 + 3, %arg8 * 4] {partition_indices = [3, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %17 = arith.mulf %arg0, %16 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %18 = arith.mulf %2, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %19 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %20 = arith.addf %18, %19 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %20, %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %21 = affine.load %arg3[%arg10 * 16 + 4, %arg8 * 4] {partition_indices = [4, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %22 = arith.mulf %arg0, %21 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %23 = arith.mulf %2, %22 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %24 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %25 = arith.addf %23, %24 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %25, %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %26 = affine.load %arg3[%arg10 * 16 + 5, %arg8 * 4] {partition_indices = [5, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %27 = arith.mulf %arg0, %26 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %28 = arith.mulf %2, %27 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %29 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %30 = arith.addf %28, %29 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %30, %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %31 = affine.load %arg3[%arg10 * 16 + 6, %arg8 * 4] {partition_indices = [6, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %32 = arith.mulf %arg0, %31 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %33 = arith.mulf %2, %32 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %34 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %35 = arith.addf %33, %34 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %35, %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %36 = affine.load %arg3[%arg10 * 16 + 7, %arg8 * 4] {partition_indices = [7, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %37 = arith.mulf %arg0, %36 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %38 = arith.mulf %2, %37 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %39 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %40 = arith.addf %38, %39 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %40, %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %41 = affine.load %arg3[%arg10 * 16 + 8, %arg8 * 4] {partition_indices = [8, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %42 = arith.mulf %arg0, %41 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %43 = arith.mulf %2, %42 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %44 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %45 = arith.addf %43, %44 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %45, %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %46 = affine.load %arg3[%arg10 * 16 + 9, %arg8 * 4] {partition_indices = [9, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %47 = arith.mulf %arg0, %46 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %48 = arith.mulf %2, %47 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %49 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %50 = arith.addf %48, %49 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %50, %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %51 = affine.load %arg3[%arg10 * 16 + 10, %arg8 * 4] {partition_indices = [10, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %52 = arith.mulf %arg0, %51 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %53 = arith.mulf %2, %52 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %54 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %55 = arith.addf %53, %54 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %55, %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %56 = affine.load %arg3[%arg10 * 16 + 11, %arg8 * 4] {partition_indices = [11, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %57 = arith.mulf %arg0, %56 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %58 = arith.mulf %2, %57 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %59 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %60 = arith.addf %58, %59 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %60, %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %61 = affine.load %arg3[%arg10 * 16 + 12, %arg8 * 4] {partition_indices = [12, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %62 = arith.mulf %arg0, %61 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %63 = arith.mulf %2, %62 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %64 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %65 = arith.addf %63, %64 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %65, %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %66 = affine.load %arg3[%arg10 * 16 + 13, %arg8 * 4] {partition_indices = [13, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %67 = arith.mulf %arg0, %66 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %68 = arith.mulf %2, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %69 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %70 = arith.addf %68, %69 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %70, %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %71 = affine.load %arg3[%arg10 * 16 + 14, %arg8 * 4] {partition_indices = [14, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %72 = arith.mulf %arg0, %71 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %73 = arith.mulf %2, %72 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %74 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %75 = arith.addf %73, %74 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %75, %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %76 = affine.load %arg3[%arg10 * 16 + 15, %arg8 * 4] {partition_indices = [15, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %77 = arith.mulf %arg0, %76 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %78 = arith.mulf %2, %77 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %79 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %80 = arith.addf %78, %79 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %80, %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %81 = affine.load %arg4[%arg8 * 4, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %82 = arith.mulf %81, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %83 = affine.load %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %84 = arith.addf %82, %83 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %84, %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %85 = arith.mulf %81, %7 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %86 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %87 = arith.addf %85, %86 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %87, %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %88 = arith.mulf %81, %12 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %89 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %90 = arith.addf %88, %89 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %90, %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %91 = arith.mulf %81, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %92 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %93 = arith.addf %91, %92 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %93, %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %94 = arith.mulf %81, %22 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %95 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %96 = arith.addf %94, %95 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %96, %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %97 = arith.mulf %81, %27 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %98 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %99 = arith.addf %97, %98 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %99, %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %100 = arith.mulf %81, %32 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %101 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %102 = arith.addf %100, %101 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %102, %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %103 = arith.mulf %81, %37 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %104 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %105 = arith.addf %103, %104 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %105, %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %106 = arith.mulf %81, %42 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %107 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %108 = arith.addf %106, %107 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %108, %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %109 = arith.mulf %81, %47 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %110 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %111 = arith.addf %109, %110 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %111, %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %112 = arith.mulf %81, %52 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %113 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %114 = arith.addf %112, %113 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %114, %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %115 = arith.mulf %81, %57 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %116 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %117 = arith.addf %115, %116 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %117, %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %118 = arith.mulf %81, %62 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %119 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %120 = arith.addf %118, %119 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %120, %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %121 = arith.mulf %81, %67 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %122 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %123 = arith.addf %121, %122 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %123, %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %124 = arith.mulf %81, %72 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %125 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %126 = arith.addf %124, %125 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %126, %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %127 = arith.mulf %81, %77 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %128 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %129 = arith.addf %127, %128 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %129, %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<15 -> 16, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %130 = affine.load %arg3[%arg10 * 16, %arg8 * 4 + 1] {partition_indices = [0, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %131 = arith.mulf %arg0, %130 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %132 = affine.load %arg4[%arg8 * 4 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %133 = arith.mulf %132, %131 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %134 = affine.load %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %135 = arith.addf %133, %134 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %135, %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %136 = affine.load %arg3[%arg10 * 16 + 1, %arg8 * 4 + 1] {partition_indices = [1, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %137 = arith.mulf %arg0, %136 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %138 = arith.mulf %132, %137 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %139 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %140 = arith.addf %138, %139 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %140, %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %141 = affine.load %arg3[%arg10 * 16 + 2, %arg8 * 4 + 1] {partition_indices = [2, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %142 = arith.mulf %arg0, %141 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %143 = arith.mulf %132, %142 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %144 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %145 = arith.addf %143, %144 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %145, %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %146 = affine.load %arg3[%arg10 * 16 + 3, %arg8 * 4 + 1] {partition_indices = [3, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %147 = arith.mulf %arg0, %146 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %148 = arith.mulf %132, %147 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %149 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %150 = arith.addf %148, %149 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %150, %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %151 = affine.load %arg3[%arg10 * 16 + 4, %arg8 * 4 + 1] {partition_indices = [4, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %152 = arith.mulf %arg0, %151 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %153 = arith.mulf %132, %152 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %154 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %155 = arith.addf %153, %154 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %155, %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %156 = affine.load %arg3[%arg10 * 16 + 5, %arg8 * 4 + 1] {partition_indices = [5, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %157 = arith.mulf %arg0, %156 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %158 = arith.mulf %132, %157 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %159 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %160 = arith.addf %158, %159 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %160, %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %161 = affine.load %arg3[%arg10 * 16 + 6, %arg8 * 4 + 1] {partition_indices = [6, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %162 = arith.mulf %arg0, %161 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %163 = arith.mulf %132, %162 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %164 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %165 = arith.addf %163, %164 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %165, %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %166 = affine.load %arg3[%arg10 * 16 + 7, %arg8 * 4 + 1] {partition_indices = [7, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %167 = arith.mulf %arg0, %166 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %168 = arith.mulf %132, %167 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %169 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %170 = arith.addf %168, %169 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %170, %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %171 = affine.load %arg3[%arg10 * 16 + 8, %arg8 * 4 + 1] {partition_indices = [8, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %172 = arith.mulf %arg0, %171 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %173 = arith.mulf %132, %172 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %174 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %175 = arith.addf %173, %174 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %175, %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %176 = affine.load %arg3[%arg10 * 16 + 9, %arg8 * 4 + 1] {partition_indices = [9, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %177 = arith.mulf %arg0, %176 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %178 = arith.mulf %132, %177 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %179 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %180 = arith.addf %178, %179 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %180, %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %181 = affine.load %arg3[%arg10 * 16 + 10, %arg8 * 4 + 1] {partition_indices = [10, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %182 = arith.mulf %arg0, %181 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %183 = arith.mulf %132, %182 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %184 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %185 = arith.addf %183, %184 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %185, %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %186 = affine.load %arg3[%arg10 * 16 + 11, %arg8 * 4 + 1] {partition_indices = [11, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %187 = arith.mulf %arg0, %186 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %188 = arith.mulf %132, %187 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %189 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %190 = arith.addf %188, %189 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %190, %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %191 = affine.load %arg3[%arg10 * 16 + 12, %arg8 * 4 + 1] {partition_indices = [12, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %192 = arith.mulf %arg0, %191 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %193 = arith.mulf %132, %192 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %194 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %195 = arith.addf %193, %194 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %195, %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %196 = affine.load %arg3[%arg10 * 16 + 13, %arg8 * 4 + 1] {partition_indices = [13, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %197 = arith.mulf %arg0, %196 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %198 = arith.mulf %132, %197 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %199 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %200 = arith.addf %198, %199 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %200, %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %201 = affine.load %arg3[%arg10 * 16 + 14, %arg8 * 4 + 1] {partition_indices = [14, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %202 = arith.mulf %arg0, %201 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %203 = arith.mulf %132, %202 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %204 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %205 = arith.addf %203, %204 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %205, %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %206 = affine.load %arg3[%arg10 * 16 + 15, %arg8 * 4 + 1] {partition_indices = [15, 1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %207 = arith.mulf %arg0, %206 {timing = #hls.t<10 -> 14, 4, 1>} : f32
          %208 = arith.mulf %132, %207 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %209 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %210 = arith.addf %208, %209 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %210, %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %211 = affine.load %arg4[%arg8 * 4 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %212 = arith.mulf %211, %131 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %213 = affine.load %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %214 = arith.addf %212, %213 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %214, %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %215 = arith.mulf %211, %137 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %216 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %217 = arith.addf %215, %216 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %217, %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %218 = arith.mulf %211, %142 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %219 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %220 = arith.addf %218, %219 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %220, %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %221 = arith.mulf %211, %147 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %222 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %223 = arith.addf %221, %222 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %223, %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %224 = arith.mulf %211, %152 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %225 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %226 = arith.addf %224, %225 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %226, %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %227 = arith.mulf %211, %157 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %228 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %229 = arith.addf %227, %228 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %229, %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %230 = arith.mulf %211, %162 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %231 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %232 = arith.addf %230, %231 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %232, %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %233 = arith.mulf %211, %167 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %234 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %235 = arith.addf %233, %234 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %235, %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %236 = arith.mulf %211, %172 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %237 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %238 = arith.addf %236, %237 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %238, %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %239 = arith.mulf %211, %177 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %240 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %241 = arith.addf %239, %240 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %241, %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %242 = arith.mulf %211, %182 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %243 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %244 = arith.addf %242, %243 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %244, %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %245 = arith.mulf %211, %187 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %246 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %247 = arith.addf %245, %246 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %247, %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %248 = arith.mulf %211, %192 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %249 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %250 = arith.addf %248, %249 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %250, %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %251 = arith.mulf %211, %197 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %252 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %253 = arith.addf %251, %252 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %253, %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %254 = arith.mulf %211, %202 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %255 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %256 = arith.addf %254, %255 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %256, %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %257 = arith.mulf %211, %207 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %258 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %259 = arith.addf %257, %258 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %259, %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<23 -> 24, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %260 = affine.load %arg3[%arg10 * 16, %arg8 * 4 + 2] {partition_indices = [0, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %261 = arith.mulf %arg0, %260 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %262 = affine.load %arg4[%arg8 * 4 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %263 = arith.mulf %262, %261 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %264 = affine.load %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %265 = arith.addf %263, %264 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %265, %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %266 = affine.load %arg3[%arg10 * 16 + 1, %arg8 * 4 + 2] {partition_indices = [1, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %267 = arith.mulf %arg0, %266 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %268 = arith.mulf %262, %267 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %269 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %270 = arith.addf %268, %269 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %270, %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %271 = affine.load %arg3[%arg10 * 16 + 2, %arg8 * 4 + 2] {partition_indices = [2, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %272 = arith.mulf %arg0, %271 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %273 = arith.mulf %262, %272 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %274 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %275 = arith.addf %273, %274 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %275, %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %276 = affine.load %arg3[%arg10 * 16 + 3, %arg8 * 4 + 2] {partition_indices = [3, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %277 = arith.mulf %arg0, %276 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %278 = arith.mulf %262, %277 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %279 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %280 = arith.addf %278, %279 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %280, %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %281 = affine.load %arg3[%arg10 * 16 + 4, %arg8 * 4 + 2] {partition_indices = [4, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %282 = arith.mulf %arg0, %281 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %283 = arith.mulf %262, %282 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %284 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %285 = arith.addf %283, %284 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %285, %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %286 = affine.load %arg3[%arg10 * 16 + 5, %arg8 * 4 + 2] {partition_indices = [5, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %287 = arith.mulf %arg0, %286 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %288 = arith.mulf %262, %287 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %289 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %290 = arith.addf %288, %289 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %290, %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %291 = affine.load %arg3[%arg10 * 16 + 6, %arg8 * 4 + 2] {partition_indices = [6, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %292 = arith.mulf %arg0, %291 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %293 = arith.mulf %262, %292 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %294 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %295 = arith.addf %293, %294 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %295, %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %296 = affine.load %arg3[%arg10 * 16 + 7, %arg8 * 4 + 2] {partition_indices = [7, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %297 = arith.mulf %arg0, %296 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %298 = arith.mulf %262, %297 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %299 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %300 = arith.addf %298, %299 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %300, %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %301 = affine.load %arg3[%arg10 * 16 + 8, %arg8 * 4 + 2] {partition_indices = [8, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %302 = arith.mulf %arg0, %301 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %303 = arith.mulf %262, %302 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %304 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %305 = arith.addf %303, %304 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %305, %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %306 = affine.load %arg3[%arg10 * 16 + 9, %arg8 * 4 + 2] {partition_indices = [9, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %307 = arith.mulf %arg0, %306 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %308 = arith.mulf %262, %307 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %309 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %310 = arith.addf %308, %309 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %310, %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %311 = affine.load %arg3[%arg10 * 16 + 10, %arg8 * 4 + 2] {partition_indices = [10, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %312 = arith.mulf %arg0, %311 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %313 = arith.mulf %262, %312 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %314 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %315 = arith.addf %313, %314 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %315, %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %316 = affine.load %arg3[%arg10 * 16 + 11, %arg8 * 4 + 2] {partition_indices = [11, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %317 = arith.mulf %arg0, %316 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %318 = arith.mulf %262, %317 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %319 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %320 = arith.addf %318, %319 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %320, %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %321 = affine.load %arg3[%arg10 * 16 + 12, %arg8 * 4 + 2] {partition_indices = [12, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %322 = arith.mulf %arg0, %321 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %323 = arith.mulf %262, %322 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %324 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %325 = arith.addf %323, %324 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %325, %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %326 = affine.load %arg3[%arg10 * 16 + 13, %arg8 * 4 + 2] {partition_indices = [13, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %327 = arith.mulf %arg0, %326 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %328 = arith.mulf %262, %327 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %329 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %330 = arith.addf %328, %329 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %330, %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %331 = affine.load %arg3[%arg10 * 16 + 14, %arg8 * 4 + 2] {partition_indices = [14, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %332 = arith.mulf %arg0, %331 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %333 = arith.mulf %262, %332 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %334 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %335 = arith.addf %333, %334 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %335, %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %336 = affine.load %arg3[%arg10 * 16 + 15, %arg8 * 4 + 2] {partition_indices = [15, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %337 = arith.mulf %arg0, %336 {timing = #hls.t<18 -> 22, 4, 1>} : f32
          %338 = arith.mulf %262, %337 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %339 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %340 = arith.addf %338, %339 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %340, %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %341 = affine.load %arg4[%arg8 * 4 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %342 = arith.mulf %341, %261 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %343 = affine.load %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %344 = arith.addf %342, %343 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %344, %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %345 = arith.mulf %341, %267 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %346 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %347 = arith.addf %345, %346 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %347, %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %348 = arith.mulf %341, %272 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %349 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %350 = arith.addf %348, %349 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %350, %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %351 = arith.mulf %341, %277 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %352 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %353 = arith.addf %351, %352 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %353, %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %354 = arith.mulf %341, %282 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %355 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %356 = arith.addf %354, %355 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %356, %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %357 = arith.mulf %341, %287 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %358 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %359 = arith.addf %357, %358 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %359, %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %360 = arith.mulf %341, %292 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %361 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %362 = arith.addf %360, %361 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %362, %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %363 = arith.mulf %341, %297 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %364 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %365 = arith.addf %363, %364 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %365, %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %366 = arith.mulf %341, %302 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %367 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %368 = arith.addf %366, %367 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %368, %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %369 = arith.mulf %341, %307 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %370 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %371 = arith.addf %369, %370 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %371, %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %372 = arith.mulf %341, %312 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %373 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %374 = arith.addf %372, %373 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %374, %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %375 = arith.mulf %341, %317 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %376 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %377 = arith.addf %375, %376 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %377, %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %378 = arith.mulf %341, %322 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %379 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %380 = arith.addf %378, %379 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %380, %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %381 = arith.mulf %341, %327 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %382 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %383 = arith.addf %381, %382 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %383, %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %384 = arith.mulf %341, %332 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %385 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %386 = arith.addf %384, %385 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %386, %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %387 = arith.mulf %341, %337 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %388 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %389 = arith.addf %387, %388 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %389, %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<31 -> 32, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %390 = affine.load %arg3[%arg10 * 16, %arg8 * 4 + 3] {partition_indices = [0, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %391 = arith.mulf %arg0, %390 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %392 = affine.load %arg4[%arg8 * 4 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %393 = arith.mulf %392, %391 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %394 = affine.load %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %395 = arith.addf %393, %394 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %395, %arg7[%arg10 * 16, %arg9 * 2] {partition_indices = [0, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %396 = affine.load %arg3[%arg10 * 16 + 1, %arg8 * 4 + 3] {partition_indices = [1, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %397 = arith.mulf %arg0, %396 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %398 = arith.mulf %392, %397 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %399 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %400 = arith.addf %398, %399 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %400, %arg7[%arg10 * 16 + 1, %arg9 * 2] {partition_indices = [1, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %401 = affine.load %arg3[%arg10 * 16 + 2, %arg8 * 4 + 3] {partition_indices = [2, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %402 = arith.mulf %arg0, %401 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %403 = arith.mulf %392, %402 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %404 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %405 = arith.addf %403, %404 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %405, %arg7[%arg10 * 16 + 2, %arg9 * 2] {partition_indices = [2, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %406 = affine.load %arg3[%arg10 * 16 + 3, %arg8 * 4 + 3] {partition_indices = [3, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %407 = arith.mulf %arg0, %406 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %408 = arith.mulf %392, %407 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %409 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %410 = arith.addf %408, %409 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %410, %arg7[%arg10 * 16 + 3, %arg9 * 2] {partition_indices = [3, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %411 = affine.load %arg3[%arg10 * 16 + 4, %arg8 * 4 + 3] {partition_indices = [4, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %412 = arith.mulf %arg0, %411 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %413 = arith.mulf %392, %412 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %414 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %415 = arith.addf %413, %414 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %415, %arg7[%arg10 * 16 + 4, %arg9 * 2] {partition_indices = [4, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %416 = affine.load %arg3[%arg10 * 16 + 5, %arg8 * 4 + 3] {partition_indices = [5, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %417 = arith.mulf %arg0, %416 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %418 = arith.mulf %392, %417 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %419 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %420 = arith.addf %418, %419 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %420, %arg7[%arg10 * 16 + 5, %arg9 * 2] {partition_indices = [5, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %421 = affine.load %arg3[%arg10 * 16 + 6, %arg8 * 4 + 3] {partition_indices = [6, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %422 = arith.mulf %arg0, %421 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %423 = arith.mulf %392, %422 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %424 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %425 = arith.addf %423, %424 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %425, %arg7[%arg10 * 16 + 6, %arg9 * 2] {partition_indices = [6, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %426 = affine.load %arg3[%arg10 * 16 + 7, %arg8 * 4 + 3] {partition_indices = [7, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %427 = arith.mulf %arg0, %426 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %428 = arith.mulf %392, %427 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %429 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %430 = arith.addf %428, %429 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %430, %arg7[%arg10 * 16 + 7, %arg9 * 2] {partition_indices = [7, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %431 = affine.load %arg3[%arg10 * 16 + 8, %arg8 * 4 + 3] {partition_indices = [8, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %432 = arith.mulf %arg0, %431 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %433 = arith.mulf %392, %432 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %434 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %435 = arith.addf %433, %434 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %435, %arg7[%arg10 * 16 + 8, %arg9 * 2] {partition_indices = [8, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %436 = affine.load %arg3[%arg10 * 16 + 9, %arg8 * 4 + 3] {partition_indices = [9, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %437 = arith.mulf %arg0, %436 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %438 = arith.mulf %392, %437 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %439 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %440 = arith.addf %438, %439 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %440, %arg7[%arg10 * 16 + 9, %arg9 * 2] {partition_indices = [9, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %441 = affine.load %arg3[%arg10 * 16 + 10, %arg8 * 4 + 3] {partition_indices = [10, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %442 = arith.mulf %arg0, %441 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %443 = arith.mulf %392, %442 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %444 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %445 = arith.addf %443, %444 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %445, %arg7[%arg10 * 16 + 10, %arg9 * 2] {partition_indices = [10, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %446 = affine.load %arg3[%arg10 * 16 + 11, %arg8 * 4 + 3] {partition_indices = [11, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %447 = arith.mulf %arg0, %446 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %448 = arith.mulf %392, %447 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %449 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %450 = arith.addf %448, %449 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %450, %arg7[%arg10 * 16 + 11, %arg9 * 2] {partition_indices = [11, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %451 = affine.load %arg3[%arg10 * 16 + 12, %arg8 * 4 + 3] {partition_indices = [12, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %452 = arith.mulf %arg0, %451 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %453 = arith.mulf %392, %452 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %454 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %455 = arith.addf %453, %454 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %455, %arg7[%arg10 * 16 + 12, %arg9 * 2] {partition_indices = [12, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %456 = affine.load %arg3[%arg10 * 16 + 13, %arg8 * 4 + 3] {partition_indices = [13, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %457 = arith.mulf %arg0, %456 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %458 = arith.mulf %392, %457 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %459 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %460 = arith.addf %458, %459 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %460, %arg7[%arg10 * 16 + 13, %arg9 * 2] {partition_indices = [13, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %461 = affine.load %arg3[%arg10 * 16 + 14, %arg8 * 4 + 3] {partition_indices = [14, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %462 = arith.mulf %arg0, %461 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %463 = arith.mulf %392, %462 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %464 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %465 = arith.addf %463, %464 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %465, %arg7[%arg10 * 16 + 14, %arg9 * 2] {partition_indices = [14, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %466 = affine.load %arg3[%arg10 * 16 + 15, %arg8 * 4 + 3] {partition_indices = [15, 3], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>>
          %467 = arith.mulf %arg0, %466 {timing = #hls.t<26 -> 30, 4, 1>} : f32
          %468 = arith.mulf %392, %467 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %469 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %470 = arith.addf %468, %469 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %470, %arg7[%arg10 * 16 + 15, %arg9 * 2] {partition_indices = [15, 0], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %471 = affine.load %arg4[%arg8 * 4 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>>
          %472 = arith.mulf %471, %391 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %473 = affine.load %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %474 = arith.addf %472, %473 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %474, %arg7[%arg10 * 16, %arg9 * 2 + 1] {partition_indices = [0, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %475 = arith.mulf %471, %397 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %476 = affine.load %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %477 = arith.addf %475, %476 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %477, %arg7[%arg10 * 16 + 1, %arg9 * 2 + 1] {partition_indices = [1, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %478 = arith.mulf %471, %402 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %479 = affine.load %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %480 = arith.addf %478, %479 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %480, %arg7[%arg10 * 16 + 2, %arg9 * 2 + 1] {partition_indices = [2, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %481 = arith.mulf %471, %407 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %482 = affine.load %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %483 = arith.addf %481, %482 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %483, %arg7[%arg10 * 16 + 3, %arg9 * 2 + 1] {partition_indices = [3, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %484 = arith.mulf %471, %412 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %485 = affine.load %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %486 = arith.addf %484, %485 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %486, %arg7[%arg10 * 16 + 4, %arg9 * 2 + 1] {partition_indices = [4, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %487 = arith.mulf %471, %417 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %488 = affine.load %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %489 = arith.addf %487, %488 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %489, %arg7[%arg10 * 16 + 5, %arg9 * 2 + 1] {partition_indices = [5, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %490 = arith.mulf %471, %422 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %491 = affine.load %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %492 = arith.addf %490, %491 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %492, %arg7[%arg10 * 16 + 6, %arg9 * 2 + 1] {partition_indices = [6, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %493 = arith.mulf %471, %427 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %494 = affine.load %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %495 = arith.addf %493, %494 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %495, %arg7[%arg10 * 16 + 7, %arg9 * 2 + 1] {partition_indices = [7, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %496 = arith.mulf %471, %432 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %497 = affine.load %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %498 = arith.addf %496, %497 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %498, %arg7[%arg10 * 16 + 8, %arg9 * 2 + 1] {partition_indices = [8, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %499 = arith.mulf %471, %437 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %500 = affine.load %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %501 = arith.addf %499, %500 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %501, %arg7[%arg10 * 16 + 9, %arg9 * 2 + 1] {partition_indices = [9, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %502 = arith.mulf %471, %442 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %503 = affine.load %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %504 = arith.addf %502, %503 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %504, %arg7[%arg10 * 16 + 10, %arg9 * 2 + 1] {partition_indices = [10, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %505 = arith.mulf %471, %447 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %506 = affine.load %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %507 = arith.addf %505, %506 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %507, %arg7[%arg10 * 16 + 11, %arg9 * 2 + 1] {partition_indices = [11, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %508 = arith.mulf %471, %452 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %509 = affine.load %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %510 = arith.addf %508, %509 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %510, %arg7[%arg10 * 16 + 12, %arg9 * 2 + 1] {partition_indices = [12, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %511 = arith.mulf %471, %457 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %512 = affine.load %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %513 = arith.addf %511, %512 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %513, %arg7[%arg10 * 16 + 13, %arg9 * 2 + 1] {partition_indices = [13, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %514 = arith.mulf %471, %462 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %515 = affine.load %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %516 = arith.addf %514, %515 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %516, %arg7[%arg10 * 16 + 14, %arg9 * 2 + 1] {partition_indices = [14, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %517 = arith.mulf %471, %467 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %518 = affine.load %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %519 = arith.addf %517, %518 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %519, %arg7[%arg10 * 16 + 15, %arg9 * 2 + 1] {partition_indices = [15, 1], timing = #hls.t<39 -> 40, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=256, iterLatency=40, minII=4>, parallel, timing = #hls.t<824784732164 -> 824784733226, 1062, 1062>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=524288, iterLatency=40, minII=4>, parallel, timing = #hls.t<824784732164 -> 824786829354, 2097190, 2097190>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=536870912, iterLatency=40, minII=4>, timing = #hls.t<16785410 -> 2164269096, 2147483686, 2147483686>}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        %0 = affine.load %arg6[%arg8, %arg9] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %1 = arith.mulf %0, %arg1 {timing = #hls.t<2 -> 6, 4, 1>} : f32
        affine.store %1, %arg6[%arg8, %arg9] {partition_indices = [0, 0], timing = #hls.t<6 -> 7, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
      } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=7, minII=7>, parallel, timing = #hls.t<0 -> 28674, 28674, 28674>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=28674, minII=28674>, parallel, timing = #hls.t<2164269096 -> 2281717802, 117448706, 117448706>}
    affine.for %arg8 = 0 to 4096 {
      affine.for %arg9 = 0 to 4096 {
        affine.for %arg10 = 0 to 4096 {
          %0 = affine.load %arg7[%arg8, %arg10] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 2, d0 floordiv 16, d1 floordiv 2)>>
          %1 = affine.load %arg5[%arg10, %arg9] {partition_indices = [0, 0], timing = #hls.t<0 -> 2, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
          %2 = arith.mulf %0, %1 {timing = #hls.t<2 -> 6, 4, 1>} : f32
          %3 = affine.load %arg6[%arg8, %arg9] {partition_indices = [0, 0], timing = #hls.t<4 -> 6, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
          %4 = arith.addf %2, %3 {timing = #hls.t<6 -> 11, 5, 1>} : f32
          affine.store %4, %arg6[%arg8, %arg9] {partition_indices = [0, 0], timing = #hls.t<11 -> 12, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=12, minII=12>, timing = #hls.t<0 -> 49154, 49154, 49154>}
      } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=49154, minII=49154>, parallel, timing = #hls.t<0 -> 201334786, 201334786, 201334786>}
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=201334786, minII=201334786>, parallel, timing = #hls.t<2281717802 -> 826949001260, 824667283458, 824667283458>}
    return {timing = #hls.t<826949001260 -> 826949001260, 0, 0>}
  }
}