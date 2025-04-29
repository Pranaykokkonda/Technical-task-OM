#!/bin/bash

REPORT=$1

echo -e "\n===== User and Group Audit =====\n" >> "$REPORT"

echo "All users:" >> "$REPORT"
cut -d: -f1 /etc/passwd >> "$REPORT"

echo -e "\nUsers with UID 0:" >> "$REPORT"
awk -F: '($3 == "0") { print $1 }' /etc/passwd >> "$REPORT"

echo -e "\nUsers without passwords:" >> "$REPORT"
awk -F: '($2 == "" || $2 == "*" || $2 == "!" ) { print $1 }' /etc/shadow 2>/dev/null >> "$REPORT"

echo -e "\nGroups on the system:" >> "$REPORT"
cut -d: -f1 /etc/group >> "$REPORT"
