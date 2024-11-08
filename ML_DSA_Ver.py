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
        First = index
        while index < y[ML_DSA["omega"] + i]:
            if index > First:
                if y[index - 1] >= y[index]:
                    return None
            h[i][y[index]] = 1
            index += 1
    for i in range(index,ML_DSA["omega"]):
        if y[i] != 0:
            return None
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
    rho = pk[:32]
    t1 = []
    for i in range(ML_DSA["k"]):
        t1_i = SimpleBitUnpack(pk[(i * 320 + 32):(i * 320 + 32 + 320)],t1_coff_max)
        t1.append(t1_i)
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
    index = ML_DSA["lamda"]//4
    c = sigma[:index]
    z = []
    for i in range(ML_DSA["l"]):
        z.append(BitUnpack(sigma[index : index + 32 * ((ML_DSA["gamma_1"] - 1).bit_length() + 1)], ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"]))
        index = index + 32 * ((ML_DSA["gamma_1"] - 1).bit_length() + 1)
    # print(len(sigma))
    # print(index)
    # print(ML_DSA["omega"]+ML_DSA["k"])
    h = HintBitUnpack(sigma[index:])
    return c, z, h

# 算法 22 w1Encode(w1) not yet test
def w1Encode(w1):
    w1_tilde = bytearray()
    for i in range(ML_DSA["k"]):
        packed_coeff = SimpleBitPack(w1[i], (ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"]) - 1)
        w1_tilde = w1_tilde + packed_coeff
    return w1_tilde


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
    
    # print(max_norm)
    return max_norm

# 算法 30: Decompose(r)
def Decompose(r):
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
    return r1,r0

# 算法 34: UseHint(h, r)
def UseHint(h, r):
    m = (ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"])
    r1, r0 = Decompose(r)
    if h == 1 and r0 > 0:
        r1 = (r1 + 1) % m
    elif h == 1 and r0 <= 0:
        r1 = (r1 - 1) % m
    return r1

# 算法 2 ML-DSA.Sign(sk,M)
def Ver(pk,M,signaure):
    rho,t1 = pk_decode(pk)
    # print(rho)
    # print(t1)

    c_tilde,z,h = sigDecode(signature)

    # print(c_tilde)
    # print(z)
    # print(h)

    if h == None:
        return False

    A_hat = ExpandA(rho)
    # print(A_hat)

    tr = shake256(pk,512)
    # print(tr)

    mu = shake256(tr + M,512)
    # print(mu)

    c1_tiide = c_tilde[:256]
    c2_tilde = c_tilde[256:256 + 2*ML_DSA["lamda"] - 256]

    c = sample_in_ball(c1_tiide)
    # print(c)

    z_hat = [NTT(zi) for zi in z]
    # print(z_hat)

    Ah_d_zh = NTT_dot(A_hat,z_hat)
    # print(Ah_d_zh)

    c_hat = NTT(c)
    # print(c_hat)


    t1_hat = [NTT(ti) for ti in t1]
    # print(t1_hat)

    for i in range(ML_DSA["k"]):
        for j in range(256):
            t1_hat[i][j] = (t1_hat[i][j] * (2**ML_DSA["d"])) % ML_DSA["q"]
    # print(t1_hat)
    
    ch_d_t12d = NTT_dot_2(t1_hat,c_hat)
    # print(ch_d_t12d)
    w_prime_approx = array_minus(Ah_d_zh,ch_d_t12d)
    w_prime_approx = [NTT_inv(wi) for wi in w_prime_approx]
    # print(w_prime_approx)

    w1_prime = []
    for i in range(ML_DSA["k"]):
        w1_prime_temp = []
        for j in range(256):
            w1_prime_temp.append(UseHint(h[i][j],w_prime_approx[i][j]))
        w1_prime.append(w1_prime_temp) 
    # print(w1_prime)

    w1En = w1Encode(w1_prime)
    # print(w1En)

    c_prime_tilde = shake256(mu + w1En,2 * ML_DSA["lamda"])
    # print(c_prime_tilde)
    # print(c_tilde)



    return (infinity_norm(z) < (ML_DSA["gamma_1"] - ML_DSA["beta"])) and (c_prime_tilde == c_tilde)
   

pk = "5B003CBFAF3E5166A85F8A45B9C1A4533FF216FB226CFEB83A81A20EE6E97E540FE2E3C6E44262A8C344330126E881551371383EA34EA2ADEDAD1185908B34905B09FC1E1304BD96225F36056C1B2099C624E770227D1E7CC310EC1D24A8F034FD91CD01FFDE608FAFAE157C6589DBD5F63DC8F57E857844AAA44E0B644E5F6BD684239D145F3D45A8454BE4BB588AEF4245DB3A0BB949322987B9C40A7DBD37A4526363FDE5EC3778C1F72E85230187A9E7B35028C3EE5CF8AEBE8748C45D50E8E22A81E70494C11C276375A8AD230411DB26C8100F07C471D69095575F09A1EEBCEC4C9C0E050B84DF0D4F95E558B921DDFC8F26B2067680998E9C99488EFC128D5BF927ABA361FB5E9CE7CE32C0524EE88FBA0F3BE5A1A7C55AE6C518AD4C7A33C05E2956CFC8DF6EB2A81FD1EDDA40F67AECFD715E4E3DC042AA939ADD3D275AE72CA7EB85F0F0B38884D0D7DE81CFC8487411F8A84247B82B2BC28F76BBA2D80BB7009697A7FE729DC123D11E695E60C024FD31D5F94F5C3CA6B76A13B7537FE6402DDF86EA6D8D77718D03B32505444ABF4BE76C01FD43CC86CDD5736E469DAF3B9A239DE67FD4C4D99319B0BA690C424DA2F3E68831E5CDBA77B49F20D138A3CAED4EAEC8968F33169C3A2A7A28B39B875A6C18F5A3A7F49E6AAD46D475C99FA980BCA322FC69633B576B30E1E98F771412A1267F0C82653562F755BF39DB93090235870598E405BE0F8A58F033F19BBDF126639FB85D6030CCBF4666384943E7F4DF69EA767982D82147D8F52955EBB3D3A8D90664AE9B9610CE8A8F66454B2C518BE42853BA93C434C8D9E072726BBC8EACE2A218F6DA2639737541FEB2016E3478E3443442381A4AF18004C49198D2A87154DC6D8975BBE20C22DBDC1B95DEB7EB74E61E5AFF999833B746221FA13BC442F9F25C6035861B7A5E75615CA6749716E8CEF56CAFEAF04CCF6B824FBE295C55C2D796AAA7992C49C4903D362AB50AFABC4AEAF6644106ED2F749CAE8C970D4D49B79A98ABF6CC3933563E499C07B52B80F963DE9A5C54FDC1EC4898B7713630D0C6F4CBC84DC245EFCF821FE382E0FA855AD32E3B70D38772341C0C3000D2595F749E26C5EA692A0BD42251A5A9C5653B995EB6B83A2FB8635C0EC0E29F9760A4684591D0CEF71D46F529204BC56087EDAD2D37939040F834610B9BD3B616C87E43B49E8B38D21B9E8B936B4DCD90D73C12F3F6F66A111738B16A2EAEEF8DF66C61E78D29AAA2D1378DA0039ECD56CE7231A5ECE7EC2ACAC469A42B9E323AC420D86A100DCFB78B1716A0365DA724EE0EDC9C4E1115E3BE71F4FF0794A10AB766D49E11EC1DB556816627DD54BFCC22CBAFB4F2A2568192638B9789E3020A2802A4B90F9DDAA36F650546D41600B2F33A86B1B10E802EF9B7C4DD1975970A930B0CB383E3916728CE1E2C698DB19AA027CFB620D88840C51DF17657BEFD3240510D95A0B6C480FDC1A1346E00C195CFFA6BA7822625F9A47CA029C29858F07AC0A86F4A1D0792635F82C15D5DFB19CCC415A2B9556AD67B1806E8AF681827B1C465D8646B481A00B7AB68C7CAFC623656D2FDD9431EAE0171B96885140196EB7F1ED76BE72AB001CDE7CBDB220DA5EECFE8D341EACBE12878011CF85681AE8F4BF0A9E8C40087FF51692207C57E0BD3C1F45E90F22B5D139008CCCDF10795EF0858C5DC3F6FD9F78858DFCA5D81510A9682EB45D0E094DEED0454101B0B28EAD2BFB7CF1230994E03BC98CE986F4CE7720577DA9C8406BAEFCB3F2A8B9EAC2D1A5C598A076E52BCAF2951CF1D4339757F5C6C522C3BC4B93C71E47B639A6FB8FFADB117C191B4B9D0D9"
pk = hex_to_bytes(pk)
signature = "E98901A3F79293983D935DCF3A4DC9BA8966F70CB2991E6E1E5942643D37A1523FA43A15CC894A81285C4BD0E5063267D317BD1EA3E3A2F0AEA6BFAADF074926F5E522140F00CA40BE0C60D492C7BF420EEA18F2C922A0570FBEFBF07CC3D084793D4D07F9FAADF386C6D1C24AC98F153313FD1C5957D02C884B21CED24B3BC5148F9F837EE94E9FD03371342353D627FB43FEF9472C832A1DCFAD355DABD974AC185C2FF7A7CEED63124BA86696F095D419810E381FA62B66C12D2B75E8CF59B0CB76E9D0546D71D9BF154D0D056603666212ABE8910E60C08DF738EF0EE8BB794B35C6E47E7BFEC734A6451909972093BC17E080518053EDE94905978F397DACABE24A6C4194F0305C0F6839F8D9993A6F6948B9EF3984A90B1C3B2E9991449D1B1BAC5DD54A2134608851662F6F25E8ED9BCC65D199A770F20D2A28C35BC56500E4BBF0823615FCD07452B8A558F8146081861DCA6A6EE9E24C688DC7367BEA1E00181D8F0FCFECD8D46A607C08CCADC32499BB73A9C664CF07817C7D496CBB428AF3A06ABB3C4A140C681CF8A6B7216A64AC4BD3505E4AC5C08C076C9F34F7DF9157BA1141628837B0F3BE1064D3F4908FF0DFBD83426C90ACA12D8FB9C9F9955B5959EF6DAEC31140CE117D9448C813F2A940D54DEBF844E28CEC621CEE34A9F336C0294572CD03AE5EA6A9B7199C6FCD9E20BE47214FC0F7E0125A6D8B8C397CA9D497671BC41CA08CCC153AEE53ED7F52D678E2C1873D70ECA96AB6A43ACF1786BB018057F98A4311751CE6C3D8B0C4601A370AC792B081CAE7581AC836F0C0BD3F11D2A78EBC5E268F8D19355F3B4995B57736C042F1B7B90EA55899011DE84A2CD0F6BD440D51DB2A6BFD93E5ABE620BD0CF9452ED0C5F4EEE9B724B06FE1981A16CD14D554859ED4A1B205E4527B66085587769ADFEFC289D07B09CABECDB95CE52587B7BE95D6D5068C05AAC009CDDC7AB550CD49C66EF55A86EA04765C46E74CC3ECB02650797966A6F125DB780C3C507C2E2B4EEB148B243673FB5FD2865533CEDA9938821221A01A8585EF76086E429A80A99AE31A2A6D4541AA3393FAF0A092B3744D8C742239C18F7AA3FA258FEE01736D446785BB9C0086B6BEB05AE13BFE5E5C462A87C35CC5731218EF2AC902B4505A593457F553F8F4DA1533B2B144DB83963663C3EC991C6F834DD9C75B21E40D0060646E323468C1D44F6071B6135CA41EADD17F4C36FF21C5DEA01775FB519597D4F9DDDAB30CD63DB37E8F5C0620EDCBCF2C84595C8DE1E10EA2D8D7A8A2B7D45BF84C0784392E0C7FC74FC8787C118782E57802DE412A1E99D002C2793AA614DAA5685C5D4253FADF0A630D1150DAA8D8D54F4EE0F6081E59434C6664A933167C61262FE7A16E3CFC18BF9AC42C49C5E0F9928F2DEAE020F5E105BF247E4432F4263E6BE8ACE9D8D8269B215E31782DC83B0805538BD75503C2DB6E90E99741D120951598493176499DFABDE262A16F28EA1FD183485478BD4E906DDA0FA037A7061BB28C7031BA4DE21CE4B1F736B1DCB12ECBB755A1DBD11469A924F417383E0B0AE22739C8888477FBE24336C2551040B3F044B02F28D4D5C3CB4852871DDA6584303882AAD3DEC7D6436E0089F2E2E4F6E2B5FF628DC565CAAD8775C1DB24CE7FEF3FCD524821CD58E43443D1669F3E4DEB508C7A2EAF0AE8742C06C537520EFFC894EE1F58EA2D335E9B8986783CFD4E3687D966A03BE25A8DA8F8565FDCA33EF9F5E8444F0966F73952354A985B61C2A4520F7758721FE9E667EA36A746F999B6E1906747555A361CAB9603A68795B065CEAFE7625F3EC8CCD9589C9E4800AE2ABCA461734BEDF46582E2820F129E4030D6A2E967BE349BA20DDBC5DD04EF8006351EB39AAB145E0E5FF648491C016AB7CA26E5789BB184DA0824F699AF597ED6A252C7AAE5F60B0119F74C439AF414545B2C1299DC546EC0C66589AD70C2DB8EB517E3CE2485C0F13D96E699B0C7C3AE607619637FE5732A31DBDE4565A894478A00DFE78BF559E0E9BB65125B1CB5F1A1A221C9C8BCFA3D294646AA9E21F4EDA1825880FCB7E1A4B7F42522442697A677ED9F3777F8CB8BE61DA12BB182C3148E9FA395E95311C0C374698C462407FE98E188FAB09057099915732CFE16DD35909F912A42E2C5EF0059139DF8AE6D85FAB29B33973E40EA0C592B066859611BDE45C96F2397FC0FB5F07A2E8F2177FC2C8EA2E3F357B5617892B071F6366488D0FA27FDA31D674997BBE9B0234459EEE7E5FB606B405448DF0322782B55D5DD83459B55F6041E62D47E2EA4389A2A29F2C4FC27CCB0AB9907952C9678650C57C0B909EFA205CA27F25C13FCA3E572E484F0F7EC947CD0955C1020FFC6F1612BDA856C8E540E6A41EA9D0A84C7E9DC6255BAF32C3D135A299F00354463C3E1CC0B3EDCC309F8F046BD329A19F9B747828807B958FFBB7D6F05D77B3D354948CFA9215EA79DD62E0EA95BFED33F9BAB1B92623AE9DBD4512B4A4F6B8C08A70CDFFB6A91609309752707C04D183651191B1C3964D6AE450334E0BFF52F7E1B64273955056E944D47041CAEF51385F01F0ECA4973BF2A56FFD8ABD679BA6983161B7EAB18758A5BD62C61693BA3C724395F5FD69D94E242C6F174FB26E7BF0B089BDF92FA03C4C1E663C99F2E22A23ABC3810B0EEB6953B1EAF7F2207616400CF79E530AF203873BCC0DDDA656BCAE9FBED9B20F870877002DCB79FFCD2CA91266FC8F8EABEBDBF71F7032EDEF77C3FDBBA35161A45C22F1248106A4AD3B2FF1132A24891FBD3E79DFD2E0F44F4CD5EFD5D07BAA5ED8E13A406FC9E813460FAAA196E4DFAAAB4A8F686A59ED6753DE8A7DFF287BF24BFD60FD7A84A431F80D84062F4157A4B0712B89A3743C80FC0B5D8BA8D4A6A6D113C029F5579CAF30A9E458BEF1903A989753237CBC69109DC435121FDDD10892547F41EF4DA88F35CACD6F5199E9973682440ED4AAA0F98106CF86B30766B31C55DA18EA8C0FB67B0C937FF4727CD8FE157F6E96E73138F1BF394E7AEA8162CBFDD548F3F4633CBE99CF91A9364D4C93E6ED58167670DAED4358D517D9CD0C9B5F771EB2F9198F91D833CD92ACBE244C6888F9577BC8CB4B514E89C03DF1AF38CD355426A21EDA4EEDB8791B41BB13ACA2A5B6637B9985C1B19AC3D5004B177B8DB3844D3A7D0573CC2F4237A712D2D4F42D3429C13E189913EFD4DC4B382B8E14873C8FB7D3B885F208DAABDF186601DAFE85E02D2B47DA258B5D554C2ACFF9D12C2260AC96D5E150C98A226E212151A49788186899AB4BEC6F707203D48526F75848C9AA0A6ABB2D1E200181D2C5758606873777C85CDD2DBDEE8EDFF09162527435861626AA1A4A7A9BFD5F900000000000000000000000000000000000C1C2F3F"
signature = hex_to_bytes(signature)
M = "DBAEDE95F7793725C9DB980AE6544EB2E2C4FC165C28A12B6EE675764F020C01C048BD0DC8064612E4B6858FB6871F71D104ECC4AA0FB27B9B79D1D95EF34E1072743826CA9E4AC0F1DC608D75695F1D39B5BC2B52758ABC11FE8BFCDAB36DA01B713B1434B9FA141ABA354EF1C50220757425B486682DF64FD3C584DFE147180657C15E6E21A9888219BDAEE8FD883A41177A6F6537F4DBE6809A0334D54582325C80119B6D4B37D45CDFCE93683FEFDD684F180119B88558D4737FCF1815063A06C0D0CC2F653DA98C272883B71BF463AC57A104F02C1944999E3788DB99F3F26D752F8D286049D0FBEFCA4BF5E1E5765FD0E3DDB9B72550A725DD96F2E017CC99937812D037FE476C613541DE88498A2CB72DB2120EA3232629709F551C4134372E58BD6EDF8366FC5F00DB38DF6E281962CB5C68FDA2CC4EBC135D438AE84E908E6DAFF39AA1A7E09785F8375D3E9950041679E86DEDC7398798EE624067A7D31E313A509E16BC25564DBD96F7FA811A6B5128819CB35396FD2BFDE8200EC146192AB727516FAD0FB85613B1C922203B4CC0617E076BDEFEA2A178DA9CFADC2044A89FF9034C23201F11D3C8B3EB98BADCB3E767812D8F71733885B6B6E13BBDE5811CA2DA120D8529FE5EBB21910E25ED49364F8E17EBD49901C0F235049258C97BD24186E5BC3ABE0D1FE6C448739760CC586BE39DBBF9043FAC6DCD5AAD1F5CCEA91994E75125F24DE6CC0495C2017EE37D35263294D1DCA2903A571D3511A1E38E575B0C1469E0B02ADA0EBE331CE290DB49F353C1C7ACFBD25C715D7B8154310B1042D73CC78145752A93B07BE7D1125F8B122A38849CE7AD7B69D0729822333DF209EDE90783CE95039E856002834F09BE1F41C213012B9569AB2F0AB29FFB084BE293B387B823F62E14F0F38DE03E4DE40F5A753C71A00DEC36750855A1771A06FCBD8B8448C67F08806812B72FD7C56EE3FCE1EBE2E2DABAA9196A2FCD9B4D479D553229D7C69B359ED53BD7132A2129130953F5EC0753703C202649F6D218776E6FB023A1188ACE6FDC49FD56BAD40D7936ED945FF0C5403F24377EABB1A3D97ADC8916EB8BF67B7C8DD0A48F8C3E62BF1A12A009FE4A3B3C6D7FDB87F64FA200285C6DE922BEE5C5CD28C0CEA9ECD6740C5966EE76C948195B626830725AE7D048955339A095DEEEF7C9DCDE9EE169B2FF233AD7213959231E74BF2132CC60566AB84806910894A0BD2ADFC562DBB4F64722280FFF3DCDAB54D5F96826DB5AF6BEF32068343A5F22F55FEA30A417C76B620BADA6A44B09228136516CBA30E70ABD4CDAA603A0FB5EC5E1268E47665D5AE9FF70468A3D19283A5276ECA45A847FDE13E3446F1F17CF057E581E071FBA06AC4321880B820C4E01329EED052A67ABA632B73896D0BE7C6DAFB5BC674CA11FAE0F1AF7A69CAE1C43A81733186902192F06ED2C73864D68B0584076353DFD8FA10F0556F8652C04520EF5712EBE2E4B9B4E62E308DB848D58106B1EB82FFA1DD6DF689B1C92C62C237200A38BAD10F5E622C9026329D48C0BEAE51BAE803DB0FCD68FAB0E0C1E00C8F0990D09D44DA36DE0C5B8BFF16D18E1AFCC465EDC575C9381334103B0098D209141F870E51D80813220A6408B4287C12228BC4403846E2A687A0DB1390BA6CBA6F0A16ADCE5E2EA6BF3FCEF7DE0DA0915638916AA437661F278A2652DC20FE96F84C8FB76612FA8B11D6E2FF0EACA6F1B1A4F680B4537471C24CD878EA34D725E6CB37A75F97DB8A4AB052518D798B0A8EC06A7094ECC524251CD06F5FAED9439299B0E988371E0AF0BBE7E97B1B601068BA3950E9F000D50CDADE4018A160A96ED4DB2FE500ADDEF749E1056FE8C6C9CA82E8D0FD9FA7F5EFAE2F196475BA73D4031E5BAECB0A83575D203D8CB9D6F49DB3B6FFFFA0864FEF2847BC36C3DAA3F19987B54784B84BCB8D5982FA6BB7145FA5BB9726813E24647D70C23401FB7FD4E1CA26D7E43E5FBA1E27FADBAC64D1B8004C201C7D29336DA4BAC7A18A850E42FFDA6E7C586B94021E3FC989864E2A40EF0233CFA7DAFCCCFA519FA6D8690D6DFA6948BD88D904BB9E6E9B9949A65F13D8F32F910C40A5410F8D71BCBF7B71716A73271D8355132776E6C56748CEE9ED6226FE340C704D1FBA5F58204AE56673C148B2C6C7D94020BE854D49F0E3FC5CCBA6981CFE3180521469E42FA3B458922F9BE4E23EC93324FD73BBCAB4C43C70E8FEA1D232A92FCCF4D7BEBA195D024C67A66E93F68618FAF32C943DB3622FBD22CF777084F54B638C774D6D3D8C91763C20693A92712456D42DF9D2FEAF0ADB1A6D9B4D500AB899A1AD2213A7008AA21E2FD7D00879FBBF765EBDC7526B8FA2D13BE83FD2717945670B5D73E96445A948AE028165CB3A73D3F2541238CF40C1B6EB26F33FC8F69D22BB899CEBCBB739BFD073EFC6993E221BA2EDEEBF35922FABE93B254C438A12A22E0BCF74D149043BDFECBCBB6EB1A55D928150F601EFC4DF082322B83C8395555135CA1936D690CF3ACFDC19E5164280905E3F3C5F62155184714EB9F61EEEFCCE338BC0217045AB2910F4E9DA330283CF93DB2D0B4EC2D81877266785BBB52AB0F81E0A06A7C5B736C1F58D234094F74DF7EE550C03404E9A192EE63163C079DF3C5ECA1214F20A2BC0683C66F22AF3F1AF532F5FD828EF3F2F9FF1724FC2BDEB2E7F706B2A219A2188D828D57255300CF6E29A7B992BED0D3BC532719B475A08D759CA7A888E0895683027D9A3AD3FDDA5F021E5193844382B1A963945AA49BCE0CF4231133C585807E0CA86D4779564801C05F2E474DF49A9C0AE7000D65B35B0896916CF18D584B24FC41A29AC67103A240025D316BBA272ADF68F06CFB19012F846DF8F5AA45EFC76B89FE08EC9CF0DFC7CDC63A392B83ABDD51DE93728996C99812052E83DA07DD3026A15E4186A19D2A7CA6232C9F54C886423B7ED35F9E8A97B804F401AAE8B3B7DDADF5D6851C4C4DD4FBC15D55520837123C11499A6F6B4C024F457C3D9AF50D7D82E31F433101834930C183DF8427922887CC36D9DFEC570C204E77E8C54119EA5D9210F82100E1C1E846F763397ED5DB39B7C086F3730617D91413CBEDB2AADC91C95B7997D45C8977D8D17E9BF86B97E3E388BBBFCD1264216C3BA773030FF49ACC1E79B2BFDF73C890E68A1EC42A638D2E5F57"
M = hex_to_bytes(M)


a = Ver(pk,M,signature)

print(a)

