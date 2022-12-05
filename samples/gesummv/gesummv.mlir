module {
  func @gesummv(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg3: memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>, %arg4: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg5: memref<4096xf32, affine_map<(d0) -> (0, d0)>>, %arg6: memref<4096xf32, affine_map<(d0) -> (0, d0)>>) attributes {resource = #hls.r<lut=0, dsp=10, bram=0>, timing = #hls.t<0 -> 16842769, 16842769, 16842769>, top_func} {
    affine.for %arg7 = 0 to 4096 {
      affine.for %arg8 = 0 to 4096 {
        %0 = affine.load %arg2[%arg8, %arg7] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %1 = affine.load %arg5[%arg7] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg4[%arg8] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg4[%arg8] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %5 = affine.load %arg3[%arg8, %arg7] {partition_indices = [0, 0]} : memref<4096x4096xf32, affine_map<(d0, d1) -> (0, 0, d0, d1)>>
        %6 = arith.mulf %5, %1 : f32
        %7 = affine.load %arg6[%arg8] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
        %8 = arith.addf %6, %7 : f32
        affine.store %8, %arg6[%arg8] {partition_indices = [0]} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg7 = 0 to 4096 {
      %0 = affine.load %arg4[%arg7] {partition_indices = [0], timing = #hls.t<14 -> 16, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
      %1 = arith.mulf %arg0, %0 {timing = #hls.t<10 -> 14, 4, 1>} : f32
      %2 = arith.addf %arg1, %1 {timing = #hls.t<5 -> 10, 5, 1>} : f32
      %3 = affine.load %arg6[%arg7] {partition_indices = [0], timing = #hls.t<5 -> 7, 2, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
      %4 = arith.mulf %2, %3 {timing = #hls.t<1 -> 5, 4, 1>} : f32
      affine.store %4, %arg6[%arg7] {partition_indices = [0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096xf32, affine_map<(d0) -> (0, d0)>>
    } {loop_info = #hls.l<flattenTripCount=4096, iterLatency=16, minII=16>, parallel, resource = #hls.r<lut=0, dsp=5, bram=0>, timing = #hls.t<0 -> 65538, 65538, 65538>}
    return
  }
}