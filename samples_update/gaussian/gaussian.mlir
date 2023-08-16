module {
  func @gaussian(%arg0: f32, %arg1: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>, %arg2: memref<7xf32, affine_map<(d0) -> (0, d0)>>, %arg3: memref<7xf32, affine_map<(d0) -> (0, d0)>>, %arg4: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>, %arg5: memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>) attributes {resource = #hls.r<lut=0, dsp=45, bram=0>, timing = #hls.t<0 -> 79884097, 79884097, 79884097>, top_func} {
    affine.for %arg6 = 0 to 1363 {
      affine.for %arg7 = 0 to 1363 {
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3, 0] {partition_indices = [0, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3, 0] {partition_indices = [0, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3 + 1, 0] {partition_indices = [0, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3 + 1, 0] {partition_indices = [0, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3 + 2, 0] {partition_indices = [0, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3 + 2, 0] {partition_indices = [0, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3, 0] {partition_indices = [1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3, 0] {partition_indices = [1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3 + 1, 0] {partition_indices = [1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3 + 1, 0] {partition_indices = [1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3 + 2, 0] {partition_indices = [1, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3 + 2, 0] {partition_indices = [1, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3, 0] {partition_indices = [2, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3, 0] {partition_indices = [2, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3 + 1, 0] {partition_indices = [2, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3 + 1, 0] {partition_indices = [2, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3 + 2, 0] {partition_indices = [2, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3 + 2, 0] {partition_indices = [2, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3, 1] {partition_indices = [0, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3, 1] {partition_indices = [0, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3 + 1, 1] {partition_indices = [0, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3 + 1, 1] {partition_indices = [0, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3 + 2, 1] {partition_indices = [0, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3 + 2, 1] {partition_indices = [0, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3, 1] {partition_indices = [1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3, 1] {partition_indices = [1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3 + 1, 1] {partition_indices = [1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3 + 1, 1] {partition_indices = [1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3 + 2, 1] {partition_indices = [1, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3 + 2, 1] {partition_indices = [1, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3, 1] {partition_indices = [2, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3, 1] {partition_indices = [2, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3 + 1, 1] {partition_indices = [2, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3 + 1, 1] {partition_indices = [2, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3 + 2, 1] {partition_indices = [2, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3 + 2, 1] {partition_indices = [2, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3, 2] {partition_indices = [0, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3, 2] {partition_indices = [0, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3 + 1, 2] {partition_indices = [0, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3 + 1, 2] {partition_indices = [0, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3, %arg7 * 3 + 2, 2] {partition_indices = [0, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3, %arg7 * 3 + 2, 2] {partition_indices = [0, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3, 2] {partition_indices = [1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3, 2] {partition_indices = [1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3 + 1, 2] {partition_indices = [1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3 + 1, 2] {partition_indices = [1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 1, %arg7 * 3 + 2, 2] {partition_indices = [1, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 1, %arg7 * 3 + 2, 2] {partition_indices = [1, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3, 2] {partition_indices = [2, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3, 2] {partition_indices = [2, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3 + 1, 2] {partition_indices = [2, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3 + 1, 2] {partition_indices = [2, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg5[%arg6 * 3 + 2, %arg7 * 3 + 2, 2] {partition_indices = [2, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        affine.store %arg0, %arg1[%arg6 * 3 + 2, %arg7 * 3 + 2, 2] {partition_indices = [2, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
      } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    affine.for %arg6 = 0 to 7 {
      affine.for %arg7 = 0 to 1363 {
        affine.for %arg8 = 0 to 1363 {
          %0 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %1 = affine.load %arg2[%arg6] {partition_indices = [0]} : memref<7xf32, affine_map<(d0) -> (0, d0)>>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg5[%arg7 * 3, %arg8 * 3, 0] {partition_indices = [0, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg5[%arg7 * 3, %arg8 * 3, 0] {partition_indices = [0, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %5 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %6 = arith.mulf %5, %1 : f32
          %7 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + 1, 0] {partition_indices = [0, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %arg5[%arg7 * 3, %arg8 * 3 + 1, 0] {partition_indices = [0, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %9 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %10 = arith.mulf %9, %1 : f32
          %11 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + 2, 0] {partition_indices = [0, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %12 = arith.addf %10, %11 : f32
          affine.store %12, %arg5[%arg7 * 3, %arg8 * 3 + 2, 0] {partition_indices = [0, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %13 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %14 = arith.mulf %13, %1 : f32
          %15 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3, 0] {partition_indices = [1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %16 = arith.addf %14, %15 : f32
          affine.store %16, %arg5[%arg7 * 3 + 1, %arg8 * 3, 0] {partition_indices = [1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %17 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %18 = arith.mulf %17, %1 : f32
          %19 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + 1, 0] {partition_indices = [1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %20 = arith.addf %18, %19 : f32
          affine.store %20, %arg5[%arg7 * 3 + 1, %arg8 * 3 + 1, 0] {partition_indices = [1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %21 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %22 = arith.mulf %21, %1 : f32
          %23 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + 2, 0] {partition_indices = [1, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %24 = arith.addf %22, %23 : f32
          affine.store %24, %arg5[%arg7 * 3 + 1, %arg8 * 3 + 2, 0] {partition_indices = [1, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %25 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %26 = arith.mulf %25, %1 : f32
          %27 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3, 0] {partition_indices = [2, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %28 = arith.addf %26, %27 : f32
          affine.store %28, %arg5[%arg7 * 3 + 2, %arg8 * 3, 0] {partition_indices = [2, 0, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %29 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %30 = arith.mulf %29, %1 : f32
          %31 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + 1, 0] {partition_indices = [2, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %32 = arith.addf %30, %31 : f32
          affine.store %32, %arg5[%arg7 * 3 + 2, %arg8 * 3 + 1, 0] {partition_indices = [2, 1, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %33 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %34 = arith.mulf %33, %1 : f32
          %35 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + 2, 0] {partition_indices = [2, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %36 = arith.addf %34, %35 : f32
          affine.store %36, %arg5[%arg7 * 3 + 2, %arg8 * 3 + 2, 0] {partition_indices = [2, 2, 0]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %37 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %38 = arith.mulf %37, %1 : f32
          %39 = affine.load %arg5[%arg7 * 3, %arg8 * 3, 1] {partition_indices = [0, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %40 = arith.addf %38, %39 : f32
          affine.store %40, %arg5[%arg7 * 3, %arg8 * 3, 1] {partition_indices = [0, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %41 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %42 = arith.mulf %41, %1 : f32
          %43 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + 1, 1] {partition_indices = [0, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %44 = arith.addf %42, %43 : f32
          affine.store %44, %arg5[%arg7 * 3, %arg8 * 3 + 1, 1] {partition_indices = [0, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %45 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %46 = arith.mulf %45, %1 : f32
          %47 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + 2, 1] {partition_indices = [0, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %48 = arith.addf %46, %47 : f32
          affine.store %48, %arg5[%arg7 * 3, %arg8 * 3 + 2, 1] {partition_indices = [0, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %49 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %50 = arith.mulf %49, %1 : f32
          %51 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3, 1] {partition_indices = [1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %52 = arith.addf %50, %51 : f32
          affine.store %52, %arg5[%arg7 * 3 + 1, %arg8 * 3, 1] {partition_indices = [1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %53 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %54 = arith.mulf %53, %1 : f32
          %55 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + 1, 1] {partition_indices = [1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %56 = arith.addf %54, %55 : f32
          affine.store %56, %arg5[%arg7 * 3 + 1, %arg8 * 3 + 1, 1] {partition_indices = [1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %57 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %58 = arith.mulf %57, %1 : f32
          %59 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + 2, 1] {partition_indices = [1, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %60 = arith.addf %58, %59 : f32
          affine.store %60, %arg5[%arg7 * 3 + 1, %arg8 * 3 + 2, 1] {partition_indices = [1, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %61 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %62 = arith.mulf %61, %1 : f32
          %63 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3, 1] {partition_indices = [2, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %64 = arith.addf %62, %63 : f32
          affine.store %64, %arg5[%arg7 * 3 + 2, %arg8 * 3, 1] {partition_indices = [2, 0, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %65 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %66 = arith.mulf %65, %1 : f32
          %67 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + 1, 1] {partition_indices = [2, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %68 = arith.addf %66, %67 : f32
          affine.store %68, %arg5[%arg7 * 3 + 2, %arg8 * 3 + 1, 1] {partition_indices = [2, 1, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %69 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %70 = arith.mulf %69, %1 : f32
          %71 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + 2, 1] {partition_indices = [2, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %72 = arith.addf %70, %71 : f32
          affine.store %72, %arg5[%arg7 * 3 + 2, %arg8 * 3 + 2, 1] {partition_indices = [2, 2, 1]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %73 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %74 = arith.mulf %73, %1 : f32
          %75 = affine.load %arg5[%arg7 * 3, %arg8 * 3, 2] {partition_indices = [0, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %76 = arith.addf %74, %75 : f32
          affine.store %76, %arg5[%arg7 * 3, %arg8 * 3, 2] {partition_indices = [0, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %77 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %78 = arith.mulf %77, %1 : f32
          %79 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + 1, 2] {partition_indices = [0, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %80 = arith.addf %78, %79 : f32
          affine.store %80, %arg5[%arg7 * 3, %arg8 * 3 + 1, 2] {partition_indices = [0, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %81 = affine.load %arg4[%arg7 * 3 + %arg6, %arg8 * 3 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %82 = arith.mulf %81, %1 : f32
          %83 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + 2, 2] {partition_indices = [0, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %84 = arith.addf %82, %83 : f32
          affine.store %84, %arg5[%arg7 * 3, %arg8 * 3 + 2, 2] {partition_indices = [0, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %85 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %86 = arith.mulf %85, %1 : f32
          %87 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3, 2] {partition_indices = [1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %88 = arith.addf %86, %87 : f32
          affine.store %88, %arg5[%arg7 * 3 + 1, %arg8 * 3, 2] {partition_indices = [1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %89 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %90 = arith.mulf %89, %1 : f32
          %91 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + 1, 2] {partition_indices = [1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %92 = arith.addf %90, %91 : f32
          affine.store %92, %arg5[%arg7 * 3 + 1, %arg8 * 3 + 1, 2] {partition_indices = [1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %93 = affine.load %arg4[%arg7 * 3 + %arg6 + 1, %arg8 * 3 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %94 = arith.mulf %93, %1 : f32
          %95 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + 2, 2] {partition_indices = [1, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %96 = arith.addf %94, %95 : f32
          affine.store %96, %arg5[%arg7 * 3 + 1, %arg8 * 3 + 2, 2] {partition_indices = [1, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %97 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %98 = arith.mulf %97, %1 : f32
          %99 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3, 2] {partition_indices = [2, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %100 = arith.addf %98, %99 : f32
          affine.store %100, %arg5[%arg7 * 3 + 2, %arg8 * 3, 2] {partition_indices = [2, 0, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %101 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %102 = arith.mulf %101, %1 : f32
          %103 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + 1, 2] {partition_indices = [2, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %104 = arith.addf %102, %103 : f32
          affine.store %104, %arg5[%arg7 * 3 + 2, %arg8 * 3 + 1, 2] {partition_indices = [2, 1, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %105 = affine.load %arg4[%arg7 * 3 + %arg6 + 2, %arg8 * 3 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [-1, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %106 = arith.mulf %105, %1 : f32
          %107 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + 2, 2] {partition_indices = [2, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %108 = arith.addf %106, %107 : f32
          affine.store %108, %arg5[%arg7 * 3 + 2, %arg8 * 3 + 2, 2] {partition_indices = [2, 2, 2]} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, parallel}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, parallel}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg6 = 0 to 7 {
      affine.for %arg7 = 0 to 1363 {
        affine.for %arg8 = 0 to 1363 {
          %0 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6, 0] {max_mux_size = 3 : i64, partition_indices = [0, -1, 0], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %1 = affine.load %arg3[%arg6] {partition_indices = [0], timing = #hls.t<10 -> 12, 2, 1>} : memref<7xf32, affine_map<(d0) -> (0, d0)>>
          %2 = arith.mulf %0, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %3 = affine.load %arg1[%arg7 * 3, %arg8 * 3, 0] {partition_indices = [0, 0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %4 = arith.addf %2, %3 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %4, %arg1[%arg7 * 3, %arg8 * 3, 0] {partition_indices = [0, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %5 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [0, -1, 0], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %6 = arith.mulf %5, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %7 = affine.load %arg1[%arg7 * 3, %arg8 * 3 + 1, 0] {partition_indices = [0, 1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %8 = arith.addf %6, %7 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %8, %arg1[%arg7 * 3, %arg8 * 3 + 1, 0] {partition_indices = [0, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %9 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [0, -1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %10 = arith.mulf %9, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %11 = affine.load %arg1[%arg7 * 3, %arg8 * 3 + 2, 0] {partition_indices = [0, 2, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %12 = arith.addf %10, %11 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %12, %arg1[%arg7 * 3, %arg8 * 3 + 2, 0] {partition_indices = [0, 2, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %13 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6, 0] {max_mux_size = 3 : i64, partition_indices = [1, -1, 0], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %14 = arith.mulf %13, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %15 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3, 0] {partition_indices = [1, 0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %16 = arith.addf %14, %15 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %16, %arg1[%arg7 * 3 + 1, %arg8 * 3, 0] {partition_indices = [1, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %17 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [1, -1, 0], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %18 = arith.mulf %17, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %19 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3 + 1, 0] {partition_indices = [1, 1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %20 = arith.addf %18, %19 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %20, %arg1[%arg7 * 3 + 1, %arg8 * 3 + 1, 0] {partition_indices = [1, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %21 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [1, -1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %22 = arith.mulf %21, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %23 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3 + 2, 0] {partition_indices = [1, 2, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %24 = arith.addf %22, %23 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %24, %arg1[%arg7 * 3 + 1, %arg8 * 3 + 2, 0] {partition_indices = [1, 2, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %25 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6, 0] {max_mux_size = 3 : i64, partition_indices = [2, -1, 0], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %26 = arith.mulf %25, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %27 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3, 0] {partition_indices = [2, 0, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %28 = arith.addf %26, %27 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %28, %arg1[%arg7 * 3 + 2, %arg8 * 3, 0] {partition_indices = [2, 0, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %29 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6 + 1, 0] {max_mux_size = 3 : i64, partition_indices = [2, -1, 0], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %30 = arith.mulf %29, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %31 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3 + 1, 0] {partition_indices = [2, 1, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %32 = arith.addf %30, %31 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %32, %arg1[%arg7 * 3 + 2, %arg8 * 3 + 1, 0] {partition_indices = [2, 1, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %33 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6 + 2, 0] {max_mux_size = 3 : i64, partition_indices = [2, -1, 0], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %34 = arith.mulf %33, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %35 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3 + 2, 0] {partition_indices = [2, 2, 0], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %36 = arith.addf %34, %35 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %36, %arg1[%arg7 * 3 + 2, %arg8 * 3 + 2, 0] {partition_indices = [2, 2, 0], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %37 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6, 1] {max_mux_size = 3 : i64, partition_indices = [0, -1, 1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %38 = arith.mulf %37, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %39 = affine.load %arg1[%arg7 * 3, %arg8 * 3, 1] {partition_indices = [0, 0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %40 = arith.addf %38, %39 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %40, %arg1[%arg7 * 3, %arg8 * 3, 1] {partition_indices = [0, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %41 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [0, -1, 1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %42 = arith.mulf %41, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %43 = affine.load %arg1[%arg7 * 3, %arg8 * 3 + 1, 1] {partition_indices = [0, 1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %44 = arith.addf %42, %43 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %44, %arg1[%arg7 * 3, %arg8 * 3 + 1, 1] {partition_indices = [0, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %45 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [0, -1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %46 = arith.mulf %45, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %47 = affine.load %arg1[%arg7 * 3, %arg8 * 3 + 2, 1] {partition_indices = [0, 2, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %48 = arith.addf %46, %47 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %48, %arg1[%arg7 * 3, %arg8 * 3 + 2, 1] {partition_indices = [0, 2, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %49 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6, 1] {max_mux_size = 3 : i64, partition_indices = [1, -1, 1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %50 = arith.mulf %49, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %51 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3, 1] {partition_indices = [1, 0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %52 = arith.addf %50, %51 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %52, %arg1[%arg7 * 3 + 1, %arg8 * 3, 1] {partition_indices = [1, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %53 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [1, -1, 1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %54 = arith.mulf %53, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %55 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3 + 1, 1] {partition_indices = [1, 1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %56 = arith.addf %54, %55 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %56, %arg1[%arg7 * 3 + 1, %arg8 * 3 + 1, 1] {partition_indices = [1, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %57 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [1, -1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %58 = arith.mulf %57, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %59 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3 + 2, 1] {partition_indices = [1, 2, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %60 = arith.addf %58, %59 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %60, %arg1[%arg7 * 3 + 1, %arg8 * 3 + 2, 1] {partition_indices = [1, 2, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %61 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6, 1] {max_mux_size = 3 : i64, partition_indices = [2, -1, 1], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %62 = arith.mulf %61, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %63 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3, 1] {partition_indices = [2, 0, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %64 = arith.addf %62, %63 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %64, %arg1[%arg7 * 3 + 2, %arg8 * 3, 1] {partition_indices = [2, 0, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %65 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6 + 1, 1] {max_mux_size = 3 : i64, partition_indices = [2, -1, 1], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %66 = arith.mulf %65, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %67 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3 + 1, 1] {partition_indices = [2, 1, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %68 = arith.addf %66, %67 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %68, %arg1[%arg7 * 3 + 2, %arg8 * 3 + 1, 1] {partition_indices = [2, 1, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %69 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6 + 2, 1] {max_mux_size = 3 : i64, partition_indices = [2, -1, 1], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %70 = arith.mulf %69, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %71 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3 + 2, 1] {partition_indices = [2, 2, 1], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %72 = arith.addf %70, %71 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %72, %arg1[%arg7 * 3 + 2, %arg8 * 3 + 2, 1] {partition_indices = [2, 2, 1], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %73 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6, 2] {max_mux_size = 3 : i64, partition_indices = [0, -1, 2], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %74 = arith.mulf %73, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %75 = affine.load %arg1[%arg7 * 3, %arg8 * 3, 2] {partition_indices = [0, 0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %76 = arith.addf %74, %75 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %76, %arg1[%arg7 * 3, %arg8 * 3, 2] {partition_indices = [0, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %77 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [0, -1, 2], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %78 = arith.mulf %77, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %79 = affine.load %arg1[%arg7 * 3, %arg8 * 3 + 1, 2] {partition_indices = [0, 1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %80 = arith.addf %78, %79 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %80, %arg1[%arg7 * 3, %arg8 * 3 + 1, 2] {partition_indices = [0, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %81 = affine.load %arg5[%arg7 * 3, %arg8 * 3 + %arg6 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [0, -1, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %82 = arith.mulf %81, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %83 = affine.load %arg1[%arg7 * 3, %arg8 * 3 + 2, 2] {partition_indices = [0, 2, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %84 = arith.addf %82, %83 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %84, %arg1[%arg7 * 3, %arg8 * 3 + 2, 2] {partition_indices = [0, 2, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %85 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6, 2] {max_mux_size = 3 : i64, partition_indices = [1, -1, 2], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %86 = arith.mulf %85, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %87 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3, 2] {partition_indices = [1, 0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %88 = arith.addf %86, %87 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %88, %arg1[%arg7 * 3 + 1, %arg8 * 3, 2] {partition_indices = [1, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %89 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [1, -1, 2], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %90 = arith.mulf %89, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %91 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3 + 1, 2] {partition_indices = [1, 1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %92 = arith.addf %90, %91 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %92, %arg1[%arg7 * 3 + 1, %arg8 * 3 + 1, 2] {partition_indices = [1, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %93 = affine.load %arg5[%arg7 * 3 + 1, %arg8 * 3 + %arg6 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [1, -1, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %94 = arith.mulf %93, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %95 = affine.load %arg1[%arg7 * 3 + 1, %arg8 * 3 + 2, 2] {partition_indices = [1, 2, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %96 = arith.addf %94, %95 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %96, %arg1[%arg7 * 3 + 1, %arg8 * 3 + 2, 2] {partition_indices = [1, 2, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %97 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6, 2] {max_mux_size = 3 : i64, partition_indices = [2, -1, 2], timing = #hls.t<12 -> 14, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %98 = arith.mulf %97, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %99 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3, 2] {partition_indices = [2, 0, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %100 = arith.addf %98, %99 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %100, %arg1[%arg7 * 3 + 2, %arg8 * 3, 2] {partition_indices = [2, 0, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %101 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6 + 1, 2] {max_mux_size = 3 : i64, partition_indices = [2, -1, 2], timing = #hls.t<11 -> 13, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %102 = arith.mulf %101, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %103 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3 + 1, 2] {partition_indices = [2, 1, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %104 = arith.addf %102, %103 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %104, %arg1[%arg7 * 3 + 2, %arg8 * 3 + 1, 2] {partition_indices = [2, 1, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %105 = affine.load %arg5[%arg7 * 3 + 2, %arg8 * 3 + %arg6 + 2, 2] {max_mux_size = 3 : i64, partition_indices = [2, -1, 2], timing = #hls.t<10 -> 12, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %106 = arith.mulf %105, %1 {timing = #hls.t<6 -> 10, 4, 1>} : f32
          %107 = affine.load %arg1[%arg7 * 3 + 2, %arg8 * 3 + 2, 2] {partition_indices = [2, 2, 2], timing = #hls.t<6 -> 8, 2, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
          %108 = arith.addf %106, %107 {timing = #hls.t<1 -> 6, 5, 1>} : f32
          affine.store %108, %arg1[%arg7 * 3 + 2, %arg8 * 3 + 2, 2] {partition_indices = [2, 2, 2], timing = #hls.t<0 -> 1, 1, 1>} : memref<4096x4096x3xf32, affine_map<(d0, d1, d2) -> (d0 mod 3, d1 mod 3, d2 mod 3, d0 floordiv 3, d1 floordiv 3, d2 floordiv 3)>>
        } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>, loop_info = #hls.l<flattenTripCount=1363, iterLatency=14, minII=3>, parallel, timing = #hls.t<0 -> 4102, 4102, 4102>}
      } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=1857769, iterLatency=14, minII=3>, parallel, timing = #hls.t<0 -> 5573320, 5573320, 5573320>}
    } {loop_directive = #hls.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>, loop_info = #hls.l<flattenTripCount=13004383, iterLatency=14, minII=3>, resource = #hls.r<lut=0, dsp=45, bram=0>, timing = #hls.t<0 -> 39013162, 39013162, 39013162>}
    return
  }
}