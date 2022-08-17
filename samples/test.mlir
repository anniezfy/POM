module {
  func @test(%arg0: f32, %arg1: memref<4096x4096xf32>) attributes {top_func} {
    affine.for %arg2 = 0 to 4096 {
      affine.for %arg3 = 1 to 4096 {
        affine.for %arg4 = 1 to 4096 {
          %0 = affine.load %arg1[%arg3 - 1, %arg4 - 1] : memref<4096x4096xf32>
          %1 = affine.load %arg1[%arg3 - 1, %arg4] : memref<4096x4096xf32>
          %2 = arith.addf %0, %1 : f32
          %3 = arith.mulf %2, %arg0 : f32
          affine.store %3, %arg1[%arg3, %arg4] : memref<4096x4096xf32>
        }
      }
    } {loop_directive = #hls.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
}