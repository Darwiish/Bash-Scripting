#!/bin/bash

# Bash Case Statement Example
#
# - Prints greetings with hello_world, greet_person, and greet functions
# - Displays the current date and stores it in a variable
# - Includes a safe_delete function to remove all contents of a directory safely
#   * Prevents deletion if no directory is provided
#   * Refuses to delete root directory (/)
#   * Checks that the target directory exists before deleting
# - Demonstrates local variables, argument handling, and user prompts
# - Designed for learning, testing, and Git-friendly demo purposes

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
		echo "What is your name?"
		read name
	else
		name="$1"
	fi
	echo "Hello, $name!"
}
greet

echo

get_date() {
	echo "$(date)"
}
get_date

echo

today=$(get_date)
echo "Today is $today"

echo

# --- safe_delete function ---
safe_delete() {
	local target_dir="$1"

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

	echo "Deleting contents of $target_dir ..."
	rm -rf "${target_dir:?}/"*
	echo "Done."
}

# Call the function with the first script argument
safe_delete "$1"
