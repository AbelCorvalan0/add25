transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/5431/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/4e08/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/537f/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/d41f/hdl/verilog" -l xpm -l xil_defaultlib \
"/tools/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/tools/Xilinx/2025.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/5431/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/4e08/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/537f/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/d41f/hdl/verilog" -l xpm -l xil_defaultlib \
"../../../bd/ila/ip/ila_ila_0_0/sim/ila_ila_0_0.v" \
"../../../bd/ila/sim/ila.v" \

vlog -work xil_defaultlib \
"glbl.v"

