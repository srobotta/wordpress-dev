FROM "wordpress:latest" as wordpress-phpxdebug
RUN apt-get update && apt-get -y upgrade && pecl install xdebug-3.3.0
COPY ./xdebug.ini /usr/local/etc/php/conf.d/wordpress-xdebug.ini
