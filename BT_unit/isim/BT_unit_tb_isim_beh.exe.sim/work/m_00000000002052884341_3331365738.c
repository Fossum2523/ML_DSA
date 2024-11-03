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
static const char *ng0 = "C:/Users/fossu/Desktop/ML_DSA_Syn/BT_unit/BT_unit.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {7681U, 0U};



static void Cont_44_0(char *t0)
{
    char t4[8];
    char t24[8];
    char t40[8];
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
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    int t64;
    int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;

LAB0:    t1 = (t0 + 4264U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1504U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB7;

LAB4:    if (t16 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t4) = 1;

LAB7:    t20 = (t0 + 2864);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = ((char*)((ng2)));
    memset(t24, 0, 8);
    t25 = (t22 + 4);
    t26 = (t23 + 4);
    t27 = *((unsigned int *)t22);
    t28 = *((unsigned int *)t23);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t25);
    t31 = *((unsigned int *)t26);
    t32 = (t30 ^ t31);
    t33 = (t29 | t32);
    t34 = *((unsigned int *)t25);
    t35 = *((unsigned int *)t26);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB11;

LAB8:    if (t36 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t24) = 1;

LAB11:    t41 = *((unsigned int *)t4);
    t42 = *((unsigned int *)t24);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t44 = (t4 + 4);
    t45 = (t24 + 4);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t44);
    t48 = *((unsigned int *)t45);
    t49 = (t47 | t48);
    *((unsigned int *)t46) = t49;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB12;

LAB13:
LAB14:    t72 = (t0 + 5456);
    t73 = (t72 + 56U);
    t74 = *((char **)t73);
    t75 = (t74 + 56U);
    t76 = *((char **)t75);
    memset(t76, 0, 8);
    t77 = 1U;
    t78 = t77;
    t79 = (t40 + 4);
    t80 = *((unsigned int *)t40);
    t77 = (t77 & t80);
    t81 = *((unsigned int *)t79);
    t78 = (t78 & t81);
    t82 = (t76 + 4);
    t83 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t83 | t77);
    t84 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t84 | t78);
    xsi_driver_vfirst_trans(t72, 0, 0);
    t85 = (t0 + 5328);
    *((int *)t85) = 1;

LAB1:    return;
LAB6:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB7;

LAB10:    t39 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB11;

LAB12:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t40) = (t52 | t53);
    t54 = (t4 + 4);
    t55 = (t24 + 4);
    t56 = *((unsigned int *)t4);
    t57 = (~(t56));
    t58 = *((unsigned int *)t54);
    t59 = (~(t58));
    t60 = *((unsigned int *)t24);
    t61 = (~(t60));
    t62 = *((unsigned int *)t55);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t68 & t66);
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB14;

}

static void Always_46_1(char *t0)
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

LAB0:    t1 = (t0 + 4512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 5344);
    *((int *)t2) = 1;
    t3 = (t0 + 4544);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(46, ng0);

LAB5:    xsi_set_current_line(47, ng0);
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

LAB11:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2144U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB14;

LAB15:
LAB16:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(47, ng0);

LAB13:    xsi_set_current_line(48, ng0);
    t19 = ((char*)((ng2)));
    t20 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 2, 0LL);
    goto LAB12;

LAB14:    xsi_set_current_line(50, ng0);

LAB17:    xsi_set_current_line(51, ng0);
    t5 = (t0 + 3184);
    t6 = (t5 + 56U);
    t12 = *((char **)t6);
    t13 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 2, 0LL);
    goto LAB16;

}

static void Always_55_2(char *t0)
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

LAB0:    t1 = (t0 + 4760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 5360);
    *((int *)t2) = 1;
    t3 = (t0 + 4792);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng0);

LAB5:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 3024);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng1)));
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
LAB15:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(57, ng0);

LAB18:    xsi_set_current_line(58, ng0);
    t9 = ((char*)((ng1)));
    t10 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 2, 0LL);
    goto LAB17;

LAB9:    xsi_set_current_line(60, ng0);

LAB19:    xsi_set_current_line(61, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 2, 0LL);
    goto LAB17;

LAB11:    xsi_set_current_line(63, ng0);

LAB20:    xsi_set_current_line(64, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 2, 0LL);
    goto LAB17;

LAB13:    xsi_set_current_line(66, ng0);

LAB21:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 3184);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    goto LAB17;

}

static void Always_74_3(char *t0)
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
    int t21;
    char *t22;

LAB0:    t1 = (t0 + 5008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 5376);
    *((int *)t2) = 1;
    t3 = (t0 + 5040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(74, ng0);

LAB5:    xsi_set_current_line(75, ng0);
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

LAB11:
LAB12:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2144U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB14;

LAB15:
LAB16:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(75, ng0);

LAB13:    xsi_set_current_line(76, ng0);
    t19 = ((char*)((ng2)));
    t20 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 23, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 23, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB14:    xsi_set_current_line(80, ng0);

LAB17:    xsi_set_current_line(81, ng0);
    t5 = (t0 + 3024);
    t6 = (t5 + 56U);
    t12 = *((char **)t6);

LAB18:    t13 = ((char*)((ng2)));
    t21 = xsi_vlog_unsigned_case_compare(t12, 2, t13, 2);
    if (t21 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng1)));
    t21 = xsi_vlog_unsigned_case_compare(t12, 2, t2, 2);
    if (t21 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng3)));
    t21 = xsi_vlog_unsigned_case_compare(t12, 2, t2, 2);
    if (t21 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng4)));
    t21 = xsi_vlog_unsigned_case_compare(t12, 2, t2, 2);
    if (t21 == 1)
        goto LAB25;

LAB26:
LAB28:
LAB27:    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB29:    goto LAB16;

LAB19:    xsi_set_current_line(82, ng0);

LAB30:    xsi_set_current_line(83, ng0);
    t19 = (t0 + 1824U);
    t20 = *((char **)t19);
    t19 = (t0 + 1984U);
    t22 = *((char **)t19);
    memset(t4, 0, 8);
    xsi_vlog_signed_multiply(t4, 23, t20, 23, t22, 23);
    t19 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 23, 0LL);
    goto LAB29;

LAB21:    xsi_set_current_line(85, ng0);

LAB31:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 2704);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t13 = ((char*)((ng5)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_mod(t4, 23, t6, 23, t13, 23);
    t19 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 23, 0LL);
    goto LAB29;

LAB23:    xsi_set_current_line(88, ng0);

LAB32:    xsi_set_current_line(89, ng0);
    t3 = (t0 + 1664U);
    t5 = *((char **)t3);
    t3 = (t0 + 2704);
    t6 = (t3 + 56U);
    t13 = *((char **)t6);
    memset(t4, 0, 8);
    xsi_vlog_signed_add(t4, 23, t5, 23, t13, 23);
    t19 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 23, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1664U);
    t3 = *((char **)t2);
    t2 = (t0 + 2704);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    xsi_vlog_signed_minus(t4, 23, t3, 23, t6, 23);
    t13 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 23, 0LL);
    goto LAB29;

LAB25:    xsi_set_current_line(92, ng0);

LAB33:    xsi_set_current_line(93, ng0);
    t3 = (t0 + 2544);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t13 = ((char*)((ng5)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_mod(t4, 23, t6, 23, t13, 23);
    t19 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 23, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2704);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng5)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_mod(t4, 23, t5, 23, t6, 23);
    t13 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 23, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB29;

}


extern void work_m_00000000002052884341_3331365738_init()
{
	static char *pe[] = {(void *)Cont_44_0,(void *)Always_46_1,(void *)Always_55_2,(void *)Always_74_3};
	xsi_register_didat("work_m_00000000002052884341_3331365738", "isim/BT_unit_tb_isim_beh.exe.sim/work/m_00000000002052884341_3331365738.didat");
	xsi_register_executes(pe);
}
