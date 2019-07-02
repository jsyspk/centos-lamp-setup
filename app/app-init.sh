#!/usr/bin/env bash
composer install
&& composer dump-autoload
&& sudo php /var/web/vendor/bin/browscap-php browscap:update
&& sudo php /var/web/artisan migrate
&& sudo php /var/web/artisan db:seed
&& sudo php /var/web/artisan db:seed --class=SOmeClassNameSeeder
&& npm install --global yarn
&& npm run dev
