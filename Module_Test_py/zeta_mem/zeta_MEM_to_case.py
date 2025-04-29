def file_to_verilog_case(input_file, output_file, signal_name='zeta_i', addr_name='zeta_addr_i', bit_width=23):
    """
    將檔案中的數值轉成Verilog case語句
    input_file: 輸入的純文字檔案，每行一個十六進位數（可以沒有0x）
    output_file: 產生的Verilog檔案
    signal_name: 指定Verilog中賦值的變數名稱
    addr_name: 指定case裡的選擇變數名稱
    bit_width: 數值寬度（預設23bit）
    """

    with open(input_file, 'r') as f:
        lines = f.readlines()

    with open(output_file, 'w') as f:
        f.write(f"case({addr_name})\n")
        for idx, line in enumerate(lines):
            line = line.strip()
            if not line:
                continue  # 忽略空白行
            try:
                # 無論如何用16進位解讀
                value = int(line, 16)
            except ValueError:
                print(f"警告：第 {idx} 行 \"{line}\" 不是合法的數字，跳過")
                continue

            hex_str = f"{value:0{(bit_width + 3)//4}X}"  # 格式化成對齊的HEX字串
            f.write(f" {idx}: {signal_name} = {bit_width}'h{hex_str};\n")
        f.write("endcase\n")

# 使用方法
file_to_verilog_case('MEM_zeta_7.txt', 'output.v')
