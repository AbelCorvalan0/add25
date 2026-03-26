# carpeta raíz
set base_dir "../exersice1"

set proj_file "/home/abel/Documents/vivado_projects/GP01/codes/exersice1/proj/feedback_register/feedback_register.xpr"
open_project $proj_file

# carpetas a excluir
set exclude_dirs {top proj script}

foreach dir [glob -type d -directory $base_dir *] {

    set dirname [file tail $dir]

    # saltar carpetas excluidas
    if {[lsearch $exclude_dirs $dirname] != -1} {
        continue
    }

    # agregar archivos verilog
    foreach file [glob -nocomplain -directory $dir *.v] {
        puts "Adding $file"
        add_files -fileset sources_1 "sub/$file"
    }
}

update_compile_order -fileset sources_1

puts "INFO: Files successfully loaded"

## for sub verilog files #######

# set proj_file "/home/abel/Documents/vivado_projects/GP01/codes/exersice1/top/feedback_register.xpr"
# # set proj_file "/home/abel/Documents/vivado_projects/GP1/sub/sum1/sum1.xpr"

# open_project $proj_file

# set source_file "../exercise_1/sum1/sum1.v"
# #"../exercise 1/  sum1.v  "

# set constraints_file "/home/abel/Documents/vivado_projects/GP1/sub/constraints/Arty_Master_v2.xdc"

# # Add sources
# add_files -fileset sources_1 $source_file

# # Add constraints
# add_files -fileset constrs_1 $constraints_file

# # Update compile order
# update_compile_order -fileset sources_1

# # Set top module (only if module name = file name)
# set_property top sum1 [current_fileset]
# # set_property top   sum1   [current_fileset]

# puts "INFO: Files successfuly loaded"