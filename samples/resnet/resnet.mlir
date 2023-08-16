module {
  func @resnet(%arg0: f32, %arg1: memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg2: memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg3: memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg4: memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg5: memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg6: memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg7: memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg8: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg9: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg10: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg11: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg12: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg13: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg14: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg15: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg16: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg17: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg18: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg19: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg20: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg21: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg22: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg23: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg24: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg25: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg26: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg27: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg28: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg29: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg30: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg31: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg32: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg33: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg34: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg35: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg36: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>, %arg37: memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg38: memref<128x64xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg39: memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg40: memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>) attributes {resource = #hls.r<lut=0, dsp=20, bram=0>, timing = #hls.t<0 -> 169209295, 169209295, 169209295>, top_func} {
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          affine.store %arg0, %arg9[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 3 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 16 {
            affine.for %arg45 = 0 to 32 {
              affine.for %arg46 = 0 to 32 {
                %0 = affine.load %arg37[%arg41, %arg45 + %arg42, %arg46 + %arg43] {partition_indices = [0, 0, 0]} : memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg1[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg9[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg9[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg1[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg9[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg9[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg1[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg9[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg9[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg1[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg9[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg9[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          %0 = affine.load %arg9[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg9[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          affine.store %arg0, %arg20[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 16 {
            affine.for %arg45 = 0 to 32 {
              affine.for %arg46 = 0 to 32 {
                %0 = affine.load %arg9[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg2[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg20[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg20[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg2[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg20[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg20[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg2[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg20[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg20[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg2[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg20[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg20[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          %0 = affine.load %arg20[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg20[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          affine.store %arg0, %arg30[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 16 {
            affine.for %arg45 = 0 to 32 {
              affine.for %arg46 = 0 to 32 {
                %0 = affine.load %arg20[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg2[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg30[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg30[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg2[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg30[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg30[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg2[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg30[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg30[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg2[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg30[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg30[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          %0 = affine.load %arg30[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg9[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg31[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          %0 = affine.load %arg31[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg31[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          affine.store %arg0, %arg32[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 16 {
            affine.for %arg45 = 0 to 32 {
              affine.for %arg46 = 0 to 32 {
                %0 = affine.load %arg31[%arg41, %arg45 + %arg42, %arg46 + %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg2[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg32[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg32[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg2[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg32[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg32[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg2[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg32[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg32[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg2[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg32[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg32[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          %0 = affine.load %arg32[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg32[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          affine.store %arg0, %arg33[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 16 {
            affine.for %arg45 = 0 to 32 {
              affine.for %arg46 = 0 to 32 {
                %0 = affine.load %arg32[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg2[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg33[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg33[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg2[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg33[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg33[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg2[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg33[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg33[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg2[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg33[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg33[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          %0 = affine.load %arg33[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg31[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg34[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 32 {
        affine.for %arg43 = 0 to 32 {
          %0 = affine.load %arg34[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg34[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          affine.store %arg0, %arg35[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 32 {
            affine.for %arg45 = 0 to 16 {
              affine.for %arg46 = 0 to 16 {
                %0 = affine.load %arg34[%arg41, %arg45 * 2 + %arg42, %arg46 * 2 + %arg43] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg3[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg35[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg35[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg3[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg35[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg35[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg3[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg35[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg35[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg3[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg35[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg35[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          %0 = affine.load %arg35[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg35[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          affine.store %arg0, %arg36[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 32 {
            affine.for %arg45 = 0 to 16 {
              affine.for %arg46 = 0 to 16 {
                %0 = affine.load %arg35[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg4[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg36[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg36[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg4[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg36[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg36[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg4[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg36[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg36[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg4[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg36[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg36[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 64 {
      affine.for %arg42 = 0 to 128 {
        affine.for %arg43 = 0 to 16 {
          affine.for %arg44 = 0 to 16 {
            %0 = affine.load %arg34[%arg41, %arg43 * 2, %arg44 * 2] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg38[%arg42, %arg41] {partition_indices = [0, 0]} : memref<128x64xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg10[%arg42, %arg43, %arg44] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %4 = arith.addf %3, %2 : f32
            affine.store %4, %arg10[%arg42, %arg43, %arg44] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          } {parallel}
        } {parallel}
      } {parallel}
    }
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          %0 = affine.load %arg10[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %1 = affine.load %arg36[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg11[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          %0 = affine.load %arg11[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg11[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          affine.store %arg0, %arg12[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 32 {
            affine.for %arg45 = 0 to 16 {
              affine.for %arg46 = 0 to 16 {
                %0 = affine.load %arg11[%arg41, %arg45 + %arg42, %arg46 + %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg4[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg12[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg12[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg4[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg12[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg12[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg4[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg12[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg12[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg4[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg12[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg12[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          %0 = affine.load %arg12[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg12[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          affine.store %arg0, %arg13[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 32 {
            affine.for %arg45 = 0 to 16 {
              affine.for %arg46 = 0 to 16 {
                %0 = affine.load %arg12[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg4[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg13[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg13[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg4[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg13[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg13[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg4[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg13[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg13[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg4[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg13[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg13[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          %0 = affine.load %arg13[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg11[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg14[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 16 {
        affine.for %arg43 = 0 to 16 {
          %0 = affine.load %arg14[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg14[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          affine.store %arg0, %arg15[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 64 {
            affine.for %arg45 = 0 to 8 {
              affine.for %arg46 = 0 to 8 {
                %0 = affine.load %arg14[%arg41, %arg45 * 2 + %arg42, %arg46 * 2 + %arg43] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg5[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg15[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg15[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg5[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg15[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg15[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg5[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg15[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg15[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg5[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg15[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg15[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          %0 = affine.load %arg15[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg15[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          affine.store %arg0, %arg16[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 64 {
            affine.for %arg45 = 0 to 8 {
              affine.for %arg46 = 0 to 8 {
                %0 = affine.load %arg15[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg6[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg16[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg16[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg6[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg16[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg16[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg6[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg16[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg16[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg6[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg16[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg16[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 128 {
      affine.for %arg42 = 0 to 128 {
        affine.for %arg43 = 0 to 8 {
          affine.for %arg44 = 0 to 8 {
            %0 = affine.load %arg14[%arg41, %arg43 * 2, %arg44 * 2] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg39[%arg42 * 2, %arg41] {partition_indices = [0, 0]} : memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg17[%arg42 * 2, %arg43, %arg44] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
            %4 = arith.addf %3, %2 : f32
            affine.store %4, %arg17[%arg42 * 2, %arg43, %arg44] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
            %5 = affine.load %arg39[%arg42 * 2 + 1, %arg41] {partition_indices = [1, 0]} : memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg17[%arg42 * 2 + 1, %arg43, %arg44] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
            %8 = arith.addf %7, %6 : f32
            affine.store %8, %arg17[%arg42 * 2 + 1, %arg43, %arg44] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          %0 = affine.load %arg17[%arg41, %arg42, %arg43] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          %1 = affine.load %arg16[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg18[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          %0 = affine.load %arg18[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg18[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          affine.store %arg0, %arg19[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 64 {
            affine.for %arg45 = 0 to 8 {
              affine.for %arg46 = 0 to 8 {
                %0 = affine.load %arg18[%arg41, %arg45 + %arg42, %arg46 + %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg6[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg19[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg19[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg6[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg19[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg19[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg6[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg19[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg19[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg6[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg19[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg19[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          %0 = affine.load %arg19[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg19[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          affine.store %arg0, %arg21[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 64 {
            affine.for %arg45 = 0 to 8 {
              affine.for %arg46 = 0 to 8 {
                %0 = affine.load %arg19[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg6[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg21[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg21[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg6[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg21[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg21[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg6[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg21[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg21[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg6[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg21[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg21[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          %0 = affine.load %arg21[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg18[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg22[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 8 {
        affine.for %arg43 = 0 to 8 {
          %0 = affine.load %arg22[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg22[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          affine.store %arg0, %arg23[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 128 {
            affine.for %arg45 = 0 to 4 {
              affine.for %arg46 = 0 to 4 {
                %0 = affine.load %arg22[%arg41, %arg45 * 2 + %arg42, %arg46 * 2 + %arg43] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg7[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg23[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg23[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg7[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg23[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg23[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg7[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg23[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg23[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg7[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg23[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg23[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          %0 = affine.load %arg23[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg23[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          affine.store %arg0, %arg24[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 128 {
            affine.for %arg45 = 0 to 4 {
              affine.for %arg46 = 0 to 4 {
                %0 = affine.load %arg23[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg8[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg24[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg24[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg8[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg24[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg24[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg8[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg24[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg24[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg8[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg24[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg24[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 256 {
      affine.for %arg42 = 0 to 256 {
        affine.for %arg43 = 0 to 4 {
          affine.for %arg44 = 0 to 4 {
            %0 = affine.load %arg22[%arg41, %arg43 * 2, %arg44 * 2] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg40[%arg42 * 2, %arg41] {partition_indices = [0, 0]} : memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg25[%arg42 * 2, %arg43, %arg44] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
            %4 = arith.addf %3, %2 : f32
            affine.store %4, %arg25[%arg42 * 2, %arg43, %arg44] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
            %5 = affine.load %arg40[%arg42 * 2 + 1, %arg41] {partition_indices = [1, 0]} : memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg25[%arg42 * 2 + 1, %arg43, %arg44] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
            %8 = arith.addf %7, %6 : f32
            affine.store %8, %arg25[%arg42 * 2 + 1, %arg43, %arg44] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          %0 = affine.load %arg25[%arg41, %arg42, %arg43] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          %1 = affine.load %arg24[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg26[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          %0 = affine.load %arg26[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg26[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          affine.store %arg0, %arg27[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 128 {
            affine.for %arg45 = 0 to 4 {
              affine.for %arg46 = 0 to 4 {
                %0 = affine.load %arg26[%arg41, %arg45 + %arg42, %arg46 + %arg43] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg8[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg27[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg27[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg8[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg27[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg27[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg8[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg27[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg27[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg8[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg27[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg27[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          %0 = affine.load %arg27[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %0, %arg27[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          affine.store %arg0, %arg28[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 3 {
        affine.for %arg43 = 0 to 3 {
          affine.for %arg44 = 0 to 128 {
            affine.for %arg45 = 0 to 4 {
              affine.for %arg46 = 0 to 4 {
                %0 = affine.load %arg27[%arg41, %arg45 + %arg42, %arg46 + %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %1 = affine.load %arg8[%arg44 * 4, %arg41, %arg42, %arg43] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg28[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg28[%arg44 * 4, %arg45, %arg46] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %5 = affine.load %arg8[%arg44 * 4 + 1, %arg41, %arg42, %arg43] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg28[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg28[%arg44 * 4 + 1, %arg45, %arg46] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg8[%arg44 * 4 + 2, %arg41, %arg42, %arg43] {partition_indices = [2, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %0, %9 : f32
                %11 = affine.load %arg28[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg28[%arg44 * 4 + 2, %arg45, %arg46] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg8[%arg44 * 4 + 3, %arg41, %arg42, %arg43] {partition_indices = [3, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %0, %13 : f32
                %15 = affine.load %arg28[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg28[%arg44 * 4 + 3, %arg45, %arg46] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          %0 = affine.load %arg28[%arg41, %arg42, %arg43] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          %1 = affine.load %arg26[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg29[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg41 = 0 to 512 {
      affine.for %arg42 = 0 to 4 {
        affine.for %arg43 = 0 to 4 {
          %0 = affine.load %arg29[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg29[%arg41, %arg42, %arg43] {partition_indices = [0, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {loop_info = #hls.l<flattenTripCount=4, iterLatency=3, minII=3>, parallel, timing = #hls.t<0 -> 14, 14, 14>}
      } {loop_info = #hls.l<flattenTripCount=4, iterLatency=14, minII=14>, parallel, timing = #hls.t<0 -> 58, 58, 58>}
    } {loop_info = #hls.l<flattenTripCount=512, iterLatency=58, minII=58>, parallel, resource = #hls.r<lut=0, dsp=0, bram=0>, timing = #hls.t<0 -> 29698, 29698, 29698>}
    return
  }
}