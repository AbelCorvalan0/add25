#!/bin/bash

# Check if argument was provided
if [ -z "$1" ]; then 
    echo "Usage: $0 <tcl_script_name>"
    exit 1
fi

TCL_SCRIPT="$1"

#vivado -mode batch -source "$TCL_SCRIPT"
/tools/Xilinx/2025.1/Vivado/bin/vivado -mode batch -source "$TCL_SCRIPT"

exit 0

# $1 is the first argument passed from terminal
# -z checks if a string is empty
# $0 is the name of the script itself
# exit 1 = ERROR
# exit 0 = success 