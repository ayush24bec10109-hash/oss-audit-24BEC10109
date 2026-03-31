#!/bin/bash

# ==========================================
# Script: Log Analyzer
# Purpose: Analyze a log file and extract useful info
# ==========================================

LOG_FILE="logs/sample.log"

echo "========================================="
echo "        LOG ANALYSIS REPORT"
echo "========================================="

echo "Analyzing: $LOG_FILE"

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file not found at $LOG_FILE"
    exit 1
fi

echo ""

# Count total lines
TOTAL_LINES=$(wc -l < "$LOG_FILE")
echo "Total lines: $TOTAL_LINES"

# Count ERROR occurrences
ERROR_COUNT=$(grep -i "error" "$LOG_FILE" | wc -l)
echo "Error count: $ERROR_COUNT"

# Count WARNING occurrences
WARNING_COUNT=$(grep -i "warning" "$LOG_FILE" | wc -l)
echo "Warning count: $WARNING_COUNT"

# Show last 5 lines of log
echo ""
echo "Last 5 log entries:"
tail -n 5 "$LOG_FILE"

echo ""
echo "Log analysis completed successfully."