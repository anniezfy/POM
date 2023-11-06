module {
  func @gesummv_512(%arg0: f32, %arg1: f32, %arg2: memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>, %arg3: memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>, %arg4: memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>, %arg5: memref<512xf32, affine_map<(d0) -> (0, d0)>>, %arg6: memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>) attributes {resource = #hls.r<lut=0, dsp=160, bram=0>, timing = #hls.t<0 -> 16928, 16928, 16928>, top_func} {
    affine.for %arg7 = 0 to 512 {
      affine.for %arg8 = 0 to 32 {
        %0 = affine.load %arg2[%arg8 * 16, %arg7] {partition_indices = [0, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %1 = affine.load %arg5[%arg7] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg4[%arg8 * 16] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg4[%arg8 * 16] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %5 = affine.load %arg3[%arg8 * 16, %arg7] {partition_indices = [0, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %6 = arith.mulf %5, %1 : f32
        %7 = affine.load %arg6[%arg8 * 16] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %8 = arith.addf %6, %7 : f32
        affine.store %8, %arg6[%arg8 * 16] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %9 = affine.load %arg2[%arg8 * 16 + 1, %arg7] {partition_indices = [1, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %10 = arith.mulf %9, %1 : f32
        %11 = affine.load %arg4[%arg8 * 16 + 1] {partition_indices = [1]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %12 = arith.addf %10, %11 : f32
        affine.store %12, %arg4[%arg8 * 16 + 1] {partition_indices = [1]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %13 = affine.load %arg3[%arg8 * 16 + 1, %arg7] {partition_indices = [1, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %14 = arith.mulf %13, %1 : f32
        %15 = affine.load %arg6[%arg8 * 16 + 1] {partition_indices = [1]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %16 = arith.addf %14, %15 : f32
        affine.store %16, %arg6[%arg8 * 16 + 1] {partition_indices = [1]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %17 = affine.load %arg2[%arg8 * 16 + 2, %arg7] {partition_indices = [2, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %18 = arith.mulf %17, %1 : f32
        %19 = affine.load %arg4[%arg8 * 16 + 2] {partition_indices = [2]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %20 = arith.addf %18, %19 : f32
        affine.store %20, %arg4[%arg8 * 16 + 2] {partition_indices = [2]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %21 = affine.load %arg3[%arg8 * 16 + 2, %arg7] {partition_indices = [2, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %22 = arith.mulf %21, %1 : f32
        %23 = affine.load %arg6[%arg8 * 16 + 2] {partition_indices = [2]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %24 = arith.addf %22, %23 : f32
        affine.store %24, %arg6[%arg8 * 16 + 2] {partition_indices = [2]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %25 = affine.load %arg2[%arg8 * 16 + 3, %arg7] {partition_indices = [3, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %26 = arith.mulf %25, %1 : f32
        %27 = affine.load %arg4[%arg8 * 16 + 3] {partition_indices = [3]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %28 = arith.addf %26, %27 : f32
        affine.store %28, %arg4[%arg8 * 16 + 3] {partition_indices = [3]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %29 = affine.load %arg3[%arg8 * 16 + 3, %arg7] {partition_indices = [3, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %30 = arith.mulf %29, %1 : f32
        %31 = affine.load %arg6[%arg8 * 16 + 3] {partition_indices = [3]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %32 = arith.addf %30, %31 : f32
        affine.store %32, %arg6[%arg8 * 16 + 3] {partition_indices = [3]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %33 = affine.load %arg2[%arg8 * 16 + 4, %arg7] {partition_indices = [4, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %34 = arith.mulf %33, %1 : f32
        %35 = affine.load %arg4[%arg8 * 16 + 4] {partition_indices = [4]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %36 = arith.addf %34, %35 : f32
        affine.store %36, %arg4[%arg8 * 16 + 4] {partition_indices = [4]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %37 = affine.load %arg3[%arg8 * 16 + 4, %arg7] {partition_indices = [4, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %38 = arith.mulf %37, %1 : f32
        %39 = affine.load %arg6[%arg8 * 16 + 4] {partition_indices = [4]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %40 = arith.addf %38, %39 : f32
        affine.store %40, %arg6[%arg8 * 16 + 4] {partition_indices = [4]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %41 = affine.load %arg2[%arg8 * 16 + 5, %arg7] {partition_indices = [5, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %42 = arith.mulf %41, %1 : f32
        %43 = affine.load %arg4[%arg8 * 16 + 5] {partition_indices = [5]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %44 = arith.addf %42, %43 : f32
        affine.store %44, %arg4[%arg8 * 16 + 5] {partition_indices = [5]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %45 = affine.load %arg3[%arg8 * 16 + 5, %arg7] {partition_indices = [5, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %46 = arith.mulf %45, %1 : f32
        %47 = affine.load %arg6[%arg8 * 16 + 5] {partition_indices = [5]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %48 = arith.addf %46, %47 : f32
        affine.store %48, %arg6[%arg8 * 16 + 5] {partition_indices = [5]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %49 = affine.load %arg2[%arg8 * 16 + 6, %arg7] {partition_indices = [6, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %50 = arith.mulf %49, %1 : f32
        %51 = affine.load %arg4[%arg8 * 16 + 6] {partition_indices = [6]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %52 = arith.addf %50, %51 : f32
        affine.store %52, %arg4[%arg8 * 16 + 6] {partition_indices = [6]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %53 = affine.load %arg3[%arg8 * 16 + 6, %arg7] {partition_indices = [6, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %54 = arith.mulf %53, %1 : f32
        %55 = affine.load %arg6[%arg8 * 16 + 6] {partition_indices = [6]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %56 = arith.addf %54, %55 : f32
        affine.store %56, %arg6[%arg8 * 16 + 6] {partition_indices = [6]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %57 = affine.load %arg2[%arg8 * 16 + 7, %arg7] {partition_indices = [7, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %58 = arith.mulf %57, %1 : f32
        %59 = affine.load %arg4[%arg8 * 16 + 7] {partition_indices = [7]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %60 = arith.addf %58, %59 : f32
        affine.store %60, %arg4[%arg8 * 16 + 7] {partition_indices = [7]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %61 = affine.load %arg3[%arg8 * 16 + 7, %arg7] {partition_indices = [7, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %62 = arith.mulf %61, %1 : f32
        %63 = affine.load %arg6[%arg8 * 16 + 7] {partition_indices = [7]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %64 = arith.addf %62, %63 : f32
        affine.store %64, %arg6[%arg8 * 16 + 7] {partition_indices = [7]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %65 = affine.load %arg2[%arg8 * 16 + 8, %arg7] {partition_indices = [8, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %66 = arith.mulf %65, %1 : f32
        %67 = affine.load %arg4[%arg8 * 16 + 8] {partition_indices = [8]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %68 = arith.addf %66, %67 : f32
        affine.store %68, %arg4[%arg8 * 16 + 8] {partition_indices = [8]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %69 = affine.load %arg3[%arg8 * 16 + 8, %arg7] {partition_indices = [8, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %70 = arith.mulf %69, %1 : f32
        %71 = affine.load %arg6[%arg8 * 16 + 8] {partition_indices = [8]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %72 = arith.addf %70, %71 : f32
        affine.store %72, %arg6[%arg8 * 16 + 8] {partition_indices = [8]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %73 = affine.load %arg2[%arg8 * 16 + 9, %arg7] {partition_indices = [9, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %74 = arith.mulf %73, %1 : f32
        %75 = affine.load %arg4[%arg8 * 16 + 9] {partition_indices = [9]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %76 = arith.addf %74, %75 : f32
        affine.store %76, %arg4[%arg8 * 16 + 9] {partition_indices = [9]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %77 = affine.load %arg3[%arg8 * 16 + 9, %arg7] {partition_indices = [9, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %78 = arith.mulf %77, %1 : f32
        %79 = affine.load %arg6[%arg8 * 16 + 9] {partition_indices = [9]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %80 = arith.addf %78, %79 : f32
        affine.store %80, %arg6[%arg8 * 16 + 9] {partition_indices = [9]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %81 = affine.load %arg2[%arg8 * 16 + 10, %arg7] {partition_indices = [10, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %82 = arith.mulf %81, %1 : f32
        %83 = affine.load %arg4[%arg8 * 16 + 10] {partition_indices = [10]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %84 = arith.addf %82, %83 : f32
        affine.store %84, %arg4[%arg8 * 16 + 10] {partition_indices = [10]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %85 = affine.load %arg3[%arg8 * 16 + 10, %arg7] {partition_indices = [10, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %86 = arith.mulf %85, %1 : f32
        %87 = affine.load %arg6[%arg8 * 16 + 10] {partition_indices = [10]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %88 = arith.addf %86, %87 : f32
        affine.store %88, %arg6[%arg8 * 16 + 10] {partition_indices = [10]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %89 = affine.load %arg2[%arg8 * 16 + 11, %arg7] {partition_indices = [11, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %90 = arith.mulf %89, %1 : f32
        %91 = affine.load %arg4[%arg8 * 16 + 11] {partition_indices = [11]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %92 = arith.addf %90, %91 : f32
        affine.store %92, %arg4[%arg8 * 16 + 11] {partition_indices = [11]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %93 = affine.load %arg3[%arg8 * 16 + 11, %arg7] {partition_indices = [11, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %94 = arith.mulf %93, %1 : f32
        %95 = affine.load %arg6[%arg8 * 16 + 11] {partition_indices = [11]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %96 = arith.addf %94, %95 : f32
        affine.store %96, %arg6[%arg8 * 16 + 11] {partition_indices = [11]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %97 = affine.load %arg2[%arg8 * 16 + 12, %arg7] {partition_indices = [12, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %98 = arith.mulf %97, %1 : f32
        %99 = affine.load %arg4[%arg8 * 16 + 12] {partition_indices = [12]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %100 = arith.addf %98, %99 : f32
        affine.store %100, %arg4[%arg8 * 16 + 12] {partition_indices = [12]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %101 = affine.load %arg3[%arg8 * 16 + 12, %arg7] {partition_indices = [12, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %102 = arith.mulf %101, %1 : f32
        %103 = affine.load %arg6[%arg8 * 16 + 12] {partition_indices = [12]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %104 = arith.addf %102, %103 : f32
        affine.store %104, %arg6[%arg8 * 16 + 12] {partition_indices = [12]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %105 = affine.load %arg2[%arg8 * 16 + 13, %arg7] {partition_indices = [13, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %106 = arith.mulf %105, %1 : f32
        %107 = affine.load %arg4[%arg8 * 16 + 13] {partition_indices = [13]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %108 = arith.addf %106, %107 : f32
        affine.store %108, %arg4[%arg8 * 16 + 13] {partition_indices = [13]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %109 = affine.load %arg3[%arg8 * 16 + 13, %arg7] {partition_indices = [13, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %110 = arith.mulf %109, %1 : f32
        %111 = affine.load %arg6[%arg8 * 16 + 13] {partition_indices = [13]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %112 = arith.addf %110, %111 : f32
        affine.store %112, %arg6[%arg8 * 16 + 13] {partition_indices = [13]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %113 = affine.load %arg2[%arg8 * 16 + 14, %arg7] {partition_indices = [14, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %114 = arith.mulf %113, %1 : f32
        %115 = affine.load %arg4[%arg8 * 16 + 14] {partition_indices = [14]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %116 = arith.addf %114, %115 : f32
        affine.store %116, %arg4[%arg8 * 16 + 14] {partition_indices = [14]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %117 = affine.load %arg3[%arg8 * 16 + 14, %arg7] {partition_indices = [14, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %118 = arith.mulf %117, %1 : f32
        %119 = affine.load %arg6[%arg8 * 16 + 14] {partition_indices = [14]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %120 = arith.addf %118, %119 : f32
        affine.store %120, %arg6[%arg8 * 16 + 14] {partition_indices = [14]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %121 = affine.load %arg2[%arg8 * 16 + 15, %arg7] {partition_indices = [15, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %122 = arith.mulf %121, %1 : f32
        %123 = affine.load %arg4[%arg8 * 16 + 15] {partition_indices = [15]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %124 = arith.addf %122, %123 : f32
        affine.store %124, %arg4[%arg8 * 16 + 15] {partition_indices = [15]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %125 = affine.load %arg3[%arg8 * 16 + 15, %arg7] {partition_indices = [15, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 16, 0, d0 floordiv 16, d1)>>
        %126 = arith.mulf %125, %1 : f32
        %127 = affine.load %arg6[%arg8 * 16 + 15] {partition_indices = [15]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
        %128 = arith.addf %126, %127 : f32
        affine.store %128, %arg6[%arg8 * 16 + 15] {partition_indices = [15]} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg7 = 0 to 512 {
      %0 = affine.load %arg4[%arg7] {max_mux_size = 16 : i64, partition_indices = [-1], timing = #hls.t<14 -> 16, 2, 1>} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      %1 = arith.mulf %arg0, %0 {timing = #hls.t<10 -> 14, 4, 1>} : f32
      %2 = arith.addf %arg1, %1 {timing = #hls.t<5 -> 10, 5, 1>} : f32
      %3 = affine.load %arg6[%arg7] {max_mux_size = 16 : i64, partition_indices = [-1], timing = #hls.t<5 -> 7, 2, 1>} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
      %4 = arith.mulf %2, %3 {timing = #hls.t<1 -> 5, 4, 1>} : f32
      affine.store %4, %arg6[%arg7] {max_mux_size = 16 : i64, partition_indices = [-1], timing = #hls.t<0 -> 1, 1, 1>} : memref<512xf32, affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>>
    } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=512, iterLatency=16, minII=1>, parallel, resource = #hls.r<lut=0, dsp=8, bram=0>, timing = #hls.t<0 -> 529, 529, 529>}
    return
  }
}