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
&& echo "Install expect to interactively secure installation" \
&& sudo yum install -y expect \
&& echo "Run secure installation script" \
&& sudo spawn mysql_secure_installation \
&& expect \"Enter current password for root:\" \
&& send \"$MYSQL_PASSWORD\n\" \
&& expect \"Change the password for root ?\" \
&& send \"y\n\" \
&& expect \"Remove anonymous users?\" \
&& send \"y\n\" \
&& expect \"Disallow root login remotely?\" \
&& send \"y\n\" \
&& expect \"Remove test database and access to it?\" \
&& send \"y\n\" \
&& expect \"Reload privilege tables now?\" \
&& send \"y\n\" \
&& echo "MySQL installation is complete" \
&& mysql -u root -p$MYSQL_PASSWORD
