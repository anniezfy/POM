"builtin.module"() ({
  "func.func"() ({
  ^bb0(%arg0: f32, %arg1: memref<1024xf32>, %arg2: memref<1024xf32>):
    "affine.for"() ({
    ^bb0(%arg3: index):
      "affine.for"() ({
      ^bb0(%arg4: index):
        %0 = "affine.load"(%arg1, %arg4) {map = affine_map<(d0) -> (d0 - 1)>, partition_indices = [0], timing = #hls.t<0 -> 2, 2, 1>} : (memref<1024xf32>, index) -> f32
        %1 = "affine.load"(%arg1, %arg4) {map = affine_map<(d0) -> (d0)>, partition_indices = [0], timing = #hls.t<1 -> 3, 2, 1>} : (memref<1024xf32>, index) -> f32
        %2 = "arith.addf"(%0, %1) {timing = #hls.t<3 -> 8, 5, 1>} : (f32, f32) -> f32
        %3 = "affine.load"(%arg1, %arg4) {map = affine_map<(d0) -> (d0 + 1)>, partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : (memref<1024xf32>, index) -> f32
        %4 = "arith.addf"(%3, %2) {timing = #hls.t<8 -> 13, 5, 1>} : (f32, f32) -> f32
        %5 = "arith.mulf"(%4, %arg0) {timing = #hls.t<13 -> 17, 4, 1>} : (f32, f32) -> f32
        "affine.store"(%5, %arg2, %arg4) {map = affine_map<(d0) -> (d0)>, partition_indices = [0], timing = #hls.t<17 -> 18, 1, 1>} : (f32, memref<1024xf32>, index) -> ()
        "affine.yield"() {timing = #hls.t<18 -> 18, 0, 0>} : () -> ()
      }) {loop_info = #hls.l<flattenTripCount=1022, iterLatency=18, minII=18>, lower_bound = affine_map<() -> (1)>, step = 1 : index, timing = #hls.t<0 -> 18398, 18398, 18398>, upper_bound = affine_map<() -> (1023)>} : () -> ()
      "affine.for"() ({
      ^bb0(%arg4: index):
        %0 = "affine.load"(%arg2, %arg4) {map = affine_map<(d0) -> (d0 - 1)>, partition_indices = [0], timing = #hls.t<0 -> 2, 2, 1>} : (memref<1024xf32>, index) -> f32
        %1 = "affine.load"(%arg2, %arg4) {map = affine_map<(d0) -> (d0)>, partition_indices = [0], timing = #hls.t<1 -> 3, 2, 1>} : (memref<1024xf32>, index) -> f32
        %2 = "arith.addf"(%0, %1) {timing = #hls.t<3 -> 8, 5, 1>} : (f32, f32) -> f32
        %3 = "affine.load"(%arg2, %arg4) {map = affine_map<(d0) -> (d0 + 1)>, partition_indices = [0], timing = #hls.t<6 -> 8, 2, 1>} : (memref<1024xf32>, index) -> f32
        %4 = "arith.addf"(%3, %2) {timing = #hls.t<8 -> 13, 5, 1>} : (f32, f32) -> f32
        %5 = "arith.mulf"(%4, %arg0) {timing = #hls.t<13 -> 17, 4, 1>} : (f32, f32) -> f32
        "affine.store"(%5, %arg1, %arg4) {map = affine_map<(d0) -> (d0)>, partition_indices = [0], timing = #hls.t<17 -> 18, 1, 1>} : (f32, memref<1024xf32>, index) -> ()
        "affine.yield"() {timing = #hls.t<18 -> 18, 0, 0>} : () -> ()
      }) {loop_info = #hls.l<flattenTripCount=1022, iterLatency=18, minII=18>, lower_bound = affine_map<() -> (1)>, step = 1 : index, timing = #hls.t<18398 -> 36796, 18398, 18398>, upper_bound = affine_map<() -> (1023)>} : () -> ()
      "affine.yield"() {timing = #hls.t<36796 -> 36796, 0, 0>} : () -> ()
    }) {loop_info = #hls.l<flattenTripCount=1024, iterLatency=36796, minII=36796>, lower_bound = affine_map<() -> (0)>, step = 1 : index, timing = #hls.t<0 -> 37679106, 37679106, 37679106>, upper_bound = affine_map<() -> (1024)>} : () -> ()
    "func.return"() {timing = #hls.t<37679106 -> 37679106, 0, 0>} : () -> ()
  }) {function_type = (f32, memref<1024xf32>, memref<1024xf32>) -> (), resource = #hls.r<lut=0, dsp=5, bram=0>, sym_name = "jacobi_1d", timing = #hls.t<0 -> 37679108, 37679108, 37679108>, top_func} : () -> ()
}) : () -> ()