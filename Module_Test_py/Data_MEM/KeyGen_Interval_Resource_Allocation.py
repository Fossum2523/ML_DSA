from typing import List, Dict, Tuple

# 假設輸入的變數清單（你可自行填入從圖中分析的資料）
variables = [
    {"name": "seed",  "width": 64, "depth": 16,    "start": 1, "end": 4},

    {"name": "s1", "width": 23, "depth": 1024, "start": 2, "end": 4},

    {"name": "s2", "width": 23, "depth": 1024, "start": 3, "end": 7},
    {"name": "s1_hat", "width": 23, "depth": 1024, "start": 3, "end": 5},

    {"name": "A", "width": 23, "depth": 4096, "start": 4, "end": 5},
    {"name": "s1_pack", "width": 64, "depth": 48, "start": 4, "end": 9},

    {"name": "s2_pack", "width": 64, "depth": 48, "start": 5, "end": 9},
    {"name": "As1_hat", "width": 23, "depth":1024, "start": 5, "end": 6},

    {"name": "As1", "width": 23, "depth":1024, "start": 6, "end": 7},

    {"name": "t1_pack", "width": 64, "depth": 160, "start": 7, "end": 9},
    {"name": "t", "width": 23, "depth":1024, "start": 7, "end": 8},

    {"name": "t0_pack", "width": 64, "depth": 208, "start": 8, "end": 9},
    {"name": "tr", "width": 64, "depth": 8, "start": 8, "end": 9},

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

# {'width': 23, 'depth': 4096, 'vars': ['A'], 'timeline': [(4, 5)]}


# {'width': 23, 'depth': 1024, 'vars': ['s1', 'As1_hat', 't'], 'timeline': [(2, 4), (5, 6), (7, 8)]}
# {'width': 23, 'depth': 1024, 'vars': ['s2'], 'timeline': [(3, 7)]}
# {'width': 23, 'depth': 1024, 'vars': ['s1_hat', 'As1'], 'timeline': [(3, 5), (6, 7)]}


# {'width': 64, 'depth': 208, 'vars': ['t0_pack'], 'timeline': [(8, 9)]}
# {'width': 64, 'depth': 160, 'vars': ['t1_pack'], 'timeline': [(7, 9)]}
# {'width': 64, 'depth': 48, 'vars': ['s1_pack'], 'timeline': [(4, 9)]}
# {'width': 64, 'depth': 48, 'vars': ['s2_pack'], 'timeline': [(5, 9)]}
# {'width': 64, 'depth': 16, 'vars': ['seed'], 'timeline': [(1, 4)]}
# {'width': 64, 'depth': 8, 'vars': ['tr'], 'timeline': [(8, 9)]}