# --------------------------------------------------
# Open Vivado project
# --------------------------------------------------
open_project "/home/abel/Documents/vivado_projects/GP02/lab2_3/top/top.xpr"

# --------------------------------------------------
# Get the directory where this TCL script is executed
# --------------------------------------------------
set RUN_DIR [pwd]

puts "Scanning Verilog sources under: $RUN_DIR"

# --------------------------------------------------
# Recursive procedure to find .v files
# --------------------------------------------------
proc find_verilog_files {dir filelist_var} {
    upvar $filelist_var filelist

    foreach item [glob -nocomplain -directory $dir *] {
        if {[file isdirectory $item]} {
            find_verilog_files $item filelist
        } elseif {[string match "*.v" $item]} {
            lappend filelist $item
        }
    }
}

# --------------------------------------------------
# Collect Verilog files
# --------------------------------------------------
set verilog_files {}
find_verilog_files $RUN_DIR verilog_files

# --------------------------------------------------
# Add files to project (exclude tb_)
# --------------------------------------------------
foreach file $verilog_files {
    set fname [file tail $file]

    if {![string match "*tb_*" $fname]} {
        puts "Adding RTL file: $file"
        add_files -fileset sources_1 $file
    } else {
        puts "Skipping testbench: $file"
    }
}

# --------------------------------------------------
# Update compile order
# --------------------------------------------------
update_compile_order -fileset sources_1
