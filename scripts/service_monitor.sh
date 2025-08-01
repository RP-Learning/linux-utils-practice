#!/bin/bash

LOGFILE="$HOME/devops-practice/service_monitor.log"

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <service1> <service2> ..."
  exit 1
fi

echo "[$(date)] Starting service status check..." | tee -a "$LOGFILE"

for service in "$@"; do
  STATUS=$(systemctl is-active "$service" 2>/dev/null)
  
  if [ "$STATUS" != "active" ]; then
    echo "[$(date)] ❌ ALERT: $service is $STATUS!" | tee -a "$LOGFILE"
  else
    echo "[$(date)] ✅ $service is running." | tee -a "$LOGFILE"
  fi
done

