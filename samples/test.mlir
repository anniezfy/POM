module {
  func @gemm(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>, %arg4: memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>) attributes {top_func} {
    affine.for %arg5 = 0 to 4096 {
      affine.for %arg6 = 0 to 256 {
        affine.for %arg7 = 0 to 512 {
          %0 = affine.load %arg2[%arg6 * 2, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<265 -> 267, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %1 = arith.mulf %arg0, %0 {timing = #hls.t<261 -> 265, 4, 1>} : f32
          %2 = affine.load %arg3[%arg5, %arg7 * 2] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<261 -> 263, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %3 = arith.mulf %2, %1 {timing = #hls.t<257 -> 261, 4, 1>} : f32
          %4 = affine.load %arg4[%arg6 * 2, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<257 -> 259, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %5 = arith.addf %3, %4 {timing = #hls.t<252 -> 257, 5, 1>} : f32
          affine.store %5, %arg4[%arg6 * 2, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<251 -> 252, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %6 = affine.load %arg3[%arg5, %arg7 * 2 + 1] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<260 -> 262, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %7 = arith.mulf %6, %1 {timing = #hls.t<256 -> 260, 4, 1>} : f32
          %8 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<256 -> 258, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %9 = arith.addf %7, %8 {timing = #hls.t<251 -> 256, 5, 1>} : f32
          affine.store %9, %arg4[%arg6 * 2, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<250 -> 251, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %10 = affine.load %arg3[%arg5, %arg7 * 2 + 2] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<253 -> 255, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %11 = arith.mulf %10, %1 {timing = #hls.t<249 -> 253, 4, 1>} : f32
          %12 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<249 -> 251, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %13 = arith.addf %11, %12 {timing = #hls.t<244 -> 249, 5, 1>} : f32
          affine.store %13, %arg4[%arg6 * 2, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<243 -> 244, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %14 = affine.load %arg3[%arg5, %arg7 * 2 + 3] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<252 -> 254, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %15 = arith.mulf %14, %1 {timing = #hls.t<248 -> 252, 4, 1>} : f32
          %16 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<248 -> 250, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %17 = arith.addf %15, %16 {timing = #hls.t<243 -> 248, 5, 1>} : f32
          affine.store %17, %arg4[%arg6 * 2, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<242 -> 243, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %18 = affine.load %arg3[%arg5, %arg7 * 2 + 4] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<245 -> 247, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %19 = arith.mulf %18, %1 {timing = #hls.t<241 -> 245, 4, 1>} : f32
          %20 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<241 -> 243, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %21 = arith.addf %19, %20 {timing = #hls.t<236 -> 241, 5, 1>} : f32
          affine.store %21, %arg4[%arg6 * 2, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<235 -> 236, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %22 = affine.load %arg3[%arg5, %arg7 * 2 + 5] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<244 -> 246, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %23 = arith.mulf %22, %1 {timing = #hls.t<240 -> 244, 4, 1>} : f32
          %24 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<240 -> 242, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %25 = arith.addf %23, %24 {timing = #hls.t<235 -> 240, 5, 1>} : f32
          affine.store %25, %arg4[%arg6 * 2, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<234 -> 235, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %26 = affine.load %arg3[%arg5, %arg7 * 2 + 6] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<237 -> 239, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %27 = arith.mulf %26, %1 {timing = #hls.t<233 -> 237, 4, 1>} : f32
          %28 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<233 -> 235, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %29 = arith.addf %27, %28 {timing = #hls.t<228 -> 233, 5, 1>} : f32
          affine.store %29, %arg4[%arg6 * 2, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<227 -> 228, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %30 = affine.load %arg3[%arg5, %arg7 * 2 + 7] {max_mux_size = 8 : i64, partition_indices = [0, -1], timing = #hls.t<236 -> 238, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>>
          %31 = arith.mulf %30, %1 {timing = #hls.t<232 -> 236, 4, 1>} : f32
          %32 = affine.load %arg4[%arg6 * 2, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<232 -> 234, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %33 = arith.addf %31, %32 {timing = #hls.t<227 -> 232, 5, 1>} : f32
          affine.store %33, %arg4[%arg6 * 2, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<226 -> 227, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %34 = affine.load %arg2[%arg6 * 2 + 1, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<263 -> 265, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %35 = arith.mulf %arg0, %34 {timing = #hls.t<259 -> 263, 4, 1>} : f32
          %36 = arith.mulf %2, %35 {timing = #hls.t<255 -> 259, 4, 1>} : f32
          %37 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<255 -> 257, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %38 = arith.addf %36, %37 {timing = #hls.t<250 -> 255, 5, 1>} : f32
          affine.store %38, %arg4[%arg6 * 2 + 1, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<249 -> 250, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %39 = arith.mulf %6, %35 {timing = #hls.t<254 -> 258, 4, 1>} : f32
          %40 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<254 -> 256, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %41 = arith.addf %39, %40 {timing = #hls.t<249 -> 254, 5, 1>} : f32
          affine.store %41, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<248 -> 249, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %42 = arith.mulf %10, %35 {timing = #hls.t<247 -> 251, 4, 1>} : f32
          %43 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<247 -> 249, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %44 = arith.addf %42, %43 {timing = #hls.t<242 -> 247, 5, 1>} : f32
          affine.store %44, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<241 -> 242, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %45 = arith.mulf %14, %35 {timing = #hls.t<246 -> 250, 4, 1>} : f32
          %46 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<246 -> 248, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %47 = arith.addf %45, %46 {timing = #hls.t<241 -> 246, 5, 1>} : f32
          affine.store %47, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<240 -> 241, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %48 = arith.mulf %18, %35 {timing = #hls.t<239 -> 243, 4, 1>} : f32
          %49 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<239 -> 241, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %50 = arith.addf %48, %49 {timing = #hls.t<234 -> 239, 5, 1>} : f32
          affine.store %50, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<233 -> 234, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %51 = arith.mulf %22, %35 {timing = #hls.t<238 -> 242, 4, 1>} : f32
          %52 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<238 -> 240, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %53 = arith.addf %51, %52 {timing = #hls.t<233 -> 238, 5, 1>} : f32
          affine.store %53, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<232 -> 233, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %54 = arith.mulf %26, %35 {timing = #hls.t<231 -> 235, 4, 1>} : f32
          %55 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<231 -> 233, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %56 = arith.addf %54, %55 {timing = #hls.t<226 -> 231, 5, 1>} : f32
          affine.store %56, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<225 -> 226, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %57 = arith.mulf %30, %35 {timing = #hls.t<230 -> 234, 4, 1>} : f32
          %58 = affine.load %arg4[%arg6 * 2 + 1, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<230 -> 232, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %59 = arith.addf %57, %58 {timing = #hls.t<225 -> 230, 5, 1>} : f32
          affine.store %59, %arg4[%arg6 * 2 + 1, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<224 -> 225, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %60 = affine.load %arg2[%arg6 * 2 + 2, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<233 -> 235, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %61 = arith.mulf %arg0, %60 {timing = #hls.t<229 -> 233, 4, 1>} : f32
          %62 = arith.mulf %2, %61 {timing = #hls.t<225 -> 229, 4, 1>} : f32
          %63 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<225 -> 227, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %64 = arith.addf %62, %63 {timing = #hls.t<220 -> 225, 5, 1>} : f32
          affine.store %64, %arg4[%arg6 * 2 + 2, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<219 -> 220, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %65 = arith.mulf %6, %61 {timing = #hls.t<224 -> 228, 4, 1>} : f32
          %66 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<224 -> 226, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %67 = arith.addf %65, %66 {timing = #hls.t<219 -> 224, 5, 1>} : f32
          affine.store %67, %arg4[%arg6 * 2 + 2, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<218 -> 219, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %68 = arith.mulf %10, %61 {timing = #hls.t<217 -> 221, 4, 1>} : f32
          %69 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<217 -> 219, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %70 = arith.addf %68, %69 {timing = #hls.t<212 -> 217, 5, 1>} : f32
          affine.store %70, %arg4[%arg6 * 2 + 2, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<211 -> 212, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %71 = arith.mulf %14, %61 {timing = #hls.t<216 -> 220, 4, 1>} : f32
          %72 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<216 -> 218, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %73 = arith.addf %71, %72 {timing = #hls.t<211 -> 216, 5, 1>} : f32
          affine.store %73, %arg4[%arg6 * 2 + 2, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<210 -> 211, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %74 = arith.mulf %18, %61 {timing = #hls.t<209 -> 213, 4, 1>} : f32
          %75 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<209 -> 211, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %76 = arith.addf %74, %75 {timing = #hls.t<204 -> 209, 5, 1>} : f32
          affine.store %76, %arg4[%arg6 * 2 + 2, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<203 -> 204, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %77 = arith.mulf %22, %61 {timing = #hls.t<208 -> 212, 4, 1>} : f32
          %78 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<208 -> 210, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %79 = arith.addf %77, %78 {timing = #hls.t<203 -> 208, 5, 1>} : f32
          affine.store %79, %arg4[%arg6 * 2 + 2, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<202 -> 203, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %80 = arith.mulf %26, %61 {timing = #hls.t<201 -> 205, 4, 1>} : f32
          %81 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<201 -> 203, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %82 = arith.addf %80, %81 {timing = #hls.t<196 -> 201, 5, 1>} : f32
          affine.store %82, %arg4[%arg6 * 2 + 2, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<195 -> 196, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %83 = arith.mulf %30, %61 {timing = #hls.t<200 -> 204, 4, 1>} : f32
          %84 = affine.load %arg4[%arg6 * 2 + 2, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<200 -> 202, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %85 = arith.addf %83, %84 {timing = #hls.t<195 -> 200, 5, 1>} : f32
          affine.store %85, %arg4[%arg6 * 2 + 2, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<194 -> 195, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %86 = affine.load %arg2[%arg6 * 2 + 3, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<231 -> 233, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %87 = arith.mulf %arg0, %86 {timing = #hls.t<227 -> 231, 4, 1>} : f32
          %88 = arith.mulf %2, %87 {timing = #hls.t<223 -> 227, 4, 1>} : f32
          %89 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<223 -> 225, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %90 = arith.addf %88, %89 {timing = #hls.t<218 -> 223, 5, 1>} : f32
          affine.store %90, %arg4[%arg6 * 2 + 3, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<217 -> 218, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %91 = arith.mulf %6, %87 {timing = #hls.t<222 -> 226, 4, 1>} : f32
          %92 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<222 -> 224, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %93 = arith.addf %91, %92 {timing = #hls.t<217 -> 222, 5, 1>} : f32
          affine.store %93, %arg4[%arg6 * 2 + 3, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<216 -> 217, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %94 = arith.mulf %10, %87 {timing = #hls.t<215 -> 219, 4, 1>} : f32
          %95 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<215 -> 217, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %96 = arith.addf %94, %95 {timing = #hls.t<210 -> 215, 5, 1>} : f32
          affine.store %96, %arg4[%arg6 * 2 + 3, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<209 -> 210, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %97 = arith.mulf %14, %87 {timing = #hls.t<214 -> 218, 4, 1>} : f32
          %98 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<214 -> 216, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %99 = arith.addf %97, %98 {timing = #hls.t<209 -> 214, 5, 1>} : f32
          affine.store %99, %arg4[%arg6 * 2 + 3, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<208 -> 209, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %100 = arith.mulf %18, %87 {timing = #hls.t<207 -> 211, 4, 1>} : f32
          %101 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<207 -> 209, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %102 = arith.addf %100, %101 {timing = #hls.t<202 -> 207, 5, 1>} : f32
          affine.store %102, %arg4[%arg6 * 2 + 3, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<201 -> 202, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %103 = arith.mulf %22, %87 {timing = #hls.t<206 -> 210, 4, 1>} : f32
          %104 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<206 -> 208, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %105 = arith.addf %103, %104 {timing = #hls.t<201 -> 206, 5, 1>} : f32
          affine.store %105, %arg4[%arg6 * 2 + 3, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<200 -> 201, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %106 = arith.mulf %26, %87 {timing = #hls.t<199 -> 203, 4, 1>} : f32
          %107 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<199 -> 201, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %108 = arith.addf %106, %107 {timing = #hls.t<194 -> 199, 5, 1>} : f32
          affine.store %108, %arg4[%arg6 * 2 + 3, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<193 -> 194, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %109 = arith.mulf %30, %87 {timing = #hls.t<198 -> 202, 4, 1>} : f32
          %110 = affine.load %arg4[%arg6 * 2 + 3, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<198 -> 200, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %111 = arith.addf %109, %110 {timing = #hls.t<193 -> 198, 5, 1>} : f32
          affine.store %111, %arg4[%arg6 * 2 + 3, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<192 -> 193, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %112 = affine.load %arg2[%arg6 * 2 + 4, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<201 -> 203, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %113 = arith.mulf %arg0, %112 {timing = #hls.t<197 -> 201, 4, 1>} : f32
          %114 = arith.mulf %2, %113 {timing = #hls.t<193 -> 197, 4, 1>} : f32
          %115 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<193 -> 195, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %116 = arith.addf %114, %115 {timing = #hls.t<188 -> 193, 5, 1>} : f32
          affine.store %116, %arg4[%arg6 * 2 + 4, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<187 -> 188, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %117 = arith.mulf %6, %113 {timing = #hls.t<192 -> 196, 4, 1>} : f32
          %118 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<192 -> 194, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %119 = arith.addf %117, %118 {timing = #hls.t<187 -> 192, 5, 1>} : f32
          affine.store %119, %arg4[%arg6 * 2 + 4, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<186 -> 187, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %120 = arith.mulf %10, %113 {timing = #hls.t<185 -> 189, 4, 1>} : f32
          %121 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<185 -> 187, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %122 = arith.addf %120, %121 {timing = #hls.t<180 -> 185, 5, 1>} : f32
          affine.store %122, %arg4[%arg6 * 2 + 4, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<179 -> 180, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %123 = arith.mulf %14, %113 {timing = #hls.t<184 -> 188, 4, 1>} : f32
          %124 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<184 -> 186, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %125 = arith.addf %123, %124 {timing = #hls.t<179 -> 184, 5, 1>} : f32
          affine.store %125, %arg4[%arg6 * 2 + 4, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<178 -> 179, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %126 = arith.mulf %18, %113 {timing = #hls.t<177 -> 181, 4, 1>} : f32
          %127 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<177 -> 179, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %128 = arith.addf %126, %127 {timing = #hls.t<172 -> 177, 5, 1>} : f32
          affine.store %128, %arg4[%arg6 * 2 + 4, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<171 -> 172, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %129 = arith.mulf %22, %113 {timing = #hls.t<176 -> 180, 4, 1>} : f32
          %130 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<176 -> 178, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %131 = arith.addf %129, %130 {timing = #hls.t<171 -> 176, 5, 1>} : f32
          affine.store %131, %arg4[%arg6 * 2 + 4, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<170 -> 171, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %132 = arith.mulf %26, %113 {timing = #hls.t<169 -> 173, 4, 1>} : f32
          %133 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<169 -> 171, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %134 = arith.addf %132, %133 {timing = #hls.t<164 -> 169, 5, 1>} : f32
          affine.store %134, %arg4[%arg6 * 2 + 4, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<163 -> 164, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %135 = arith.mulf %30, %113 {timing = #hls.t<168 -> 172, 4, 1>} : f32
          %136 = affine.load %arg4[%arg6 * 2 + 4, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<168 -> 170, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %137 = arith.addf %135, %136 {timing = #hls.t<163 -> 168, 5, 1>} : f32
          affine.store %137, %arg4[%arg6 * 2 + 4, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<162 -> 163, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %138 = affine.load %arg2[%arg6 * 2 + 5, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<199 -> 201, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %139 = arith.mulf %arg0, %138 {timing = #hls.t<195 -> 199, 4, 1>} : f32
          %140 = arith.mulf %2, %139 {timing = #hls.t<191 -> 195, 4, 1>} : f32
          %141 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<191 -> 193, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %142 = arith.addf %140, %141 {timing = #hls.t<186 -> 191, 5, 1>} : f32
          affine.store %142, %arg4[%arg6 * 2 + 5, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<185 -> 186, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %143 = arith.mulf %6, %139 {timing = #hls.t<190 -> 194, 4, 1>} : f32
          %144 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<190 -> 192, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %145 = arith.addf %143, %144 {timing = #hls.t<185 -> 190, 5, 1>} : f32
          affine.store %145, %arg4[%arg6 * 2 + 5, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<184 -> 185, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %146 = arith.mulf %10, %139 {timing = #hls.t<183 -> 187, 4, 1>} : f32
          %147 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<183 -> 185, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %148 = arith.addf %146, %147 {timing = #hls.t<178 -> 183, 5, 1>} : f32
          affine.store %148, %arg4[%arg6 * 2 + 5, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<177 -> 178, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %149 = arith.mulf %14, %139 {timing = #hls.t<182 -> 186, 4, 1>} : f32
          %150 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<182 -> 184, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %151 = arith.addf %149, %150 {timing = #hls.t<177 -> 182, 5, 1>} : f32
          affine.store %151, %arg4[%arg6 * 2 + 5, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<176 -> 177, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %152 = arith.mulf %18, %139 {timing = #hls.t<175 -> 179, 4, 1>} : f32
          %153 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<175 -> 177, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %154 = arith.addf %152, %153 {timing = #hls.t<170 -> 175, 5, 1>} : f32
          affine.store %154, %arg4[%arg6 * 2 + 5, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<169 -> 170, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %155 = arith.mulf %22, %139 {timing = #hls.t<174 -> 178, 4, 1>} : f32
          %156 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<174 -> 176, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %157 = arith.addf %155, %156 {timing = #hls.t<169 -> 174, 5, 1>} : f32
          affine.store %157, %arg4[%arg6 * 2 + 5, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<168 -> 169, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %158 = arith.mulf %26, %139 {timing = #hls.t<167 -> 171, 4, 1>} : f32
          %159 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<167 -> 169, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %160 = arith.addf %158, %159 {timing = #hls.t<162 -> 167, 5, 1>} : f32
          affine.store %160, %arg4[%arg6 * 2 + 5, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<161 -> 162, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %161 = arith.mulf %30, %139 {timing = #hls.t<166 -> 170, 4, 1>} : f32
          %162 = affine.load %arg4[%arg6 * 2 + 5, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<166 -> 168, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %163 = arith.addf %161, %162 {timing = #hls.t<161 -> 166, 5, 1>} : f32
          affine.store %163, %arg4[%arg6 * 2 + 5, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<160 -> 161, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %164 = affine.load %arg2[%arg6 * 2 + 6, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<169 -> 171, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %165 = arith.mulf %arg0, %164 {timing = #hls.t<165 -> 169, 4, 1>} : f32
          %166 = arith.mulf %2, %165 {timing = #hls.t<161 -> 165, 4, 1>} : f32
          %167 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<161 -> 163, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %168 = arith.addf %166, %167 {timing = #hls.t<156 -> 161, 5, 1>} : f32
          affine.store %168, %arg4[%arg6 * 2 + 6, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<155 -> 156, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %169 = arith.mulf %6, %165 {timing = #hls.t<160 -> 164, 4, 1>} : f32
          %170 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<160 -> 162, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %171 = arith.addf %169, %170 {timing = #hls.t<155 -> 160, 5, 1>} : f32
          affine.store %171, %arg4[%arg6 * 2 + 6, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<154 -> 155, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %172 = arith.mulf %10, %165 {timing = #hls.t<153 -> 157, 4, 1>} : f32
          %173 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<153 -> 155, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %174 = arith.addf %172, %173 {timing = #hls.t<148 -> 153, 5, 1>} : f32
          affine.store %174, %arg4[%arg6 * 2 + 6, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<147 -> 148, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %175 = arith.mulf %14, %165 {timing = #hls.t<152 -> 156, 4, 1>} : f32
          %176 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<152 -> 154, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %177 = arith.addf %175, %176 {timing = #hls.t<147 -> 152, 5, 1>} : f32
          affine.store %177, %arg4[%arg6 * 2 + 6, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<146 -> 147, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %178 = arith.mulf %18, %165 {timing = #hls.t<145 -> 149, 4, 1>} : f32
          %179 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<145 -> 147, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %180 = arith.addf %178, %179 {timing = #hls.t<140 -> 145, 5, 1>} : f32
          affine.store %180, %arg4[%arg6 * 2 + 6, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<139 -> 140, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %181 = arith.mulf %22, %165 {timing = #hls.t<144 -> 148, 4, 1>} : f32
          %182 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<144 -> 146, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %183 = arith.addf %181, %182 {timing = #hls.t<139 -> 144, 5, 1>} : f32
          affine.store %183, %arg4[%arg6 * 2 + 6, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<138 -> 139, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %184 = arith.mulf %26, %165 {timing = #hls.t<137 -> 141, 4, 1>} : f32
          %185 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %186 = arith.addf %184, %185 {timing = #hls.t<132 -> 137, 5, 1>} : f32
          affine.store %186, %arg4[%arg6 * 2 + 6, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<131 -> 132, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %187 = arith.mulf %30, %165 {timing = #hls.t<136 -> 140, 4, 1>} : f32
          %188 = affine.load %arg4[%arg6 * 2 + 6, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<136 -> 138, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %189 = arith.addf %187, %188 {timing = #hls.t<131 -> 136, 5, 1>} : f32
          affine.store %189, %arg4[%arg6 * 2 + 6, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<130 -> 131, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %190 = affine.load %arg2[%arg6 * 2 + 7, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<167 -> 169, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %191 = arith.mulf %arg0, %190 {timing = #hls.t<163 -> 167, 4, 1>} : f32
          %192 = arith.mulf %2, %191 {timing = #hls.t<159 -> 163, 4, 1>} : f32
          %193 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<159 -> 161, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %194 = arith.addf %192, %193 {timing = #hls.t<154 -> 159, 5, 1>} : f32
          affine.store %194, %arg4[%arg6 * 2 + 7, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<153 -> 154, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %195 = arith.mulf %6, %191 {timing = #hls.t<158 -> 162, 4, 1>} : f32
          %196 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<158 -> 160, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %197 = arith.addf %195, %196 {timing = #hls.t<153 -> 158, 5, 1>} : f32
          affine.store %197, %arg4[%arg6 * 2 + 7, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<152 -> 153, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %198 = arith.mulf %10, %191 {timing = #hls.t<151 -> 155, 4, 1>} : f32
          %199 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<151 -> 153, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %200 = arith.addf %198, %199 {timing = #hls.t<146 -> 151, 5, 1>} : f32
          affine.store %200, %arg4[%arg6 * 2 + 7, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<145 -> 146, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %201 = arith.mulf %14, %191 {timing = #hls.t<150 -> 154, 4, 1>} : f32
          %202 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<150 -> 152, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %203 = arith.addf %201, %202 {timing = #hls.t<145 -> 150, 5, 1>} : f32
          affine.store %203, %arg4[%arg6 * 2 + 7, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<144 -> 145, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %204 = arith.mulf %18, %191 {timing = #hls.t<143 -> 147, 4, 1>} : f32
          %205 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<143 -> 145, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %206 = arith.addf %204, %205 {timing = #hls.t<138 -> 143, 5, 1>} : f32
          affine.store %206, %arg4[%arg6 * 2 + 7, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<137 -> 138, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %207 = arith.mulf %22, %191 {timing = #hls.t<142 -> 146, 4, 1>} : f32
          %208 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<142 -> 144, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %209 = arith.addf %207, %208 {timing = #hls.t<137 -> 142, 5, 1>} : f32
          affine.store %209, %arg4[%arg6 * 2 + 7, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<136 -> 137, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %210 = arith.mulf %26, %191 {timing = #hls.t<135 -> 139, 4, 1>} : f32
          %211 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %212 = arith.addf %210, %211 {timing = #hls.t<130 -> 135, 5, 1>} : f32
          affine.store %212, %arg4[%arg6 * 2 + 7, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<129 -> 130, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %213 = arith.mulf %30, %191 {timing = #hls.t<134 -> 138, 4, 1>} : f32
          %214 = affine.load %arg4[%arg6 * 2 + 7, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<134 -> 136, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %215 = arith.addf %213, %214 {timing = #hls.t<129 -> 134, 5, 1>} : f32
          affine.store %215, %arg4[%arg6 * 2 + 7, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<128 -> 129, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %216 = affine.load %arg2[%arg6 * 2 + 8, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<137 -> 139, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %217 = arith.mulf %arg0, %216 {timing = #hls.t<133 -> 137, 4, 1>} : f32
          %218 = arith.mulf %2, %217 {timing = #hls.t<129 -> 133, 4, 1>} : f32
          %219 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<129 -> 131, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %220 = arith.addf %218, %219 {timing = #hls.t<124 -> 129, 5, 1>} : f32
          affine.store %220, %arg4[%arg6 * 2 + 8, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<123 -> 124, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %221 = arith.mulf %6, %217 {timing = #hls.t<128 -> 132, 4, 1>} : f32
          %222 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<128 -> 130, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %223 = arith.addf %221, %222 {timing = #hls.t<123 -> 128, 5, 1>} : f32
          affine.store %223, %arg4[%arg6 * 2 + 8, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<122 -> 123, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %224 = arith.mulf %10, %217 {timing = #hls.t<121 -> 125, 4, 1>} : f32
          %225 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<121 -> 123, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %226 = arith.addf %224, %225 {timing = #hls.t<116 -> 121, 5, 1>} : f32
          affine.store %226, %arg4[%arg6 * 2 + 8, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<115 -> 116, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %227 = arith.mulf %14, %217 {timing = #hls.t<120 -> 124, 4, 1>} : f32
          %228 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<120 -> 122, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %229 = arith.addf %227, %228 {timing = #hls.t<115 -> 120, 5, 1>} : f32
          affine.store %229, %arg4[%arg6 * 2 + 8, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<114 -> 115, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %230 = arith.mulf %18, %217 {timing = #hls.t<113 -> 117, 4, 1>} : f32
          %231 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<113 -> 115, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %232 = arith.addf %230, %231 {timing = #hls.t<108 -> 113, 5, 1>} : f32
          affine.store %232, %arg4[%arg6 * 2 + 8, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<107 -> 108, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %233 = arith.mulf %22, %217 {timing = #hls.t<112 -> 116, 4, 1>} : f32
          %234 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<112 -> 114, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %235 = arith.addf %233, %234 {timing = #hls.t<107 -> 112, 5, 1>} : f32
          affine.store %235, %arg4[%arg6 * 2 + 8, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<106 -> 107, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %236 = arith.mulf %26, %217 {timing = #hls.t<105 -> 109, 4, 1>} : f32
          %237 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<105 -> 107, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %238 = arith.addf %236, %237 {timing = #hls.t<100 -> 105, 5, 1>} : f32
          affine.store %238, %arg4[%arg6 * 2 + 8, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<99 -> 100, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %239 = arith.mulf %30, %217 {timing = #hls.t<104 -> 108, 4, 1>} : f32
          %240 = affine.load %arg4[%arg6 * 2 + 8, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<104 -> 106, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %241 = arith.addf %239, %240 {timing = #hls.t<99 -> 104, 5, 1>} : f32
          affine.store %241, %arg4[%arg6 * 2 + 8, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<98 -> 99, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %242 = affine.load %arg2[%arg6 * 2 + 9, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<135 -> 137, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %243 = arith.mulf %arg0, %242 {timing = #hls.t<131 -> 135, 4, 1>} : f32
          %244 = arith.mulf %2, %243 {timing = #hls.t<127 -> 131, 4, 1>} : f32
          %245 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<127 -> 129, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %246 = arith.addf %244, %245 {timing = #hls.t<122 -> 127, 5, 1>} : f32
          affine.store %246, %arg4[%arg6 * 2 + 9, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<121 -> 122, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %247 = arith.mulf %6, %243 {timing = #hls.t<126 -> 130, 4, 1>} : f32
          %248 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<126 -> 128, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %249 = arith.addf %247, %248 {timing = #hls.t<121 -> 126, 5, 1>} : f32
          affine.store %249, %arg4[%arg6 * 2 + 9, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<120 -> 121, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %250 = arith.mulf %10, %243 {timing = #hls.t<119 -> 123, 4, 1>} : f32
          %251 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<119 -> 121, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %252 = arith.addf %250, %251 {timing = #hls.t<114 -> 119, 5, 1>} : f32
          affine.store %252, %arg4[%arg6 * 2 + 9, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<113 -> 114, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %253 = arith.mulf %14, %243 {timing = #hls.t<118 -> 122, 4, 1>} : f32
          %254 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<118 -> 120, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %255 = arith.addf %253, %254 {timing = #hls.t<113 -> 118, 5, 1>} : f32
          affine.store %255, %arg4[%arg6 * 2 + 9, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<112 -> 113, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %256 = arith.mulf %18, %243 {timing = #hls.t<111 -> 115, 4, 1>} : f32
          %257 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<111 -> 113, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %258 = arith.addf %256, %257 {timing = #hls.t<106 -> 111, 5, 1>} : f32
          affine.store %258, %arg4[%arg6 * 2 + 9, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<105 -> 106, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %259 = arith.mulf %22, %243 {timing = #hls.t<110 -> 114, 4, 1>} : f32
          %260 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<110 -> 112, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %261 = arith.addf %259, %260 {timing = #hls.t<105 -> 110, 5, 1>} : f32
          affine.store %261, %arg4[%arg6 * 2 + 9, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<104 -> 105, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %262 = arith.mulf %26, %243 {timing = #hls.t<103 -> 107, 4, 1>} : f32
          %263 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<103 -> 105, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %264 = arith.addf %262, %263 {timing = #hls.t<98 -> 103, 5, 1>} : f32
          affine.store %264, %arg4[%arg6 * 2 + 9, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<97 -> 98, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %265 = arith.mulf %30, %243 {timing = #hls.t<102 -> 106, 4, 1>} : f32
          %266 = affine.load %arg4[%arg6 * 2 + 9, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<102 -> 104, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %267 = arith.addf %265, %266 {timing = #hls.t<97 -> 102, 5, 1>} : f32
          affine.store %267, %arg4[%arg6 * 2 + 9, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<96 -> 97, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %268 = affine.load %arg2[%arg6 * 2 + 10, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<105 -> 107, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %269 = arith.mulf %arg0, %268 {timing = #hls.t<101 -> 105, 4, 1>} : f32
          %270 = arith.mulf %2, %269 {timing = #hls.t<97 -> 101, 4, 1>} : f32
          %271 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<97 -> 99, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %272 = arith.addf %270, %271 {timing = #hls.t<92 -> 97, 5, 1>} : f32
          affine.store %272, %arg4[%arg6 * 2 + 10, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<91 -> 92, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %273 = arith.mulf %6, %269 {timing = #hls.t<96 -> 100, 4, 1>} : f32
          %274 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<96 -> 98, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %275 = arith.addf %273, %274 {timing = #hls.t<91 -> 96, 5, 1>} : f32
          affine.store %275, %arg4[%arg6 * 2 + 10, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<90 -> 91, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %276 = arith.mulf %10, %269 {timing = #hls.t<89 -> 93, 4, 1>} : f32
          %277 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<89 -> 91, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %278 = arith.addf %276, %277 {timing = #hls.t<84 -> 89, 5, 1>} : f32
          affine.store %278, %arg4[%arg6 * 2 + 10, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<83 -> 84, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %279 = arith.mulf %14, %269 {timing = #hls.t<88 -> 92, 4, 1>} : f32
          %280 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<88 -> 90, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %281 = arith.addf %279, %280 {timing = #hls.t<83 -> 88, 5, 1>} : f32
          affine.store %281, %arg4[%arg6 * 2 + 10, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<82 -> 83, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %282 = arith.mulf %18, %269 {timing = #hls.t<81 -> 85, 4, 1>} : f32
          %283 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<81 -> 83, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %284 = arith.addf %282, %283 {timing = #hls.t<76 -> 81, 5, 1>} : f32
          affine.store %284, %arg4[%arg6 * 2 + 10, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<75 -> 76, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %285 = arith.mulf %22, %269 {timing = #hls.t<80 -> 84, 4, 1>} : f32
          %286 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<80 -> 82, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %287 = arith.addf %285, %286 {timing = #hls.t<75 -> 80, 5, 1>} : f32
          affine.store %287, %arg4[%arg6 * 2 + 10, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<74 -> 75, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %288 = arith.mulf %26, %269 {timing = #hls.t<73 -> 77, 4, 1>} : f32
          %289 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<73 -> 75, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %290 = arith.addf %288, %289 {timing = #hls.t<68 -> 73, 5, 1>} : f32
          affine.store %290, %arg4[%arg6 * 2 + 10, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<67 -> 68, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %291 = arith.mulf %30, %269 {timing = #hls.t<72 -> 76, 4, 1>} : f32
          %292 = affine.load %arg4[%arg6 * 2 + 10, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<72 -> 74, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %293 = arith.addf %291, %292 {timing = #hls.t<67 -> 72, 5, 1>} : f32
          affine.store %293, %arg4[%arg6 * 2 + 10, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<66 -> 67, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %294 = affine.load %arg2[%arg6 * 2 + 11, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<103 -> 105, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %295 = arith.mulf %arg0, %294 {timing = #hls.t<99 -> 103, 4, 1>} : f32
          %296 = arith.mulf %2, %295 {timing = #hls.t<95 -> 99, 4, 1>} : f32
          %297 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<95 -> 97, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %298 = arith.addf %296, %297 {timing = #hls.t<90 -> 95, 5, 1>} : f32
          affine.store %298, %arg4[%arg6 * 2 + 11, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<89 -> 90, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %299 = arith.mulf %6, %295 {timing = #hls.t<94 -> 98, 4, 1>} : f32
          %300 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<94 -> 96, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %301 = arith.addf %299, %300 {timing = #hls.t<89 -> 94, 5, 1>} : f32
          affine.store %301, %arg4[%arg6 * 2 + 11, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<88 -> 89, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %302 = arith.mulf %10, %295 {timing = #hls.t<87 -> 91, 4, 1>} : f32
          %303 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<87 -> 89, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %304 = arith.addf %302, %303 {timing = #hls.t<82 -> 87, 5, 1>} : f32
          affine.store %304, %arg4[%arg6 * 2 + 11, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<81 -> 82, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %305 = arith.mulf %14, %295 {timing = #hls.t<86 -> 90, 4, 1>} : f32
          %306 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<86 -> 88, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %307 = arith.addf %305, %306 {timing = #hls.t<81 -> 86, 5, 1>} : f32
          affine.store %307, %arg4[%arg6 * 2 + 11, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<80 -> 81, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %308 = arith.mulf %18, %295 {timing = #hls.t<79 -> 83, 4, 1>} : f32
          %309 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<79 -> 81, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %310 = arith.addf %308, %309 {timing = #hls.t<74 -> 79, 5, 1>} : f32
          affine.store %310, %arg4[%arg6 * 2 + 11, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<73 -> 74, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %311 = arith.mulf %22, %295 {timing = #hls.t<78 -> 82, 4, 1>} : f32
          %312 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<78 -> 80, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %313 = arith.addf %311, %312 {timing = #hls.t<73 -> 78, 5, 1>} : f32
          affine.store %313, %arg4[%arg6 * 2 + 11, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<72 -> 73, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %314 = arith.mulf %26, %295 {timing = #hls.t<71 -> 75, 4, 1>} : f32
          %315 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<71 -> 73, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %316 = arith.addf %314, %315 {timing = #hls.t<66 -> 71, 5, 1>} : f32
          affine.store %316, %arg4[%arg6 * 2 + 11, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<65 -> 66, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %317 = arith.mulf %30, %295 {timing = #hls.t<70 -> 74, 4, 1>} : f32
          %318 = affine.load %arg4[%arg6 * 2 + 11, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<70 -> 72, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %319 = arith.addf %317, %318 {timing = #hls.t<65 -> 70, 5, 1>} : f32
          affine.store %319, %arg4[%arg6 * 2 + 11, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<64 -> 65, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %320 = affine.load %arg2[%arg6 * 2 + 12, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<73 -> 75, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %321 = arith.mulf %arg0, %320 {timing = #hls.t<69 -> 73, 4, 1>} : f32
          %322 = arith.mulf %2, %321 {timing = #hls.t<65 -> 69, 4, 1>} : f32
          %323 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<65 -> 67, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %324 = arith.addf %322, %323 {timing = #hls.t<60 -> 65, 5, 1>} : f32
          affine.store %324, %arg4[%arg6 * 2 + 12, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<59 -> 60, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %325 = arith.mulf %6, %321 {timing = #hls.t<64 -> 68, 4, 1>} : f32
          %326 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<64 -> 66, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %327 = arith.addf %325, %326 {timing = #hls.t<59 -> 64, 5, 1>} : f32
          affine.store %327, %arg4[%arg6 * 2 + 12, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<58 -> 59, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %328 = arith.mulf %10, %321 {timing = #hls.t<57 -> 61, 4, 1>} : f32
          %329 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<57 -> 59, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %330 = arith.addf %328, %329 {timing = #hls.t<52 -> 57, 5, 1>} : f32
          affine.store %330, %arg4[%arg6 * 2 + 12, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<51 -> 52, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %331 = arith.mulf %14, %321 {timing = #hls.t<56 -> 60, 4, 1>} : f32
          %332 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<56 -> 58, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %333 = arith.addf %331, %332 {timing = #hls.t<51 -> 56, 5, 1>} : f32
          affine.store %333, %arg4[%arg6 * 2 + 12, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<50 -> 51, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %334 = arith.mulf %18, %321 {timing = #hls.t<49 -> 53, 4, 1>} : f32
          %335 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<49 -> 51, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %336 = arith.addf %334, %335 {timing = #hls.t<44 -> 49, 5, 1>} : f32
          affine.store %336, %arg4[%arg6 * 2 + 12, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<43 -> 44, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %337 = arith.mulf %22, %321 {timing = #hls.t<48 -> 52, 4, 1>} : f32
          %338 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<48 -> 50, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %339 = arith.addf %337, %338 {timing = #hls.t<43 -> 48, 5, 1>} : f32
          affine.store %339, %arg4[%arg6 * 2 + 12, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<42 -> 43, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %340 = arith.mulf %26, %321 {timing = #hls.t<41 -> 45, 4, 1>} : f32
          %341 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %342 = arith.addf %340, %341 {timing = #hls.t<36 -> 41, 5, 1>} : f32
          affine.store %342, %arg4[%arg6 * 2 + 12, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<35 -> 36, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %343 = arith.mulf %30, %321 {timing = #hls.t<40 -> 44, 4, 1>} : f32
          %344 = affine.load %arg4[%arg6 * 2 + 12, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<40 -> 42, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %345 = arith.addf %343, %344 {timing = #hls.t<35 -> 40, 5, 1>} : f32
          affine.store %345, %arg4[%arg6 * 2 + 12, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<34 -> 35, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %346 = affine.load %arg2[%arg6 * 2 + 13, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<71 -> 73, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %347 = arith.mulf %arg0, %346 {timing = #hls.t<67 -> 71, 4, 1>} : f32
          %348 = arith.mulf %2, %347 {timing = #hls.t<63 -> 67, 4, 1>} : f32
          %349 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<63 -> 65, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %350 = arith.addf %348, %349 {timing = #hls.t<58 -> 63, 5, 1>} : f32
          affine.store %350, %arg4[%arg6 * 2 + 13, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<57 -> 58, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %351 = arith.mulf %6, %347 {timing = #hls.t<62 -> 66, 4, 1>} : f32
          %352 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<62 -> 64, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %353 = arith.addf %351, %352 {timing = #hls.t<57 -> 62, 5, 1>} : f32
          affine.store %353, %arg4[%arg6 * 2 + 13, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<56 -> 57, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %354 = arith.mulf %10, %347 {timing = #hls.t<55 -> 59, 4, 1>} : f32
          %355 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<55 -> 57, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %356 = arith.addf %354, %355 {timing = #hls.t<50 -> 55, 5, 1>} : f32
          affine.store %356, %arg4[%arg6 * 2 + 13, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<49 -> 50, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %357 = arith.mulf %14, %347 {timing = #hls.t<54 -> 58, 4, 1>} : f32
          %358 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<54 -> 56, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %359 = arith.addf %357, %358 {timing = #hls.t<49 -> 54, 5, 1>} : f32
          affine.store %359, %arg4[%arg6 * 2 + 13, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<48 -> 49, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %360 = arith.mulf %18, %347 {timing = #hls.t<47 -> 51, 4, 1>} : f32
          %361 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<47 -> 49, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %362 = arith.addf %360, %361 {timing = #hls.t<42 -> 47, 5, 1>} : f32
          affine.store %362, %arg4[%arg6 * 2 + 13, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<41 -> 42, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %363 = arith.mulf %22, %347 {timing = #hls.t<46 -> 50, 4, 1>} : f32
          %364 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<46 -> 48, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %365 = arith.addf %363, %364 {timing = #hls.t<41 -> 46, 5, 1>} : f32
          affine.store %365, %arg4[%arg6 * 2 + 13, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<40 -> 41, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %366 = arith.mulf %26, %347 {timing = #hls.t<39 -> 43, 4, 1>} : f32
          %367 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %368 = arith.addf %366, %367 {timing = #hls.t<34 -> 39, 5, 1>} : f32
          affine.store %368, %arg4[%arg6 * 2 + 13, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<33 -> 34, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %369 = arith.mulf %30, %347 {timing = #hls.t<38 -> 42, 4, 1>} : f32
          %370 = affine.load %arg4[%arg6 * 2 + 13, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<38 -> 40, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %371 = arith.addf %369, %370 {timing = #hls.t<33 -> 38, 5, 1>} : f32
          affine.store %371, %arg4[%arg6 * 2 + 13, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<32 -> 33, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %372 = affine.load %arg2[%arg6 * 2 + 14, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<41 -> 43, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %373 = arith.mulf %arg0, %372 {timing = #hls.t<37 -> 41, 4, 1>} : f32
          %374 = arith.mulf %2, %373 {timing = #hls.t<33 -> 37, 4, 1>} : f32
          %375 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<33 -> 35, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %376 = arith.addf %374, %375 {timing = #hls.t<28 -> 33, 5, 1>} : f32
          affine.store %376, %arg4[%arg6 * 2 + 14, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<27 -> 28, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %377 = arith.mulf %6, %373 {timing = #hls.t<32 -> 36, 4, 1>} : f32
          %378 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<32 -> 34, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %379 = arith.addf %377, %378 {timing = #hls.t<27 -> 32, 5, 1>} : f32
          affine.store %379, %arg4[%arg6 * 2 + 14, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<26 -> 27, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %380 = arith.mulf %10, %373 {timing = #hls.t<25 -> 29, 4, 1>} : f32
          %381 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<25 -> 27, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %382 = arith.addf %380, %381 {timing = #hls.t<20 -> 25, 5, 1>} : f32
          affine.store %382, %arg4[%arg6 * 2 + 14, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<19 -> 20, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %383 = arith.mulf %14, %373 {timing = #hls.t<24 -> 28, 4, 1>} : f32
          %384 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<24 -> 26, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %385 = arith.addf %383, %384 {timing = #hls.t<19 -> 24, 5, 1>} : f32
          affine.store %385, %arg4[%arg6 * 2 + 14, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<18 -> 19, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %386 = arith.mulf %18, %373 {timing = #hls.t<17 -> 21, 4, 1>} : f32
          %387 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<17 -> 19, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %388 = arith.addf %386, %387 {timing = #hls.t<12 -> 17, 5, 1>} : f32
          affine.store %388, %arg4[%arg6 * 2 + 14, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<11 -> 12, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %389 = arith.mulf %22, %373 {timing = #hls.t<16 -> 20, 4, 1>} : f32
          %390 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<16 -> 18, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %391 = arith.addf %389, %390 {timing = #hls.t<11 -> 16, 5, 1>} : f32
          affine.store %391, %arg4[%arg6 * 2 + 14, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<10 -> 11, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %392 = arith.mulf %26, %373 {timing = #hls.t<9 -> 13, 4, 1>} : f32
          %393 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<9 -> 11, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %394 = arith.addf %392, %393 {timing = #hls.t<4 -> 9, 5, 1>} : f32
          affine.store %394, %arg4[%arg6 * 2 + 14, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<3 -> 4, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %395 = arith.mulf %30, %373 {timing = #hls.t<8 -> 12, 4, 1>} : f32
          %396 = affine.load %arg4[%arg6 * 2 + 14, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<8 -> 10, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %397 = arith.addf %395, %396 {timing = #hls.t<3 -> 8, 5, 1>} : f32
          affine.store %397, %arg4[%arg6 * 2 + 14, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<2 -> 3, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %398 = affine.load %arg2[%arg6 * 2 + 15, %arg5] {max_mux_size = 16 : i64, partition_indices = [-1, 0], timing = #hls.t<39 -> 41, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
          %399 = arith.mulf %arg0, %398 {timing = #hls.t<35 -> 39, 4, 1>} : f32
          %400 = arith.mulf %2, %399 {timing = #hls.t<31 -> 35, 4, 1>} : f32
          %401 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<31 -> 33, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %402 = arith.addf %400, %401 {timing = #hls.t<26 -> 31, 5, 1>} : f32
          affine.store %402, %arg4[%arg6 * 2 + 15, %arg7 * 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<25 -> 26, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %403 = arith.mulf %6, %399 {timing = #hls.t<30 -> 34, 4, 1>} : f32
          %404 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<30 -> 32, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %405 = arith.addf %403, %404 {timing = #hls.t<25 -> 30, 5, 1>} : f32
          affine.store %405, %arg4[%arg6 * 2 + 15, %arg7 * 2 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<24 -> 25, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %406 = arith.mulf %10, %399 {timing = #hls.t<23 -> 27, 4, 1>} : f32
          %407 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<23 -> 25, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %408 = arith.addf %406, %407 {timing = #hls.t<18 -> 23, 5, 1>} : f32
          affine.store %408, %arg4[%arg6 * 2 + 15, %arg7 * 2 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<17 -> 18, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %409 = arith.mulf %14, %399 {timing = #hls.t<22 -> 26, 4, 1>} : f32
          %410 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<22 -> 24, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %411 = arith.addf %409, %410 {timing = #hls.t<17 -> 22, 5, 1>} : f32
          affine.store %411, %arg4[%arg6 * 2 + 15, %arg7 * 2 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<16 -> 17, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %412 = arith.mulf %18, %399 {timing = #hls.t<15 -> 19, 4, 1>} : f32
          %413 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<15 -> 17, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %414 = arith.addf %412, %413 {timing = #hls.t<10 -> 15, 5, 1>} : f32
          affine.store %414, %arg4[%arg6 * 2 + 15, %arg7 * 2 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<9 -> 10, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %415 = arith.mulf %22, %399 {timing = #hls.t<14 -> 18, 4, 1>} : f32
          %416 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %417 = arith.addf %415, %416 {timing = #hls.t<9 -> 14, 5, 1>} : f32
          affine.store %417, %arg4[%arg6 * 2 + 15, %arg7 * 2 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<8 -> 9, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %418 = arith.mulf %26, %399 {timing = #hls.t<7 -> 11, 4, 1>} : f32
          %419 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<7 -> 9, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %420 = arith.addf %418, %419 {timing = #hls.t<2 -> 7, 5, 1>} : f32
          affine.store %420, %arg4[%arg6 * 2 + 15, %arg7 * 2 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<1 -> 2, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %421 = arith.mulf %30, %399 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %422 = affine.load %arg4[%arg6 * 2 + 15, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
          %423 = arith.addf %421, %422 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %423, %arg4[%arg6 * 2 + 15, %arg7 * 2 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, -1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096xf32, affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=512, iterLatency=267, minII=256>, timing = #hls.t<0 -> 131085, 131085, 131085>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=131072, iterLatency=267, minII=256>, timing = #hls.t<0 -> 33554445, 33554445, 33554445>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=536870912, iterLatency=267, minII=256>, resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 137438953485, 137438953485, 137438953485>}
    return
  }
}