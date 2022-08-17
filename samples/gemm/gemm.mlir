"builtin.module"() ({
  "func.func"() ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: memref<4096x4096xf32>, %arg3: memref<4096x4096xf32>, %arg4: memref<4096x4096xf32>, %arg5: memref<4096x4096xf32>, %arg6: memref<4096x4096xf32>):
    "affine.for"() ({
    ^bb0(%arg7: index):
      "affine.for"() ({
      ^bb0(%arg8: index):
        %0 = "affine.load"(%arg4, %arg7, %arg8) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<4096x4096xf32>, index, index) -> f32
        %1 = "arith.mulf"(%0, %arg1) : (f32, f32) -> f32
        "affine.store"(%1, %arg4, %arg7, %arg8) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<4096x4096xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4096)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4096)>} : () -> ()
    "affine.for"() ({
    ^bb0(%arg7: index):
      "affine.for"() ({
      ^bb0(%arg8: index):
        "affine.for"() ({
        ^bb0(%arg9: index):
          %2 = "affine.load"(%arg2, %arg7, %arg7) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<4096x4096xf32>, index, index) -> f32
          %3 = "arith.mulf"(%arg0, %2) : (f32, f32) -> f32
          %4 = "affine.load"(%arg3, %arg7, %arg8) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<4096x4096xf32>, index, index) -> f32
          %5 = "arith.mulf"(%4, %3) : (f32, f32) -> f32
          %6 = "affine.load"(%arg4, %arg7, %arg8) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<4096x4096xf32>, index, index) -> f32
          %7 = "arith.addf"(%3, %6) : (f32, f32) -> f32
          "affine.store"(%7, %arg4, %arg7, %arg8) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<4096x4096xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4096)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4096)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4096)>} : () -> ()
    "func.return"() : () -> ()
  }) {function_type = (f32, f32, memref<4096x4096xf32>, memref<4096x4096xf32>, memref<4096x4096xf32>, memref<4096x4096xf32>, memref<4096x4096xf32>) -> (), sym_name = "gemm", top_func} : () -> ()
}) : () -> ()