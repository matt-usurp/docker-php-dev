FROM php:7.1.1-fpm

RUN apt-get update -y \
 && apt-get install -y \
      libicu-dev \
      libmcrypt-dev \
      libpq-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng12-dev \
 && rm -rf /var/lib/apt/lists/* \

 && docker-php-ext-install \
      pdo \
      pdo_pgsql \
      intl \
      mbstring \
      zip \
      mcrypt \
      pgsql \

 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/ \
 && docker-php-ext-install gd
