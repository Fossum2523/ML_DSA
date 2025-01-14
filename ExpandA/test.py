from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
from SHA_3 import SHAKE_128,SHAKE_256,sponge
import numpy as np


ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = 2**t1_coff_square - 1

def hex_to_bytes(hex_string: str) -> bytes:
    """
    將16進制字串轉換為位元組
    :param hex_string: 16進制字串
    :return: 對應的位元組(bytes)
    """
    # 去除可能的空格或前綴 '0x'
    hex_string = hex_string.replace(" ", "").replace("0x", "")
    
    # 將16進制字串轉換為位元組
    return bytes.fromhex(hex_string)

# 算法 8: CoefFromThreeBytes(b0,b1,b2)
def CoeffFromThreeBytes(b0, b1, b2):
    if b2 > 127:
        b2 = b2 - 128
    z = (b2 << 16) + (b1 << 8) + b0
    if z < ML_DSA["q"]:
        return z
    else:
        return None
    
# 算法 24 RejNTTPoly(ρ) 
def RejNTTPoly(p):
    a = [None] * 256  # Initialize polynomial coefficients
    H_p = SHAKE_128(p, 7152)  # Get more bytes than needed
    j = 0
    c = 0
    while j < 256:
        # print("c = ",c)
        a[j] = CoeffFromThreeBytes(H_p[c], H_p[c+1], H_p[c+2])
        c += 3
        if a[j] is not None:
            j += 1
    # print(a)
    return a

# 算法 4: IntegerToBits(x,α)
def IntegerToBits(x, alpha):
    y = [0] * alpha
    for i in range(alpha):
        y[i] = x % 2
        x = x // 2
    return y


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

# 算法 26 ExpandA(ρ)
def ExpandA(p):
    A = np.zeros((ML_DSA["k"], ML_DSA["l"]), dtype=object)
    for r in range(ML_DSA["k"]):
        for s in range(ML_DSA["l"]):
            r_prime = IntegerToBits(r, 8)
            r_prime = BitsToBytes(r_prime)
            s_prime = IntegerToBits(s, 8)
            s_prime = BitsToBytes(s_prime)
            seed = p + s_prime + r_prime
            A[r, s] = RejNTTPoly(seed)
    return A



# 算法 26 ExpandA(ρ)  test-----------------------------------------
# Example usage
seed = "4A2B16CDB552F929"
seed = hex_to_bytes(seed)
k = 3  # Dimension k of the matrix
l = 3  # Dimension l of the matrix
matrix_A = ExpandA(seed)
print("Generated matrix A:", matrix_A)
print(matrix_A.shape)

