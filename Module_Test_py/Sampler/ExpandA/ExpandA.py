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

# 算法 26 ExpandA(ρ)
def ExpandA(p):
    if os.path.exists("ExpandA_testbench_test_code.txt"):
        os.remove("ExpandA_testbench_test_code.txt")

    if os.path.exists("ExpandA_testbench_golden.txt"):
        os.remove("ExpandA_testbench_golden.txt")

    A = np.zeros((ML_DSA["k"], ML_DSA["l"]), dtype=object)

    with open("ExpandA_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"mode = 1;\n")

    for r in range(ML_DSA["k"]):
        for s in range(ML_DSA["l"]):
            r_prime = IntegerToBits(r, 8)
            r_prime = BitsToBytes(r_prime)
            s_prime = IntegerToBits(s, 8)
            s_prime = BitsToBytes(s_prime)
            seed = p + s_prime + r_prime

            with open("ExpandA_testbench_golden.txt", "a") as file:
                file.write(f"/***A_{r}_{s}***/\n")

            with open("ExpandA_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
                file.write(f"/***A_{r}_{s}***/\n")
                file.write(f"mem_sel = {r*4 + s};\n")

            A[r, s] = RejNTTPoly(seed,r,s)
    return A

# 算法 24 RejNTTPoly(ρ) 
def RejNTTPoly(p,r,s):
    a = [None] * 256  # Initialize polynomial coefficients
    # H_p = SHAKE_128(p, 7152)  # Get more bytes than needed
    H_p = SHAKE_128(p, 8064)  # Get more bytes than needed
    Verilog_hash = Verilog_trans(H_p)
    # print(Verilog_hash)
    j = 0
    c = 0
    squeeze_cnt = 0
    with open("ExpandA_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
            file.write(f"#170; //padder\n#240; //f_p\n")
            file.write(f"#10 send_input(1344'h{Verilog_hash[2016 - (squeeze_cnt + 1) * 336: 2016 - squeeze_cnt * 336]});\n")
            file.write(f"\n")
    while j < 256:
        # print("c = ",c)
        a[j] = CoeffFromThreeBytes(H_p[c], H_p[c+1], H_p[c+2])
        c += 3
        if a[j] is not None:
            with open("ExpandA_testbench_golden.txt", "a") as file:
                    file.write(f"a[{j}] = {a[j]} \n")
            j += 1
        
        if(c % 56 ==0):
            squeeze_cnt = squeeze_cnt + 1
            with open("ExpandA_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
                file.write(f"wait(sampler_squeeze);\n#170; //padder\n#240; //f_p\n")
                file.write(f"#10 send_input(1344'h{Verilog_hash[2016 - (squeeze_cnt + 1) * 336: 2016 - squeeze_cnt * 336]});\n")
                file.write(f"\n")
    # print(a)
    with open("ExpandA_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"wait(next_element);\n\n")
    return a

# 算法 8: CoefFromThreeBytes(b0,b1,b2)
def CoeffFromThreeBytes(b0, b1, b2):
    if b2 > 127:
        b2 = b2 - 128
    z = (b2 << 16) + (b1 << 8) + b0
    if z < ML_DSA["q"]:
        return z
    else:
        return None
    
p =  bytearray(b'4\x04\xfdk\xb5\xacr\xde%\x0cb\x12\xa3\x93/L\x9e\xa2\x0e\xec2\xc6$\x07\x9er3k\x19\x9b\x86 ')

A = ExpandA(p)