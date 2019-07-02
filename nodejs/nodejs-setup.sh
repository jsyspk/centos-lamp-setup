#!/usr/bin/env bash
echo "Install Nodejs and npm" \
&& sudo yum install -y nodejs npm --enablerepo=epel \
&& echo "Install npm packages" \
&& sudo npm install -g webpack
