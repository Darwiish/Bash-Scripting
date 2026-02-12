#!/bin/bash

# ------------------------------
# Function: get_date
# Prints the current date and time
# ------------------------------

get_date() {
	date
}

# Call the function directly
get_date

# Store date in a variable
today=$(get_date)
echo "Today is $today"

echo

# ------------------------------
# Function: count_lines
# Reads from a pipe and counts lines
# ------------------------------
count_lines() {
	local lines
	lines=$(cat) # Read all piped input
	echo "You sent me $(echo "$lines" | wc -l) lines of data."
}

# Example usage: count lines of /etc
ls /etc | count_lines

echo

# Count occurrences of unique lines (example: files in /etc)
ls /etc | sort | uniq -c | sort -nr

echo

# ------------------------------
# Function: smart_count
# Counts lines from a file or piped input
# ------------------------------
smart_count() {
	local input_data

	# If a filename is provided
	if [ -f "$1" ]; then
		input_data=$(cat "$1")
	# If data is piped in
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

# Example usage:
# From a file: smart_count /etc/passwd
# From a pipe: ls /etc | smart_count
ls /etc | smart_count

echo

# ------------------------------
# Function: analyze_logs
# Analyzes a log file for a keyword
# ------------------------------
analyze_logs() {
	local log_file=${1:? "Error: Please provide a log file."}
	local keyword=${2:-"ERROR"} # Default keyword is ERROR

	echo "--- Analysis Report for $log_file ---"

	# Print date and type for each matching line
	grep "$keyword" "$log_file" | awk '{print "Date: " $1 " | Type: " $4}'

	# Count total occurrences
	local count
	count=$(grep -c "$keyword" "$log_file")
	echo "--------------------------------------"
	echo "Total $keyword occurrences: $count"
}

# Call analyze_logs if a log file argument is provided
if [ -n "$1" ]; then
	analyze_logs "$1"
else
	echo "No log file provided for analysis. Skipping."
fi

#Count files in a directory
# ls -1 | wc -l

#Lists all files.filters the list and only shows files ending in .sh.
#ls -l | grep ".sh"

#Check if a service is running
#ps aux | grep "nginx" | grep -v "grep" | wc -l

#hardcoded
#search_logs() {
#	local search_terms="$1"
#	grep "search_terms" error_log.txt | awk '{ print $2 }'
#}
#search_logs "ERROR"
