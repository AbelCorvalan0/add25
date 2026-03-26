# ============================================================
# Vivado TCL script
# Usage:
#   vivado -mode batch -source load_project.tcl -tclargs <project_name>
#
# Example:
#   vivado -mode batch -source load_project.tcl -tclargs adder_4b
# ============================================================

# -------------------------------
# Argument check
# -------------------------------
if { $argc < 1 } {
    puts "ERROR: No project name provided"
    puts "Usage: vivado -mode batch -source load_project.tcl -tclargs <project_name>"
    exit 1
}

set project_name [lindex $argv 0]
puts "INFO: Project name = $project_name"

# -------------------------------
# Paths (edit if needed)
# -------------------------------
set proj_file        "../$project_name/$project_name.xpr"
set source_file      "../sub/${project_name}.v"
set tb_file          "../sub/tb_${project_name}.v"
set constraints_file "../../../../../../constraints/Arty_Master_v2.xdc"

# -------------------------------
# Open project
# -------------------------------
if {![file exists $proj_file]} {
    puts "ERROR: Project file not found: $proj_file"
    exit 1
}

open_project $proj_file
puts "INFO: Project opened"

# -------------------------------
# Add RTL source
# -------------------------------
if {![file exists $source_file]} {
    puts "ERROR: Source file not found: $source_file"
    exit 1
}

add_files -fileset sources_1 $source_file
puts "INFO: RTL source added"

# -------------------------------
# Add testbench
# -------------------------------
if {![file exists $tb_file]} {
    puts "ERROR: Testbench file not found: $tb_file"
    exit 1
}

add_files -fileset sim_1 $tb_file
puts "INFO: Testbench added"

# -------------------------------
# Add constraints
# -------------------------------
if {![file exists $constraints_file]} {
    puts "ERROR: Constraints file not found: $constraints_file"
    exit 1
}

add_files -fileset constrs_1 $constraints_file
puts "INFO: Constraints added"

# -------------------------------
# Update compile order
# -------------------------------
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# -------------------------------
# Set top modules
# -------------------------------
set_property top $project_name [get_filesets sources_1]
set_property top tb_${project_name} [get_filesets sim_1]

puts "INFO: Top modules set"
puts "INFO: RTL, constraints, and testbench successfully loaded for $project_name"

# -------------------------------
# Optional: run simulation
# -------------------------------
# launch_simulation
# run all