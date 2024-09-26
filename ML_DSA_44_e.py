from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
import numpy as np

ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = (2**t1_coff_square) - 1

# 算法 1 ML-DSA.KeyGen() 
def KeyGen():
    # 1. 選擇隨機種子 ξ
    xi = "6CAE2E9C2CF64D2686C31C2118E0F24A47DD46DB85590910AAC9DF4C1B854E44"
    input_data = hex_to_bytes(xi)
    # 2. 扩展種子 ρ、ρ' 和 K
    H_xi = shake256(input_data,1024)
    p = H_xi[:32]
    p_prime = H_xi[32:96]
    K = H_xi[96:128]
    # # 3. 生成矩陣 Â = ExpandA(ρ)
    A_hat = ExpandA(p)
    # # 4. 生成多項式向量 (s1, s2) = ExpandS(ρ')
    s1, s2 = ExpandS(p_prime)
    # 5. 計算 t = NTT^-1(A_hat ∘ NTT(s1)) + s2
    s1Hat = [NTT(s) for s in s1]
    s1Hat = np.array(s1Hat)
    A_NTT_s1 = NTT_dot(A_hat,s1Hat)
    aHat_mul_s1Hat = [NTT_inv(s) for s in A_NTT_s1]
    t = []
    for i in range(ML_DSA["k"]):
        d = []
        for k in range(256):
            sum = aHat_mul_s1Hat[i][k] + s2[i][k]
            d.append(sum)
        t.append(d)
    # 6. 压缩 t = Power2Round(t)
    t1 = []
    t0 = []
    for ti in range (ML_DSA["k"]):
        ta1 = []
        ta0 = []
        for tp in range(256):
            t1_temp,t0_temp = Power2Round(t[ti][tp])
            ta1.append(t1_temp)
            ta0.append(t0_temp)
        t1.append(ta1)
        t0.append(ta0)
    # 7. 生成公鑰 pk
    pk = pk_encode(p, t1)
    # 8. 生成私鑰 sk
    tr = shake256(pk,512)
    sk = sk_encode(p, K, tr, s1, s2, t0)
    return pk, sk

# 算法 2 ML-DSA.Sign(sk,M)
def Sign(sk,M):
    (p,K,tr,s1,s2,t0) = sk_decode(sk)
    # print(p)
    # print(K)
    # print(tr)
    s1_hat = [NTT(si) for si in s1]
    s2_hat = [NTT(si) for si in s2]
    t0_hat = [NTT(ti) for ti in t0]
    A_hat = ExpandA(p)
    # print(A_hat)
    # print(s1_hat)
    # print(s2_hat)
    # print(t0_hat)

    u = tr + M
    u = shake256(u,512)
    rnd = "0000000000000000000000000000000000000000000000000000000000000000"  
    rnd = hex_to_bytes(rnd)
    p_prime = K + rnd + u                                                                                                                        
    p_prime = shake256(p_prime,512)
    # print(p_prime)s

    ka = 0
    z = None
    h = None
    # for i in range(1):
    while z == None and h == None:
        y = ExpandMask(p_prime,ka)
        y_hat = [NTT(yi) for yi in y]
        w = NTT_dot(A_hat,y_hat)
        w = [NTT_inv(wi) for wi in w]
        w1 = [HighBits(w1i) for w1i in w]
        w1 = w1Encode(w1)
        c_tilde = u + w1 
        c_tilde = shake256(c_tilde,2*ML_DSA["lamda"])
        c1_tlide = c_tilde[:32]
        c2_tlide = c_tilde[32:] #256 -> 2*lamda-256
        c = SampleInBall(c1_tlide)
        c_hat = NTT(c)
        # print(s1_hat)
        # print(c_hat)
        cs1 = NTT_dot_l(s1_hat,c_hat)
        cs1 = [NTT_inv(csi) for csi in cs1]
        # print(cs1)
        cs2 = NTT_dot_k(s2_hat,c_hat)
        cs2 = [NTT_inv(csi) for csi in cs2]
        # print(cs2)
        z = array_plus_l(y,cs1)
        # print(z)
        temp = array_minus_k(w,cs2)
        r0 = [LowBits(w1i) for w1i in temp]
        # print(r0)
        if infinity_norm(z) >= ML_DSA["gamma_1"] - ML_DSA["beta"] or infinity_norm(r0) >= ML_DSA["gamma_2"] - ML_DSA["beta"]:
            z = None
            h = None
        else:
            ct0 = NTT_dot_k(t0_hat,c_hat)
            ct0 = [NTT_inv(cti) for cti in ct0]
            # print(ct0)
            zero_array = [[0]*256] * ML_DSA["k"]
            w_minus_cs2 = array_minus_k(w,cs2)
            w_minus_cs2_pluse_ct0 = array_plus_k(w_minus_cs2,ct0)
            # print(w_minus_cs2_pluse_ct0)
            minus_ct0 = array_minus_k(zero_array,ct0)
            # print(minus_ct0)
            h,true_num = MakeHint(minus_ct0, w_minus_cs2_pluse_ct0)
            # print(h)
            if infinity_norm(c_tilde) >= ML_DSA["gamma_2"] or true_num > ML_DSA["omega"]:
                z = None
                h = None    
        ka = ka + ML_DSA["l"]
    # print(true_num)
    z_mod = []
    for i in range(ML_DSA["l"]):
        z_temp = []
        for j in range(256):
           z_temp.append(mod_pm(z[i][j]))
        z_mod.append(z_temp)
    Sigma = sigEncode(c_tilde,z_mod,h)
    # print(Sigma)
    return Sigma

# 算法 3 ML-DSA.Ver(sk,M)
def Ver(pk,M,signature):
    rho,t1 = pk_decode(pk)
    # print(rho)
    # print(t1)
    c_tilde,z,h = sigDecode(signature)
    # print(len(c_tilde))
    # print(c_tilde.hex())
    # print(z)
    # print(h)
    if h == None:
        return False

    A_hat = ExpandA(rho)
    # for i in A_hat:
    #     print(i)

    tr = shake256(pk,512)

    # test = "D26AF4F24DE50EBEDA020DFC6F841B0A2D83D2781C06D8B3DF8EDA97A7EA4F9913ABEE9858F88F8A2F52C13DF2DE4BA023BAA5B3CB0ED941E077A08AE3F14035DB8494BA19C4118FB15D0ACF4254FD37483FCF4748FD1844F717CE6F69589E61772CFEFA7F9758653409D4EE5A264B834E60D6BB96499EBEB2B06B0BA874BF31E641394CFAA6A2D30DDB8F045876208D2F51DE15E205E8C91B87ECEB05FF3183271B2649665DD3CC49BFDB998D539DA809305516BBBE9C906021191C5223E525A8FC3616A1765EC3F9C5DB53CC337E039F186ACFEA91148EE2A79CCA3689EDB62AAF28B5D752FDE265EE5280B519726C1CA9803295C674B7EFAFA4D61B306A79E3F6E7A887C2FB535B3B0FB3D9EBC87603EAFEF170C1F1D28E99BB"
    # test = hex_to_bytes(test)
    mu = shake256(tr + M,512)
    # print(tr)
    # print(mu)
    # print(len(mu))
    c = SampleInBall(c_tilde)
    # print(len(c))
    # print(c)
    z_hat = [NTT(zi) for zi in z]
    # print(z_hat)
    Ah_d_zh = NTT_dot(A_hat,z_hat)
    # print(Ah_d_zh)
    c_hat = NTT(c)
    # print(c_hat)
    t1_hat = [NTT(ti) for ti in t1]
    for i in range(ML_DSA["k"]):
        for j in range(256):
            t1_hat[i][j] = (t1_hat[i][j] * (2**ML_DSA["d"])) % ML_DSA["q"]
    ch_d_t12d = NTT_dot_k(t1_hat,c_hat)
    w_prime_approx = array_minus_k(Ah_d_zh,ch_d_t12d)
    w_prime_approx = [NTT_inv(wi) for wi in w_prime_approx]
    w1_prime = []
    for i in range(ML_DSA["k"]):
        w1_prime_temp = []
        for j in range(256):
            w1_prime_temp.append(UseHint(h[i][j],w_prime_approx[i][j]))
        w1_prime.append(w1_prime_temp) 
    w1En = w1Encode(w1_prime)
    c_prime_tilde = shake256(mu + w1En,2 * ML_DSA["lamda"])
    # print(c_tilde)
    # print(c_prime_tilde)
    return (infinity_norm(z) < (ML_DSA["gamma_1"] - ML_DSA["beta"])) and (c_prime_tilde == c_tilde)


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

# 算法 7: BytesToBits(y)
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
    z = BytesToBits(v)
    w = [0] * 256
    for i in range(256):
        bti = BitsToInteger(z[i*c:(i+1)*c])
        w[i] = b - bti
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
def pk_encode(p, t1):
    pk = p
    # print(pk)
    # print(t1)
    for i in range(ML_DSA["k"]):
        # print(i)
        packed_t = SimpleBitPack(t1[i], t1_coff_max)
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
    sk = p + K + tr
    for si in s1:
        packed_si = BitPack(si, ML_DSA["eta"], ML_DSA["eta"])
        sk = sk + packed_si
    for si in s2:
        packed_si = BitPack(si, ML_DSA["eta"], ML_DSA["eta"])
        sk = sk + packed_si
    for ti in t0:
        packed_ti = BitPack(ti, 2**(ML_DSA["d"] - 1)-1, 2**(ML_DSA["d"] - 1))
        sk = sk + packed_ti
    return sk

# 算法 19 sk_(sk)
def sk_decode(sk):
    p = sk[:32]
    K = sk[32:64]
    tr = sk[64:128]
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
    s2 = []
    for i in range(ML_DSA["k"]):
        s2.append(BitUnpack(z[i],ML_DSA["eta"],ML_DSA["eta"]))
    t0 = []
    for i in range(ML_DSA["k"]):
        t0.append(BitUnpack(w[i], 2**(ML_DSA["d"] - 1) -1, 2**(ML_DSA["d"] - 1)))
    return p, K, tr, s1, s2, t0

# 算法 20 sigEncode(c˜,z,h)
def sigEncode(c, z, h):
    sigma = c
    for zi in z:
        packed_zi = BitPack(zi, ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"])
        sigma = sigma + packed_zi
    packed_h = HintBitPack(h)
    packed_h = bytearray(packed_h)
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
    h = HintBitUnpack(sigma[index:])
    return c, z, h

# 算法 22 w1Encode(w1) not yet test
def w1Encode(w1):
    w1_tilde = bytearray()
    for i in range(ML_DSA["k"]):
        packed_coeff = SimpleBitPack(w1[i], (ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"]) - 1)
        w1_tilde = w1_tilde + packed_coeff
    return w1_tilde

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
def SampleInBall(p):
    c = [0] * 256
    ctx = hashlib.shake_256()
    ctx.update(p)
    s = ctx.digest(8)
    h = BytesToBits(s)
    test = ctx.digest(8000)
    # print(test)
    cnt = 8
    for i in range(256 - ML_DSA["tau"],256):
        j = test[cnt]
        cnt = cnt + 1
        while j > i:
            j = test[cnt]
            cnt = cnt + 1
        c[i] = c[j]
        c[j] = (-1)**(h[(i + ML_DSA["tau"] - 256)])

    return c 

# 算法 24 RejNTTPoly(ρ) 
def RejNTTPoly(p):
    a = [None] * 256  # Initialize polynomial coefficients
    H_p = shake128(p, 8000)  # Get more bytes than needed
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
    a = [None] * 256  # Polynomial coefficients initialization
    hash_output = shake256(p, 2048)  # Get more bytes than needed
    j = 0  # Coefficient index
    c = 0  # Hash byte index
    while j < 256:
        z = hash_output[c]
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

# 算法 27 ExpandS(ρ) 
def ExpandS(p):
    s1 = [None] * ML_DSA["l"]
    s2 = [None] * ML_DSA["k"]
    for r in range(ML_DSA["l"]):
        r_prime = IntegerToBits(r,16)
        r_prime = BitsToBytes(r_prime)
        seed = p + r_prime
        s1[r] = RejBoundedPoly(seed)
    for r in range(ML_DSA["k"]):
        r_prime = IntegerToBits(r + ML_DSA["l"], 16)
        r_prime = BitsToBytes(r_prime)
        seed = p + r_prime
        s2[r] = RejBoundedPoly(seed)
    return s1, s2

# 算法 28 ExpandMask(ρ, µ) 
def ExpandMask(p, mu):
    c = 1 + (ML_DSA["gamma_1"] - 1).bit_length()
    s = [None] * ML_DSA["l"]
    p = BytesToBits(p)
    for r in range(ML_DSA["l"]):
        n = IntegerToBits(mu + r, 16)
        H = p + n
        H = BitsToBytes(H)
        H = shake256(H, 160000)
        v = H[0:32*c*(r+1)]
        s[r] = BitUnpack(v, ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"])
    return s

# 算法 29: Power2Round(r)
def Power2Round(r):
    r_plus = r % ML_DSA["q"]
    r0 = r_plus % (2**ML_DSA["d"])
    if r0 > (2 ** (ML_DSA["d"] - 1)):  # 確保 r0 在 -2^(d-1) 到 2^(d-1) 之間
        r0 -= 2 ** ML_DSA["d"]
    r1 = (r_plus - r0) // (2 ** ML_DSA["d"])
    
    return (r1, r0)

# use with Decompose_r0/Decompose_r1
def mod_plus_minus(x, alpha):
    result = x % alpha
    if result > alpha // 2:
        result -= alpha
    return result

# 算法 30: Decompose(r)
def Decompose(r):
    alpha = 2 * ML_DSA["gamma_2"]
    r_plus = r % ML_DSA["q"]
    r0 = mod_plus_minus(r_plus, 2 * ML_DSA["gamma_2"])
    if (r_plus - r0) == (ML_DSA["q"] - 1):
        r1 = 0
        r0 = r0 - 1
    else:
        r1 = (r_plus - r0) // alpha 
    return r1,r0


# 算法 31: HighBits(r)
def HighBits(r):
    r1 = []
    for ri in r:
        r1_temp,r0 = Decompose(ri)
        r1.append(r1_temp)
    return r1

# 算法 32: LowBits(r)
def LowBits(r):
    r0 = []
    for ri in r:
        r1,r0_temp = Decompose(ri)
        r0.append(r0_temp)
    return r0

# 算法 33: MakeHint(z, r)
def MakeHint(z, r):
    bol_list = []
    r_plus_z = array_plus_k(r,z)
    true_num = 0
    for i in range(ML_DSA["k"]):
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

# 算法 34: UseHint(h, r)
def UseHint(h, r):
    m = (ML_DSA["q"] - 1) // (2 * ML_DSA["gamma_2"])
    r1, r0 = Decompose(r)
    if h == 1 and r0 > 0:
        r1 = (r1 + 1) % m
    elif h == 1 and r0 <= 0:
        r1 = (r1 - 1) % m
    return r1

# NTT use to bit reverse
def brv(k):
    return int('{:08b}'.format(k)[::-1], 2)

# NTT
def NTT(w):
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
    return w

# NTT_dot
def NTT_dot(A,s):
    A_NTT_s = []
    for i in range(ML_DSA["k"]): 
        d = []
        for k in range(256):
            sum = 0
            for j in range(ML_DSA["l"]):
                sum = (sum + (A[i][j][k] * s[j][k]) % ML_DSA["q"]) % ML_DSA["q"]
            d.append(sum)
        A_NTT_s.append(d)
    return A_NTT_s

# NTT_dot with l
def NTT_dot_l(A,s):
    A_NTT_s = []
    for i in range(ML_DSA["l"]): 
        d = []
        sum = 0
        for k in range(256):
            sum = ((A[i][k] * s[k]) % ML_DSA["q"]) % ML_DSA["q"]
            d.append(sum)
        A_NTT_s.append(d)
    return A_NTT_s

# NTT_dot with k
def NTT_dot_k(A,s):
    A_NTT_s = []
    for i in range(ML_DSA["k"]): 
        d = []
        sum = 0
        for k in range(256):
            sum = ((A[i][k] * s[k]) % ML_DSA["q"]) % ML_DSA["q"]
            d.append(sum)
        A_NTT_s.append(d)
    return A_NTT_s

def array_minus_k(A,B):
    d = []
    for i in range(ML_DSA["k"]):
        w = []
        for j in range(256):
            d_temp = (A[i][j] - B[i][j]) % ML_DSA["q"]
            if(d_temp < 0 ):
                d_temp = d_temp + ML_DSA["q"]
            w.append(d_temp)
        d.append(w)
    return d

def array_plus_l(A,B):
    d = []
    for i in range(ML_DSA["l"]):
        w = []
        for j in range(256):
            d_temp = (A[i][j] + B[i][j]) % ML_DSA["q"]
            if(d_temp < 0 ):
                d_temp = d_temp + ML_DSA["q"]
            w.append(d_temp)
        d.append(w)
    return d

def array_plus_k(A,B):
    d = []
    for i in range(ML_DSA["k"]):
        w = []
        for j in range(256):
            d_temp = (A[i][j] + B[i][j]) % ML_DSA["q"]
            if(d_temp < 0 ):
                d_temp = d_temp + ML_DSA["q"]
            w.append(d_temp)
        d.append(w)
    return d


def mod_pm(w):
    result = w % ML_DSA["q"]
    # 如果結果超過 q/2，將其調整到 (-q/2, q/2] 範圍
    if result > ML_DSA["q"] // 2:
        result -= ML_DSA["q"]
    
    return result

def infinity_norm(elements):
    max_norm = 0
    if isinstance(elements[0], list):
        for row in elements:
            for w in row:
                norm = abs(mod_pm(w))
                max_norm = max(max_norm, norm)
    else:
        for w in elements:
            norm = abs(mod_pm(w))
            max_norm = max(max_norm, norm)
    return max_norm

def shake256(data: bytes, output_length: int) -> bytes:
    output_length = output_length // 8
    shake = hashlib.shake_256()
    shake.update(data)
    return shake.digest(output_length)

def shake128(data: bytes, output_length: int) -> bytes:
    output_length = output_length // 8
    shake = hashlib.shake_128()
    shake.update(data)
    return shake.digest(output_length) 



pk,sk = KeyGen()

M = "DA5FBC7F78116BC8537E8E522DFBB6F68710FC36AE5AF0ACE5CFA3BA4FEBF6C86D966A44C2CF53CCC4FF5B9CC4E6403CFF3C23B4F292AAC01E35A21AB11F0707726E88048DD05887448B870741FDCDFB4451E1216FA2F89D90D872B67B4BA546C8CBF504A46FC02036FB5B287BC82DB9E2D835802DDE3075C7B703ADF4FAE4F98840670964A1ABC61105C3B99C78609605E7F17CD262BE67F7E7A2C6ECC519ECDE8D5B76C21FE5C15859FC94382608A15C7E656AD8E0042CA649EB8EEB59B8E266C244591B265B672D4654C5FF28296707815C647DD11AB3148AEDE24E96D7ABD6C479C0C367B00E464804184140152063153EC3982987618F7D9BD9812DF3B95DDBC47D1F96C752C01B742255946461509EF7A7A67DA0123D670845BE07725D9C1E9F419B4B9133EBA36BC90DE45666C40EA664D93A16948F848CDB9688E116B00B0A4F03B26BB836DFBA93EA6247550FD983371E360F04C9F2793EB769A00BF4049E94F225EE035676E983FC9CB01D15EEB621CC0D4B840EE777ECE351EC66C4B28A36FAF02C42B24804E8126E3852735C2A6F6E201662DC18E125210C78197372B4787A8163ACF4B758921AB23ECC4AB8F3C1DB3549050E26F9C35594DCC1C27AE5999DB695A19681FFD9CD4416E0C79E3457C0B5144F3993E945F6006EA0F541B1C3F473D78F4FED4011E07D46F8DAF7998BBD4A9F5161050D9982DFF28C72E15D158A630B8972E8E2B70611C299BE4BD3405350D2FEB84C93E97FE4DFBDCA5BCC9B6708D7E542D7101BD8D5589BAAEC5649E1C9844C37C5DB0556BBB6B2EB577FB65909B1EBFA7F1590D53D98FC9975BC06F7AC581FE22066BACCA0375AE09DBADC8940E98A38B15FC190523FA6D0CF326D7495B5CC948AC994181EE0DFCAB11722E1B46AD6FD2065442D1FA06ADF21FD9187B55320F554B929BC795F367AFEF11A5CE4128AE32E6C1662D013A91456AD292DFB8B4C161EA7A4D5B43AF63BE7BFC5EEAB9D1E3198F441AD70DF9D6BDEAEAFBD0A293F1A6DF07339A4C34C7375CB6096EB06EC035777C22344912DCCF3D0F8DAED1D0B046118A22886299DA5782DC77487CA5FD0D3CFC724769D658131FA415672996CE8E8BED83E057E3AFE26703012DFED31C732D770FFC7FA55C59BC3FD68C34D00738FC9E3DBECCF4B695B99BBD6A0082752E3A95150AFFE793D8F7FF19BAEFF7744688445E7B561294371E1909035929D654606EED6BD011D2CB0512B1A0987827BB07F14E0E8F0207519DF24BA69AB788EFAB21F1BD69BCB14AB44AED8FEF80F1F63685C6A85100DA1671405F8D6454FCD7D5FB6656959AD68D3E1896C6EB4967615332993D4207DB6B0F5A6E33EF4B2494DCDBA368A052FB8CD48A9E215D30C8C9D37DDAA6B4F3080744E6861B9889E23E9D964F75C5BD5E1DEA98EEEA8E66C60DA73ED1E39115EE0274F2747858D5D644C09B5EFC978D4496A007DAC35F2F68B1F9A3B43A638F38F663E6124740234119D6E8DBAF933ED0FD5A02FEFFF7AE3235C82D90B2F8557DDDC9102FAAF8181E6EE3E9BCEC78E4C61F73FBDA23D4382E5050A0E151E3F51BC22347F9B1A19D74649558ACFF8B21AF69EFFF78BA3E83CEB9EA36D4799272E10F56D3C151209C99105A133B665EA51E4A245D37E7A0F84F5222E3A0401E67BFC1BAB6269CA4A87D3CF062CFFEEE0B5EE5FBFBE1029E93F46FAE68A91CFBCBD5CF8B78F122AF22A11E77095DEAEBC96F1613911E02237F795AE717301499936B440E07B32DDB09008276C9A5A314889E8B9ACDF32D6695AE2931CC29ED1DAFDB61B708B52F9888DA67ECED25217F1A5FC1EE7D482917C7C7E44CA7F0508FD3BC94BEC116A630ADB08DDD882A221DC5D2C60A2E9F2F849B3E8B5DF150EF753C35251850D0B4980164F8C07339E035D5B2EEC4BEEFB885E261E401BDBA408869951075DEEED3C7EE7452AB39856D240E954FC8A4BEB01A0F79187BB72DD2925E63B3DE9E16CDDC041BC3BE47F318DA6DC6A9AD8710B18883367E374DA58D97F00B1E75AC8D4658F04295223C8C4F61B2CF7104492DC7A0C6267F45B5A4A2D258239455A31D265BDBAC9FA6E4A1812043C9112ACD4240625F08B901263EC456D2A5877BC9223A6C483673BE5CAB8C32516AD5B956688A01374AA48789D53AE79E7FB109632969E45684804DAD54FAB1E94A19C2A9B53BB9079F484C64A924C9C940FE5A3ECF29C739E3826311E42B310CF75A47B932BEF104CB27FF35D51E3FED9D724D90A17982F2897E2FD09E555977CD668E67A34216637380B8720A593FFC4175BB27E293C652C2DD8C506F4D1F551542EDBB31EFB3C1BD5DE6315280BB04BFA53CDC2D38C385C04E9BDF389745ED394147063CE3639ABCAA429C68475F9D466321EEBDE9392A2A2A6EAF53FDE20803B76B0903DDC6C81874A81AC147FCFB9FDA970BA5D87E4C346DDB83B60A718882E16F256A0F13969606C43D84AFD193D7BA3CFAB875646401547458F36DD53C2182B36B84DE8F8A50E62921A5B011319C555766E46EFECEB239297DFBFABEF3AE370CF48A08BC073B1E16A8C840F2604F75F39B3F0F4847A445A15F0B946D423210BD32A09A9EDF4CCEAA6E90AD1379E5928B66BD3A02C5E2AEAB56E8987B342EBFD9D3C70EED3465D78F12AF4423319B3106AD8BDBD9AA5736E6CC15C7AEE0DC78A1FAB83015CF880DE6249734153F6058F567D648AECF70D1BAB8397879617FD6FB06DA1AF6713E3CE584B214742587A5D35C6DFD33AFDAAF00AFE00E1CB516C955DDA9E0A5FB78DEF914B532F556D7E72E9717BA49A2D0F9EAFB5F526565C58E0FFC1B55138C8DE7A9D6CC06FC9927F6D04440512163B58A236F57B093E80F3CE0F4CCE282ABDCCE284057C4DB6314E05EE0A32B5F20C481F8BA4ADF943CA1B0277119DA1BBC4EA1D24CF7E3DB4C759E98753EFCABE2FB5B1FA593F2AE2B7ECEA96B8E0E5B3FFEEE97DD6C50CFE8602613FAC2D71174984C2EB59E532A35CF4FB0BFD60B8CF7CA3E7D5C0EEAD822648533D3CDE72C787DAA412FC70674E95CE2F5BF58D3646B4881D4CB6DD96659BB1A937B24795B435A103C03CEB6AC85E8FFE9C495082A87854392BEA530D61A7F60B3431455DB85414E6C365F9721ED2DD4F7C8A37B88131F5B2FFB5FC4A40BDB12EACE61AA956F8724C99DA98DAC18F6D33DB5F4A189454C736"
M = hex_to_bytes(M)

signature = Sign(sk,M)


a = Ver(pk,M,signature)

print(a)
