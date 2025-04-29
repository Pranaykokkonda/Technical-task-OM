#!/bin/bash

REPORT=$1

echo -e "\n===== Log Monitoring (SSH login attempts) =====\n" >> "$REPORT"

# Check for failed SSH logins
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -n 20 >> "$REPORT"
