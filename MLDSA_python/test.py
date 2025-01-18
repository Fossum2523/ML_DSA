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

# 算法 5:  BitsToInteger(y)
def BitsToInteger(y):
    x = 0
    alpha = len(y)
    for i in range(1, alpha + 1):
        x = 2 * x + y[alpha - i]
    return x

def BitUnpack(z):
    c = (101372 + 101371).bit_length()
    bti = BitsToInteger(z)
    if (bti > 131072):
        w_a = 8380417 - BitsToInteger(z[0:17])
    else:
        w_a = 131072 - bti
    
    if (bti > 131072):
        w_b = 8380417 + (131072 - bti)
    else:
        w_b = 131072 - bti
    w = 131072 - bti
    print(w_a)
    print(w_b)
    print(w)
    return w_a == w_b

test = BitUnpack([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
print(test)