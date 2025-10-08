#!/bin/bash
# Script: writer.sh
# Usage: ./writer.sh <file> <text>

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: <file> <text>"
    exit 1
fi

writefile=$1
writestr=$2

# Create directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the string to the file (overwrite mode)
echo "$writestr" > "$writefile"

# Verify the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Could not write to $writefile"
    exit 1
fi

exit 0
