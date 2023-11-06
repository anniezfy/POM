module {
  func @test(%arg0: f32, %arg1: f32, %arg2: memref<3x64x64xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>, %arg3: memref<10xf32>, %arg4: memref<256x128xf32>, %arg5: memref<256x256x3x3xf32>, %arg6: memref<256x128x3x3xf32>, %arg7: memref<128x128x3x3xf32>, %arg8: memref<128x128x3x3xf32>, %arg9: memref<128x64xf32>, %arg10: memref<128x128x3x3xf32>, %arg11: memref<128x64x3x3xf32>, %arg12: memref<64x64x3x3xf32>, %arg13: memref<64x64x3x3xf32>, %arg14: memref<10x512xf32>, %arg15: memref<64x64x3x3xf32>, %arg16: memref<64x64x3x3xf32>, %arg17: memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>, %arg18: memref<512x512x3x3xf32>, %arg19: memref<512x512x3x3xf32>, %arg20: memref<512x256xf32>, %arg21: memref<512x512x3x3xf32>, %arg22: memref<512x256x3x3xf32>, %arg23: memref<256x256x3x3xf32>, %arg24: memref<256x256x3x3xf32>) attributes {resource = #hls.r<lut=0, dsp=20, bram=1426>, timing = #hls.t<0 -> 3680189, 3680189, 3680189>, top_func} {
    %0 = memref.alloc() : memref<3x66x66xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
    %1 = memref.alloc() : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
    %2 = memref.alloc() : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
    %3 = memref.alloc() : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
    affine.for %arg25 = 0 to 3 {
      affine.for %arg26 = 0 to 66 {
        affine.for %arg27 = 0 to 66 {
          affine.store %arg0, %0[%arg25, %arg26, %arg27] {partition_indices = [0, 0, 0]} : memref<3x66x66xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg25 = 0 to 3 {
      affine.for %arg26 = 0 to 64 {
        affine.for %arg27 = 0 to 64 {
          %4 = affine.load %arg2[%arg25, %arg26, %arg27] {partition_indices = [0, 0, 0]} : memref<3x64x64xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          affine.store %4, %0[%arg25, %arg26 + 1, %arg27 + 1] {partition_indices = [0, 0, 0]} : memref<3x66x66xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg25 = 0 to 64 {
      affine.for %arg26 = 0 to 64 {
        affine.for %arg27 = 0 to 64 {
          affine.store %arg0, %1[%arg25, %arg26, %arg27] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg25 = 0 to 3 {
      affine.for %arg26 = 0 to 3 {
        affine.for %arg27 = 0 to 3 {
          affine.for %arg28 = 0 to 16 {
            affine.for %arg29 = 0 to 64 {
              affine.for %arg30 = 0 to 64 {
                %4 = affine.load %0[%arg25, %arg29 + %arg26, %arg30 + %arg27] {partition_indices = [0, 0, 0]} : memref<3x66x66xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
                %5 = affine.load %arg17[%arg28 * 4, %arg25, %arg26, %arg27] {partition_indices = [0, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %6 = arith.mulf %4, %5 : f32
                %7 = affine.load %1[%arg28 * 4, %arg29, %arg30] {partition_indices = [0, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %1[%arg28 * 4, %arg29, %arg30] {partition_indices = [0, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %9 = affine.load %arg17[%arg28 * 4 + 1, %arg25, %arg26, %arg27] {partition_indices = [1, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %10 = arith.mulf %4, %9 : f32
                %11 = affine.load %1[%arg28 * 4 + 1, %arg29, %arg30] {partition_indices = [1, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %12 = arith.addf %10, %11 : f32
                affine.store %12, %1[%arg28 * 4 + 1, %arg29, %arg30] {partition_indices = [1, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %13 = affine.load %arg17[%arg28 * 4 + 2, %arg25, %arg26, %arg27] {partition_indices = [2, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %14 = arith.mulf %4, %13 : f32
                %15 = affine.load %1[%arg28 * 4 + 2, %arg29, %arg30] {partition_indices = [2, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %16 = arith.addf %14, %15 : f32
                affine.store %16, %1[%arg28 * 4 + 2, %arg29, %arg30] {partition_indices = [2, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %17 = affine.load %arg17[%arg28 * 4 + 3, %arg25, %arg26, %arg27] {partition_indices = [3, 0, 0, 0]} : memref<64x3x3x3xf32, affine_map<(d0, d1, d2, d3) -> (d0 mod 4, 0, 0, 0, d0 floordiv 4, d1, d2, d3)>>
                %18 = arith.mulf %4, %17 : f32
                %19 = affine.load %1[%arg28 * 4 + 3, %arg29, %arg30] {partition_indices = [3, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
                %20 = arith.addf %18, %19 : f32
                affine.store %20, %1[%arg28 * 4 + 3, %arg29, %arg30] {partition_indices = [3, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
              } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
            } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
          } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
        } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg25 = 0 to 64 {
      affine.for %arg26 = 0 to 64 {
        affine.for %arg27 = 0 to 64 {
          %4 = affine.load %1[%arg25, %arg26, %arg27] {max_mux_size = 4 : i64, partition_indices = [-1, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (d0 mod 4, 0, 0, d0 floordiv 4, d1, d2)>>
          affine.store %4, %2[%arg25, %arg26, %arg27] {partition_indices = [0, 0, 0]} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg25 = 0 to 64 {
      affine.for %arg26 = 0 to 64 {
        affine.for %arg27 = 0 to 64 {
          %4 = affine.load %2[%arg25, %arg26, %arg27] {partition_indices = [0, 0, 0], timing = #hls.t<1 -> 3, 2, 1>} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
          %5 = arith.maxf %4, %arg0 {timing = #hls.t<1 -> 1, 0, 0>} : f32
          affine.store %5, %3[%arg25, %arg26, %arg27] {partition_indices = [0, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<64x64x64xf32, affine_map<(d0, d1, d2) -> (0, 0, 0, d0, d1, d2)>>
        } {loop_info = #hls.l<flattenTripCount=64, iterLatency=3, minII=3>, parallel, timing = #hls.t<0 -> 194, 194, 194>}
      } {loop_info = #hls.l<flattenTripCount=64, iterLatency=194, minII=194>, parallel, timing = #hls.t<0 -> 12418, 12418, 12418>}
    } {loop_info = #hls.l<flattenTripCount=64, iterLatency=12418, minII=12418>, parallel, resource = #hls.r<lut=0, dsp=0, bram=0>, timing = #hls.t<0 -> 794754, 794754, 794754>}
    return
  }
}