#!/usr/bin/env bash
echo "Install nano editor" \
&& sudo yum -y install nano \
&& echo "Install wget" \
&& sudo yum -y install wget \
&& echo "Install ntp" \
&& sudo yum -y install ntp \
&& echo "Start ntp" \
&& sudo systemctl enable ntpd \
&& sudo systemctl start ntpd \
&& echo "zip & unzip" \
&& sudo yum -y install zip unzip
