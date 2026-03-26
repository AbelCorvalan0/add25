#!/bin/bash

# Script to delete Vivado .jou and .log files
# Usage: ./clean_vivado_files.sh [directory]

# Set target directory (default to current directory if not specified)
TARGET_DIR="${1:-$(PWD)}"
# with specific path

echo "Cleaning Vivado .jou and .log files in: $TARGET_DIR"

# Count files before deletion
JOU_COUNT=$(find "$TARGET_DIR" -maxdepth 1 -name "*.jou" -type f 2>/dev/null | wc -l)
LOG_COUNT=$(find "$TARGET_DIR" -maxdepth 1 -name "*.log" -type f 2>/dev/null | wc -l)
BACKUP_COUNT=$(find "$TARGET_DIR" -maxdepth 1 -name "*.backup.jou" -o -name "*.backup.log" -type f 2>/dev/null | wc -l)

# Delete the files
find "$TARGET_DIR" -maxdepth 1 -name "*.jou" -type f -delete 2>/dev/null
find "$TARGET_DIR" -maxdepth 1 -name "*.log" -type f -delete 2>/dev/null
find "$TARGET_DIR" -maxdepth 1 -name "*.backup.jou" -type f -delete 2>/dev/null
find "$TARGET_DIR" -maxdepth 1 -name "*.backup.log" -type f -delete 2>/dev/null
rm -rf ".Xil"

echo "Deleted:"
echo "  - $JOU_COUNT .jou files"
echo "  - $LOG_COUNT .log files"
echo "  - $BACKUP_COUNT .backup files"
echo "Cleanup complete!"