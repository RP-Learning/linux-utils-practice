#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <service1> <service2> ..."
  exit 1
fi

LOGFILE="$HOME/devops-practice/service_monitor.log"
echo "[$(date)] 🔍 Starting service check..." | tee -a "$LOGFILE"

for service in "$@"; do

  # Check if service exists
  if ! systemctl list-units --type=service --all | grep -q "$service.service"; then
    echo "[$(date)] ⚠️  [SKIP] Service '$service' not found on this system." | tee -a "$LOGFILE"
    continue
  fi

  # Get service status
  STATUS=$(systemctl is-active "$service")

  if [ "$STATUS" != "active" ]; then
    echo "[$(date)] ❌ [HIGH] $service is $STATUS!" | tee -a "$LOGFILE"
  else
    echo "[$(date)] ✅ [OK] $service is running." | tee -a "$LOGFILE"
  fi
done

echo "[$(date)] ✅ Service check completed." | tee -a "$LOGFILE"

