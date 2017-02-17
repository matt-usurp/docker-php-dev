FROM musurp/php-dev:7.1.1-cli

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

RUN pecl install -o -f xdebug \
 && rm -rf /tmp/pear \
 && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_enable=on"  >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_host=10.0.2.2" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_connect_back=On" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www/ikarus.dev
