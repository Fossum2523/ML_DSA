from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
import numpy as np

ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = (2**t1_coff_square) - 1

def ML_DSA_KeyGen():
    # xi = os.urandom(32)
    xi = "72C3C5E0CC9F332F49D0FC0FD6399DA75645A3E33DBF56F1E96897662D0A9B37"
    xi = hex_to_bytes(xi)
    if xi is None:
        return None 
    return KeyGen(xi)
        
def ML_DSA_Sign(sk,M,ctx):
    if len(ctx) > 255:
        return None
    rnd = os.urandom(32)
    if rnd is None:
        return None
    M_prime = IntegerToByte(0,1) + IntegerToByte(len(ctx),1) + ctx + M
    sigma = Sign(sk,M_prime,rnd)
    return sigma

def ML_DSA_Ver(pk,M,sigma,ctx):
    if len(ctx) > 255:
        return None
    M_prime = IntegerToByte(0,1) + IntegerToByte(len(ctx),1) + ctx  + M
    return Ver(pk,M_prime,sigma)

# 算法 1 ML-DSA.KeyGen() 
def KeyGen(xi):
    # 2. 扩展種子 ρ、ρ' 和 K
    H_xi = shake256(xi,1024)
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
def Sign(sk,M,rnd):
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
    # c_tilde = "0000000000000000000000000000000000000000000000000000000000000000"
    # c_tilde = hex_to_bytes(c_tilde)
    # print(len(c_tilde))
    c = SampleInBall(c_tilde)
    # c = [0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 1, 1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, -1, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, -1, 0, 0, 1, 0, 0, -1, -1, 1, -1, -1, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, -1, 0, 0, -1, 0, 0]
    # print(len(c))
    print(c)
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

def IntegerToByte(x,alpha):
    x_prime = x
    y = bytearray()
    for i in range(alpha):
        y.append(x_prime % 256)
        x_prime = x_prime // 256
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
    test = ctx.digest(80000)
    cnt = 8
    # print(test.hex())
    for i in range(256 - ML_DSA["tau"],256):
        # print("i = ",i)
        j = test[cnt]
        cnt = cnt + 1
        # print("j = ",j)
        # print("cnt",cnt)
        while j > i:
            j = test[cnt]
            # print("j = ",j)
            cnt = cnt + 1
            break
            print("cnt",cnt)
        # print("------------------------------------------")
        c[i] = c[j]
        c[j] = (-1)**(h[(i + ML_DSA["tau"] - 256)])
        # print(c)

    # print(cnt)
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



pk,sk = ML_DSA_KeyGen()
# print(pk)
# print(sk)
M = "4D3C4D952A1DAC151736AE9D0CD37F7C492539FCC916A4B2251309E06CED54D7145868D145BC8D16F8B364E5D6026E113BEC4824F6BFAE3C9F6C8B888EC6B8254CE59E9E8E158EB04077841243EE3A89D25C0B30B4A64B723697330AA87663B20EA4513189558466D264C79088415EFA09DE9B64AB01B640B288D1D5562ED744E80CAF0B6E2C29FFA1C321129EBC70CAA73DCA7DCE899571260B2E7DA1B47CEC5BB00FD66AF8B89BB84392897BDD1A5EC7186670DB81604E0B949B5AB1D19522A3F0828D0E77B300A63EDCB74C48F9A01CA91816FBEE011A5B0145C6A0B4EFD5A3008A91E0B1AC96DD8CB9410D56A952E74B7FB684A0B166E5F0DF9AD100EE1C9E3B7B851B4CBF337A3328DB13977451E992C4A0B454BAC5E3A2D0E64D106DC47C216E0C0AC11B0F7C48589E573051133D01F29579C7E659F8FB8E6539B0F618D053F4323AD0237A58949F689458ACC109BEB7C81952A879A10BF8BC01CE057E936B62017E226DD66AB2470852C000A618B9B130050F6B047746D068FE7D3CC1277E4FF4400F372D50A85F469B4C7A35AA7FE88DD923ACEF5FFF47A95F971EFEA6B65D33E65F20173C5BA5A320DD16CAAB59AA7A7BB99956EB5ED54EB93E89C887A30D6D384345E21291B8E9C6CDCBE2671F810A058B858220146A2161B7412CE2DB817CC8C99528195F567A92E198330AAA418A5FAB754E27221A2165EC4D50B391BB8AB2BECCAA449CA1D4D3D5C17E28573048452EE4120693505515CF8D1E2F8984D363464DB786E9B8B7BDEDFA2301A21F3C469F013E27742405CFD0D15E70BE0560E8B18C82327861A8DF64200A51E69D2791D41E1E12BF371664270AFBBE1C84FF19D11D4C233ECDB8033BC79BC7967C410C13E8E3F9340F848510760DABCCAB6EF7BB87398B1421E5804F6D41ABC09E6542D72B87115F1281450C66AF3BF4FDC21CB9B8C27D0FC6DDFA73732A877CB7D7C09B8E9F4603D9865E4AF91C58E9EF6FD9A32C91EEAAEF170BF4F44BF586D789EF4571DEBE6FFF0C43E842617FA50FA6EAC8C7F70EB680BE717688188A430484F3388F6219A70EA38BF3C6DBBC7FF3A749D8C8E51A1365AE372988D248F9FC0F2B67E896CBC86D2AED35F7AD8D4E93C21DA09E0204C7DB92FAFA7119A63BD0CC00A029CE7DB93DF34C33ECF673D48CE3F40948DE86CA5467CC159960B329F560B20E5C8AC37AC4C8960B49B455075489E7217D6BC53AEE7C19B3FDE9FFF667EAE89AA6CE8C415E807B348A14598329A32D9E508C3409DF18EB426BDBFDDD88AEB3A9BCB9D84C2388AD79AABFA3445F80A9A68EF74096E34516CB5316DF599E5836F123271CF729472952E06C817A67C219382F22C4B0A16F7B7DDE9ECF4AF6927BBF4424F43FCEB1A48F1F2CBD98E7593464EBDE45D604B6AF95E32AE728D921B390F712ADC280257F4420741C0D29E0E6B98EC1708569381BC845420DB0C1BDC9A23DAEC209378A01703B9C16C10FC29763A52FEE64F0A728198513361CD981DAC739937FC472CCCF666E61DA3D90C3656F0BBDE6B942D8A0496C9BC703F7424BF00848800AAD519347A4747676C81088109A2B67848EE0A08BD1409E774434EFFE754BDECAFF2328EDC30FDB85B45488DE0A5D9052397F9DDB0F13865DCA85A36F6B43B84ED044E5F40BB960E56DD0CD6EC08C37B017FEEDBA4A7F20A174E1146C441DB99A2BF34BB8D8FCAEB874B2313AF2E20B01D38B56B42451047EAFF592236CB241857754F6E2DA3E4FAD070FD195B641567375B6F2744FE16996D7A73D095F5CFFDD50A96508FBECF802625E5F168DA08C8D5198BB2702F1CBDEA8221BCFC301195B717A0D174EEC9BB96E7C49E15CD2A26B933E0C6BB11D702F1A21D33BE48039E89E38C2A5E96F55A557359BBC8E191719EC5E5669B2F168912C9177B320A5762474CB2303F54E78F4DBB914EA354F8C9A3E81342A10ACF5FD4A3D8CD6F85A204E165D59E4FD12D5E5E900AC94DB984DD8A5A72372D8B5D8958EC7F9E64CEA4E560A8D9525CB24D3B2F36ED7D46F897229A776E7E422838D4E2B551B28D0127F2B7644F35FBC35BEF9D856EF447F699151F73AA70CEEA55F6193060762B28FA150A83344A2E23B9E5E1B103805DE85C520EACCFD67A5C390334B036028D4B696AE3D6F6DD80304F7CF915F564409AE65AB7504D8FED434966AA4D4DB3A3C90B160332FB8E6A33A392122E3C02F27C38E37B8B217958912D0AB987D232B65D7FDF3F28CD507D53F5CAACE75224AA3F63A4D4570627561AA146A32645C89BA18CD4C7D2AC0D9123C89AA7D4AEE9CF811DC877D7D0321AB5C7EAE86F2EBD61AAE681EB53EEA73D0D7532937AAF8F8A23E0AE64FCBAF782169422ADB6CE8F3F003CD2EE9EFC37E5EA1A8902D3D1246A89736C6C7C9A46FE2D2DB3BEC00E69166ABD213A6D30494244FEE28050BFAE566DCC91C9528883011F215995DC92E577421C9645478FD3C3D7D8FE06BD1824AA20B4A67CF9E8C2A69C031E4E1FCBCBB6170D60838C61AF3731C7FD4DE4D6277FD6652B63318CF093F7DF46D800368A71333BA657171ADCE4D360E249B32F49F93E38C22ECF79C89647564B7F83E26A59D403B239A25F7629CEC50EDE1EFB58D9017ED44CE34A3136518FA009C8BEC057BA054C794EA0F49F3C581FD91009835946742B806D115D4E2DD109E1797F7DB5575CF233980B2D072D247E704EF40A6DD6651369C67B576FA7DE4C794E469EB2DB8C0E424D07CA01753671116FDCB9B37C0517686D85111B8E12A530C25F0D01ECB20E259CCCDB0A081ACA5CD06E9FE50D79B9A7412E02F41B53CE3555E986833D253532CA5D27A4F0C72FB698CADE01B36CF94C5A05907AB3AC631455B4AE91803F2A3A83E9EE23EB0538840E1C9408F73205D7930AF7CAA7B4EEC2D47A71B9600550CEBFCAF49A19D63B3B50016CC8077D97C27376E2AAA370BB3CA213968D242C11AC0A341"
M = hex_to_bytes(M)

# sk = "D26EE59A89F67C98B20F890B03422C8027B776FC305BEF422CDED403AA705DA5DC380AD909E3C13A76F7F59BDD27A843F5F9A1B8E5B7B524EC445A916B7A44A15167716BC609B3EC0C653B210C6569BA2F8233E7F6E404B92EB21F39729FEBC06A644087C75FA7DA3DDC5B85A89F55C9F87A15014E27AB325EBEE0FE472B2F56205844860382534018828866441476575685641203648087665585183625516555420058871751602717711246115635711801273601127806468005021161768110481565564313804086156224775253365085726676702542128777015217656384221466167018541712560775653305356788352067346543727338426471425281415038533202656128851671300117755513452307351315370854301872372157587303156081110321112258736404438264705244308745330557358455160473004531650442427724303753273643545546151241081547412433078243311343703723518581388573234883002524138203118818106712726275005164485846703435423180316086652647174338637385102777331112452328027048826136833604027623520567678561007443300118026417762172470414100567684236755276750265038807023654313530500201746332586762137686700431224203777868426234607501375807606118643643343182854487118067375717216763686234631445727470521225615865012624304163885146650645168324156757125027631761181378335367286426405258178463767046744346405385558607416365312311607655783032614171118036426333182624236747864807656353823246577001576547601536137245648167881548355703441616635365661535127864121615460226475308628856173321321610874562553506784723735385386463056370235073236822680783606365575167372423481370273787321706274756640515832755317524417643527131782776733023626563226284344414664814180751873017473606630568447604505822478245472545717704487614714872060204431705604477512622755208754111644114533555057070674013756756613028602834613507528705643218236456378337317881601264762752721064334675027466164547381066466654324575825520882682277558861126808652842067242706502602822135413806761150412241623142132062854561462005282463527054222067084232463834703022563303120640700613028248186135862267807514517034808871887028651376603357053471356848232460123720236623604868157088117331708032612544633466027487881011822577840213584603838688167482874577534023608684717551178060878605807013607371146861810111452118252851727546664116442725718666627745565706128063346337837125850568444871521347471236266350161674306083251415448031242478881077307231468143328543380706263487802348512856658522881606460085147711847660265787214085344812640116713686701544018882508606025375436400485704788868344567583740386811256420867877166077712432136288331062381178450376522316153520153726880635206125157517874821078632831518110002578434628677277256811181641133083303108474041885821315177237034415740262877735530252155663683621050363812382062703541636072037888130651437727453164255777504346625374221717666355341021461642300018161635551232553767782843483040236111880701245700154018276321853454261144802277261072016656336147062500850107086111551067005227866654812551566680414042612307370316834001206560231706668641615317857425305313402768758031066346812502214187812016774121074448086641371280564240151566227543442570306101083513862873685631407576010245281712830883456301434255351012FADA607976F6837B0DBB68127C5D2CCA1E3BFE9CE0441DAA2FC7F0145F96BFA473054009EFB11184E4718B045758DAB9E41CC03A8A581F86F05C9D76F3BBEFCEE4A67DCD2CE920CD15B7241D7BF641B462A72E287C3DB90AFF454ED1C8B0794AC1055BC6B4BE81669FE7154ED8FAB43BB21E2D787FED316B81CE03DA5019A0948BF4F19CE09D317736CF91FDDD4B42B29B9AA0C87D58C81D2A74F22F44AFEFDF6DD0BB2689BC4E54C42DE56F5FC6796941631931525D7B51FED90894F88B20BC819BE6F19D080EFC03E23CB034D06EAA41D552CCB07B42AE79486825EBEAEE22CE193D5B9174E20491E23F376E3EA9731981FDEE6E0C837A07C9A6575A038522C8F36FF0E481625E1D693C69E2B4B4910B35CFCD7AFF76301F15E580C5F2E4118CB9754D90ADC4140E4AA8DA02FF7502514652F07D14B0AFDD6DE58EB896CF51E562E0B7972E85D334EE77E09E7882EF080275786B91E1BDB949E94BCFBE45333D0CFD6305746A24B4B2AF2311F964151D4F89D12D1D88A6149351CB3294926A3B05051FA1F613F4854A1727E3FC195F4F5F99D7A6F6766A250839C090B4D81E71C242A58DEBE5DDCA556B97DE9790DB89ED15CEDCF7EBC6D44DC61881BE060F905CBB77025694FB382A66A2809A759AE66DE102CF059E9339C26112F76C50B39EF61ADF393B92B69BD88F6AC5E7EED1FA1A8BA7201696DBECC8FB9AFC1946C744D92F3ED30F8834C398F42C53720510D16817A8074A2F12D27FF98CFCFFDFF7D94FF793993991FD44C799D8BAA5E0BCC789D3F3EF467104BDBF2092509E530F920DA1F663A5E58AECA50EC6F1DC82986D37EE6C195D64E2D4960BEFB09D3EEAADBF9873340A5B86D29DE380DFC41A99D7350D9A5055706E3C2037245DF35B9DF14B810772C3A40887CA02CF5CD42993E360852219A9A384647CE912D95DFF0E80706A2696296C7290214CEC72EEB016D34E03FBF5E65F4795E714B35DE183FEE6CC6C35E349289CC8DBB37AE9F968CF0BC3654D3B82175B0C5AFFD9B1D421B7DCE8015AFD77520A983E1C1E9EB0708118FA4BBEE072157E7CD8CE9381091D3F1D4FC3980E5F8C95D54F4E6BB7AF368AF6BC9B332B80D7F8E76C2E203049C3380C5E0F5299DD6E57CD59AED1CCDC998F2FAE72C29A0C1D4025C34E506AF77760228DC3B8B680AC8A2FAD784EA6B86EF34F1842E66F46FB0F68F0101425D16341825DD6605DF6310E7C9811F4CB81EC3C7AE7CC6F528C782C6D33D6883E895B3A06E3D3EA84B03E3603394B44A1A3C289871A59269F4B80F4C7CF404A4B99A529A574BE46AA6B52B4E544FB7022C90904BE1C767FB8DB744B9C69FBC503C234F6618794F71AD8C95E5087F54B4F82154454C0E7386F21EECC0DDBAF454382A973BE4ECEFE846E0C21B60B56448E6E5EDDBAE084132A1397F16314047144ACADD6CC342447DB6A65365747A63C404AE623BC3EF1703C18B14FDA178AB7392E9EB6D2C9045EEFC8A7368DBCBA7F09CC88D6EA54505BFB82373819FB990F0F64C6FBE421E35CEBD9B79CE77BDF3C8946C58C6071757284E5B53B56DFEDB2EEF928DC9AE02BA21A2B5E284E285C9A6CB05710E2634CB3627C52E577F7E5CA7475607A7D2CCF1452F9BA703D322F69A47F16BD9851C7528D89B59C03B426AEBB3B372328CA9102F624E901DC8A315524B941706ECFE0AA8AEB0AF8EC33D2E1CA203B489AE23C03D880B83D738CC277EB6FF1C7DD31886C639C6C658396F60920D8A0A4E58278D63E5B393295FE8887E8F9F6A64C10CA241F699B99D72D13722E42D4615D9F3D0545E320D38EF809076F4216428C29D130F2F83052B9D0BA4A8A1872A242BDC59722281DDECE5407CBBDDBDB0B8C04E9385AD9660D252DD28AA881166694207BB04F9A24FA92216ACAF264C9F1CC200A5E2CBD2694C91238A8972496097B3BD3785345EE7171A9EB96619722C64571DE6327CD0345B788871D7D5D0D84EF2A47DDE6680B7743AD61B164E558B672E4CC4B46D6E6C236C2133965C8B3C7D0F240AB0EDEC78E8EAB4C80040A037F0080FA3B15ACC3EEA34208065EB6E6E21DA65601454E6DB037C08B051A1942DAB90C92B0BDC8C572C52F0AEF84B85F0444A6C15E84801448DE8147804F796A1A05341E75DF015FEEA7E191C461D3D3D7B2D74A9C4C7E18EAFE0966C26731F0A960461DE0387A917A6BBD645C4668030642D70DE30D9954556CDACDE00F82219E7A3EECC8354FC5A4388195CE568016C7C63661559EF65E2FF09F1C98A6668C23AE4863B04287A3BB6210B3F5689A3E7978517B95B0D06A831F28A3FF55B6053E38535B2AA97FD66B42980CDAF9E5DB6F1212BC23CC740BB7DDF8CD40391C0190F62A0A2A287DCC2AB8FA65C71675619C451EC07F3D67EE81A6370EA2144D82CE63CAEB4FD76E6FE4979FBC149BC54A9236D4CF23CD5C09E83DE5BD888F2EB03008BB9FBA0CD5CB79DDB62E2F9F8F2E11B2210DDD11590E21214015085A3CD8DD1665AD81D28D552B214D91550FFB3010102098E6F7649A5E06057998E25B4F789B2FF356299C589B1CE03D4AADDC9177B47974FBE205516B3A9E88F0B3955F133C29C1EDB94969E89B2DA7B64EE423A51672521CB4E1008D0AFCF68D6172A174F0ECABB5FB7648444032E6443CF9C7FA4ED4E1728427C2804699A143EDF11CD6CF9F5AFF6341A69DE7B7710C223C799861242C0D68841F36D9200122381EBF94D22258B38375C0D25DC1E3EEE00E312433CF8032F46EA0A0BCA36C679F5FFC82898372D631FA7368595ED7CB6571E8C00C16AFA4F4791E63813141D800111C1EDCEFD8872BEA41B2DD159676F23BF85C7DE07A30D2459EB16B24BDAD322C177B174BA83EAEB352B2C0D8140B33D50B0C9F2DDD39F305F9AB4565D3ADF35550F023F346900C59903CB972579395840D6A89169DA96D7012A821632E66821591FD3731EB068CBAF5F18589E7541CB4AEB0C4859020D0A3B99887D12E78F690073D29A242682D4677E2F904DFD7266E0514F6E460AD2F1FC5CE875D106432C5F91D6246D80AE5C7D8C4E4EE122F5FC58380391ED536CA4F073E2B55F5ED19751479CB3A71E72E8F330E086981169140A8AD069A49B1FD4EB950F9FB9084D1E702B957D081709FC510D31CE2EB1E42AB474D73A793231EC274EE399257DEC4B9D0704265A77E745F4CD8F9E4909FB9299304CE6AC7FA95C3F47B210DA388EE748ABD41CDEB3CBB187A40BB3C3F4150ADA3472DDB398DF8D8D5865EF27F54CBD4164DB0465DF7443E1D7782A2403387EF0118E8EB10283A39072C36A46E724165F49ED170A8FCC00FADF037EBFC652810697CD7108A56989491BA2232BED54BA167DB9D526FAD348B7787AE71557C59B38D1054CBE9BCB45E17BB146ADFC04F6816334D3D815BF73FBECF1C9D437D3A47A7862C286884B638DD7FB64BE01B7981D7CC82A90938EBDD9664DEBAF0E03A595368B89338AB076BD22AD579D04F1C7EA075D220F8CCDC0B9E372F5194AFE834D28"
# sk = hex_to_bytes(sk)
ctx = "23"
ctx = hex_to_bytes(ctx)
signature = ML_DSA_Sign(sk,M,ctx)

# pk = "09B4887D97BCF6379CC59B6162C1E8BF0560BF44D61809170E6E28F70669A3E9496438E8915735ADAEB445CFDB7D89B38C048F4C3E00581514C5FD198B2D1739E883B878D56BB41264BE41D3D51565E2E9CAE33184A899F62DD57D07400E98E58687A9B22FA317EED134CA7214BFF021DD2162B183091D15F263B7298214423C6BB696D75C20D9EACD0A03E4262C4B08BE39FA2154BD6E5025FF791E885F2226E3CF48F7B5EB04FBE9ECF75B19E1D15C305E92260AB0D6AE7DBA7BBE73B6BC181CF933840CC10A00050228FA46A2636DD9A90947E9F13A93EF4C62BE374D76D1FDBBC5D8B55E729FA58665AA07B90C8CDDD61C566B0D7ED65770492EA0713E1ED46AC7AD1503C56D9052D2C94D49E4416AC92B70396F76F6FB481045681725A68CB356377FB231AB8F3EB9A4982FFF1836473BCBDAB6872D229467EFB9366261FEB148BA9B7DB9C4FE0BB88612ABB8FD61096F1819604D55DF6020464D3F092CFCA59812082218566899A56A3C633CC81F88ADB2E1414EF3850D10BF5A77ACE724D6C1F388928744B3E542AE491CD56A64213F1D3CC90B29105F43D237C83D5FB829325C83E654577776392F8536AA9DAE872407ABAAA9ACC22A6812CEA74C0BA67EAF4A410152975E9A83EE4469295317BED10551BA32E65AFC8C8E68DD55420C502D937DADD2EFA2CBFD1F739FC0AB2B2654FAE08C0C7F8EDD43CF9FF0B01D984D491852A372E9FEFDCC1BC16CDB5239AE1001155F89563051CE47996C5AEEB2190EA18F7F734042DE68E988367D89355D9D8377BAF9647978EB2E492AD021C569AE8BA69B15F1FCF7039A7E64AF10ABF3EA45B7222F9659E33373372E1DB186D2C2A0D75451C478AEF33E5949F240040C2AFC44B1D3A02A6D2F87902A280E27A20D4E57F889662700DB8A9D249957A7DB437CD480DDC05884FB23F868268EACE34EED274A927D9D84F1EA57EAB1A813B5E6AABE9ED2610BC6F72E320CDEC4F99523F93FA448DC1FBBDD259B102F5DC9955AFA0C41604D83DD1C2D2295EF4461456BAE86905C4C30D8A9FA48C90F37A19C41A2D5988F13D51344EC30A4A46219FE841137D5AA1F51E6C444168AF39890B6FA400D67F4806F5BBD444703074A7A1139C71746D7C4CEB3C911F5257E3E53EBFA5AA8F227809D44EE7DE13C027924DD60153B30AA76DD96A7C5ACC59B627919507BF14257AE7A26243C1683B28D1B14B501AD059B4D522A57991E5539CEF18CEB5C26D660B8822454C9C42A95E6F72B84F78AB99F51EC49789F9DB4C128B0318FFFC82D95CAD277F11E14F1EF871414881122A9B11BDFAE4A7ABC8E75755AB13741DFACD664293D1A326BF5ED5ABBB153EBE6996DD622F0A8CB473969A50366BD0B01C5C73A892B8E26CE08F75FF801B6DEF041E1713BE6DF0EFB51587BE5FBEA727E00D717647DD539079DE18AE7BED12B91AF8DBB1B8B32D2860BAF40AF8A0BBFE02887EB5DBE7AB1AFC41DA79B016AA16EDA281321CAA5DA644FD8658A7B702181001431560DD63CB21E5FF75C3F7250456BE08C0D5E34C3BDE2F606A2BF3417768D24B23739EA86CBEFDDA34388BC1F918F951E15E43B1385A7BCC559F9492C7213A14227E093E929F32D1EFBE7F1EE57C49C9055623EA42EC6C79D7FCE71FA747607566DDA69F69DAF68115919C6322EBB42C8C089338C9E0C53565BCBE72FBE4726687B0787071806C5A6C149C82B668AA64A7BA0CCC1CC49A1EEE9453D04336E5DC811E03892F7F46688ECEFD04F1876F7111712B595ED62DA00678F9E3786B5C1A5095BE8710DCFA4165256509E00143A6F1172FABE8BF21E5FCE7C79C1A44B4B1525A076FFB8DD9066"
# pk = hex_to_bytes(pk)

# M = "3AFD7FF8CAD3ACBDF97731261C7A1C969D5016F17D3E7F83D2441AF9014B63477B14A6413150FAD7C84439BC88662C5E931F06B9514190E13FB049C4AB74013233B98D48D9AFB6A30A67330E1FBE331B09C56D037E9701085D80F1E7F4043EFB53587ABB823624012384515249EE6130973DC9EA6F558BAE75107EFDB1D9285B"
# M = hex_to_bytes(M)

# signature = "4A2B16CDB552F9297F8E391AD8F5ADC8CC5D2C56C46B800F9B3EE4BBD2F2E8A89D599D7B5CC2D88C80F271859BBC83043EC4E54812F5936B446C9513C855289C94B11551A0C7653E7BA74FFB6F72D4652C91D38DD1F90DFE4439BC21CA53E0CC7A7AA5B875A5B9BA42366EB8ECBA2436DAF08A91978DD093F20F1EFB6B0BCB90DA99CCA05E8F6F82B86D3C6EE24BA5D50AEA10B2307F57F89ED78DB4A74FBBF6EB332AFB08D074ACF0DE5CD7FEC12F76F3AB619C815B9EDD287EAD67F04F14797F8DCF2CDE9A8753B5AD0AFA12874197D1744092872521E868AF9E64452373FEB6FE25D5273D63C0EBD6D3B1028C1CD06AF32CECA2621310837C72788C8ADAB5A0F03817128EB7B766FA812C696CF886F00A1044CDD06BB28CB2E5780C8D8CC7E60AB699DD78668BE4FF9F4690C6FC98AAC9C02B66B9B9826A3061FD3222DA8482667960A31652EE88EB32B0469AB71CAA2519F23D1A2442D5B1316262131DCEC5F287E32FD343FEB4429E54258D690D9D20A10ABD75A536DFF8CF1D6DDF19291E2749A7D16EB90AB5093BAD38E116A86B730E65574C068C38BA9457C9D6D913EAFF57FE23BF3DD24D8CA511EFA376A5DF08467025FF51BEAD3EDE0A84EDC5321620998061E8A1A73D67B7021B810C7867FF39187B59D403BF7C7506300C7345B1FE07C11278B0ABA61DBB4F2B8C43E74FEFA55ED52C10A8C490882BBFE3E3B3CE579E8116A9B6686C1A100AA1F6591F191F772B5A5A50DD6CC155CB5A1BE5BA122E91F044420156CD63080F0A45D662E76DD57BD0F689D0B299042BFF485E8A382D865C26CD46B4A54728BD48458362D79AC3EB756FC6C518C9E2F0E7D5A303AF1159EE6DBE7DD56BA0712857A68836C3C78C6C9F7488572813C0F6A814709D2BC142FEF02527CAE7712358371C5426522CCC64300C2CD9FBE20C6562E34835205FCDD5A8982C920BB477FB881702827B4911871394C06B5FECD0C740AF7B27637BAC1A0CBCA537E4433EA847454C693897A32E4D1844195426A0C6AED67472BD2C4EEE179F3F6084A36A7689F4CB1F8E5DB2DDE54ACC0666BA98415431A4B202F402FB1F1BCCDC23BFF13148C7B8F61FBF6243B296A78EB698189DA95BDA85DBC11D15FFDC6BF46C53F6E472A871401E9A9AB7F9FB467EB4ECB1F0DA7E63EE8619CBC486EBB0F2120A7811BFB0557D13930574297C9464FC595B27569ADF5F4A8DF669C9EEA0A250F4D22C2E8C641BA3902BA80800489965F11AF1E1A85717C624E742F161550819D1F0372C5CAE8BC62B549EFE874461080D06346E1FA6F01514FBECCB06E34EE271A0F0031790BDABE0F02BBA4AEA4B7397FE3333EB8121820757281F96A5831F9E490366549D16763FF19FF773580ED5E3E1E2AA3E38F88474DE6D9BA6994F8E629160488CB4CD5B878CDA37AAEC9B56369A7E73F73B428639A05C1378448ADB7F074DC8154D92E13C6356B5F466D66477159B2A943799AD619A029F3010D037672DBB6820E51323ADA98881C6DE859DF875ABAF11DA5DDCA5A777622BDAE8FACE2E0CED3B6A77B88A8729FB7C50933DA6C52E3F4D948F9DC153B5B1299CD8621DDFBA48AF44E4B6F6106EE7779501DD5FB3C578EA4D32C5C2F036A7352703ADD135AB84460162417E50BF91E60797D59B9E18D324DA971F4FF428AEAF23AC0BA4E2E2FC7ABAA6C8984FE9E2D85B8ADA4086B3C13ABD43CFD1C711D8326B18ADC34CC14CF8957EC3959498FC2A7BE06BD1840DE170366566E50741957763C2DD27ACF8C3F1026FAEE1D2562FA1052E69AFDD42F446F0598866D5D306BF1B775042B035927372827F4386316534FA1B7EE633BA958CED8F0D241D4688E3C7918E2A75626377C342A590692BBFB827BF90514182D4090DF8D7323519A1AB6CD0227367410DD14D3786A26DDF91724FC82D06A25D5F56683953E8E0F20E3C1771DAF42E52024C116ED8A4C0A611680F5FE00ED9B148D15F12AA95B9BD5A9FD8101642B36911F310B0DE18171D6237D9BE1725DC299A1A3AAAE98540CEED26953D10CE8547F1C3E46A862BED428D1E10601BF328C727FD95343E2DB4D9ACD5D1CB4715F6004096EDA093D1B0A33B1E56F16D73ADB8732CB4A31160A4491FAA0C86E680E3D7C02CCEA8FE92F1E001016D220221DD10ED626017966C3450AD121365918C93091F14712BA477CF2E263296C778A2BAEEF5849455FA35CB617251E02A22DAF5C33E5AAA9F00E8ACDC50ECF47C521503C52F27D6B57C8F2B3D8F1222413E7FA4EC59296338098C9AB5A1D8A57884BD860041406D9655D17382949A03D50F1108D05BDB31CA08E66F2D8DE480C6793518D49A60D4762A9EDDC0249B422E84020ED539A14E2478F68BAB1F2B00E22A5CBB62979AC744E08B57D5B578C401A8D26D9ADD1505236082863672D911CF3A0966D303F8917093BF97AF90A7E1F9D59B09206B9CAC35110FA38D5890ED2116835CE37384F5630F1C428E213605872ECF911B014B91C2C600E8A40729D07BF918790742C9279F3114F68CDF6594CDA3CA6694223A82F66C2B4BDF3E51C6FFDC55E0FF51EFD6C934362BE7D6FABC11B8B0DADDD52108FA5FB5CA758A64377D386D45CE70605B460E8157037B5B1B2E0AEDD12A633115D6C43BC6C7C836FFF33E7D033F2E5800527164C0C4781C37DF50B66BBA5C819473A1C5302083A16F01437279D2F2DF14C878269A2F3FA40C1C761ED61501AC9EF141029038C819954089B738098708174393FEAEA7B02AE5CEF67B3C8CE6A970675CA1B8C856DCF5972508C7C6B25EE4D12D8212B98940B488EC402AC7AE3C70DF938D1288CDA7A319E085BC73A469B2D2A3303B11A683100AF6DB86937BA1182903616E3F0347BD68591B47BA65156B93F260DE59B3AEB289E2A73A3BFF38C2F3ADEDA29C7E90283AC7B86D036B47D5BA1A03EC783D250BACAE5847E41F829CB33DE08DF8F7D69C9AA4EDE8D7AB968407EED31A056BA0EF8816E127AA90065A679E1CA9550DEEF25AC5B7A34F70DCF2B116CF351F3BADA99F836C730DCC1AE03F496CF3F0387A0C2C702E2C13BDD9CF45A1CD53AB58731188B18EA8BE48D510C5812E90BCECBC6E198E708B1C08C8F864B124BB4CC0BDBBDF2C2F4E388FC19660D69CC2C0EBF91008C8243DB42DDAF57C024251C4231DF53790CE575613EE8E1C7A33C1561F3504DEAAED1E8408500623ECA5AE5A2845411749930D8E42078C032349957FC39A1DA0EAF9E87C31FFBF6AC0C1811EB28A41B1D86BD7D49AD1C468A49594956525A20A31700F122F4C4BB2252A2F3D5C5D6873838C909597BBCAD8E1333D5D617C87C8EE0F1B22383B424B4C5C627298A3BECC1B32475C9DB6B9BDC6D6DCF50000000000000000000000000000000000000000000000000000000011192834"
# signature = hex_to_bytes(signature)

a = ML_DSA_Ver(pk,M,signature,ctx)

print(a)