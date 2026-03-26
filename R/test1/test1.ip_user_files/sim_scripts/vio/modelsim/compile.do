vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+../../../../test1.gen/sources_1/bd/vio/ipshared/5431/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/vio/ipshared/4e08/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/vio/ipshared/0de9/hdl" \
"../../../bd/vio/ip/vio_vio_0_0/sim/vio_vio_0_0.v" \
"../../../bd/vio/sim/vio.v" \


vlog -work xil_defaultlib \
"glbl.v"

