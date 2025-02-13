# stage 1 
        out_u_1, out_d_1 = BU(MEM_u_out_2, MEM_d_out_2,  MEM_zeta_1, zeta_cnt_1)
        MEM_u_out_1, MEM_d_out_1, MEM_u_1, MEM_d_1 = RU(switch_1, out_u_1, out_d_1, MEM_u_1, MEM_d_1, MEM_cnt_1)
        MEM_cnt_1, zeta_cnt_1, switch_1 = Controller(1, switch_1, en, MEM_cnt_1, zeta_cnt_1)

827366
2588109
-7648983
3415475
1667430

3415475
7997682
-1744507
3032740
6290248

        if(zeta_cnt_6 == 0):
            print(cnt)
            print(switch_7)
            print(MEM_u_out_7)
            print(MEM_d_out_7)
            print(MEM_zeta_6[zeta_cnt_6])
            print(out_u_6)
            print(out_d_6)