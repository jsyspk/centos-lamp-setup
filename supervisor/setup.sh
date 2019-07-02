#!/usr/bin/env bash
echo "Install php ev extension" \
&& sudo yum install -y php71-php-pecl-ev \
&& sudo cp /opt/remi/php71/root/usr/lib64/php/modules/ev.so /usr/lib64/php/modules/ \
&& sudo cp /etc/opt/remi/php71/php.d/40-ev.ini /etc/php.d/ \
&& sudo systemctl restart php-fpm \
&& echo "Install ZeroMQ" \
&& sudo yum install -y php71-php-pecl-zmq \
&& echo "Move extension to default location if its not there" \
&& sudo cp /opt/remi/php71/root/usr/lib64/php/modules/zmq.so /usr/lib64/php/modules/ \
&& echo "extension=zmq.so" > /etc/php.d/20-zmq.ini \
&& sudo systemctl restart php-fpm \
&& echo "Install supervisor for queue management" \
&& sudo yum install -y supervisor \
&& echo "Setup supervisor configuration file" \
&& sudo mkdir -p /etc/supervisor/conf.d \
&& sudo /usr/bin/echo_supervisord_conf > /etc/supervisor/supervisord.conf \
&& echo "files = conf.d/*.conf" >> /etc/supervisor/supervisord.conf \
&& echo "Copy conf files" \
&& echo "Copy supervisord configuration file" \
&& sudo cp ./supervisord.conf /etc/supervisor/ \
&& echo "Copy job ventilator configuration file" \
&& sudo cp ./ventilator.conf /etc/supervisor/conf.d/ \
&& echo "Copy zip file worker configuration file" \
&& suod cp ./zipper.conf /etc/supervisor/conf.d/ \
&& echo "Copy nginx reverse proxy for supervisord http configuration file" \
&& suod cp ./zmq.sugar.conf /etc/nginx/conf.d/ \
&& echo "Restart nginx to start serving reverse proxy" \
&& sudo systemctl restart nginx \
&& echo "Start supervisord using the configuration file" \
&& sudo supervisord -c /etc/supervisor/supervisord.conf\
&& sudo systemctl enable supervisord \
