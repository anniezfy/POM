module {
  func @blur(%arg0: f32, %arg1: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>, %arg2: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>, %arg3: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>) attributes {resource = #hls.r<lut=0, dsp=12, bram=0>, timing = #hls.t<0 -> 33521733, 33521733, 33521733>, top_func} {
    affine.for %arg4 = 0 to 2047 {
      affine.for %arg5 = 0 to 2047 {
        %0 = affine.load %arg3[%arg4 * 2, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [0, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %1 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [0, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %2 = arith.addf %0, %1 : f32
        %3 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 2, 0] {max_mux_size = 4 : i64, partition_indices = [0, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %4 = arith.addf %3, %2 : f32
        %5 = arith.divf %4, %arg0 : f32
        affine.store %5, %arg1[%arg4 * 2, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %6 = arith.addf %1, %3 : f32
        %7 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 3, 0] {max_mux_size = 4 : i64, partition_indices = [0, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %8 = arith.addf %7, %6 : f32
        %9 = arith.divf %8, %arg0 : f32
        affine.store %9, %arg1[%arg4 * 2, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %10 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %11 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %12 = arith.addf %10, %11 : f32
        %13 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 2, 0] {max_mux_size = 4 : i64, partition_indices = [1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %14 = arith.addf %13, %12 : f32
        %15 = arith.divf %14, %arg0 : f32
        affine.store %15, %arg1[%arg4 * 2 + 1, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %16 = arith.addf %11, %13 : f32
        %17 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 3, 0] {max_mux_size = 4 : i64, partition_indices = [1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %18 = arith.addf %17, %16 : f32
        %19 = arith.divf %18, %arg0 : f32
        affine.store %19, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %20 = affine.load %arg3[%arg4 * 2, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [0, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %21 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [0, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %22 = arith.addf %20, %21 : f32
        %23 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 2, 1] {max_mux_size = 4 : i64, partition_indices = [0, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %24 = arith.addf %23, %22 : f32
        %25 = arith.divf %24, %arg0 : f32
        affine.store %25, %arg1[%arg4 * 2, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %26 = arith.addf %21, %23 : f32
        %27 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 3, 1] {max_mux_size = 4 : i64, partition_indices = [0, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %28 = arith.addf %27, %26 : f32
        %29 = arith.divf %28, %arg0 : f32
        affine.store %29, %arg1[%arg4 * 2, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %30 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %31 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %32 = arith.addf %30, %31 : f32
        %33 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 2, 1] {max_mux_size = 4 : i64, partition_indices = [1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %34 = arith.addf %33, %32 : f32
        %35 = arith.divf %34, %arg0 : f32
        affine.store %35, %arg1[%arg4 * 2 + 1, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %36 = arith.addf %31, %33 : f32
        %37 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 3, 1] {max_mux_size = 4 : i64, partition_indices = [1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %38 = arith.addf %37, %36 : f32
        %39 = arith.divf %38, %arg0 : f32
        affine.store %39, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %40 = affine.load %arg3[%arg4 * 2, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [0, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %41 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [0, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %42 = arith.addf %40, %41 : f32
        %43 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 2, 2] {max_mux_size = 4 : i64, partition_indices = [0, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %44 = arith.addf %43, %42 : f32
        %45 = arith.divf %44, %arg0 : f32
        affine.store %45, %arg1[%arg4 * 2, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %46 = arith.addf %41, %43 : f32
        %47 = affine.load %arg3[%arg4 * 2, %arg5 * 2 + 3, 2] {max_mux_size = 4 : i64, partition_indices = [0, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %48 = arith.addf %47, %46 : f32
        %49 = arith.divf %48, %arg0 : f32
        affine.store %49, %arg1[%arg4 * 2, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %50 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %51 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %52 = arith.addf %50, %51 : f32
        %53 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 2, 2] {max_mux_size = 4 : i64, partition_indices = [1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %54 = arith.addf %53, %52 : f32
        %55 = arith.divf %54, %arg0 : f32
        affine.store %55, %arg1[%arg4 * 2 + 1, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %56 = arith.addf %51, %53 : f32
        %57 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 3, 2] {max_mux_size = 4 : i64, partition_indices = [1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 4, d2 mod 3, d0 floordiv 2, d1 floordiv 4, d2 floordiv 3)>>
        %58 = arith.addf %57, %56 : f32
        %59 = arith.divf %58, %arg0 : f32
        affine.store %59, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg4 = 0 to 2047 {
      affine.for %arg5 = 0 to 2047 {
        %0 = affine.load %arg1[%arg4 * 2, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %1 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %2 = arith.addf %0, %1 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %3 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %4 = arith.addf %3, %2 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %5 = arith.divf %4, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %5, %arg2[%arg4 * 2, %arg5 * 2, 0] {partition_indices = [0, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %6 = affine.load %arg1[%arg4 * 2, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 0], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %7 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 0], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %8 = arith.addf %6, %7 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %9 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 0], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %10 = arith.addf %9, %8 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %11 = arith.divf %10, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %11, %arg2[%arg4 * 2, %arg5 * 2 + 1, 0] {partition_indices = [0, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %12 = arith.addf %1, %3 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %13 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %14 = arith.addf %13, %12 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %15 = arith.divf %14, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %15, %arg2[%arg4 * 2 + 1, %arg5 * 2, 0] {partition_indices = [1, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %16 = arith.addf %7, %9 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %17 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %18 = arith.addf %17, %16 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %19 = arith.divf %18, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %19, %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {partition_indices = [1, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %20 = affine.load %arg1[%arg4 * 2, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %21 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %22 = arith.addf %20, %21 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %23 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %24 = arith.addf %23, %22 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %25 = arith.divf %24, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %25, %arg2[%arg4 * 2, %arg5 * 2, 1] {partition_indices = [0, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %26 = affine.load %arg1[%arg4 * 2, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 1], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %27 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 1], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %28 = arith.addf %26, %27 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %29 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 1], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %30 = arith.addf %29, %28 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %31 = arith.divf %30, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %31, %arg2[%arg4 * 2, %arg5 * 2 + 1, 1] {partition_indices = [0, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %32 = arith.addf %21, %23 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %33 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %34 = arith.addf %33, %32 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %35 = arith.divf %34, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %35, %arg2[%arg4 * 2 + 1, %arg5 * 2, 1] {partition_indices = [1, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %36 = arith.addf %27, %29 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %37 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %38 = arith.addf %37, %36 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %39 = arith.divf %38, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %39, %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {partition_indices = [1, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %40 = affine.load %arg1[%arg4 * 2, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 2], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %41 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 2], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %42 = arith.addf %40, %41 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %43 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 2], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %44 = arith.addf %43, %42 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %45 = arith.divf %44, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %45, %arg2[%arg4 * 2, %arg5 * 2, 2] {partition_indices = [0, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %46 = affine.load %arg1[%arg4 * 2, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 2], timing = #hls.t<29 -> 31, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %47 = affine.load %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 2], timing = #hls.t<28 -> 30, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %48 = arith.addf %46, %47 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %49 = affine.load %arg1[%arg4 * 2 + 2, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 2], timing = #hls.t<27 -> 29, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %50 = arith.addf %49, %48 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %51 = arith.divf %50, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %51, %arg2[%arg4 * 2, %arg5 * 2 + 1, 2] {partition_indices = [0, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %52 = arith.addf %41, %43 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %53 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 2], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %54 = arith.addf %53, %52 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %55 = arith.divf %54, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %55, %arg2[%arg4 * 2 + 1, %arg5 * 2, 2] {partition_indices = [1, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %56 = arith.addf %47, %49 {timing = #hls.t<22 -> 27, 5, 1>} : f32
        %57 = affine.load %arg1[%arg4 * 2 + 3, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, 1, 2], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 2, d2 mod 3, d0 floordiv 4, d1 floordiv 2, d2 floordiv 3)>>
        %58 = arith.addf %57, %56 {timing = #hls.t<17 -> 22, 5, 1>} : f32
        %59 = arith.divf %58, %arg0 {timing = #hls.t<1 -> 17, 16, 1>} : f32
        affine.store %59, %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {partition_indices = [1, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=31, minII=4>, parallel, timing = #hls.t<0 -> 8217, 8217, 8217>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=4190209, iterLatency=31, minII=4>, parallel, resource = #hls.r<lut=0, dsp=12, bram=0>, timing = #hls.t<0 -> 16760865, 16760865, 16760865>}
    return
  }
}