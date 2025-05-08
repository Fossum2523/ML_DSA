from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87

ML_DSA = ML_DSA_44

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

# use with Decompose_r0/Decompose_r1
def mod_plus_minus(x, alpha):
    result = x % alpha
    if result > alpha // 2:
        result -= alpha
    return result

a,b = Decompose(95232)
a,b = Decompose(95233)
a,b = Decompose(190464)
a,b = Decompose(500000)
a,b = Decompose(750000)
a,b = Decompose(8380416)
# a,b = Decompose(8380415)
print(a,b)