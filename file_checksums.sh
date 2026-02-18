#!/bin/bash

# ------------------------------------------
# Function: calculate_sha256sum
# Description:
#   Writes data to a file and calculates its MD5 checksum
# Arguments:
#   $1 -> file path
#   $2 -> content to write
# ------------------------------------------
calculate_sha256sum() {
	local file_path="$1"
	local data="$2"

	# Write data to file
	echo "$data" >"$file_path"

	# Display MD5 checksum
	echo "MD5 checksum of $file_path:"
	md5sum "$file_path"
}

# Call function
calculate_sha256sum "read.txt" "Dash Bash"

echo

# ------------------------------------------
# Function: compare_checksum
# Description:
#   Creates a file, stores original checksum,
#   modifies file, and compares new checksum
# Arguments:
#   $1 -> file path
# ------------------------------------------
compare_checksum() {
	local file_path="$1"

	# Create original file
	echo "Dash Bash" >"$file_path"

	# Store original checksum
	local original=$(md5sum "$file_path" | awk '{print $1}')
	echo "Original: $original"

	# Modify file content
	echo "Modified Content" >>"$file_path"

	# Store new checksum
	local new=$(md5sum "$file_path" | awk '{print $1}')
	echo "New: $new"

	# Compare checksums
	if [ "$original" == "$new" ]; then
		echo "✅ File NOT modified"
	else
		echo "❌ File HAS been modified"
	fi
}

# Call function
compare_checksum "read.txt"
