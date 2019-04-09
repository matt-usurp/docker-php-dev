FROM php:7.1.28-cli-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN set -ex \
 && apk update \
 && apk add --no-cache make tree openssh-client git curl icu postgresql-dev libmcrypt libxml2 \
 && apk add --no-cache --virtual build-dependencies g++ autoconf icu-dev libmcrypt-dev libxml2-dev \
 && docker-php-ext-configure mcrypt \
 && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
 && docker-php-ext-configure opcache --enable-opcache \
 && docker-php-ext-configure sockets --enable-sockets \
 && docker-php-ext-install pgsql pdo_mysql pdo_pgsql intl zip bcmath mcrypt opcache sockets \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && apk del build-dependencies \
 && rm -rf /src /tmp/*
