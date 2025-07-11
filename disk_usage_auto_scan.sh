#!/bin/bash
THRESHOLD=$1
if [ -z "$THRESHOLD" ]; then
  echo "Usage: $0 <threshold_percent>"
  exit 1
fi

LOGFILE="$HOME/devops-practice/disk_alert.log"
echo "[$(date)] Starting disk scan..." >> "$LOGFILE"

df -h | grep '/dev/' | while read line; do
  DEVICE=$(echo $line | awk '{print $1}')
  USAGE=$(echo $line | awk '{print $5}' | tr -d '%')

  if [ "$USAGE" -ge "$THRESHOLD" ]; then
    MSG="ALERT: $DEVICE is at $USAGE% usage."
    echo "$MSG"
    echo "[$(date)] $MSG" >> "$LOGFILE"
    echo "[$(date)] [ALERT] [$DEVICE] Disk usage at ${USAGE}% exceeds threshold ($THRESHOLD%)" | tee -a "$LOGFILE"
  fi
done
