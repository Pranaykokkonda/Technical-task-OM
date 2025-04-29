# 🔐 Linux Security Audit & Hardening Script

🔍 What Is This Script Really?
This is a Linux server security auditing and hardening tool — written in Bash — that performs a comprehensive checklist of security inspections and automatic fixes.
It combines:
✅ Audit: Checking for vulnerabilities, misconfigurations, and weak security setups.
✅ Hardening: Automatically applying best practices to secure your server.
✅ Reporting: Saving everything it finds or changes in a detailed .txt file.
Think of it like a doctor doing a full health checkup on your server, then prescribing immediate fixes — and writing everything down for your records.

🛠️ What Does It Actually Do?
1. Audits: Who has root (UID 0) access?

           Are there users with no passwords or weak passwords?

           Are there any files anyone can write to (world-writable)?

           Are there services running that you don’t recognize or need?

           Is the firewall active, and are dangerous ports open?

           Is the server using public IPs, and are sensitive services exposed?

           Any SSH login failures or brute force attempts recently?

2. Hardens: Disables root password SSH access ✅

            Enables automatic security updates ✅

            Disables IPv6 if not in use ✅

            Applies firewall rules to allow only essential traffic ✅

                 💡 Why It’s Useful

| Use Case                        | Benefit                                                                 |
|---------------------------------|-------------------------------------------------------------------------|
| 🛡️ Security compliance          | Ensures servers meet organizational or regulatory security standards   |
| 🔁 Reusable automation          | Run the same checks across 10s or 100s of servers (e.g., EC2, VPS)     |
| 📊 Auditing & visibility        | See exactly **who/what/where** is risky or misconfigured               |
| 🧩 Customizable & extendable    | Add your own security policies or checks easily                        |
| 🧪 Testing & staging assurance  | Run before going to production to ensure server is not exposed         |

   
## 🧩 Features

- 👥 User & Group Audits
- 📁 File/Directory Permission Checks
- 🧾 Running Service & Port Inspections
- 🔥 Firewall & Network Configuration Review
- 🌐 IP Classification (Public/Private)
- 📜 SSH, IPv6, GRUB & Firewall Hardening
- 📊 Centralized Report Generation
- 📦 Modular and Configurable
- 📧 Optional Email/Cloud Report Delivery

---
## 🚀 Getting Started

git clone https://github.com/Pranaykokkonda/Technical-task-OM.git

cd Technical-task-OM

chmod +x audit_hardening.sh modules/*.sh

sudo ./audit_hardening.sh

ls reports/

cat reports/audit_report_*
