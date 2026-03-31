#!/bin/bash

# ==========================================
# Script: Package Checker
# Purpose: Check if a package (git) is installed
# ==========================================

PACKAGE="git"

echo "Checking for package: $PACKAGE"
echo "-------------------------------------"

# Check if package exists
if which $PACKAGE &> /dev/null; then
    echo "[OK] $PACKAGE is INSTALLED."

    # Show version
    VERSION=$($PACKAGE --version)
    echo "Version: $VERSION"

    # Show installation path
    echo "Location: $(which $PACKAGE)"

else
    echo "[NOT FOUND] $PACKAGE is NOT installed."

    # Ask user to install
    read -p "Do you want to install it now? (yes/no): " CHOICE

    if [ "$CHOICE" == "yes" ]; then
        sudo apt update && sudo apt install $PACKAGE -y
        echo "Installation complete!"
    else
        echo "Skipping installation."
    fi
fi