from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87

ML_DSA = ML_DSA_44

q = 8380417
n = 256
root_of_unity = 1753
ntt_zetas = [pow(root_of_unity, br(i, 8), 8380417) for i in range(256)]
ntt_f = pow(256, -1, 8380417)

def br(i, k):
        """
        bit reversal of an unsigned k-bit integer
        """
        bin_i = bin(i & (2**k - 1))[2:].zfill(k)
        return int(bin_i[::-1], 2)

# 算法 29: Power2Round(r)
def Power2Round(r):
    r_plus = r % q
    r0 = r_plus % (2**d)
    r1 = (r_plus - r0) // (2**d)
    return r1, r0

# 算法 30: Decompose(r)
def Decompose(r):
    alpha = 2 * gamma
    r_plus = r % q
    r0 = r_plus % alpha
    if r_plus - r0 == q - 1:
        r1 = 0
        r0 = r0 - 1
    else:
        r1 = (r_plus - r0) // alpha
    return r1, r0

# 算法 31: HighBits(r)
def HighBits(r):
    r1, r0 = Decompose(r)
    return r1

# 算法 32: LowBits(r)
def LowBits(r):
    r1, r0 = Decompose(r)
    return r0

# 算法 33: MakeHint(z, r)
def MakeHint(z, r):
    r1 = HighBits(r)
    v1 = HighBits(r + z)
    return r1 != v1

# 算法 34: UseHint(h, r)
def UseHint(h, r):
    m = (q - 1) // (2 * gamma)
    r1, r0 = Decompose(r)
    if h == 1 and r0 > 0:
        r1 = (r1 + 1) % m
    elif h == 1 and r0 <= 0:
        r1 = (r1 - 1) % m
    return r1
