#!/bin/bash

# Usage message
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <directory> <days_old> <min_size_in_MB>"
  exit 1
fi

DIR=$1
DAYS=$2
SIZE_MB=$3

# Validate directory
if [ ! -d "$DIR" ]; then
  echo "Error: $DIR is not a valid directory"
  exit 1
fi

echo "Cleaning files older than $DAYS days and larger than $SIZE_MB MB in: $DIR"

# Log deleted files with timestamp
LOGFILE=~/devops-practice/cleaner.log
echo "---------- $(date) ----------" >> "$LOGFILE"

# Find and delete matching files
find "$DIR" -type f -mtime +"$DAYS" -size +"${SIZE_MB}"M -print -delete | tee -a "$LOGFILE"

echo "Cleanup complete. Log saved to $LOGFILE"

