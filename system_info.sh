#!/bin/bash

# ==========================================
# Script: System Information
# Purpose: Display system details
# ==========================================

echo "========================================="
echo "      SYSTEM INFORMATION REPORT"
echo "========================================="

# Username
echo "Username        : $(whoami)"

# Hostname
echo "Hostname        : $(hostname)"

# System uptime
echo "System Uptime   : $(uptime -p)"

# Kernel version
echo "Kernel Version  : $(uname -r)"

# OS description
echo "OS Description  : $(lsb_release -d | cut -f2)"

# Current time
echo "Current Time    : $(date)"

echo "========================================="
echo "Report generated successfully."