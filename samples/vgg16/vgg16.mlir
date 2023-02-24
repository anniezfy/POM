"builtin.module"() ({
  "func.func"() ({
  ^bb0(%arg0: f32, %arg1: memref<64x32x32x32xf32>, %arg2: memref<64x3x3x3xf32>, %arg3: memref<3x34x34xf32>, %arg4: memref<64x34x34xf32>, %arg5: memref<64x32x32xf32>, %arg6: memref<3x32x32xf32>):
    "affine.for"() ({
    ^bb0(%arg7: index):
      "affine.for"() ({
      ^bb0(%arg8: index):
        "affine.for"() ({
        ^bb0(%arg9: index):
          "affine.store"(%arg0, %arg3, %arg7, %arg8, %arg9) {map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>} : (f32, memref<3x34x34xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (34)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (34)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (64)>} : () -> ()
    "affine.for"() ({
    ^bb0(%arg7: index):
      "affine.for"() ({
      ^bb0(%arg8: index):
        "affine.for"() ({
        ^bb0(%arg9: index):
          %0 = "affine.load"(%arg6, %arg7, %arg8, %arg9) {map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>} : (memref<3x32x32xf32>, index, index, index) -> f32
          "affine.store"(%0, %arg3, %arg7, %arg8, %arg9) {map = affine_map<(d0, d1, d2) -> (d1 + 1, d2 + 1)>} : (f32, memref<3x34x34xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (64)>} : () -> ()
    "affine.for"() ({
    ^bb0(%arg7: index):
      "affine.for"() ({
      ^bb0(%arg8: index):
        "affine.for"() ({
        ^bb0(%arg9: index):
          "affine.for"() ({
          ^bb0(%arg10: index):
            "affine.store"(%arg0, %arg1, %arg7, %arg8, %arg9, %arg10) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<64x32x32x32xf32>, index, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (64)>} : () -> ()
    "affine.for"() ({
    ^bb0(%arg7: index):
      "affine.for"() ({
      ^bb0(%arg8: index):
        "affine.for"() ({
        ^bb0(%arg9: index):
          "affine.for"() ({
          ^bb0(%arg10: index):
            "affine.for"() ({
            ^bb0(%arg11: index):
              "affine.for"() ({
              ^bb0(%arg12: index):
                %0 = "affine.load"(%arg2, %arg7, %arg10, %arg11, %arg12) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<64x3x3x3xf32>, index, index, index, index) -> f32
                %1 = "affine.load"(%arg3, %arg10, %arg8, %arg11, %arg9, %arg12) {map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d2, d3 + d4)>} : (memref<3x34x34xf32>, index, index, index, index, index) -> f32
                %2 = "arith.mulf"(%0, %1) : (f32, f32) -> f32
                %3 = "affine.load"(%arg1, %arg7, %arg8, %arg9, %arg12) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<64x32x32x32xf32>, index, index, index, index) -> f32
                %4 = "arith.addf"(%2, %3) : (f32, f32) -> f32
                "affine.store"(%4, %arg1, %arg7, %arg8, %arg9, %arg12) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<64x32x32x32xf32>, index, index, index, index) -> ()
                "affine.yield"() : () -> ()
              }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
              "affine.yield"() : () -> ()
            }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
            "affine.yield"() : () -> ()
          }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, parallel, step = 1 : index, upper_bound = affine_map<() -> (64)>} : () -> ()
    "func.return"() : () -> ()
  }) {function_type = (f32, memref<64x32x32x32xf32>, memref<64x3x3x3xf32>, memref<3x34x34xf32>, memref<64x34x34xf32>, memref<64x32x32xf32>, memref<3x32x32xf32>) -> (), sym_name = "vgg16", top_func} : () -> ()
}) : () -> ()