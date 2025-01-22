from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
from SHA_3 import SHAKE_128,SHAKE_256,sponge
import numpy as np

ML_DSA = ML_DSA_44

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

def Verilog_trans(a):
    # a = list(a)
    a = BytesToBits(a)
    a.reverse()
    a = ''.join(map(str, a))
    a = ''.join(hex(int(a[i:i+4], 2))[2:].upper() for i in range(0, len(a), 4))
    return a 

# 算法 25 RejBoundedPoly(ρ)
def RejBoundedPoly(p, r):
    a = [None] * 256  # Polynomial coefficients initialization
    hash_output = SHAKE_256(p, 4352)  # Get more bytes than needed
    Verilog_hash = Verilog_trans(hash_output)
    squeeze_cnt = 0
    j = 0  # Coefficient index
    c = 0  # Hash byte index
    with open("ExpandS_testbench_golden.txt", "a") as file:
        file.write(f"/***s_{r}***/\n")

    with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"#170; //padder\n#240; //f_p\n")
        file.write(f"#10 send_input(1344'h{'0' * 64}{Verilog_hash[1088 - (squeeze_cnt + 1) * 272: 1088 - squeeze_cnt * 272]});\n")
        file.write(f"\n")
    while j < 256:
        # print("c = ",c)
        z = hash_output[c]
        z0 = CoeffFromHalfByte(z % 16)   # Lower nibble
        z1 = CoeffFromHalfByte(z // 16)  # Upper nibble
        with open("ExpandS_testbench_golden.txt", "a") as file:
                file.write(f"{hex(z)}\n")
        if z0 is not None:
            a[j] = z0
            with open("ExpandS_testbench_golden.txt", "a") as file:
                if(z0 < 0):
                    file.write(f"s[{j}] = {8380417 + z0}\n")
                else:
                    file.write(f"s[{j}] = {z0}\n")
            j += 1
        if z1 is not None and j < 256:
            a[j] = z1
            with open("ExpandS_testbench_golden.txt", "a") as file:
                if(z1 < 0):
                    file.write(f"s[{j}] = {8380417 + z1}\n")
                else:
                    file.write(f"s[{j}] = {z1}\n")
            j += 1
        c += 1  # Move to next byte in hash output
        if (c % 136 == 0 and j < 256):
            print(c)
            squeeze_cnt = squeeze_cnt + 1
            with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
                file.write(f"wait(sampler_squeeze);\n#170; //padder\n#240; //f_p\n")
                file.write(f"#10 send_input(1344'h{'0' * 64}{Verilog_hash[1088 - (squeeze_cnt + 1) * 272: 1088 - squeeze_cnt * 272]});\n")
                file.write(f"\n")
    with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"wait(next_element);\n\n")
    return a

# 算法 9: CoefFromHalfByte(b) 
def CoeffFromHalfByte(b):
    if ML_DSA["eta"] == 2 and b < 15:
            return 2 - (b % 5)
    else:
        if ML_DSA["eta"] == 4 and b < 9:
            return 4 - b
        else:
            return None
        
# 算法 27 ExpandS(ρ) 
def ExpandS(p):
    if os.path.exists("ExpandS_testbench_test_code.txt"):
        os.remove("ExpandS_testbench_test_code.txt")

    if os.path.exists("ExpandS_testbench_golden.txt"):
        os.remove("ExpandS_testbench_golden.txt")

    s1 = [None] * ML_DSA["l"]
    s2 = [None] * ML_DSA["k"]
    with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"mode = 0;\n")
    with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"/***s1***/\n")
        file.write(f"s_sel = 0;\n")
    for r in range(ML_DSA["l"]):
        r_prime = IntegerToBits(r,16)
        r_prime = BitsToBytes(r_prime)
        seed = p + r_prime
        with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
                file.write(f"/*s1_{r}*/\n")
                file.write(f"mem_sel = {r};\n")
        s1[r] = RejBoundedPoly(seed, r)
    with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"/***s2***/\n")
        file.write(f"s_sel = 1;\n")
    for r in range(ML_DSA["k"]):
        r_prime = IntegerToBits(r + ML_DSA["l"], 16)
        r_prime = BitsToBytes(r_prime)
        seed = p + r_prime
        with open("ExpandS_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
            file.write(f"/*s2_{r}*/\n")
            file.write(f"mem_sel = {(r)};\n")
        s2[r] = RejBoundedPoly(seed, r + ML_DSA["l"])
    return s1, s2

p_prime =  bytearray(b'\xeb\xd4\xa5o=\x99\xac\xd4\t\x88&|iR[\xbb\x8f\xf9\x01\x04\xb3\x89{f\xf3\x01\x80W\x0el\xf3\xcc\xdd/\xf5\xd3\xe7z\xaahv\xc2\x00\xf2\xab\xab\xf8\x81n7P7\xe8\xbc \t@\xb9;:\xd2\x0f\x97\xa4')

s1,s2 = ExpandS(p_prime)