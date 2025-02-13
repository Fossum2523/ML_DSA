from default_parameters import ML_DSA_44, ML_DSA_65, ML_DSA_87
import os
import hashlib
import numpy as np
from itertools import islice
import math

ML_DSA = ML_DSA_44

q_minus_bit_len = (ML_DSA["q"]-1).bit_length()
t1_coff_square = q_minus_bit_len - ML_DSA["d"]
t1_coff_max = (2**t1_coff_square) - 1
zeta_list = [
0, 4808194, 3765607, 3761513, 5178923, 5496691, 5234739, 5178987, 7778734, 3542485, 2682288, 2129892, 3764867, 7375178, 557458, 7159240, 5010068, 4317364, 2663378, 6705802, 4855975, 7946292, 676590, 7044481, 5152541, 1714295, 2453983, 1460718, 7737789, 4795319, 2815639, 2283733, 3602218, 3182878, 2740543, 4793971, 5269599, 2101410, 3704823, 1159875, 394148, 928749, 1095468, 4874037, 2071829, 4361428, 3241972, 2156050, 3415069, 1759347, 7562881, 4805951, 3756790, 6444618, 6663429, 4430364, 5483103, 3192354, 556856, 3870317, 2917338, 1853806, 3345963, 1858416, 3073009, 1277625, 5744944, 3852015, 4183372, 5157610, 5258977, 8106357, 2508980, 2028118, 1937570, 4564692, 2811291, 5396636, 7270901, 4158088, 1528066, 482649, 1148858, 5418153, 7814814, 169688, 2462444, 5046034, 4213992, 4892034, 1987814, 5183169, 1736313, 235407, 5130263, 3258457, 5801164, 1787943, 5989328, 6125690, 3482206, 4197502, 7080401, 6018354, 7062739, 2461387, 3035980, 621164, 3901472, 7153756, 2925816, 3374250, 1356448, 5604662, 2683270, 5601629, 4912752, 2312838, 7727142, 7921254, 348812, 8052569, 1011223, 6026202, 4561790, 6458164, 6143691, 1744507, 1753, 6444997, 5720892, 6924527, 2660408, 6600190, 8321269, 2772600, 1182243, 87208, 636927, 4415111, 4423672, 6084020, 5095502, 4663471, 8352605, 822541, 1009365, 5926272, 6400920, 1596822, 4423473, 4620952, 6695264, 4969849, 2678278, 4611469, 4829411, 635956, 8129971, 5925040, 4234153, 6607829, 2192938, 6653329, 2387513, 4768667, 8111961, 5199961, 3747250, 2296099, 1239911, 4541938, 3195676, 2642980, 1254190, 8368000, 2998219, 141835, 8291116, 2513018, 7025525, 613238, 7070156, 6161950, 7921677, 6458423, 4040196, 4908348, 2039144, 6500539, 7561656, 6201452, 6757063, 2105286, 6006015, 6346610, 586241, 7200804, 527981, 5637006, 6903432, 1994046, 2491325, 6987258, 507927, 7192532, 7655613, 6545891, 5346675, 8041997, 2647994, 3009748, 5767564, 4148469, 749577, 4357667, 3980599, 2569011, 6764887, 1723229, 1665318, 2028038, 1163598, 5011144, 3994671, 8368538, 7009900, 3020393, 3363542, 214880, 545376, 7609976, 3105558, 7277073, 508145, 7826699, 860144, 3430436, 140244, 6866265, 6195333, 3123762, 2358373, 6187330, 5365997, 6663603, 2926054, 7987710, 8077412, 3531229, 4405932, 4606686, 1900052, 7598542, 1054478, 7648983]


def RU(switch, in_u, in_d, MEM_u, MEM_d, MEM_cnt):
    if(switch) :
        out_u = MEM_u[MEM_cnt]
        out_d = in_u
        MEM_u[MEM_cnt] = MEM_d[MEM_cnt]
        MEM_d[MEM_cnt] = in_d
    else :
        out_u = MEM_u[MEM_cnt]
        out_d = MEM_d[MEM_cnt]
        MEM_u[MEM_cnt] = in_u
        MEM_d[MEM_cnt] = in_d
        
    return out_u, out_d, MEM_u, MEM_d



def BU(a, b, MEM_zeta, zeta_cnt):

    if isinstance(MEM_zeta, list):
        zeta = MEM_zeta[zeta_cnt]
    else:
        zeta = MEM_zeta
        # print(zeta)

    t = (b * zeta) % ML_DSA["q"]
    out_a = (a + t) % ML_DSA["q"]
    out_b = (a - t) % ML_DSA["q"]

    return out_a, out_b

def zeta_RU(MEM_zeta, zeta_cnt):
    if isinstance(MEM_zeta, list):
        zeta = MEM_zeta[zeta_cnt]
    else:
        zeta = MEM_zeta
    return zeta

def BU_test(a, b, zeta):
    t = (b * zeta) % ML_DSA["q"]
    out_a = (a + t) % ML_DSA["q"]
    out_b = (a - t) % ML_DSA["q"]

    return out_a, out_b

def Controller(depth, switch, en, MEM_cnt, zeta_cnt):
    # if(depth == 32):
    #         print(MEM_cnt, zeta_cnt, switch)

    if(en):
        if(MEM_cnt == (depth - 1)):
            MEM_cnt = 0

            if(switch):
                switch = 0
            else:
                switch = 1

            test = math.log(depth, 2)
            test1 = 7 - test
            test2 = 2**test1 - 1
            if(zeta_cnt == test2):
                zeta_cnt = 0
            else:
                zeta_cnt = zeta_cnt + 1
        else:
            MEM_cnt = MEM_cnt + 1
            
    return MEM_cnt, zeta_cnt, switch

def NTT(NTT_in):
    MEM_zeta_0 = zeta_list[1]
    MEM_zeta_1 = zeta_list[2:4]
    MEM_zeta_2 = zeta_list[4:8]
    MEM_zeta_3 = zeta_list[8:16]
    MEM_zeta_4 = zeta_list[16:32]
    MEM_zeta_5 = zeta_list[32:64]
    MEM_zeta_6 = zeta_list[64:128]
    MEM_zeta_7 = zeta_list[128:256]
            
    MEM_u_1 = [0] * 64
    MEM_d_1 = [0] * 64
    MEM_u_2 = [0] * 32
    MEM_d_2 = [0] * 32
    MEM_u_3 = [0] * 16
    MEM_d_3 = [0] * 16
    MEM_u_4 = [0] * 8
    MEM_d_4 = [0] * 8
    MEM_u_5 = [0] * 4
    MEM_d_5 = [0] * 4
    MEM_u_6 = [0] * 2
    MEM_d_6 = [0] * 2
    MEM_u_7 = [0] * 1
    MEM_d_7 = [0] * 1

    switch_1 = 0
    switch_2 = 0
    switch_3 = 0
    switch_4 = 0
    switch_5 = 0
    switch_6 = 0
    switch_7 = 0

    MEM_cnt_1 = 0
    MEM_cnt_2 = 0
    MEM_cnt_3 = 0
    MEM_cnt_4 = 0
    MEM_cnt_5 = 0
    MEM_cnt_6 = 0
    MEM_cnt_7 = 0

    zeta_cnt_1 = 1
    zeta_cnt_2 = 3
    zeta_cnt_3 = 7
    zeta_cnt_4 = 15
    zeta_cnt_5 = 31
    zeta_cnt_6 = 63 
    zeta_cnt_7 = 127                                     

    if os.path.exists("NTT_timing_gold.txt"):
        os.remove("NTT_timing_gold.txt")

    headers = [
        '{:^5}'.format(""),
        # '{:^15}'.format("out_0_u"), '{:^15}'.format("out_0_d"),
        '{:^15}'.format("out_1_u"), '{:^15}'.format("out_1_d"),
        '{:^15}'.format("out_2_u"), '{:^15}'.format("out_2_d"),
        '{:^15}'.format("out_3_u"), '{:^15}'.format("out_3_d"),
        '{:^15}'.format("out_4_u"), '{:^15}'.format("out_4_d"),
        '{:^15}'.format("out_5_u"), '{:^15}'.format("out_5_d"),
        '{:^15}'.format("out_6_u"), '{:^15}'.format("out_6_d"),
        '{:^15}'.format("out_7_u"), '{:^15}'.format("out_7_d")
    ]

    header_line = ''.join(headers) + '\n'

    with open("NTT_timing_gold.txt", "a") as file:
        file.write(header_line)

    en = 1
    for cnt in range(256):
        ### stage en control ###
        
        
        if(cnt < 128):
            NTT_in_u = NTT_in[cnt]
            NTT_in_d = NTT_in[cnt + 128]
        else:
            NTT_in_u = 0
            NTT_in_d = 0

        # stage 0 
        out_u_0, out_d_0 = BU(NTT_in_u, NTT_in_d,  MEM_zeta_0, None)
        


        # stage 1 
        MEM_u_out_1, MEM_d_out_1, MEM_u_1, MEM_d_1 = RU(switch_1, out_u_0, out_d_0, MEM_u_1, MEM_d_1, MEM_cnt_1) 
        zeta_1 = zeta_RU(MEM_zeta_1, zeta_cnt_1)
        out_u_1, out_d_1 = BU_test(MEM_u_out_1, MEM_d_out_1,  zeta_1)
        # out_u_1, out_d_1 = BU(MEM_u_out_1, MEM_d_out_1,  MEM_zeta_1, zeta_cnt_1)
        
        
        # stage 2 
        MEM_u_out_2, MEM_d_out_2, MEM_u_2, MEM_d_2 = RU(switch_2, out_u_1, out_d_1, MEM_u_2, MEM_d_2, MEM_cnt_2)
        out_u_2, out_d_2 = BU(MEM_u_out_2, MEM_d_out_2,  MEM_zeta_2, zeta_cnt_2)
        
        # stage 3 
        MEM_u_out_3, MEM_d_out_3, MEM_u_3, MEM_d_3 = RU(switch_3, out_u_2, out_d_2, MEM_u_3, MEM_d_3, MEM_cnt_3)
        out_u_3, out_d_3 = BU(MEM_u_out_3, MEM_d_out_3,  MEM_zeta_3, zeta_cnt_3)
        
        # stage 4 
        MEM_u_out_4, MEM_d_out_4, MEM_u_4, MEM_d_4 = RU(switch_4, out_u_3, out_d_3, MEM_u_4, MEM_d_4, MEM_cnt_4)
        out_u_4, out_d_4 = BU(MEM_u_out_4, MEM_d_out_4,  MEM_zeta_4, zeta_cnt_4)
        
        # stage 5 
        MEM_u_out_5, MEM_d_out_5, MEM_u_5, MEM_d_5 = RU(switch_5, out_u_4, out_d_4, MEM_u_5, MEM_d_5, MEM_cnt_5)
        out_u_5, out_d_5 = BU(MEM_u_out_5, MEM_d_out_5,  MEM_zeta_5, zeta_cnt_5)
        
        # stage 6 
        MEM_u_out_6, MEM_d_out_6, MEM_u_6, MEM_d_6 = RU(switch_6, out_u_5, out_d_5, MEM_u_6, MEM_d_6, MEM_cnt_6)
        out_u_6, out_d_6 = BU(MEM_u_out_6, MEM_d_out_6,  MEM_zeta_6, zeta_cnt_6)
        
        # stage 7 
        MEM_u_out_7, MEM_d_out_7, MEM_u_7, MEM_d_7 = RU(switch_7, out_u_6, out_d_6, MEM_u_7, MEM_d_7, MEM_cnt_7)
        out_u_7, out_d_7 = BU(MEM_u_out_7, MEM_d_out_7,  MEM_zeta_7, zeta_cnt_7)
        

        if(cnt < 192):
            en_1 = 1
        else:
            en_1 = 0
        MEM_cnt_1, zeta_cnt_1, switch_1 = Controller(64, switch_1, en_1, MEM_cnt_1, zeta_cnt_1)

        if(cnt >= 64 and cnt < 224):
            en_2 = 1
        else:
            en_2 = 0
        MEM_cnt_2, zeta_cnt_2, switch_2 = Controller(32, switch_2, en_2, MEM_cnt_2, zeta_cnt_2)

        if(cnt >= 96 and cnt < 240):
            en_3 = 1
        else:
            en_3 = 0
        MEM_cnt_3, zeta_cnt_3, switch_3 = Controller(16, switch_3, en_3, MEM_cnt_3, zeta_cnt_3)

        if(cnt >= 112 and cnt < 248):
            en_4 = 1
        else:
            en_4 = 0
        MEM_cnt_4, zeta_cnt_4, switch_4 = Controller(8, switch_4, en_4, MEM_cnt_4, zeta_cnt_4)

        if(cnt >= 120 and cnt < 252):
            en_5 = 1
        else:
            en_5 = 0
        MEM_cnt_5, zeta_cnt_5, switch_5 = Controller(4, switch_5, en_5, MEM_cnt_5, zeta_cnt_5)

        if(cnt >= 124 and cnt < 254):
            en_6 = 1
        else:
            en_6 = 0
        MEM_cnt_6, zeta_cnt_6, switch_6 = Controller(2, switch_6, en_6, MEM_cnt_6, zeta_cnt_6)

        if(cnt >= 126 and cnt < 255):
            en_7 = 1
        else:
            en_7 = 0
        MEM_cnt_7, zeta_cnt_7, switch_7 = Controller(1, switch_7, en_7, MEM_cnt_7, zeta_cnt_7)
        
        
       
        
        
        
        
        headers = [
        '{:^5}'.format(str(cnt)),
        '{:^15}'.format(str(out_u_0)), '{:^15}'.format(str(out_d_0)),
        '{:^15}'.format(str(out_u_1)), '{:^15}'.format(str(out_d_1)),
        '{:^15}'.format(str(out_u_2)), '{:^15}'.format(str(out_d_2)),
        '{:^15}'.format(str(out_u_3)), '{:^15}'.format(str(out_d_3)),
        '{:^15}'.format(str(out_u_4)), '{:^15}'.format(str(out_d_4)),
        '{:^15}'.format(str(out_u_5)), '{:^15}'.format(str(out_d_5)),
        '{:^15}'.format(str(out_u_6)), '{:^15}'.format(str(out_d_6)),
        '{:^15}'.format(str(out_u_7)), '{:^15}'.format(str(out_d_7))
        ]
        # headers = [
        # '{:^5}'.format(str(cnt)),
        # '{:^15}'.format(str(MEM_u_out_1)), '{:^15}'.format(str(MEM_d_out_1)),
        # '{:^15}'.format(str(MEM_u_out_2)), '{:^15}'.format(str(MEM_d_out_2)),
        # '{:^15}'.format(str(MEM_u_out_3)), '{:^15}'.format(str(MEM_d_out_3)),
        # '{:^15}'.format(str(MEM_u_out_4)), '{:^15}'.format(str(MEM_d_out_4)),
        # '{:^15}'.format(str(MEM_u_out_5)), '{:^15}'.format(str(MEM_d_out_5)),
        # '{:^15}'.format(str(MEM_u_out_6)), '{:^15}'.format(str(MEM_d_out_6)),
        # '{:^15}'.format(str(MEM_u_out_7)), '{:^15}'.format(str(MEM_d_out_7))
        # ]
        header_line = ''.join(headers) + '\n'

        with open("NTT_timing_gold.txt", "a") as file:
            file.write(header_line)

    en = 0






s1 = [[-1, 1, 1, 2, 2, 1, 1, -1, 2, 1, 2, 0, 1, 0, 0, 1, -2, -1, 0, 0, 0, -2, 
-2, -2, -1, -1, 1, 1, 2, -2, 2, -1, -2, -2, 0, -2, 2, -2, 0, -2, -1, 2, -2, 1, -1, -2, -1, 0, 0, 0, 1, 0, 0, -2, 2, -2, 2, 1, 0, -1, -2, 1, 0, 1, 
2, -2, 0, 2, 2, 1, 2, -2, 0, -1, -2, 0, 2, -1, 2, 2, 0, 0, 2, 0, -2, 1, 1, 0, 0, 0, -1, -1, -1, 2, -2, 1, 2, 2, 0, 0, -2, 0, 0, 0, 2, -2, -2, -1, 
2, 2, -2, 2, -1, 1, 0, 2, 2, 2, 1, 1, -1, 1, 0, -2, 0, 2, 1, 0, -1, -1, -1, 0, 2, -1, 2, -2, 1, 2, -1, 2, -2, -2, -1, 2, 0, -1, -1, -2, -1, -1, 0, 1, -2, 2, -1, -1, -2, 0, -1, 2, 2, -2, -2, -2, -2, 0, 1, -2, 0, 0, 1, -2, -1, 0, 2, -1, -2, -2, 1, 2, 1, 0, 0, 2, 2, 0, -2, 0, 2, -2, -2, -2, -1, 0, 0, -1, 0, 0, -2, 1, -2, 2, -1, -2, -1, -1, -2, 1, 2, 2, 0, 0, -1, 0, 
2, 1, -2, 0, 2, -2, 1, 2, 0, -2, 2, 2, 1, 2, -1, 2, 0, 2, -1, 2, 1, -1, 1, -2, 1, -2, 2, 0, -2, 2, 0, 0, 0, -1, 1, 0, 2, 2, -2, 0, -1, 0], [2, -2, 1, 2, -2, 0, 2, 1, 1, -1, -2, -1, -2, -2, 2, -1, 0, 2, 1, 0, 1, 2, 2, 2, -2, -2, -2, 2, -2, -2, 0, -2, 1, 2, 0, -1, -2, 2, -1, 0, 0, 2, -2, -1, 0, 0, 2, -1, 0, -1, -2, 1, 1, -2, -2, 0, 2, -2, 0, -1, 2, -2, 0, 0, 0, 1, 
-1, -1, -2, -2, 0, -2, 2, 0, 1, 1, 2, -1, 0, -1, -2, 0, 0, 0, -2, -2, -1, -1, 1, 2, -1, -1, 1, 1, -1, -1, -2, 1, 2, 0, -2, 2, 0, -2, -2, 0, 2, -2, -1, -2, 0, -1, 1, -1, -1, 2, 2, -1, -1, 1, 0, -2, 1, 0, 0, 2, -1, 1, -1, 2, 0, -2, -2, -2, 2, -1, -2, -1, -2, 1, -1, -2, -2, 0, -1, -2, -2, 0, -1, 0, -2, 2, 1, 0, -2, 0, 0, 1, 0, 0, -2, -2, -1, 2, -1, -2, -1, -2, -2, 0, 2, 0, -2, -1, -1, -1, -1, -1, 1, 1, -1, 0, -2, -2, 1, -1, -2, 1, -2, -1, 2, 1, -1, 0, 1, 2, 1, -2, 2, 1, -1, 0, 1, 2, -2, 0, 0, -1, 1, 1, -1, -1, -1, 2, -2, -1, -1, 2, 1, 2, -1, 1, -1, 0, 2, 1, -2, 2, 1, 1, -1, 0, -1, -2, -1, -1, 0, -1, 0, -2, 0, 2, 2, 0, 2, 2, 0, 2, 2, -1, 0, 2, 1, -2, 2, -1], [-1, -1, 1, 2, 2, 1, 0, -1, -1, -2, -1, 1, -1, -1, 1, 1, 0, 1, 2, 2, -1, -1, -1, 0, 2, 1, -1, 1, 1, -2, 1, -2, 1, 1, -2, -2, -1, -1, 0, -1, 
-1, 1, 1, -2, 2, -2, -1, 2, 2, 0, 1, 1, 0, 1, -2, -1, 0, 2, -2, 2, -2, 0, 2, 1, 1, 1, -2, 0, 0, 1, 2, 1, -1, -1, -1, -2, 1, 2, -2, -1, 2, 0, 2, -2, -1, 0, 2, 2, -2, -2, 2, 2, 0, -1, 1, 0, 1, -1, 1, -2, 1, 2, -1, -2, -2, 2, 0, 0, -1, -2, 1, -1, -1, 1, -2, 0, 0, -1, 0, 2, 0, 0, -2, -2, -1, -1, 0, 1, 1, 0, -2, -2, 0, 1, -1, -2, 1, 0, 2, 0, 0, 1, -1, -2, 2, -1, -2, 2, 1, 2, -1, -1, 2, -1, -2, 0, -1, 1, -2, -1, 1, 0, 1, 1, -2, -1, 2, -2, 2, -2, -1, -2, -2, -2, 1, 0, -1, -1, 0, -2, -2, 2, 1, 2, 2, 2, 0, 0, 2, 0, 0, 2, -2, 0, 2, -2, -1, -2, 1, 0, 2, 0, -2, -1, 2, -1, -2, -1, -1, -1, -2, -2, 1, -1, -2, 0, 1, 2, 1, -2, 1, 1, -2, 1, 2, 1, 1, 2, -1, -1, -2, -1, 0, 0, -1, -2, 2, 2, -1, -1, 2, -1, 1, 2, 2, -1, 1, 0, 2, -2, -2, -1, 0, -1, -2, -1], [0, 2, 1, 0, 1, -1, 0, -2, -2, -1, 0, 2, 0, -2, 2, -2, -2, 
-2, -2, -2, -1, 1, 1, 0, -2, -2, 2, 1, 0, -2, 2, 1, -2, -1, -1, -1, 2, 0, 1, -2, 1, 2, -2, 2, 2, -2, -1, -1, -1, -2, -1, 1, 2, 2, -2, 1, -1, -2, -1, -2, 1, -1, 1, 0, -2, 2, 1, 2, 0, 2, 2, -1, 0, 1, -1, 0, -1, 0, 0, 0, 1, 2, 2, 2, -2, 2, -1, 2, 0, 1, -2, 0, -2, 1, -1, 2, 0, 0, 2, -1, 2, -2, -2, 0, -1, 0, 1, -2, 2, -1, -1, -2, -2, -2, -1, -1, -2, 1, -2, 2, -1, 2, 1, -1, 2, 1, -2, -2, 0, -1, -1, -2, -1, 1, -1, 1, 2, 0, 1, 0, -1, 1, -1, -1, -1, 2, -2, -1, -2, 0, 2, -1, -2, 0, 0, -2, 2, 1, 2, 2, 0, 2, -2, -1, 1, 1, -1, -2, 0, -2, 1, -2, 2, 1, 1, 1, -1, 0, 0, 1, -1, 2, -2, -2, -1, -2, 1, 1, 2, 1, 2, -2, 0, 1, 2, -2, -2, -1, 2, 0, 1, 1, -2, -2, 2, 1, -1, -2, 2, -2, -2, -1, -2, 0, 1, 2, -2, 2, -2, 1, -1, 0, 0, 0, -1, -1, 2, 1, 2, 1, 2, -2, 2, 1, 1, 2, 1, 1, -2, 0, -1, -2, 1, 2, 2, 1, 0, 1, -1, 1, 1, 
-2, 2, 0, -1, 1]]

NTT(s1[0])

