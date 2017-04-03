FROM musurp/php:7.1.3-fpm

RUN pecl install -o -f xdebug \
 && rm -rf /tmp/pear \
 && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20160303/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_enable=on"  >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_host=10.0.2.2" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.remote_connect_back=On" >> /usr/local/etc/php/conf.d/xdebug.ini \
 && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini
