module {
  func @"3mm_32"(%arg0: f32, %arg1: memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg2: memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>, %arg3: memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg4: memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>, %arg5: memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>, %arg6: memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>, %arg7: memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>) attributes {resource = #hls.r<lut=0, dsp=160, bram=0>, timing = #hls.t<0 -> 5199, 5199, 5199>, top_func} {
    affine.for %arg8 = 0 to 16 {
      affine.for %arg9 = 0 to 2 {
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 1] {partition_indices = [0, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 2] {partition_indices = [0, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 3] {partition_indices = [0, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 4] {partition_indices = [0, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 5] {partition_indices = [0, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 6] {partition_indices = [0, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 7] {partition_indices = [0, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 8] {partition_indices = [0, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 9] {partition_indices = [0, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 10] {partition_indices = [0, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 11] {partition_indices = [0, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 12] {partition_indices = [0, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 13] {partition_indices = [0, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 14] {partition_indices = [0, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2, %arg9 * 16 + 15] {partition_indices = [0, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16] {partition_indices = [1, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 1] {partition_indices = [1, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 2] {partition_indices = [1, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 3] {partition_indices = [1, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 4] {partition_indices = [1, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 5] {partition_indices = [1, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 6] {partition_indices = [1, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 7] {partition_indices = [1, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 8] {partition_indices = [1, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 9] {partition_indices = [1, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 10] {partition_indices = [1, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 11] {partition_indices = [1, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 12] {partition_indices = [1, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 13] {partition_indices = [1, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 14] {partition_indices = [1, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        affine.store %arg0, %arg5[%arg8 * 2 + 1, %arg9 * 16 + 15] {partition_indices = [1, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 32 {
      affine.for %arg9 = 0 to 16 {
        affine.for %arg10 = 0 to 2 {
          %0 = affine.load %arg1[%arg9 * 2, %arg8] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %1 = affine.load %arg2[%arg8, %arg10 * 16] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg5[%arg9 * 2, %arg10 * 16] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg5[%arg9 * 2, %arg10 * 16] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %5 = affine.load %arg2[%arg8, %arg10 * 16 + 1] {partition_indices = [0, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %6 = arith.mulf %0, %5 : f32
          %7 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 1] {partition_indices = [0, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %arg5[%arg9 * 2, %arg10 * 16 + 1] {partition_indices = [0, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %9 = affine.load %arg2[%arg8, %arg10 * 16 + 2] {partition_indices = [0, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %10 = arith.mulf %0, %9 : f32
          %11 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 2] {partition_indices = [0, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %12 = arith.addf %10, %11 : f32
          affine.store %12, %arg5[%arg9 * 2, %arg10 * 16 + 2] {partition_indices = [0, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %13 = affine.load %arg2[%arg8, %arg10 * 16 + 3] {partition_indices = [0, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %14 = arith.mulf %0, %13 : f32
          %15 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 3] {partition_indices = [0, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %16 = arith.addf %14, %15 : f32
          affine.store %16, %arg5[%arg9 * 2, %arg10 * 16 + 3] {partition_indices = [0, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %17 = affine.load %arg2[%arg8, %arg10 * 16 + 4] {partition_indices = [0, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %18 = arith.mulf %0, %17 : f32
          %19 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 4] {partition_indices = [0, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %20 = arith.addf %18, %19 : f32
          affine.store %20, %arg5[%arg9 * 2, %arg10 * 16 + 4] {partition_indices = [0, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %21 = affine.load %arg2[%arg8, %arg10 * 16 + 5] {partition_indices = [0, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %22 = arith.mulf %0, %21 : f32
          %23 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 5] {partition_indices = [0, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %24 = arith.addf %22, %23 : f32
          affine.store %24, %arg5[%arg9 * 2, %arg10 * 16 + 5] {partition_indices = [0, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %25 = affine.load %arg2[%arg8, %arg10 * 16 + 6] {partition_indices = [0, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %26 = arith.mulf %0, %25 : f32
          %27 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 6] {partition_indices = [0, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %28 = arith.addf %26, %27 : f32
          affine.store %28, %arg5[%arg9 * 2, %arg10 * 16 + 6] {partition_indices = [0, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %29 = affine.load %arg2[%arg8, %arg10 * 16 + 7] {partition_indices = [0, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %30 = arith.mulf %0, %29 : f32
          %31 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 7] {partition_indices = [0, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %32 = arith.addf %30, %31 : f32
          affine.store %32, %arg5[%arg9 * 2, %arg10 * 16 + 7] {partition_indices = [0, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %33 = affine.load %arg2[%arg8, %arg10 * 16 + 8] {partition_indices = [0, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %34 = arith.mulf %0, %33 : f32
          %35 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 8] {partition_indices = [0, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %36 = arith.addf %34, %35 : f32
          affine.store %36, %arg5[%arg9 * 2, %arg10 * 16 + 8] {partition_indices = [0, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %37 = affine.load %arg2[%arg8, %arg10 * 16 + 9] {partition_indices = [0, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %38 = arith.mulf %0, %37 : f32
          %39 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 9] {partition_indices = [0, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %40 = arith.addf %38, %39 : f32
          affine.store %40, %arg5[%arg9 * 2, %arg10 * 16 + 9] {partition_indices = [0, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %41 = affine.load %arg2[%arg8, %arg10 * 16 + 10] {partition_indices = [0, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %42 = arith.mulf %0, %41 : f32
          %43 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 10] {partition_indices = [0, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %44 = arith.addf %42, %43 : f32
          affine.store %44, %arg5[%arg9 * 2, %arg10 * 16 + 10] {partition_indices = [0, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %45 = affine.load %arg2[%arg8, %arg10 * 16 + 11] {partition_indices = [0, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %46 = arith.mulf %0, %45 : f32
          %47 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 11] {partition_indices = [0, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %48 = arith.addf %46, %47 : f32
          affine.store %48, %arg5[%arg9 * 2, %arg10 * 16 + 11] {partition_indices = [0, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %49 = affine.load %arg2[%arg8, %arg10 * 16 + 12] {partition_indices = [0, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %50 = arith.mulf %0, %49 : f32
          %51 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 12] {partition_indices = [0, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %52 = arith.addf %50, %51 : f32
          affine.store %52, %arg5[%arg9 * 2, %arg10 * 16 + 12] {partition_indices = [0, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %53 = affine.load %arg2[%arg8, %arg10 * 16 + 13] {partition_indices = [0, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %54 = arith.mulf %0, %53 : f32
          %55 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 13] {partition_indices = [0, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %56 = arith.addf %54, %55 : f32
          affine.store %56, %arg5[%arg9 * 2, %arg10 * 16 + 13] {partition_indices = [0, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %57 = affine.load %arg2[%arg8, %arg10 * 16 + 14] {partition_indices = [0, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %58 = arith.mulf %0, %57 : f32
          %59 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 14] {partition_indices = [0, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %60 = arith.addf %58, %59 : f32
          affine.store %60, %arg5[%arg9 * 2, %arg10 * 16 + 14] {partition_indices = [0, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %61 = affine.load %arg2[%arg8, %arg10 * 16 + 15] {partition_indices = [0, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %62 = arith.mulf %0, %61 : f32
          %63 = affine.load %arg5[%arg9 * 2, %arg10 * 16 + 15] {partition_indices = [0, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %64 = arith.addf %62, %63 : f32
          affine.store %64, %arg5[%arg9 * 2, %arg10 * 16 + 15] {partition_indices = [0, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %65 = affine.load %arg1[%arg9 * 2 + 1, %arg8] {partition_indices = [1, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %66 = arith.mulf %65, %1 : f32
          %67 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16] {partition_indices = [1, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %68 = arith.addf %66, %67 : f32
          affine.store %68, %arg5[%arg9 * 2 + 1, %arg10 * 16] {partition_indices = [1, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %69 = arith.mulf %65, %5 : f32
          %70 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 1] {partition_indices = [1, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %71 = arith.addf %69, %70 : f32
          affine.store %71, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 1] {partition_indices = [1, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %72 = arith.mulf %65, %9 : f32
          %73 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 2] {partition_indices = [1, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %74 = arith.addf %72, %73 : f32
          affine.store %74, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 2] {partition_indices = [1, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %75 = arith.mulf %65, %13 : f32
          %76 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 3] {partition_indices = [1, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %77 = arith.addf %75, %76 : f32
          affine.store %77, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 3] {partition_indices = [1, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %78 = arith.mulf %65, %17 : f32
          %79 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 4] {partition_indices = [1, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %80 = arith.addf %78, %79 : f32
          affine.store %80, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 4] {partition_indices = [1, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %81 = arith.mulf %65, %21 : f32
          %82 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 5] {partition_indices = [1, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %83 = arith.addf %81, %82 : f32
          affine.store %83, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 5] {partition_indices = [1, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %84 = arith.mulf %65, %25 : f32
          %85 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 6] {partition_indices = [1, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %86 = arith.addf %84, %85 : f32
          affine.store %86, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 6] {partition_indices = [1, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %87 = arith.mulf %65, %29 : f32
          %88 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 7] {partition_indices = [1, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %89 = arith.addf %87, %88 : f32
          affine.store %89, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 7] {partition_indices = [1, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %90 = arith.mulf %65, %33 : f32
          %91 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 8] {partition_indices = [1, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %92 = arith.addf %90, %91 : f32
          affine.store %92, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 8] {partition_indices = [1, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %93 = arith.mulf %65, %37 : f32
          %94 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 9] {partition_indices = [1, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %95 = arith.addf %93, %94 : f32
          affine.store %95, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 9] {partition_indices = [1, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %96 = arith.mulf %65, %41 : f32
          %97 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 10] {partition_indices = [1, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %98 = arith.addf %96, %97 : f32
          affine.store %98, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 10] {partition_indices = [1, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %99 = arith.mulf %65, %45 : f32
          %100 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 11] {partition_indices = [1, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %101 = arith.addf %99, %100 : f32
          affine.store %101, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 11] {partition_indices = [1, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %102 = arith.mulf %65, %49 : f32
          %103 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 12] {partition_indices = [1, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %104 = arith.addf %102, %103 : f32
          affine.store %104, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 12] {partition_indices = [1, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %105 = arith.mulf %65, %53 : f32
          %106 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 13] {partition_indices = [1, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %107 = arith.addf %105, %106 : f32
          affine.store %107, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 13] {partition_indices = [1, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %108 = arith.mulf %65, %57 : f32
          %109 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 14] {partition_indices = [1, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %110 = arith.addf %108, %109 : f32
          affine.store %110, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 14] {partition_indices = [1, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %111 = arith.mulf %65, %61 : f32
          %112 = affine.load %arg5[%arg9 * 2 + 1, %arg10 * 16 + 15] {partition_indices = [1, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %113 = arith.addf %111, %112 : f32
          affine.store %113, %arg5[%arg9 * 2 + 1, %arg10 * 16 + 15] {partition_indices = [1, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg8 = 0 to 32 {
      affine.for %arg9 = 0 to 32 {
        affine.store %arg0, %arg6[%arg8, %arg9] {max_mux_size = 16 : i64, partition_indices = [-1, -1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 32 {
      affine.for %arg9 = 0 to 16 {
        affine.for %arg10 = 0 to 2 {
          %0 = affine.load %arg3[%arg9 * 2, %arg8] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %1 = affine.load %arg4[%arg8, %arg10 * 16] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg6[%arg9 * 2, %arg10 * 16] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg6[%arg9 * 2, %arg10 * 16] {partition_indices = [0, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %5 = affine.load %arg4[%arg8, %arg10 * 16 + 1] {partition_indices = [0, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %6 = arith.mulf %0, %5 : f32
          %7 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 1] {partition_indices = [0, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %arg6[%arg9 * 2, %arg10 * 16 + 1] {partition_indices = [0, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %9 = affine.load %arg4[%arg8, %arg10 * 16 + 2] {partition_indices = [0, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %10 = arith.mulf %0, %9 : f32
          %11 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 2] {partition_indices = [0, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %12 = arith.addf %10, %11 : f32
          affine.store %12, %arg6[%arg9 * 2, %arg10 * 16 + 2] {partition_indices = [0, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %13 = affine.load %arg4[%arg8, %arg10 * 16 + 3] {partition_indices = [0, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %14 = arith.mulf %0, %13 : f32
          %15 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 3] {partition_indices = [0, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %16 = arith.addf %14, %15 : f32
          affine.store %16, %arg6[%arg9 * 2, %arg10 * 16 + 3] {partition_indices = [0, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %17 = affine.load %arg4[%arg8, %arg10 * 16 + 4] {partition_indices = [0, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %18 = arith.mulf %0, %17 : f32
          %19 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 4] {partition_indices = [0, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %20 = arith.addf %18, %19 : f32
          affine.store %20, %arg6[%arg9 * 2, %arg10 * 16 + 4] {partition_indices = [0, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %21 = affine.load %arg4[%arg8, %arg10 * 16 + 5] {partition_indices = [0, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %22 = arith.mulf %0, %21 : f32
          %23 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 5] {partition_indices = [0, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %24 = arith.addf %22, %23 : f32
          affine.store %24, %arg6[%arg9 * 2, %arg10 * 16 + 5] {partition_indices = [0, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %25 = affine.load %arg4[%arg8, %arg10 * 16 + 6] {partition_indices = [0, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %26 = arith.mulf %0, %25 : f32
          %27 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 6] {partition_indices = [0, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %28 = arith.addf %26, %27 : f32
          affine.store %28, %arg6[%arg9 * 2, %arg10 * 16 + 6] {partition_indices = [0, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %29 = affine.load %arg4[%arg8, %arg10 * 16 + 7] {partition_indices = [0, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %30 = arith.mulf %0, %29 : f32
          %31 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 7] {partition_indices = [0, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %32 = arith.addf %30, %31 : f32
          affine.store %32, %arg6[%arg9 * 2, %arg10 * 16 + 7] {partition_indices = [0, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %33 = affine.load %arg4[%arg8, %arg10 * 16 + 8] {partition_indices = [0, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %34 = arith.mulf %0, %33 : f32
          %35 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 8] {partition_indices = [0, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %36 = arith.addf %34, %35 : f32
          affine.store %36, %arg6[%arg9 * 2, %arg10 * 16 + 8] {partition_indices = [0, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %37 = affine.load %arg4[%arg8, %arg10 * 16 + 9] {partition_indices = [0, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %38 = arith.mulf %0, %37 : f32
          %39 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 9] {partition_indices = [0, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %40 = arith.addf %38, %39 : f32
          affine.store %40, %arg6[%arg9 * 2, %arg10 * 16 + 9] {partition_indices = [0, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %41 = affine.load %arg4[%arg8, %arg10 * 16 + 10] {partition_indices = [0, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %42 = arith.mulf %0, %41 : f32
          %43 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 10] {partition_indices = [0, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %44 = arith.addf %42, %43 : f32
          affine.store %44, %arg6[%arg9 * 2, %arg10 * 16 + 10] {partition_indices = [0, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %45 = affine.load %arg4[%arg8, %arg10 * 16 + 11] {partition_indices = [0, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %46 = arith.mulf %0, %45 : f32
          %47 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 11] {partition_indices = [0, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %48 = arith.addf %46, %47 : f32
          affine.store %48, %arg6[%arg9 * 2, %arg10 * 16 + 11] {partition_indices = [0, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %49 = affine.load %arg4[%arg8, %arg10 * 16 + 12] {partition_indices = [0, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %50 = arith.mulf %0, %49 : f32
          %51 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 12] {partition_indices = [0, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %52 = arith.addf %50, %51 : f32
          affine.store %52, %arg6[%arg9 * 2, %arg10 * 16 + 12] {partition_indices = [0, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %53 = affine.load %arg4[%arg8, %arg10 * 16 + 13] {partition_indices = [0, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %54 = arith.mulf %0, %53 : f32
          %55 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 13] {partition_indices = [0, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %56 = arith.addf %54, %55 : f32
          affine.store %56, %arg6[%arg9 * 2, %arg10 * 16 + 13] {partition_indices = [0, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %57 = affine.load %arg4[%arg8, %arg10 * 16 + 14] {partition_indices = [0, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %58 = arith.mulf %0, %57 : f32
          %59 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 14] {partition_indices = [0, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %60 = arith.addf %58, %59 : f32
          affine.store %60, %arg6[%arg9 * 2, %arg10 * 16 + 14] {partition_indices = [0, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %61 = affine.load %arg4[%arg8, %arg10 * 16 + 15] {partition_indices = [0, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>>
          %62 = arith.mulf %0, %61 : f32
          %63 = affine.load %arg6[%arg9 * 2, %arg10 * 16 + 15] {partition_indices = [0, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %64 = arith.addf %62, %63 : f32
          affine.store %64, %arg6[%arg9 * 2, %arg10 * 16 + 15] {partition_indices = [0, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %65 = affine.load %arg3[%arg9 * 2 + 1, %arg8] {partition_indices = [1, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
          %66 = arith.mulf %65, %1 : f32
          %67 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16] {partition_indices = [1, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %68 = arith.addf %66, %67 : f32
          affine.store %68, %arg6[%arg9 * 2 + 1, %arg10 * 16] {partition_indices = [1, 0]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %69 = arith.mulf %65, %5 : f32
          %70 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 1] {partition_indices = [1, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %71 = arith.addf %69, %70 : f32
          affine.store %71, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 1] {partition_indices = [1, 1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %72 = arith.mulf %65, %9 : f32
          %73 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 2] {partition_indices = [1, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %74 = arith.addf %72, %73 : f32
          affine.store %74, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 2] {partition_indices = [1, 2]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %75 = arith.mulf %65, %13 : f32
          %76 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 3] {partition_indices = [1, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %77 = arith.addf %75, %76 : f32
          affine.store %77, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 3] {partition_indices = [1, 3]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %78 = arith.mulf %65, %17 : f32
          %79 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 4] {partition_indices = [1, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %80 = arith.addf %78, %79 : f32
          affine.store %80, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 4] {partition_indices = [1, 4]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %81 = arith.mulf %65, %21 : f32
          %82 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 5] {partition_indices = [1, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %83 = arith.addf %81, %82 : f32
          affine.store %83, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 5] {partition_indices = [1, 5]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %84 = arith.mulf %65, %25 : f32
          %85 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 6] {partition_indices = [1, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %86 = arith.addf %84, %85 : f32
          affine.store %86, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 6] {partition_indices = [1, 6]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %87 = arith.mulf %65, %29 : f32
          %88 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 7] {partition_indices = [1, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %89 = arith.addf %87, %88 : f32
          affine.store %89, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 7] {partition_indices = [1, 7]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %90 = arith.mulf %65, %33 : f32
          %91 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 8] {partition_indices = [1, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %92 = arith.addf %90, %91 : f32
          affine.store %92, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 8] {partition_indices = [1, 8]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %93 = arith.mulf %65, %37 : f32
          %94 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 9] {partition_indices = [1, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %95 = arith.addf %93, %94 : f32
          affine.store %95, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 9] {partition_indices = [1, 9]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %96 = arith.mulf %65, %41 : f32
          %97 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 10] {partition_indices = [1, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %98 = arith.addf %96, %97 : f32
          affine.store %98, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 10] {partition_indices = [1, 10]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %99 = arith.mulf %65, %45 : f32
          %100 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 11] {partition_indices = [1, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %101 = arith.addf %99, %100 : f32
          affine.store %101, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 11] {partition_indices = [1, 11]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %102 = arith.mulf %65, %49 : f32
          %103 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 12] {partition_indices = [1, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %104 = arith.addf %102, %103 : f32
          affine.store %104, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 12] {partition_indices = [1, 12]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %105 = arith.mulf %65, %53 : f32
          %106 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 13] {partition_indices = [1, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %107 = arith.addf %105, %106 : f32
          affine.store %107, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 13] {partition_indices = [1, 13]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %108 = arith.mulf %65, %57 : f32
          %109 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 14] {partition_indices = [1, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %110 = arith.addf %108, %109 : f32
          affine.store %110, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 14] {partition_indices = [1, 14]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %111 = arith.mulf %65, %61 : f32
          %112 = affine.load %arg6[%arg9 * 2 + 1, %arg10 * 16 + 15] {partition_indices = [1, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %113 = arith.addf %111, %112 : f32
          affine.store %113, %arg6[%arg9 * 2 + 1, %arg10 * 16 + 15] {partition_indices = [1, 15]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg8 = 0 to 32 {
      affine.for %arg9 = 0 to 32 {
        affine.store %arg0, %arg7[%arg8, %arg9] {max_mux_size = 16 : i64, partition_indices = [-1, -1]} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg8 = 0 to 32 {
      affine.for %arg9 = 0 to 16 {
        affine.for %arg10 = 0 to 2 {
          %0 = affine.load %arg5[%arg9 * 2, %arg8] {max_mux_size = 16 : i64, partition_indices = [0, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %1 = affine.load %arg6[%arg8, %arg10 * 16] {max_mux_size = 2 : i64, partition_indices = [-1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %3 = affine.load %arg7[%arg9 * 2, %arg10 * 16] {partition_indices = [0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %4, %arg7[%arg9 * 2, %arg10 * 16] {partition_indices = [0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %5 = affine.load %arg6[%arg8, %arg10 * 16 + 1] {max_mux_size = 2 : i64, partition_indices = [-1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %6 = arith.mulf %0, %5 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %7 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 1] {partition_indices = [0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %8 = arith.addf %6, %7 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %8, %arg7[%arg9 * 2, %arg10 * 16 + 1] {partition_indices = [0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %9 = affine.load %arg6[%arg8, %arg10 * 16 + 2] {max_mux_size = 2 : i64, partition_indices = [-1, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %10 = arith.mulf %0, %9 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %11 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 2] {partition_indices = [0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %12 = arith.addf %10, %11 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %12, %arg7[%arg9 * 2, %arg10 * 16 + 2] {partition_indices = [0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %13 = affine.load %arg6[%arg8, %arg10 * 16 + 3] {max_mux_size = 2 : i64, partition_indices = [-1, 3], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %14 = arith.mulf %0, %13 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %15 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 3] {partition_indices = [0, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %16 = arith.addf %14, %15 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %16, %arg7[%arg9 * 2, %arg10 * 16 + 3] {partition_indices = [0, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %17 = affine.load %arg6[%arg8, %arg10 * 16 + 4] {max_mux_size = 2 : i64, partition_indices = [-1, 4], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %18 = arith.mulf %0, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %19 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 4] {partition_indices = [0, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %20, %arg7[%arg9 * 2, %arg10 * 16 + 4] {partition_indices = [0, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %21 = affine.load %arg6[%arg8, %arg10 * 16 + 5] {max_mux_size = 2 : i64, partition_indices = [-1, 5], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %22 = arith.mulf %0, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %23 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 5] {partition_indices = [0, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %24 = arith.addf %22, %23 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %24, %arg7[%arg9 * 2, %arg10 * 16 + 5] {partition_indices = [0, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %25 = affine.load %arg6[%arg8, %arg10 * 16 + 6] {max_mux_size = 2 : i64, partition_indices = [-1, 6], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %26 = arith.mulf %0, %25 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %27 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 6] {partition_indices = [0, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %28 = arith.addf %26, %27 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %28, %arg7[%arg9 * 2, %arg10 * 16 + 6] {partition_indices = [0, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %29 = affine.load %arg6[%arg8, %arg10 * 16 + 7] {max_mux_size = 2 : i64, partition_indices = [-1, 7], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %30 = arith.mulf %0, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %31 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 7] {partition_indices = [0, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %32 = arith.addf %30, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %32, %arg7[%arg9 * 2, %arg10 * 16 + 7] {partition_indices = [0, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %33 = affine.load %arg6[%arg8, %arg10 * 16 + 8] {max_mux_size = 2 : i64, partition_indices = [-1, 8], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %34 = arith.mulf %0, %33 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %35 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 8] {partition_indices = [0, 8], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %36 = arith.addf %34, %35 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %36, %arg7[%arg9 * 2, %arg10 * 16 + 8] {partition_indices = [0, 8], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %37 = affine.load %arg6[%arg8, %arg10 * 16 + 9] {max_mux_size = 2 : i64, partition_indices = [-1, 9], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %38 = arith.mulf %0, %37 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %39 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 9] {partition_indices = [0, 9], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %40 = arith.addf %38, %39 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %40, %arg7[%arg9 * 2, %arg10 * 16 + 9] {partition_indices = [0, 9], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %41 = affine.load %arg6[%arg8, %arg10 * 16 + 10] {max_mux_size = 2 : i64, partition_indices = [-1, 10], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %42 = arith.mulf %0, %41 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %43 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 10] {partition_indices = [0, 10], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %44 = arith.addf %42, %43 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %44, %arg7[%arg9 * 2, %arg10 * 16 + 10] {partition_indices = [0, 10], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %45 = affine.load %arg6[%arg8, %arg10 * 16 + 11] {max_mux_size = 2 : i64, partition_indices = [-1, 11], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %46 = arith.mulf %0, %45 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %47 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 11] {partition_indices = [0, 11], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %48 = arith.addf %46, %47 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %48, %arg7[%arg9 * 2, %arg10 * 16 + 11] {partition_indices = [0, 11], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %49 = affine.load %arg6[%arg8, %arg10 * 16 + 12] {max_mux_size = 2 : i64, partition_indices = [-1, 12], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %50 = arith.mulf %0, %49 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %51 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 12] {partition_indices = [0, 12], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %52 = arith.addf %50, %51 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %52, %arg7[%arg9 * 2, %arg10 * 16 + 12] {partition_indices = [0, 12], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %53 = affine.load %arg6[%arg8, %arg10 * 16 + 13] {max_mux_size = 2 : i64, partition_indices = [-1, 13], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %54 = arith.mulf %0, %53 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %55 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 13] {partition_indices = [0, 13], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %56 = arith.addf %54, %55 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %56, %arg7[%arg9 * 2, %arg10 * 16 + 13] {partition_indices = [0, 13], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %57 = affine.load %arg6[%arg8, %arg10 * 16 + 14] {max_mux_size = 2 : i64, partition_indices = [-1, 14], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %58 = arith.mulf %0, %57 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %59 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 14] {partition_indices = [0, 14], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %60 = arith.addf %58, %59 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %60, %arg7[%arg9 * 2, %arg10 * 16 + 14] {partition_indices = [0, 14], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %61 = affine.load %arg6[%arg8, %arg10 * 16 + 15] {max_mux_size = 2 : i64, partition_indices = [-1, 15], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %62 = arith.mulf %0, %61 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %63 = affine.load %arg7[%arg9 * 2, %arg10 * 16 + 15] {partition_indices = [0, 15], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %64 = arith.addf %62, %63 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %64, %arg7[%arg9 * 2, %arg10 * 16 + 15] {partition_indices = [0, 15], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %65 = affine.load %arg5[%arg9 * 2 + 1, %arg8] {max_mux_size = 16 : i64, partition_indices = [1, -1], timing = #hls.t<10 -> 12, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %66 = arith.mulf %65, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %67 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16] {partition_indices = [1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %68 = arith.addf %66, %67 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %68, %arg7[%arg9 * 2 + 1, %arg10 * 16] {partition_indices = [1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %69 = arith.mulf %65, %5 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %70 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 1] {partition_indices = [1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %71 = arith.addf %69, %70 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %71, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 1] {partition_indices = [1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %72 = arith.mulf %65, %9 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %73 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 2] {partition_indices = [1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %74 = arith.addf %72, %73 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %74, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 2] {partition_indices = [1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %75 = arith.mulf %65, %13 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %76 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 3] {partition_indices = [1, 3], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %77 = arith.addf %75, %76 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %77, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 3] {partition_indices = [1, 3], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %78 = arith.mulf %65, %17 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %79 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 4] {partition_indices = [1, 4], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %80 = arith.addf %78, %79 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %80, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 4] {partition_indices = [1, 4], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %81 = arith.mulf %65, %21 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %82 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 5] {partition_indices = [1, 5], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %83 = arith.addf %81, %82 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %83, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 5] {partition_indices = [1, 5], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %84 = arith.mulf %65, %25 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %85 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 6] {partition_indices = [1, 6], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %86 = arith.addf %84, %85 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %86, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 6] {partition_indices = [1, 6], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %87 = arith.mulf %65, %29 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %88 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 7] {partition_indices = [1, 7], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %89 = arith.addf %87, %88 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %89, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 7] {partition_indices = [1, 7], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %90 = arith.mulf %65, %33 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %91 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 8] {partition_indices = [1, 8], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %92 = arith.addf %90, %91 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %92, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 8] {partition_indices = [1, 8], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %93 = arith.mulf %65, %37 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %94 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 9] {partition_indices = [1, 9], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %95 = arith.addf %93, %94 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %95, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 9] {partition_indices = [1, 9], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %96 = arith.mulf %65, %41 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %97 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 10] {partition_indices = [1, 10], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %98 = arith.addf %96, %97 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %98, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 10] {partition_indices = [1, 10], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %99 = arith.mulf %65, %45 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %100 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 11] {partition_indices = [1, 11], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %101 = arith.addf %99, %100 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %101, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 11] {partition_indices = [1, 11], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %102 = arith.mulf %65, %49 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %103 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 12] {partition_indices = [1, 12], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %104 = arith.addf %102, %103 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %104, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 12] {partition_indices = [1, 12], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %105 = arith.mulf %65, %53 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %106 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 13] {partition_indices = [1, 13], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %107 = arith.addf %105, %106 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %107, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 13] {partition_indices = [1, 13], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %108 = arith.mulf %65, %57 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %109 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 14] {partition_indices = [1, 14], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %110 = arith.addf %108, %109 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %110, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 14] {partition_indices = [1, 14], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %111 = arith.mulf %65, %61 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %112 = affine.load %arg7[%arg9 * 2 + 1, %arg10 * 16 + 15] {partition_indices = [1, 15], timing = #hls.t<6 -> 8, 2, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
          %113 = arith.addf %111, %112 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %113, %arg7[%arg9 * 2 + 1, %arg10 * 16 + 15] {partition_indices = [1, 15], timing = #hls.t<0 -> 1, 1, 1>} : memref<32x32xf32, affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=2, iterLatency=12, minII=1>, parallel, timing = #hls.t<0 -> 15, 15, 15>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=32, iterLatency=12, minII=1>, parallel, timing = #hls.t<0 -> 45, 45, 45>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=1024, iterLatency=12, minII=1>, resource = #hls.r<lut=0, dsp=160, bram=0>, timing = #hls.t<0 -> 1037, 1037, 1037>}
    return
  }
}