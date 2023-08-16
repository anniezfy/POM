module {
  func @edgeDetect(%arg0: f32, %arg1: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>, %arg2: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>, %arg3: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>) attributes {resource = #hls.r<lut=0, dsp=12, bram=0>, timing = #hls.t<0 -> 104755289, 104755289, 104755289>, top_func} {
    affine.for %arg4 = 0 to 2047 {
      affine.for %arg5 = 0 to 2047 {
        %0 = affine.load %arg2[%arg4 * 2, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %1 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %2 = arith.addf %0, %1 : f32
        %3 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %4 = arith.addf %3, %2 : f32
        %5 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %6 = arith.addf %5, %4 : f32
        %7 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %8 = arith.addf %7, %6 : f32
        %9 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %10 = arith.addf %9, %8 : f32
        %11 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %12 = arith.addf %11, %10 : f32
        %13 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %14 = arith.addf %13, %12 : f32
        %15 = arith.divf %14, %arg0 : f32
        affine.store %15, %arg3[%arg4 * 2, %arg5 * 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %16 = arith.addf %1, %3 : f32
        %17 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 3, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %18 = arith.addf %17, %16 : f32
        %19 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %20 = arith.addf %19, %18 : f32
        %21 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 3, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %22 = arith.addf %21, %20 : f32
        %23 = arith.addf %11, %22 : f32
        %24 = arith.addf %13, %23 : f32
        %25 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 3, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %26 = arith.addf %25, %24 : f32
        %27 = arith.divf %26, %arg0 : f32
        affine.store %27, %arg3[%arg4 * 2, %arg5 * 2 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %28 = arith.addf %5, %19 : f32
        %29 = arith.addf %7, %28 : f32
        %30 = arith.addf %9, %29 : f32
        %31 = arith.addf %13, %30 : f32
        %32 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %33 = arith.addf %32, %31 : f32
        %34 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 1, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %35 = arith.addf %34, %33 : f32
        %36 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 2, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %37 = arith.addf %36, %35 : f32
        %38 = arith.divf %37, %arg0 : f32
        affine.store %38, %arg3[%arg4 * 2 + 1, %arg5 * 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %39 = arith.addf %19, %7 : f32
        %40 = arith.addf %21, %39 : f32
        %41 = arith.addf %11, %40 : f32
        %42 = arith.addf %25, %41 : f32
        %43 = arith.addf %34, %42 : f32
        %44 = arith.addf %36, %43 : f32
        %45 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 3, 0] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %46 = arith.addf %45, %44 : f32
        %47 = arith.divf %46, %arg0 : f32
        affine.store %47, %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %48 = affine.load %arg2[%arg4 * 2, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %49 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %50 = arith.addf %48, %49 : f32
        %51 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %52 = arith.addf %51, %50 : f32
        %53 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %54 = arith.addf %53, %52 : f32
        %55 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %56 = arith.addf %55, %54 : f32
        %57 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %58 = arith.addf %57, %56 : f32
        %59 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %60 = arith.addf %59, %58 : f32
        %61 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %62 = arith.addf %61, %60 : f32
        %63 = arith.divf %62, %arg0 : f32
        affine.store %63, %arg3[%arg4 * 2, %arg5 * 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %64 = arith.addf %49, %51 : f32
        %65 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 3, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %66 = arith.addf %65, %64 : f32
        %67 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %68 = arith.addf %67, %66 : f32
        %69 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 3, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %70 = arith.addf %69, %68 : f32
        %71 = arith.addf %59, %70 : f32
        %72 = arith.addf %61, %71 : f32
        %73 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 3, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %74 = arith.addf %73, %72 : f32
        %75 = arith.divf %74, %arg0 : f32
        affine.store %75, %arg3[%arg4 * 2, %arg5 * 2 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %76 = arith.addf %53, %67 : f32
        %77 = arith.addf %55, %76 : f32
        %78 = arith.addf %57, %77 : f32
        %79 = arith.addf %61, %78 : f32
        %80 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %81 = arith.addf %80, %79 : f32
        %82 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 1, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %83 = arith.addf %82, %81 : f32
        %84 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 2, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %85 = arith.addf %84, %83 : f32
        %86 = arith.divf %85, %arg0 : f32
        affine.store %86, %arg3[%arg4 * 2 + 1, %arg5 * 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %87 = arith.addf %67, %55 : f32
        %88 = arith.addf %69, %87 : f32
        %89 = arith.addf %59, %88 : f32
        %90 = arith.addf %73, %89 : f32
        %91 = arith.addf %82, %90 : f32
        %92 = arith.addf %84, %91 : f32
        %93 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 3, 1] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %94 = arith.addf %93, %92 : f32
        %95 = arith.divf %94, %arg0 : f32
        affine.store %95, %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %96 = affine.load %arg2[%arg4 * 2, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %97 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %98 = arith.addf %96, %97 : f32
        %99 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %100 = arith.addf %99, %98 : f32
        %101 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %102 = arith.addf %101, %100 : f32
        %103 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %104 = arith.addf %103, %102 : f32
        %105 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %106 = arith.addf %105, %104 : f32
        %107 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %108 = arith.addf %107, %106 : f32
        %109 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %110 = arith.addf %109, %108 : f32
        %111 = arith.divf %110, %arg0 : f32
        affine.store %111, %arg3[%arg4 * 2, %arg5 * 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %112 = arith.addf %97, %99 : f32
        %113 = affine.load %arg2[%arg4 * 2, %arg5 * 2 + 3, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %114 = arith.addf %113, %112 : f32
        %115 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %116 = arith.addf %115, %114 : f32
        %117 = affine.load %arg2[%arg4 * 2 + 1, %arg5 * 2 + 3, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %118 = arith.addf %117, %116 : f32
        %119 = arith.addf %107, %118 : f32
        %120 = arith.addf %109, %119 : f32
        %121 = affine.load %arg2[%arg4 * 2 + 2, %arg5 * 2 + 3, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %122 = arith.addf %121, %120 : f32
        %123 = arith.divf %122, %arg0 : f32
        affine.store %123, %arg3[%arg4 * 2, %arg5 * 2 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %124 = arith.addf %101, %115 : f32
        %125 = arith.addf %103, %124 : f32
        %126 = arith.addf %105, %125 : f32
        %127 = arith.addf %109, %126 : f32
        %128 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %129 = arith.addf %128, %127 : f32
        %130 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 1, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %131 = arith.addf %130, %129 : f32
        %132 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 2, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %133 = arith.addf %132, %131 : f32
        %134 = arith.divf %133, %arg0 : f32
        affine.store %134, %arg3[%arg4 * 2 + 1, %arg5 * 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %135 = arith.addf %115, %103 : f32
        %136 = arith.addf %117, %135 : f32
        %137 = arith.addf %107, %136 : f32
        %138 = arith.addf %121, %137 : f32
        %139 = arith.addf %130, %138 : f32
        %140 = arith.addf %132, %139 : f32
        %141 = affine.load %arg2[%arg4 * 2 + 3, %arg5 * 2 + 3, 2] {max_mux_size = 4 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, d1 mod 4, d2 mod 3, d0 floordiv 4, d1 floordiv 4, d2 floordiv 3)>>
        %142 = arith.addf %141, %140 : f32
        %143 = arith.divf %142, %arg0 : f32
        affine.store %143, %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg4 = 0 to 2047 {
      affine.for %arg5 = 0 to 2047 {
        %0 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %1 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %2 = arith.subf %0, %1 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %3 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %4 = arith.addf %3, %2 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %5 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %6 = arith.subf %5, %4 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %6, %arg1[%arg4 * 2, %arg5 * 2, 0] {partition_indices = [0, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %7 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %8 = arith.subf %7, %3 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %9 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %10 = arith.addf %9, %8 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %11 = arith.subf %0, %10 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %11, %arg1[%arg4 * 2, %arg5 * 2 + 1, 0] {partition_indices = [0, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %12 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %13 = arith.subf %3, %12 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %14 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %15 = arith.addf %14, %13 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %16 = arith.subf %1, %15 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %16, %arg1[%arg4 * 2 + 1, %arg5 * 2, 0] {partition_indices = [1, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %17 = arith.subf %9, %14 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %18 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 0], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %19 = arith.addf %18, %17 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %20 = arith.subf %3, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %20, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 0] {partition_indices = [1, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %21 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %22 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %23 = arith.subf %21, %22 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %24 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %25 = arith.addf %24, %23 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %26 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %27 = arith.subf %26, %25 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %27, %arg1[%arg4 * 2, %arg5 * 2, 1] {partition_indices = [0, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %28 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %29 = arith.subf %28, %24 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %30 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %31 = arith.addf %30, %29 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %32 = arith.subf %21, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %32, %arg1[%arg4 * 2, %arg5 * 2 + 1, 1] {partition_indices = [0, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %33 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %34 = arith.subf %24, %33 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %35 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %36 = arith.addf %35, %34 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %37 = arith.subf %22, %36 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %37, %arg1[%arg4 * 2 + 1, %arg5 * 2, 1] {partition_indices = [1, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %38 = arith.subf %30, %35 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %39 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %40 = arith.addf %39, %38 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %41 = arith.subf %24, %40 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %41, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 1] {partition_indices = [1, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %42 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %43 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<21 -> 23, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %44 = arith.subf %42, %43 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %45 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<20 -> 22, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %46 = arith.addf %45, %44 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %47 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %48 = arith.subf %47, %46 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %48, %arg1[%arg4 * 2, %arg5 * 2, 2] {partition_indices = [0, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %49 = affine.load %arg3[%arg4 * 2 + 1, %arg5 * 2 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<19 -> 21, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %50 = arith.subf %49, %45 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %51 = affine.load %arg3[%arg4 * 2 + 2, %arg5 * 2 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<18 -> 20, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %52 = arith.addf %51, %50 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %53 = arith.subf %42, %52 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %53, %arg1[%arg4 * 2, %arg5 * 2 + 1, 2] {partition_indices = [0, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %54 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %55 = arith.subf %45, %54 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %56 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %57 = arith.addf %56, %55 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %58 = arith.subf %43, %57 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %58, %arg1[%arg4 * 2 + 1, %arg5 * 2, 2] {partition_indices = [1, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
        %59 = arith.subf %51, %56 {timing = #hls.t<11 -> 16, 5, 1>} : f32
        %60 = affine.load %arg3[%arg4 * 2 + 3, %arg5 * 2 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, -1, 2], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        %61 = arith.addf %60, %59 {timing = #hls.t<6 -> 11, 5, 1>} : f32
        %62 = arith.subf %45, %61 {timing = #hls.t<1 -> 6, 5, 1>} : f32
        affine.store %62, %arg1[%arg4 * 2 + 1, %arg5 * 2 + 1, 2] {partition_indices = [1, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, d1 mod 2, d2 mod 3, d0 floordiv 2, d1 floordiv 2, d2 floordiv 3)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2047, iterLatency=24, minII=9>, parallel, timing = #hls.t<0 -> 18440, 18440, 18440>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=4190209, iterLatency=24, minII=9>, parallel, resource = #hls.r<lut=0, dsp=8, bram=0>, timing = #hls.t<0 -> 37711898, 37711898, 37711898>}
    return
  }
}