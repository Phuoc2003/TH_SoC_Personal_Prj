# ------------------------------------------------------------------------------
# Top Level Simulation Script to source msim_setup.tcl
# ------------------------------------------------------------------------------
set QSYS_SIMDIR obj/default/runtime/sim
source msim_setup.tcl
# Copy generated memory initialization hex and dat file(s) to current directory
file copy -force D:/SoC/Lab/Personal_Prj/TH_SoC_Personal_Prj/software/Personal_Prj/mem_init/hdl_sim/system_onchip_memory2_0.dat ./ 
file copy -force D:/SoC/Lab/Personal_Prj/TH_SoC_Personal_Prj/software/Personal_Prj/mem_init/system_onchip_memory2_0.hex ./ 
