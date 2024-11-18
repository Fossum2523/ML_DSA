from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
from SHA_3 import SHAKE_128,SHAKE_256,sponge
import numpy as np

q = 7681  # 模數

# 位反轉函數
def brv(k, n=4):
    bits = bin(k)[2:].zfill(n.bit_length() - 1)
    return int(bits[::-1], 2)

# NTT 演算法
def NTT(w):
    w_hat = np.array(w, dtype=np.int64)  # 將輸入轉為 numpy 陣列
    k = 0
    length = len(w)  # NTT 的長度為 4

    while length >= 2:
        start = 0
        while start < len(w):
            k = k + 1
            zeta = pow(1925, brv(k, len(w)), q)  # 旋轉因子
            print(zeta)
            # 蝶形運算
            for j in range(start, start + length // 2):
                t = (zeta * w_hat[j + length // 2]) % q
                print(zeta)
                print(w_hat[j + length // 2])
                print("t=",t)
                print(w_hat[j])
                w_hat[j + length // 2] = (w_hat[j] - t) % q
                print("w_hat[{}] = {}".format(j + length // 2,(w_hat[j] - t) % q))
                print(w_hat[j])
                print(t)
                w_hat[j] = (w_hat[j] + t) % q
                print("w_hat[{}] = {}".format(j,(w_hat[j] + t) % q))
                print("--------------------------------------")

            result = bit_reversed_order(w_hat)
            print(result)  # 應該輸出 [1467, 2807, 3471, 7621]
            start += length  # 移動到下一個區段

        length //= 2  # 每次迭代區段長度減半

    
    return w_hat

def bit_reversed_order(arr):
    n = len(arr)
    result = [0] * n
    for i in range(n):
        rev_i = brv(i, n)  # 取得位反轉索引
        result[rev_i] = arr[i]
    return result

# 測試範例
w = [1, 2, 3, 4]  # 輸入係數
result = NTT(w)
print(result)  # 輸出結果
result = bit_reversed_order(result)
print(result)  # 應該輸出 [1467, 2807, 3471, 7621]