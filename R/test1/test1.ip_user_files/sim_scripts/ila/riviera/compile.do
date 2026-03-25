transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../tools/Xilinx/2025.1/data/rsb/busdef" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/5431/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/4e08/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/537f/hdl/verilog" "+incdir+../../../../test1.gen/sources_1/bd/ila/ipshared/d41f/hdl/verilog" -l xil_defaultlib \
"../../../bd/ila/ip/ila_ila_0_0/sim/ila_ila_0_0.v" \
"../../../bd/ila/sim/ila.v" \


vlog -work xil_defaultlib \
"glbl.v"

