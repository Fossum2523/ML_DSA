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

# 算法 13: BitUnpack(v,a,b) 
def BitUnpack(v, a, b, r):
    c = (a + b).bit_length()
    z = BytesToBits(v)
    w = [0] * 256
    for i in range(256):
        bti = BitsToInteger(z[i*c:(i+1)*c])
        w[i] = b - bti
        with open("ExpandMASK_testbench_golden.txt", "a") as file:
            if(w[i]>0):
                file.write(f"y[{i + 256*r}] = {w[i]} = {b} - {bti}\n")
            else:
                file.write(f"y[{i + 256*r}] = {8380417 + w[i]} = 8380417 - {bti - b}\n")
    return w

# 算法 28 ExpandMask(ρ, µ) 
def ExpandMask(p, mu):
    if os.path.exists("ExpandMASK_testbench_test_code.txt"):
        os.remove("ExpandMASK_testbench_test_code.txt")

    if os.path.exists("ExpandMASK_testbench_golden.txt"):
        os.remove("ExpandMASK_testbench_golden.txt")

    with open("ExpandMASK_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
            file.write(f"mode = 2;\n")
    c = 1 + (ML_DSA["gamma_1"] - 1).bit_length()
    s = [None] * ML_DSA["l"]
    p = BytesToBits(p)
    for r in range(ML_DSA["l"]):
    # for r in range(1,2):
        with open("ExpandMASK_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
            file.write(f"/***y_{r}***/\n")
            file.write(f"mem_sel = {r};\n")
        n = IntegerToBits(mu + r, 16)
        H = p + n
        H = BitsToBytes(H)
        v = SHAKE_256(H, 32*c*8)
        Verilog_v = Verilog_trans(v)
        print(f"r = {r}--------------------------------")

        with open("ExpandMASK_testbench_test_code.txt", "a") as file:
            for i in range(5):
                if(i==0):
                    file.write(f"#170; //padder\n#240; //f_p\n")
                    file.write(f"#10 send_input(1344'h{'0' * 64}{Verilog_v[1152 - (i + 1) * 272: 1152 - i * 272]});\n")
                    file.write(f"\n")
                elif(i==4):
                    file.write(f"wait(sampler_squeeze);\n#170; //padder\n#240; //f_p\n")
                    file.write(f"#10 send_input(1344'h{'0' * 272}{Verilog_v[0: 64]});\n")
                    file.write(f"\n")
                else:
                    file.write(f"wait(sampler_squeeze);\n#170; //padder\n#240; //f_p\n")
                    file.write(f"#10 send_input(1344'h{'0' * 64}{Verilog_v[1152 - (i + 1) * 272: 1152 - i * 272]});\n")
                    file.write(f"\n")

        # with open("ExpandMASK_testbench_golden.txt", "a") as file:
        #     file.write(f"/***y_{r}***/\n")
        s[r] = BitUnpack(v, ML_DSA["gamma_1"] - 1, ML_DSA["gamma_1"],r)
        print(f"s[{r}] = {s[r]}")
    return s

def Verilog_trans(a):
    # a = list(a)
    a = BytesToBits(a)
    a.reverse()
    a = ''.join(map(str, a))
    a = ''.join(hex(int(a[i:i+4], 2))[2:].upper() for i in range(0, len(a), 4))
    return a 

p_prime =  bytearray(b'\x05\xa19_\x94I\xbas\x16\x17\xdf\xd4#\x04I\t\xd9\xbc\r\x9c\xea[\xed\xa7\x96\xf1h\xdf\xeaz\xc5j\x1b\x9d\xb9\xfa\x15Zq\xbf\xe3\xcdL\x81\x8e\xfc\x01=\xacPCh\x9am\xbe\xf7\x0b\xcc\x9c\xc0&\xecMh')

ka =  8

y = ExpandMask(p_prime,ka)

# print(y)
