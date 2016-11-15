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
static const char *ng0 = "C:/Users/cs141/cs141/lab4/lab4-start/alu_control.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {32U, 0U};
static unsigned int ng3[] = {7U, 0U};
static int ng4[] = {0, 0};
static unsigned int ng5[] = {34U, 0U};
static unsigned int ng6[] = {8U, 0U};
static unsigned int ng7[] = {36U, 0U};
static unsigned int ng8[] = {37U, 0U};
static unsigned int ng9[] = {1U, 0U};
static unsigned int ng10[] = {42U, 0U};
static unsigned int ng11[] = {4U, 0U};
static unsigned int ng12[] = {38U, 0U};
static unsigned int ng13[] = {2U, 0U};
static unsigned int ng14[] = {39U, 0U};
static unsigned int ng15[] = {3U, 0U};
static unsigned int ng16[] = {5U, 0U};
static int ng17[] = {1, 0};
static unsigned int ng18[] = {6U, 0U};
static unsigned int ng19[] = {11U, 0U};



static void Always_22_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 1536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1732);
    *((int *)t2) = 1;
    t3 = (t0 + 1564);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(22, ng0);

LAB5:    xsi_set_current_line(23, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB21;

LAB22:
LAB24:
LAB23:    xsi_set_current_line(100, ng0);

LAB69:    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB25:    goto LAB2;

LAB7:    xsi_set_current_line(24, ng0);

LAB26:    xsi_set_current_line(25, ng0);
    t7 = (t0 + 692U);
    t8 = *((char **)t7);

LAB27:    t7 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 6, t7, 6);
    if (t9 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB46;

LAB47:
LAB49:
LAB48:    xsi_set_current_line(66, ng0);

LAB61:    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB50:    goto LAB25;

LAB9:    xsi_set_current_line(72, ng0);

LAB62:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB25;

LAB11:    xsi_set_current_line(76, ng0);

LAB63:    xsi_set_current_line(77, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB25;

LAB13:    xsi_set_current_line(80, ng0);

LAB64:    xsi_set_current_line(81, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB25;

LAB15:    xsi_set_current_line(84, ng0);

LAB65:    xsi_set_current_line(85, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB25;

LAB17:    xsi_set_current_line(88, ng0);

LAB66:    xsi_set_current_line(89, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB25;

LAB19:    xsi_set_current_line(92, ng0);

LAB67:    xsi_set_current_line(93, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB25;

LAB21:    xsi_set_current_line(96, ng0);

LAB68:    xsi_set_current_line(97, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB25;

LAB28:    xsi_set_current_line(26, ng0);

LAB51:    xsi_set_current_line(27, ng0);
    t10 = ((char*)((ng3)));
    t11 = (t0 + 920);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 4);
    xsi_set_current_line(28, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB30:    xsi_set_current_line(30, ng0);

LAB52:    xsi_set_current_line(31, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB32:    xsi_set_current_line(34, ng0);

LAB53:    xsi_set_current_line(35, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB34:    xsi_set_current_line(38, ng0);

LAB54:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB36:    xsi_set_current_line(42, ng0);

LAB55:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB38:    xsi_set_current_line(46, ng0);

LAB56:    xsi_set_current_line(47, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB40:    xsi_set_current_line(50, ng0);

LAB57:    xsi_set_current_line(51, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB42:    xsi_set_current_line(54, ng0);

LAB58:    xsi_set_current_line(55, ng0);
    t3 = ((char*)((ng16)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB44:    xsi_set_current_line(58, ng0);

LAB59:    xsi_set_current_line(59, ng0);
    t3 = ((char*)((ng18)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

LAB46:    xsi_set_current_line(62, ng0);

LAB60:    xsi_set_current_line(63, ng0);
    t3 = ((char*)((ng19)));
    t4 = (t0 + 920);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB50;

}


extern void work_m_00000000001647505981_1059438215_init()
{
	static char *pe[] = {(void *)Always_22_0};
	xsi_register_didat("work_m_00000000001647505981_1059438215", "isim/datapath_testbench_isim_beh.exe.sim/work/m_00000000001647505981_1059438215.didat");
	xsi_register_executes(pe);
}
