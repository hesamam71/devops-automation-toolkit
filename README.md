# DevOps Automation Toolkit

This repository contains a collection of shell scripts and automation tools designed to streamline system administration tasks.

## Project 1: User Onboarding Automation (`onboard.sh`)

### Description
A Bash script that automates the process of onboarding new employees. It reads a CSV file containing usernames and groups, then automatically:
- Creates the user accounts.
- Creates the necessary groups if they don't exist.
- Sets up home directories and default shells.
- Logs all actions for auditing.

### Prerequisites
- Linux Environment (Ubuntu/CentOS)
- Root privileges (`sudo`)

### Usage
1. Prepare a CSV file (e.g., `users.csv`) with the format: `username,group`
2. Run the script:
   ```bash
   sudo ./onboard.sh users.csv
