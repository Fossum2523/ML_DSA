from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
from SHA_3 import SHAKE_128,SHAKE_256,sponge
import numpy as np
ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = (2**t1_coff_square) - 1

# 算法 10: SimpleBitPack(w,b) 
def SimpleBitPack(w, b):
    z = []
    for i in range(256):
        z.extend(IntegerToBits(w[i], b.bit_length()))
    return BitsToBytes(z)

# 算法 6: BitsToBytes(y) 
def BitsToBytes(y: list) -> bytearray:
    """
    將位元串 y 轉換為位元組串
    :param y: 位元串
    :return: 位元組串 z
    """
    c = len(y)
    z = bytearray((c + 7) // 8)  # 初始化位元組串
    for i in range(c):
        z[i // 8] += y[i] * (2 ** (i % 8))
    return z
# 算法 4: IntegerToBits(x,α)
def IntegerToBits(x, alpha):
    y = [0] * alpha
    for i in range(alpha):
        y[i] = x % 2
        x = x // 2
    return y

a = [26, 25, 2, 6, 41, 20, 33, 5, 35, 24, 43, 10, 26, 41, 39, 0, 34, 37, 1, 37, 20, 5, 15, 0, 42, 18, 29, 32, 31, 24, 10, 40, 18, 13, 17, 32, 11, 22, 40, 43, 22, 14, 24, 14, 25, 33, 39, 7, 37, 5, 43, 9, 32, 27, 37, 33, 35, 37, 36, 25, 26, 1, 13, 20, 32, 36, 39, 23, 1, 18, 20, 13, 18, 33, 12, 12, 11, 6, 25, 5, 14, 43, 23, 42, 24, 34, 42, 27, 40, 6, 0, 35, 26, 19, 12, 14, 23, 4, 27, 35, 20, 34, 14, 0, 40, 7, 28, 36, 27, 6, 42, 23, 4, 27, 10, 4, 8, 15, 20, 31, 9, 39, 29, 11, 33, 13, 14, 14, 2, 3, 14, 13, 42, 35, 2, 41, 32, 38, 30, 35, 31, 30, 12, 35, 4, 16, 1, 34, 15, 2, 17, 1, 24, 35, 0, 39, 41, 3, 40, 26, 39, 39, 15, 3, 19, 12, 0, 11, 9, 26, 33, 26, 40, 31, 35, 37, 12, 31, 18, 20, 36, 30, 25, 29, 3, 33, 2, 39, 38, 14, 26, 27, 43, 13, 19, 12, 37, 18, 19, 26, 41, 14, 39, 42, 31, 17, 35, 35, 21, 11, 23, 32, 40, 14, 1, 39, 16, 12, 41, 38, 27, 26, 31, 2, 38, 9, 0, 4, 16, 23, 28, 11, 0, 14, 22, 14, 24, 7, 25, 5, 27, 32, 38, 32, 4, 33, 5, 1, 1, 14, 27, 27, 30, 40, 8, 22]
# b = (ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"]) - 1
b = SimpleBitPack(a,(ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"]) - 1)
# c = BitsToBytes(IntegerToBits(a, b.bit_length()))
print(b)
