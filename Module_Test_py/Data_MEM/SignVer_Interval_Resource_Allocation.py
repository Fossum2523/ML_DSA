from typing import List, Dict, Tuple

# 假設輸入的變數清單（你可自行填入從圖中分析的資料）
variables = [
    {"name": "c_tilde", "width": 64, "depth": 4, "start": 1, "end": 8},##
    {"name": "c", "width": 23, "depth": 256, "start": 1, "end": 3},
    {"name": "t1", "width": 23, "depth":1024, "start": 1, "end": 2},

    {"name": "tr", "width": 64, "depth": 8, "start": 2, "end": 5},
    {"name": "z", "width": 23, "depth":1024, "start": 2, "end": 4},
    {"name": "t1_hat", "width": 23, "depth":1024, "start": 2, "end": 4},

    {"name": "A", "width": 23, "depth": 4096, "start": 3, "end": 5},
    {"name": "c_hat", "width": 23, "depth": 256, "start": 3, "end": 4},

    {"name": "z_hat", "width": 23, "depth":1024, "start": 4, "end": 5}, 
    {"name": "ct1_hat", "width": 23, "depth":1024, "start": 4, "end": 6},

    {"name": "u",  "width": 64, "depth": 8,    "start": 5, "end": 8},##
    {"name": "Az_hat", "width": 23, "depth": 1024, "start": 5, "end": 6},

    {"name": "w_hat", "width": 23, "depth": 1024, "start": 6, "end": 7},

    {"name": "w", "width": 23, "depth": 1024, "start": 7, "end": 8},
] 

# 預先計算每個變數的 size（bits）
for var in variables:
    var["size"] = var["width"] * var["depth"]

# 照 size 排序（大的優先放）
variables.sort(key=lambda x: x["size"], reverse=True)

# 初始化記憶體區塊列表
memory_blocks: List[Dict] = []

# 分配記憶體
for var in variables:
    assigned = False
    for block in memory_blocks:
        # 寬與深度相同，才可以共用
        if block["width"] == var["width"] and block["depth"] == var["depth"]:
            # 時間不重疊才能共用
            overlap = any(not (var["end"] < t[0] or var["start"] > t[1]) for t in block["timeline"])
            if not overlap:
                block["vars"].append(var["name"])
                block["timeline"].append((var["start"], var["end"]))
                assigned = True
                break
    if not assigned:
        # 建立新記憶體區塊
        memory_blocks.append({
            "width": var["width"],
            "depth": var["depth"],
            "vars": [var["name"]],
            "timeline": [(var["start"], var["end"])]
        })

# 顯示結果

for i in memory_blocks:
    print(i)
    print("\n")
