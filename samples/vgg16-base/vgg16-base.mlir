module {
  func @"vgg16-base"(%arg0: f32, %arg1: f32, %arg2: memref<3x64x64xf32>, %arg3: memref<10xf32>, %arg4: memref<256x256x3x3xf32>, %arg5: memref<256x128x3x3xf32>, %arg6: memref<128x128x3x3xf32>, %arg7: memref<128x64x3x3xf32>, %arg8: memref<64x64x3x3xf32>, %arg9: memref<64x3x3x3xf32>, %arg10: memref<3x66x66xf32>, %arg11: memref<10x512xf32>, %arg12: memref<64x64x64xf32>, %arg13: memref<64x64x64xf32>, %arg14: memref<64x64x64xf32>, %arg15: memref<64x66x66xf32>, %arg16: memref<64x32x32xf32>, %arg17: memref<64x32x32xf32>, %arg18: memref<64x32x32xf32>, %arg19: memref<64x34x34xf32>, %arg20: memref<512x512x3x3xf32>, %arg21: memref<128x32x32xf32>, %arg22: memref<128x32x32xf32>, %arg23: memref<128x32x32xf32>, %arg24: memref<128x34x34xf32>, %arg25: memref<128x16x16xf32>, %arg26: memref<128x16x16xf32>, %arg27: memref<128x16x16xf32>, %arg28: memref<128x18x18xf32>, %arg29: memref<512x512x3x3xf32>, %arg30: memref<256x16x16xf32>, %arg31: memref<256x16x16xf32>, %arg32: memref<256x16x16xf32>, %arg33: memref<256x18x18xf32>, %arg34: memref<256x16x16xf32>, %arg35: memref<256x16x16xf32>, %arg36: memref<256x18x18xf32>, %arg37: memref<256x8x8xf32>, %arg38: memref<256x8x8xf32>, %arg39: memref<512x512x3x3xf32>, %arg40: memref<256x8x8xf32>, %arg41: memref<256x10x10xf32>, %arg42: memref<512x8x8xf32>, %arg43: memref<512x8x8xf32>, %arg44: memref<512x8x8xf32>, %arg45: memref<512x10x10xf32>, %arg46: memref<512x8x8xf32>, %arg47: memref<512x8x8xf32>, %arg48: memref<512x10x10xf32>, %arg49: memref<512x512x3x3xf32>, %arg50: memref<512x4x4xf32>, %arg51: memref<512x4x4xf32>, %arg52: memref<512x4x4xf32>, %arg53: memref<512x6x6xf32>, %arg54: memref<512x4x4xf32>, %arg55: memref<512x4x4xf32>, %arg56: memref<512x6x6xf32>, %arg57: memref<512x4x4xf32>, %arg58: memref<512x4x4xf32>, %arg59: memref<512x512x3x3xf32>, %arg60: memref<512x6x6xf32>, %arg61: memref<512x2x2xf32>, %arg62: memref<512x2x2xf32>, %arg63: memref<512x2x2xf32>, %arg64: memref<512xf32>, %arg65: memref<512xf32>, %arg66: memref<512xf32>, %arg67: memref<512x256x3x3xf32>, %arg68: memref<512xf32>, %arg69: memref<512x10xf32>, %arg70: memref<10xf32>, %arg71: memref<10xf32>, %arg72: memref<10xf32>, %arg73: memref<256x256x3x3xf32>) attributes {top_func} {
    affine.for %arg74 = 0 to 3 {
      affine.for %arg75 = 0 to 66 {
        affine.for %arg76 = 0 to 66 {
          affine.store %arg0, %arg10[%arg74, %arg75, %arg76] : memref<3x66x66xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 3 {
      affine.for %arg75 = 0 to 64 {
        affine.for %arg76 = 0 to 64 {
          %0 = affine.load %arg2[%arg74, %arg75, %arg76] : memref<3x64x64xf32>
          affine.store %0, %arg10[%arg74, %arg75 + 1, %arg76 + 1] : memref<3x66x66xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 64 {
        affine.for %arg76 = 0 to 64 {
          affine.store %arg0, %arg12[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 64 {
        affine.for %arg76 = 0 to 64 {
          affine.for %arg77 = 0 to 3 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg10[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<3x66x66xf32>
                %1 = affine.load %arg9[%arg74, %arg77, %arg78, %arg79] : memref<64x3x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg12[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg12[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 64 {
        affine.for %arg76 = 0 to 64 {
          %0 = affine.load %arg12[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
          affine.store %0, %arg13[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 64 {
        affine.for %arg76 = 0 to 64 {
          %0 = affine.load %arg13[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg14[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 66 {
        affine.for %arg76 = 0 to 66 {
          affine.store %arg0, %arg15[%arg74, %arg75, %arg76] : memref<64x66x66xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 64 {
        affine.for %arg76 = 0 to 64 {
          %0 = affine.load %arg14[%arg74, %arg75, %arg76] : memref<64x64x64xf32>
          affine.store %0, %arg15[%arg74, %arg75 + 1, %arg76 + 1] : memref<64x66x66xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          affine.store %arg0, %arg16[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          affine.for %arg77 = 0 to 64 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg15[%arg77, %arg75 * 2 + %arg78, %arg76 * 2 + %arg79] : memref<64x66x66xf32>
                %1 = affine.load %arg8[%arg74, %arg77, %arg78, %arg79] : memref<64x64x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg16[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg16[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          %0 = affine.load %arg16[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
          affine.store %0, %arg17[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          %0 = affine.load %arg17[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg18[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 34 {
        affine.for %arg76 = 0 to 34 {
          affine.store %arg0, %arg19[%arg74, %arg75, %arg76] : memref<64x34x34xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 64 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          %0 = affine.load %arg18[%arg74, %arg75, %arg76] : memref<64x32x32xf32>
          affine.store %0, %arg19[%arg74, %arg75 + 1, %arg76 + 1] : memref<64x34x34xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          affine.store %arg0, %arg21[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          affine.for %arg77 = 0 to 64 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg19[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<64x34x34xf32>
                %1 = affine.load %arg7[%arg74, %arg77, %arg78, %arg79] : memref<128x64x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg21[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg21[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          %0 = affine.load %arg21[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
          affine.store %0, %arg22[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          %0 = affine.load %arg22[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg23[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 34 {
        affine.for %arg76 = 0 to 34 {
          affine.store %arg0, %arg24[%arg74, %arg75, %arg76] : memref<128x34x34xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 32 {
        affine.for %arg76 = 0 to 32 {
          %0 = affine.load %arg23[%arg74, %arg75, %arg76] : memref<128x32x32xf32>
          affine.store %0, %arg24[%arg74, %arg75 + 1, %arg76 + 1] : memref<128x34x34xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          affine.store %arg0, %arg25[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          affine.for %arg77 = 0 to 128 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg24[%arg77, %arg75 * 2 + %arg78, %arg76 * 2 + %arg79] : memref<128x34x34xf32>
                %1 = affine.load %arg6[%arg74, %arg77, %arg78, %arg79] : memref<128x128x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg25[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg25[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg25[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
          affine.store %0, %arg26[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg26[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg27[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 18 {
        affine.for %arg76 = 0 to 18 {
          affine.store %arg0, %arg28[%arg74, %arg75, %arg76] : memref<128x18x18xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 128 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg27[%arg74, %arg75, %arg76] : memref<128x16x16xf32>
          affine.store %0, %arg28[%arg74, %arg75 + 1, %arg76 + 1] : memref<128x18x18xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          affine.store %arg0, %arg30[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          affine.for %arg77 = 0 to 128 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg28[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<128x18x18xf32>
                %1 = affine.load %arg5[%arg74, %arg77, %arg78, %arg79] : memref<256x128x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg30[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg30[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg30[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
          affine.store %0, %arg31[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg31[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg32[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 18 {
        affine.for %arg76 = 0 to 18 {
          affine.store %arg0, %arg33[%arg74, %arg75, %arg76] : memref<256x18x18xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg32[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
          affine.store %0, %arg33[%arg74, %arg75 + 1, %arg76 + 1] : memref<256x18x18xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          affine.for %arg77 = 0 to 256 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg33[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<256x18x18xf32>
                %1 = affine.load %arg4[%arg74, %arg77, %arg78, %arg79] : memref<256x256x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg30[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg30[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg30[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
          affine.store %0, %arg34[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg34[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg35[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 18 {
        affine.for %arg76 = 0 to 18 {
          affine.store %arg0, %arg36[%arg74, %arg75, %arg76] : memref<256x18x18xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 16 {
        affine.for %arg76 = 0 to 16 {
          %0 = affine.load %arg35[%arg74, %arg75, %arg76] : memref<256x16x16xf32>
          affine.store %0, %arg36[%arg74, %arg75 + 1, %arg76 + 1] : memref<256x18x18xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          affine.store %arg0, %arg37[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          affine.for %arg77 = 0 to 256 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg36[%arg77, %arg75 * 2 + %arg78, %arg76 * 2 + %arg79] : memref<256x18x18xf32>
                %1 = affine.load %arg73[%arg74, %arg77, %arg78, %arg79] : memref<256x256x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg37[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg37[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg37[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
          affine.store %0, %arg38[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg38[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg40[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 10 {
        affine.for %arg76 = 0 to 10 {
          affine.store %arg0, %arg41[%arg74, %arg75, %arg76] : memref<256x10x10xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 256 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg40[%arg74, %arg75, %arg76] : memref<256x8x8xf32>
          affine.store %0, %arg41[%arg74, %arg75 + 1, %arg76 + 1] : memref<256x10x10xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          affine.store %arg0, %arg42[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          affine.for %arg77 = 0 to 256 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg41[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<256x10x10xf32>
                %1 = affine.load %arg67[%arg74, %arg77, %arg78, %arg79] : memref<512x256x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg42[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg42[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg42[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
          affine.store %0, %arg43[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg43[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg44[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 10 {
        affine.for %arg76 = 0 to 10 {
          affine.store %arg0, %arg45[%arg74, %arg75, %arg76] : memref<512x10x10xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg44[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
          affine.store %0, %arg45[%arg74, %arg75 + 1, %arg76 + 1] : memref<512x10x10xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          affine.for %arg77 = 0 to 512 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg45[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<512x10x10xf32>
                %1 = affine.load %arg59[%arg74, %arg77, %arg78, %arg79] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg42[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg42[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg42[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
          affine.store %0, %arg46[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg46[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg47[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 10 {
        affine.for %arg76 = 0 to 10 {
          affine.store %arg0, %arg48[%arg74, %arg75, %arg76] : memref<512x10x10xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 8 {
        affine.for %arg76 = 0 to 8 {
          %0 = affine.load %arg47[%arg74, %arg75, %arg76] : memref<512x8x8xf32>
          affine.store %0, %arg48[%arg74, %arg75 + 1, %arg76 + 1] : memref<512x10x10xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          affine.store %arg0, %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          affine.for %arg77 = 0 to 512 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg48[%arg77, %arg75 * 2 + %arg78, %arg76 * 2 + %arg79] : memref<512x10x10xf32>
                %1 = affine.load %arg49[%arg74, %arg77, %arg78, %arg79] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          affine.store %0, %arg51[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg51[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg52[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 6 {
        affine.for %arg76 = 0 to 6 {
          affine.store %arg0, %arg53[%arg74, %arg75, %arg76] : memref<512x6x6xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg52[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          affine.store %0, %arg53[%arg74, %arg75 + 1, %arg76 + 1] : memref<512x6x6xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          affine.for %arg77 = 0 to 512 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg53[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<512x6x6xf32>
                %1 = affine.load %arg39[%arg74, %arg77, %arg78, %arg79] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          affine.store %0, %arg54[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg54[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg55[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 6 {
        affine.for %arg76 = 0 to 6 {
          affine.store %arg0, %arg56[%arg74, %arg75, %arg76] : memref<512x6x6xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg55[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          affine.store %0, %arg56[%arg74, %arg75 + 1, %arg76 + 1] : memref<512x6x6xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          affine.for %arg77 = 0 to 512 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg56[%arg77, %arg75 + %arg78, %arg76 + %arg79] : memref<512x6x6xf32>
                %1 = affine.load %arg29[%arg74, %arg77, %arg78, %arg79] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg50[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          affine.store %0, %arg57[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg57[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg58[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 6 {
        affine.for %arg76 = 0 to 6 {
          affine.store %arg0, %arg60[%arg74, %arg75, %arg76] : memref<512x6x6xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 4 {
        affine.for %arg76 = 0 to 4 {
          %0 = affine.load %arg58[%arg74, %arg75, %arg76] : memref<512x4x4xf32>
          affine.store %0, %arg60[%arg74, %arg75 + 1, %arg76 + 1] : memref<512x6x6xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 2 {
        affine.for %arg76 = 0 to 2 {
          affine.store %arg0, %arg61[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 2 {
        affine.for %arg76 = 0 to 2 {
          affine.for %arg77 = 0 to 512 {
            affine.for %arg78 = 0 to 3 {
              affine.for %arg79 = 0 to 3 {
                %0 = affine.load %arg60[%arg77, %arg75 * 2 + %arg78, %arg76 * 2 + %arg79] : memref<512x6x6xf32>
                %1 = affine.load %arg20[%arg74, %arg77, %arg78, %arg79] : memref<512x512x3x3xf32>
                %2 = arith.mulf %0, %1 : f32
                %3 = affine.load %arg61[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg61[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
              }
            }
          }
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 2 {
        affine.for %arg76 = 0 to 2 {
          %0 = affine.load %arg61[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
          affine.store %0, %arg62[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 2 {
        affine.for %arg76 = 0 to 2 {
          %0 = affine.load %arg62[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
          %1 = arith.maxf %0, %arg0 : f32
          affine.store %1, %arg63[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
        } {parallel}
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.store %arg0, %arg64[%arg74] : memref<512xf32>
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      affine.for %arg75 = 0 to 2 {
        affine.for %arg76 = 0 to 2 {
          %0 = affine.load %arg64[%arg74] : memref<512xf32>
          %1 = affine.load %arg63[%arg74, %arg75, %arg76] : memref<512x2x2xf32>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg64[%arg74] : memref<512xf32>
        }
      }
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      %0 = affine.load %arg64[%arg74] : memref<512xf32>
      affine.store %0, %arg65[%arg74] : memref<512xf32>
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      %0 = affine.load %arg65[%arg74] : memref<512xf32>
      %1 = arith.mulf %0, %arg1 : f32
      affine.store %1, %arg66[%arg74] : memref<512xf32>
    } {parallel}
    affine.for %arg74 = 0 to 512 {
      %0 = affine.load %arg66[%arg74] : memref<512xf32>
      affine.store %0, %arg68[%arg74] : memref<512xf32>
    } {parallel}
    affine.for %arg74 = 0 to 10 {
      affine.for %arg75 = 0 to 512 {
        %0 = affine.load %arg11[%arg74, %arg75] : memref<10x512xf32>
        affine.store %0, %arg69[%arg75, %arg74] : memref<512x10xf32>
      } {parallel}
    } {parallel}
    affine.for %arg74 = 0 to 10 {
      affine.store %arg0, %arg70[%arg74] : memref<10xf32>
    } {parallel}
    affine.for %arg74 = 0 to 10 {
      affine.for %arg75 = 0 to 512 {
        %0 = affine.load %arg68[%arg75] : memref<512xf32>
        %1 = affine.load %arg69[%arg75, %arg74] : memref<512x10xf32>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %arg70[%arg74] : memref<10xf32>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg70[%arg74] : memref<10xf32>
      }
    } {parallel}
    affine.for %arg74 = 0 to 10 {
      %0 = affine.load %arg70[%arg74] : memref<10xf32>
      affine.store %0, %arg71[%arg74] : memref<10xf32>
    } {parallel}
    affine.for %arg74 = 0 to 10 {
      %0 = affine.load %arg71[%arg74] : memref<10xf32>
      %1 = affine.load %arg3[%arg74] : memref<10xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %arg72[%arg74] : memref<10xf32>
    } {parallel}
    return
  }
}