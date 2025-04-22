from typing import List, Dict, Tuple

# 假設輸入的變數清單（你可自行填入從圖中分析的資料）
variables = [
    # {"name": "u",  "width": 64, "depth": 8,    "start": 1, "end": 10},
    {"name": "s1", "width": 23, "depth": 1024, "start": 1, "end": 2},
    {"name": "s2", "width": 23, "depth": 1024, "start": 2, "end": 3},
    {"name": "y", "width": 23, "depth": 1024, "start": 3, "end": 17},
    {"name": "t0", "width": 23, "depth": 1024, "start": 3, "end": 5},
    {"name": "A", "width": 23, "depth": 4096, "start": 5, "end": 7},
    {"name": "c", "width": 23, "depth": 256, "start": 11, "end": 12},
    {"name": "cs1", "width": 23, "depth": 1024, "start": 14, "end": 15},
    {"name": "cs2", "width": 23, "depth": 1024, "start": 15, "end": 18},
    {"name": "ct0", "width": 23, "depth": 1024, "start": 18, "end": 19},
    {"name": "w_cs2", "width": 23, "depth": 1024, "start": 18, "end": 19},
    {"name": "z", "width": 23, "depth": 1024, "start": 15, "end": 18},

    # {"name": "p_prime_prime", "width": 23, "depth": 1024, "start": 2, "end": 3},
    # {"name": "p", "width": 23, "depth": 1024, "start": 2, "end": 3},
    {"name": "s1_hat", "width": 24, "depth": 1024, "start": 2, "end": 13},
    {"name": "s2_hat", "width": 25, "depth": 1024, "start": 3, "end": 14},
    {"name": "t0_hat", "width": 26, "depth": 1024, "start": 5, "end": 17},
    {"name": "y_hat", "width": 23, "depth": 1024, "start": 6, "end": 7},
    {"name": "c_hat", "width": 23, "depth": 256, "start": 12, "end": 17},
    {"name": "cs1_hat", "width": 23, "depth": 1024, "start": 13, "end": 14},
    {"name": "cs2_hat", "width": 23, "depth": 1024, "start": 14, "end": 15},
    {"name": "ct0_hat", "width": 23, "depth": 1024, "start": 17, "end": 18},
    {"name": "w", "width": 23, "depth": 1024, "start": 8, "end": 18},
    {"name": "w_hat", "width": 23, "depth": 1024, "start": 7, "end": 8},
    {"name": "Highbit(w_cs2⟩⟩)", "width": 23, "depth": 1024, "start": 15, "end": 18},
    {"name": "hint", "width": 1, "depth": 1024, "start": 15, "end": 18}



    # {"name": "w1_pack", "width": 23, "depth": 1024, "start": 2, "end": 3},
    # {"name": "c_tilde", "width": 23, "depth": 1024, "start": 2, "end": 3},
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
