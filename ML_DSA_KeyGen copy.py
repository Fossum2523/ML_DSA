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
    output_length = output_length // 8
    data = list_to_bytes(data)
    shake = hashlib.shake_256()
    shake.update(data)
    return shake.digest(output_length)

def shake128(data: bytes, output_length: int) -> bytes:
    """
    使用 SHAKE128 進行雜湊
    :param data: 輸入的位元串
    :param output_length: 輸出長度（位元組）
    :return: 指定長度的雜湊輸出
    """
    output_length = output_length // 8
    data = list_to_bytes(data)
    shake = hashlib.shake_128()
    shake.update(data)
    return shake.digest(output_length)

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
    return y[::-1]  # Reverse the list to get big-endian order

# 算法 5:  BitsToInteger(y)
def BitsToInteger(y):
    x = 0
    alpha = len(y)
    for i in range(alpha):
        x = 2 * x + y[i]  # Since it's big-endian, process bits from left to right (no need to reverse)
    return x

# 算法 24 RejNTTPoly(ρ) 
def RejNTTPoly(p):
    a = [None] * 256  # Initialize polynomial coefficients
    H_p = shake128(p, 6168)  # Get more bytes than needed
    # print(H_p)
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
    # for r in range(1):
    for r in range(ML_DSA["k"]):
        # for s in range(1):
        for s in range(ML_DSA["l"]):
            seed = p + IntegerToBits(s, 8) + IntegerToBits(r, 8)
            # print(seed)
            A[r, s] = RejNTTPoly(seed)
    return A

def BitsToBytes(y: list) -> bytearray:
    c = len(y)
    z = bytearray((c + 7) // 8)  # 初始化位元組串
    for i in range(c):
        z[i // 8] |= y[i] << (i % 8)
    return z

# 算法 7: BytesToBits(z)
def BytesToBits(z):
    y = []
    for i in range(len(z)):
        for j in range(8):
            y.append((z[i] >> j) & 1)
    return y

# 算法 9: CoefFromHalfByte(b) 
def CoeffFromHalfByte(b):
    # print(type(b[0]))
    if ML_DSA["eta"] == 2 and b < 15:
            return 2 - (b % 5)
    else:
        if ML_DSA["eta"] == 4 and b < 9:
            return 4 - b
        else:
            return None
        
# 算法 25 RejBoundedPoly(ρ)
def RejBoundedPoly(p):
    """Generate a polynomial with coefficients in [-n, n]."""
    print(len(p))
    a = [None] * 256  # Polynomial coefficients initialization
    hash_output = shake256(p, 2048)  # Get more bytes than needed
    j = 0  # Coefficient index
    c = 0  # Hash byte index

    while j < 256:
        z = hash_output[c]
        # print(type(z))
        # print("z=",z)
        # print(type(z))
        z0 = CoeffFromHalfByte(z % 16)  # Lower nibble
        z1 = CoeffFromHalfByte(z // 16)  # Upper nibble

        if z0 is not None:
            a[j] = z0
            j += 1

        if z1 is not None and j < 256:
            a[j] = z1
            j += 1

        c += 1  # Move to next byte in hash output

    return a

# 算法 27 ExpandS(ρ) 
def ExpandS(p):
    """Generate two vectors of polynomials based on a seed."""
    s1 = [None] * ML_DSA["l"]
    s2 = [None] * ML_DSA["k"]
    # for r in range(1):
    for r in range(ML_DSA["l"]):
        r_prime = IntegerToBits(r,16)
        print(r_prime)
        seed = p + r_prime
        print(len(seed))
        print(seed)
        s1[r] = RejBoundedPoly(seed)
        print("s1[",r,"] = ",s1[r])
    # for r in range(ML_DSA["k"]):
    #     r_prime = IntegerToBits(r + ML_DSA["l"], 16)
    #     seed = p + r_prime
    #     s2[r] = RejBoundedPoly(seed)
    #     # print("s2[",r,"] = ",s2[r])
    return s1, s2

# 算法 1 ML-DSA.KeyGen() 
def KeyGen():
    # 1. 選擇隨機種子 ξ
    xi = [0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0]
    # print(xi)

    # 2. 扩展種子 ρ、ρ' 和 K
    H_xi = shake256(xi,1024)
    H_xi = bytes_to_bit_list(H_xi)

    p = H_xi[:256]
    p_prime = H_xi[256:768]
    K = H_xi[768:]
    # print(p)
    # print(p_prime)
    # print(K)

    # 3. 生成矩陣 Â = ExpandA(ρ)
    A_hat = ExpandA(p)
    # for i in A_hat:
    #     print(i)
    # print(A_hat)
    # return pk, sk
    s1, s2 = ExpandS(p_prime)
    # print(s1)
    # print(len(p_prime))
    return 0

KeyGen()