set proj_file        "../adder_4b/adder_4b.xpr"
# set proj_file "/home/abel/Documents/vivado_projects/GP1/sub/sum1/sum1.xpr"

open_project     $proj_file

set source_file      "../sub/adder_4b.v"
#"../exercise 1/  sum1.v  "

set tb_file          "../sub/tb_adder_4b.v"

set constraints_file "../../../../../../constraints/Arty_Master_v2.xdc"

# Add sources
add_files -fileset sources_1 $source_file

# Add test bench
add_files -fileset sim_1     $tb_file

# Add constraints
add_files -fileset constrs_1 $constraints_file

# Update compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Set synthesis top
set_property top adder_4b [get_filesets sources_1]

# Set simulation top
set_property top tb_adder_4b [get_filesets sim_1]

puts "INFO: RTL, constraints, and testbench successfully loaded"