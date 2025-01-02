# 算法 5:  BitsToInteger(y)
def BitsToInteger(y):
    x = 0
    alpha = len(y)
    for i in range(1, alpha + 1):
        x = 2 * x + y[alpha - i]
    return x

z = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] # 18 bit

#z = [0:131072]
if (z[18]==1 and )
z_int = BitsToInteger(z)
w = 131072 - z_int
print(w)
# print(len(z))
# print(BitsToInteger(z))