#!/bin/bash

# ==========================================
# Script: Project Manifest Generator
# Purpose: Create a project summary file
# ==========================================

OUTPUT_FILE="output/project_manifest.txt"

echo "========================================="
echo "      PROJECT MANIFEST GENERATOR"
echo "========================================="

echo "Please enter the following details:"

# Taking user inputs
read -p "Project Name : " PROJECT_NAME
read -p "Your Name    : " AUTHOR
read -p "Version      : " VERSION
read -p "Description  : " DESCRIPTION
read -p "License      : " LICENSE

# Create output directory if not exists
mkdir -p output

# Write data to file
cat <<EOL > $OUTPUT_FILE
=========================================
        PROJECT MANIFEST FILE
=========================================

Project Name : $PROJECT_NAME
Author       : $AUTHOR
Version      : $VERSION
Date Created : $(date +%Y-%m-%d)
License      : $LICENSE

Description:
$DESCRIPTION

Git Commands Used:
git init    - Initialize repository
git add     - Stage all files
git commit  - Save changes
git push    - Upload to remote

Generated on : $(date)

=========================================
EOL

echo ""
echo "Manifest saved to: $OUTPUT_FILE"

# Preview file
echo ""
echo "--- Preview ---"
cat $OUTPUT_FILE