set proj_file "/home/abel/Documents/vivado_projects/GP1/sub/sum1/sum1.xpr"
# set proj_file "/home/abel/Documents/vivado_projects/GP1/sub/sum1/sum1.xpr"

open_project $proj_file

set source_file "../exercise_1/sum1/sum1.v"
#"../exercise 1/  sum1.v  "

set constraints_file "/home/abel/Documents/vivado_projects/GP1/sub/constraints/Arty_Master_v2.xdc"

# Add sources
add_files -fileset sources_1 $source_file

# Add constraints
add_files -fileset constrs_1 $constraints_file

# Update compile order
update_compile_order -fileset sources_1

# Set top module (only if module name = file name)
set_property top sum1 [current_fileset]
# set_property top   sum1   [current_fileset]

puts "INFO: Files successfuly loaded"