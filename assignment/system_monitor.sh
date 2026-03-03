#!/bin/bash

# System Monitor Script

DATE=$(date '+%Y-%m-%d')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="./logs/sys_monitor_${DATE}.log"
mkdir -p logs

# Create log file with header if not exists
if [ ! -f "$LOG_FILE" ]; then
	echo "===== System Monitoring Log for $DATE =====" >"$LOG_FILE"
fi

{
	echo ""
	echo "===== $TIMESTAMP ====="

	# CPU Usage
	echo ""
	echo "--- TOTAL CPU USAGE ---"
	top -bn1 | grep "^%Cpu" | awk '{usage = 100 - $8; printf "Total CPU Usage: %.2f%%\n", usage}'

	# Memory Usage
	echo ""
	echo "--- MEMORY USAGE (Total / Used / Free) ---"
	free -h

	# Disk Usage
	echo ""
	echo "--- DISK USAGE ---"
	df -h

	# Top 5 Processes by Memory
	echo ""
	echo "--- TOP 5 PROCESSES BY MEMORY ---"
	ps -eo pid,cmd,%mem --sort=-%mem | head -n 6

	echo ""
	echo "----------------------------------"

} >>"$LOG_FILE"

echo "System monitoring data saved to $LOG_FILE"
