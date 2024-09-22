def hex_to_bits(hex_string: str) -> str:
    """
    將十六進制字串轉換為二進制位元串
    :param hex_string: 十六進制字串，例如 "6c"
    :return: 對應的二進制位元串（8位長）
    """
    # 將十六進制字串轉換為整數
    integer_value = int(hex_string, 16)
    
    # 將整數轉換為二進制字串，並去掉 '0b' 前綴，補齊到 8 位
    bit_string = bin(integer_value)[2:].zfill(8)
    
    return bit_string

# 測試範例
hex_string = "6c"
bit_result = hex_to_bits(hex_string)
print("二進制表示:", bit_result)