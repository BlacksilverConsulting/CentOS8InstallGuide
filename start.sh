#!/usr/bin/env bash
set -o errexit

# Blacksilver Consulting CentOS 8 / Oracle Linux 8 QUICKSTART
# (C) Blacksilver Consulting LLC
# See LICENSE file for license information

# Invocation (run as root, soory):
#  cd && curl https://github.com/BlacksilverConsulting/CentOS8InstallGuide/start.sh && bash start.sh

# Description:
#  This script is designed to start the process of setting up a new install of
#  CentOS 8 or Oracle Linux 8 by enabling EPEL, followed by Ansible and its
#  dependencies. Then it downloads and runs a basic Ansible playbook to
#  continue configuration.

# Notes:
#  - Yes this is full of security holes. PRs welcome! 
#  - This script assumes that it is running as root, and running in /root

# Enable EPEL
#  This is complicated by some different repository names, but it works
REPO=${ dnf repoquery --queryformat '%{name}' *epel* }
dnf -y install ${REPO}

# Install Ansible and dependencies, not in that order
dnf -y install python3 python3-rpm python3-pycurl sshpass Ansible

# Download the playbook, leaving a copy in the current directory
curl https://github.com/BlacksilverConsulting/CentOS8InstallGuide/base.yaml
ansible-playbook ./base.yaml

echo Initial configuration complete.
