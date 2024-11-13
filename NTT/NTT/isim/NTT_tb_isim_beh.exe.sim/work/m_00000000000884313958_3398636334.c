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
static const char *ng0 = "C:/Users/USER/Desktop/ML_DSA_syn/NTT/NTT/NTT.v";
static int ng1[] = {0, 0};



static int sp_mod_add(char *t1, char *t2)
{
    char t9[8];
    char t12[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;

LAB0:    t0 = 1;
    xsi_set_current_line(19, ng0);

LAB2:    xsi_set_current_line(20, ng0);
    t3 = (t1 + 4136);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t1 + 4296);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t5, 13, t8, 13);
    t10 = (t1 + 608);
    t11 = *((char **)t10);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_mod(t12, 32, t9, 32, t11, 32);
    t10 = (t1 + 3976);
    xsi_vlogvar_assign_value(t10, t12, 0, 0, 13);
    t0 = 0;

LAB1:    return t0;
}

static int sp_mod_sub(char *t1, char *t2)
{
    char t3[8];
    char t4[8];
    char t11[8];
    char t32[8];
    char t41[8];
    char t45[8];
    int t0;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    char *t46;

LAB0:    t0 = 1;
    xsi_set_current_line(27, ng0);

LAB2:    xsi_set_current_line(28, ng0);
    t5 = (t1 + 4616);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t1 + 4776);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memset(t11, 0, 8);
    t12 = (t7 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB4;

LAB3:    t13 = (t10 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB4;

LAB7:    if (*((unsigned int *)t7) < *((unsigned int *)t10))
        goto LAB6;

LAB5:    *((unsigned int *)t11) = 1;

LAB6:    memset(t4, 0, 8);
    t15 = (t11 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t11);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB11:    t22 = (t4 + 4);
    t23 = *((unsigned int *)t4);
    t24 = *((unsigned int *)t22);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB12;

LAB13:    t33 = *((unsigned int *)t4);
    t34 = (~(t33));
    t35 = *((unsigned int *)t22);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t22) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t45, 8);

LAB20:    t46 = (t1 + 4456);
    xsi_vlogvar_assign_value(t46, t3, 0, 0, 13);
    t0 = 0;

LAB1:    return t0;
LAB4:    t14 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB6;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t21 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB11;

LAB12:    t26 = (t1 + 4616);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t1 + 4776);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memset(t32, 0, 8);
    xsi_vlog_unsigned_minus(t32, 32, t28, 13, t31, 13);
    goto LAB13;

LAB14:    t37 = (t1 + 608);
    t38 = *((char **)t37);
    t37 = (t1 + 4616);
    t39 = (t37 + 56U);
    t40 = *((char **)t39);
    memset(t41, 0, 8);
    xsi_vlog_unsigned_add(t41, 32, t38, 32, t40, 13);
    t42 = (t1 + 4776);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memset(t45, 0, 8);
    xsi_vlog_unsigned_minus(t45, 32, t41, 32, t44, 13);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t32, 32, t45, 32);
    goto LAB20;

LAB18:    memcpy(t3, t32, 8);
    goto LAB20;

}

static int sp_mod_mul(char *t1, char *t2)
{
    char t9[8];
    char t12[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;

LAB0:    t0 = 1;
    xsi_set_current_line(35, ng0);

LAB2:    xsi_set_current_line(36, ng0);
    t3 = (t1 + 5096);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t1 + 5256);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_multiply(t9, 32, t5, 13, t8, 13);
    t10 = (t1 + 608);
    t11 = *((char **)t10);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_mod(t12, 32, t9, 32, t11, 32);
    t10 = (t1 + 4936);
    xsi_vlogvar_assign_value(t10, t12, 0, 0, 13);
    t0 = 0;

LAB1:    return t0;
}

static void Always_41_0(char *t0)
{
    char t4[8];
    char t53[8];
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
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    int t49;
    char *t50;
    char *t51;
    char *t52;
    char *t54;
    char *t55;
    char *t56;
    char *t57;

LAB0:    t1 = (t0 + 6176U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 6496);
    *((int *)t2) = 1;
    t3 = (t0 + 6208);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(41, ng0);

LAB5:    xsi_set_current_line(42, ng0);
    t5 = (t0 + 2776U);
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

LAB11:    xsi_set_current_line(45, ng0);

LAB14:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2936U);
    t3 = *((char **)t2);
    t2 = (t0 + 3096U);
    t5 = *((char **)t2);
    t2 = (t0 + 3256U);
    t6 = *((char **)t2);
    t2 = (t0 + 5984);
    t12 = (t0 + 1984);
    t13 = xsi_create_subprogram_invocation(t2, 0, t0, t12, 0, 0);
    t19 = (t0 + 5096);
    xsi_vlogvar_assign_value(t19, t5, 0, 0, 13);
    t20 = (t0 + 5256);
    xsi_vlogvar_assign_value(t20, t6, 0, 0, 13);

LAB15:    t21 = (t0 + 6080);
    t22 = *((char **)t21);
    t23 = (t22 + 80U);
    t24 = *((char **)t23);
    t25 = (t24 + 272U);
    t26 = *((char **)t25);
    t27 = (t26 + 0U);
    t28 = *((char **)t27);
    t29 = ((int  (*)(char *, char *))t28)(t0, t22);
    if (t29 != 0)
        goto LAB17;

LAB16:    t22 = (t0 + 6080);
    t30 = *((char **)t22);
    t22 = (t0 + 4936);
    t31 = (t22 + 56U);
    t32 = *((char **)t31);
    memcpy(t4, t32, 8);
    t33 = (t0 + 1984);
    t34 = (t0 + 5984);
    t35 = 0;
    xsi_delete_subprogram_invocation(t33, t30, t0, t34, t35);
    t36 = (t0 + 5984);
    t37 = (t0 + 1120);
    t38 = xsi_create_subprogram_invocation(t36, 0, t0, t37, 0, 0);
    t39 = (t0 + 4136);
    xsi_vlogvar_assign_value(t39, t3, 0, 0, 13);
    t40 = (t0 + 4296);
    xsi_vlogvar_assign_value(t40, t4, 0, 0, 13);

LAB18:    t41 = (t0 + 6080);
    t42 = *((char **)t41);
    t43 = (t42 + 80U);
    t44 = *((char **)t43);
    t45 = (t44 + 272U);
    t46 = *((char **)t45);
    t47 = (t46 + 0U);
    t48 = *((char **)t47);
    t49 = ((int  (*)(char *, char *))t48)(t0, t42);
    if (t49 != 0)
        goto LAB20;

LAB19:    t42 = (t0 + 6080);
    t50 = *((char **)t42);
    t42 = (t0 + 3976);
    t51 = (t42 + 56U);
    t52 = *((char **)t51);
    memcpy(t53, t52, 8);
    t54 = (t0 + 1120);
    t55 = (t0 + 5984);
    t56 = 0;
    xsi_delete_subprogram_invocation(t54, t50, t0, t55, t56);
    t57 = (t0 + 3656);
    xsi_vlogvar_wait_assign_value(t57, t53, 0, 0, 13, 0LL);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 2936U);
    t3 = *((char **)t2);
    t2 = (t0 + 3096U);
    t5 = *((char **)t2);
    t2 = (t0 + 3256U);
    t6 = *((char **)t2);
    t2 = (t0 + 5984);
    t12 = (t0 + 1984);
    t13 = xsi_create_subprogram_invocation(t2, 0, t0, t12, 0, 0);
    t19 = (t0 + 5096);
    xsi_vlogvar_assign_value(t19, t5, 0, 0, 13);
    t20 = (t0 + 5256);
    xsi_vlogvar_assign_value(t20, t6, 0, 0, 13);

LAB21:    t21 = (t0 + 6080);
    t22 = *((char **)t21);
    t23 = (t22 + 80U);
    t24 = *((char **)t23);
    t25 = (t24 + 272U);
    t26 = *((char **)t25);
    t27 = (t26 + 0U);
    t28 = *((char **)t27);
    t29 = ((int  (*)(char *, char *))t28)(t0, t22);
    if (t29 != 0)
        goto LAB23;

LAB22:    t22 = (t0 + 6080);
    t30 = *((char **)t22);
    t22 = (t0 + 4936);
    t31 = (t22 + 56U);
    t32 = *((char **)t31);
    memcpy(t4, t32, 8);
    t33 = (t0 + 1984);
    t34 = (t0 + 5984);
    t35 = 0;
    xsi_delete_subprogram_invocation(t33, t30, t0, t34, t35);
    t36 = (t0 + 5984);
    t37 = (t0 + 1552);
    t38 = xsi_create_subprogram_invocation(t36, 0, t0, t37, 0, 0);
    t39 = (t0 + 4616);
    xsi_vlogvar_assign_value(t39, t3, 0, 0, 13);
    t40 = (t0 + 4776);
    xsi_vlogvar_assign_value(t40, t4, 0, 0, 13);

LAB24:    t41 = (t0 + 6080);
    t42 = *((char **)t41);
    t43 = (t42 + 80U);
    t44 = *((char **)t43);
    t45 = (t44 + 272U);
    t46 = *((char **)t45);
    t47 = (t46 + 0U);
    t48 = *((char **)t47);
    t49 = ((int  (*)(char *, char *))t48)(t0, t42);
    if (t49 != 0)
        goto LAB26;

LAB25:    t42 = (t0 + 6080);
    t50 = *((char **)t42);
    t42 = (t0 + 4456);
    t51 = (t42 + 56U);
    t52 = *((char **)t51);
    memcpy(t53, t52, 8);
    t54 = (t0 + 1552);
    t55 = (t0 + 5984);
    t56 = 0;
    xsi_delete_subprogram_invocation(t54, t50, t0, t55, t56);
    t57 = (t0 + 3816);
    xsi_vlogvar_wait_assign_value(t57, t53, 0, 0, 13, 0LL);

LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(42, ng0);

LAB13:    xsi_set_current_line(43, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 3656);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 13, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3816);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 13, 0LL);
    goto LAB12;

LAB17:    t21 = (t0 + 6176U);
    *((char **)t21) = &&LAB15;
    goto LAB1;

LAB20:    t41 = (t0 + 6176U);
    *((char **)t41) = &&LAB18;
    goto LAB1;

LAB23:    t21 = (t0 + 6176U);
    *((char **)t21) = &&LAB21;
    goto LAB1;

LAB26:    t41 = (t0 + 6176U);
    *((char **)t41) = &&LAB24;
    goto LAB1;

}


extern void work_m_00000000000884313958_3398636334_init()
{
	static char *pe[] = {(void *)Always_41_0};
	static char *se[] = {(void *)sp_mod_add,(void *)sp_mod_sub,(void *)sp_mod_mul};
	xsi_register_didat("work_m_00000000000884313958_3398636334", "isim/NTT_tb_isim_beh.exe.sim/work/m_00000000000884313958_3398636334.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
