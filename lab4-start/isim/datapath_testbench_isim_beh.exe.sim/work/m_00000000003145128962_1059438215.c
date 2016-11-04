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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/cs141/cs141/lab4-start/alu_control.v";
static unsigned int ng1[] = {32U, 0U};
static unsigned int ng2[] = {7U, 0U};
static unsigned int ng3[] = {34U, 0U};
static unsigned int ng4[] = {8U, 0U};
static unsigned int ng5[] = {36U, 0U};
static unsigned int ng6[] = {0U, 0U};
static unsigned int ng7[] = {37U, 0U};
static unsigned int ng8[] = {1U, 0U};
static unsigned int ng9[] = {42U, 0U};
static unsigned int ng10[] = {4U, 0U};
static unsigned int ng11[] = {38U, 0U};
static unsigned int ng12[] = {2U, 0U};
static unsigned int ng13[] = {39U, 0U};
static unsigned int ng14[] = {3U, 0U};
static unsigned int ng15[] = {5U, 0U};
static unsigned int ng16[] = {6U, 0U};
static unsigned int ng17[] = {11U, 0U};
static int ng18[] = {0, 0};



static void Always_21_0(char *t0)
{
    char t6[8];
    char t25[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    int t22;
    char *t23;
    char *t24;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;

LAB0:    t1 = (t0 + 1444U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1640);
    *((int *)t2) = 1;
    t3 = (t0 + 1472);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(21, ng0);

LAB5:    xsi_set_current_line(22, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t4) = t13;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB6;

LAB7:
LAB8:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    t5 = (t6 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    memset(t25, 0, 8);
    t2 = (t25 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t25) = t10;
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t6, 0, 8);
    t5 = (t25 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    t17 = *((unsigned int *)t25);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB41;

LAB39:    if (*((unsigned int *)t5) == 0)
        goto LAB38;

LAB40:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;

LAB41:    t14 = (t6 + 4);
    t26 = *((unsigned int *)t14);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB42;

LAB43:
LAB44:
LAB36:    goto LAB2;

LAB6:    xsi_set_current_line(22, ng0);

LAB9:    xsi_set_current_line(23, ng0);
    t20 = (t0 + 692U);
    t21 = *((char **)t20);

LAB10:    t20 = ((char*)((ng1)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t20, 6);
    if (t22 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng3)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng9)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng11)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng13)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng6)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng12)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng14)));
    t22 = xsi_vlog_unsigned_case_compare(t21, 6, t2, 6);
    if (t22 == 1)
        goto LAB29;

LAB30:
LAB32:
LAB31:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB33:    goto LAB8;

LAB11:    xsi_set_current_line(24, ng0);
    t23 = ((char*)((ng2)));
    t24 = (t0 + 920);
    xsi_vlogvar_assign_value(t24, t23, 0, 0, 4);
    goto LAB33;

LAB13:    xsi_set_current_line(25, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB15:    xsi_set_current_line(26, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB17:    xsi_set_current_line(27, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB19:    xsi_set_current_line(28, ng0);
    t3 = ((char*)((ng10)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB21:    xsi_set_current_line(29, ng0);
    t3 = ((char*)((ng12)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB23:    xsi_set_current_line(30, ng0);
    t3 = ((char*)((ng14)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB25:    xsi_set_current_line(31, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB27:    xsi_set_current_line(32, ng0);
    t3 = ((char*)((ng16)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB29:    xsi_set_current_line(33, ng0);
    t3 = ((char*)((ng17)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB33;

LAB34:    xsi_set_current_line(37, ng0);

LAB37:    xsi_set_current_line(38, ng0);
    t7 = ((char*)((ng4)));
    t14 = (t0 + 920);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 4);
    goto LAB36;

LAB38:    *((unsigned int *)t6) = 1;
    goto LAB41;

LAB42:    xsi_set_current_line(40, ng0);

LAB45:    xsi_set_current_line(41, ng0);
    t20 = ((char*)((ng2)));
    t23 = (t0 + 920);
    xsi_vlogvar_assign_value(t23, t20, 0, 0, 4);
    goto LAB44;

}


extern void work_m_00000000003145128962_1059438215_init()
{
	static char *pe[] = {(void *)Always_21_0};
	xsi_register_didat("work_m_00000000003145128962_1059438215", "isim/datapath_testbench_isim_beh.exe.sim/work/m_00000000003145128962_1059438215.didat");
	xsi_register_executes(pe);
}
