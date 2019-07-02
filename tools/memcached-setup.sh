#!/usr/bin/env bash
echo "Install Memcached" \
&& sudo yum -y install memcached \
&& sudo systemctl start memcached \
&& sudo systemctl enable memcached
