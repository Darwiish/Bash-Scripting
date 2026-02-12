#!/bin/bash

# Bash Case Statement Advanced Examples
#
# - Uses `set -euo pipefail` for safer script execution
# - Handles service-style commands (start, stop, restart)
# - Validates missing or invalid arguments
# - Implements a simple interactive menu system
# - Executes system commands (date, uptime, disk usage)
# - Demonstrates case usage with numeric and letter input
# - Provides clear feedback for invalid selections

set -euo pipefail

# --- Service command ---
ACTION=${1:-} # first argument or empty

case "$ACTION" in
start)
	echo "System is STARTING..."
	;;
stop)
	echo "System is STOPPING..."
	;;
restart)
	echo "System is RESTARTING..."
	;;
"")
	echo "No action provided. Use start|stop|restart"
	;;
*)
	echo "I don't understand '$ACTION'. Please use start|stop|restart"
	;;
esac

echo

# --- Menu example ---
echo "1) Show date"
echo "2) Show uptime"
echo "3) Show disk usage"

read -p "Choose an option: " choice

case "$choice" in
1) date ;;
2) uptime ;;
3) df -h ;;
*) echo "Invalid option" ;;
esac

echo

# --- Letter input example ---
read -p "Enter a letter: " letter

case "$letter" in
a) echo "You entered A" ;;
b) echo "You entered B" ;;
*) echo "Unknown letter" ;;
esac

echo
