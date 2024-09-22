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
    y = []
    for i in range(alpha):
        y.append(x % 2)
        x = x // 2
    return y

# 算法 5:  BitsToInteger(y)
def BitsToInteger(y):
    y = np.array(y)  # 確保輸入是 NumPy 陣列
    x = 0
    alpha = len(y)
    for i in range(alpha):
        x = 2 * x + y[alpha - 1 - i]
    return x

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

def IntegetToByte(x,alpha):
    z = IntegerToBits(x, alpha)
    z = BitsToBytes(z)
    return z

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
    print("BBBB",v)
    z = BytesToBits(v)
    print("AAAA",z)
    
    w = [b - BitsToInteger(z[i*c:(i+1)*c]) for i in range(256)]
    print("w",w)
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
    print("pk",pk[32:])
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

# shake256
# def shake256(input_data, length):
#     """ Generate hash using SHAKE256 """
#     shake = hashlib.shake_256()
#     shake.update(input_data)
#     return shake.digest(length)
def shake256(data: bytes, output_length: int) -> bytes:
    """
    使用 SHAKE256 進行雜湊
    :param data: 輸入的位元串
    :param output_length: 輸出長度（位元組）
    :return: 指定長度的雜湊輸出
    """
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
    c = np.zeros(256, dtype=int)
    k = 8
    H_p = shake256(p,256)
    for i in range(256 - ML_DSA["tau"],256):
        while H_p[k] > i :
            k = k + 1
        
        j = H_p[k]
        c[i] = c[j]
        c[j] = pow(-1,H_p[i + ML_DSA["tau"] - 256])
        k = k + 1
    return c

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
    
# 算法 25 RejBoundedPoly(ρ)
def RejBoundedPoly(p):
    """Generate a polynomial with coefficients in [-n, n]."""
    a = [None] * 256  # Polynomial coefficients initialization
    hash_output = shake256(p, 528)  # Get more bytes than needed
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

# 算法 27 ExpandS(ρ) 
def ExpandS(p):
    """Generate two vectors of polynomials based on a seed."""
    s1 = [None] * ML_DSA["l"]
    s2 = [None] * ML_DSA["k"]
    for r in range(ML_DSA["l"]):
        r_prime = IntegerToBits(r,16)
        r_prime = BitsToBytes(r_prime)
        seed = p + r_prime
        s1[r] = RejBoundedPoly(seed)
        # print("s1[",r,"] = ",s1[r])
    for r in range(ML_DSA["k"]):
        r_prime = IntegerToBits(r + ML_DSA["l"], 16)
        r_prime = BitsToBytes(r_prime)
        seed = p + r_prime
        s2[r] = RejBoundedPoly(seed)
        # print("s2[",r,"] = ",s2[r])
    return s1, s2

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

# 算法 30: Decompose(r)
def Decompose(r):
    alpha = 2 * ML_DSA["gamma_2"]
    r_plus = r % ML_DSA["q"]
    r0 = r_plus % alpha
    if r_plus - r0 == ML_DSA["q"] - 1:
        r1 = 0
        r0 = r0 - 1
    else:
        r1 = (r_plus - r0) // alpha 
    return r1, r0

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


# 算法 1 ML-DSA.KeyGen() 
def KeyGen():
    # 1. 選擇隨機種子 ξ
    xi = "6CAE2E9C2CF64D2686C31C2118E0F24A47DD46DB85590910AAC9DF4C1B854E44"
    input_data = hex_to_bytes(xi)
    # 2. 扩展種子 ρ、ρ' 和 K
    H_xi = shake256(input_data,128)
    print(H_xi)
    # p = H_xi[:32]
    # p_prime = H_xi[32:96]
    # K = H_xi[96:128]
    # # # 3. 生成矩陣 Â = ExpandA(ρ)
    # A_hat = ExpandA(p)
    # A_hat = np.array(A_hat)
    # # 4. 生成多項式向量 (s1, s2) = ExpandS(ρ')
    # s1, s2 = ExpandS(p_prime)
    # # 5. 計算 t = NTT^-1(A_hat ∘ NTT(s1)) + s2
    # s1Hat = [NTT(s) for s in s1]
    # s1Hat = np.array(s1Hat)
    # A_NTT_s1 = NTT_dot(A_hat,s1Hat)
    # aHat_mul_s1Hat = [NTT_inv(s) for s in A_NTT_s1]
    # t = []
    # for i in range(4):
    #     d = []
    #     for k in range(256):
    #         sum = aHat_mul_s1Hat[i][k] + s2[i][k]
    #         d.append(sum)
    #     t.append(d)
    # # 6. 压缩 t = Power2Round(t)
    # t1 = []
    # t0 = []
    # for ti in range (4):
    #     ta1 = []
    #     ta0 = []
    #     for tp in range(256):
    #         t1_temp,t0_temp = Power2Round(t[ti][tp])
    #         ta1.append(t1_temp)
    #         ta0.append(t0_temp)
    #     t1.append(ta1)
    #     t0.append(ta0)
    # # 7. 生成公鑰 pk
    # pk = pk_encode(p, t1)
    # # 8. 生成私鑰 sk
    # tr = shake256(pk,64)
    # sk = sk_encode(p, K, tr, s1, s2, t0)
    # # # # 9. 返回公鑰 pk 和私鑰 sk
    # return pk, sk
    return 0


# 算法 1 ML-DSA.KeyGen() testing--------------------------------
a = KeyGen()