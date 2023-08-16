module {
  func @vgg16(%arg0: f32, %arg1: memref<64x3x3x3xf32>, %arg2: memref<64x64x3x3xf32>, %arg3: memref<128x64x3x3xf32>, %arg4: memref<128x128x3x3xf32>, %arg5: memref<256x128x3x3xf32>, %arg6: memref<256x256x3x3xf32>, %arg7: memref<512x256x3x3xf32>, %arg8: memref<512x512x3x3xf32>, %arg9: memref<512x512x3x3xf32>, %arg10: memref<64x32x32xf32>, %arg11: memref<256x4x4xf32>, %arg12: memref<512x4x4xf32>, %arg13: memref<512x8x8xf32>, %arg14: memref<512x8x8xf32>, %arg15: memref<512x2x2xf32>, %arg16: memref<512x2x2xf32>, %arg17: memref<512x2x2xf32>, %arg18: memref<512x2x2xf32>, %arg19: memref<512xf32>, %arg20: memref<64x32x32xf32>, %arg21: memref<64x16x16xf32>, %arg22: memref<128x16x16xf32>, %arg23: memref<128x16x16xf32>, %arg24: memref<128x8x8xf32>, %arg25: memref<256x8x8xf32>, %arg26: memref<256x8x8xf32>, %arg27: memref<256x8x8xf32>, %arg28: memref<3x34x34xf32>) attributes {top_func} {
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 32 {
        affine.for %arg31 = 0 to 32 {
          affine.store %arg0, %arg10[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 32 {
        affine.for %arg31 = 0 to 32 {
          affine.for %arg32 = 0 to 3 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg28[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<3x34x34xf32>
                %1 = affine.load %arg1[%arg29, %arg32, %arg33, %arg34] : memref<64x3x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg10[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg10[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 32 {
        affine.for %arg31 = 0 to 32 {
          %0 = affine.load %arg10[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
          affine.store %0, %arg10[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 32 {
        affine.for %arg31 = 0 to 32 {
          affine.store %arg0, %arg20[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 32 {
        affine.for %arg31 = 0 to 32 {
          affine.for %arg32 = 0 to 64 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg10[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<64x32x32xf32>
                %1 = affine.load %arg2[%arg29, %arg32, %arg33, %arg34] : memref<64x64x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg20[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg20[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 32 {
        affine.for %arg31 = 0 to 32 {
          %0 = affine.load %arg20[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
          affine.store %0, %arg20[%arg29, %arg30, %arg31] : memref<64x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          affine.store %arg0, %arg21[%arg29, %arg30, %arg31] : memref<64x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 64 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          affine.for %arg32 = 0 to 3 {
            affine.for %arg33 = 0 to 3 {
              %0 = affine.load %arg20[%arg29, %arg30 * 2 + %arg32, %arg31 * 2 + %arg33] : memref<64x32x32xf32>
              affine.store %0, %arg21[%arg29, %arg30, %arg31] : memref<64x16x16xf32>
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          affine.store %arg0, %arg22[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          affine.for %arg32 = 0 to 64 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg21[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<64x16x16xf32>
                %1 = affine.load %arg3[%arg29, %arg32, %arg33, %arg34] : memref<128x64x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg22[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg22[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          %0 = affine.load %arg22[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
          affine.store %0, %arg22[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          affine.store %arg0, %arg23[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          affine.for %arg32 = 0 to 128 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg22[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<128x16x16xf32>
                %1 = affine.load %arg4[%arg29, %arg32, %arg33, %arg34] : memref<128x128x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg23[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg23[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 16 {
        affine.for %arg31 = 0 to 16 {
          %0 = affine.load %arg23[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
          affine.store %0, %arg23[%arg29, %arg30, %arg31] : memref<128x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.store %arg0, %arg24[%arg29, %arg30, %arg31] : memref<128x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 128 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.for %arg32 = 0 to 3 {
            affine.for %arg33 = 0 to 3 {
              %0 = affine.load %arg23[%arg29, %arg30 * 2 + %arg32, %arg31 * 2 + %arg33] : memref<128x16x16xf32>
              affine.store %0, %arg24[%arg29, %arg30, %arg31] : memref<128x8x8xf32>
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.store %arg0, %arg25[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.for %arg32 = 0 to 128 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg24[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<128x8x8xf32>
                %1 = affine.load %arg5[%arg29, %arg32, %arg33, %arg34] : memref<256x128x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg25[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg25[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          %0 = affine.load %arg25[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
          affine.store %0, %arg25[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.store %arg0, %arg26[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.for %arg32 = 0 to 256 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg25[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<256x8x8xf32>
                %1 = affine.load %arg6[%arg29, %arg32, %arg33, %arg34] : memref<256x256x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg26[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg26[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          %0 = affine.load %arg26[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
          affine.store %0, %arg26[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.store %arg0, %arg27[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          affine.for %arg32 = 0 to 256 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg26[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<256x8x8xf32>
                %1 = affine.load %arg6[%arg29, %arg32, %arg33, %arg34] : memref<256x256x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg27[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg27[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 8 {
        affine.for %arg31 = 0 to 8 {
          %0 = affine.load %arg27[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
          affine.store %0, %arg27[%arg29, %arg30, %arg31] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.store %arg0, %arg11[%arg29, %arg30, %arg31] : memref<256x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 256 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.for %arg32 = 0 to 3 {
            affine.for %arg33 = 0 to 3 {
              %0 = affine.load %arg27[%arg29, %arg30 * 2 + %arg32, %arg31 * 2 + %arg33] : memref<256x8x8xf32>
              affine.store %0, %arg11[%arg29, %arg30, %arg31] : memref<256x4x4xf32>
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.store %arg0, %arg12[%arg29, %arg30, %arg31] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.for %arg32 = 0 to 256 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg11[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<256x4x4xf32>
                %1 = affine.load %arg7[%arg29, %arg32, %arg33, %arg34] : memref<512x256x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg12[%arg29, %arg30, %arg31] : memref<512x4x4xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg12[%arg29, %arg30, %arg31] : memref<512x4x4xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          %0 = affine.load %arg12[%arg29, %arg30, %arg31] : memref<512x4x4xf32>
          affine.store %0, %arg12[%arg29, %arg30, %arg31] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.store %arg0, %arg13[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.for %arg32 = 0 to 512 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg12[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<512x4x4xf32>
                %1 = affine.load %arg8[%arg29, %arg32, %arg33, %arg34] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg13[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg13[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          %0 = affine.load %arg13[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
          affine.store %0, %arg13[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.store %arg0, %arg14[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          affine.for %arg32 = 0 to 512 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg13[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<512x8x8xf32>
                %1 = affine.load %arg8[%arg29, %arg32, %arg33, %arg34] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg14[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg14[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 4 {
        affine.for %arg31 = 0 to 4 {
          %0 = affine.load %arg14[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
          affine.store %0, %arg14[%arg29, %arg30, %arg31] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.store %arg0, %arg15[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.for %arg32 = 0 to 3 {
            affine.for %arg33 = 0 to 3 {
              %0 = affine.load %arg14[%arg29, %arg30 * 2 + %arg32, %arg31 * 2 + %arg33] : memref<512x8x8xf32>
              affine.store %0, %arg15[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.store %arg0, %arg16[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.for %arg32 = 0 to 512 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg15[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<512x2x2xf32>
                %1 = affine.load %arg9[%arg29, %arg32, %arg33, %arg34] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg16[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg16[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          %0 = affine.load %arg16[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
          affine.store %0, %arg16[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.store %arg0, %arg17[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.for %arg32 = 0 to 512 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg16[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<512x2x2xf32>
                %1 = affine.load %arg9[%arg29, %arg32, %arg33, %arg34] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg17[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg17[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          %0 = affine.load %arg17[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
          affine.store %0, %arg17[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.store %arg0, %arg18[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          affine.for %arg32 = 0 to 512 {
            affine.for %arg33 = 0 to 3 {
              affine.for %arg34 = 0 to 3 {
                %0 = affine.load %arg17[%arg32, %arg30 + %arg33, %arg31 + %arg34] : memref<512x2x2xf32>
                %1 = affine.load %arg9[%arg29, %arg32, %arg33, %arg34] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg18[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg18[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 2 {
        affine.for %arg31 = 0 to 2 {
          %0 = affine.load %arg18[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
          affine.store %0, %arg18[%arg29, %arg30, %arg31] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.store %arg0, %arg19[%arg29] : memref<512xf32>
    } {parallel}
    affine.for %arg29 = 0 to 512 {
      affine.for %arg30 = 0 to 3 {
        affine.for %arg31 = 0 to 3 {
          %0 = affine.load %arg18[%arg29, %arg30 + 2, %arg31 + 2] : memref<512x2x2xf32>
          affine.store %0, %arg19[%arg29] : memref<512xf32>
        }
      }
    } {parallel}
    return
  }
}