from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
import numpy as np

ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = 2**t1_coff_square - 1

def shake256(data: bytes, output_length: int) -> bytes:
    """
    使用 SHAKE256 進行雜湊
    :param data: 輸入的位元串
    :param output_length: 輸出長度（位元組）
    :return: 指定長度的雜湊輸出
    """
    data = list_to_bytes(data)
    shake = hashlib.shake_256()
    shake.update(data)
    return bytes_to_bit_list(shake.digest(output_length))

def shake128(data: bytes, output_length: int) -> bytes:
    """
    使用 SHAKE128 進行雜湊
    :param data: 輸入的位元串
    :param output_length: 輸出長度（位元組）
    :return: 指定長度的雜湊輸出
    """
    data = list_to_bytes(data)
    shake = hashlib.shake_128()
    shake.update(data)
    return bytes_to_bit_list(shake.digest(output_length))

def list_to_bytes(bit_list):
    """
    將位元列表轉換為位元組表示
    :param bit_list: 位元列表，例如 [1, 1, 1]
    :return: 對應的位元組 (bytes)
    """
    # 將位元列表轉換為字串，然後轉換為位元組
    bit_string = ''.join(map(str, bit_list))  # 轉換為 "111"
    return int(bit_string, 2).to_bytes((len(bit_string) + 7) // 8, byteorder='big')

def bytes_to_bit_list(byte_data):
    """
    將位元組轉換為位元列表（0和1）
    :param byte_data: 位元組數據
    :return: 位元列表
    """
    bit_list = []
    for byte in byte_data:
        bit_list.extend([int(b) for b in bin(byte)[2:].zfill(8)])  # 轉換為 8 位的二進制位元
    return bit_list

# 算法 4: IntegerToBits(x,α)
def IntegerToBits(x, alpha):
    y = []
    for i in range(alpha):
        y.append(x % 2)
        x = x // 2
    # print(y)
    return y

# 算法 24 RejNTTPoly(ρ) 
def RejNTTPoly(p):
    a = [None] * 256  # Initialize polynomial coefficients
    H_p = shake128(p, 1024)  # Get more bytes than needed
    j = 0
    c = 0
    while j < 256:
        a[j] = CoeffFromThreeBytes(H_p[c], H_p[c+1], H_p[c+2])
        c += 3
        if a[j] is not None:
            j += 1
    return a

# 算法 8: CoefFromThreeBytes(b0,b1,b2)
def CoeffFromThreeBytes(b0, b1, b2):
    if b2 > 127:
        b2 = b2 - 128
    z = (b2 << 16) + (b1 << 8) + b0
    if z < ML_DSA["q"]:
        return z
    else:
        return None
    
# 算法 26 ExpandA(ρ)
def ExpandA(p):
    """Generate a k x l matrix A from a seed p."""
    A = np.zeros((ML_DSA["k"], ML_DSA["l"]), dtype=object)
    # print(A)
    for r in range(ML_DSA["k"]):
        for s in range(ML_DSA["l"]):
            seed = p + IntegerToBits(s, 8) + IntegerToBits(r, 8)
            # print(seed)
            A[r, s] = RejNTTPoly(seed)
    return A

# 算法 1 ML-DSA.KeyGen() 
def KeyGen():
    # 1. 選擇隨機種子 ξ
    xi = [0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0]
    # print(xi)

    # 2. 扩展種子 ρ、ρ' 和 K
    H_xi = shake256(xi,1024)
    p = H_xi[:256]
    p_prime = H_xi[256:768]
    K = H_xi[768:]
    # print(p)
    # print(p_prime)
    # print(K)

    # 3. 生成矩陣 Â = ExpandA(ρ)
    A_hat = ExpandA(p)

    print(A_hat)
    # return pk, sk
    return 0

KeyGen()