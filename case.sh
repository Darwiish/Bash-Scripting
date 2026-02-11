#!/bin/bash

case "$1" in
1)
	echo "One"
	;;
2 | 3)
	echo "Two or Three"
	;;
*)
	echo "Other number"
	;;
esac

echo # printes an empty line

echo "1) Show date"
echo "2) Show uptime"
echo "3) Show disk usage"

read -p "Choose an option: " choice

case "$choice" in
1)
	date
	;;
2)
	uptime
	;;
3)
	df -h
	;;
*)
	#echo "Usage: $0 {1|2|3}"
	echo "Invalid option"
	;;
esac

echo # printes an empty line

read -p "Enter a letter: " letter

case "$letter" in
a)
	echo "You entered A"
	;;
b)
	echo "You entered B"
	;;
*)
	echo "Unknown letter"
	;;
esac

echo # printes an empty line

#Takes one argument
echo "The argument you provided is: $1"

echo # printes an empty line

# $1 is our command (start, stop, or restart)
ACTION=$1

if [ "$ACTION" == "start" ]; then
	echo "System is STARTING..."
elif [ "$ACTION" == "stop" ]; then
	echo "System is STOPPING..."
elif [ "$ACTION" == "restart" ]; then
	echo "System is RESTARTING..."
else
	echo "I don't understand '$ACTION'. Please use start, stop, or restart."
fi
