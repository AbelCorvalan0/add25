#!/usr/bin/env bash
set -e

# -------------------------------------------------
# Common paths
# -------------------------------------------------

ADD25_ROOT="$HOME/Desktop/dd1/githubRepos/add25"

# Exercise root (contains load_files.tcl)
EXERCISE_ROOT="$ADD25_ROOT/Unit02/codes/excersice_3"

# Design-specific folder
DESIGN_PATH="$EXERCISE_ROOT/comb_1"

# Constraints
CONSTRAINTS_PATH="$ADD25_ROOT/constraints/Arty_Master_v2.xdc"

# Vivado project
PROJECT_DIR="$HOME/Documents/vivado_projects/GP02/lab2_3/sub/comb_1"
PROJECT_FILE="$PROJECT_DIR/comb_1.xpr"

# Tcl script (FIXED)
TCL_SCRIPT="$EXERCISE_ROOT/load_files.tcl"

# -------------------------------------------------
# Sanity checks
# -------------------------------------------------

echo "Checking files..."

[[ -f "$PROJECT_FILE" ]]                  || { echo "Project not found"; exit 1; }
[[ -f "$TCL_SCRIPT"  ]]                   || { echo "Tcl script not found"; exit 1; }
[[ -f "$DESIGN_PATH/comb_1.v" ]]          || { echo "RTL not found"; exit 1; }
[[ -f "$DESIGN_PATH/tb_comb_1.v" ]]       || { echo "TB not found"; exit 1; }
[[ -f "$CONSTRAINTS_PATH" ]]              || { echo "XDC not found"; exit 1; }

# -------------------------------------------------
# Run Vivado
# -------------------------------------------------

echo "Launching Vivado batch build..."

/tools/Xilinx/2025.1/Vivado/settings64.sh -mode batch \
       -source "$TCL_SCRIPT" \
       -tclargs \
       "$PROJECT_FILE" \
       "$DESIGN_PATH/comb_1.v" \
       "$CONSTRAINTS_PATH" \
       "$DESIGN_PATH/tb_comb_1.v"

echo "Build completed successfully"
