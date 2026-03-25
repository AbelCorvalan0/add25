set verilog_file "../exercise1/top/top.v"
# "../exercise 1/  sum1.v  "

set proj_name "feedback_register"
# file tail gets sum1.v
# file rootname removes .v
# Result sum1

# Create project

# "/home/abel/Documents/vivado_projects/  GPs  /sub/"
set base_dir "/home/abel/Documents/vivado_projects/add25/Unit01/GP01/codes/exersice1/proj"
set proj_dir "$base_dir/$proj_name"

set constraints_dir "../../constraints/Arty_Master_v2.xdc"
set part_name "xc7a35ticsg324-1L"

create_project $proj_name $proj_dir -part $part_name 
# part xc7a35ticsg324-1L


# For sub verilog files ###############################################
# set verilog_file "../exercise1/adder_4b.v"
# # "../exercise 1/  sum1.v  "

# set proj_name [file rootname [file tail $verilog_file]]
# # file tail gets sum1.v
# # file rootname removes .v
# # Result sum1

# # Create project.

# # "/home/abel/Documents/vivado_projects/  GPs  /sub/"
# set base_dir "/home/abel/Documents/vivado_projects/GP1/sub/"
# set proj_dir "$base_dir/$proj_name"

# set constraints_dir "../../constraints/Arty_Master_v2.xdc"
# set part_name "xc7a35ticsg324-1L"

# create_project $proj_name $proj_dir -part $part_name 
# # part xc7a35ticsg324-1L