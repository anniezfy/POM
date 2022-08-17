module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func @test_gemm(%arg0: f32, %arg1: f32, %arg2: memref<32x32xf32>, %arg3: memref<32x32xf32>, %arg4: memref<32x32xf32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg2[%arg5, %arg6] : memref<32x32xf32>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg2[%arg5, %arg6] : memref<32x32xf32>
      } {loop_directive = #hlscpp.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    } {loop_directive = #hlscpp.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    affine.for %arg5 = 0 to 32 {
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg2[%arg5, %arg6] : memref<32x32xf32>
        %1 = arith.mulf %0, %arg1 : f32
        affine.store %1, %arg2[%arg5, %arg6] : memref<32x32xf32>
        affine.for %arg7 = 0 to 32 {
          %2 = affine.load %arg3[%arg5, %arg7] : memref<32x32xf32>
          %3 = arith.mulf %arg0, %2 : f32
          %4 = affine.load %arg4[%arg7, %arg6] : memref<32x32xf32>
          %5 = arith.mulf %3, %4 : f32
          %6 = affine.load %arg2[%arg5, %arg6] : memref<32x32xf32>
          %7 = arith.addf %6, %5 : f32
          affine.store %7, %arg2[%arg5, %arg6] : memref<32x32xf32>
        }{loop_directive = #hlscpp.ld<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }{loop_directive = #hlscpp.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    }{loop_directive = #hlscpp.ld<pipeline=false, targetII=1, dataflow=false, flatten=true>}
    return
  }
}