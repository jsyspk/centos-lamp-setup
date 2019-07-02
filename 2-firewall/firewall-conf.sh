#!/usr/bin/env bash
echo "Install Firewall" \
&& sudo yum install -y firewalld \
&& echo "Start Firewall" \
&& sudo systemctl start firewalld \
&& sudo systemctl enable firewalld \
&& echo "Configure Firewall for HTTP & HTTPS" \
&& sudo firewall-cmd --zone=public --permanent --add-service=http \
&& sudo firewall-cmd --zone=public --permanent --add-service=https \
&& sudo firewall-cmd --reload
