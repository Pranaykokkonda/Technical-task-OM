#!/bin/bash

# Load configuration
CONFIG_FILE="./config/security_config.cfg"
[[ -f $CONFIG_FILE ]] && source $CONFIG_FILE || { echo "Missing config file!"; exit 1; }

# Create report directory if not exists
mkdir -p reports
REPORT="reports/audit_report_$(hostname)_$(date +%F_%T).txt"

# Logging function
log() {
    echo -e "\n[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$REPORT"
}

# Run all modules
log "Starting security audit and hardening script..."

for module in ./modules/*.sh; do
    bash "$module" "$REPORT"
done

log "Security audit and hardening completed."
