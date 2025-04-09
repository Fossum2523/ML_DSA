from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
from SHA_3 import SHAKE_128,SHAKE_256,sponge
import numpy as np

ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = (2**t1_coff_square) - 1
zeta_list = [
0, 4808194, 3765607, 3761513, 5178923, 5496691, 5234739, 5178987, 7778734, 3542485, 2682288, 2129892, 3764867, 7375178, 557458, 7159240, 5010068, 4317364, 2663378, 6705802, 4855975, 7946292, 676590, 7044481, 5152541, 1714295, 2453983, 1460718, 7737789, 4795319, 2815639, 2283733, 3602218, 3182878, 2740543, 4793971, 5269599, 2101410, 3704823, 1159875, 394148, 928749, 1095468, 4874037, 2071829, 4361428, 3241972, 2156050, 3415069, 1759347, 7562881, 4805951, 3756790, 6444618, 6663429, 4430364, 5483103, 3192354, 556856, 3870317, 2917338, 1853806, 3345963, 1858416, 3073009, 1277625, 5744944, 3852015, 4183372, 5157610, 5258977, 8106357, 2508980, 2028118, 1937570, 4564692, 2811291, 5396636, 7270901, 4158088, 1528066, 482649, 1148858, 5418153, 7814814, 169688, 2462444, 5046034, 4213992, 4892034, 1987814, 5183169, 1736313, 235407, 5130263, 3258457, 5801164, 1787943, 5989328, 6125690, 3482206, 4197502, 7080401, 6018354, 7062739, 2461387, 3035980, 621164, 3901472, 7153756, 2925816, 3374250, 1356448, 5604662, 2683270, 5601629, 4912752, 2312838, 7727142, 7921254, 348812, 8052569, 1011223, 6026202, 4561790, 6458164, 6143691, 1744507, 1753, 6444997, 5720892, 6924527, 2660408, 6600190, 8321269, 2772600, 1182243, 87208, 636927, 4415111, 4423672, 6084020, 5095502, 4663471, 8352605, 822541, 1009365, 5926272, 6400920, 1596822, 4423473, 4620952, 6695264, 4969849, 2678278, 4611469, 4829411, 635956, 8129971, 5925040, 4234153, 6607829, 2192938, 6653329, 2387513, 4768667, 8111961, 5199961, 3747250, 2296099, 1239911, 4541938, 3195676, 2642980, 1254190, 8368000, 2998219, 141835, 8291116, 2513018, 7025525, 613238, 7070156, 6161950, 7921677, 6458423, 4040196, 4908348, 2039144, 6500539, 7561656, 6201452, 6757063, 2105286, 6006015, 6346610, 586241, 7200804, 527981, 5637006, 6903432, 1994046, 2491325, 6987258, 507927, 7192532, 7655613, 6545891, 5346675, 8041997, 2647994, 3009748, 5767564, 4148469, 749577, 4357667, 3980599, 2569011, 6764887, 1723229, 1665318, 2028038, 1163598, 5011144, 3994671, 8368538, 7009900, 3020393, 3363542, 214880, 545376, 7609976, 3105558, 7277073, 508145, 7826699, 860144, 3430436, 140244, 6866265, 6195333, 3123762, 2358373, 6187330, 5365997, 6663603, 2926054, 7987710, 8077412, 3531229, 4405932, 4606686, 1900052, 7598542, 1054478, 7648983]


def ML_DSA_KeyGen():
    # xi = os.urandom(32)
    # xi = '6CAE2E9C2CF64D2686C31C2118E0F24A47DD46DB85590910AAC9DF4C1B854E44'
    xi = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
    xi = bytes.fromhex(xi)
    # print(xi)
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
    # print(xi)
    xi = xi + IntegerToByte(ML_DSA["k"],1) + IntegerToByte(ML_DSA["l"],1)
    # print(xi)
    H_xi = SHAKE_256(xi,1024)
    # print(H_xi.hex())
    p = H_xi[:32]
    p_prime = H_xi[32:96]
    K = H_xi[96:128]
    # print(p)
    # print(p.hex())
    # print(p_prime)
    # print(p_prime.hex())
    # print(K)
    # print(K.hex())
    A_hat = ExpandA(p)
    # print(A_hat)
    s1, s2 = ExpandS(p_prime)
    # print(s2)
    s1Hat = [NTT(s) for s in s1]
    # print("s1hat=",list(s1Hat))
    s1Hat = np.array(s1Hat)
    A_NTT_s1 = NTT_dot(A_hat,s1Hat)
    # print(A_NTT_s1)
    aHat_mul_s1Hat = [NTT_inv(s) for s in A_NTT_s1]
    # print(aHat_mul_s1Hat)
    t = []
    for i in range(ML_DSA["k"]):
        d = []
        for k in range(256):
            sum = aHat_mul_s1Hat[i][k] + s2[i][k]
            # sum = aHat_mul_s1Hat[i][k]
            d.append(sum)
        t.append(d)

    print(t)
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
    pk = pk_encode(p, t1)
    tr = SHAKE_256(pk,512)
    sk = sk_encode(p, K, tr, s1, s2, t0)
    return pk, sk

# 算法 2 ML-DSA.Sign(sk,M)
def Sign(sk,M,rnd):
    (p,K,tr,s1,s2,t0) = sk_decode(sk)
    s1_hat = [NTT(si) for si in s1]
    s2_hat = [NTT(si) for si in s2]
    t0_hat = [NTT(ti) for ti in t0]
    A_hat = ExpandA(p)
    u = tr + M
    u = SHAKE_256(u,512)
    p_prime = K + rnd + u                                                                                                                        
    p_prime = SHAKE_256(p_prime,512)
    ka = 0
    z = None
    h = None
    while z == None and h == None:
        y = ExpandMask(p_prime,ka)
        y_hat = [NTT(yi) for yi in y]
        w = NTT_dot(A_hat,y_hat)
        w = [NTT_inv(wi) for wi in w]
        w1 = [HighBits(w1i) for w1i in w]
        w1 = w1Encode(w1)
        c_tilde = u + w1 
        c_tilde = SHAKE_256(c_tilde,2*ML_DSA["lamda"])
        c = SampleInBall(c_tilde)
        c_hat = NTT(c)
        cs1 = NTT_dot_l(s1_hat,c_hat)
        cs1 = [NTT_inv(csi) for csi in cs1]
        cs2 = NTT_dot_k(s2_hat,c_hat)
        cs2 = [NTT_inv(csi) for csi in cs2]
        z = array_plus_l(y,cs1)
        temp = array_minus_k(w,cs2)
        r0 = [LowBits(w1i) for w1i in temp]
        if infinity_norm(z) >= ML_DSA["gamma_1"] - ML_DSA["beta"] or infinity_norm(r0) >= ML_DSA["gamma_2"] - ML_DSA["beta"]:
            z = None
            h = None
        else:
            ct0 = NTT_dot_k(t0_hat,c_hat)
            ct0 = [NTT_inv(cti) for cti in ct0]
            zero_array = [[0]*256] * ML_DSA["k"]
            w_minus_cs2 = array_minus_k(w,cs2)
            w_minus_cs2_pluse_ct0 = array_plus_k(w_minus_cs2,ct0)
            minus_ct0 = array_minus_k(zero_array,ct0)
            h,true_num = MakeHint(minus_ct0, w_minus_cs2_pluse_ct0)
            if infinity_norm(c_tilde) >= ML_DSA["gamma_2"] or true_num > ML_DSA["omega"]:
                z = None
                h = None    
        ka = ka + ML_DSA["l"]
    z_mod = []
    for i in range(ML_DSA["l"]):
        z_temp = []
        for j in range(256):
           z_temp.append(mod_pm(z[i][j]))
        z_mod.append(z_temp)
    Sigma = sigEncode(c_tilde,z_mod,h)
    # print("p_prime = ",p_prime)
    # print("y = ",y)
    # print("ka = ",ka - ML_DSA["l"])
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

    tr = SHAKE_256(pk,512)

    # test = "D26AF4F24DE50EBEDA020DFC6F841B0A2D83D2781C06D8B3DF8EDA97A7EA4F9913ABEE9858F88F8A2F52C13DF2DE4BA023BAA5B3CB0ED941E077A08AE3F14035DB8494BA19C4118FB15D0ACF4254FD37483FCF4748FD1844F717CE6F69589E61772CFEFA7F9758653409D4EE5A264B834E60D6BB96499EBEB2B06B0BA874BF31E641394CFAA6A2D30DDB8F045876208D2F51DE15E205E8C91B87ECEB05FF3183271B2649665DD3CC49BFDB998D539DA809305516BBBE9C906021191C5223E525A8FC3616A1765EC3F9C5DB53CC337E039F186ACFEA91148EE2A79CCA3689EDB62AAF28B5D752FDE265EE5280B519726C1CA9803295C674B7EFAFA4D61B306A79E3F6E7A887C2FB535B3B0FB3D9EBC87603EAFEF170C1F1D28E99BB"
    # test = hex_to_bytes(test)
    mu = SHAKE_256(tr + M,512)
    # print(tr)
    # print(mu)
    # print(len(mu))
    # c_tilde = "0000000000000000000000000000000000000000000000000000000000000000"
    # c_tilde = hex_to_bytes(c_tilde)
    # print(len(c_tilde))
    c = SampleInBall(c_tilde)
    # c = [0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 1, 1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, -1, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, -1, 0, 0, 1, 0, 0, -1, -1, 1, -1, -1, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, -1, 0, 0, -1, 0, 0]
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
    c_prime_tilde = SHAKE_256(mu + w1En,2 * ML_DSA["lamda"])
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
        # if(i==0):
            # print(t1_coff_max)
            # print(t1_i)
            # print(pk[(i * 320 + 32):(i * 320 + 32 + 320)])
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
    print(p)
    c = [0] * 256
    s = SHAKE_256(p,1768)
    cnt = 8
    h = BytesToBits(s[:8]) 
    # print(test.hex())
    for i in range(256 - ML_DSA["tau"],256):
        # print("i = ",i)
        j = s[cnt]
        cnt = cnt + 1
        # print(j)
        # print("j = ",j)
        # print("cnt",cnt)
        while j > i:
            j = s[cnt]
            # print("j = ",j)
            cnt = cnt + 1
        # print("------------------------------------------")
        c[i] = c[j]
        c[j] = (-1)**(h[(i + ML_DSA["tau"] - 256)])
    # print(c)
    # print("cnt",cnt)
    print(c)
    return c 

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
    
# 算法 25 RejBoundedPoly(ρ)
def RejBoundedPoly(p):
    a = [None] * 256  # Polynomial coefficients initialization
    hash_output = SHAKE_256(p, 3848)  # Get more bytes than needed
    j = 0  # Coefficient index
    c = 0  # Hash byte index
    while j < 256:
        # print("c = ",c)
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
    # print(p)
    A = np.zeros((ML_DSA["k"], ML_DSA["l"]), dtype=object)
    for r in range(ML_DSA["k"]):
        for s in range(ML_DSA["l"]):
            r_prime = IntegerToBits(r, 8)
            r_prime = BitsToBytes(r_prime)
            s_prime = IntegerToBits(s, 8)
            s_prime = BitsToBytes(s_prime)
            seed = p + s_prime + r_prime
            A[r, s] = RejNTTPoly(seed)
    # print(A)
    return A

# 算法 27 ExpandS(ρ) 
def ExpandS(p):
    # print(p)
    s1 = [None] * ML_DSA["l"]
    s2 = [None] * ML_DSA["k"]
    for r in range(ML_DSA["l"]):
        r_prime = IntegerToBits(r,16)
        r_prime = BitsToBytes(r_prime)
        # print(r_prime)
        seed = p + r_prime
        # print(f"seed_{r} = {seed}")
        s1[r] = RejBoundedPoly(seed)
    for r in range(ML_DSA["k"]):
        r_prime = IntegerToBits(r + ML_DSA["l"], 16)
        r_prime = BitsToBytes(r_prime)
        seed = p + r_prime
        # print(f"seed_{r} = {seed}")
        s2[r] = RejBoundedPoly(seed)
    # print(f"s1 = {s1}")
    # print(f"s2 = {s2}")
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
        v = SHAKE_256(H, 32*c*8)
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
            zeta = zeta_list[k]
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
            zeta = - zeta_list[k]  # 使用 brv(k) 反轉位
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

# print(BytesToBits(IntegerToByte(2,2)))
pk,sk = ML_DSA_KeyGen()
# print(pk)
# print(sk)
M = "430B1F46E87DDE9A3D055A7D4D6AB1277B2DA6EDA642896412126391AA2B29AFD81C246EC839929F5C06749491DC4D81D58CC989D8500B6879E8807B1C3AA0B199EB599AEB86B344B77E3DB1AA034C938D80CB4BDCC29B31B710F57C7E491D99B71E97DD6FDA01A0D8A54C7481C2786F64FFC53AD358CF31C9C875ED278CEA03F2BF732372B19252BB9FA4ABF465FA2CFD1C08684D10582B410A8E012DBD407C5140D97CEE768C6D68124B2C84113B58C9A2AA67093B44CC3B6199FF1EFA6506CC28BD30BEC4CEA88411A491DD948DDB09ADFB92C40CA50E709840BC1F107E0CA428C111EC4505C5346E74AE4AB5647C1EB80F9C07092F8D39A975C4890317F9C0EF474110AB941949029BF39ADFB8E65CCAC0360A3EFCEB69D2BD805E4FC8D0620F8E039BC046DFEF1ADB03F5995FF62AD41352D479084EF3E302578B83332506918CFAD6E3BA701C94B0138DF0CF6C2948049274CE61EE0A64E756306273A02D68F3C405883F2F668820356812B2DA3A32B9FF23608DFA559183151221F83DCA18253FCA099FE24728F302C8B7808D7AF978299F3EB853A8BECDA46B8657598BE9ECE8A02DD4B25C593DDCB436B82335EF9C6A7B8426B701C66C9EBBFB3C8405A73881DAB57D1664F3AEC6F5BA19155D89A0A80B5D01C46BC79E1D4338A50B203397CD4B16ACD597A7C77C49917E9FE4B0D761065CB89C758498868B14BE2B6FF758745AFDC535EAA605C3F97648034D2A320264150278A7F1CB114B977C9D6BC1F29295CCCA16B23B7709D5608E4095E41D08B22AEC6289ED402414787062B0DA2387B6DEE76B32E42C51788B65E815E089BCF92D778F49A9707D37FCFBDF8CEF953A48A4201FA0173529BA360BFA6A77200F57FD5245146C2CD7FE8882670EE6878386D06036F0E1BA4B728CFB75806F05BA6409C514731B0BA8DA11015A63A8B5B5AB8C69703185191D12C5611F1407E8FFE3E50FC39C3310EF4091BC09FECC11D3AC107C696EE89F74CD6147830B4B3A971A0027747B62C528F6D858D1F9E67F59496C6B4E9E03FF0A598B26625B06C79863B5F07E265A40175E1A6D6EF3F900F3C4A28AD3E49D4D0B7E4ECEBB79244264474CCBFADA43FCD33F4FEBEB0F7E5928479F869D6A0FE52EB0CAC1232D7F674A057DEC4C2248934A40F5E2C9CBFDD53F71FC3BE06E48E13398ED426D8D3CC82118B7E8E5BDCA248380F4E64C427D1BF2384F60F6A07F01EE62AA1746CB143F26412547E7EF0E8FD1F2DC606F3643DEAF330D81CD6309465F9ED7F34D9B175FE1641D90212D4FFFB91CC300E7DFA0C555F7B35D2AF6A343D1467436EEC7AB95F2C34010FC99D66391377770A7DB8CD4D5C6BBF931092322741929F790E037318D6ADB74B4768C11F0E4674D18185DFB3D051725F93800CD38F58688AAC747F885908804D6CADAEDECB43131D75B18FBA2D4BED8D9BCC2156FB23F8F6378C622153EA8301300D0FCDEF1E2BB4E6F807784EA0171E95C372EC19B05A6C7B8DECE7080A057D29CE5A445A83410EB83B174590647424736A3B6967BCDF8A416A51202CE3F00E4D97DCC2C48A78D12CDA98E94A9BD6CCBE09DAF8085304F6911ECED3547DE9512461E16721322E4E6233BC7CA360A9004DA5AE064514603EFF0DF4E2D8EB04E9574C59F3AC14726C10100C688203F4960197CE696730AD7E558D7B939E3E6E7EAC4E70A7F6AAA80C1F1546E282B5CC7AA193213769B137C7F450AE5410817166F29F2E4E7E962932DF282A9F08A1DEF3E19C251F95611DDA9CFF4E2FED873439B45F8451B9AE06C6B2C698778BC4C742708BDB54CB35B686F0E7FC856CDBF977AFB663DFE44F7FCCE0E0555BE81EB28984BAFBD6FED3F0182F78A1396AF7B7081280864E5E4BFD7C52DA28BB5DE5FFA211678D13D41BF825F4B21BE1CBD29719ABA341E7B0C3F101CEDFE2F709E4DA4B5A6D0C021152AB546837024F4DCC4C45C132A038315A0F1D69AE768F70606D070169AE0818685C4BDB7341BFE15AA0455F535766FBEBB50875246A6DAE86C7B9F6F3A9FE01AB9928A99C13E6628431D41C1506381A63FAAB57BFB3B180F5D7FF59A434233EBC5A659B71CAE6970CC838D5FB638676216E3B16E8BA6C01349A7482AAF32ABD17DF7FAB8C69789F0194022BC4E62B6A6AAA4CDEF13B1E3BF5E1F4FA69F82B1EE3FDCC16DDE1106E3D2C41F6E661E33984DE7AD6021EAAD3E64D8C9CD7B5CB538AF88DB82FA048E5705EFDAC0EF479827EDCA0255BA60771A5EBC716C690CD3AC840FB6FF462063503D68C199050BFBD64533D94E093A47658822A25D54CBBFC689DFCBEB1DDD5BC6190B8F02C6FF3D001AC63729D35C8C50FAD3DCA2E67C5CCC6A8799420B159C7C5CACAB958B423964C489DAB1982A4E2222D700BA5AB772C4A11A44FF64018AF477D054217EAE28FB8E37595941FEE7AF87FD44960A144DB0CE2A44B33DC79B1EE31CAF80DAD620666D0ACEA76841EEE6CE81C6FF1F6D1027502EF89F1595065CDEC19B30E4B5314EFD64031B3B9DDFC6C95A4943247ADF7E4C93350C241ECA71260A454707B84017C5EB7AFFEB5DBB863A1CBDE0062C662308A2E824CDF6397863EF78F62319E2873B506F8A9EE82135B803025D962E609E006961EA3F7B67347518E70D9273893D79530F67CB678D6A8D28A0342BAF904BFC0A69AD575CDA4AB73AF22B52AE5D58372E0C26795CA96A16B8461AC61E6F68433ABCEFCBC16B857A89C475D1A322D34266539A17D485B8FA356EC3E154D37BAFC4CE75829FBE8BC823FAFF15A49F847C286F999A1F2C12B03E8F8A4C34A97588D91971279FFCB100EDB943E636F78ABFBAF88BCA5C55C935F6147E51BF798267E1350D2F5E3F74B339F6EFE86208C5BDE149C5B71056BEE748D06614AFEAF6DDA2A6EFFBB56B0880AF9B201B3C12055D292E3BB556240DD031C29A67BF244F59112BFB6865EEEC1DFE1CDB1E27F0A9E3372638FE4407099D0E54E9A188079C8BB9470BE6F63C83612D80BD60C21B251B64236E5CAF09A11C12F1A5E94F199DBC7C9E394C0B0E07A583E707E5241B8FB33E39BB26C31929F39316F4FDE206493566E17B51CE635420493176D8FD353206EF87F0994F039DF8F008AF602F50D7F9C0051B56227F3A2ED20B29611219FC4376234EB900093A81389ED00991272B739389F1F978A92A3E41F0A28985D697C01240875AC46A82B2FE94004CBD7B1E7594AE38A9DA0E84FE7E122482BB391538EB8E85AF9DC022CB32CC08FDA7A95165725EC29A0F824F97F0251BE636B57E0791A7F50EE190D45749472B29A674239AF95B373A40A6E0E09C674071186B125EF5AF72CB434AC0AA990341F063EBFE30963451491474B603733959A23A6D5B8A378F15A5A5B9CE4BA44BAEF6AA531AF5097ADE73F64AED0A541784119665F548FAEB447DE108AB74A74893017F0A1AF84AEF0730B555767B0CF6AE502E7693374D2E01C54C64E411AA93C96DC5FA010267B387299D4376FBB190E1C51A560871B559FC800D82ABD119A5732B50270BEDBCC8A636E7499149AE0E47F736FDB71EBF1995D1E8BDCB0EE96E732E8C2509F98717C3D174C78A4A2BE43DD89195408CD300505A219305809A1BFE7294BC2EECE6D98C768A8A1E0F74B665EE3D652AE8E008EBBB11F0D2148E4E5C93D7FE0190D27B3EBB7D2194BFBB624AF3A894CEF7AED571954D006824950A981F4ADA72BEAA0D820C5DD9BD519D39BB7915681F266DA66D49BDAB9E55879B953A7332F877DC5F5CC7BB3C9E1C1F2E41EB55EFC02A450B5142514F1E06D43E48FBF5DC80DF241169D5936432BFE9BE99DCB17293CF968A17F3111C884635EF2BEDFC87DBB80BF25EE9BF57B55CFE635FD99554F5FF2B4482D1948BD282FA282C48C0302348982E30A772BF14195CAC7FE39F836E6238EB1E1FD074E63B9AD0A8D37111087E47FE5D04B62DEB496353457BC76C53A2FC9D5AC9AE6A47F632E6D45E08786DA128464FF2266BFF92B5CD89176A19226F2EB14CDEB331C497F1836FB6C0A117ED6BAF95E9DB8254487B0DFA7301397AA29D95FF2065D851BD302B747AB47BA0AF408B51E4BBBF042ED1B2B604EEF4C266FE243261515778BC9451A8DFB025FA3212E868C3A078C7CFF65077DE94E50ED90A259FAFAEB398A94FF15C838EFA7F49904BEAFCCECD8C9ED4E014EA00C7AEF1D437DA306E8B7DFCE536912C169BAF0A3B78A643D6E210E5550E3B2BAF7EDFE01E721E3D05BAC1378EC1DFDEB2E2AC0F0BC368E0A8CC64F375DFEA2FC20CBDC515440FC2ABBBCEA3584E103BD686C5403EFE376D44F5242D35C9F9D35E1A869FFCB6657823EA0D4331ADD5CCFA99BD6EB3494A48ABBA7B7ABC32ACB8FF00512E1B0AD493F579898847E328C06FE05FE282F8D4AF48A1AAD0495AF1AC7354275A6D45AD5A7B3F6787F893EA558BC5D4ADDE1F0D265ABF73C86550D25C00821C3138B385448E3E02901E2E6EBC6A0F211CB6F22F8F865F0DF3893B987DD086B6674F5464ACE18B9F0EAE948667B2FC04FECEA3E2B7EA6B869D5F66D02D4DB124A59621B96E0DEFBF99A91AFA0CFD6D5A5968E62EF42B4C8908C3719BA0254929A9A183D50C566CE4FC970E047474490FFB07F576765AC5286B2E0FDBF1EC56A8AE8E6F560C69614FDF5C89BA53B8B7189E6388F7CDF7B819F78F3E6EA54C40865262BD2C8CE87284FEC36E2E73BDB8AA9CB5283272A90A6BBBFC3F7FED5F124E8BFD770B6254CDC695FBA0D8627315370E2CCDB89BCC84C96E20805AAF087F9E9BD1A189F4C6D66A6DC3FEF773788B3B57EF876CFEAE1F2C876CD239BE3B8A94F21350EDAE6C269698CC66BAF90B3641593F96399C71B2ECBE50F61B5D6F37D47DF702A9B9E47BED2824DEB19ADE7D7D8830A8F610088CF4BD0AD22A5A4FBA767D01987688BE710235A74129666FF7917B506A18E6B5D6166E8B682BE6B1946A4D4420926FF8CDF2488EABE71EFA7F2536B9DBEFBA08BB9E94086F55B1B991E18E6023E6952D4A563F2420A1536A1EDDE119E5779223CB712AB5C0BA4F0C176830FE523DD8603F1B316E128579E65454C2BE62C922C1DFE09DFB47D4497CC552AA9987A8BFE19C44E207397204686C718A0936145FC102B8A7111F74A421226AE016EDE658DE5DF9D3C28A247A87F2BC6FECF66CE7A6699880E0871CDB6F066D2CB3F9F625DC5E80751DBBC85982982E2EFAE3AB8F4F1EDA0D13C3B65FD2178E8AE4A712B521B7539785BB058176AB4396E6EFF2FD9052D4C6AF17DC30F50630233C3F05C62E151EECE13CE124E58A25F0F3AB65033ACAC9EA6E41CB3FA435D367DFEB0B9C9B37414CF32DC85A3C43087A578165C86D100E47DBA1FE7061111AAA961E67ED057C715974D3144912A58B6DB22D51BEDF6A8646D810190D91B61F0776DA00C8B0BAA7A83F4433F357E758F5AE8F278119908497E717A7AD25B09EA7C76B306A9A3AFCD9AE6B4F64016D5E80BD3FBE2F5EE673A7459B03AD9356148EA83461B66716346DBE85678C37C932EBC53B033A3F46DC28219880CFA8BB5E15F8862D345923BBC179FD763A0F943FC56BAB69F26C0C15D668BAD923D7AE6B35C07621768F9D972E2D6F46551D45E3FBBB577D13F01E8C1AFDBDD2F052E931C0529380F290FA1DE8BF5A11F82612943BAA2C0D086EBEC84069B271AC8656883F686C67B1808E27C860ECD1B95FF6CC6E6A5846DA29992CBA450081B8C37DD4911470EFF281FE94F10636A29B790E41EA6A342A5BE79CAF575FE9B0147F2EFE02874BC8A0E136A395B42E77D9F18CA4F61501E6C1805CDCDC10D0292593481F7E0F93281D0456EB51F6ABB7C379C028890F445D9FAC0D96AF68CDF6CC879A406CF2F0991916B33A72A193CF170B45AA079DB1BFD4B4126FA9AD3ED13FC98CE4C6C3C30923C8C53BCE1812B21BB644ED3A0CC0596C60032FFB1462DF5182528553AE865BF87FB7C7F61D1FD8E40D830B8D8F54924EDF934D1EBB88DA90BC59EEF1F6BF9FC2D17D8E9E0E39FFAD22EB84EFF39BAA70447B124E492D760E55D6301DCDFBCF9173FE293AC4D6CAF2E1964B32973067EC76BBECC65113C1FAB85375D92CE1436E1D1B205A88202B304264620B282E62CAAF5CFE1169EDAD9459B15BF0060C5744A17460F9FB164974CC55B3FFA71AAC13437BE58325E5E27E151C71D195F886F5630925D441A54695DF23F64C6BC3B0CA83F0E88D01BA4DC748A29F42AC2997C2A21EC258E430032C09E73E73AC2B21B55E1DFB2DBA281426620A0545D2507D1E96A3778C780FE77F1DA3B615E1B0D14DE8729229472E6619AB3B67CCAF21CFBFFD1F237E780927F147425B2142BF62CAD6B467A10F7B3DB922F095A0012EC179C4F8D5437AA8024F13A2A485E8890940DB69FB719B94B7D2629D277B593B94ECC744AA4CFF3D33D2250236C74DA057496BEFDB961B89BD6F44D581AD7A28524A6AF2253FD27530B7FF16FB5804FCA7E44BA2A3AB85FEDEED837DC130F533E8215B3AC3F584A2EC0E9B6194F97741EC050576E16349AD852DE8AAE2BF83CB1894107299F101AD5A2C05EC590B2CC698663C44FC0DC7F893F42BC5A2DECFF2FAF46CC1C00FA7294A0184A85CDDA2B1F38A89B1B17EC08555D082411A4CAEDED562C9FBBC1F512118EEC3BC931CC91636461151BDA454C4F029E01231BF170EBE17C526F3D8F705DC46560642B1AF36E3B401325A6CF59B88BCD4B3242D676FF4066E4252ADCA37786CBDB340DD81C5DD0540992F0B142C5A18D3BD1070719AF996E3C3768C3B234D303E6E9850B35C7AE52496C76106D7CAE4CF8ED01767B6DB5603F339FBAA019B08FA35E3DE1129A6A4D578264CF1FC8A1DBF218DD72B4865214DAA795A00505D4AE2B85E90F589065D65FC60CDD828007D4D3A4C084C7EC159C5D86817860CA03545FF74F17AD8570B2ADA55ECA12BFAB5C10067A086A34A57AAD8694C953137BBE901F8D3DEC27DB5DAD2AC96D56C312E25FE48BDC889373ED252B4F88D32DED6702B58D35A1FB40ABE2F2ABDE21CAA5FD0F67E7407A8"
M = hex_to_bytes(M)

# sk = "5AE5192442A0894AC775D84419BB7EDE9E8143A6E21CD709A47B58545EAEC7F59EAD08050900CBCF4093F9327CAD67B7600D9F8425084B6905BB6550F426F58B27B47C434BC194D466D83C14BF5ABEA249E05287EC80D1B56BD0824E4EB84CE1CD4CCD0DBD1BDE59106AE10516E1150E841B03E759DFDD930F6C7BAC857530451C438E128029E436491980441BA56913074A8A8831E084641A152C40B865C9A22100800C13828C1C080A84C850221688241100D220085302695B1881524812C832881CA970D91445A122221226449106800413504BA86DC126321C312288486280A64463C261C220220A210653C8910919925308200988640A3100CB9868434050C2A06C1830482138640CA80D03339254C44D42B29014B9500400220BB38D8C269010B62DCC481261980522A03050A489DA2225A120859BC80480129252906193985182B470584481D2806448C669C8B65164B6219C964143262D1294641887111414500A166D64364EC282095C980502202683C48113A20559B02D10090DC084519CA6215C8885E1088990200E11126D182129D422421C2811214611582829482830A1400EA4400A428040D0882504C72111B20C8A148123002C53B688943411E0448140044A03A4111B042C6330715204285114864B8004E3B649E4B831D13264D814094B468881424A01430C41388008478A20378A01A8080831228CB285CB880D0A13499C860191848D04A72192A80181248959964D0805202341511A36081012842407300A1820D39881E0164A0AA669A2462044240C54084D1B208C923869588428D1144E63920022C94DC9320800497111A28909B384234591C22452D8C220C810610106669B062959B24C11B38941149083886108C488D1462682B00D14B8685AB65080409119B38DE2A44D1A0161981489A196610181514106019B0804C3C461A1823010A32D21876098103190425252145293A241534692212332A1828D40286ED3288AA38689D1048E1C936910970DD4125184C891D4246A194609E33426D0A485481605618489124126C9B6281C2111A3860543C05158386121828C1835645AB68C04892C03422EA148065280910146852219205B3292E1440404A908C9C884E4928C5342400C181010064A1BC07142887010284D2241602393905A88455A186E618445400884139084D4406964140288006A63380E18362E98160C04A7894B964D04844051B08419450612912411B410E186895A00318C129097956ABE59E75ECDE4E7482F0BB70D6502309163C9467EA51E7B467C114BA884CBDF37291400166F7E2450D27C5A20FC1130192F1B482740712446605F49EA14E3C35515D05EFB062339E69349C7D416830F426282A4C0C0BF875B0F8D98BCA9B55BC1E199C9482A8D5CFEC68166F9545F54F3B0BF14B2117DDC6356966BE0DD3CD42FA47EEC9FE4058A0679F3EF50F7306EDF0DBC58D2020702F3C1F0B23A70C4B9023B43E7EC670EABB06869A3AA3D315E9606F0216BAFE585E0006BB6656E1C146E2396A44D3B545A1D722B6BEDD33B40433B7A9A0B91DB43A0AE280F57DAFF4EC8E534885C436A6745FDF857A093F9067BA95229CF52D0C8DF29C52736EFD4FA98FC4C71F6A94983F8F008F29178BB53CBDD56A045408151FBFDE28941F7D7446D5C2B2CAB3C418E04C851D230A49F288713F3E7221CEE86FEB67B469B076871A7CB576D423B5CE20FDDCDBC6F3BFE841C494E6D6050BE92AED653F7B387CBD662AFB7B01401609D66EE5739BC0E9188EF3F61B23F6402A8C60D6C272EB27E3C36ED15A7D95E1BB15C8DF6774170CCBF50A2628F1E80F3007BE33D0C5D86C61BD927BA3EADCF000C5B4A1BBC0889C42183A1FDFFDA0FDEC7A2CB5148953B3C428F1153E802B0E60F39EC4CF4108DE315B8870E80790E6B67799499A768A60F0E70EE861369F0B0110498B206B01AEC9C56CC335221E675F0DB77B6A2F9BE317407442F152D32E2FA57054C2F05757079D29BF85077E571973C5410743C679AEC39B51163A9B3AF4049647FA008AC5E304F82AF0A0F28E5CE3040C8D9AD6799BD4E70B7CA23F965FE96539EBE04ABAD5DF057FE26437FE44289ECF68807FD2C8900A0D3C5B3910BAAD7AF92BE09B83D0E16CC617607623DD8A2A8ABAE82C48C1B383C13DFFBC62CFC3F45B7A0150E799868D55AB5A9F67EA0D4D35D9D2EB0317768E1F67FFB8DCDC9A6FF9FAF58BC260DE56A0165900F4C54DF209CC148CB93469C59CE5D0576BD2CD40BB0D0A9EB21A41EADEE0039D603FC2917366B7F238E75E431ED7DE076E9E72701DB873D86F73A4A99A82538FDF5611FC42BA4D899BBEE81EC55E997A697A9591AFCC2425A570BD026CF0F3DA4999D0CE7C2238037D8077B3E13290DF420A41771548FF2C2D89416FE776481236B3AE22DD2A21EF8EDFD5E2CA526A796B568AC47B3CD4FFB0743771E647138AFD6ED35AB242B0252DD19862AC4DC3310D905FF68DB2F53038D176D22D350401857794DC2E2C1443696E65D7886759A5ED653F14D9F804FE55E45DB4090C0E166C01F1FA8AA939B8D83CB3B1B65ADF4B31656CB8D04F21452BF2B6B36BC18A8EFA7A0E4AB67479844DE5EF231C8E8168BCC252411E67EB3F6598176F4D6739DA69AB952CA12B7A951B2333A991477CA51E1183D2769CCF90FA87EA2C62DF0145990C787AE739D5802E9362E5EDF969DC71FE7D2542A4DD1EBF12A08240BAB3FB4EC2126DD0C0AC740EBA06CCA2AC6ECA57E4094ED4C818965105037D1EF2E739DC2D58F2554C40AF69ABBD483A896654C5A26668691A6A8C005ADCA4EE51BAA82DB5D7495E29FBDE6DADC67929A60FA95267A1AB764A1A41B3CA0C3FE03FB5A8400130E6ACE93197D3DF50FA789F16BFBE6B292FCC2E9C03C792473A70AFE13935DF76C2E5A2FAB154B5CC5723E5611BB363B621EEF74343CE19AEED62BF771DCAAE501977CD573A412F15FC8D294A512B7B412F462298713889F6F9E7DC35A0541A2A306CFB9AECFB74C0F94817AB81C804A0508718269E5691A24A2CFAEE8D0BAA69BB30FE04C45881485B2D67AD09D5EBB43A3508AA45BA2D54CCE4E7FD7B679E735A4D78E8DB1BB1583F1C91B0330D2AD7A80C7D2BC60DB220287413E9B4DF7F68E8A8541C1F1F85D15BDD51C6902DBA86A67B2E4CD86B92E7BF58724AC5A53219216B78BD1B50CFBE9B468A667FC6C4F35A610E7AECDA8A12DAB0C5A658005879E2608EA6549999DE0C396E2E0E19895E77A68356EA29BD2A1F24BE4552E679DFF66EFF39235183E26DF4D23CDD284BE2D9D706A301CCF33D0C85DAE62ECCBACC1503246B853603F68DB14C2E0B972BE2AAE6856BEEEF83DE2227AA876E5DC62636E2E95BCE79597E01A5A3FEAAFACC205AB09FFF7641BCE3ACEBDC6E6AC2C95276148543F2AA1A4E949DE5F35F4DC1048824389CB90910D47C7ECEF591BAF68D6A456B79278F356A6C34AEBC370EAFB722F0791033708C24A3CCFAEDCA515C6DC1B83B85251A2F665B3777E1805FC8F98F9789944139C60BB8AB0BFA34D3783599707BD44CC99D2E4ED71F31EF7AE6B8FBAAA4A5377DF40F8D6A4C1F720159E57718C78FE40"
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

# p = "3202542EF1E239D32BE1BCE5AE4AC8052D578899D653E368E11BC11C5480BA06"
# p = hex_to_bytes(p)
# op = SampleInBall(p)

# print(op)


# test1 = IntegerToBits(50,6)
# print(test1)

# test2 = BitsToInteger(test1)
# print(test2)

# test3 = IntegerToByte(50,2)
# print(test3)

# test4 = BitsToBytes([0,0,1,1,1,1,1,0,0,1])
# print(test4)

# test5 = BytesToBits(b'2\x00')
# print(test5)

# b0 = 2
# b1 = 2
# b2 = 2

# test6 = CoeffFromThreeBytes(b0,b1,b2)
# print(test6)

# test7 = 14
# test7 = CoeffFromHalfByte(test7)
# print(test7)

# test8 = [636, 887, 785, 837, 203, 998, 891, 229, 404, 93, 647, 284, 987, 799, 478, 938, 849, 395, 982, 780, 979, 608, 323, 629, 1020, 291, 907, 50, 913, 845, 670, 638, 252, 923, 359, 587, 749, 971, 991, 774, 288, 63, 222, 127, 363, 657, 604, 314, 616, 113, 445, 530, 490, 372, 111, 319, 811, 933, 101, 45, 873, 255, 624, 271, 853, 444, 664, 950, 884, 328, 779, 786, 357, 38, 565, 970, 169, 75, 208, 78, 142, 448, 547, 133, 133, 834, 250, 422, 664, 94, 656, 954, 332, 669, 184, 136, 554, 722, 428, 301, 927, 354, 161, 916, 426, 479, 456, 892, 108, 262, 823, 608, 902, 872, 335, 860, 670, 52, 545, 192, 53, 299, 677, 77, 771, 97, 61, 149, 395, 67, 900, 327, 95, 646, 12, 676, 460, 34, 145, 644, 13, 339, 566, 500, 661, 746, 938, 717, 329, 240, 252, 345, 84, 784, 610, 184, 792, 868, 687, 117, 3, 167, 190, 972, 904, 624, 735, 164, 593, 736, 803, 27, 245, 14, 599, 528, 625, 1010, 565, 325, 592, 488, 931, 856, 725, 668, 897, 135, 168, 239, 905, 1008, 926, 70, 862, 139, 24, 774, 552, 29, 766, 765, 398, 619, 403, 264, 290, 978, 572, 844, 11, 692, 627, 860, 559, 517, 153, 63, 114, 536, 919, 110, 26, 594, 43, 579, 289, 158, 411, 854, 361, 390, 842, 501, 813, 261, 538, 344, 355, 876, 112, 1011, 358, 982, 534, 122, 416, 387, 526, 627, 283, 162, 437, 54, 534, 608]
# test8 = SimpleBitPack(test8,1023)
# print(test8)

# test9 = test8
# test9 = SimpleBitUnpack(test9,1023)
# print(test9)

# test10 = [-2, 2, -1, -1, 0, -2, -1, -1, 1, 2, -1, 0, 0, -1, -1, 2, 1, 1, 0, 1, -2, 0, 2, -2, 1, 0, 0, 1, 2, 2, 0, -1, 0, 2, 1, 2, 0, -2, 0, 2, 2, -1, -2, -1, -2, 2, 2, 2, 0, 2, 0, -2, -2, 0, -1, 0, 1, 0, 1, -2, 0, -2, 2, 2, 0, 0, 1, 2, -1, -2, -2, -2, -2, -2, 1, 2, 0, 1, -1, 0, -1, 1, -2, 2, -1, 2, -1, 0, 1, -2, -1, -1, 0, 0, 0, 0, -2, -1, 1, 0, 2, 1, -2, 2, 1, 0, 0, -1, 0, -1, 2, 2, 0, 0, 2, -2, 1, -1, 2, 0, -1, 2, -1, 1, -2, 1, 0, -1, 1, -2, 0, 2, 0, 1, -2, 1, 0, 0, 1, -1, 1, 2, 1, -1, -1, -2, -2, -2, -2, 2, 2, 2, 2, 1, -2, -2, 0, -2, 2, 0, -2, 0, -2, 0, 2, 1, -1, 2, 1, 1, 2, 1, 0, 0, -2, 1, -1, -1, -2, 1, 2, 1, -2, 2, -1, 1, -2, 0, 0, -2, 0, -2, -2, 0, 0, 0, 1, -2, 2, -1, -1, -2, -1, 2, 2, 2, 0, 0, 0, 1, 1, 2, 2, -2, 1, 2, 0, -1, 2, 2, 2, -2, -1, -2, 2, 1, -1, 1, -2, -2, -2, 2, -2, -2, -1, 1, 1, 0, -2, -2, 1, -1, -2, 2, -2, -2, 0, 2, -2, 0, 0, -1, 1, -1, 2, -1]
# test10 = BitPack(test10,2,2)
# print(test10)

# test11 = test10
# test11 = BitUnpack(test11,2,2)
# print(test11)


# B = bytearray(b'2\x00')
# in_KECCAK = ''
# for i in B:
#     sb = bin(i)
#     sb = sb[2:]
#     while len(sb) < 8:
#         sb = '0' + sb
#     S_rev = ''
#     for j in range(8):
#         S_rev += sb[7-j]
#     # in_KECCAK += 
#     in_KECCAK += S_rev
# print(in_KECCAK)

# p = ctx
# H_p = SHAKE_128(p, 7152)  # Get more bytes than needed
# print(H_p)
# print(H_p[0])
# print(BytesToBits(H_p))
# print(H_p[1])
# print(H_p[2])
# a = CoeffFromThreeBytes(H_p[0], H_p[1], H_p[2])
# print(a)

# def nb(r):
#     r0 = r % (2**13)
#     if(r0//(2**12) == 1 and r0%(2**12) != 0):
#         r1 = r//(2**13) + 1
#     else:
#         r1 = r//(2**13)

#     if r0 > (2 ** (ML_DSA["d"] - 1)):  # 確保 r0 在 -2^(d-1) 到 2^(d-1) 之間
#         r0 -= 2 ** ML_DSA["d"]
#     return r1,r0

# for i in range(8380417):
#     a = Power2Round(i)
#     b = nb(i)
#     if a != b:
#         print("error")
#         print(i,a,b)
#         break
#     # else:
#     #     print("correct")

# 8380415
# 011111111101111111111111

# 8376321

# 4182017

# 4186112

# 4194303

# test = '6CAE2E9C2CF64D2686C31C2118E0F24A47DD46DB85590910AAC9DF4C1B854E44'
# print(test)
# test = bytes.fromhex(test)
# print(test)
# test = test.hex()
# print(test)
