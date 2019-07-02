#!/usr/bin/env bash
echo "Add nginx repo" \
&& sudo tee /etc/yum.repos.d/nginx.repo <<-'EOF'
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
EOF
echo "Add nginx gpg key" \
&& sudo wget http://nginx.org/keys/nginx_signing.key \
&& sudo rpm --import nginx_signing.key \
&& sudo rm nginx_signing.key \
&& echo "Install nginx" \
&& sudo yum -y install nginx \
&& echo "Add nginx conf files" \
&& sudo cp myapp.conf /etc/nginx/conf.d/ \
&& echo "Start nginx" \
&& sudo systemctl start nginx \
&& sudo systemctl enable nginx
