#!/bin/bash

REPORT=$1

echo -e "\n===== Running Services and Ports Audit =====\n" >> "$REPORT"

# Running services
echo "Active systemd services:" >> "$REPORT"
systemctl list-units --type=service --state=running >> "$REPORT"

# Check for unnecessary services (example: telnet, ftp)
echo -e "\nChecking for insecure/unwanted services:" >> "$REPORT"
ps aux | egrep "telnet|ftp|rsh|rlogin|xinetd" >> "$REPORT"

# Open ports
echo -e "\nListening ports and services:" >> "$REPORT"
ss -tuln >> "$REPORT"
