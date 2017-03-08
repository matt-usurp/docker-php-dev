FROM php:7.0.16-cli

RUN apt-get update -y \
 && apt-get install -y \
      zsh \
      git \
      libicu-dev \
      libmcrypt-dev \
      libpq-dev \
 && rm -rf /var/lib/apt/lists/* \

 && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true \
 && sed -i 's~robbyrussell~kolo~g' ~/.zshrc \
 && sed -i 's/plugins=(git)/plugins=(composer symfony2)/g' /root/.zshrc \

 && curl -sS "https://getcomposer.org/installer?v=1.3.1" | php \
 && mv composer.phar /usr/bin/composer \

 && docker-php-ext-install \
      pdo \
      pdo_pgsql \
      pgsql \
      intl \
      mbstring \
      mcrypt \
      zip \

 && docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/

RUN pecl install -o -f xdebug \
 && rm -rf /tmp/pear \
 && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_enable=on"  >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_host=10.0.2.2" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_connect_back=On" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini
