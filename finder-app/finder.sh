#!/bin/bash
# Script: finder.sh
# Usage: ./finder.sh <directory> <search_string>
# Description: Searches all files under the given directory for the given string
# and prints how many files contain the string and total matching lines.

# Check argument count
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: <directory> <search_string>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if directory exists
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory $filesdir does not exist"
    exit 1
fi

# Count number of files and matching lines
file_count=$(find "$filesdir" -type f | wc -l)
matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print result
echo "The number of files are $file_count and the number of matching lines are $matching_lines"

exit 0
