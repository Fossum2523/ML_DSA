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

# 算法 23 SampleInBall(ρ) 
def SampleInBall(p):
    if os.path.exists("SampleInBall_testbench_test_code.txt"):
        os.remove("SampleInBall_testbench_test_code.txt")

    if os.path.exists("SampleInBall_testbench_golden.txt"):
        os.remove("SampleInBall_testbench_golden.txt")

    with open("SampleInBall_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"/***c***/\n")
        file.write(f"mode = 3;\n")

    c = [0] * 256
    s = SHAKE_256(p,2176)
    Verilog_hash = Verilog_trans(s)
    cnt = 8
    h = BytesToBits(s[:8])
    squeeze_cnt = 0
    with open("SampleInBall_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"#170; //padder\n#240; //f_p\n")
        file.write(f"#10 send_input(1344'h{'0' * 64}{Verilog_hash[544 - (squeeze_cnt + 1) * 272: 544 - squeeze_cnt * 272]});\n")
        file.write(f"\n")
    for i in range(256 - ML_DSA["tau"],256):
        j = s[cnt]
        cnt = cnt + 1
        if (cnt % 136 == 0 and j < 256):
            squeeze_cnt = squeeze_cnt + 1
            with open("SampleInBall_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
                file.write(f"wait(sampler_squeeze);\n#170; //padder\n#240; //f_p\n")
                file.write(f"#10 send_input(1344'h{'0' * 64}{Verilog_hash[544 - (squeeze_cnt + 1) * 272: 544 - squeeze_cnt * 272]});\n")
                file.write(f"\n")
        while j > i:
            j = s[cnt]
            cnt = cnt + 1
            if (cnt % 136 == 0 and j < 256):
                squeeze_cnt = squeeze_cnt + 1
                with open("SampleInBall_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
                    file.write(f"wait(sampler_squeeze);\n#170; //padder\n#240; //f_p\n")
                    file.write(f"#10 send_input(1344'h{'0' * 64}{Verilog_hash[544 - (squeeze_cnt + 1) * 272: 544 - squeeze_cnt * 272]});\n")
                    file.write(f"\n")
        c[i] = c[j]
        c[j] = (-1)**(h[(i + ML_DSA["tau"] - 256)])

    with open("SampleInBall_testbench_test_code.txt", "a") as file:  # "w" 代表寫入模式，會覆蓋原內容
        file.write(f"wait(next_element);\n\n")
    
    for i in range(256):
        with open("SampleInBall_testbench_golden.txt", "a") as file:
            file.write(f"c[{i}] = {c[i]}\n")
    return c 

c_tilde =  bytearray(b'\xd5\x87\xef\x87\x85\xc7j\xcc0\xa2\xc5pX:W\xe7a\x9e\xe8\xe46j\xb4MO\xe7\x8ek\xdb1/$')

c = SampleInBall(c_tilde)

print(c)