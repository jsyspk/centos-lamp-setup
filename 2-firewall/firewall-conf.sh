#!/usr/bin/env bash
echo "Install Firewall" \
&& sudo yum install -y firewalld \
&& echo "Start Firewall" \
&& sudo systemctl start firewalld \
&& sudo systemctl enable firewalld \
&& echo "Configure Firewall for HTTP" \
&& sudo firewall-cmd --zone=public --permanent --add-service=http \
&& echo "Configure Firewall for HTTPS" \
&& sudo firewall-cmd --zone=public --permanent --add-service=https \
&& echo "Reload firewall rules" \
&& sudo firewall-cmd --reload
