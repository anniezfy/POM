module {
  func @resnet18(%arg0: f32, %arg1: f32, %arg2: memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg3: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg5: memref<512x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg6: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg7: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg8: memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg9: memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg10: memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg11: memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg12: memref<128x64xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg13: memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg14: memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg15: memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg16: memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg17: memref<10x512xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg18: memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg19: memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg20: memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg21: memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg22: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg23: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg24: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg25: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg26: memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg27: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg28: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg29: memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg30: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg31: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg32: memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg33: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg34: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg35: memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg36: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg37: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg38: memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg39: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg40: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg41: memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg42: memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg43: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg44: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg45: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg46: memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg47: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg48: memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg49: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg50: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg51: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg52: memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg53: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg54: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg55: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg56: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg57: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg58: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg59: memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg60: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg61: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg62: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg63: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg64: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg65: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg66: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg67: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg68: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg69: memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg70: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg71: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg72: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg73: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg74: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg75: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg76: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg77: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg78: memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg79: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg80: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg81: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg82: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg83: memref<512xf32, affine_map<(d0) -> (0, d0)>>, %arg84: memref<512xf32, affine_map<(d0) -> (0, d0)>>) attributes {resource = #hls.r<lut=0, dsp=20, bram=0>, timing = #hls.t<0 -> 174250963, 174250963, 174250963>, top_func} {
    affine.for %arg85 = 0 to 3 {
      affine.for %arg86 = 0 to 34 {
        affine.for %arg87 = 0 to 34 {
          affine.store %arg0, %arg21[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 3 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg2[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg21[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          affine.store %arg0, %arg22[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 3 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 16 {
            affine.for %arg89 = 0 to 32 {
              affine.for %arg90 = 0 to 32 {
                %0 = affine.load %arg21[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg20[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg20[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg20[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg20[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg22[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg23[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg23[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg24[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 34 {
        affine.for %arg87 = 0 to 34 {
          affine.store %arg0, %arg26[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg24[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg26[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 16 {
            affine.for %arg89 = 0 to 32 {
              affine.for %arg90 = 0 to 32 {
                %0 = affine.load %arg26[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg19[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg19[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg19[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg19[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg22[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg27[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg27[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg28[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 34 {
        affine.for %arg87 = 0 to 34 {
          affine.store %arg0, %arg29[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg28[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg29[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 16 {
            affine.for %arg89 = 0 to 32 {
              affine.for %arg90 = 0 to 32 {
                %0 = affine.load %arg29[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg18[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg18[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg18[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg18[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg22[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg24[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg30[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg30[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg31[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 34 {
        affine.for %arg87 = 0 to 34 {
          affine.store %arg0, %arg32[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg31[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg32[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 16 {
            affine.for %arg89 = 0 to 32 {
              affine.for %arg90 = 0 to 32 {
                %0 = affine.load %arg32[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg16[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg16[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg16[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg16[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg22[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg33[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 34 {
        affine.for %arg87 = 0 to 34 {
          affine.store %arg0, %arg35[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg33[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg35[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 16 {
            affine.for %arg89 = 0 to 32 {
              affine.for %arg90 = 0 to 32 {
                %0 = affine.load %arg35[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg15[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg22[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg15[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg22[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg15[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg22[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg15[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg22[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg22[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg31[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg36[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg36[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg37[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 34 {
        affine.for %arg87 = 0 to 34 {
          affine.store %arg0, %arg38[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 32 {
        affine.for %arg87 = 0 to 32 {
          %0 = affine.load %arg37[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg38[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          affine.store %arg0, %arg39[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 32 {
            affine.for %arg89 = 0 to 16 {
              affine.for %arg90 = 0 to 16 {
                %0 = affine.load %arg38[%arg85, %arg89 * 2 + %arg86, %arg90 * 2 + %arg87] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg14[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg14[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg14[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg14[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg39[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg40[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 18 {
        affine.for %arg87 = 0 to 18 {
          affine.store %arg0, %arg41[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg40[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg41[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 32 {
            affine.for %arg89 = 0 to 16 {
              affine.for %arg90 = 0 to 16 {
                %0 = affine.load %arg41[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg13[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg13[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg13[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg13[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg39[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg43[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 64 {
      affine.for %arg86 = 0 to 128 {
        affine.for %arg87 = 0 to 16 {
          affine.for %arg88 = 0 to 16 {
            %0 = affine.load %arg37[%arg85, %arg87 * 2, %arg88 * 2] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg12[%arg86, %arg85] {partition_indices = [0, 0]} : memref<128x64xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg39[%arg86, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg39[%arg86, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          } {parallel}
        } {parallel}
      } {parallel}
    }
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg43[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %1 = affine.load %arg39[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg44[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg44[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg45[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 18 {
        affine.for %arg87 = 0 to 18 {
          affine.store %arg0, %arg46[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg45[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg46[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 32 {
            affine.for %arg89 = 0 to 16 {
              affine.for %arg90 = 0 to 16 {
                %0 = affine.load %arg46[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg11[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg11[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg11[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg11[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg39[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg47[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 18 {
        affine.for %arg87 = 0 to 18 {
          affine.store %arg0, %arg48[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg47[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg48[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 32 {
            affine.for %arg89 = 0 to 16 {
              affine.for %arg90 = 0 to 16 {
                %0 = affine.load %arg48[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg10[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg39[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg10[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg39[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg10[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg39[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg10[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg39[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg39[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg45[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg49[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg49[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg51[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 18 {
        affine.for %arg87 = 0 to 18 {
          affine.store %arg0, %arg52[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 16 {
        affine.for %arg87 = 0 to 16 {
          %0 = affine.load %arg51[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg52[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          affine.store %arg0, %arg53[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 64 {
            affine.for %arg89 = 0 to 8 {
              affine.for %arg90 = 0 to 8 {
                %0 = affine.load %arg52[%arg85, %arg89 * 2 + %arg86, %arg90 * 2 + %arg87] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg9[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg9[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg9[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg9[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg53[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg54[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 10 {
        affine.for %arg87 = 0 to 10 {
          affine.store %arg0, %arg55[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg54[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg55[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 64 {
            affine.for %arg89 = 0 to 8 {
              affine.for %arg90 = 0 to 8 {
                %0 = affine.load %arg55[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg8[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg8[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg8[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg8[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg53[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg56[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 128 {
      affine.for %arg86 = 0 to 128 {
        affine.for %arg87 = 0 to 8 {
          affine.for %arg88 = 0 to 8 {
            %0 = affine.load %arg51[%arg85, %arg87 * 2, %arg88 * 2] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg4[%arg86 * 2, %arg85] {partition_indices = [0, 0]} : memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg53[%arg86 * 2, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg53[%arg86 * 2, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
            %5 = affine.load %arg4[%arg86 * 2 + 1, %arg85] {partition_indices = [1, 0]} : memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg53[%arg86 * 2 + 1, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg53[%arg86 * 2 + 1, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg53[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg57[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg56[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %1 = affine.load %arg57[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg58[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg58[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg60[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 10 {
        affine.for %arg87 = 0 to 10 {
          affine.store %arg0, %arg61[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg60[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg61[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 64 {
            affine.for %arg89 = 0 to 8 {
              affine.for %arg90 = 0 to 8 {
                %0 = affine.load %arg61[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg78[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg78[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg78[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg78[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg53[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg62[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg62[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg63[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 10 {
        affine.for %arg87 = 0 to 10 {
          affine.store %arg0, %arg64[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg63[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg64[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 64 {
            affine.for %arg89 = 0 to 8 {
              affine.for %arg90 = 0 to 8 {
                %0 = affine.load %arg64[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg69[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg53[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg69[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg53[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg69[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg53[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg69[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg53[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg53[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg65[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg65[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %1 = affine.load %arg60[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg66[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg66[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg67[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 10 {
        affine.for %arg87 = 0 to 10 {
          affine.store %arg0, %arg68[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 8 {
        affine.for %arg87 = 0 to 8 {
          %0 = affine.load %arg67[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg68[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          affine.store %arg0, %arg70[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 128 {
            affine.for %arg89 = 0 to 4 {
              affine.for %arg90 = 0 to 4 {
                %0 = affine.load %arg68[%arg85, %arg89 * 2 + %arg86, %arg90 * 2 + %arg87] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg59[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg59[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg59[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg59[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg70[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg71[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg71[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg72[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 6 {
        affine.for %arg87 = 0 to 6 {
          affine.store %arg0, %arg73[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg72[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg73[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 128 {
            affine.for %arg89 = 0 to 4 {
              affine.for %arg90 = 0 to 4 {
                %0 = affine.load %arg73[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg50[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg50[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg50[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg50[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg70[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg74[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 256 {
      affine.for %arg86 = 0 to 256 {
        affine.for %arg87 = 0 to 4 {
          affine.for %arg88 = 0 to 4 {
            %0 = affine.load %arg67[%arg85, %arg87 * 2, %arg88 * 2] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg42[%arg86 * 2, %arg85] {partition_indices = [0, 0]} : memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg70[%arg86 * 2, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg70[%arg86 * 2, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
            %5 = affine.load %arg42[%arg86 * 2 + 1, %arg85] {partition_indices = [1, 0]} : memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg70[%arg86 * 2 + 1, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg70[%arg86 * 2 + 1, %arg87, %arg88] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg74[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %1 = affine.load %arg70[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg75[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg75[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg76[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 6 {
        affine.for %arg87 = 0 to 6 {
          affine.store %arg0, %arg77[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg76[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg77[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 128 {
            affine.for %arg89 = 0 to 4 {
              affine.for %arg90 = 0 to 4 {
                %0 = affine.load %arg77[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg34[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg34[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg34[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg34[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg70[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg79[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 6 {
        affine.for %arg87 = 0 to 6 {
          affine.store %arg0, %arg80[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg79[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg80[%arg85, %arg86 + 1, %arg87 + 1] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 3 {
        affine.for %arg87 = 0 to 3 {
          affine.for %arg88 = 0 to 128 {
            affine.for %arg89 = 0 to 4 {
              affine.for %arg90 = 0 to 4 {
                %0 = affine.load %arg80[%arg85, %arg89 + %arg86, %arg90 + %arg87] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg25[%arg88 * 4, %arg85, %arg86, %arg87] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg70[%arg88 * 4, %arg89, %arg90] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg25[%arg88 * 4 + 1, %arg85, %arg86, %arg87] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg70[%arg88 * 4 + 1, %arg89, %arg90] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg25[%arg88 * 4 + 2, %arg85, %arg86, %arg87] {partition_indices = [2, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg70[%arg88 * 4 + 2, %arg89, %arg90] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg25[%arg88 * 4 + 3, %arg85, %arg86, %arg87] {partition_indices = [3, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg70[%arg88 * 4 + 3, %arg89, %arg90] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg70[%arg85, %arg86, %arg87] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg76[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg81[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 4 {
          %0 = affine.load %arg81[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg82[%arg85, %arg86, %arg87] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.store %arg0, %arg83[%arg85] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg85 = 0 to 4 {
      affine.for %arg86 = 0 to 4 {
        affine.for %arg87 = 0 to 512 {
          %0 = affine.load %arg83[%arg87] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
          %1 = affine.load %arg81[%arg87, %arg85, %arg86] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg83[%arg87] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
        } {parallel}
      }
    }
    affine.for %arg85 = 0 to 512 {
      %0 = affine.load %arg83[%arg85] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
      %1 = arith.mulf %0, %arg1 : f32
      affine.store %1, %arg84[%arg85] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg85 = 0 to 10 {
      affine.for %arg86 = 0 to 512 {
        %0 = affine.load %arg17[%arg85, %arg86] {partition_indices = [0, 0]} : memref<10x512xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        affine.store %0, %arg5[%arg86, %arg85] {partition_indices = [0, 0]} : memref<512x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
      } {parallel}
    } {parallel}
    affine.for %arg85 = 0 to 10 {
      affine.store %arg0, %arg6[%arg85] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg85 = 0 to 512 {
      affine.for %arg86 = 0 to 10 {
        %0 = affine.load %arg84[%arg85] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
        %1 = affine.load %arg5[%arg85, %arg86] {partition_indices = [0, 0]} : memref<512x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg6[%arg86] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg6[%arg86] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      } {parallel}
    }
    affine.for %arg85 = 0 to 10 {
      %0 = affine.load %arg6[%arg85] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      %1 = affine.load %arg3[%arg85] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      %2 = arith.addf %0, %1 {timing = #hls.t<1 -> 6, 5, 1>} : f32
      affine.store %2, %arg7[%arg85] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {loop_info = #hls.l<flattenTripCount=10, iterLatency=8, minII=8>, parallel, resource = #hls.r<lut=0, dsp=2, bram=0>, timing = #hls.t<0 -> 82, 82, 82>}
    return
  }
}