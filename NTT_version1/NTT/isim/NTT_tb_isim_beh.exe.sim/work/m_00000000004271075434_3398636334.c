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
static const char *ng0 = "C:/Users/fossu/Desktop/NTT_version1/NTT/NTT.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {2U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {9U, 0U};
static int ng5[] = {255, 0};
static unsigned int ng6[] = {3U, 0U};
static int ng7[] = {1, 0};
static unsigned int ng8[] = {4U, 0U};
static int ng9[] = {256, 0};
static unsigned int ng10[] = {5U, 0U};
static unsigned int ng11[] = {8U, 0U};
static unsigned int ng12[] = {6U, 0U};
static unsigned int ng13[] = {7U, 0U};
static unsigned int ng14[] = {10U, 0U};
static unsigned int ng15[] = {11U, 0U};
static unsigned int ng16[] = {12U, 0U};
static unsigned int ng17[] = {13U, 0U};
static unsigned int ng18[] = {14U, 0U};
static unsigned int ng19[] = {15U, 0U};
static unsigned int ng20[] = {128U, 0U};



static void Cont_76_0(char *t0)
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

LAB0:    t1 = (t0 + 8040U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 6640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7120);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 8, t4, 8, t7, 8);
    t9 = (t0 + 11080);
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
    t22 = (t0 + 10840);
    *((int *)t22) = 1;

LAB1:    return;
}

static void Cont_77_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t40[8];
    char t41[8];
    char t46[8];
    char t77[8];
    char t82[8];
    char t83[8];
    char t88[8];
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
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    char *t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;
    char *t116;
    char *t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    char *t124;
    char *t125;
    char *t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    char *t130;
    unsigned int t131;
    unsigned int t132;
    char *t133;
    unsigned int t134;
    unsigned int t135;
    char *t136;

LAB0:    t1 = (t0 + 8288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 6160);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
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

LAB19:    memcpy(t3, t40, 8);

LAB20:    t123 = (t0 + 11144);
    t124 = (t123 + 56U);
    t125 = *((char **)t124);
    t126 = (t125 + 56U);
    t127 = *((char **)t126);
    memset(t127, 0, 8);
    t128 = 255U;
    t129 = t128;
    t130 = (t3 + 4);
    t131 = *((unsigned int *)t3);
    t128 = (t128 & t131);
    t132 = *((unsigned int *)t130);
    t129 = (t129 & t132);
    t133 = (t127 + 4);
    t134 = *((unsigned int *)t127);
    *((unsigned int *)t127) = (t134 | t128);
    t135 = *((unsigned int *)t133);
    *((unsigned int *)t133) = (t135 | t129);
    xsi_driver_vfirst_trans(t123, 0, 7);
    t136 = (t0 + 10856);
    *((int *)t136) = 1;

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

LAB12:    t35 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t42 = (t0 + 6160);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = ((char*)((ng2)));
    memset(t46, 0, 8);
    t47 = (t44 + 4);
    t48 = (t45 + 4);
    t49 = *((unsigned int *)t44);
    t50 = *((unsigned int *)t45);
    t51 = (t49 ^ t50);
    t52 = *((unsigned int *)t47);
    t53 = *((unsigned int *)t48);
    t54 = (t52 ^ t53);
    t55 = (t51 | t54);
    t56 = *((unsigned int *)t47);
    t57 = *((unsigned int *)t48);
    t58 = (t56 | t57);
    t59 = (~(t58));
    t60 = (t55 & t59);
    if (t60 != 0)
        goto LAB24;

LAB21:    if (t58 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t46) = 1;

LAB24:    memset(t41, 0, 8);
    t62 = (t46 + 4);
    t63 = *((unsigned int *)t62);
    t64 = (~(t63));
    t65 = *((unsigned int *)t46);
    t66 = (t65 & t64);
    t67 = (t66 & 1U);
    if (t67 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t62) != 0)
        goto LAB27;

LAB28:    t69 = (t41 + 4);
    t70 = *((unsigned int *)t41);
    t71 = *((unsigned int *)t69);
    t72 = (t70 || t71);
    if (t72 > 0)
        goto LAB29;

LAB30:    t78 = *((unsigned int *)t41);
    t79 = (~(t78));
    t80 = *((unsigned int *)t69);
    t81 = (t79 || t80);
    if (t81 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t69) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t41) > 0)
        goto LAB35;

LAB36:    memcpy(t40, t82, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 8, t35, 8, t40, 8);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

LAB23:    t61 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t41) = 1;
    goto LAB28;

LAB27:    t68 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t68) = 1;
    goto LAB28;

LAB29:    t73 = (t0 + 6640);
    t74 = (t73 + 56U);
    t75 = *((char **)t74);
    t76 = ((char*)((ng3)));
    memset(t77, 0, 8);
    xsi_vlog_unsigned_add(t77, 8, t75, 8, t76, 8);
    goto LAB30;

LAB31:    t84 = (t0 + 6160);
    t85 = (t84 + 56U);
    t86 = *((char **)t85);
    t87 = ((char*)((ng4)));
    memset(t88, 0, 8);
    t89 = (t86 + 4);
    t90 = (t87 + 4);
    t91 = *((unsigned int *)t86);
    t92 = *((unsigned int *)t87);
    t93 = (t91 ^ t92);
    t94 = *((unsigned int *)t89);
    t95 = *((unsigned int *)t90);
    t96 = (t94 ^ t95);
    t97 = (t93 | t96);
    t98 = *((unsigned int *)t89);
    t99 = *((unsigned int *)t90);
    t100 = (t98 | t99);
    t101 = (~(t100));
    t102 = (t97 & t101);
    if (t102 != 0)
        goto LAB41;

LAB38:    if (t100 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t88) = 1;

LAB41:    memset(t83, 0, 8);
    t104 = (t88 + 4);
    t105 = *((unsigned int *)t104);
    t106 = (~(t105));
    t107 = *((unsigned int *)t88);
    t108 = (t107 & t106);
    t109 = (t108 & 1U);
    if (t109 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t104) != 0)
        goto LAB44;

LAB45:    t111 = (t83 + 4);
    t112 = *((unsigned int *)t83);
    t113 = *((unsigned int *)t111);
    t114 = (t112 || t113);
    if (t114 > 0)
        goto LAB46;

LAB47:    t118 = *((unsigned int *)t83);
    t119 = (~(t118));
    t120 = *((unsigned int *)t111);
    t121 = (t119 || t120);
    if (t121 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t111) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t83) > 0)
        goto LAB52;

LAB53:    memcpy(t82, t122, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t40, 8, t77, 8, t82, 8);
    goto LAB37;

LAB35:    memcpy(t40, t77, 8);
    goto LAB37;

LAB40:    t103 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t103) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t83) = 1;
    goto LAB45;

LAB44:    t110 = (t83 + 4);
    *((unsigned int *)t83) = 1;
    *((unsigned int *)t110) = 1;
    goto LAB45;

LAB46:    t115 = (t0 + 6640);
    t116 = (t115 + 56U);
    t117 = *((char **)t116);
    goto LAB47;

LAB48:    t122 = ((char*)((ng1)));
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t82, 8, t117, 8, t122, 8);
    goto LAB54;

LAB52:    memcpy(t82, t117, 8);
    goto LAB54;

}

static void Cont_80_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
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
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;

LAB0:    t1 = (t0 + 8536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 6160);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng4)));
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

LAB19:    memcpy(t3, t40, 8);

LAB20:    t41 = (t0 + 11208);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 1U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 10872);
    *((int *)t54) = 1;

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

LAB12:    t35 = ((char*)((ng3)));
    goto LAB13;

LAB14:    t40 = ((char*)((ng1)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t35, 1, t40, 1);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}

static void Cont_82_3(char *t0)
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

LAB0:    t1 = (t0 + 8784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 6480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 6480);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 6480);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 6640);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    xsi_vlog_generic_get_array_select_value(t5, 23, t4, t8, t11, 2, 1, t14, 8, 2);
    t15 = (t0 + 11272);
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
    t28 = (t0 + 10888);
    *((int *)t28) = 1;

LAB1:    return;
}

static void Cont_83_4(char *t0)
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

LAB0:    t1 = (t0 + 9032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 6800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 8, t4, 8, t5, 8);
    t7 = (t0 + 11336);
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
    t20 = (t0 + 10904);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Cont_84_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;

LAB0:    t1 = (t0 + 9280U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 4640U);
    t3 = *((char **)t2);
    t2 = (t0 + 11400);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 8388607U;
    t9 = t8;
    t10 = (t3 + 4);
    t11 = *((unsigned int *)t3);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t2, 0, 22);
    t16 = (t0 + 10920);
    *((int *)t16) = 1;

LAB1:    return;
}

static void Always_102_6(char *t0)
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

LAB0:    t1 = (t0 + 9528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 10936);
    *((int *)t2) = 1;
    t3 = (t0 + 9560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(102, ng0);

LAB5:    xsi_set_current_line(103, ng0);
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

LAB11:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 6320);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 6160);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 4, 0LL);

LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(103, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 6160);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 4, 0LL);
    goto LAB12;

}

static void Always_107_7(char *t0)
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

LAB0:    t1 = (t0 + 9776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 10952);
    *((int *)t2) = 1;
    t3 = (t0 + 9808);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(107, ng0);

LAB5:    xsi_set_current_line(108, ng0);
    t4 = (t0 + 6160);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng4)));
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
LAB39:    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB41:    goto LAB2;

LAB7:    xsi_set_current_line(109, ng0);

LAB42:    xsi_set_current_line(110, ng0);
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

LAB44:    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB45:    goto LAB41;

LAB9:    xsi_set_current_line(113, ng0);

LAB46:    xsi_set_current_line(114, ng0);
    t3 = (t0 + 6640);
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

LAB52:    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB53:    goto LAB41;

LAB11:    xsi_set_current_line(117, ng0);

LAB54:    xsi_set_current_line(118, ng0);
    t3 = (t0 + 7120);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng7)));
    memset(t18, 0, 8);
    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB56;

LAB55:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB56;

LAB59:    if (*((unsigned int *)t5) < *((unsigned int *)t7))
        goto LAB58;

LAB57:    *((unsigned int *)t18) = 1;

LAB58:    t17 = (t18 + 4);
    t11 = *((unsigned int *)t17);
    t12 = (~(t11));
    t13 = *((unsigned int *)t18);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB60;

LAB61:    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB62:    goto LAB41;

LAB13:    xsi_set_current_line(121, ng0);

LAB63:    xsi_set_current_line(122, ng0);
    t3 = (t0 + 6960);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng9)));
    memset(t18, 0, 8);
    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB65;

LAB64:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB65;

LAB68:    if (*((unsigned int *)t5) < *((unsigned int *)t7))
        goto LAB66;

LAB67:    t17 = (t18 + 4);
    t11 = *((unsigned int *)t17);
    t12 = (~(t11));
    t13 = *((unsigned int *)t18);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB69;

LAB70:    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 6320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB71:    goto LAB41;

LAB15:    xsi_set_current_line(125, ng0);

LAB72:    xsi_set_current_line(126, ng0);
    t3 = (t0 + 6640);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 6960);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t16 = (t0 + 7120);
    t17 = (t16 + 56U);
    t31 = *((char **)t17);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 9, t10, 9, t31, 8);
    memset(t33, 0, 8);
    t32 = (t5 + 4);
    if (*((unsigned int *)t32) != 0)
        goto LAB74;

LAB73:    t34 = (t18 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB74;

LAB77:    if (*((unsigned int *)t5) < *((unsigned int *)t18))
        goto LAB75;

LAB76:    t36 = (t33 + 4);
    t11 = *((unsigned int *)t36);
    t12 = (~(t11));
    t13 = *((unsigned int *)t33);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB78;

LAB79:    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 6320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB80:    goto LAB41;

LAB17:    xsi_set_current_line(129, ng0);

LAB81:    xsi_set_current_line(130, ng0);
    t3 = ((char*)((ng10)));
    t4 = (t0 + 6320);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB41;

LAB19:    xsi_set_current_line(132, ng0);

LAB82:    xsi_set_current_line(133, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 6320);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB41;

LAB21:    xsi_set_current_line(135, ng0);

LAB83:    xsi_set_current_line(136, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 6320);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB41;

LAB23:    xsi_set_current_line(138, ng0);

LAB84:    xsi_set_current_line(139, ng0);
    t3 = (t0 + 6640);
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
        goto LAB88;

LAB85:    if (t23 != 0)
        goto LAB87;

LAB86:    *((unsigned int *)t18) = 1;

LAB88:    t17 = (t18 + 4);
    t26 = *((unsigned int *)t17);
    t27 = (~(t26));
    t28 = *((unsigned int *)t18);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB89;

LAB90:    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB91:    goto LAB41;

LAB25:    xsi_set_current_line(142, ng0);

LAB92:    goto LAB41;

LAB27:    xsi_set_current_line(145, ng0);

LAB93:    goto LAB41;

LAB29:    xsi_set_current_line(148, ng0);

LAB94:    goto LAB41;

LAB31:    xsi_set_current_line(151, ng0);

LAB95:    goto LAB41;

LAB33:    xsi_set_current_line(154, ng0);

LAB96:    goto LAB41;

LAB35:    xsi_set_current_line(157, ng0);

LAB97:    goto LAB41;

LAB37:    xsi_set_current_line(160, ng0);

LAB98:    goto LAB41;

LAB43:    xsi_set_current_line(110, ng0);
    t16 = ((char*)((ng2)));
    t17 = (t0 + 6320);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 4);
    goto LAB45;

LAB49:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB50;

LAB51:    xsi_set_current_line(114, ng0);
    t31 = ((char*)((ng6)));
    t32 = (t0 + 6320);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 4);
    goto LAB53;

LAB56:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB58;

LAB60:    xsi_set_current_line(118, ng0);
    t31 = ((char*)((ng8)));
    t32 = (t0 + 6320);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 4);
    goto LAB62;

LAB65:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB67;

LAB66:    *((unsigned int *)t18) = 1;
    goto LAB67;

LAB69:    xsi_set_current_line(122, ng0);
    t31 = ((char*)((ng10)));
    t32 = (t0 + 6320);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 4);
    goto LAB71;

LAB74:    t35 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB76;

LAB75:    *((unsigned int *)t33) = 1;
    goto LAB76;

LAB78:    xsi_set_current_line(126, ng0);
    t37 = ((char*)((ng12)));
    t38 = (t0 + 6320);
    xsi_vlogvar_assign_value(t38, t37, 0, 0, 4);
    goto LAB80;

LAB87:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB88;

LAB89:    xsi_set_current_line(139, ng0);
    t31 = ((char*)((ng14)));
    t32 = (t0 + 6320);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 4);
    goto LAB91;

}

static void Always_169_8(char *t0)
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
    unsigned int t29;

LAB0:    t1 = (t0 + 10024U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(169, ng0);
    t2 = (t0 + 10968);
    *((int *)t2) = 1;
    t3 = (t0 + 10056);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(169, ng0);

LAB5:    xsi_set_current_line(170, ng0);
    t4 = (t0 + 6160);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng4)));
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

LAB7:    xsi_set_current_line(171, ng0);

LAB40:    xsi_set_current_line(172, ng0);
    t9 = ((char*)((ng1)));
    t10 = (t0 + 6800);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 8, 0LL);
    xsi_set_current_line(173, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6960);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 9, 0LL);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6640);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB39;

LAB9:    xsi_set_current_line(179, ng0);

LAB41:    xsi_set_current_line(180, ng0);
    t3 = (t0 + 3840U);
    t4 = *((char **)t3);
    t3 = (t0 + 6480);
    t5 = (t0 + 6480);
    t7 = (t5 + 72U);
    t9 = *((char **)t7);
    t10 = (t0 + 6480);
    t13 = (t10 + 64U);
    t14 = *((char **)t13);
    t15 = (t0 + 6640);
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

LAB43:    xsi_set_current_line(181, ng0);
    t2 = (t0 + 6640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t4, 8, t5, 8);
    t7 = (t0 + 6640);
    xsi_vlogvar_wait_assign_value(t7, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(183, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB39;

LAB11:    xsi_set_current_line(185, ng0);

LAB44:    xsi_set_current_line(186, ng0);
    t3 = (t0 + 7120);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng7)));
    memset(t11, 0, 8);
    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB46;

LAB45:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB46;

LAB49:    if (*((unsigned int *)t5) < *((unsigned int *)t7))
        goto LAB48;

LAB47:    *((unsigned int *)t11) = 1;

LAB48:    t14 = (t11 + 4);
    t19 = *((unsigned int *)t14);
    t22 = (~(t19));
    t25 = *((unsigned int *)t11);
    t26 = (t25 & t22);
    t29 = (t26 != 0);
    if (t29 > 0)
        goto LAB50;

LAB51:    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6640);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB52:    goto LAB39;

LAB13:    xsi_set_current_line(189, ng0);

LAB53:    xsi_set_current_line(190, ng0);
    t3 = (t0 + 6960);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng9)));
    memset(t11, 0, 8);
    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB55;

LAB54:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB55;

LAB58:    if (*((unsigned int *)t5) < *((unsigned int *)t7))
        goto LAB56;

LAB57:    t14 = (t11 + 4);
    t19 = *((unsigned int *)t14);
    t22 = (~(t19));
    t25 = *((unsigned int *)t11);
    t26 = (t25 & t22);
    t29 = (t26 != 0);
    if (t29 > 0)
        goto LAB59;

LAB60:
LAB61:    goto LAB39;

LAB15:    xsi_set_current_line(192, ng0);

LAB62:    goto LAB39;

LAB17:    xsi_set_current_line(195, ng0);

LAB63:    xsi_set_current_line(196, ng0);
    t3 = (t0 + 4960U);
    t4 = *((char **)t3);
    t3 = (t0 + 6480);
    t5 = (t0 + 6480);
    t7 = (t5 + 72U);
    t9 = *((char **)t7);
    t10 = (t0 + 6480);
    t13 = (t10 + 64U);
    t14 = *((char **)t13);
    t15 = (t0 + 6640);
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
        goto LAB64;

LAB65:    xsi_set_current_line(197, ng0);
    t2 = (t0 + 5120U);
    t3 = *((char **)t2);
    t2 = (t0 + 6480);
    t4 = (t0 + 6480);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t9 = (t0 + 6480);
    t10 = (t9 + 64U);
    t13 = *((char **)t10);
    t14 = (t0 + 4800U);
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
        goto LAB66;

LAB67:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 6640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t4, 8, t5, 8);
    t7 = (t0 + 6640);
    xsi_vlogvar_wait_assign_value(t7, t11, 0, 0, 8, 0LL);
    goto LAB39;

LAB19:    xsi_set_current_line(200, ng0);

LAB68:    xsi_set_current_line(201, ng0);
    t3 = (t0 + 6800);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t5, 8, t7, 8);
    t9 = (t0 + 6800);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(202, ng0);
    t2 = (t0 + 6960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7120);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    t10 = ((char*)((ng7)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_lshift(t11, 9, t9, 8, t10, 32);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_add(t12, 9, t4, 9, t11, 9);
    t13 = (t0 + 6960);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 9, 0LL);
    goto LAB39;

LAB21:    xsi_set_current_line(204, ng0);

LAB69:    xsi_set_current_line(205, ng0);
    t3 = (t0 + 7120);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng7)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_rshift(t11, 8, t5, 8, t7, 32);
    t9 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 8, 0LL);
    goto LAB39;

LAB23:    xsi_set_current_line(207, ng0);

LAB70:    xsi_set_current_line(209, ng0);
    t3 = (t0 + 6640);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t5, 8, t7, 8);
    t9 = (t0 + 6640);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 8, 0LL);
    goto LAB39;

LAB25:    xsi_set_current_line(211, ng0);

LAB71:    goto LAB39;

LAB27:    xsi_set_current_line(214, ng0);

LAB72:    goto LAB39;

LAB29:    xsi_set_current_line(217, ng0);

LAB73:    goto LAB39;

LAB31:    xsi_set_current_line(220, ng0);

LAB74:    goto LAB39;

LAB33:    xsi_set_current_line(223, ng0);

LAB75:    goto LAB39;

LAB35:    xsi_set_current_line(226, ng0);

LAB76:    goto LAB39;

LAB37:    xsi_set_current_line(229, ng0);

LAB77:    goto LAB39;

LAB42:    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t12);
    t27 = (t25 - t26);
    t28 = (t27 + 1);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, *((unsigned int *)t12), t28, 0LL);
    goto LAB43;

LAB46:    t13 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB48;

LAB50:    xsi_set_current_line(186, ng0);
    t15 = ((char*)((ng1)));
    t16 = (t0 + 6960);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 9, 0LL);
    goto LAB52;

LAB55:    t13 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB57;

LAB56:    *((unsigned int *)t11) = 1;
    goto LAB57;

LAB59:    xsi_set_current_line(190, ng0);
    t15 = (t0 + 6960);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t0 + 6640);
    xsi_vlogvar_wait_assign_value(t18, t17, 0, 0, 8, 0LL);
    goto LAB61;

LAB64:    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t12);
    t27 = (t25 - t26);
    t28 = (t27 + 1);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, *((unsigned int *)t12), t28, 0LL);
    goto LAB65;

LAB66:    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t12);
    t24 = (t25 - t26);
    t27 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t12), t27, 0LL);
    goto LAB67;

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

LAB0:    t1 = (t0 + 10272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 6480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 6480);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 6480);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 6640);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    xsi_vlog_generic_get_array_select_value(t5, 23, t4, t8, t11, 2, 1, t14, 8, 2);
    t15 = (t0 + 11464);
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
    t28 = (t0 + 10984);
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

LAB0:    t1 = (t0 + 10520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 6480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 6480);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 6480);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 4800U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 23, t4, t8, t11, 2, 1, t13, 8, 2);
    t12 = (t0 + 11528);
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
    t26 = (t0 + 11000);
    *((int *)t26) = 1;

LAB1:    return;
}


extern void work_m_00000000004271075434_3398636334_init()
{
	static char *pe[] = {(void *)Cont_76_0,(void *)Cont_77_1,(void *)Cont_80_2,(void *)Cont_82_3,(void *)Cont_83_4,(void *)Cont_84_5,(void *)Always_102_6,(void *)Always_107_7,(void *)Always_169_8,(void *)implSig1_execute,(void *)implSig2_execute};
	xsi_register_didat("work_m_00000000004271075434_3398636334", "isim/NTT_tb_isim_beh.exe.sim/work/m_00000000004271075434_3398636334.didat");
	xsi_register_executes(pe);
}
