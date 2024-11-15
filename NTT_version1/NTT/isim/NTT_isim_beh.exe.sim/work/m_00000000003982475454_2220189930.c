/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/fossu/Desktop/NTT/NTT/rom.v";
static int ng1[] = {779384948, 0, 1702125939, 0, 1414803322, 0, 1414803278, 0, 1869623118, 0, 1702062964, 0, 1937059652, 0, 795242355, 0, 1936028275, 0, 1127886677, 0};
static int ng2[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static int ng3[] = {0, 0};
static int ng4[] = {1, 0};



static void Always_10_0(char *t0)
{
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 3416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(10, ng0);
    t2 = (t0 + 3984);
    *((int *)t2) = 1;
    t3 = (t0 + 3448);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(10, ng0);

LAB5:    xsi_set_current_line(11, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(11, ng0);

LAB9:    xsi_set_current_line(12, ng0);
    t11 = (t0 + 2336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t0 + 2336);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 2336);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t21 = (t0 + 1776U);
    t22 = *((char **)t21);
    xsi_vlog_generic_get_array_select_value(t14, 23, t13, t17, t20, 2, 1, t22, 8, 2);
    t21 = (t0 + 2176);
    xsi_vlogvar_wait_assign_value(t21, t14, 0, 0, 23, 0LL);
    goto LAB8;

}

static void Initial_18_1(char *t0)
{
    char t3[80];
    char t12[8];
    char t15[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    int t28;
    char *t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    int t36;

LAB0:    xsi_set_current_line(18, ng0);

LAB2:    xsi_set_current_line(19, ng0);
    t1 = ((char*)((ng1)));
    t2 = ((char*)((ng2)));
    xsi_vlog_unsigned_not_equal(t3, 320, t1, 320, t2, 320);
    t4 = (t3 + 4);
    t5 = *((unsigned int *)t4);
    t6 = (~(t5));
    t7 = *((unsigned int *)t3);
    t8 = (t7 & t6);
    t9 = (t8 != 0);
    if (t9 > 0)
        goto LAB3;

LAB4:    xsi_set_current_line(21, ng0);

LAB7:    xsi_set_current_line(22, ng0);
    xsi_set_current_line(22, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 2496);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB8:    t1 = (t0 + 2496);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t10 = (t0 + 608);
    t11 = *((char **)t10);
    memset(t12, 0, 8);
    xsi_vlog_signed_less(t12, 32, t4, 32, t11, 32);
    t10 = (t12 + 4);
    t5 = *((unsigned int *)t10);
    t6 = (~(t5));
    t7 = *((unsigned int *)t12);
    t8 = (t7 & t6);
    t9 = (t8 != 0);
    if (t9 > 0)
        goto LAB9;

LAB10:
LAB5:
LAB1:    return;
LAB3:    xsi_set_current_line(19, ng0);

LAB6:    xsi_set_current_line(20, ng0);
    t10 = ((char*)((ng1)));
    t11 = (t0 + 2336);
    xsi_vlogfile_readmemh(t10, 320, t11, 0, 0, 0, 0);
    goto LAB5;

LAB9:    xsi_set_current_line(23, ng0);
    t13 = ((char*)((ng3)));
    t14 = (t0 + 2336);
    t17 = (t0 + 2336);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 2336);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 2496);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_convert_array_indices(t15, t16, t19, t22, 2, 1, t25, 32, 1);
    t26 = (t15 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (!(t27));
    t29 = (t16 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB11;

LAB12:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 2496);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t10 = ((char*)((ng4)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t4, 32, t10, 32);
    t11 = (t0 + 2496);
    xsi_vlogvar_assign_value(t11, t12, 0, 0, 32);
    goto LAB8;

LAB11:    t33 = *((unsigned int *)t15);
    t34 = *((unsigned int *)t16);
    t35 = (t33 - t34);
    t36 = (t35 + 1);
    xsi_vlogvar_assign_value(t14, t13, 0, *((unsigned int *)t16), t36);
    goto LAB12;

}


extern void work_m_00000000003982475454_2220189930_init()
{
	static char *pe[] = {(void *)Always_10_0,(void *)Initial_18_1};
	xsi_register_didat("work_m_00000000003982475454_2220189930", "isim/NTT_isim_beh.exe.sim/work/m_00000000003982475454_2220189930.didat");
	xsi_register_executes(pe);
}
