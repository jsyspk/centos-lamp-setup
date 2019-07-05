#!/usr/bin/expect
sudo spawn mysql_secure_installation \
&& MYSQL_PASSWORD=`sudo grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}'` \
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
&& echo "MySQL installation is complete"
