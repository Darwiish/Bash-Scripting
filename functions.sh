#!/bin/bash
#AY
# Bash functions Statement
#
# - hello_world / greet_person / greet: print greetings (interactive)
# - get_date: prints the current date and time
# - safe_delete: safely deletes contents of a directory with confirmation
# - double_number: prints double a number (interactive if no argument)
# - Demonstrates local variables, argument handling, user prompts, and arithmetic

# -----------------------------
# Greeting Functions
# -----------------------------

hello_world() {
	echo "Hello Mate"
}
hello_world

echo

greet_person() {
	local name="$1"
	echo "Hello: $name"
}
greet_person "GG"

echo

greet() {
	local name
	if [ $# -eq 0 ]; then
		read -p "What is your name? " name
	else
		name="$1"
	fi
	echo "Hello, $name!"
}
greet

echo

# -----------------------------
# Utility Functions
# -----------------------------

get_date() {
	echo "$(date)"
}
get_date

echo

today=$(get_date)
echo "Today is $today"

echo

# -----------------------------
# Safe Delete Function
# -----------------------------

safe_delete() {
	local target_dir="$1"

	# Prompt for directory if not provided
	if [[ -z "$target_dir" ]]; then
		read -p "Enter directory to delete contents safely: " target_dir
	fi

	# Safety checks
	if [[ -z "$target_dir" ]]; then
		echo "Error: No directory provided."
		return 1
	fi

	if [[ "$target_dir" == "/" ]]; then
		echo "Error: Refusing to delete root directory (/)."
		return 1
	fi

	if [[ ! -d "$target_dir" ]]; then
		echo "Error: Directory does not exist."
		return 1
	fi

	# Confirmation prompt
	read -p "Are you sure you want to delete all contents of '$target_dir'? (yes/no): " confirm
	if [[ "$confirm" != "yes" ]]; then
		echo "Aborted."
		return 0
	fi

	# Delete contents safely
	echo "Deleting contents of $target_dir ..."
	rm -rf "${target_dir:?}/"*
	echo "Done."
}

# -----------------------------
# Double Number Function (Exercise 3)
# -----------------------------

double_number() {
	local input="$1"

	# Prompt if no input is given
	if [[ -z "$input" ]]; then
		read -p "Enter a number: " input
	fi

	# Validate numeric input
	while ! [[ "$input" =~ ^-?[0-9]+$ ]]; do
		echo "Error: Input is not a valid integer."
		read -p "Please enter a valid number: " input
	done

	# Calculate and display double
	local double=$((input * 2))
	echo "Double of $input is $double"
}

# -----------------------------
# Example Calls (can be commented out if sourcing)
# -----------------------------

safe_delete "$1"
double_number "$2"
