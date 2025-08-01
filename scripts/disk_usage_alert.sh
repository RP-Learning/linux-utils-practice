#!/bin/bash

DEVICE=$1
THRESHOLD=$2
LOGFILE="$HOME/devops-practice/disk_alert.log"

if [ -z "$DEVICE" ] || [ -z "$THRESHOLD" ]; then
  echo "Usage: $0 <disk_device> <threshold_percent>" | tee -a "$LOGFILE"
  exit 1
fi

USAGE=$(df -h | grep "$DEVICE" | awk '{print $5}' | tr -d '%')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "ALERT: Disk usage on $DEVICE is at $USAGE%, exceeds threshold $THRESHOLD%." | tee -a "$LOGFILE"
else
  echo "OK: Disk usage on $DEVICE is $USAGE%, within safe limit." | tee -a "$LOGFILE"
fi

