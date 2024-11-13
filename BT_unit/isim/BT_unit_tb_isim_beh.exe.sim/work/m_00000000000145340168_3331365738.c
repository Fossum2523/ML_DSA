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
static const char *ng0 = "C:/Users/USER/Desktop/ML_DSA_syn/BT_unit/BT_unit.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {0U, 0U, 0U, 0U};
static unsigned int ng6[] = {7681U, 0U};
static int ng7[] = {13, 0};
static int ng8[] = {1, 0};



static void Always_42_0(char *t0)
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

LAB0:    t1 = (t0 + 4104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 4920);
    *((int *)t2) = 1;
    t3 = (t0 + 4136);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(43, ng0);
    t5 = (t0 + 1344U);
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

LAB11:    xsi_set_current_line(46, ng0);

LAB14:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 3024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 2, 0LL);

LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(43, ng0);

LAB13:    xsi_set_current_line(44, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 2, 0LL);
    goto LAB12;

}

static void Always_51_1(char *t0)
{
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

LAB0:    t1 = (t0 + 4352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 4936);
    *((int *)t2) = 1;
    t3 = (t0 + 4384);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 2864);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(53, ng0);

LAB18:    xsi_set_current_line(54, ng0);
    t9 = (t0 + 1504U);
    t10 = *((char **)t9);
    t9 = (t10 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(57, ng0);

LAB23:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB21:    goto LAB17;

LAB9:    xsi_set_current_line(61, ng0);

LAB24:    xsi_set_current_line(62, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 2, 0LL);
    goto LAB17;

LAB11:    xsi_set_current_line(64, ng0);

LAB25:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 2, 0LL);
    goto LAB17;

LAB13:    xsi_set_current_line(67, ng0);

LAB26:    xsi_set_current_line(68, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 2, 0LL);
    goto LAB17;

LAB19:    xsi_set_current_line(54, ng0);

LAB22:    xsi_set_current_line(55, ng0);
    t16 = ((char*)((ng2)));
    t17 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 2, 0LL);
    goto LAB21;

}

static void Always_75_2(char *t0)
{
    char t4[8];
    char t23[8];
    char t39[8];
    char t41[8];
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
    int t21;
    char *t22;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t40;
    char *t42;

LAB0:    t1 = (t0 + 4600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 4952);
    *((int *)t2) = 1;
    t3 = (t0 + 4632);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(75, ng0);

LAB5:    xsi_set_current_line(76, ng0);
    t5 = (t0 + 1344U);
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

LAB11:    xsi_set_current_line(82, ng0);

LAB14:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB15:    t6 = ((char*)((ng1)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 2, t6, 2);
    if (t21 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng2)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t21 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng3)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t21 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng4)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t21 == 1)
        goto LAB22;

LAB23:
LAB25:
LAB24:    xsi_set_current_line(109, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB26:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(76, ng0);

LAB13:    xsi_set_current_line(77, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 14, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 28, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB16:    xsi_set_current_line(84, ng0);

LAB27:    xsi_set_current_line(85, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 14, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 28, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1824U);
    t3 = *((char **)t2);
    t2 = (t0 + 1984U);
    t6 = *((char **)t2);
    memset(t4, 0, 8);
    xsi_vlog_signed_multiply(t4, 28, t3, 14, t6, 14);
    t2 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 28, 0LL);
    goto LAB26;

LAB18:    xsi_set_current_line(91, ng0);

LAB28:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 3184);
    t6 = (t3 + 56U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng6)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_mod(t4, 28, t12, 28, t13, 28);
    t19 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 14, 0LL);
    goto LAB26;

LAB20:    xsi_set_current_line(94, ng0);

LAB29:    xsi_set_current_line(95, ng0);
    t3 = (t0 + 1664U);
    t6 = *((char **)t3);
    t3 = (t0 + 2544);
    t12 = (t3 + 56U);
    t13 = *((char **)t12);
    memset(t4, 0, 8);
    xsi_vlog_signed_add(t4, 14, t6, 14, t13, 14);
    t19 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 14, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1664U);
    t3 = *((char **)t2);
    t2 = (t0 + 2544);
    t6 = (t2 + 56U);
    t12 = *((char **)t6);
    memset(t4, 0, 8);
    xsi_vlog_signed_minus(t4, 14, t3, 14, t12, 14);
    t13 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 14, 0LL);
    goto LAB26;

LAB22:    xsi_set_current_line(98, ng0);

LAB30:    xsi_set_current_line(99, ng0);
    t3 = (t0 + 2384);
    t6 = (t3 + 56U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng6)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_mod(t4, 14, t12, 14, t13, 14);
    t19 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 14, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2544);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 2544);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng7)));
    xsi_vlog_generic_get_index_select_value(t4, 32, t6, t19, 2, t20, 32, 1);
    t22 = ((char*)((ng8)));
    memset(t23, 0, 8);
    t24 = (t4 + 4);
    t25 = (t22 + 4);
    t7 = *((unsigned int *)t4);
    t8 = *((unsigned int *)t22);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t24);
    t11 = *((unsigned int *)t25);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t24);
    t17 = *((unsigned int *)t25);
    t18 = (t16 | t17);
    t26 = (~(t18));
    t27 = (t15 & t26);
    if (t27 != 0)
        goto LAB34;

LAB31:    if (t18 != 0)
        goto LAB33;

LAB32:    *((unsigned int *)t23) = 1;

LAB34:    t29 = (t23 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t23);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(103, ng0);

LAB39:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2544);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng6)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_mod(t4, 14, t6, 14, t12, 14);
    t13 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 14, 0LL);

LAB37:    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB26;

LAB33:    t28 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB34;

LAB35:    xsi_set_current_line(100, ng0);

LAB38:    xsi_set_current_line(101, ng0);
    t35 = (t0 + 2544);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = ((char*)((ng6)));
    memset(t39, 0, 8);
    xsi_vlog_unsigned_add(t39, 14, t37, 14, t38, 14);
    t40 = ((char*)((ng6)));
    memset(t41, 0, 8);
    xsi_vlog_unsigned_mod(t41, 14, t39, 14, t40, 14);
    t42 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t42, t41, 0, 0, 14, 0LL);
    goto LAB37;

}


extern void work_m_00000000000145340168_3331365738_init()
{
	static char *pe[] = {(void *)Always_42_0,(void *)Always_51_1,(void *)Always_75_2};
	xsi_register_didat("work_m_00000000000145340168_3331365738", "isim/BT_unit_tb_isim_beh.exe.sim/work/m_00000000000145340168_3331365738.didat");
	xsi_register_executes(pe);
}
