#!/usr/bin/expect
sudo spawn mysql_secure_installation \
&& expect \"Enter current password for root:\" \
&& send \"$1\n\" \
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
