#!/bin/bash

REPORT=$1

echo -e "\n===== IP Address Classification =====\n" >> "$REPORT"

for ip in $(hostname -I); do
    if [[ $ip =~ ^10\.|^172\.1[6-9]\.|^192\.168\. ]]; then
        echo "$ip - Private IP" >> "$REPORT"
    else
        echo "$ip - Public IP" >> "$REPORT"
    fi
done

# Check if SSH is bound to public IP
echo -e "\nSSH Service Bind Address:" >> "$REPORT"
ss -tuln | grep :22 >> "$REPORT"
