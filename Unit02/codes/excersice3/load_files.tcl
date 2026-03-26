## Load Files (argument-based)

# -------------------------------------------------
# Check arguments
# -------------------------------------------------
if { $argc != 4 } {
    puts "ERROR: Expected 4 arguments:"
    puts "  1) Project (.xpr)"
    puts "  2) RTL source (.v)"
    puts "  3) Constraints (.xdc)"
    puts "  4) Testbench (.v)"
    exit 1
}

# -------------------------------------------------
# Read arguments
# -------------------------------------------------
set proj_file [lindex $argv 0]
set rtl_file  [lindex $argv 1]
set xdc_file  [lindex $argv 2]
set tb_file   [lindex $argv 3]

puts "INFO: Opening project $proj_file"

# -------------------------------------------------
# Open project
# -------------------------------------------------
open_project .$proj_file

# -------------------------------------------------
# Add files
# -------------------------------------------------

add_files -fileset sources_1 .$rtl_file
add_files -fileset constrs_1 .$xdc_file
add_files -fileset sim_1     .$tb_file

# -------------------------------------------------
# Update compile order
# -------------------------------------------------
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "INFO: Files successfully loaded"
