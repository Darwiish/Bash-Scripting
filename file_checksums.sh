#!/bin/bash

calculate_sha256sum() {
	local file_path="$1"
	local data="$2"

	echo "$data" >"$file_path"
	echo "MD5 checksum of $file_path:"
	md5sum "$file_path"
}

calculate_sha256sum "read.txt" "Dash Bash"

echo

#!/bin/bash

compare_checksum() {
	local file_path="$1"

	echo "Dash Bash" >"$file_path"
	local original=$(md5sum "$file_path" | awk '{print $1}')
	echo "Original: $original"

	echo "Modified Content" >>"$file_path"
	local new=$(md5sum "$file_path" | awk '{print $1}')
	echo "New:      $new"

	if [ "$original" == "$new" ]; then
		echo "✅ File NOT modified"
	else
		echo "❌ File HAS been modified"
	fi
}

compare_checksum "read.txt"
