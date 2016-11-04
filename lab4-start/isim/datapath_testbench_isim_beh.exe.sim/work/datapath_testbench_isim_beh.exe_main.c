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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000511471136_0189417597_init();
    work_m_00000000002834159239_3913188552_init();
    work_m_00000000001788519692_2725559894_init();
    work_m_00000000003145128962_1059438215_init();
    work_m_00000000003369707680_0995678097_init();
    work_m_00000000002834159239_1883927387_init();
    work_m_00000000000353597147_0278921292_init();
    work_m_00000000000544918813_1602209333_init();
    work_m_00000000000213181070_1538842637_init();
    work_m_00000000003600259901_2452537889_init();
    work_m_00000000001281727334_2802243815_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001281727334_2802243815");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
