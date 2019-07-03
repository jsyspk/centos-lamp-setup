#!/usr/bin/env bash
echo "Get & install remi repo" \
&& sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
&& echo "Install php" \
&& sudo yum -y --enablerepo=remi,remi-php72 install php \
&& sudo yum -y --enablerepo=remi,remi-php72 install php-fpm php-common \
&& echo "Install php packages" \
&& sudo yum --enablerepo=remi,remi-php72 install -y php-opcache php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-redis php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml php-zip php-imap \
&& echo "Update php configuration" \
&& sudo sed -i 's/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf \
&& sudo sed -i 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf \
&& sudo cp php.ini.dev /etc/php.ini \
&& echo "Start php-fpm" \
&& sudo systemctl start php-fpm \
&& sudo systemctl enable php-fpm