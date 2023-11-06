module {
  func @pyvgg(%arg0: f32, %arg1: memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg2: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg3: memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg4: memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg5: memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg6: memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg7: memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg8: memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg9: memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg10: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg11: memref<10x512xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg12: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg13: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg14: memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg15: memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg16: memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg17: memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg18: memref<64x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg19: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg20: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>, %arg21: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg22: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg23: memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg24: memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg25: memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg26: memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg27: memref<128x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg28: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg29: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg30: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg31: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg32: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg33: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg34: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg35: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg36: memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg37: memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg38: memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg39: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg40: memref<256x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg41: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg42: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg43: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg44: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg45: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg46: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg47: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg48: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg49: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>, %arg50: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg51: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg52: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg53: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg54: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg55: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg56: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg57: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg58: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg59: memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg60: memref<512xf32, affine_map<(d0) -> (0, d0)>>, %arg61: memref<512xf32, affine_map<(d0) -> (0, d0)>>, %arg62: memref<512xf32, affine_map<(d0) -> (0, d0)>>, %arg63: memref<512xf32, affine_map<(d0) -> (0, d0)>>, %arg64: memref<512xf32, affine_map<(d0) -> (0, d0)>>, %arg65: memref<512x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg66: memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>, %arg67: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg68: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg69: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg70: memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>) attributes {resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 125968858, 125968858, 125968858>, top_func} {
    affine.for %arg71 = 0 to 3 {
      affine.for %arg72 = 0 to 34 {
        affine.for %arg73 = 0 to 34 {
          affine.store %arg0, %arg9[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 3 {
      affine.for %arg72 = 0 to 32 {
        affine.for %arg73 = 0 to 32 {
          %0 = affine.load %arg1[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg9[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 32 {
        affine.for %arg73 = 0 to 32 {
          affine.store %arg0, %arg10[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 3 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 32 {
            affine.for %arg75 = 0 to 32 {
              affine.for %arg76 = 0 to 32 {
                %0 = affine.load %arg9[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg8[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg10[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg10[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg8[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg10[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg10[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 32 {
        affine.for %arg73 = 0 to 32 {
          %0 = affine.load %arg10[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg12[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 32 {
        affine.for %arg73 = 0 to 32 {
          %0 = affine.load %arg12[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg13[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 34 {
        affine.for %arg73 = 0 to 34 {
          affine.store %arg0, %arg14[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 32 {
        affine.for %arg73 = 0 to 32 {
          %0 = affine.load %arg13[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg14[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          affine.store %arg0, %arg15[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 32 {
            affine.for %arg75 = 0 to 16 {
              affine.for %arg76 = 0 to 16 {
                %0 = affine.load %arg14[%arg71, %arg75 * 2 + %arg72, %arg76 * 2 + %arg73] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg7[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg15[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg15[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg7[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<64x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg15[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg15[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          %0 = affine.load %arg15[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg16[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          %0 = affine.load %arg16[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg17[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 18 {
        affine.for %arg73 = 0 to 18 {
          affine.store %arg0, %arg18[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          %0 = affine.load %arg17[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg18[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<64x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          affine.store %arg0, %arg19[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 64 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 64 {
            affine.for %arg75 = 0 to 16 {
              affine.for %arg76 = 0 to 16 {
                %0 = affine.load %arg18[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<64x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg6[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg19[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg19[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg6[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<128x64x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg19[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg19[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          %0 = affine.load %arg19[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg21[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          %0 = affine.load %arg21[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg22[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 18 {
        affine.for %arg73 = 0 to 18 {
          affine.store %arg0, %arg23[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 16 {
        affine.for %arg73 = 0 to 16 {
          %0 = affine.load %arg22[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg23[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          affine.store %arg0, %arg24[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 64 {
            affine.for %arg75 = 0 to 8 {
              affine.for %arg76 = 0 to 8 {
                %0 = affine.load %arg23[%arg71, %arg75 * 2 + %arg72, %arg76 * 2 + %arg73] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg5[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg24[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg24[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg5[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<128x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg24[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg24[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg24[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg25[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg25[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg26[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 10 {
        affine.for %arg73 = 0 to 10 {
          affine.store %arg0, %arg27[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg26[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg27[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<128x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          affine.store %arg0, %arg28[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 128 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 128 {
            affine.for %arg75 = 0 to 8 {
              affine.for %arg76 = 0 to 8 {
                %0 = affine.load %arg27[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<128x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg4[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg28[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg28[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg4[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<256x128x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg28[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg28[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg28[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg30[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg30[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg31[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 10 {
        affine.for %arg73 = 0 to 10 {
          affine.store %arg0, %arg32[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg31[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg32[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 128 {
            affine.for %arg75 = 0 to 8 {
              affine.for %arg76 = 0 to 8 {
                %0 = affine.load %arg32[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg3[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg28[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg28[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg3[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg28[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg28[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg28[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg33[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg33[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg34[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 10 {
        affine.for %arg73 = 0 to 10 {
          affine.store %arg0, %arg35[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 8 {
        affine.for %arg73 = 0 to 8 {
          %0 = affine.load %arg34[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg35[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          affine.store %arg0, %arg36[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 128 {
            affine.for %arg75 = 0 to 4 {
              affine.for %arg76 = 0 to 4 {
                %0 = affine.load %arg35[%arg71, %arg75 * 2 + %arg72, %arg76 * 2 + %arg73] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg70[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg36[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg36[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg70[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<256x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg36[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg36[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg36[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg37[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg37[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg38[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 6 {
        affine.for %arg73 = 0 to 6 {
          affine.store %arg0, %arg40[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg38[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg40[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<256x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          affine.store %arg0, %arg41[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 256 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 256 {
            affine.for %arg75 = 0 to 4 {
              affine.for %arg76 = 0 to 4 {
                %0 = affine.load %arg40[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<256x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg66[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg41[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg41[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg66[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<512x256x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg41[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg41[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg41[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg42[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg42[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg43[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 6 {
        affine.for %arg73 = 0 to 6 {
          affine.store %arg0, %arg44[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg43[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg44[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 256 {
            affine.for %arg75 = 0 to 4 {
              affine.for %arg76 = 0 to 4 {
                %0 = affine.load %arg44[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg59[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg41[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg41[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg59[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg41[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg41[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg41[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg45[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg45[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg46[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 6 {
        affine.for %arg73 = 0 to 6 {
          affine.store %arg0, %arg47[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          %0 = affine.load %arg46[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg47[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          affine.store %arg0, %arg49[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 256 {
            affine.for %arg75 = 0 to 2 {
              affine.for %arg76 = 0 to 2 {
                %0 = affine.load %arg47[%arg71, %arg75 * 2 + %arg72, %arg76 * 2 + %arg73] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg48[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg49[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg49[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg48[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg49[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg49[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg49[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg50[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg50[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg51[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          affine.store %arg0, %arg52[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg51[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg52[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 256 {
            affine.for %arg75 = 0 to 2 {
              affine.for %arg76 = 0 to 2 {
                %0 = affine.load %arg52[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg39[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg49[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg49[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg39[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg49[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg49[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg49[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg53[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg53[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg54[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          affine.store %arg0, %arg55[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg54[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg55[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 256 {
            affine.for %arg75 = 0 to 2 {
              affine.for %arg76 = 0 to 2 {
                %0 = affine.load %arg55[%arg71, %arg75 + %arg72, %arg76 + %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %1 = affine.load %arg29[%arg74 * 2, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg49[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg49[%arg74 * 2, %arg75, %arg76] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %5 = affine.load %arg29[%arg74 * 2 + 1, %arg71, %arg72, %arg73] {partition_indices = [1, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 2, 0, 0, 0, d0 floordiv 2, d1, d2, d3)>>
                %6 = arith.mulf %0, %5 : f32
                %7 = affine.load %arg49[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg49[%arg74 * 2 + 1, %arg75, %arg76] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg49[%arg71, %arg72, %arg73] {max_mux_size = 2 : i64, partition_indices = [-1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 2, 0, 0, d0 floordiv 2, d1, d2)>>
          affine.store %0, %arg56[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg56[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg57[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 4 {
        affine.for %arg73 = 0 to 4 {
          affine.store %arg0, %arg58[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 2 {
        affine.for %arg73 = 0 to 2 {
          %0 = affine.load %arg57[%arg71, %arg72, %arg73] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg58[%arg71, %arg72 + 1, %arg73 + 1] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.store %arg0, %arg60[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 3 {
        affine.for %arg73 = 0 to 3 {
          affine.for %arg74 = 0 to 512 {
            %0 = affine.load %arg58[%arg71, %arg72 + 2, %arg73 + 2] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg20[%arg74, %arg71, %arg72, %arg73] {partition_indices = [0, 0, 0, 0]} : memref<512x512x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg60[%arg74] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg60[%arg74] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
          } {parallel}
        }
      }
    }
    affine.for %arg71 = 0 to 512 {
      %0 = affine.load %arg60[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg61[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      %0 = affine.load %arg61[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg62[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      %0 = affine.load %arg60[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
      %1 = affine.load %arg62[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %arg60[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      %0 = affine.load %arg60[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg63[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      %0 = affine.load %arg63[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg64[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 10 {
      affine.for %arg72 = 0 to 512 {
        %0 = affine.load %arg11[%arg71, %arg72] {partition_indices = [0, 0]} : memref<10x512xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        affine.store %0, %arg65[%arg72, %arg71] {partition_indices = [0, 0]} : memref<512x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
      } {parallel}
    } {parallel}
    affine.for %arg71 = 0 to 10 {
      affine.store %arg0, %arg67[%arg71] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 512 {
      affine.for %arg72 = 0 to 10 {
        %0 = affine.load %arg64[%arg71] {partition_indices = [0]} : memref<512xf32, affine_map<(d0) -> (0, d0)>>
        %1 = affine.load %arg65[%arg71, %arg72] {partition_indices = [0, 0]} : memref<512x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg67[%arg72] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg67[%arg72] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      } {parallel}
    }
    affine.for %arg71 = 0 to 10 {
      %0 = affine.load %arg67[%arg71] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg68[%arg71] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg71 = 0 to 10 {
      %0 = affine.load %arg68[%arg71] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      %1 = affine.load %arg2[%arg71] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      %2 = arith.addf %0, %1 {timing = #hls.t<1 -> 6, 5, 1>} : f32
      affine.store %2, %arg69[%arg71] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {loop_info = #hls.l<flattenTripCount=10, iterLatency=8, minII=8>, parallel, resource = #hls.r<lut=0, dsp=2, bram=0>, timing = #hls.t<0 -> 82, 82, 82>}
    return
  }
}