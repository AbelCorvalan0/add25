vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/5431/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/4e08/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/537f/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/d41f/hdl/verilog" \
"../../../bd/ila/ip/ila_ila_0_0/sim/ila_ila_0_0.v" \
"../../../bd/ila/sim/ila.v" \


vlog -work xil_defaultlib \
"glbl.v"

