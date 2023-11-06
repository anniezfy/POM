module {
  func @mobilenettmp(%arg0: f32, %arg1: f32, %arg2: memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg3: memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg4: memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg5: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg6: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg7: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg8: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg9: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg10: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg11: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg12: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg13: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg14: memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg15: memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg16: memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg17: memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg18: memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg19: memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg20: memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg21: memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg22: memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg23: memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg24: memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg25: memref<1024xf32, affine_map<(d0) -> (0, d0)>>, %arg26: memref<1024xf32, affine_map<(d0) -> (0, d0)>>, %arg27: memref<1024xf32, affine_map<(d0) -> (0, d0)>>, %arg28: memref<1024xf32, affine_map<(d0) -> (0, d0)>>, %arg29: memref<1024x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg30: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg31: memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg32: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg33: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg34: memref<10xf32, affine_map<(d0) -> (0, d0)>>, %arg35: memref<10x1024xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg36: memref<1024x1024xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg37: memref<1024x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg38: memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg39: memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg40: memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg41: memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg42: memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg43: memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg44: memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg45: memref<256x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg46: memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg47: memref<128x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg48: memref<128x64xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>, %arg49: memref<64x32xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg50: memref<32x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>, %arg51: memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg52: memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>, %arg53: memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>, %arg54: memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg55: memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg56: memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg57: memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg58: memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg59: memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg60: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg61: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg62: memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg63: memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg64: memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg65: memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg66: memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg67: memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg68: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg69: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg70: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg71: memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg72: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg73: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg74: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg75: memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg76: memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg77: memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg78: memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg79: memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg80: memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg81: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg82: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg83: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg84: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg85: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg86: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg87: memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg88: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg89: memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg90: memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg91: memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg92: memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg93: memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg94: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg95: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg96: memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg97: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg98: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg99: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg100: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg101: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg102: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg103: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg104: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg105: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg106: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg107: memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg108: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg109: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg110: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg111: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg112: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg113: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg114: memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>, %arg115: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg116: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg117: memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>) attributes {resource = #hls.r<lut=0, dsp=80, bram=0>, timing = #hls.t<0 -> 72635245, 72635245, 72635245>, top_func} {
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 34 {
        affine.for %arg120 = 0 to 34 {
          affine.store %arg0, %arg52[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg2[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<3x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg52[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          affine.store %arg0, %arg53[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 3 {
          affine.for %arg121 = 0 to 32 {
            affine.for %arg122 = 0 to 32 {
              affine.for %arg123 = 0 to 2 {
                %0 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %1 = affine.load %arg50[%arg121, %arg118, %arg119, %arg120] {partition_indices = [0, 0, 0, 0]} : memref<32x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (0, 0, 0, 0, d0, d1, d2, d3)>>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg53[%arg121, %arg122, %arg123 * 16] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg53[%arg121, %arg122, %arg123 * 16] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %5 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %6 = arith.mulf %5, %1 : f32
                %7 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %arg53[%arg121, %arg122, %arg123 * 16 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %9 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 2] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %10 = arith.mulf %9, %1 : f32
                %11 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 2]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %arg53[%arg121, %arg122, %arg123 * 16 + 2] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 2]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %13 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 3] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %14 = arith.mulf %13, %1 : f32
                %15 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 3]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %arg53[%arg121, %arg122, %arg123 * 16 + 3] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 3]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %17 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 4] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %18 = arith.mulf %17, %1 : f32
                %19 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 4]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %20 = arith.addf %18, %19 : f32
                affine.store %20, %arg53[%arg121, %arg122, %arg123 * 16 + 4] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 4]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %21 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 5] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %22 = arith.mulf %21, %1 : f32
                %23 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 5]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %24 = arith.addf %22, %23 : f32
                affine.store %24, %arg53[%arg121, %arg122, %arg123 * 16 + 5] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 5]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %25 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 6] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %26 = arith.mulf %25, %1 : f32
                %27 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 6]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %28 = arith.addf %26, %27 : f32
                affine.store %28, %arg53[%arg121, %arg122, %arg123 * 16 + 6] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 6]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %29 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 7] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %30 = arith.mulf %29, %1 : f32
                %31 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 7]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %32 = arith.addf %30, %31 : f32
                affine.store %32, %arg53[%arg121, %arg122, %arg123 * 16 + 7] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 7]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %33 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 8] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %34 = arith.mulf %33, %1 : f32
                %35 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 8] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 8]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %36 = arith.addf %34, %35 : f32
                affine.store %36, %arg53[%arg121, %arg122, %arg123 * 16 + 8] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 8]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %37 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 9] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %38 = arith.mulf %37, %1 : f32
                %39 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 9] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 9]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %40 = arith.addf %38, %39 : f32
                affine.store %40, %arg53[%arg121, %arg122, %arg123 * 16 + 9] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 9]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %41 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 10] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %42 = arith.mulf %41, %1 : f32
                %43 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 10] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 10]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %44 = arith.addf %42, %43 : f32
                affine.store %44, %arg53[%arg121, %arg122, %arg123 * 16 + 10] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 10]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %45 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 11] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %46 = arith.mulf %45, %1 : f32
                %47 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 11] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 11]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %48 = arith.addf %46, %47 : f32
                affine.store %48, %arg53[%arg121, %arg122, %arg123 * 16 + 11] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 11]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %49 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 12] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %50 = arith.mulf %49, %1 : f32
                %51 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 12] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 12]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %52 = arith.addf %50, %51 : f32
                affine.store %52, %arg53[%arg121, %arg122, %arg123 * 16 + 12] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 12]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %53 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 13] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %54 = arith.mulf %53, %1 : f32
                %55 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 13] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 13]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %56 = arith.addf %54, %55 : f32
                affine.store %56, %arg53[%arg121, %arg122, %arg123 * 16 + 13] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 13]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %57 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 14] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %58 = arith.mulf %57, %1 : f32
                %59 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 14] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 14]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %60 = arith.addf %58, %59 : f32
                affine.store %60, %arg53[%arg121, %arg122, %arg123 * 16 + 14] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 14]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %61 = affine.load %arg52[%arg118, %arg122 + %arg119, %arg123 * 16 + %arg120 + 15] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<3x34x34xf32, affine_map<(d0, d1, d2) -> (0, 0, d2 mod 16, d0, d1, d2 floordiv 16)>>
                %62 = arith.mulf %61, %1 : f32
                %63 = affine.load %arg53[%arg121, %arg122, %arg123 * 16 + 15] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 15]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
                %64 = arith.addf %62, %63 : f32
                affine.store %64, %arg53[%arg121, %arg122, %arg123 * 16 + 15] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 15]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg53[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
          affine.store %0, %arg54[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg54[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg55[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 34 {
        affine.for %arg120 = 0 to 34 {
          affine.store %arg0, %arg56[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg55[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg56[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 32 {
          affine.for %arg121 = 0 to 32 {
            affine.for %arg122 = 0 to 2 {
              %0 = affine.load %arg56[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg3[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg53[%arg122 * 16, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg53[%arg122 * 16, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [0, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %5 = affine.load %arg56[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg3[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg53[%arg122 * 16 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [1, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg53[%arg122 * 16 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [1, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %10 = affine.load %arg56[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg3[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg53[%arg122 * 16 + 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [2, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg53[%arg122 * 16 + 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [2, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %15 = affine.load %arg56[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg3[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg53[%arg122 * 16 + 3, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [3, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg53[%arg122 * 16 + 3, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [3, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %20 = affine.load %arg56[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg3[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg53[%arg122 * 16 + 4, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [4, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg53[%arg122 * 16 + 4, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [4, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %25 = affine.load %arg56[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg3[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg53[%arg122 * 16 + 5, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [5, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg53[%arg122 * 16 + 5, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [5, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %30 = affine.load %arg56[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg3[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg53[%arg122 * 16 + 6, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [6, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg53[%arg122 * 16 + 6, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [6, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %35 = affine.load %arg56[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg3[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg53[%arg122 * 16 + 7, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [7, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg53[%arg122 * 16 + 7, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [7, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %40 = affine.load %arg56[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg3[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg53[%arg122 * 16 + 8, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [8, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg53[%arg122 * 16 + 8, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [8, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %45 = affine.load %arg56[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg3[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg53[%arg122 * 16 + 9, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [9, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg53[%arg122 * 16 + 9, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [9, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %50 = affine.load %arg56[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg3[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg53[%arg122 * 16 + 10, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [10, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg53[%arg122 * 16 + 10, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [10, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %55 = affine.load %arg56[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg3[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg53[%arg122 * 16 + 11, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [11, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg53[%arg122 * 16 + 11, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [11, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %60 = affine.load %arg56[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg3[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg53[%arg122 * 16 + 12, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [12, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg53[%arg122 * 16 + 12, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [12, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %65 = affine.load %arg56[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg3[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg53[%arg122 * 16 + 13, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [13, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg53[%arg122 * 16 + 13, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [13, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %70 = affine.load %arg56[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg3[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg53[%arg122 * 16 + 14, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [14, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg53[%arg122 * 16 + 14, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [14, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %75 = affine.load %arg56[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<32x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg3[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<32x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg53[%arg122 * 16 + 15, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [15, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg53[%arg122 * 16 + 15, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [15, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg53[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, -1]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, d2 mod 16, d0 floordiv 16, d1, d2 floordiv 16)>>
          affine.store %0, %arg57[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg57[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg58[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          affine.store %arg0, %arg60[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 32 {
      affine.for %arg119 = 0 to 64 {
        affine.for %arg120 = 0 to 32 {
          affine.for %arg121 = 0 to 32 {
            %0 = affine.load %arg58[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<32x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg49[%arg119, %arg118] {partition_indices = [0, 0]} : memref<64x32xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg60[%arg119, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg60[%arg119, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          } {parallel}
        } {parallel}
      } {parallel}
    }
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg60[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg61[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg61[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg62[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 34 {
        affine.for %arg120 = 0 to 34 {
          affine.store %arg0, %arg63[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 32 {
        affine.for %arg120 = 0 to 32 {
          %0 = affine.load %arg62[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x32x32xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg63[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          affine.store %arg0, %arg64[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 16 {
          affine.for %arg121 = 0 to 16 {
            affine.for %arg122 = 0 to 4 {
              %0 = affine.load %arg63[%arg122 * 16, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [0, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg40[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg64[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg64[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg63[%arg122 * 16 + 1, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [1, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg40[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg64[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg64[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg63[%arg122 * 16 + 2, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [2, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg40[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg64[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg64[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg63[%arg122 * 16 + 3, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [3, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg40[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg64[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg64[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg63[%arg122 * 16 + 4, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [4, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg40[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg64[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg64[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg63[%arg122 * 16 + 5, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [5, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg40[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg64[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg64[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg63[%arg122 * 16 + 6, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [6, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg40[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg64[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg64[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg63[%arg122 * 16 + 7, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [7, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg40[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg64[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg64[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg63[%arg122 * 16 + 8, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [8, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg40[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg64[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg64[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg63[%arg122 * 16 + 9, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [9, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg40[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg64[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg64[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg63[%arg122 * 16 + 10, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [10, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg40[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg64[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg64[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg63[%arg122 * 16 + 11, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [11, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg40[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg64[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg64[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg63[%arg122 * 16 + 12, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [12, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg40[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg64[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg64[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg63[%arg122 * 16 + 13, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [13, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg40[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg64[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg64[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg63[%arg122 * 16 + 14, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [14, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg40[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg64[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg64[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg63[%arg122 * 16 + 15, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [15, 0, 0]} : memref<64x34x34xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg40[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<64x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg64[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg64[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg64[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg65[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg65[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg66[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          affine.store %arg0, %arg68[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 64 {
      affine.for %arg119 = 0 to 64 {
        affine.for %arg120 = 0 to 16 {
          affine.for %arg121 = 0 to 16 {
            %0 = affine.load %arg66[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<64x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg48[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<128x64xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg68[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg68[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg48[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<128x64xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg68[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg68[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg68[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg69[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg69[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg70[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 18 {
        affine.for %arg120 = 0 to 18 {
          affine.store %arg0, %arg71[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg70[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg71[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 16 {
          affine.for %arg121 = 0 to 16 {
            affine.for %arg122 = 0 to 8 {
              %0 = affine.load %arg71[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg51[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg68[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg68[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg71[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg51[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg68[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg68[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg71[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg51[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg68[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg68[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg71[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg51[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg68[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg68[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg71[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg51[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg68[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg68[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg71[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg51[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg68[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg68[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg71[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg51[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg68[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg68[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg71[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg51[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg68[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg68[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg71[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg51[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg68[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg68[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg71[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg51[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg68[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg68[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg71[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg51[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg68[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg68[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg71[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg51[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg68[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg68[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg71[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg51[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg68[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg68[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg71[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg51[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg68[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg68[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg71[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg51[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg68[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg68[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg71[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg51[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg68[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg68[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg68[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg72[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg72[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg73[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 64 {
        affine.for %arg120 = 0 to 16 {
          affine.for %arg121 = 0 to 16 {
            %0 = affine.load %arg73[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg47[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<128x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg68[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg68[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg47[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<128x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg68[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg68[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg68[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg74[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg74[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg75[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 18 {
        affine.for %arg120 = 0 to 18 {
          affine.store %arg0, %arg76[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 16 {
        affine.for %arg120 = 0 to 16 {
          %0 = affine.load %arg75[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x16x16xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg76[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          affine.store %arg0, %arg78[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 8 {
          affine.for %arg121 = 0 to 8 {
            affine.for %arg122 = 0 to 8 {
              %0 = affine.load %arg76[%arg122 * 16, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [0, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg59[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg78[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg78[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg76[%arg122 * 16 + 1, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [1, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg59[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg78[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg78[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg76[%arg122 * 16 + 2, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [2, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg59[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg78[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg78[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg76[%arg122 * 16 + 3, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [3, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg59[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg78[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg78[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg76[%arg122 * 16 + 4, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [4, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg59[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg78[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg78[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg76[%arg122 * 16 + 5, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [5, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg59[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg78[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg78[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg76[%arg122 * 16 + 6, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [6, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg59[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg78[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg78[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg76[%arg122 * 16 + 7, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [7, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg59[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg78[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg78[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg76[%arg122 * 16 + 8, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [8, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg59[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg78[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg78[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg76[%arg122 * 16 + 9, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [9, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg59[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg78[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg78[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg76[%arg122 * 16 + 10, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [10, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg59[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg78[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg78[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg76[%arg122 * 16 + 11, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [11, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg59[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg78[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg78[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg76[%arg122 * 16 + 12, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [12, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg59[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg78[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg78[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg76[%arg122 * 16 + 13, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [13, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg59[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg78[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg78[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg76[%arg122 * 16 + 14, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [14, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg59[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg78[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg78[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg76[%arg122 * 16 + 15, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [15, 0, 0]} : memref<128x18x18xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg59[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<128x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg78[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg78[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg78[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg79[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg79[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg80[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          affine.store %arg0, %arg81[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 128 {
      affine.for %arg119 = 0 to 128 {
        affine.for %arg120 = 0 to 8 {
          affine.for %arg121 = 0 to 8 {
            %0 = affine.load %arg80[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<128x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg46[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg81[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg81[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg46[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<256x128xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg81[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg81[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg81[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg82[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg82[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg83[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 10 {
        affine.for %arg120 = 0 to 10 {
          affine.store %arg0, %arg84[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg83[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg84[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 8 {
          affine.for %arg121 = 0 to 8 {
            affine.for %arg122 = 0 to 16 {
              %0 = affine.load %arg84[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg67[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg81[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg81[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg84[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg67[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg81[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg81[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg84[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg67[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg81[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg81[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg84[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg67[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg81[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg81[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg84[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg67[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg81[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg81[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg84[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg67[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg81[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg81[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg84[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg67[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg81[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg81[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg84[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg67[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg81[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg81[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg84[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg67[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg81[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg81[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg84[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg67[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg81[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg81[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg84[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg67[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg81[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg81[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg84[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg67[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg81[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg81[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg84[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg67[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg81[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg81[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg84[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg67[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg81[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg81[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg84[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg67[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg81[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg81[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg84[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg67[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg81[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg81[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg81[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg85[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg85[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg86[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 128 {
        affine.for %arg120 = 0 to 8 {
          affine.for %arg121 = 0 to 8 {
            %0 = affine.load %arg86[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg45[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<256x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg81[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg81[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg45[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<256x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg81[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg81[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg81[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg88[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg88[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg89[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 10 {
        affine.for %arg120 = 0 to 10 {
          affine.store %arg0, %arg90[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 8 {
        affine.for %arg120 = 0 to 8 {
          %0 = affine.load %arg89[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x8x8xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg90[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          affine.store %arg0, %arg91[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            affine.for %arg122 = 0 to 16 {
              %0 = affine.load %arg90[%arg122 * 16, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [0, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg77[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg91[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg91[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg90[%arg122 * 16 + 1, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [1, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg77[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg91[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg91[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg90[%arg122 * 16 + 2, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [2, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg77[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg91[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg91[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg90[%arg122 * 16 + 3, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [3, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg77[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg91[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg91[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg90[%arg122 * 16 + 4, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [4, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg77[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg91[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg91[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg90[%arg122 * 16 + 5, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [5, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg77[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg91[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg91[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg90[%arg122 * 16 + 6, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [6, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg77[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg91[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg91[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg90[%arg122 * 16 + 7, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [7, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg77[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg91[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg91[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg90[%arg122 * 16 + 8, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [8, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg77[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg91[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg91[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg90[%arg122 * 16 + 9, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [9, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg77[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg91[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg91[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg90[%arg122 * 16 + 10, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [10, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg77[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg91[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg91[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg90[%arg122 * 16 + 11, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [11, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg77[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg91[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg91[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg90[%arg122 * 16 + 12, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [12, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg77[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg91[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg91[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg90[%arg122 * 16 + 13, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [13, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg77[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg91[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg91[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg90[%arg122 * 16 + 14, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [14, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg77[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg91[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg91[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg90[%arg122 * 16 + 15, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [15, 0, 0]} : memref<256x10x10xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg77[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<256x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg91[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg91[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg91[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg92[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg92[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg93[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          affine.store %arg0, %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 256 {
      affine.for %arg119 = 0 to 256 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            %0 = affine.load %arg93[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<256x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg44[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg44[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<512x256xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg95[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg95[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg97[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 6 {
        affine.for %arg120 = 0 to 6 {
          affine.store %arg0, %arg98[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg97[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg98[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            affine.for %arg122 = 0 to 32 {
              %0 = affine.load %arg98[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg87[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg98[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg87[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg98[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg87[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg98[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg87[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg98[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg87[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg98[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg87[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg98[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg87[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg98[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg87[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg98[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg87[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg98[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg87[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg98[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg87[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg98[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg87[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg98[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg87[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg98[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg87[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg98[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg87[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg98[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg87[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg99[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg99[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg100[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 256 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            %0 = affine.load %arg100[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg43[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg43[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg101[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg101[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg102[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 6 {
        affine.for %arg120 = 0 to 6 {
          affine.store %arg0, %arg103[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg102[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg103[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            affine.for %arg122 = 0 to 32 {
              %0 = affine.load %arg103[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg96[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg103[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg96[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg103[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg96[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg103[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg96[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg103[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg96[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg103[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg96[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg103[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg96[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg103[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg96[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg103[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg96[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg103[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg96[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg103[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg96[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg103[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg96[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg103[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg96[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg103[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg96[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg103[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg96[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg103[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg96[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg104[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg104[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg105[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 256 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            %0 = affine.load %arg105[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg42[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg42[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg106[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg106[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg108[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 6 {
        affine.for %arg120 = 0 to 6 {
          affine.store %arg0, %arg109[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg108[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg109[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            affine.for %arg122 = 0 to 32 {
              %0 = affine.load %arg109[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg107[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg109[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg107[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg109[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg107[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg109[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg107[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg109[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg107[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg109[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg107[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg109[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg107[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg109[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg107[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg109[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg107[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg109[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg107[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg109[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg107[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg109[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg107[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg109[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg107[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg109[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg107[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg109[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg107[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg109[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg107[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg110[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg110[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg111[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 256 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            %0 = affine.load %arg111[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg41[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg41[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg112[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg112[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg113[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 6 {
        affine.for %arg120 = 0 to 6 {
          affine.store %arg0, %arg114[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg113[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg114[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            affine.for %arg122 = 0 to 32 {
              %0 = affine.load %arg114[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg4[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg114[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg4[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg114[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg4[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg114[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg4[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg114[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg4[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg114[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg4[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg114[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg4[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg114[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg4[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg114[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg4[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg114[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg4[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg114[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg4[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg114[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg4[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg114[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg4[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg114[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg4[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg114[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg4[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg114[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg4[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg115[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg115[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg116[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 256 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            %0 = affine.load %arg116[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg39[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg39[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg117[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg117[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg5[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 6 {
        affine.for %arg120 = 0 to 6 {
          affine.store %arg0, %arg6[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg5[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg6[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            affine.for %arg122 = 0 to 32 {
              %0 = affine.load %arg6[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg14[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg94[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg6[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg14[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg94[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg6[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg14[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg94[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg6[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg14[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg94[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg6[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg14[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg94[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg6[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg14[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg94[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg6[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg14[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg94[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg6[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg14[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg94[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg6[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg14[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg94[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg6[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg14[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg94[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg6[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg14[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg94[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg6[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg14[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg94[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg6[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg14[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg94[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg6[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg14[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg94[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg6[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg14[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg94[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg6[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg14[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg94[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg7[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg7[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg8[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 256 {
        affine.for %arg120 = 0 to 4 {
          affine.for %arg121 = 0 to 4 {
            %0 = affine.load %arg8[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg38[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg94[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg38[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<512x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg94[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg94[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg9[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg9[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg10[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 6 {
        affine.for %arg120 = 0 to 6 {
          affine.store %arg0, %arg11[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          %0 = affine.load %arg10[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x4x4xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg11[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          affine.store %arg0, %arg12[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 2 {
          affine.for %arg121 = 0 to 2 {
            affine.for %arg122 = 0 to 32 {
              %0 = affine.load %arg11[%arg122 * 16, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [0, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg24[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg12[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg12[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg11[%arg122 * 16 + 1, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [1, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg24[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg12[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg12[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg11[%arg122 * 16 + 2, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [2, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg24[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg12[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg12[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg11[%arg122 * 16 + 3, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [3, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg24[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg12[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg12[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg11[%arg122 * 16 + 4, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [4, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg24[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg12[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg12[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg11[%arg122 * 16 + 5, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [5, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg24[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg12[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg12[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg11[%arg122 * 16 + 6, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [6, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg24[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg12[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg12[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg11[%arg122 * 16 + 7, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [7, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg24[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg12[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg12[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg11[%arg122 * 16 + 8, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [8, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg24[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg12[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg12[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg11[%arg122 * 16 + 9, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [9, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg24[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg12[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg12[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg11[%arg122 * 16 + 10, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [10, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg24[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg12[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg12[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg11[%arg122 * 16 + 11, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [11, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg24[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg12[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg12[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg11[%arg122 * 16 + 12, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [12, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg24[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg12[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg12[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg11[%arg122 * 16 + 13, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [13, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg24[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg12[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg12[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg11[%arg122 * 16 + 14, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [14, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg24[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg12[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg12[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg11[%arg122 * 16 + 15, %arg120 * 2 + %arg118, %arg121 * 2 + %arg119] {partition_indices = [15, 0, 0]} : memref<512x6x6xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg24[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<512x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg12[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg12[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg12[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg13[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg13[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg15[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          affine.store %arg0, %arg16[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 512 {
      affine.for %arg119 = 0 to 512 {
        affine.for %arg120 = 0 to 2 {
          affine.for %arg121 = 0 to 2 {
            %0 = affine.load %arg15[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<512x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg37[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<1024x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg16[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg16[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg37[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<1024x512xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg16[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg16[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg16[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg17[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg17[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg18[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 4 {
        affine.for %arg120 = 0 to 4 {
          affine.store %arg0, %arg19[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg18[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg19[%arg118, %arg119 + 1, %arg120 + 1] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 3 {
      affine.for %arg119 = 0 to 3 {
        affine.for %arg120 = 0 to 2 {
          affine.for %arg121 = 0 to 2 {
            affine.for %arg122 = 0 to 64 {
              %0 = affine.load %arg19[%arg122 * 16, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [0, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %1 = affine.load %arg31[%arg122 * 16, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %2 = arith.mulf %0, %1 : f32
              %3 = affine.load %arg16[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg16[%arg122 * 16, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %5 = affine.load %arg19[%arg122 * 16 + 1, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [1, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %6 = affine.load %arg31[%arg122 * 16 + 1, %arg118, %arg119] {partition_indices = [1, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %7 = arith.mulf %5, %6 : f32
              %8 = affine.load %arg16[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %9 = arith.addf %7, %8 : f32
              affine.store %9, %arg16[%arg122 * 16 + 1, %arg120, %arg121] {partition_indices = [1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %10 = affine.load %arg19[%arg122 * 16 + 2, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [2, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %11 = affine.load %arg31[%arg122 * 16 + 2, %arg118, %arg119] {partition_indices = [2, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %12 = arith.mulf %10, %11 : f32
              %13 = affine.load %arg16[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %14 = arith.addf %12, %13 : f32
              affine.store %14, %arg16[%arg122 * 16 + 2, %arg120, %arg121] {partition_indices = [2, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %15 = affine.load %arg19[%arg122 * 16 + 3, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [3, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %16 = affine.load %arg31[%arg122 * 16 + 3, %arg118, %arg119] {partition_indices = [3, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %17 = arith.mulf %15, %16 : f32
              %18 = affine.load %arg16[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %19 = arith.addf %17, %18 : f32
              affine.store %19, %arg16[%arg122 * 16 + 3, %arg120, %arg121] {partition_indices = [3, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %20 = affine.load %arg19[%arg122 * 16 + 4, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [4, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %21 = affine.load %arg31[%arg122 * 16 + 4, %arg118, %arg119] {partition_indices = [4, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %22 = arith.mulf %20, %21 : f32
              %23 = affine.load %arg16[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %24 = arith.addf %22, %23 : f32
              affine.store %24, %arg16[%arg122 * 16 + 4, %arg120, %arg121] {partition_indices = [4, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %25 = affine.load %arg19[%arg122 * 16 + 5, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [5, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %26 = affine.load %arg31[%arg122 * 16 + 5, %arg118, %arg119] {partition_indices = [5, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %27 = arith.mulf %25, %26 : f32
              %28 = affine.load %arg16[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %29 = arith.addf %27, %28 : f32
              affine.store %29, %arg16[%arg122 * 16 + 5, %arg120, %arg121] {partition_indices = [5, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %30 = affine.load %arg19[%arg122 * 16 + 6, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [6, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %31 = affine.load %arg31[%arg122 * 16 + 6, %arg118, %arg119] {partition_indices = [6, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %32 = arith.mulf %30, %31 : f32
              %33 = affine.load %arg16[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %34 = arith.addf %32, %33 : f32
              affine.store %34, %arg16[%arg122 * 16 + 6, %arg120, %arg121] {partition_indices = [6, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %35 = affine.load %arg19[%arg122 * 16 + 7, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [7, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %36 = affine.load %arg31[%arg122 * 16 + 7, %arg118, %arg119] {partition_indices = [7, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %37 = arith.mulf %35, %36 : f32
              %38 = affine.load %arg16[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %39 = arith.addf %37, %38 : f32
              affine.store %39, %arg16[%arg122 * 16 + 7, %arg120, %arg121] {partition_indices = [7, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %40 = affine.load %arg19[%arg122 * 16 + 8, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [8, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %41 = affine.load %arg31[%arg122 * 16 + 8, %arg118, %arg119] {partition_indices = [8, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %42 = arith.mulf %40, %41 : f32
              %43 = affine.load %arg16[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %44 = arith.addf %42, %43 : f32
              affine.store %44, %arg16[%arg122 * 16 + 8, %arg120, %arg121] {partition_indices = [8, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %45 = affine.load %arg19[%arg122 * 16 + 9, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [9, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %46 = affine.load %arg31[%arg122 * 16 + 9, %arg118, %arg119] {partition_indices = [9, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %47 = arith.mulf %45, %46 : f32
              %48 = affine.load %arg16[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %49 = arith.addf %47, %48 : f32
              affine.store %49, %arg16[%arg122 * 16 + 9, %arg120, %arg121] {partition_indices = [9, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %50 = affine.load %arg19[%arg122 * 16 + 10, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [10, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %51 = affine.load %arg31[%arg122 * 16 + 10, %arg118, %arg119] {partition_indices = [10, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %52 = arith.mulf %50, %51 : f32
              %53 = affine.load %arg16[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %54 = arith.addf %52, %53 : f32
              affine.store %54, %arg16[%arg122 * 16 + 10, %arg120, %arg121] {partition_indices = [10, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %55 = affine.load %arg19[%arg122 * 16 + 11, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [11, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %56 = affine.load %arg31[%arg122 * 16 + 11, %arg118, %arg119] {partition_indices = [11, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %57 = arith.mulf %55, %56 : f32
              %58 = affine.load %arg16[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %59 = arith.addf %57, %58 : f32
              affine.store %59, %arg16[%arg122 * 16 + 11, %arg120, %arg121] {partition_indices = [11, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %60 = affine.load %arg19[%arg122 * 16 + 12, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [12, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %61 = affine.load %arg31[%arg122 * 16 + 12, %arg118, %arg119] {partition_indices = [12, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %62 = arith.mulf %60, %61 : f32
              %63 = affine.load %arg16[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %64 = arith.addf %62, %63 : f32
              affine.store %64, %arg16[%arg122 * 16 + 12, %arg120, %arg121] {partition_indices = [12, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %65 = affine.load %arg19[%arg122 * 16 + 13, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [13, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %66 = affine.load %arg31[%arg122 * 16 + 13, %arg118, %arg119] {partition_indices = [13, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %67 = arith.mulf %65, %66 : f32
              %68 = affine.load %arg16[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %69 = arith.addf %67, %68 : f32
              affine.store %69, %arg16[%arg122 * 16 + 13, %arg120, %arg121] {partition_indices = [13, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %70 = affine.load %arg19[%arg122 * 16 + 14, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [14, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %71 = affine.load %arg31[%arg122 * 16 + 14, %arg118, %arg119] {partition_indices = [14, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %72 = arith.mulf %70, %71 : f32
              %73 = affine.load %arg16[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %74 = arith.addf %72, %73 : f32
              affine.store %74, %arg16[%arg122 * 16 + 14, %arg120, %arg121] {partition_indices = [14, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %75 = affine.load %arg19[%arg122 * 16 + 15, %arg120 + %arg118, %arg121 + %arg119] {partition_indices = [15, 0, 0]} : memref<1024x4x4xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %76 = affine.load %arg31[%arg122 * 16 + 15, %arg118, %arg119] {partition_indices = [15, 0, 0]} : memref<1024x3x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %77 = arith.mulf %75, %76 : f32
              %78 = affine.load %arg16[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
              %79 = arith.addf %77, %78 : f32
              affine.store %79, %arg16[%arg122 * 16 + 15, %arg120, %arg121] {partition_indices = [15, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg16[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg20[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg20[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg21[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 512 {
        affine.for %arg120 = 0 to 2 {
          affine.for %arg121 = 0 to 2 {
            %0 = affine.load %arg21[%arg118, %arg120, %arg121] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
            %1 = affine.load %arg36[%arg119 * 2, %arg118] {partition_indices = [0, 0]} : memref<1024x1024xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %arg16[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg16[%arg119 * 2, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %5 = affine.load %arg36[%arg119 * 2 + 1, %arg118] {partition_indices = [1, 0]} : memref<1024x1024xf32, affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>>
            %6 = arith.mulf %0, %5 : f32
            %7 = affine.load %arg16[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %arg16[%arg119 * 2 + 1, %arg120, %arg121] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg16[%arg118, %arg119, %arg120] {max_mux_size = 16 : i64, partition_indices = [-1, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (d0 mod 16, 0, 0, d0 floordiv 16, d1, d2)>>
          affine.store %0, %arg22[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 2 {
          %0 = affine.load %arg22[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %0, %arg23[%arg118, %arg119, %arg120] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.store %arg0, %arg25[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg118 = 0 to 2 {
      affine.for %arg119 = 0 to 2 {
        affine.for %arg120 = 0 to 1024 {
          %0 = affine.load %arg25[%arg120] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
          %1 = affine.load %arg23[%arg120, %arg118, %arg119] {partition_indices = [0, 0, 0]} : memref<1024x2x2xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg25[%arg120] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
        } {parallel}
      }
    }
    affine.for %arg118 = 0 to 1024 {
      %0 = affine.load %arg25[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg26[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      %0 = affine.load %arg26[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
      %1 = arith.mulf %0, %arg1 : f32
      affine.store %1, %arg27[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      %0 = affine.load %arg27[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg28[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg118 = 0 to 10 {
      affine.for %arg119 = 0 to 1024 {
        %0 = affine.load %arg35[%arg118, %arg119] {partition_indices = [0, 0]} : memref<10x1024xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        affine.store %0, %arg29[%arg119, %arg118] {partition_indices = [0, 0]} : memref<1024x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
      } {parallel}
    } {parallel}
    affine.for %arg118 = 0 to 10 {
      affine.store %arg0, %arg30[%arg118] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg118 = 0 to 1024 {
      affine.for %arg119 = 0 to 10 {
        %0 = affine.load %arg28[%arg118] {partition_indices = [0]} : memref<1024xf32, affine_map<(d0) -> (0, d0)>>
        %1 = affine.load %arg29[%arg118, %arg119] {partition_indices = [0, 0]} : memref<1024x10xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg30[%arg119] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg30[%arg119] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      } {parallel}
    }
    affine.for %arg118 = 0 to 10 {
      %0 = affine.load %arg30[%arg118] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      affine.store %0, %arg32[%arg118] {partition_indices = [0]} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {parallel}
    affine.for %arg118 = 0 to 10 {
      %0 = affine.load %arg32[%arg118] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      %1 = affine.load %arg34[%arg118] {partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
      %2 = arith.addf %0, %1 {timing = #hls.t<1 -> 6, 5, 1>} : f32
      affine.store %2, %arg33[%arg118] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<10xf32, affine_map<(d0) -> (0, d0)>>
    } {loop_info = #hls.l<flattenTripCount=10, iterLatency=8, minII=8>, parallel, resource = #hls.r<lut=0, dsp=2, bram=0>, timing = #hls.t<0 -> 82, 82, 82>}
    return
  }
}