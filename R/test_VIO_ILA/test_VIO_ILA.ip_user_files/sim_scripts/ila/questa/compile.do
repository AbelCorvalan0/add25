vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/5431/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/4e08/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/537f/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/d41f/hdl/verilog" \
"/tools/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/tools/Xilinx/2025.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/5431/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/4e08/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/537f/hdl/verilog" "+incdir+../../../../test_VIO_ILA.gen/sources_1/bd/ila/ipshared/d41f/hdl/verilog" \
"../../../bd/ila/ip/ila_ila_0_0/sim/ila_ila_0_0.v" \
"../../../bd/ila/sim/ila.v" \

vlog -work xil_defaultlib \
"glbl.v"

