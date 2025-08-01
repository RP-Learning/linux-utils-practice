#!/bin/bash
if [ -z "$1" ]; then
	echo "Usage : $0 ~/devops-practice/log-test"
	exit 1
fi
TARGET_DIR="$1"
if [ ! -d "$TARGET_DIR" ]; then
	echo "Error : Directory $TARGET_DIR does not exist"
	exit 1
fi
DELETED_COUNT=$(find "$TARGET_DIR" -type f -mtime +7 -print -delete | wc -l)
echo "$(date): Deleted $DELETED_COUNT old files from $TARGET_DIR"
