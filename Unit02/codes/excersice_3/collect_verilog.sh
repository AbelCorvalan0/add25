#!/bin/bash
set -x
# Root directory to scan (current directory)
SRC_DIR="$(pwd)"

# Destination directory
DST_DIR="${SRC_DIR}/project_rtl"

# -d Returns true (exit code 0) if the path exists
# and is a directory/folder.
if [ -d "project_rtl" ]; then
    echo "Folder project_rtl exists"
    rm -rf "project_rtl"
else
    echo "Folder project_rtl does not exist"
fi

# Create destination root
mkdir -p "$DST_DIR"
# -p creates parent directories if needed.

# find and copy -v files excluding "tb_"
find "$SRC_DIR" -type f -name "*.v" ! -name "*tb_*" | while read -r file; do


# find: recursively searches directories
# -type f: only regular files.
# -name "*.v": files ending in .v.
# ! -name "*tb_*": exclude filenames containing tb_.

# | : sends output of find line by line.
# read -r file: reads each line into variable "file"
# -r prevents blackslash escaping (important for tile paths).
    # Get path relative to source root
    ##rel_path= "${file#$SRC_DIR/}"
    #{variable#pattern}: removes the shortest matching prefix
    ##mkdir -p "$DST_DIR/$(dirname "$rel_path")"
    # Copy file
    cp "$file" "$DST_DIR"

    echo "Copied: $DST_DIR"

done
