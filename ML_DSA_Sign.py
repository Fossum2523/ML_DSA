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
    y = np.zeros(ML_DSA["omega"] + ML_DSA["k"], dtype=int)
    
    # 處理每個多項式的非零係數
    index = 0
    for i in range(ML_DSA["k"]):
        # 尋找非零係數的索引
        non_zero_indices = np.nonzero(h[i])[0]
        y[index:index + len(non_zero_indices)] = non_zero_indices
        index += len(non_zero_indices)
        y[ML_DSA["omega"] + i] = index  # 存儲當前非零數量的累計

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
    sigma = BitsToBytes(c)
    # 對 z 中的每個元素使用 BitPack 並附加到 sigma
    for zi in z:
        packed_zi = BitPack(zi, ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"])
        sigma = np.concatenate([sigma, packed_zi])

    # 對 h 使用 HintBitPack 並附加到 sigma
    packed_h = HintBitPack(h)
    sigma = np.concatenate([sigma, packed_h])
    
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


# 算法 23 SampleInBall(ρ)
def sample_in_ball(p):
    # c = [np.zeros(256, dtype=int)]
    c = [0] * 256
    k = 8
    H_p = shake256(p,8000)
    for i in range(256 - ML_DSA["tau"],256):
        while H_p[k] > i :
            k = k + 1
        
        j = H_p[k]
        c[i] = c[j]
        c[j] = (-1)**(H_p[i + ML_DSA["tau"] - 256])
        k = k + 1
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

    for i in range (1):
    # while z == None and h == None:
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

        
        # w1 = "D504A92AB65698B2ACDB8649D032719B112C622AA991674ACAF29819E69969E3845E03400C542C1664999B033E68979482C79CD12485E1A912E2A88A1862AA1A38200F7271401981C878712A2388C5A024089839677516C592A08ED59898073DE97325D8B929244344266075CE5AAA85018DCB05648AE36458CA6D2204649C1605AA001852553288577A04019D536120D948510BE7504884AA83021ECB739DCB25AA51E12D1C713003120424A8321E40886A949C42F47159C731D20A5010302245D41457685C1A2886E7C660D1B73C21612501C858617064AA536081209A8677A6090388CC23A18CBA06E12666C9A60555331917382822A452DC823487332A46711C5763799B760499B1040C3548C4B34A413281D1428D46B1A8D1909E8AB65D2A15454734149D0A482B414CC85282CE664D5F17299A708C46C21464652D117429695AAD650225C8D28062B0A5A7558A280726D4159E58B2A5494938968819A48448C6D490229541581581126A4066554AEB52AE9CD918A7111E122659D9B565854332C8788C2B824AE8A3790421488F64566AE20D4A35762543045FA159E5B510CC2910D356250F3A08C73251E9536DCBD10155A1350F859906A1250087984E5049C6DA241058301B856007B35A857078E6D934C7C18DC68A481D9361E5624565048CC23645A357AECE05759B562A1D041464520EA5838545120A59796669793018C9112041AD03B92562023527F77189643149F19DD7403A4F765484370469B451D4285228238CCDA708DE5A7D1F159A69F324A3537660D19009126116496CDDF195C913201D36766BB4144389095BE3248C938C477A258AC685839909950A0C0108AE8C915EA4779E188359122885DD494CEBD02846759E0230655FB66AA278AA60B03418A66C8E7539D11960808689E109921AE42815072542380D96C58D8606812622128681A05D43224EC0385B575A8FF08024C76890DA6D0A80241EA12919178EC3C6480D80895BB0205571ADD4063EE0C9250517A4666172D803492808020CC594DE927522039D95531A2A2AA21966626B71792BC8045E0024001849"
        # w1 = hex_to_bytes(w1)

        c_tilde = u + w1 
        c_tilde = shake256(c_tilde,2*ML_DSA["lamda"])
        # print(c_tilde.hex())

        c1_tlide = c_tilde[:32]
        c1_tlide = "0000000000000000000000000000000000000000000000000000000000000000"
        c1_tlide = hex_to_bytes(c1_tlide)
        # print(c1_tlide)
        print(len(c1_tlide))
        c2_tlide = c_tilde[32:] #256 -> 2*lamda-256
        c = sample_in_ball(c1_tlide)
        # print(c)
        #------------------------------------------
        c = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, -1, 0, 0, -1, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, -1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, -1, 0]
    
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

        print(z)
        if infinity_norm(z) >= ML_DSA["gamma_1"] - ML_DSA["beta"] or infinity_norm(r0) >= ML_DSA["gamma_2"] - ML_DSA["beta"]:
            z = None
            h = None
            print(z,h)
        else:
            ct0 = NTT_dot_2(t0_hat,c_hat)
            ct0 = [NTT_inv(cti) for cti in ct0]
            print(ct0)

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

    # z_mod = [mod_pm(zi) for zi in z]
    # Sigma = sigEncode(c_tilde,z_mod,h)
    return 0


sk = "5AE5192442A0894AC775D84419BB7EDE9E8143A6E21CD709A47B58545EAEC7F59EAD08050900CBCF4093F9327CAD67B7600D9F8425084B6905BB6550F426F58B27B47C434BC194D466D83C14BF5ABEA249E05287EC80D1B56BD0824E4EB84CE1CD4CCD0DBD1BDE59106AE10516E1150E841B03E759DFDD930F6C7BAC857530451C438E128029E436491980441BA56913074A8A8831E084641A152C40B865C9A22100800C13828C1C080A84C850221688241100D220085302695B1881524812C832881CA970D91445A122221226449106800413504BA86DC126321C312288486280A64463C261C220220A210653C8910919925308200988640A3100CB9868434050C2A06C1830482138640CA80D03339254C44D42B29014B9500400220BB38D8C269010B62DCC481261980522A03050A489DA2225A120859BC80480129252906193985182B470584481D2806448C669C8B65164B6219C964143262D1294641887111414500A166D64364EC282095C980502202683C48113A20559B02D10090DC084519CA6215C8885E1088990200E11126D182129D422421C2811214611582829482830A1400EA4400A428040D0882504C72111B20C8A148123002C53B688943411E0448140044A03A4111B042C6330715204285114864B8004E3B649E4B831D13264D814094B468881424A01430C41388008478A20378A01A8080831228CB285CB880D0A13499C860191848D04A72192A80181248959964D0805202341511A36081012842407300A1820D39881E0164A0AA669A2462044240C54084D1B208C923869588428D1144E63920022C94DC9320800497111A28909B384234591C22452D8C220C810610106669B062959B24C11B38941149083886108C488D1462682B00D14B8685AB65080409119B38DE2A44D1A0161981489A196610181514106019B0804C3C461A1823010A32D21876098103190425252145293A241534692212332A1828D40286ED3288AA38689D1048E1C936910970DD4125184C891D4246A194609E33426D0A485481605618489124126C9B6281C2111A3860543C05158386121828C1835645AB68C04892C03422EA148065280910146852219205B3292E1440404A908C9C884E4928C5342400C181010064A1BC07142887010284D2241602393905A88455A186E618445400884139084D4406964140288006A63380E18362E98160C04A7894B964D04844051B08419450612912411B410E186895A00318C129097956ABE59E75ECDE4E7482F0BB70D6502309163C9467EA51E7B467C114BA884CBDF37291400166F7E2450D27C5A20FC1130192F1B482740712446605F49EA14E3C35515D05EFB062339E69349C7D416830F426282A4C0C0BF875B0F8D98BCA9B55BC1E199C9482A8D5CFEC68166F9545F54F3B0BF14B2117DDC6356966BE0DD3CD42FA47EEC9FE4058A0679F3EF50F7306EDF0DBC58D2020702F3C1F0B23A70C4B9023B43E7EC670EABB06869A3AA3D315E9606F0216BAFE585E0006BB6656E1C146E2396A44D3B545A1D722B6BEDD33B40433B7A9A0B91DB43A0AE280F57DAFF4EC8E534885C436A6745FDF857A093F9067BA95229CF52D0C8DF29C52736EFD4FA98FC4C71F6A94983F8F008F29178BB53CBDD56A045408151FBFDE28941F7D7446D5C2B2CAB3C418E04C851D230A49F288713F3E7221CEE86FEB67B469B076871A7CB576D423B5CE20FDDCDBC6F3BFE841C494E6D6050BE92AED653F7B387CBD662AFB7B01401609D66EE5739BC0E9188EF3F61B23F6402A8C60D6C272EB27E3C36ED15A7D95E1BB15C8DF6774170CCBF50A2628F1E80F3007BE33D0C5D86C61BD927BA3EADCF000C5B4A1BBC0889C42183A1FDFFDA0FDEC7A2CB5148953B3C428F1153E802B0E60F39EC4CF4108DE315B8870E80790E6B67799499A768A60F0E70EE861369F0B0110498B206B01AEC9C56CC335221E675F0DB77B6A2F9BE317407442F152D32E2FA57054C2F05757079D29BF85077E571973C5410743C679AEC39B51163A9B3AF4049647FA008AC5E304F82AF0A0F28E5CE3040C8D9AD6799BD4E70B7CA23F965FE96539EBE04ABAD5DF057FE26437FE44289ECF68807FD2C8900A0D3C5B3910BAAD7AF92BE09B83D0E16CC617607623DD8A2A8ABAE82C48C1B383C13DFFBC62CFC3F45B7A0150E799868D55AB5A9F67EA0D4D35D9D2EB0317768E1F67FFB8DCDC9A6FF9FAF58BC260DE56A0165900F4C54DF209CC148CB93469C59CE5D0576BD2CD40BB0D0A9EB21A41EADEE0039D603FC2917366B7F238E75E431ED7DE076E9E72701DB873D86F73A4A99A82538FDF5611FC42BA4D899BBEE81EC55E997A697A9591AFCC2425A570BD026CF0F3DA4999D0CE7C2238037D8077B3E13290DF420A41771548FF2C2D89416FE776481236B3AE22DD2A21EF8EDFD5E2CA526A796B568AC47B3CD4FFB0743771E647138AFD6ED35AB242B0252DD19862AC4DC3310D905FF68DB2F53038D176D22D350401857794DC2E2C1443696E65D7886759A5ED653F14D9F804FE55E45DB4090C0E166C01F1FA8AA939B8D83CB3B1B65ADF4B31656CB8D04F21452BF2B6B36BC18A8EFA7A0E4AB67479844DE5EF231C8E8168BCC252411E67EB3F6598176F4D6739DA69AB952CA12B7A951B2333A991477CA51E1183D2769CCF90FA87EA2C62DF0145990C787AE739D5802E9362E5EDF969DC71FE7D2542A4DD1EBF12A08240BAB3FB4EC2126DD0C0AC740EBA06CCA2AC6ECA57E4094ED4C818965105037D1EF2E739DC2D58F2554C40AF69ABBD483A896654C5A26668691A6A8C005ADCA4EE51BAA82DB5D7495E29FBDE6DADC67929A60FA95267A1AB764A1A41B3CA0C3FE03FB5A8400130E6ACE93197D3DF50FA789F16BFBE6B292FCC2E9C03C792473A70AFE13935DF76C2E5A2FAB154B5CC5723E5611BB363B621EEF74343CE19AEED62BF771DCAAE501977CD573A412F15FC8D294A512B7B412F462298713889F6F9E7DC35A0541A2A306CFB9AECFB74C0F94817AB81C804A0508718269E5691A24A2CFAEE8D0BAA69BB30FE04C45881485B2D67AD09D5EBB43A3508AA45BA2D54CCE4E7FD7B679E735A4D78E8DB1BB1583F1C91B0330D2AD7A80C7D2BC60DB220287413E9B4DF7F68E8A8541C1F1F85D15BDD51C6902DBA86A67B2E4CD86B92E7BF58724AC5A53219216B78BD1B50CFBE9B468A667FC6C4F35A610E7AECDA8A12DAB0C5A658005879E2608EA6549999DE0C396E2E0E19895E77A68356EA29BD2A1F24BE4552E679DFF66EFF39235183E26DF4D23CDD284BE2D9D706A301CCF33D0C85DAE62ECCBACC1503246B853603F68DB14C2E0B972BE2AAE6856BEEEF83DE2227AA876E5DC62636E2E95BCE79597E01A5A3FEAAFACC205AB09FFF7641BCE3ACEBDC6E6AC2C95276148543F2AA1A4E949DE5F35F4DC1048824389CB90910D47C7ECEF591BAF68D6A456B79278F356A6C34AEBC370EAFB722F0791033708C24A3CCFAEDCA515C6DC1B83B85251A2F665B3777E1805FC8F98F9789944139C60BB8AB0BFA34D3783599707BD44CC99D2E4ED71F31EF7AE6B8FBAAA4A5377DF40F8D6A4C1F720159E57718C78FE40"
sk = hex_to_bytes(sk)
M = "DA5FBC7F78116BC8537E8E522DFBB6F68710FC36AE5AF0ACE5CFA3BA4FEBF6C86D966A44C2CF53CCC4FF5B9CC4E6403CFF3C23B4F292AAC01E35A21AB11F0707726E88048DD05887448B870741FDCDFB4451E1216FA2F89D90D872B67B4BA546C8CBF504A46FC02036FB5B287BC82DB9E2D835802DDE3075C7B703ADF4FAE4F98840670964A1ABC61105C3B99C78609605E7F17CD262BE67F7E7A2C6ECC519ECDE8D5B76C21FE5C15859FC94382608A15C7E656AD8E0042CA649EB8EEB59B8E266C244591B265B672D4654C5FF28296707815C647DD11AB3148AEDE24E96D7ABD6C479C0C367B00E464804184140152063153EC3982987618F7D9BD9812DF3B95DDBC47D1F96C752C01B742255946461509EF7A7A67DA0123D670845BE07725D9C1E9F419B4B9133EBA36BC90DE45666C40EA664D93A16948F848CDB9688E116B00B0A4F03B26BB836DFBA93EA6247550FD983371E360F04C9F2793EB769A00BF4049E94F225EE035676E983FC9CB01D15EEB621CC0D4B840EE777ECE351EC66C4B28A36FAF02C42B24804E8126E3852735C2A6F6E201662DC18E125210C78197372B4787A8163ACF4B758921AB23ECC4AB8F3C1DB3549050E26F9C35594DCC1C27AE5999DB695A19681FFD9CD4416E0C79E3457C0B5144F3993E945F6006EA0F541B1C3F473D78F4FED4011E07D46F8DAF7998BBD4A9F5161050D9982DFF28C72E15D158A630B8972E8E2B70611C299BE4BD3405350D2FEB84C93E97FE4DFBDCA5BCC9B6708D7E542D7101BD8D5589BAAEC5649E1C9844C37C5DB0556BBB6B2EB577FB65909B1EBFA7F1590D53D98FC9975BC06F7AC581FE22066BACCA0375AE09DBADC8940E98A38B15FC190523FA6D0CF326D7495B5CC948AC994181EE0DFCAB11722E1B46AD6FD2065442D1FA06ADF21FD9187B55320F554B929BC795F367AFEF11A5CE4128AE32E6C1662D013A91456AD292DFB8B4C161EA7A4D5B43AF63BE7BFC5EEAB9D1E3198F441AD70DF9D6BDEAEAFBD0A293F1A6DF07339A4C34C7375CB6096EB06EC035777C22344912DCCF3D0F8DAED1D0B046118A22886299DA5782DC77487CA5FD0D3CFC724769D658131FA415672996CE8E8BED83E057E3AFE26703012DFED31C732D770FFC7FA55C59BC3FD68C34D00738FC9E3DBECCF4B695B99BBD6A0082752E3A95150AFFE793D8F7FF19BAEFF7744688445E7B561294371E1909035929D654606EED6BD011D2CB0512B1A0987827BB07F14E0E8F0207519DF24BA69AB788EFAB21F1BD69BCB14AB44AED8FEF80F1F63685C6A85100DA1671405F8D6454FCD7D5FB6656959AD68D3E1896C6EB4967615332993D4207DB6B0F5A6E33EF4B2494DCDBA368A052FB8CD48A9E215D30C8C9D37DDAA6B4F3080744E6861B9889E23E9D964F75C5BD5E1DEA98EEEA8E66C60DA73ED1E39115EE0274F2747858D5D644C09B5EFC978D4496A007DAC35F2F68B1F9A3B43A638F38F663E6124740234119D6E8DBAF933ED0FD5A02FEFFF7AE3235C82D90B2F8557DDDC9102FAAF8181E6EE3E9BCEC78E4C61F73FBDA23D4382E5050A0E151E3F51BC22347F9B1A19D74649558ACFF8B21AF69EFFF78BA3E83CEB9EA36D4799272E10F56D3C151209C99105A133B665EA51E4A245D37E7A0F84F5222E3A0401E67BFC1BAB6269CA4A87D3CF062CFFEEE0B5EE5FBFBE1029E93F46FAE68A91CFBCBD5CF8B78F122AF22A11E77095DEAEBC96F1613911E02237F795AE717301499936B440E07B32DDB09008276C9A5A314889E8B9ACDF32D6695AE2931CC29ED1DAFDB61B708B52F9888DA67ECED25217F1A5FC1EE7D482917C7C7E44CA7F0508FD3BC94BEC116A630ADB08DDD882A221DC5D2C60A2E9F2F849B3E8B5DF150EF753C35251850D0B4980164F8C07339E035D5B2EEC4BEEFB885E261E401BDBA408869951075DEEED3C7EE7452AB39856D240E954FC8A4BEB01A0F79187BB72DD2925E63B3DE9E16CDDC041BC3BE47F318DA6DC6A9AD8710B18883367E374DA58D97F00B1E75AC8D4658F04295223C8C4F61B2CF7104492DC7A0C6267F45B5A4A2D258239455A31D265BDBAC9FA6E4A1812043C9112ACD4240625F08B901263EC456D2A5877BC9223A6C483673BE5CAB8C32516AD5B956688A01374AA48789D53AE79E7FB109632969E45684804DAD54FAB1E94A19C2A9B53BB9079F484C64A924C9C940FE5A3ECF29C739E3826311E42B310CF75A47B932BEF104CB27FF35D51E3FED9D724D90A17982F2897E2FD09E555977CD668E67A34216637380B8720A593FFC4175BB27E293C652C2DD8C506F4D1F551542EDBB31EFB3C1BD5DE6315280BB04BFA53CDC2D38C385C04E9BDF389745ED394147063CE3639ABCAA429C68475F9D466321EEBDE9392A2A2A6EAF53FDE20803B76B0903DDC6C81874A81AC147FCFB9FDA970BA5D87E4C346DDB83B60A718882E16F256A0F13969606C43D84AFD193D7BA3CFAB875646401547458F36DD53C2182B36B84DE8F8A50E62921A5B011319C555766E46EFECEB239297DFBFABEF3AE370CF48A08BC073B1E16A8C840F2604F75F39B3F0F4847A445A15F0B946D423210BD32A09A9EDF4CCEAA6E90AD1379E5928B66BD3A02C5E2AEAB56E8987B342EBFD9D3C70EED3465D78F12AF4423319B3106AD8BDBD9AA5736E6CC15C7AEE0DC78A1FAB83015CF880DE6249734153F6058F567D648AECF70D1BAB8397879617FD6FB06DA1AF6713E3CE584B214742587A5D35C6DFD33AFDAAF00AFE00E1CB516C955DDA9E0A5FB78DEF914B532F556D7E72E9717BA49A2D0F9EAFB5F526565C58E0FFC1B55138C8DE7A9D6CC06FC9927F6D04440512163B58A236F57B093E80F3CE0F4CCE282ABDCCE284057C4DB6314E05EE0A32B5F20C481F8BA4ADF943CA1B0277119DA1BBC4EA1D24CF7E3DB4C759E98753EFCABE2FB5B1FA593F2AE2B7ECEA96B8E0E5B3FFEEE97DD6C50CFE8602613FAC2D71174984C2EB59E532A35CF4FB0BFD60B8CF7CA3E7D5C0EEAD822648533D3CDE72C787DAA412FC70674E95CE2F5BF58D3646B4881D4CB6DD96659BB1A937B24795B435A103C03CEB6AC85E8FFE9C495082A87854392BEA530D61A7F60B3431455DB85414E6C365F9721ED2DD4F7C8A37B88131F5B2FFB5FC4A40BDB12EACE61AA956F8724C99DA98DAC18F6D33DB5F4A189454C736"
M = hex_to_bytes(M)
a = Sign(sk,M)