#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: $TARGET_DIR is not a directory"
  exit 1
fi

echo "Analyzing directory: $TARGET_DIR"

echo "-----------------------------"
echo "1. Total number of files:"
find "$TARGET_DIR" -type f | wc -l

echo "-----------------------------"
echo "2. Total disk usage:"
du -sh "$TARGET_DIR"

echo "-----------------------------"
echo "3. Top 5 largest files:"
find "$TARGET_DIR" -type f -exec du -h {} + | sort -hr | head -n 5

echo "-----------------------------"
echo "4. File type summary:"
find "$TARGET_DIR" -type f | awk -F. '{print $NF}' | sort | uniq -c | sort -nr | head
