FROM php:apache
MAINTAINER sinkcup <sinkcup@163.com>

RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get install -y git discount zlib1g-dev && \
  docker-php-ext-install zip
RUN cd /usr/local/bin/ && \
  curl -sS https://getcomposer.org/installer | php && \
  ln -s composer.phar composer
RUN composer global require "laravel/lumen-installer=~1.0"
RUN ln -s ../mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
RUN ln -s ~/.composer/vendor/bin/* /usr/local/bin/
RUN cd /var/www/html && \
  lumen new gmirror-fonts && \
  chmod -R 777 gmirror-fonts/storage/

ADD .env /var/www/html/gmirror-fonts/
ADD ./app/ /var/www/html/gmirror-fonts/app/
ADD ./bootstrap/ /var/www/html/gmirror-fonts/bootstrap/
ADD README.md /var/www/html/gmirror-fonts/
ADD ./resources/ /var/www/html/gmirror-fonts/resources/
RUN cd /var/www/html/gmirror-fonts/ && \
  echo "<?php require_once __DIR__ . '/start.php';?>" > ./resources/views/index.php && \
  markdown README.md >> ./resources/views/index.php && \
  echo "<?php require_once __DIR__ . '/end.php';?>" >> ./resources/views/index.php
ADD apache2/sites-enabled/ /etc/apache2/sites-enabled/
