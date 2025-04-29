#!/bin/bash

REPORT=$1

echo -e "\n===== Firewall and Network Security =====\n" >> "$REPORT"

# Check firewall status (try both ufw and iptables)
echo -e "\nUFW status:" >> "$REPORT"
ufw status 2>/dev/null >> "$REPORT"

echo -e "\niptables rules:" >> "$REPORT"
iptables -L -n -v 2>/dev/null >> "$REPORT"

# Check IP forwarding
echo -e "\nIP forwarding status:" >> "$REPORT"
sysctl net.ipv4.ip_forward net.ipv6.conf.all.forwarding >> "$REPORT"
