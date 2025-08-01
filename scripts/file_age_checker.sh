#!/bin/bash

if [ -z "$1" ]; then
  echo "No directory found in Parameter" 
  exit 1
fi

if [ -z "$2" ]; then
  echo "No day found in Parameter" 
  exit 1
fi

DIRECTORY="$1"
DAYS="$2"

if [ ! -d "$DIRECTORY" ]; then
  echo "Error:$DIRECTORY not found"
  exit 1
fi

echo "Checking for files older than $DAYS in $DIRECTORY"

RESULT=$(find $DIRECTORY -type f -mtime +$DAYS)

if [ -z "$RESULT" ]; then
  echo "No files found  older than $DAYS in $DIRECTORY" 
  else
  echo "$RESULT" | xargs -n 1 basename
fi
