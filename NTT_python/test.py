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



# 範例使用
decimal_number = 826091126784
s = decimal_to_binary_array(decimal_number, 46)
print(s)  # 輸出：[0, 0, 0, 0, 0, 0, 0, 0, 1, 0]

a = binary_array_to_decimal(s[43:(45 + 1)])
b = binary_array_to_decimal(s[33:(42 + 1)])
c = binary_array_to_decimal(s[23:(32 + 1)])
x = a + b + c

# print(s[43:(45 + 1)])
# print(s[33:(42 + 1)])
# print(s[23:(32 + 1)])
# print(a)
# print(b)
# print(c)
print(x)


print(x)


a = binary_array_to_decimal(s[43:(45 + 1)])
b = binary_array_to_decimal(s[33:(45 + 1)])
c = binary_array_to_decimal(s[23:(45 + 1)])
y = a + b + c

# y = decimal_to_binary_array(y, 24)
print(y)

z = binary_array_to_decimal(s[0:(22 + 1)])

result1 = ((2**13) * x) - y + z

print(result1)

x = decimal_to_binary_array(x, 12)

result2 = (2**13) * (binary_array_to_decimal(x[10:(11 + 1)]) + binary_array_to_decimal(x[0:(9 + 1)])) - (y + binary_array_to_decimal(x[10:(11 + 1)])) + z

print(result2)