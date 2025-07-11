# Linux Utils Practice

This repository contains production-ready shell scripts built to automate common system administration and monitoring tasks in a Linux environment. These utilities are part of a structured upskilling program focused on modern DevOps, DevSecOps, and SRE practices.

---

## ✅ Scripts Overview

### `hello.sh`
A simple starter script to validate shell setup and execution workflow.

---

### `log_cleanup.sh`
Deletes files older than 7 days from a specified directory.

- Validates input path
- Safely identifies and deletes old files using `find`
- Useful for managing log retention in CI/CD or on production nodes

---

### `file_stats.sh`
Analyzes a given directory and reports:

- Total number of files
- Total disk usage
- Top 5 largest files
- File type distribution summary

---

### `temp_file_cleaner.sh`
Cleans up temporary files (`.log`, `.tmp`, etc.) older than a specified number of days and logs the actions.

- Supports dynamic file extensions and retention periods
- Logging with timestamp using `tee`
- Cron-friendly and customizable

---

### `disk_usage_alert.sh`
Monitors disk usage for a **specific partition** and prints an alert if usage exceeds a defined threshold.

```bash
./disk_usage_alert.sh /mnt/c 85
disk_usage_auto_scan.sh
Scans all mounted /dev/* partitions and logs alerts for any disk usage crossing a threshold.

Auto-detects mounted disks

Logs alerts to disk_alert.log

Suitable for automated monitoring (e.g., via cron)

bash
Copy
Edit
./disk_usage_auto_scan.sh 75
📁 Logs
Alerts and cleanup logs are stored in:

bash
Copy
Edit
~/devops-practice/disk_alert.log
🧩 Purpose
These scripts demonstrate practical proficiency in:

Linux CLI and file system management

Bash scripting and automation

Monitoring and alerting workflows

Cron-based job scheduling

Logging and real-world DevOps tasks

They serve as building blocks for larger infrastructure and platform automation efforts.

🔗 Author
Rajesh Panda
10+ Years IT Experience | DevOps | Platform Engineering | SRE
GitHub: RP-Learning
