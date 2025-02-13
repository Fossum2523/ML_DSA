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

    t = (-1 * zeta) % ML_DSA["q"]
    out_a = (a + b) % ML_DSA["q"]
    out_b = (a - b) % ML_DSA["q"]
    out_b = out_b * t % ML_DSA["q"]

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
    MEM_zeta_1 = MEM_zeta_1[::-1]
    MEM_zeta_2 = zeta_list[4:8]
    MEM_zeta_2 = MEM_zeta_2[::-1]
    MEM_zeta_3 = zeta_list[8:16]
    MEM_zeta_3 = MEM_zeta_3[::-1]
    MEM_zeta_4 = zeta_list[16:32]
    MEM_zeta_4 = MEM_zeta_4[::-1]
    MEM_zeta_5 = zeta_list[32:64]
    MEM_zeta_5 = MEM_zeta_5[::-1]
    MEM_zeta_6 = zeta_list[64:128]
    MEM_zeta_6 = MEM_zeta_6[::-1]
    MEM_zeta_7 = zeta_list[128:256]
    MEM_zeta_7 = MEM_zeta_7[::-1]
            
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

    zeta_cnt_1 = 0
    zeta_cnt_2 = 0
    zeta_cnt_3 = 0
    zeta_cnt_4 = 0
    zeta_cnt_5 = 0
    zeta_cnt_6 = 0
    zeta_cnt_7 = 0

    en_1 = 0
    en_2 = 0
    en_3 = 0
    en_4 = 0
    en_5 = 0
    en_6 = 0 
    en_7 = 0

    if os.path.exists("INTT_timing_gold.txt"):
        os.remove("INTT_timing_gold.txt")

    headers = [
        '{:^5}'.format(""),
        '{:^15}'.format("out_0_u"), '{:^15}'.format("out_0_d"),
        '{:^15}'.format("out_1_u"), '{:^15}'.format("out_1_d"),
        '{:^15}'.format("out_2_u"), '{:^15}'.format("out_2_d"),
        '{:^15}'.format("out_3_u"), '{:^15}'.format("out_3_d"),
        '{:^15}'.format("out_4_u"), '{:^15}'.format("out_4_d"),
        '{:^15}'.format("out_5_u"), '{:^15}'.format("out_5_d"),
        '{:^15}'.format("out_6_u"), '{:^15}'.format("out_6_d"),
        '{:^15}'.format("out_7_u"), '{:^15}'.format("out_7_d")
    ]

    header_line = ''.join(headers) + '\n'

    with open("INTT_timing_gold.txt", "a") as file:
        file.write(header_line)

    en = 1
    for cnt in range(256):
        ### stage en control ###
        
        if(cnt < 128):
            NTT_in_u = NTT_in[cnt * 2]
            NTT_in_d = NTT_in[cnt * 2 + 1]
        else:
            NTT_in_u = 0
            NTT_in_d = 0

        # stage 7 
        if(cnt < 129):
            en_7 = 1
        else:
            en_7 = 0
        out_u_7, out_d_7 = BU(NTT_in_u, NTT_in_d,  MEM_zeta_7, zeta_cnt_7)
        MEM_u_out_7, MEM_d_out_7, MEM_u_7, MEM_d_7 = RU(switch_7, out_u_7, out_d_7, MEM_u_7, MEM_d_7, MEM_cnt_7)
        MEM_cnt_7, zeta_cnt_7, switch_7 = Controller(1, switch_7, en_7, MEM_cnt_7, zeta_cnt_7)
        
        # stage 6 
        if(cnt >= 1 and cnt < 131):
            en_6 = 1
            # print(cnt)
        else:
            en_6 = 0
        out_u_6, out_d_6 = BU(MEM_u_out_7, MEM_d_out_7,  MEM_zeta_6, zeta_cnt_6)
        MEM_u_out_6, MEM_d_out_6, MEM_u_6, MEM_d_6 = RU(switch_6, out_u_6, out_d_6, MEM_u_6, MEM_d_6, MEM_cnt_6)
        MEM_cnt_6, zeta_cnt_6, switch_6 = Controller(2, switch_6, en_6, MEM_cnt_6, zeta_cnt_6)
        

        # stage 5
        if(cnt >= 3 and cnt < 135):
            en_5 = 1
            print(cnt)
        else:
            en_5 = 0
        out_u_5, out_d_5 = BU(MEM_u_out_6, MEM_d_out_6,  MEM_zeta_5, zeta_cnt_5)
        MEM_u_out_5, MEM_d_out_5, MEM_u_5, MEM_d_5 = RU(switch_5, out_u_5, out_d_5, MEM_u_5, MEM_d_5, MEM_cnt_5)
        MEM_cnt_5, zeta_cnt_5, switch_5 = Controller(4, switch_5, en_5, MEM_cnt_5, zeta_cnt_5)

        # stage 4 
        if(cnt >= 7 and cnt < 143):
            en_4 = 1
        else:
            en_4 = 0
        out_u_4, out_d_4 = BU(MEM_u_out_5, MEM_d_out_5,  MEM_zeta_4, zeta_cnt_4)
        MEM_u_out_4, MEM_d_out_4, MEM_u_4, MEM_d_4 = RU(switch_4, out_u_4, out_d_4, MEM_u_4, MEM_d_4, MEM_cnt_4)
        MEM_cnt_4, zeta_cnt_4, switch_4 = Controller(8, switch_4, en_4, MEM_cnt_4, zeta_cnt_4)

        # stage 3 
        if(cnt >= 15 and cnt < 159):
            en_3 = 1
        else:
            en_3 = 0
        out_u_3, out_d_3 = BU(MEM_u_out_4, MEM_d_out_4,  MEM_zeta_3, zeta_cnt_3)
        MEM_u_out_3, MEM_d_out_3, MEM_u_3, MEM_d_3 = RU(switch_3, out_u_3, out_d_3, MEM_u_3, MEM_d_3, MEM_cnt_3)
        MEM_cnt_3, zeta_cnt_3, switch_3 = Controller(16, switch_3, en_3, MEM_cnt_3, zeta_cnt_3)

        # stage 2 
        if(cnt >= 31 and cnt < 191):
            en_2 = 1
        else:
            en_2 = 0
        out_u_2, out_d_2 = BU(MEM_u_out_3, MEM_d_out_3,  MEM_zeta_2, zeta_cnt_2)
        MEM_u_out_2, MEM_d_out_2, MEM_u_2, MEM_d_2 = RU(switch_2, out_u_2, out_d_2, MEM_u_2, MEM_d_2, MEM_cnt_2)
        MEM_cnt_2, zeta_cnt_2, switch_2 = Controller(32, switch_2, en_2, MEM_cnt_2, zeta_cnt_2)

        # stage 1 
        if(cnt >= 63 and cnt < 255):
            en_1 = 1
        else:
            en_1 = 0
        out_u_1, out_d_1 = BU(MEM_u_out_2, MEM_d_out_2,  MEM_zeta_1, zeta_cnt_1)
        MEM_u_out_1, MEM_d_out_1, MEM_u_1, MEM_d_1 = RU(switch_1, out_u_1, out_d_1, MEM_u_1, MEM_d_1, MEM_cnt_1)
        MEM_cnt_1, zeta_cnt_1, switch_1 = Controller(64, switch_1, en_1, MEM_cnt_1, zeta_cnt_1)

        # stage 0
        out_u_0, out_d_0 = BU(MEM_u_out_1, MEM_d_out_1,  MEM_zeta_0, None)

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

        header_line = ''.join(headers) + '\n'

        with open("INTT_timing_gold.txt", "a") as file:
            file.write(header_line)

    en = 0






s1_hat_0 = [827366, 2588109, 3064700, 4932982, 7302014, 4967869, 8034231, 2002522, 3722826, 863090, 3627007, 3402640, 4405784, 6090595, 520593, 6803952, 7131065, 2880130, 2471730, 6942673, 5823451, 1703234, 7900822, 6052608, 5088729, 2506708, 2154779, 7026982, 5907172, 6378886, 7624205, 1628917, 5079753, 3700730, 3865869, 3743419, 2472847, 7432328, 3961305, 3326651, 699932, 4086558, 5932973, 2498999, 3496203, 3654048, 7721304, 2791826, 2758379, 6722804, 3432582, 691503, 8280111, 8288420, 6503098, 1381276, 2799840, 4134574, 895474, 1010095, 4423601, 371060, 111383, 1725331, 6024848, 3659006, 4476381, 7517617, 3584500, 405093, 5461888, 4792021, 4933889, 593568, 144498, 7561479, 7694225, 1565266, 928295, 4637432, 7941281, 1413139, 6701142, 1345227, 8261841, 6125869, 2931292, 466955, 5183251, 7176305, 4218492, 5133842, 1181214, 6405158, 1612162, 5213194, 270395, 2717629, 1070812, 7707359, 188057, 7290511, 5552666, 5591293, 4239764, 7442320, 3296877, 6512088, 6758686, 2838141, 1597854, 1351093, 6099295, 5035869, 7472484, 6775427, 6582511, 7707516, 7126635, 2183231, 6296193, 6669252, 5389436, 2673574, 1803776, 8039530, 918738, 186557, 5751956, 3888258, 6150608, 2463814, 7770309, 7519025, 2006527, 5186718, 7077061, 270852, 1846578, 4246268, 7082543, 6095984, 4426586, 4537645, 4383845, 6617002, 2905471, 3773136, 4432157, 4107029, 3595641, 736832, 1857054, 1979672, 4698578, 1466410, 4952426, 6545169, 1121362, 1290776, 7840367, 3928914, 4246295, 2155156, 6562796, 6610773, 7643785, 655732, 6325837, 2841950, 147552, 7507499, 6538593, 197393, 1877705, 137027, 4607344, 5476704, 1855606, 2221271, 7521145, 3398446, 5192457, 3977592, 2377765, 1360102, 5579336, 3639106, 1516265, 4680654, 1039349, 4440765, 5318874, 6290968, 1082279, 3952920, 2725690, 1836747, 536189, 4516927, 7958312, 6252241, 1841779, 6970667, 5963786, 1608389, 3435051, 6233220, 7972571, 714635, 2898654, 6423177, 4639848, 2628804, 3816034, 1233647, 7018470, 3856930, 1777331, 7436295, 3205371, 7058356, 2367694, 4231146, 4319652, 1078941, 5719810, 332082, 7847079, 2450182, 3957586, 3724921, 614766, 1691784, 7118893, 6953724, 7254363, 6880217, 3656372, 1474475, 2956723, 193673, 5031747, 4300736, 5940663, 7276535, 6967820, 2051400, 3793081, 7466544, 2168270, 7466561, 7132662, 7833696, 1797616, 5504385]

NTT(s1_hat_0)

