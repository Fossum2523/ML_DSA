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
    work_m_00000000003982475454_2220189930_init();
    work_m_00000000000884313958_2625624808_init();
    work_m_00000000004271075434_3398636334_init();
    work_m_00000000003413888954_0810073686_init();
    work_m_00000000001248359746_3858279668_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001248359746_3858279668");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
