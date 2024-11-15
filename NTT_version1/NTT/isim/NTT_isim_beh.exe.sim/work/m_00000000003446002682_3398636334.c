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
static const char *ng0 = "C:/Users/fossu/Desktop/NTT/NTT/NTT.v";
static int ng1[] = {1, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static int ng5[] = {255, 0};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {4U, 0U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {6U, 0U};
static int ng10[] = {256, 0};
static unsigned int ng11[] = {7U, 0U};
static unsigned int ng12[] = {8U, 0U};
static unsigned int ng13[] = {9U, 0U};
static unsigned int ng14[] = {10U, 0U};
static unsigned int ng15[] = {11U, 0U};
static unsigned int ng16[] = {12U, 0U};
static unsigned int ng17[] = {13U, 0U};
static unsigned int ng18[] = {14U, 0U};
static unsigned int ng19[] = {15U, 0U};
static unsigned int ng20[] = {128U, 0U};



static void Cont_77_0(char *t0)
{
    char t9[8];
    char t10[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 8360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 7120);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7280);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = ((char*)((ng1)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_lshift(t9, 13, t7, 8, t8, 32);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 13, t4, 8, t9, 13);
    t11 = (t0 + 11136);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t15, 0, 8);
    t16 = 8191U;
    t17 = t16;
    t18 = (t10 + 4);
    t19 = *((unsigned int *)t10);
    t16 = (t16 & t19);
    t20 = *((unsigned int *)t18);
    t17 = (t17 & t20);
    t21 = (t15 + 4);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 | t16);
    t23 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t23 | t17);
    xsi_driver_vfirst_trans(t11, 0, 12);
    t24 = (t0 + 10912);
    *((int *)t24) = 1;

LAB1:    return;
}

static void Cont_78_1(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 8608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 7280);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_rshift(t6, 8, t4, 8, t5, 32);
    t7 = (t0 + 11200);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 255U;
    t13 = t12;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t14);
    t13 = (t13 & t16);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 | t12);
    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 | t13);
    xsi_driver_vfirst_trans(t7, 0, 7);
    t20 = (t0 + 10928);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Cont_80_2(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;

LAB0:    t1 = (t0 + 8856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 6800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7280);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 8, t4, 8, t7, 8);
    t9 = (t0 + 11264);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memset(t13, 0, 8);
    t14 = 255U;
    t15 = t14;
    t16 = (t8 + 4);
    t17 = *((unsigned int *)t8);
    t14 = (t14 & t17);
    t18 = *((unsigned int *)t16);
    t15 = (t15 & t18);
    t19 = (t13 + 4);
    t20 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t20 | t14);
    t21 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t21 | t15);
    xsi_driver_vfirst_trans(t9, 0, 7);
    t22 = (t0 + 10944);
    *((int *)t22) = 1;

LAB1:    return;
}

static void Cont_81_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t44[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;

LAB0:    t1 = (t0 + 9104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 6320);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t44, 8);

LAB20:    t45 = (t0 + 11328);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    t48 = (t47 + 56U);
    t49 = *((char **)t48);
    memset(t49, 0, 8);
    t50 = 255U;
    t51 = t50;
    t52 = (t3 + 4);
    t53 = *((unsigned int *)t3);
    t50 = (t50 & t53);
    t54 = *((unsigned int *)t52);
    t51 = (t51 & t54);
    t55 = (t49 + 4);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t56 | t50);
    t57 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t57 | t51);
    xsi_driver_vfirst_trans(t45, 0, 7);
    t58 = (t0 + 10960);
    *((int *)t58) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng2)));
    goto LAB13;

LAB14:    t40 = (t0 + 6800);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    t43 = ((char*)((ng3)));
    memset(t44, 0, 8);
    xsi_vlog_unsigned_add(t44, 8, t42, 8, t43, 8);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 8, t35, 8, t44, 8);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}

static void Cont_82_4(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 9352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 6960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 8, t4, 8, t5, 8);
    t7 = (t0 + 11392);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 255U;
    t13 = t12;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t14);
    t13 = (t13 & t16);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 | t12);
    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 | t13);
    xsi_driver_vfirst_trans(t7, 0, 7);
    t20 = (t0 + 10976);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Always_101_5(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 9600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 10992);
    *((int *)t2) = 1;
    t3 = (t0 + 9632);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(101, ng0);

LAB5:    xsi_set_current_line(102, ng0);
    t5 = (t0 + 3520U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 6480);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 6320);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 4, 0LL);

LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(102, ng0);
    t19 = ((char*)((ng2)));
    t20 = (t0 + 6320);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 4, 0LL);
    goto LAB12;

}

static void Always_106_6(char *t0)
{
    char t18[8];
    char t33[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    t1 = (t0 + 9848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 11008);
    *((int *)t2) = 1;
    t3 = (t0 + 9880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(106, ng0);

LAB5:    xsi_set_current_line(107, ng0);
    t4 = (t0 + 6320);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng14)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng16)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng17)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng18)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng19)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB37;

LAB38:
LAB40:
LAB39:    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB41:    goto LAB2;

LAB7:    xsi_set_current_line(108, ng0);

LAB42:    xsi_set_current_line(109, ng0);
    t9 = (t0 + 3680U);
    t10 = *((char **)t9);
    t9 = (t10 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB45:    goto LAB41;

LAB9:    xsi_set_current_line(112, ng0);

LAB46:    xsi_set_current_line(113, ng0);
    t3 = (t0 + 6800);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng5)));
    memset(t18, 0, 8);
    t9 = (t5 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t5);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t19 = (t14 ^ t15);
    t20 = (t13 | t19);
    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB50;

LAB47:    if (t23 != 0)
        goto LAB49;

LAB48:    *((unsigned int *)t18) = 1;

LAB50:    t17 = (t18 + 4);
    t26 = *((unsigned int *)t17);
    t27 = (~(t26));
    t28 = *((unsigned int *)t18);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB51;

LAB52:    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB53:    goto LAB41;

LAB11:    xsi_set_current_line(116, ng0);

LAB54:    xsi_set_current_line(117, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 6480);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB41;

LAB13:    xsi_set_current_line(119, ng0);

LAB55:    xsi_set_current_line(120, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 6480);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB41;

LAB15:    xsi_set_current_line(122, ng0);

LAB56:    xsi_set_current_line(123, ng0);
    t3 = (t0 + 6800);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 7120);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t16 = (t0 + 7280);
    t17 = (t16 + 56U);
    t31 = *((char **)t17);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 8, t10, 8, t31, 8);
    memset(t33, 0, 8);
    t32 = (t5 + 4);
    if (*((unsigned int *)t32) != 0)
        goto LAB58;

LAB57:    t34 = (t18 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB58;

LAB61:    if (*((unsigned int *)t5) < *((unsigned int *)t18))
        goto LAB59;

LAB60:    t36 = (t33 + 4);
    t11 = *((unsigned int *)t36);
    t12 = (~(t11));
    t13 = *((unsigned int *)t33);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 6480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB64:    goto LAB41;

LAB17:    xsi_set_current_line(127, ng0);

LAB65:    xsi_set_current_line(128, ng0);
    t3 = (t0 + 4640U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng10)));
    memset(t18, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB67;

LAB66:    t7 = (t3 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB67;

LAB70:    if (*((unsigned int *)t4) < *((unsigned int *)t3))
        goto LAB68;

LAB69:    t10 = (t18 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t18);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 6480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB73:    goto LAB41;

LAB19:    xsi_set_current_line(132, ng0);

LAB74:    xsi_set_current_line(133, ng0);
    t3 = (t0 + 5120U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng1)));
    memset(t18, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB76;

LAB75:    t7 = (t3 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB76;

LAB79:    if (*((unsigned int *)t4) < *((unsigned int *)t3))
        goto LAB78;

LAB77:    *((unsigned int *)t18) = 1;

LAB78:    t10 = (t18 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t18);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB80;

LAB81:    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 6480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB82:    goto LAB41;

LAB21:    xsi_set_current_line(137, ng0);

LAB83:    goto LAB41;

LAB23:    xsi_set_current_line(140, ng0);

LAB84:    goto LAB41;

LAB25:    xsi_set_current_line(143, ng0);

LAB85:    goto LAB41;

LAB27:    xsi_set_current_line(146, ng0);

LAB86:    goto LAB41;

LAB29:    xsi_set_current_line(149, ng0);

LAB87:    goto LAB41;

LAB31:    xsi_set_current_line(152, ng0);

LAB88:    goto LAB41;

LAB33:    xsi_set_current_line(155, ng0);

LAB89:    goto LAB41;

LAB35:    xsi_set_current_line(158, ng0);

LAB90:    goto LAB41;

LAB37:    xsi_set_current_line(161, ng0);

LAB91:    goto LAB41;

LAB43:    xsi_set_current_line(109, ng0);
    t16 = ((char*)((ng4)));
    t17 = (t0 + 6480);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 4);
    goto LAB45;

LAB49:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB50;

LAB51:    xsi_set_current_line(113, ng0);
    t31 = ((char*)((ng6)));
    t32 = (t0 + 6480);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 4);
    goto LAB53;

LAB58:    t35 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB60;

LAB59:    *((unsigned int *)t33) = 1;
    goto LAB60;

LAB62:    xsi_set_current_line(123, ng0);
    t37 = ((char*)((ng8)));
    t38 = (t0 + 6480);
    xsi_vlogvar_assign_value(t38, t37, 0, 0, 4);
    goto LAB64;

LAB67:    t9 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB69;

LAB68:    *((unsigned int *)t18) = 1;
    goto LAB69;

LAB71:    xsi_set_current_line(128, ng0);
    t16 = ((char*)((ng7)));
    t17 = (t0 + 6480);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 4);
    goto LAB73;

LAB76:    t9 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB78;

LAB80:    xsi_set_current_line(133, ng0);
    t16 = ((char*)((ng6)));
    t17 = (t0 + 6480);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 4);
    goto LAB82;

}

static void Always_170_7(char *t0)
{
    char t11[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    int t20;
    char *t21;
    unsigned int t22;
    int t23;
    int t24;
    unsigned int t25;
    unsigned int t26;
    int t27;
    int t28;

LAB0:    t1 = (t0 + 10096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(170, ng0);
    t2 = (t0 + 11024);
    *((int *)t2) = 1;
    t3 = (t0 + 10128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(170, ng0);

LAB5:    xsi_set_current_line(171, ng0);
    t4 = (t0 + 6320);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng14)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng16)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng17)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng18)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng19)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB2;

LAB7:    xsi_set_current_line(172, ng0);

LAB40:    xsi_set_current_line(173, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 6960);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 8, 0LL);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 7280);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6800);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6160);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB39;

LAB9:    xsi_set_current_line(180, ng0);

LAB41:    xsi_set_current_line(181, ng0);
    t3 = (t0 + 3840U);
    t4 = *((char **)t3);
    t3 = (t0 + 6640);
    t5 = (t0 + 6640);
    t7 = (t5 + 72U);
    t9 = *((char **)t7);
    t10 = (t0 + 6640);
    t13 = (t10 + 64U);
    t14 = *((char **)t13);
    t15 = (t0 + 6800);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    xsi_vlog_generic_convert_array_indices(t11, t12, t9, t14, 2, 1, t17, 8, 2);
    t18 = (t11 + 4);
    t19 = *((unsigned int *)t18);
    t20 = (!(t19));
    t21 = (t12 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (!(t22));
    t24 = (t20 && t23);
    if (t24 == 1)
        goto LAB42;

LAB43:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 6800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t4, 8, t5, 8);
    t7 = (t0 + 6800);
    xsi_vlogvar_wait_assign_value(t7, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(184, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6160);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB39;

LAB11:    xsi_set_current_line(186, ng0);

LAB44:    xsi_set_current_line(187, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 8, 0LL);
    goto LAB39;

LAB13:    xsi_set_current_line(190, ng0);

LAB45:    xsi_set_current_line(191, ng0);
    t3 = (t0 + 6960);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t5, 8, t7, 8);
    t9 = (t0 + 6960);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(192, ng0);
    t2 = (t0 + 7120);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6800);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(193, ng0);
    t2 = (t0 + 4320U);
    t3 = *((char **)t2);
    t2 = (t0 + 7440);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 23, 0LL);
    goto LAB39;

LAB15:    xsi_set_current_line(195, ng0);

LAB46:    xsi_set_current_line(196, ng0);
    t3 = (t0 + 4800U);
    t4 = *((char **)t3);
    t3 = (t0 + 6640);
    t5 = (t0 + 6640);
    t7 = (t5 + 72U);
    t9 = *((char **)t7);
    t10 = (t0 + 6640);
    t13 = (t10 + 64U);
    t14 = *((char **)t13);
    t15 = (t0 + 6800);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    xsi_vlog_generic_convert_array_indices(t11, t12, t9, t14, 2, 1, t17, 8, 2);
    t18 = (t11 + 4);
    t19 = *((unsigned int *)t18);
    t20 = (!(t19));
    t21 = (t12 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (!(t22));
    t24 = (t20 && t23);
    if (t24 == 1)
        goto LAB47;

LAB48:    xsi_set_current_line(197, ng0);
    t2 = (t0 + 4960U);
    t3 = *((char **)t2);
    t2 = (t0 + 6640);
    t4 = (t0 + 6640);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t9 = (t0 + 6640);
    t10 = (t9 + 64U);
    t13 = *((char **)t10);
    t14 = (t0 + 4480U);
    t15 = *((char **)t14);
    xsi_vlog_generic_convert_array_indices(t11, t12, t7, t13, 2, 1, t15, 8, 2);
    t14 = (t11 + 4);
    t19 = *((unsigned int *)t14);
    t8 = (!(t19));
    t16 = (t12 + 4);
    t22 = *((unsigned int *)t16);
    t20 = (!(t22));
    t23 = (t8 && t20);
    if (t23 == 1)
        goto LAB49;

LAB50:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 6800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t4, 8, t5, 8);
    t7 = (t0 + 6800);
    xsi_vlogvar_wait_assign_value(t7, t11, 0, 0, 8, 0LL);
    goto LAB39;

LAB17:    xsi_set_current_line(200, ng0);

LAB51:    xsi_set_current_line(201, ng0);
    t3 = (t0 + 4640U);
    t4 = *((char **)t3);
    t3 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB39;

LAB19:    xsi_set_current_line(203, ng0);

LAB52:    xsi_set_current_line(204, ng0);
    t3 = (t0 + 5120U);
    t4 = *((char **)t3);
    t3 = (t0 + 7280);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB39;

LAB21:    xsi_set_current_line(206, ng0);

LAB53:    goto LAB39;

LAB23:    xsi_set_current_line(209, ng0);

LAB54:    goto LAB39;

LAB25:    xsi_set_current_line(212, ng0);

LAB55:    goto LAB39;

LAB27:    xsi_set_current_line(215, ng0);

LAB56:    goto LAB39;

LAB29:    xsi_set_current_line(218, ng0);

LAB57:    goto LAB39;

LAB31:    xsi_set_current_line(221, ng0);

LAB58:    goto LAB39;

LAB33:    xsi_set_current_line(224, ng0);

LAB59:    goto LAB39;

LAB35:    xsi_set_current_line(227, ng0);

LAB60:    goto LAB39;

LAB37:    xsi_set_current_line(230, ng0);

LAB61:    goto LAB39;

LAB42:    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t12);
    t27 = (t25 - t26);
    t28 = (t27 + 1);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, *((unsigned int *)t12), t28, 0LL);
    goto LAB43;

LAB47:    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t12);
    t27 = (t25 - t26);
    t28 = (t27 + 1);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, *((unsigned int *)t12), t28, 0LL);
    goto LAB48;

LAB49:    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t12);
    t24 = (t25 - t26);
    t27 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t12), t27, 0LL);
    goto LAB50;

}

static void implSig1_execute(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;

LAB0:    t1 = (t0 + 10344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 6640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 6640);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 6640);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 6800);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    xsi_vlog_generic_get_array_select_value(t5, 23, t4, t8, t11, 2, 1, t14, 8, 2);
    t15 = (t0 + 11456);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t19, 0, 8);
    t20 = 8388607U;
    t21 = t20;
    t22 = (t5 + 4);
    t23 = *((unsigned int *)t5);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 | t20);
    t27 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t27 | t21);
    xsi_driver_vfirst_trans(t15, 0, 22);
    t28 = (t0 + 11040);
    *((int *)t28) = 1;

LAB1:    return;
}

static void implSig2_execute(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;

LAB0:    t1 = (t0 + 10592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 6640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 6640);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 6640);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 4480U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 23, t4, t8, t11, 2, 1, t13, 8, 2);
    t12 = (t0 + 11520);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memset(t17, 0, 8);
    t18 = 8388607U;
    t19 = t18;
    t20 = (t5 + 4);
    t21 = *((unsigned int *)t5);
    t18 = (t18 & t21);
    t22 = *((unsigned int *)t20);
    t19 = (t19 & t22);
    t23 = (t17 + 4);
    t24 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t24 | t18);
    t25 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t25 | t19);
    xsi_driver_vfirst_trans(t12, 0, 22);
    t26 = (t0 + 11056);
    *((int *)t26) = 1;

LAB1:    return;
}


extern void work_m_00000000003446002682_3398636334_init()
{
	static char *pe[] = {(void *)Cont_77_0,(void *)Cont_78_1,(void *)Cont_80_2,(void *)Cont_81_3,(void *)Cont_82_4,(void *)Always_101_5,(void *)Always_106_6,(void *)Always_170_7,(void *)implSig1_execute,(void *)implSig2_execute};
	xsi_register_didat("work_m_00000000003446002682_3398636334", "isim/NTT_isim_beh.exe.sim/work/m_00000000003446002682_3398636334.didat");
	xsi_register_executes(pe);
}
