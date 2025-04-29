#!/bin/bash

REPORT=$1

echo -e "\n===== System Hardening =====\n" >> "$REPORT"

# SSH hardening
echo -e "\nConfiguring SSH to disable password authentication for root..." >> "$REPORT"
if grep -q "^PermitRootLogin" /etc/ssh/sshd_config; then
    sed -i 's/^PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
else
    echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
fi
systemctl reload sshd

# Disable IPv6
echo -e "\nDisabling IPv6..." >> "$REPORT"
sysctl -w net.ipv6.conf.all.disable_ipv6=1
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf

# GRUB password protection placeholder (manual)
echo -e "\nGRUB bootloader protection must be configured manually." >> "$REPORT"

# Enable automatic updates
echo -e "\nInstalling and configuring unattended-upgrades..." >> "$REPORT"
apt install -y unattended-upgrades 2>/dev/null
dpkg-reconfigure -f noninteractive unattended-upgrades

# Basic iptables rules
echo -e "\nSetting up iptables default rules..." >> "$REPORT"
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables-save > /etc/iptables.rules
