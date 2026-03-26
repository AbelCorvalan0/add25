# ============================================================
# Vivado TCL script: Create project from module name
#
# Usage:
#   vivado -mode batch -source create_project.tcl -tclargs <module_name>
#
# Example:
#   vivado -mode batch -source create_project.tcl -tclargs adder_4b
# ============================================================

# -------------------------------
# Argument check
# -------------------------------
if { $argc < 1 } {
# If no arguments were passed -> error
    puts "ERROR: No module name provided"
    puts "Usage: vivado -mode batch -source create_project.tcl -tclargs <module_name>"
    exit 1
    # Stop script
}

set module_name [lindex $argv 0]
# $argv lists of arguments, position 0
# lindex 0 is the first argument
puts "INFO: Module name = $module_name"

# -------------------------------
# Paths and filenames
# -------------------------------
set base_dir        "../"
set verilog_file    "../sub/${module_name}.v"
set proj_name       $module_name
set proj_dir        "${base_dir}/${proj_name}"

set constraints_file "../../../../../../constraints/Arty_Master_v2.xdc"
set part_name        "xc7a35ticsg324-1L"

# -------------------------------
# Sanity checks
# -------------------------------
if {![file exists $verilog_file]} {
# 1 file exists
# 0 file doesn't exists
    puts "ERROR: Verilog file not found: $verilog_file"
    exit 1
}

if {[file exists $proj_dir]} {
    puts "WARNING: Project directory already exists: $proj_dir"
    puts "INFO: Project may be overwritten"
}

# -------------------------------
# Create project
# -------------------------------
create_project $proj_name $proj_dir -part $part_name -force
puts "INFO: Project created: $proj_name"

# -------------------------------
# Add RTL source
# -------------------------------
add_files -fileset sources_1 $verilog_file
update_compile_order -fileset sources_1
puts "INFO: RTL source added"

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
# Set top module
# -------------------------------
set_property top $proj_name [get_filesets sources_1]
puts "INFO: Top module set to $proj_name"

# -------------------------------
# Save and exit
# -------------------------------
#save_project
save_project_as $module_name ./$module_name
puts "INFO: Project $proj_name successfully created and configured"