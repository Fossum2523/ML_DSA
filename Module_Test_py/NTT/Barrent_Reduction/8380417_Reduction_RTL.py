def decimal_to_binary_array(decimal_number, length=10):
    # 轉換為二進制字串，去掉 '0b' 前綴
    binary_str = bin(decimal_number)[2:]
    
    # 如果二進制數字位數不足，則在左邊補 0
    binary_str = binary_str.zfill(length)
    
    # 如果二進制數字位數超過指定長度，則截斷
    if len(binary_str) > length:
        binary_str = binary_str[-length:]
    
    # 將二進制字串反轉，確保最低位對應陣列的最低位
    binary_str = binary_str[::-1]
    
    # 將二進制字串轉換為列表，並返回
    return [int(bit) for bit in binary_str]

def binary_array_to_decimal(binary_array):
    # 將二進制數組反轉，使其符合小端格式
    binary_array.reverse()
    # 將反轉後的二進制數組轉換為字符串
    binary_str = ''.join(map(str, binary_array))
    # 將二進制字符串轉換為十進制數字
    decimal_value = int(binary_str, 2)
    return decimal_value



decimal_number = 42344409747208
s = decimal_to_binary_array(decimal_number, 46)
# print(s)  


#---------------------------------------------------------level 1 start
a = s[43:(45 + 1)] + [0,0,0,0,0,0,0,0]
a = binary_array_to_decimal(a)
b = s[33:(42 + 1)] + [0]
b = binary_array_to_decimal(b)
c = s[23:(32 + 1)] + [0]
c = binary_array_to_decimal(c)
x = a + b + c
# print(x)
a = binary_array_to_decimal(s[43:(45 + 1)])
b = binary_array_to_decimal(s[33:(45 + 1)])
c = binary_array_to_decimal(s[23:(45 + 1)])
y = a + b + c
# print(y)
z = s[0:(22 + 1)]
# print(z)
y = decimal_to_binary_array(y, 24)
x = decimal_to_binary_array(x, 12)
#---------------------------------------------------------level 1 end

#---------------------------------------------------------level 2 start
d  = binary_array_to_decimal(x[10:(11 + 1)]) + binary_array_to_decimal(x[0:(9 + 1)])
e =  binary_array_to_decimal(z[0:(22 + 1)])  - binary_array_to_decimal(y[0:(23 + 1)]) - binary_array_to_decimal(x[10:(11 + 1)])
# print(d)
print(e)
if(e<0):
    e = (2**24-1) + e + 1

print(e)
d = decimal_to_binary_array(d,11)
e = decimal_to_binary_array(e,24)
# print(d)
# print(e)
#---------------------------------------------------------level 2 end

#---------------------------------------------------------level 3 start
d = [0,0,0,0,0,0,0,0,0,0,0,0,0] + d
f = binary_array_to_decimal(d) + binary_array_to_decimal(e)
# print(f)
f = decimal_to_binary_array(f,24)
#---------------------------------------------------------level 3 end

#---------------------------------------------------------level 4 start
if f[23] == 1:
    Adjust = 8380417
else :
    Adjust = 8396798

f = binary_array_to_decimal(f)
g = f + Adjust
# print(g)
g = decimal_to_binary_array(g,24)
# print(g)
#---------------------------------------------------------level 4 end

# #---------------------------------------------------------level 5 start
if g[23] == 1:
    result = f
else :
    result = binary_array_to_decimal(g)

print(result)
# #---------------------------------------------------------level 5 end