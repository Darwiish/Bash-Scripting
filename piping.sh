#!/bin/bash

get_date() {
	echo "$(date)"
}
get_date

today=$(get_date)
echo "Today is $today"

echo # printes an empty line

# A function that reads from a pipe
count_lines() {
	local lines
	lines=$(cat) # Reads all input from the pipe
	echo "You sent me $(echo "$lines" | wc -l) lines of data."
}
# Usage:
ls /etc | count_lines

echo # printes an empty line

# This tells you how many times each unique line appears
echo "$lines" | sort | uniq -c | sort -nr

echo # printes an empty line

smart_count() {
	local input_data

	# Check if a filename was passed as the first argument ($1)
	# and if that file actually exists (-f)
	if [ -f "$1" ]; then
		input_data=$(cat "$1")
	# Check if data is being piped in (checking if stdin is not a terminal)
	elif [ ! -t 0 ]; then
		input_data=$(cat)
	else
		echo "Error: No file provided and no data piped in." >&2
		return 1
	fi

	local count
	count=$(echo "$input_data" | wc -l)
	echo "Total lines: $count"
}
smart_count

echo # printes an empty line

analyze_logs() {
	local log_file=${1:? "Error: Please provide a log file."}
	local keyword=${2:-"ERROR"} # Default search to ERROR if not provided

	echo "--- Analysis Report for $log_file ---"

	# 1. cat: Load the file
	# 2. grep: Find the specific keyword
	# 3. awk: Print the 1st (date) and 4th (error type) columns
	# 4. wc: Provide a final count at the end

	cat "$log_file" | grep "$keyword" | awk '{print "Date: " $1 " | Type: " $4}'

	local count
	count=$(grep -c "$keyword" "$log_file")
	echo "--------------------------------------"
	echo "Total $keyword occurrences: $count"
}
analyze_logs "$1"

#Count files in a directory
# ls -1 | wc -l

#Lists all files.filters the list and only shows files ending in .sh.
#ls -l | grep ".sh"

#Check if a service is running
#ps aux | grep "nginx" | grep -v "grep" | wc -l
