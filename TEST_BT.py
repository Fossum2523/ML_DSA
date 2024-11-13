from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
from SHA_3 import SHAKE_128,SHAKE_256,sponge
import numpy as np

q = 7681  # 模數


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

    # 測試範例
w = [1, 2, 3, 4]  # 輸入係數
result = NTT(w)
print(result)  # 輸出結果
result = bit_reversed_order(result)
print(result)  # 應該輸出 [1467, 2807, 3471, 7621]