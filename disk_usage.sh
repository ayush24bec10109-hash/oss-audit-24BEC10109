#!/bin/bash

# --- Header Section ---
# Prints a visual border and title for the report
echo "=============================="
echo "    DISK USAGE AUDIT REPORT   "
echo "=============================="
echo ""

# --- Overall Disk Usage ---
# Uses 'df -h' to show all mounted filesystems in a human-readable format (G, M, K)
echo "--- Overall Disk Usage ---"
df -h
echo ""

# --- Home Directory Size ---
# Specifically checks the size of the /root directory
echo "--- Home Directory Size ---"
du -sh /root
echo ""

# --- Sizes of Key Directories ---
echo "--- Sizes of Key Directories ---"
# This loop iterates through a specific list of system directories
for DIR in /etc /usr /var /home /tmp; do
    # Check if the path actually exists and is a directory
    if [ -d "$DIR" ]; then
        # du -sh: Get summary size in human-readable format
        # 2>/dev/null: Suppress permission errors (e.g., if you're not root)
        # cut -f1: Keep only the first field (the size) and discard the path
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        # Output the formatted result
        echo " $DIR  =>  $SIZE"
    fi
done

echo ""

# --- Directory Permissions ---
# ls -lhd: Lists details (-l), directory status (-d), and human-readable sizes (-h)
# for the specified directories to check ownership and permissions
echo "--- Directory Permissions ---"
ls -lhd /etc /usr /var /home /tmp

echo ""
echo "Audit completed."