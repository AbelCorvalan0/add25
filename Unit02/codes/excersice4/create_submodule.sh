#!/bin/bash

# Check argument
# -z checks if a string is EMPTY
# $1 is the first command-line argument.
# "if $1 (argument) is empty..."
if [ -z "$1" ]; then
    # $0 references the name (or path) of the script being executed.
    echo "Usage: $0 <module_name>"
    # 1 means error
    # 0 success
    exit 1
fi

NAME="$1"                 # Original name (can contain spaces)
SAFE_NAME="${NAME// /_}"  # Replace spaces with underscores
DIR="$NAME"

# Create folder (keeps spaces)
mkdir -p "$DIR"

# Create files (underscores instead of spaces)
touch "$DIR/${SAFE_NAME}.v"
touch "$DIR/tb_${SAFE_NAME}.v"

# Write Verilog content using SAFE_NAME
cat > "$DIR/${SAFE_NAME}.v" <<EOF
module ${SAFE_NAME} (
    // ports
);

endmodule
EOF

cat > "$DIR/tb_${SAFE_NAME}.v" <<EOF
\`timescale 1ns/1ps

module tb_${SAFE_NAME};

    ${SAFE_NAME} dut ();

endmodule
EOF

echo "Created:"
echo "  Folder: $DIR"
echo "  Files:"
echo "    $DIR/${SAFE_NAME}.v"
echo "    $DIR/tb_${SAFE_NAME}.v"