#!/bin/bash
# Specify the log file to monitor
LOG_FILE="Enter the Psth for .log file here" # Example: /var/       
# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE does not exist."
    exit 1
fi
# Trap the Ctrl+C signal to stop the monitoring loop
trap ctrl_c INT
function ctrl_c() {
    echo "Monitoring stopped."
    exit 0
}

echo "Monitoring started"

# Continuously monitor the log file for new entries
tail -f "$LOG_FILE"
echo "Monitoring ended"
# CTRL+C to immediately stop monitoring