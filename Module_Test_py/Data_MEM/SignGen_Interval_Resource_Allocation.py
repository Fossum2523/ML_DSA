from typing import List, Dict, Tuple

# 假設輸入的變數清單（你可自行填入從圖中分析的資料）
variables = [
    {"name": "u",  "width": 64, "depth": 8,    "start": 1, "end": 10},##
    {"name": "s1", "width": 23, "depth": 1024, "start": 1, "end": 2},

    {"name": "p_prime_prime", "width": 64, "depth": 4, "start": 2, "end": 20},##
    {"name": "s2", "width": 23, "depth": 1024, "start": 2, "end": 3},
    {"name": "s1_hat", "width": 23, "depth": 1024, "start": 2, "end": 20},


    {"name": "y", "width": 23, "depth": 1024, "start": 3, "end": 20},
    {"name": "t0", "width": 23, "depth": 1024, "start": 3, "end": 5},
    {"name": "s2_hat", "width": 23, "depth": 1024, "start": 3, "end": 20},

    {"name": "p", "width": 64, "depth": 4, "start": 4, "end": 6},##

    {"name": "A", "width": 23, "depth": 4096, "start": 5, "end": 20},
    {"name": "t0_hat", "width": 23, "depth": 1024, "start": 5, "end": 20},
    {"name": "y_hat", "width": 23, "depth": 1024, "start": 6, "end": 7},

    {"name": "w_hat", "width": 23, "depth": 1024, "start": 7, "end": 8},

    {"name": "w", "width": 23, "depth": 1024, "start": 8, "end": 16},

    {"name": "w1_pack", "width": 64, "depth": 96  , "start": 9, "end": 10},##

    {"name": "c_tilde", "width": 64, "depth": 4, "start": 10, "end": 20},##

    {"name": "c", "width": 23, "depth": 256, "start": 11, "end": 12},

    {"name": "c_hat", "width": 23, "depth": 256, "start": 12, "end": 17},

    {"name": "cs1_hat", "width": 23, "depth": 1024, "start": 13, "end": 14},

    {"name": "cs1", "width": 23, "depth": 1024, "start": 14, "end": 15},
    {"name": "cs2_hat", "width": 23, "depth": 1024, "start": 14, "end": 15},

    {"name": "cs2", "width": 23, "depth": 1024, "start": 15, "end": 16},
    {"name": "z", "width": 23, "depth": 1024, "start": 15, "end": 20},

    {"name": "w_cs2", "width": 23, "depth": 1024, "start": 16, "end": 19},
    {"name": "Highbit(w_cs2⟩⟩)", "width": 23, "depth": 1024, "start": 16, "end": 19},
    
    {"name": "ct0_hat", "width": 23, "depth": 1024, "start": 17, "end": 18},

    {"name": "ct0", "width": 23, "depth": 1024, "start": 18, "end": 19},

    {"name": "hint_pack", "width": 64, "depth": 11, "start": 19, "end": 20}

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






# {'width': 23, 'depth': 1024, 'vars': ['s1', 'y'], 'timeline': [(1, 2), (3, 20)]}
# {'width': 23, 'depth': 1024, 'vars': ['s2', 'y_hat', 'w', 'ct0_hat'], 'timeline': [(2, 3), (6, 7), (8, 16), (17, 18)]}
# {'width': 23, 'depth': 1024, 'vars': ['t0', 'w_hat', 'cs1_hat', 'cs2', 'ct0'], 'timeline': [(3, 5), (7, 8), (13, 14), (15, 16), (18, 19)]}
# {'width': 23, 'depth': 1024, 'vars': ['cs1', 'w_cs2'], 'timeline': [(14, 15), (16, 19)]}
# {'width': 23, 'depth': 1024, 'vars': ['cs2_hat', 'Highbit(w_cs2⟩⟩)'], 'timeline': [(14, 15), (16, 19)]}
# {'width': 23, 'depth': 1024, 'vars': ['z'], 'timeline': [(15, 20)]}

# {'width': 23, 'depth': 256, 'vars': ['c'], 'timeline': [(11, 12)]}
# {'width': 23, 'depth': 256, 'vars': ['c_hat'], 'timeline': [(12, 17)]}

# {'width': 23, 'depth': 4096, 'vars': ['A'], 'timeline': [(5, 20)]}
# {'width': 23, 'depth': 1024, 'vars': ['s1_hat'], 'timeline': [(2, 20)]}
# {'width': 25, 'depth': 1024, 'vars': ['s2_hat'], 'timeline': [(3, 20)]}
# {'width': 26, 'depth': 1024, 'vars': ['t0_hat'], 'timeline': [(5, 20)]}

# {'width': 64, 'depth': 96, 'vars': ['w1_pack'], 'timeline': [(9, 10)]}

# {'width': 64, 'depth': 11, 'vars': ['hint_pack'], 'timeline': [(19, 20)]}

# {'width': 64, 'depth': 8, 'vars': ['u'], 'timeline': [(1, 10)]}
# {'width': 64, 'depth': 4, 'vars': ['p_prime_prime'], 'timeline': [(2, 20)]}
# {'width': 64, 'depth': 4, 'vars': ['p', 'c_tilde'], 'timeline': [(4, 6), (10, 20)]}

