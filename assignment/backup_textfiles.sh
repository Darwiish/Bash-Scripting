#!/bin/bash

# Backup Script for Text Files

# Prompt user for source directory
read -p "Enter Source directory: " SRC
# Create timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
# Create backup directory name
BACKUP_DIR="backup_$TIMESTAMP"

if [ ! -d "$SRC" ]; then
	echo "Source directory does not exist."
	exit 1
fi

# Create backup directory name
mkdir -p "$BACKUP_DIR"
echo "Backup directory created: $BACKUP_DIR"

echo "Copying .txt files..."

# Count txt files first
FILE_COUNT=$(find "$SRC" -maxdepth 1 -type f -name "*.txt" | wc -l)

if [ "$FILE_COUNT" -gt 0 ]; then
	find "$SRC" -maxdepth 1 -type f -name "*.txt" -exec cp {} "$BACKUP_DIR/" \;
	#cp "$SRC"/*.txt "$BACKUP_DIR/"
	echo "Backup completed! Files backed up: $FILE_COUNT"
else
	echo "No text files found in $SRC."
fi
