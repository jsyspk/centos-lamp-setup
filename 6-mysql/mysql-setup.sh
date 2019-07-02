#!/usr/bin/env bash
echo "Install MySql" \
&& sudo wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm \
&& sudo rpm -ivh mysql57-community-release-el7-7.noarch.rpm \
&& sudo yum install -y mysql-server \
&& sudo rm mysql57-community-release-el7-7.noarch.rpm \
&& echo "Mysql version" \
&& mysqld --version \
&& sudo systemctl enable mysqld \
&& sudo systemctl start mysqld \
&& echo "Change Mysql password" \
&& MYSQL_PASSWORD=`sudo grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}'` \
&& echo "Default password: "$MYSQL_PASSWORD \
&& mysql -u root -p$MYSQL_PASSWORD
