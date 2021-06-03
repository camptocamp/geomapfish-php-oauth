FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes install php-cli unzip curl libapache2-mod-php git php-curl
WORKDIR /tmp
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN ln -sf /proc/$$/fd/1 /var/log/apache2/access.log
RUN ln -sf /proc/$$/fd/2 /var/log/apache2/error.log
ENTRYPOINT ["apache2", "-DFOREGROUND"]
ENV APACHE_CONFDIR=/etc/apache2 \
    APACHE_ENVVARS=/etc/apache2/envvars \
    APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_PID_FILE=/etc/apache2/apache2.pid \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_LOG_DIR=/var/log/apache2 \
    LANG=C.UTF-8

WORKDIR /var/www/
COPY composer.json ./
RUN phpenmod curl
RUN composer install

WORKDIR /var/www/html
COPY * ./
