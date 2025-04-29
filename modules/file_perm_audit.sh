#!/bin/bash

REPORT=$1

echo -e "\n===== File and Directory Permission Audit =====\n" >> "$REPORT"

# World-writable files
echo "World-writable files:" >> "$REPORT"
find / -xdev -type f -perm -0002 -ls 2>/dev/null >> "$REPORT"

# .ssh directory permission checks
echo -e "\nChecking .ssh directories:" >> "$REPORT"
find /home -type d -name ".ssh" -exec ls -ld {} \; 2>/dev/null >> "$REPORT"

# SUID/SGID files
echo -e "\nFiles with SUID/SGID bits set:" >> "$REPORT"
find / -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null >> "$REPORT"
