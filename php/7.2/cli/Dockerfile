FROM php:7.2.7-cli-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN set -ex \
 && apk update \
 && apk add --no-cache make tree git curl icu postgresql-dev libxml2 \
 && apk add --no-cache --virtual build-dependencies g++ autoconf icu-dev libxml2-dev \
 && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
 && docker-php-ext-install pgsql pdo_mysql pdo_pgsql intl zip bcmath \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && apk del build-dependencies \
 && rm -rf /src /tmp/*
