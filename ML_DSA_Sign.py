from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
import numpy as np

ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = 2**t1_coff_square - 1

# 算法 4: IntegerToBits(x,α)
def IntegerToBits(x, alpha):
    y = [0] * alpha
    for i in range(alpha):
        y[i] = x % 2
        x = x // 2
    return y

# 算法 5:  BitsToInteger(y)
def BitsToInteger(y):
    x = 0
    alpha = len(y)
    for i in range(1, alpha + 1):
        x = 2 * x + y[alpha - i]
    return x


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
    # def BitsToBytes(y):
    #     c = len(y)
    #     z = [0] * ((c + 7) // 8)  # Initialize byte array of length ⌈c/8⌉
    #     for i in range(c):
    #         z[i // 8] += y[i] * (2 ** (i % 8))  # Convert bit to corresponding byte
    #     return z


# 算法 7: BytesToBits(z)
# def BytesToBits(z):
#     y = []
#     for i in range(len(z)):
#         for j in range(8):
#             y.append((z[i] >> j) & 1)
#     return y
def BytesToBits(z):
    z = bytearray(z)
    d = len(z)  # Length of the byte string
    y = [0] * (d * 8)  # Initialize the bit string to hold 8 bits for each byte
    for i in range(d):
        for j in range(8):
            y[8 * i + j] = z[i] % 2  # Get the least significant bit
            z[i] = z[i] // 2  # Shift the byte right
    return y


# 算法 8: CoefFromThreeBytes(b0,b1,b2)
def CoeffFromThreeBytes(b0, b1, b2):
    if b2 > 127:
        b2 = b2 - 128
    z = (b2 << 16) + (b1 << 8) + b0
    if z < ML_DSA["q"]:
        return z
    else:
        return None

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
    
# 算法 10: SimpleBitPack(w,b) 
def SimpleBitPack(w, b):
    z = []
    for i in range(256):
        z.extend(IntegerToBits(w[i], b.bit_length()))
    return BitsToBytes(z)

# 算法 11: BitPack(w,a,b) 
def BitPack(w, a, b):
    z = []
    for i in range(256):
        z.extend(IntegerToBits(b - w[i], (a + b).bit_length()))
    return BitsToBytes(z)

# 算法 12: SimpleBitUnpack(v,b)
def SimpleBitUnpack(v, b):
    c = b.bit_length()
    z = BytesToBits(v)
    w = [BitsToInteger(z[i*c:(i+1)*c]) for i in range(256)]
    return w

# 算法 13: BitUnpack(v,a,b) 
def BitUnpack(v, a, b):
    c = (a + b).bit_length()
    # print("BBBB",v)
    z = BytesToBits(v)
    # print("AAAA",z)
    
    # w = [b - BitsToInteger(z[i*c:(i+1)*c]) for i in range(256)]

    w = [0] * 256
    for i in range(256):
        bti = BitsToInteger(z[i*c:(i+1)*c])
        w[i] = b - bti
    # print("w",w)
    return w

# 算法 14: HintBitpack(h) 
def HintBitPack(h):
    # 初始化一個足夠大的陣列來存儲結果
    y = [0] * (ML_DSA["omega"] + ML_DSA["k"])
    index = 0
    for i in range(ML_DSA["k"]):
        for j in range(256):
            if h[i][j] != 0:
                y[index] = j
                index = index + 1

        y[ML_DSA["omega"] + i] = index
    return y

# 算法 15: HintBitUnpack(y) 
def HintBitUnpack(y):
    h = [[0] * 256 for _ in range(ML_DSA["k"])]
    index = 0
    for i in range(ML_DSA["k"]):
        if y[ML_DSA["omega"] + i] < index or y[ML_DSA["omega"] + i] > ML_DSA["omega"]:
            return None
        while index < y[ML_DSA["omega"] + i]:
            h[i][y[index]] = 1
            index += 1
    while index < ML_DSA["omega"]:
        if y[index] != 0 :
            return None
        index += 1 
    return h

# 算法 16 pkEncode(ρ,t1)  
def pk_encode(p, t_list):
    pk = p
    # print(len(pk))
    for i in range(ML_DSA["k"]):
        packed_t = SimpleBitPack(t_list[i], t1_coff_max)
        pk = pk + packed_t
    return pk

# 算法 17 pkDecode(pk) 
def pk_decode(pk):
    rho = BytesToBits(pk[:32])
    t1 = np.empty((0, 256))
    # print("pk",pk[32:])
    for i in range(ML_DSA["k"]):
        t1_i = SimpleBitUnpack(pk[(i * 320 + 32):(i * 320 + 32 + 320)],t1_coff_max)
        # print(pk[(i * 320 + 32):(i * 320 + 32 + 320)])
        # print(len(t1_i))
        t1_i = np.array(t1_i)
        t1 = np.vstack([t1,t1_i])
    return rho, t1

# 算法 18 sk_encode(ρ,K,tr,s1,s2,t0) 
def sk_encode(p, K, tr, s1, s2, t0):
    # 將 p, K, tr 轉換為字節串
    sk = p + K + tr
    
    # print(len(sk))
    # 打印結果
    # 將 s1, s2, t0 中的每個元素使用 BitPack 轉換為字節串並附加到 sk
    for si in s1:
        packed_si = BitPack(si, ML_DSA["eta"], ML_DSA["eta"])
        sk = sk + packed_si
    # print(len(sk))
    for si in s2:
        packed_si = BitPack(si, ML_DSA["eta"], ML_DSA["eta"])
        sk = sk + packed_si
    # print(len(sk))
    for ti in t0:
        packed_ti = BitPack(ti, 2**(ML_DSA["d"] - 1)-1, 2**(ML_DSA["d"] - 1))
        sk = sk + packed_ti
        # print(len(sk))
    
    # print(len(sk))
    return sk

# # 算法 19 sk_(sk)
# def sk_decode(sk):
#     # 假設的每個段的位數
#     size_f = 256  # 假設 f 是 256 位的長度
#     size_K = 256  # 假設 K 是 256 位的長度
#     size_tr = 512  # 假設 tr 是 512 位的長度
#     size_s = 96  # s1, s2 每個元素的位串長度，轉為字節
#     size_t = 13 * 32  # t0 每個元素的位串長度，轉為字節

#     # 解析 sk
#     index = 0
#     f = BytesToBits(sk[index:index + size_f // 8])
#     index += size_f // 8
#     K = BytesToBits(sk[index:index + size_K // 8])
#     index += size_K // 8
#     tr = BytesToBits(sk[index:index + size_tr // 8])
#     index += size_tr // 8
#     s1 = [BitUnpack(sk[index:index + size_s], ML_DSA["eta"], ML_DSA["eta"]) for i in range(ML_DSA["l"])]
#     index += size_s * ML_DSA["l"]

#     s2 = [BitUnpack(sk[index:index + size_s], ML_DSA["eta"], ML_DSA["eta"]) for i in range(ML_DSA["k"])]
#     index += size_s * ML_DSA["k"]

#     print("dwdwddw",index)
#     t0 = [BitUnpack(sk[index:index + size_t], 2**(ML_DSA["d"] - 1) -1, 2**(ML_DSA["d"] - 1)) for i in range(ML_DSA["k"])]
#     index += size_t * ML_DSA["k"]
#     print(index)
#     return f, K, tr, s1, s2, t0

#Help to compare list
def compare_arrays(arr1, arr2):
    # 比較兩個數組列表的函數，確保每個相對應的數組都相等
    if len(arr1) != len(arr2):
        return False
    for a1, a2 in zip(arr1, arr2):
        if not np.array_equal(a1, a2):
            return False
    return True

# 算法 20 sigEncode(c˜,z,h)
def sigEncode(c, z, h):
    # 將 c 轉換成字節串
    sigma = c
    # 對 z 中的每個元素使用 BitPack 並附加到 sigma
    for zi in z:
        packed_zi = BitPack(zi, ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"])
        sigma = sigma + packed_zi

    # 對 h 使用 HintBitPack 並附加到 sigma
    packed_h = HintBitPack(h)
    packed_h = bytearray(packed_h)
    # print(type(packed_h))
    # print(type(sigma))
    sigma = sigma + packed_h
    
    return sigma

# 算法 21 sigDecode(σ)
def sigDecode(sigma):
    # 計算必要的尺寸
    size_c = 256 // 8  #c 是 128* 2 位的長度
    size_zi =  576  # 每個 zi 的位串長度，轉為字節
    # 解析 sigma
    index = 0
    c = BytesToBits(sigma[index:index + size_c])
    index += size_c
    z = [BitUnpack(sigma[index + i * size_zi:index + (i + 1) * size_zi], ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"]) for i in range(ML_DSA["l"])]
    # 假設 `h` 跟隨在最後
    h = HintBitUnpack(sigma[index:])
    return c, z, h

# 算法 22 w1Encode(w1) not yet test
def w1Encode(w1):
    # 初始化位串
    w1_encoded = np.array([], dtype=int)
    # 系數的範圍計算
    range_max = (ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"]) - 1
    # 對每個多項式系數進行打包
    for coeff in w1:
        packed_coeff = SimpleBitPack(coeff, range_max)
        w1_encoded = np.concatenate([w1_encoded, BytesToBits(packed_coeff)])
    return w1_encoded

def shake256(data: bytes, output_length: int) -> bytes:
    """
    使用 SHAKE256 進行雜湊
    :param data: 輸入的位元串
    :param output_length: 輸出長度（位元組）
    :return: 指定長度的雜湊輸出
    """
    output_length = output_length // 8
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
    shake = hashlib.shake_128()
    shake.update(data)
    return shake.digest(output_length)

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

def bytes_to_bits(byte_data: bytes) -> str:
    """
    將位元組轉換為位元表示
    :param byte_data: 輸入的位元組
    :return: 對應的位元串（每個位元用 '0' 或 '1' 表示）
    """
    # 將每個位元組轉換為 8 位的二進制位元串，然後合併
    bit_string = ''.join(f'{byte:08b}' for byte in byte_data)
    return list(map(int, bit_string))


# # 算法 23 SampleInBall(ρ)
# def sample_in_ball(p):
#     # c = [np.zeros(256, dtype=int)]
#     c = [0] * 256
#     k = 8
#     H_p = shake256(p,8000)
#     # print("dick=",H_p[0])
#     # print("dick=",BytesToBits([H_p[0]]))
#     # test = H_p[0]
#     print(H_p[0])
#     test = BytesToBits([H_p[0]])
#     test = [ test[8-i-1] for i in range(8)]
#     test = BitsToInteger(test)
#     print(test)
#     # print("dick=",BitsToInteger(BytesToBits([H_p[0]])))
#     # print("dick=",H_p)
#     # for i in range(256 - ML_DSA["tau"],256 - ML_DSA["tau"] + 1):
#     for i in range(256 - ML_DSA["tau"],256):
#         test = BytesToBits([H_p[k]])
#         test = [test[8-i-1] for i in range(8)]
#         test = BitsToInteger(test)
#         # print(test)
#         while test > i :
#             k = k + 1
#             test = BytesToBits([H_p[k]])
#             test = [test[8-i-1] for i in range(8)]
#             test = BitsToInteger(test)
#             print(k)
            
        
#         test2 = BytesToBits([H_p[k]])
#         test2 = [test2[8-i-1] for i in range(8)]
#         test2 = BitsToInteger(test2)
#         j = test2
#         c[i] = c[j]
#         print(H_p[i + ML_DSA["tau"] - 256])

#         print(H_p)
#         print(i + ML_DSA["tau"] - 256)
#         test3 = (i + ML_DSA["tau"] - 256) // 8
#         test4 = (i + ML_DSA["tau"] - 256) % 8
#         test5 = H_p[test3]
#         test6 = BytesToBits([test5])
#         # test7 = test6[8-test4-1]
#         test7 = test6[test4]

#         print("shit")
#         print(test3,test4,test5,test6,test7)
#         # c[j] = (-1)**(H_p[(i + ML_DSA["tau"] - 256)//8][(i + ML_DSA["tau"] - 256)%8])
#         c[j] = (-1)**test7
#         k = k + 1
#     print("k",k)
#     return c

def sample_in_ball(p):
    c = [0] * 256
    ctx = hashlib.shake_256()
    ctx.update(p)
    s = ctx.digest(8)
    h = BytesToBits(s)
    test = ctx.digest(8000)
    cnt = 8
    for i in range(256 - ML_DSA["tau"],256):
        j = test[cnt]
        cnt = cnt + 1
        while j > i:
            j = test[cnt]
            cnt = cnt + 1

        # temp = int(j)
        c[i] = c[j]
        c[j] = (-1)**(h[(i + ML_DSA["tau"] - 256)])

    return c 
# 算法 24 RejNTTPoly(ρ) 
def RejNTTPoly(p):
    a = [None] * 256  # Initialize polynomial coefficients
    H_p = shake128(p, 8000)  # Get more bytes than needed
    # print(H_p)
    j = 0
    c = 0
    while j < 256:
        a[j] = CoeffFromThreeBytes(H_p[c], H_p[c+1], H_p[c+2])
        c += 3
        if a[j] is not None:
            j += 1
    return a
    
# 算法 25 RejBoundedPoly(ρ)
def RejBoundedPoly(p):
    """Generate a polynomial with coefficients in [-n, n]."""
    a = [None] * 256  # Polynomial coefficients initialization
    hash_output = shake256(p, 2048)  # Get more bytes than needed
    j = 0  # Coefficient index
    c = 0  # Hash byte index

    while j < 256:
        z = hash_output[c]
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

#help expandA 
def int_to_bytes(n: int, length: int) -> bytes:
    """
    將整數轉換為指定長度的位元組表示.
    :param n: 要轉換的整數
    :param length: 指定的位元組長度
    :return: 對應的位元組 (bytes)
    """
    return n.to_bytes(length, byteorder='big')
 
# 算法 26 ExpandA(ρ)
def ExpandA(p):
    """Generate a k x l matrix A from a seed p."""
    A = np.zeros((ML_DSA["k"], ML_DSA["l"]), dtype=object)
    # print(A)
    for r in range(ML_DSA["k"]):
        for s in range(ML_DSA["l"]):
            
            r_prime = IntegerToBits(r, 8)
            # print(r_prime)
            r_prime = BitsToBytes(r_prime)
            # print(r_prime)
            s_prime = IntegerToBits(s, 8)
            # print(s_prime)
            s_prime = BitsToBytes(s_prime)
            # print(s_prime)
            seed = p + s_prime + r_prime
            # print(seed)
            A[r, s] = RejNTTPoly(seed)
    return A


# 算法 28 ExpandMask(ρ, µ) 
def ExpandMask(p, mu):
    c = 1 + (ML_DSA["gamma_1"] - 1).bit_length()
    s = [None] * ML_DSA["l"]
    p = BytesToBits(p)
    # print(p)
    for r in range(ML_DSA["l"]):
        n = IntegerToBits(mu + r, 16)
        # n = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        # print(n)
        H = p + n
        H = BitsToBytes(H)
        # print(H)
        H = shake256(H, 160000)
        # v = H[32*r*c:32*c*(r+1)]
        v = H[0:32*c*(r+1)]
        s[r] = BitUnpack(v, ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"])
    
    return s

# bit reverse
def brv(k):
    """ 進行位反轉，用於計算 ζ 的冪次 """
    return int('{:08b}'.format(k)[::-1], 2)

# NTT
def NTT(w):
    """ 執行數論轉換 NTT """
    w_hat = np.array(w, dtype=np.int64)
    k = 0
    length = 128

    while length >= 1:
        start = 0
        while start < 256:
            k = k + 1
            zeta = pow(1753, brv(k), ML_DSA["q"])
            for j in range(start, start + length):
                t = (zeta * w_hat[j + length]) % ML_DSA["q"]
                w_hat[j + length] = (w_hat[j] - t) % ML_DSA["q"]
                w_hat[j] = (w_hat[j] + t) % ML_DSA["q"]
            start += 2 * length
        length //= 2

    return w_hat

# INV_NTT
def NTT_inv(w_hat):
    """ 執行逆數論轉換 NTT^-1 """
    w = np.array(w_hat, dtype=np.int64)
    length = 1
    k = 256

    while length < 256:
        start = 0
        while start < 256:
            k -= 1
            zeta = -pow(1753, brv(k), ML_DSA["q"])  # 使用 brv(k) 反轉位
            for j in range(start, start + length):
                t = w[j]
                w[j] = (t + w[j + length]) % ML_DSA["q"]
                w[j + length] = (t - w[j + length]) % ML_DSA["q"]
                w[j + length] = (w[j + length] * zeta) % ML_DSA["q"]
            start = start + 2 * length
        length *= 2

    f = 8347681
    for j in range(256):
        w[j] = (f * w[j]) % ML_DSA["q"] 
    # n_inv = pow(256, ML_DSA["q"]-2, ML_DSA["q"])  # Modular inverse of n
    # w = (w * n_inv) % ML_DSA["q"]
    return w

# 算法 29: Power2Round(r)
def Power2Round(r):
    r_plus = r % ML_DSA["q"]
    r0 = r_plus % (2**ML_DSA["d"])
    if r0 > (2 ** (ML_DSA["d"] - 1)):  # 確保 r0 在 -2^(d-1) 到 2^(d-1) 之間
        r0 -= 2 ** ML_DSA["d"]
    # Step 3: 返回 (r1, r0)
    r1 = (r_plus - r0) // (2 ** ML_DSA["d"])
    
    return (r1, r0)

def mod_plus_minus(x, alpha):
    """
    計算 x mod± alpha，使結果在 [-alpha/2, alpha/2] 範圍內
    :param x: 需要取模的數字
    :param alpha: 模數 alpha
    :return: x mod± alpha 的結果
    """
    result = x % alpha
    if result > alpha // 2:
        result -= alpha
    return result

# 算法 30: Decompose(r)
def Decompose_r1(r):
    # print(r)
    alpha = 2 * ML_DSA["gamma_2"]
    r_plus = r % ML_DSA["q"]
    # r0 = r_plus % alpha
    r0 = mod_plus_minus(r_plus, 2 * ML_DSA["gamma_2"])
    if (r_plus - r0) == (ML_DSA["q"] - 1):
        r1 = 0
        r0 = r0 - 1
    else:
        r1 = (r_plus - r0) // alpha 
    return r1

def Decompose_r0(r):
    # print(r)
    alpha = 2 * ML_DSA["gamma_2"]
    r_plus = r % ML_DSA["q"]
    # r0 = r_plus % alpha
    r0 = mod_plus_minus(r_plus, 2 * ML_DSA["gamma_2"])
    if (r_plus - r0) == (ML_DSA["q"] - 1):
        r1 = 0
        r0 = r0 - 1
    else:
        r1 = (r_plus - r0) // alpha 
    return r0

# 算法 31: HighBits(r)
def HighBits(r):
    r1= [Decompose_r1(ri) for ri in r]
    return r1

# 算法 32: LowBits(r)
def LowBits(r):
    r0 = [Decompose_r0(ri) for ri in r]
    return r0

# 算法 33: MakeHint(z, r)
def MakeHint(z, r):
    bol_list = []
    r_plus_z = array_plus(r,z)
    true_num = 0
    for i in range(ML_DSA["k"]):  #revise
        d = []
        r1 = HighBits(r[i])
        v1 = HighBits(r_plus_z[i])
        for j in range(256):
            bol = int(r1[j] != v1[j])
            if bol == 1:
                true_num = true_num + 1
            d.append(bol)
        bol_list.append(d)
    return bol_list,true_num

# # 算法 34: UseHint(h, r)
# def UseHint(h, r):
#     m = (ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"])
#     r1, r0 = Decompose(r)
#     if h == 1 and r0 > 0:
#         r1 = (r1 + 1) % m
#     elif h == 1 and r0 <= 0:
#         r1 = (r1 - 1) % m
#     return r1

# NTT_dot
def NTT_dot(A,s):
    A_NTT_s = []
    
    for i in range(ML_DSA["k"]): 
    # for i in range(1): 
        d = []
        for k in range(256):
            sum = 0
            
            for j in range(ML_DSA["l"]):
                sum = (sum + (A[i][j][k] * s[j][k]) % ML_DSA["q"]) % ML_DSA["q"]
            d.append(sum)
        A_NTT_s.append(d)
    return A_NTT_s

# NTT_dot
def NTT_dot_2(A,s):
    A_NTT_s = []
    
    for i in range(ML_DSA["k"]): 
    # for i in range(1): 
        d = []
        sum = 0
        for k in range(256):
            sum = ((A[i][k] * s[k]) % ML_DSA["q"]) % ML_DSA["q"]
            d.append(sum)
        A_NTT_s.append(d)
    return A_NTT_s

# 算法 19 sk_(sk)
def sk_decode(sk):
    p = sk[:32]
    K = sk[32:64]
    tr = sk[64:128]
    # print(p)
    # print(K)
    # print(tr)

    index = 128

    length = 32*((2*ML_DSA["eta"]).bit_length())
    y = []
    for i in range(ML_DSA["l"]):
        y.append(sk[index + length * i : (index + length * (i + 1))])
    index = (index + length * (i + 1))

    z = []
    for i in range(ML_DSA["k"]):
        z.append(sk[index + length * i : (index + length * (i + 1))])
    index = (index + length * (i + 1))
    
    length = 32*ML_DSA["d"]
    w = []
    for i in range(ML_DSA["k"]):
        w.append(sk[index + length * i : (index + length * (i + 1))])
    index = (index + length * (i + 1))

    s1 = []
    for i in range(ML_DSA["l"]):
        s1.append(BitUnpack(y[i],ML_DSA["eta"],ML_DSA["eta"]))
    
    # print(s1)
    s2 = []
    for i in range(ML_DSA["k"]):
        s2.append(BitUnpack(z[i],ML_DSA["eta"],ML_DSA["eta"]))

    t0 = []
    for i in range(ML_DSA["k"]):
        t0.append(BitUnpack(w[i], 2**(ML_DSA["d"] - 1) -1, 2**(ML_DSA["d"] - 1)))
    return p, K, tr, s1, s2, t0

def array_minus(A,B):
    d = []

    for i in range(4):
        w = []
        for j in range(256):
            d_temp = (A[i][j] - B[i][j]) % ML_DSA["q"]
            if(d_temp < 0 ):
                d_temp = d_temp + ML_DSA["q"]
            w.append(d_temp)
        d.append(w)
    return d

def array_plus(A,B):
    d = []

    for i in range(4):
        w = []
        for j in range(256):
            d_temp = (A[i][j] + B[i][j]) % ML_DSA["q"]
            if(d_temp < 0 ):
                d_temp = d_temp + ML_DSA["q"]
            w.append(d_temp)
        d.append(w)
    return d

def mod_pm(w):
    """
    計算 w mod± q，將結果限制在 (-q/2, q/2] 範圍內
    :param w: 元素 w
    :return: w mod± q 的結果
    """
    # 正常的模 q 運算
    result = w % ML_DSA["q"]
    
    # 如果結果超過 q/2，將其調整到 (-q/2, q/2] 範圍
    if result > ML_DSA["q"] // 2:
        result -= ML_DSA["q"]
    
    return result

def infinity_norm(elements):
    """
    計算 w ∈ Z_q 的無窮範數 (Infinity Norm)
    :param elements: 包含 w 的列表（可以是一維或二維列表）
    :return: 無窮範數的計算結果
    """
    max_norm = 0
    
    # 如果是二維列表，則進行展平處理
    if isinstance(elements[0], list):
        for row in elements:
            for w in row:
                norm = abs(mod_pm(w))
                max_norm = max(max_norm, norm)
    else:
        for w in elements:
            norm = abs(mod_pm(w))
            max_norm = max(max_norm, norm)
    
    print(max_norm)
    return max_norm

# 算法 2 ML-DSA.Sign(sk,M)
def Sign(sk,M):
    # sk_decode(sk)
    (p,K,tr,s1,s2,t0) = sk_decode(sk)
    # print(tr)
    # print(s1)

    s1_hat = [NTT(si) for si in s1]
    
    s2_hat = [NTT(si) for si in s2]
    t0_hat = [NTT(ti) for ti in t0]
    # print(s1_hat)
    # print(s2_hat)
    # print(t0_hat)

    A_hat = ExpandA(p)
    # for i in A_hat:
    #     print(i)

    u = tr + M
    u = shake256(u,512)
    # print(u)

    rnd = "0000000000000000000000000000000000000000000000000000000000000000"  
    rnd = hex_to_bytes(rnd)

    p_prime = K + rnd + u                                                                                                                        
    p_prime = shake256(p_prime,512)
    # print(p_prime.hex())

    ka = 0

    z = None
    h = None

    # for i in range (1):
    while z == None and h == None:
        y = ExpandMask(p_prime,ka)
        # print(y)


        y_hat = [NTT(yi) for yi in y]

        # print(y_hat)
        w = NTT_dot(A_hat,y_hat)
        w = [NTT_inv(wi) for wi in w]

        # print(w)
        w1 = [HighBits(w1i) for w1i in w]
        # print(w1)
        w1 = w1Encode(w1)
        
        w1 = BitsToBytes(w1)

        # print(w1)

        
        # w1 = "D504A92AB65698B2ACDB8649D032719B112C622AA991674ACAF29819E69969E3845E03400C542C1664999B033E68979482C79CD12485E1A912E2A88A1862AA1A38200F7271401981C878712A2388C5A024089839677516C592A08ED59898073DE97325D8B929244344266075CE5AAA85018DCB05648AE36458CA6D2204649C1605AA001852553288577A04019D536120D948510BE7504884AA83021ECB739DCB25AA51E12D1C713003120424A8321E40886A949C42F47159C731D20A5010302245D41457685C1A2886E7C660D1B73C21612501C858617064AA536081209A8677A6090388CC23A18CBA06E12666C9A60555331917382822A452DC823487332A46711C5763799B760499B1040C3548C4B34A413281D1428D46B1A8D1909E8AB65D2A15454734149D0A482B414CC85282CE664D5F17299A708C46C21464652D117429695AAD650225C8D28062B0A5A7558A280726D4159E58B2A5494938968819A48448C6D490229541581581126A4066554AEB52AE9CD918A7111E122659D9B565854332C8788C2B824AE8A3790421488F64566AE20D4A35762543045FA159E5B510CC2910D356250F3A08C73251E9536DCBD10155A1350F859906A1250087984E5049C6DA241058301B856007B35A857078E6D934C7C18DC68A481D9361E5624565048CC23645A357AECE05759B562A1D041464520EA5838545120A59796669793018C9112041AD03B92562023527F77189643149F19DD7403A4F765484370469B451D4285228238CCDA708DE5A7D1F159A69F324A3537660D19009126116496CDDF195C913201D36766BB4144389095BE3248C938C477A258AC685839909950A0C0108AE8C915EA4779E188359122885DD494CEBD02846759E0230655FB66AA278AA60B03418A66C8E7539D11960808689E109921AE42815072542380D96C58D8606812622128681A05D43224EC0385B575A8FF08024C76890DA6D0A80241EA12919178EC3C6480D80895BB0205571ADD4063EE0C9250517A4666172D803492808020CC594DE927522039D95531A2A2AA21966626B71792BC8045E0024001849"
        # w1 = hex_to_bytes(w1)

        c_tilde = u + w1 
        c_tilde = shake256(c_tilde,2*ML_DSA["lamda"])
        # print(c_tilde.hex())

        c1_tlide = c_tilde[:32]
        
        # c1_tlide = "0000000000000000000000000000000000000000000000000000000000000000"
        # c1_tlide = hex_to_bytes(c1_tlide)
        # print(c1_tlide)
        # print(len(c1_tlide))
        c2_tlide = c_tilde[32:] #256 -> 2*lamda-256
        c = sample_in_ball(c1_tlide)
        print("c",c)
        #------------------------------------------
        # c = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, -1, 0, 0, -1, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, -1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, -1, 0]
    
        c_hat = NTT(c)
        # print(c_hat)
        # print(s1_hat)
        cs1 = NTT_dot_2(s1_hat,c_hat)
        # print(cs1)
        cs1 = [NTT_inv(csi) for csi in cs1]
        # print(cs1)

        cs2 = NTT_dot_2(s2_hat,c_hat)
        cs2 = [NTT_inv(csi) for csi in cs2]
        # print(cs2)
        # print(cs1)


        z = array_plus(y,cs1)
        

        # print(z)
        # print(w)
        # print(cs2)
        temp = array_minus(w,cs2)
        # print(w)
        # print(temp)
        # temp = w - cs2
        r0 = [LowBits(w1i) for w1i in temp]
        # print(r0)

        # print(z)
        if infinity_norm(z) >= ML_DSA["gamma_1"] - ML_DSA["beta"] or infinity_norm(r0) >= ML_DSA["gamma_2"] - ML_DSA["beta"]:
            z = None
            h = None
            print("again")
            # print(z,h)
        else:
            ct0 = NTT_dot_2(t0_hat,c_hat)
            ct0 = [NTT_inv(cti) for cti in ct0]
            # print(ct0)

            zero_array = [[0]*256] * ML_DSA["k"]
            # print(zero_array)
            w_minus_cs2 = array_minus(w,cs2)
            w_minus_cs2_pluse_ct0 = array_plus(w_minus_cs2,ct0)
            # print(ct0)
            minus_ct0 = array_minus(zero_array,ct0)
            # print(ct0)
            # print(minus_ct0)
            h,true_num = MakeHint(minus_ct0, w_minus_cs2_pluse_ct0)

            if infinity_norm(c_tilde) >= ML_DSA["gamma_2"] or true_num > ML_DSA["omega"]:
                z = None
                h = None    
        ka = ka + ML_DSA["l"]

    # print(h)
    z_mod = []
    for i in range(ML_DSA["k"]):
        z_temp = []
        for j in range(256):
           z_temp.append(mod_pm(z[i][j]))
        z_mod.append(z_temp)

    print(c_tilde)
    Sigma = sigEncode(c_tilde,z_mod,h)
    print(Sigma.hex())
    return 0


sk = "5AE5192442A0894AC775D84419BB7EDE9E8143A6E21CD709A47B58545EAEC7F59EAD08050900CBCF4093F9327CAD67B7600D9F8425084B6905BB6550F426F58B27B47C434BC194D466D83C14BF5ABEA249E05287EC80D1B56BD0824E4EB84CE1CD4CCD0DBD1BDE59106AE10516E1150E841B03E759DFDD930F6C7BAC857530451C438E128029E436491980441BA56913074A8A8831E084641A152C40B865C9A22100800C13828C1C080A84C850221688241100D220085302695B1881524812C832881CA970D91445A122221226449106800413504BA86DC126321C312288486280A64463C261C220220A210653C8910919925308200988640A3100CB9868434050C2A06C1830482138640CA80D03339254C44D42B29014B9500400220BB38D8C269010B62DCC481261980522A03050A489DA2225A120859BC80480129252906193985182B470584481D2806448C669C8B65164B6219C964143262D1294641887111414500A166D64364EC282095C980502202683C48113A20559B02D10090DC084519CA6215C8885E1088990200E11126D182129D422421C2811214611582829482830A1400EA4400A428040D0882504C72111B20C8A148123002C53B688943411E0448140044A03A4111B042C6330715204285114864B8004E3B649E4B831D13264D814094B468881424A01430C41388008478A20378A01A8080831228CB285CB880D0A13499C860191848D04A72192A80181248959964D0805202341511A36081012842407300A1820D39881E0164A0AA669A2462044240C54084D1B208C923869588428D1144E63920022C94DC9320800497111A28909B384234591C22452D8C220C810610106669B062959B24C11B38941149083886108C488D1462682B00D14B8685AB65080409119B38DE2A44D1A0161981489A196610181514106019B0804C3C461A1823010A32D21876098103190425252145293A241534692212332A1828D40286ED3288AA38689D1048E1C936910970DD4125184C891D4246A194609E33426D0A485481605618489124126C9B6281C2111A3860543C05158386121828C1835645AB68C04892C03422EA148065280910146852219205B3292E1440404A908C9C884E4928C5342400C181010064A1BC07142887010284D2241602393905A88455A186E618445400884139084D4406964140288006A63380E18362E98160C04A7894B964D04844051B08419450612912411B410E186895A00318C129097956ABE59E75ECDE4E7482F0BB70D6502309163C9467EA51E7B467C114BA884CBDF37291400166F7E2450D27C5A20FC1130192F1B482740712446605F49EA14E3C35515D05EFB062339E69349C7D416830F426282A4C0C0BF875B0F8D98BCA9B55BC1E199C9482A8D5CFEC68166F9545F54F3B0BF14B2117DDC6356966BE0DD3CD42FA47EEC9FE4058A0679F3EF50F7306EDF0DBC58D2020702F3C1F0B23A70C4B9023B43E7EC670EABB06869A3AA3D315E9606F0216BAFE585E0006BB6656E1C146E2396A44D3B545A1D722B6BEDD33B40433B7A9A0B91DB43A0AE280F57DAFF4EC8E534885C436A6745FDF857A093F9067BA95229CF52D0C8DF29C52736EFD4FA98FC4C71F6A94983F8F008F29178BB53CBDD56A045408151FBFDE28941F7D7446D5C2B2CAB3C418E04C851D230A49F288713F3E7221CEE86FEB67B469B076871A7CB576D423B5CE20FDDCDBC6F3BFE841C494E6D6050BE92AED653F7B387CBD662AFB7B01401609D66EE5739BC0E9188EF3F61B23F6402A8C60D6C272EB27E3C36ED15A7D95E1BB15C8DF6774170CCBF50A2628F1E80F3007BE33D0C5D86C61BD927BA3EADCF000C5B4A1BBC0889C42183A1FDFFDA0FDEC7A2CB5148953B3C428F1153E802B0E60F39EC4CF4108DE315B8870E80790E6B67799499A768A60F0E70EE861369F0B0110498B206B01AEC9C56CC335221E675F0DB77B6A2F9BE317407442F152D32E2FA57054C2F05757079D29BF85077E571973C5410743C679AEC39B51163A9B3AF4049647FA008AC5E304F82AF0A0F28E5CE3040C8D9AD6799BD4E70B7CA23F965FE96539EBE04ABAD5DF057FE26437FE44289ECF68807FD2C8900A0D3C5B3910BAAD7AF92BE09B83D0E16CC617607623DD8A2A8ABAE82C48C1B383C13DFFBC62CFC3F45B7A0150E799868D55AB5A9F67EA0D4D35D9D2EB0317768E1F67FFB8DCDC9A6FF9FAF58BC260DE56A0165900F4C54DF209CC148CB93469C59CE5D0576BD2CD40BB0D0A9EB21A41EADEE0039D603FC2917366B7F238E75E431ED7DE076E9E72701DB873D86F73A4A99A82538FDF5611FC42BA4D899BBEE81EC55E997A697A9591AFCC2425A570BD026CF0F3DA4999D0CE7C2238037D8077B3E13290DF420A41771548FF2C2D89416FE776481236B3AE22DD2A21EF8EDFD5E2CA526A796B568AC47B3CD4FFB0743771E647138AFD6ED35AB242B0252DD19862AC4DC3310D905FF68DB2F53038D176D22D350401857794DC2E2C1443696E65D7886759A5ED653F14D9F804FE55E45DB4090C0E166C01F1FA8AA939B8D83CB3B1B65ADF4B31656CB8D04F21452BF2B6B36BC18A8EFA7A0E4AB67479844DE5EF231C8E8168BCC252411E67EB3F6598176F4D6739DA69AB952CA12B7A951B2333A991477CA51E1183D2769CCF90FA87EA2C62DF0145990C787AE739D5802E9362E5EDF969DC71FE7D2542A4DD1EBF12A08240BAB3FB4EC2126DD0C0AC740EBA06CCA2AC6ECA57E4094ED4C818965105037D1EF2E739DC2D58F2554C40AF69ABBD483A896654C5A26668691A6A8C005ADCA4EE51BAA82DB5D7495E29FBDE6DADC67929A60FA95267A1AB764A1A41B3CA0C3FE03FB5A8400130E6ACE93197D3DF50FA789F16BFBE6B292FCC2E9C03C792473A70AFE13935DF76C2E5A2FAB154B5CC5723E5611BB363B621EEF74343CE19AEED62BF771DCAAE501977CD573A412F15FC8D294A512B7B412F462298713889F6F9E7DC35A0541A2A306CFB9AECFB74C0F94817AB81C804A0508718269E5691A24A2CFAEE8D0BAA69BB30FE04C45881485B2D67AD09D5EBB43A3508AA45BA2D54CCE4E7FD7B679E735A4D78E8DB1BB1583F1C91B0330D2AD7A80C7D2BC60DB220287413E9B4DF7F68E8A8541C1F1F85D15BDD51C6902DBA86A67B2E4CD86B92E7BF58724AC5A53219216B78BD1B50CFBE9B468A667FC6C4F35A610E7AECDA8A12DAB0C5A658005879E2608EA6549999DE0C396E2E0E19895E77A68356EA29BD2A1F24BE4552E679DFF66EFF39235183E26DF4D23CDD284BE2D9D706A301CCF33D0C85DAE62ECCBACC1503246B853603F68DB14C2E0B972BE2AAE6856BEEEF83DE2227AA876E5DC62636E2E95BCE79597E01A5A3FEAAFACC205AB09FFF7641BCE3ACEBDC6E6AC2C95276148543F2AA1A4E949DE5F35F4DC1048824389CB90910D47C7ECEF591BAF68D6A456B79278F356A6C34AEBC370EAFB722F0791033708C24A3CCFAEDCA515C6DC1B83B85251A2F665B3777E1805FC8F98F9789944139C60BB8AB0BFA34D3783599707BD44CC99D2E4ED71F31EF7AE6B8FBAAA4A5377DF40F8D6A4C1F720159E57718C78FE40"
# sk = "C1623CC91C677078CAC1FE857F7DC40809F390BA0D51BE7BFBAD9B55306FB2E1C5B3DE04C3E7FE3E3B24A41F45F5FDD3E73A72EAED3B3F57356483D7CC102953873F519C79E445456157FDE4EA5F64D613E5ECB8C6258484AFA36AC4D31AF313FC17A5835184087F04CBCB7AE63D41AB1685FA02D1A64F5D0F844F6FB5213DB1C0444190B48DDC04111AB824DC342C19164CCB242803018284C2416206650A280D2020900A83314CC62DE1824C128489E0844518A22D141628D19290D01805490010E284500CB409E11429D2220118A30D10B561249449C2201213B525CBA020DB148DC3280853B0498B34262045919A424910098C89200553A00C12430060C060E33869C4428CD984648C8009C3C844E1886520478060264601140EC1046ACC4045E444921921921AA15023074A022444903470C33250C9384D824249444042809060842811021660C242251C102EC034060BA74D81224C5C286C50A861009388534062A32671524268D42225D9106C08314C231385994608CCA265E222685C804904080013236994864C23A03014184DC0063114488C5AB0850922080A396DD29045242588890286CC18858886700B474CD02461DC86511B932CA38031033764092446811802503671E44624A41632C9868CC236700CC489038910601670428811414042A0A224D92831E344451A2548A30281C024701348224BA06003C38DE1184C59A64954A46810348D4B34815A00215C24018442685B088E920002DB42508A3071A39881811871E4A069A0180603203022C68C8212824A180561A4311402301494691840619A482919868051308414A30C01350D94362DCC220820368624280E623200531045A2388C1039498004465AA86C892682E2C601CA14652340704A246502882520B56508025124248EA42408018270D036804940211834681C862490241018239023406841384D1028718C4226D1B04099249214219140362C0B216689A268A23280014545A0320C89806492466DDA0802D0326E9BC808D2A249E0006D5A226A93B42020364E413669A1124C10A2901CC66D99B26C92442600004A1AC36C9C4221E2B66C58120409850420884D19A930D3347159128D024271C0140603A790D1806C00296D58B8011A29441A308124A58C82B070D2B60021270E48A809248709192585593462A4460C13160E8B844C4AC07154946D22235003244AD0808D83B644CB066289C250C8486811407242C409138268D0B66980B46D52097202586725A9DD16DFD951EFB6F6FE3231A2C471231B53057FD316DB0876691543D51B66FE1CD1ADF7A9A73C97CB74056DEB19AAAE8DAEC4EE2D512F19B5521DF260609A5F1DD23CA4EEBFECAEBC9CB0DD9D612D0AF491655C6B22A2AB52C6BDF09B8C05784D2BE8832EE184F7D7EEC0C15F06052258A5DD658C74DE50D9F351979A1B0E5D4C94832DEB34A09F08422C53BE60568F81F379B76F5C1F85A0E74434942DC524D85C26A8489C273643CDBE8662EE0D7EBE56C7E4AC93D84016D99C0C180D24B6B3A9234E60A01A83DD64446DE5DBF8AA770BDC66097BAD4261AC8878450653F21EC34CD3E6F1303C44A4D29C9E801D6E87DEF63D4D35F7516A992B788913829191A09E9526F8CBC361D6530EDA7EC9013AAC629177CCB744CAAA8ADAC376F0222B97997F273BF7098FC39A63B899CF35D2E9D397F0D2A49D320B03A9FFF21D98D307DFA94A328E04BEE9D58B77C53303779973495E3EDEE49BAB18E3634E23E363E1F46F087D8CFBBBA8A210661C6E790A6A6449E0CC2738DE05A034BFEDD377C0AB454D4F39FA6F4E91FDFCBE621D0AF8F84197B4762CAF6D5992643A16BE5626E52CC0ED24895F629B02D3CFC92E98BEFDB1DC80475FC9EA7A40EFBEF650355B03B76E7887BDBC2D4EF8FBCDD6D95E260FE6561F17C44E1E01F6712DD0E5F7EB89766AF3FC9370A7C168F64746FB8F744D146CA781C6C708A963EB90858930875223CA379428A71D8008C70264C87E420ECF17DC963D3D7E3C8F280A8716EB636FFB857E8AB92847CEAE7C77FD2970DA98D08E001AC9605BDD6A07885B330F04AF2DDDA3EE6E9314C012E3FB14358D67070014A728B6ED5006622052EB43B77EA3E5DDAA0BB1C1C6A973C8A455786A76A673B5F4BDD339258A7218F4A210F0BFA65B4A07EDBB199EE755B8F60CC001026107163EFCEFA41DF85065D46FBA9471513268517F06B5914F0C625F3C40DCFE428853BB58B10FC19C2685007AE56F42CD6730CB4A6283BA4AC4B40AD9D9B2FEA1C2916111C39BAF1430612E569227E2C6AEB11E0451AF81E308F3BD59CBE29D940E2CA1653F6D6C70CB1D3358392F2A97A34FB9BF05203FF507DA2041AFD85E4643A77CFA441963E282B7B2A5A2B8D293D036CB5143F3E01722E589840DFF12186B7D9799A3D74E99288FBCDB6D2CBAD2E5FD4B449AABE16A12924AEBD33AE5F61856EC66F44C0B09FAF4D0C20CD0C59D760368B335CDA9422C695653E06C0E839EA7FE946237B222F61F9F02B3AC916D030560B8ACD07A41E7D54C402FA7CF6983F09D3E46EE6A7F786FA39DC369E0EC4A30BF734C636DAE26D756AA781E40BD1530A0BDD4040AC17329DD6B90534491CB2AE4D179C2215CEB1F466E7D871D42FB21106834D72BBD656D836F09FDFF875B0029D9F3B50BE25BF05D6A2B0EE322E969247609E16D321CC928C3C7F9CAC3C9F53358D066EE23B52837FFDA6CE77D6235DA4FC06869BFFF3FBA209E8255EB6DE7DC40D0C89969DE0D33B5E54151378BD3021C2A8879BBACEF98AC7F542CEF27F8C639FDD3BF0A0194BCA92E46D6AB5C44C7CD960B1409A088304D807AE67442712E3F72171E06FBA8CE1CE2A6A15562F6BD6968D15339233C5BDD9A5A9796C1DF657F08BD90D1EB5126314B16324A63ED2E8486716B38DFDEC3B14BFE21B2D710BC4DF2ED5A45993DFA197E5B190BC11275E5D9B2BBDAD69E819E4FB4EC859B8C6D32D6F21A7CB35E62ABAC2892E0C6C76D6A416FE3E5CE80361204CDD30C584344C3E61BF91A239B626D8C57750CE0FC4BEAB5743F93083BA01FCF2A9B4CE04BB80AD8B3652C28F4A81D96ABF4716E8EB090817710AB2D052366391F1897C7512F221221B2EEAE39D36C24B919CEA2EA7EFC42CA4FD6FEF946BC241106F12FB82B12D947527723E32BF5029EF8E6C6EEC47C54FFA329D8832F43811EF85FF1B2133FB6240849D7435EA99DFA76EC12ACD6E7AD590889441FBAF7278F019849872D9F4A281764005CC34951CA11C2CD1CE31E51CD2C9EA8E4185274188718D56780DA3F7D234FF14422697B3B4B3936BB1607BB9F048A69A293C7C9DF377E380C9EF8B39990E6D7FFCD4FEAD58C1E5249EA58F9ACE95BEFC1A904B6BDC284577D8FB618278D1F132DE15E55A09FA1A558999298A02B3787C5E53B34EE7D017599CEAEFEF80AAE2953E1CEC97E880349C2AEDF507B3AC853EDD5C0D8081500DAA684A20CE3462E1338917748A2869C9708C5A282FB7D66CA0AADA519FC56874D158D8951BC66EDF57EAF987044C7349CAB7C91BEC1655F22006182084F1A65C356CA2AE8AEACE36D3C5EA966C23F047EA10F1681B679"
sk = hex_to_bytes(sk)
M = "DA5FBC7F78116BC8537E8E522DFBB6F68710FC36AE5AF0ACE5CFA3BA4FEBF6C86D966A44C2CF53CCC4FF5B9CC4E6403CFF3C23B4F292AAC01E35A21AB11F0707726E88048DD05887448B870741FDCDFB4451E1216FA2F89D90D872B67B4BA546C8CBF504A46FC02036FB5B287BC82DB9E2D835802DDE3075C7B703ADF4FAE4F98840670964A1ABC61105C3B99C78609605E7F17CD262BE67F7E7A2C6ECC519ECDE8D5B76C21FE5C15859FC94382608A15C7E656AD8E0042CA649EB8EEB59B8E266C244591B265B672D4654C5FF28296707815C647DD11AB3148AEDE24E96D7ABD6C479C0C367B00E464804184140152063153EC3982987618F7D9BD9812DF3B95DDBC47D1F96C752C01B742255946461509EF7A7A67DA0123D670845BE07725D9C1E9F419B4B9133EBA36BC90DE45666C40EA664D93A16948F848CDB9688E116B00B0A4F03B26BB836DFBA93EA6247550FD983371E360F04C9F2793EB769A00BF4049E94F225EE035676E983FC9CB01D15EEB621CC0D4B840EE777ECE351EC66C4B28A36FAF02C42B24804E8126E3852735C2A6F6E201662DC18E125210C78197372B4787A8163ACF4B758921AB23ECC4AB8F3C1DB3549050E26F9C35594DCC1C27AE5999DB695A19681FFD9CD4416E0C79E3457C0B5144F3993E945F6006EA0F541B1C3F473D78F4FED4011E07D46F8DAF7998BBD4A9F5161050D9982DFF28C72E15D158A630B8972E8E2B70611C299BE4BD3405350D2FEB84C93E97FE4DFBDCA5BCC9B6708D7E542D7101BD8D5589BAAEC5649E1C9844C37C5DB0556BBB6B2EB577FB65909B1EBFA7F1590D53D98FC9975BC06F7AC581FE22066BACCA0375AE09DBADC8940E98A38B15FC190523FA6D0CF326D7495B5CC948AC994181EE0DFCAB11722E1B46AD6FD2065442D1FA06ADF21FD9187B55320F554B929BC795F367AFEF11A5CE4128AE32E6C1662D013A91456AD292DFB8B4C161EA7A4D5B43AF63BE7BFC5EEAB9D1E3198F441AD70DF9D6BDEAEAFBD0A293F1A6DF07339A4C34C7375CB6096EB06EC035777C22344912DCCF3D0F8DAED1D0B046118A22886299DA5782DC77487CA5FD0D3CFC724769D658131FA415672996CE8E8BED83E057E3AFE26703012DFED31C732D770FFC7FA55C59BC3FD68C34D00738FC9E3DBECCF4B695B99BBD6A0082752E3A95150AFFE793D8F7FF19BAEFF7744688445E7B561294371E1909035929D654606EED6BD011D2CB0512B1A0987827BB07F14E0E8F0207519DF24BA69AB788EFAB21F1BD69BCB14AB44AED8FEF80F1F63685C6A85100DA1671405F8D6454FCD7D5FB6656959AD68D3E1896C6EB4967615332993D4207DB6B0F5A6E33EF4B2494DCDBA368A052FB8CD48A9E215D30C8C9D37DDAA6B4F3080744E6861B9889E23E9D964F75C5BD5E1DEA98EEEA8E66C60DA73ED1E39115EE0274F2747858D5D644C09B5EFC978D4496A007DAC35F2F68B1F9A3B43A638F38F663E6124740234119D6E8DBAF933ED0FD5A02FEFFF7AE3235C82D90B2F8557DDDC9102FAAF8181E6EE3E9BCEC78E4C61F73FBDA23D4382E5050A0E151E3F51BC22347F9B1A19D74649558ACFF8B21AF69EFFF78BA3E83CEB9EA36D4799272E10F56D3C151209C99105A133B665EA51E4A245D37E7A0F84F5222E3A0401E67BFC1BAB6269CA4A87D3CF062CFFEEE0B5EE5FBFBE1029E93F46FAE68A91CFBCBD5CF8B78F122AF22A11E77095DEAEBC96F1613911E02237F795AE717301499936B440E07B32DDB09008276C9A5A314889E8B9ACDF32D6695AE2931CC29ED1DAFDB61B708B52F9888DA67ECED25217F1A5FC1EE7D482917C7C7E44CA7F0508FD3BC94BEC116A630ADB08DDD882A221DC5D2C60A2E9F2F849B3E8B5DF150EF753C35251850D0B4980164F8C07339E035D5B2EEC4BEEFB885E261E401BDBA408869951075DEEED3C7EE7452AB39856D240E954FC8A4BEB01A0F79187BB72DD2925E63B3DE9E16CDDC041BC3BE47F318DA6DC6A9AD8710B18883367E374DA58D97F00B1E75AC8D4658F04295223C8C4F61B2CF7104492DC7A0C6267F45B5A4A2D258239455A31D265BDBAC9FA6E4A1812043C9112ACD4240625F08B901263EC456D2A5877BC9223A6C483673BE5CAB8C32516AD5B956688A01374AA48789D53AE79E7FB109632969E45684804DAD54FAB1E94A19C2A9B53BB9079F484C64A924C9C940FE5A3ECF29C739E3826311E42B310CF75A47B932BEF104CB27FF35D51E3FED9D724D90A17982F2897E2FD09E555977CD668E67A34216637380B8720A593FFC4175BB27E293C652C2DD8C506F4D1F551542EDBB31EFB3C1BD5DE6315280BB04BFA53CDC2D38C385C04E9BDF389745ED394147063CE3639ABCAA429C68475F9D466321EEBDE9392A2A2A6EAF53FDE20803B76B0903DDC6C81874A81AC147FCFB9FDA970BA5D87E4C346DDB83B60A718882E16F256A0F13969606C43D84AFD193D7BA3CFAB875646401547458F36DD53C2182B36B84DE8F8A50E62921A5B011319C555766E46EFECEB239297DFBFABEF3AE370CF48A08BC073B1E16A8C840F2604F75F39B3F0F4847A445A15F0B946D423210BD32A09A9EDF4CCEAA6E90AD1379E5928B66BD3A02C5E2AEAB56E8987B342EBFD9D3C70EED3465D78F12AF4423319B3106AD8BDBD9AA5736E6CC15C7AEE0DC78A1FAB83015CF880DE6249734153F6058F567D648AECF70D1BAB8397879617FD6FB06DA1AF6713E3CE584B214742587A5D35C6DFD33AFDAAF00AFE00E1CB516C955DDA9E0A5FB78DEF914B532F556D7E72E9717BA49A2D0F9EAFB5F526565C58E0FFC1B55138C8DE7A9D6CC06FC9927F6D04440512163B58A236F57B093E80F3CE0F4CCE282ABDCCE284057C4DB6314E05EE0A32B5F20C481F8BA4ADF943CA1B0277119DA1BBC4EA1D24CF7E3DB4C759E98753EFCABE2FB5B1FA593F2AE2B7ECEA96B8E0E5B3FFEEE97DD6C50CFE8602613FAC2D71174984C2EB59E532A35CF4FB0BFD60B8CF7CA3E7D5C0EEAD822648533D3CDE72C787DAA412FC70674E95CE2F5BF58D3646B4881D4CB6DD96659BB1A937B24795B435A103C03CEB6AC85E8FFE9C495082A87854392BEA530D61A7F60B3431455DB85414E6C365F9721ED2DD4F7C8A37B88131F5B2FFB5FC4A40BDB12EACE61AA956F8724C99DA98DAC18F6D33DB5F4A189454C736"
# M = "430B1F46E87DDE9A3D055A7D4D6AB1277B2DA6EDA642896412126391AA2B29AFD81C246EC839929F5C06749491DC4D81D58CC989D8500B6879E8807B1C3AA0B199EB599AEB86B344B77E3DB1AA034C938D80CB4BDCC29B31B710F57C7E491D99B71E97DD6FDA01A0D8A54C7481C2786F64FFC53AD358CF31C9C875ED278CEA03F2BF732372B19252BB9FA4ABF465FA2CFD1C08684D10582B410A8E012DBD407C5140D97CEE768C6D68124B2C84113B58C9A2AA67093B44CC3B6199FF1EFA6506CC28BD30BEC4CEA88411A491DD948DDB09ADFB92C40CA50E709840BC1F107E0CA428C111EC4505C5346E74AE4AB5647C1EB80F9C07092F8D39A975C4890317F9C0EF474110AB941949029BF39ADFB8E65CCAC0360A3EFCEB69D2BD805E4FC8D0620F8E039BC046DFEF1ADB03F5995FF62AD41352D479084EF3E302578B83332506918CFAD6E3BA701C94B0138DF0CF6C2948049274CE61EE0A64E756306273A02D68F3C405883F2F668820356812B2DA3A32B9FF23608DFA559183151221F83DCA18253FCA099FE24728F302C8B7808D7AF978299F3EB853A8BECDA46B8657598BE9ECE8A02DD4B25C593DDCB436B82335EF9C6A7B8426B701C66C9EBBFB3C8405A73881DAB57D1664F3AEC6F5BA19155D89A0A80B5D01C46BC79E1D4338A50B203397CD4B16ACD597A7C77C49917E9FE4B0D761065CB89C758498868B14BE2B6FF758745AFDC535EAA605C3F97648034D2A320264150278A7F1CB114B977C9D6BC1F29295CCCA16B23B7709D5608E4095E41D08B22AEC6289ED402414787062B0DA2387B6DEE76B32E42C51788B65E815E089BCF92D778F49A9707D37FCFBDF8CEF953A48A4201FA0173529BA360BFA6A77200F57FD5245146C2CD7FE8882670EE6878386D06036F0E1BA4B728CFB75806F05BA6409C514731B0BA8DA11015A63A8B5B5AB8C69703185191D12C5611F1407E8FFE3E50FC39C3310EF4091BC09FECC11D3AC107C696EE89F74CD6147830B4B3A971A0027747B62C528F6D858D1F9E67F59496C6B4E9E03FF0A598B26625B06C79863B5F07E265A40175E1A6D6EF3F900F3C4A28AD3E49D4D0B7E4ECEBB79244264474CCBFADA43FCD33F4FEBEB0F7E5928479F869D6A0FE52EB0CAC1232D7F674A057DEC4C2248934A40F5E2C9CBFDD53F71FC3BE06E48E13398ED426D8D3CC82118B7E8E5BDCA248380F4E64C427D1BF2384F60F6A07F01EE62AA1746CB143F26412547E7EF0E8FD1F2DC606F3643DEAF330D81CD6309465F9ED7F34D9B175FE1641D90212D4FFFB91CC300E7DFA0C555F7B35D2AF6A343D1467436EEC7AB95F2C34010FC99D66391377770A7DB8CD4D5C6BBF931092322741929F790E037318D6ADB74B4768C11F0E4674D18185DFB3D051725F93800CD38F58688AAC747F885908804D6CADAEDECB43131D75B18FBA2D4BED8D9BCC2156FB23F8F6378C622153EA8301300D0FCDEF1E2BB4E6F807784EA0171E95C372EC19B05A6C7B8DECE7080A057D29CE5A445A83410EB83B174590647424736A3B6967BCDF8A416A51202CE3F00E4D97DCC2C48A78D12CDA98E94A9BD6CCBE09DAF8085304F6911ECED3547DE9512461E16721322E4E6233BC7CA360A9004DA5AE064514603EFF0DF4E2D8EB04E9574C59F3AC14726C10100C688203F4960197CE696730AD7E558D7B939E3E6E7EAC4E70A7F6AAA80C1F1546E282B5CC7AA193213769B137C7F450AE5410817166F29F2E4E7E962932DF282A9F08A1DEF3E19C251F95611DDA9CFF4E2FED873439B45F8451B9AE06C6B2C698778BC4C742708BDB54CB35B686F0E7FC856CDBF977AFB663DFE44F7FCCE0E0555BE81EB28984BAFBD6FED3F0182F78A1396AF7B7081280864E5E4BFD7C52DA28BB5DE5FFA211678D13D41BF825F4B21BE1CBD29719ABA341E7B0C3F101CEDFE2F709E4DA4B5A6D0C021152AB546837024F4DCC4C45C132A038315A0F1D69AE768F70606D070169AE0818685C4BDB7341BFE15AA0455F535766FBEBB50875246A6DAE86C7B9F6F3A9FE01AB9928A99C13E6628431D41C1506381A63FAAB57BFB3B180F5D7FF59A434233EBC5A659B71CAE6970CC838D5FB638676216E3B16E8BA6C01349A7482AAF32ABD17DF7FAB8C69789F0194022BC4E62B6A6AAA4CDEF13B1E3BF5E1F4FA69F82B1EE3FDCC16DDE1106E3D2C41F6E661E33984DE7AD6021EAAD3E64D8C9CD7B5CB538AF88DB82FA048E5705EFDAC0EF479827EDCA0255BA60771A5EBC716C690CD3AC840FB6FF462063503D68C199050BFBD64533D94E093A47658822A25D54CBBFC689DFCBEB1DDD5BC6190B8F02C6FF3D001AC63729D35C8C50FAD3DCA2E67C5CCC6A8799420B159C7C5CACAB958B423964C489DAB1982A4E2222D700BA5AB772C4A11A44FF64018AF477D054217EAE28FB8E37595941FEE7AF87FD44960A144DB0CE2A44B33DC79B1EE31CAF80DAD620666D0ACEA76841EEE6CE81C6FF1F6D1027502EF89F1595065CDEC19B30E4B5314EFD64031B3B9DDFC6C95A4943247ADF7E4C93350C241ECA71260A454707B84017C5EB7AFFEB5DBB863A1CBDE0062C662308A2E824CDF6397863EF78F62319E2873B506F8A9EE82135B803025D962E609E006961EA3F7B67347518E70D9273893D79530F67CB678D6A8D28A0342BAF904BFC0A69AD575CDA4AB73AF22B52AE5D58372E0C26795CA96A16B8461AC61E6F68433ABCEFCBC16B857A89C475D1A322D34266539A17D485B8FA356EC3E154D37BAFC4CE75829FBE8BC823FAFF15A49F847C286F999A1F2C12B03E8F8A4C34A97588D91971279FFCB100EDB943E636F78ABFBAF88BCA5C55C935F6147E51BF798267E1350D2F5E3F74B339F6EFE86208C5BDE149C5B71056BEE748D06614AFEAF6DDA2A6EFFBB56B0880AF9B201B3C12055D292E3BB556240DD031C29A67BF244F59112BFB6865EEEC1DFE1CDB1E27F0A9E3372638FE4407099D0E54E9A188079C8BB9470BE6F63C83612D80BD60C21B251B64236E5CAF09A11C12F1A5E94F199DBC7C9E394C0B0E07A583E707E5241B8FB33E39BB26C31929F39316F4FDE206493566E17B51CE635420493176D8FD353206EF87F0994F039DF8F008AF602F50D7F9C0051B56227F3A2ED20B29611219FC4376234EB900093A81389ED00991272B739389F1F978A92A3E41F0A28985D697C01240875AC46A82B2FE94004CBD7B1E7594AE38A9DA0E84FE7E122482BB391538EB8E85AF9DC022CB32CC08FDA7A95165725EC29A0F824F97F0251BE636B57E0791A7F50EE190D45749472B29A674239AF95B373A40A6E0E09C674071186B125EF5AF72CB434AC0AA990341F063EBFE30963451491474B603733959A23A6D5B8A378F15A5A5B9CE4BA44BAEF6AA531AF5097ADE73F64AED0A541784119665F548FAEB447DE108AB74A74893017F0A1AF84AEF0730B555767B0CF6AE502E7693374D2E01C54C64E411AA93C96DC5FA010267B387299D4376FBB190E1C51A560871B559FC800D82ABD119A5732B50270BEDBCC8A636E7499149AE0E47F736FDB71EBF1995D1E8BDCB0EE96E732E8C2509F98717C3D174C78A4A2BE43DD89195408CD300505A219305809A1BFE7294BC2EECE6D98C768A8A1E0F74B665EE3D652AE8E008EBBB11F0D2148E4E5C93D7FE0190D27B3EBB7D2194BFBB624AF3A894CEF7AED571954D006824950A981F4ADA72BEAA0D820C5DD9BD519D39BB7915681F266DA66D49BDAB9E55879B953A7332F877DC5F5CC7BB3C9E1C1F2E41EB55EFC02A450B5142514F1E06D43E48FBF5DC80DF241169D5936432BFE9BE99DCB17293CF968A17F3111C884635EF2BEDFC87DBB80BF25EE9BF57B55CFE635FD99554F5FF2B4482D1948BD282FA282C48C0302348982E30A772BF14195CAC7FE39F836E6238EB1E1FD074E63B9AD0A8D37111087E47FE5D04B62DEB496353457BC76C53A2FC9D5AC9AE6A47F632E6D45E08786DA128464FF2266BFF92B5CD89176A19226F2EB14CDEB331C497F1836FB6C0A117ED6BAF95E9DB8254487B0DFA7301397AA29D95FF2065D851BD302B747AB47BA0AF408B51E4BBBF042ED1B2B604EEF4C266FE243261515778BC9451A8DFB025FA3212E868C3A078C7CFF65077DE94E50ED90A259FAFAEB398A94FF15C838EFA7F49904BEAFCCECD8C9ED4E014EA00C7AEF1D437DA306E8B7DFCE536912C169BAF0A3B78A643D6E210E5550E3B2BAF7EDFE01E721E3D05BAC1378EC1DFDEB2E2AC0F0BC368E0A8CC64F375DFEA2FC20CBDC515440FC2ABBBCEA3584E103BD686C5403EFE376D44F5242D35C9F9D35E1A869FFCB6657823EA0D4331ADD5CCFA99BD6EB3494A48ABBA7B7ABC32ACB8FF00512E1B0AD493F579898847E328C06FE05FE282F8D4AF48A1AAD0495AF1AC7354275A6D45AD5A7B3F6787F893EA558BC5D4ADDE1F0D265ABF73C86550D25C00821C3138B385448E3E02901E2E6EBC6A0F211CB6F22F8F865F0DF3893B987DD086B6674F5464ACE18B9F0EAE948667B2FC04FECEA3E2B7EA6B869D5F66D02D4DB124A59621B96E0DEFBF99A91AFA0CFD6D5A5968E62EF42B4C8908C3719BA0254929A9A183D50C566CE4FC970E047474490FFB07F576765AC5286B2E0FDBF1EC56A8AE8E6F560C69614FDF5C89BA53B8B7189E6388F7CDF7B819F78F3E6EA54C40865262BD2C8CE87284FEC36E2E73BDB8AA9CB5283272A90A6BBBFC3F7FED5F124E8BFD770B6254CDC695FBA0D8627315370E2CCDB89BCC84C96E20805AAF087F9E9BD1A189F4C6D66A6DC3FEF773788B3B57EF876CFEAE1F2C876CD239BE3B8A94F21350EDAE6C269698CC66BAF90B3641593F96399C71B2ECBE50F61B5D6F37D47DF702A9B9E47BED2824DEB19ADE7D7D8830A8F610088CF4BD0AD22A5A4FBA767D01987688BE710235A74129666FF7917B506A18E6B5D6166E8B682BE6B1946A4D4420926FF8CDF2488EABE71EFA7F2536B9DBEFBA08BB9E94086F55B1B991E18E6023E6952D4A563F2420A1536A1EDDE119E5779223CB712AB5C0BA4F0C176830FE523DD8603F1B316E128579E65454C2BE62C922C1DFE09DFB47D4497CC552AA9987A8BFE19C44E207397204686C718A0936145FC102B8A7111F74A421226AE016EDE658DE5DF9D3C28A247A87F2BC6FECF66CE7A6699880E0871CDB6F066D2CB3F9F625DC5E80751DBBC85982982E2EFAE3AB8F4F1EDA0D13C3B65FD2178E8AE4A712B521B7539785BB058176AB4396E6EFF2FD9052D4C6AF17DC30F50630233C3F05C62E151EECE13CE124E58A25F0F3AB65033ACAC9EA6E41CB3FA435D367DFEB0B9C9B37414CF32DC85A3C43087A578165C86D100E47DBA1FE7061111AAA961E67ED057C715974D3144912A58B6DB22D51BEDF6A8646D810190D91B61F0776DA00C8B0BAA7A83F4433F357E758F5AE8F278119908497E717A7AD25B09EA7C76B306A9A3AFCD9AE6B4F64016D5E80BD3FBE2F5EE673A7459B03AD9356148EA83461B66716346DBE85678C37C932EBC53B033A3F46DC28219880CFA8BB5E15F8862D345923BBC179FD763A0F943FC56BAB69F26C0C15D668BAD923D7AE6B35C07621768F9D972E2D6F46551D45E3FBBB577D13F01E8C1AFDBDD2F052E931C0529380F290FA1DE8BF5A11F82612943BAA2C0D086EBEC84069B271AC8656883F686C67B1808E27C860ECD1B95FF6CC6E6A5846DA29992CBA450081B8C37DD4911470EFF281FE94F10636A29B790E41EA6A342A5BE79CAF575FE9B0147F2EFE02874BC8A0E136A395B42E77D9F18CA4F61501E6C1805CDCDC10D0292593481F7E0F93281D0456EB51F6ABB7C379C028890F445D9FAC0D96AF68CDF6CC879A406CF2F0991916B33A72A193CF170B45AA079DB1BFD4B4126FA9AD3ED13FC98CE4C6C3C30923C8C53BCE1812B21BB644ED3A0CC0596C60032FFB1462DF5182528553AE865BF87FB7C7F61D1FD8E40D830B8D8F54924EDF934D1EBB88DA90BC59EEF1F6BF9FC2D17D8E9E0E39FFAD22EB84EFF39BAA70447B124E492D760E55D6301DCDFBCF9173FE293AC4D6CAF2E1964B32973067EC76BBECC65113C1FAB85375D92CE1436E1D1B205A88202B304264620B282E62CAAF5CFE1169EDAD9459B15BF0060C5744A17460F9FB164974CC55B3FFA71AAC13437BE58325E5E27E151C71D195F886F5630925D441A54695DF23F64C6BC3B0CA83F0E88D01BA4DC748A29F42AC2997C2A21EC258E430032C09E73E73AC2B21B55E1DFB2DBA281426620A0545D2507D1E96A3778C780FE77F1DA3B615E1B0D14DE8729229472E6619AB3B67CCAF21CFBFFD1F237E780927F147425B2142BF62CAD6B467A10F7B3DB922F095A0012EC179C4F8D5437AA8024F13A2A485E8890940DB69FB719B94B7D2629D277B593B94ECC744AA4CFF3D33D2250236C74DA057496BEFDB961B89BD6F44D581AD7A28524A6AF2253FD27530B7FF16FB5804FCA7E44BA2A3AB85FEDEED837DC130F533E8215B3AC3F584A2EC0E9B6194F97741EC050576E16349AD852DE8AAE2BF83CB1894107299F101AD5A2C05EC590B2CC698663C44FC0DC7F893F42BC5A2DECFF2FAF46CC1C00FA7294A0184A85CDDA2B1F38A89B1B17EC08555D082411A4CAEDED562C9FBBC1F512118EEC3BC931CC91636461151BDA454C4F029E01231BF170EBE17C526F3D8F705DC46560642B1AF36E3B401325A6CF59B88BCD4B3242D676FF4066E4252ADCA37786CBDB340DD81C5DD0540992F0B142C5A18D3BD1070719AF996E3C3768C3B234D303E6E9850B35C7AE52496C76106D7CAE4CF8ED01767B6DB5603F339FBAA019B08FA35E3DE1129A6A4D578264CF1FC8A1DBF218DD72B4865214DAA795A00505D4AE2B85E90F589065D65FC60CDD828007D4D3A4C084C7EC159C5D86817860CA03545FF74F17AD8570B2ADA55ECA12BFAB5C10067A086A34A57AAD8694C953137BBE901F8D3DEC27DB5DAD2AC96D56C312E25FE48BDC889373ED252B4F88D32DED6702B58D35A1FB40ABE2F2ABDE21CAA5FD0F67E7407A8"
M = hex_to_bytes(M)
a = Sign(sk,M)

# c1_tlide = "71F7304848C9CF3A3BF5D462212B4725AC2117EE7E420270B25A58AF64729F7F"
# # c1_tlide = "0000000000000000000000000000000000000000000000000000000000000000"
# c1_tlide = hex_to_bytes(c1_tlide)
# c = sample_in_ball(c1_tlide)
# print(c)