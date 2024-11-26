# TCL File Generated by Component Editor 18.1
# Tue Nov 26 23:47:48 ICT 2024
# DO NOT MODIFY


# 
# Sine_Wave_Generator "Sine_Wave_Generator" v1.0
#  2024.11.26.23:47:48
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module Sine_Wave_Generator
# 
set_module_property DESCRIPTION ""
set_module_property NAME Sine_Wave_Generator
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME Sine_Wave_Generator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL sine_wave_wrapper
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file clk_divider.v VERILOG PATH clk_divider.v
add_fileset_file phase_accumulator.v VERILOG PATH phase_accumulator.v
add_fileset_file phase_to_amplitude_converter.v VERILOG PATH phase_to_amplitude_converter.v
add_fileset_file sine_wave_csr.v VERILOG PATH sine_wave_csr.v
add_fileset_file sine_wave_generator.v VERILOG PATH sine_wave_generator.v
add_fileset_file sine_wave_wrapper.v VERILOG PATH sine_wave_wrapper.v TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL sine_wave_wrapper
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file clk_divider.v VERILOG PATH clk_divider.v
add_fileset_file phase_accumulator.v VERILOG PATH phase_accumulator.v
add_fileset_file phase_to_amplitude_converter.v VERILOG PATH phase_to_amplitude_converter.v
add_fileset_file sine_wave_csr.v VERILOG PATH sine_wave_csr.v
add_fileset_file sine_wave_generator.v VERILOG PATH sine_wave_generator.v
add_fileset_file sine_wave_wrapper.v VERILOG PATH sine_wave_wrapper.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point avalon_slave_0
# 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressUnits WORDS
set_interface_property avalon_slave_0 associatedClock clock_sink
set_interface_property avalon_slave_0 associatedReset reset_sink
set_interface_property avalon_slave_0 bitsPerSymbol 8
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 burstcountUnits WORDS
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 maximumPendingWriteTransactions 0
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true
set_interface_property avalon_slave_0 EXPORT_OF ""
set_interface_property avalon_slave_0 PORT_NAME_MAP ""
set_interface_property avalon_slave_0 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0 ChipSelect chipselect Input 1
add_interface_port avalon_slave_0 Write write Input 1
add_interface_port avalon_slave_0 Read read Input 1
add_interface_port avalon_slave_0 Address address Input 2
add_interface_port avalon_slave_0 WriteData writedata Input 32
add_interface_port avalon_slave_0 ReadData readdata Output 32
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""

add_interface_port clock_sink Clk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink ResetN reset_n Input 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock clock_sink
set_interface_property conduit_end associatedReset reset_sink
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end oData_sin export Output 10


# 
# connection point irq
# 
add_interface irq interrupt end
set_interface_property irq associatedAddressablePoint ""
set_interface_property irq associatedClock clock_sink
set_interface_property irq associatedReset reset_sink
set_interface_property irq bridgedReceiverOffset ""
set_interface_property irq bridgesToReceiver ""
set_interface_property irq ENABLED true
set_interface_property irq EXPORT_OF ""
set_interface_property irq PORT_NAME_MAP ""
set_interface_property irq CMSIS_SVD_VARIABLES ""
set_interface_property irq SVD_ADDRESS_GROUP ""

add_interface_port irq irq irq Output 1

