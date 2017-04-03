FROM php:7.0.17-cli

RUN apt-get update -y \
 && apt-get install -y \
      zsh \
      git \
      nano \
      wget \
      libicu-dev \
      libmcrypt-dev \
      libpq-dev \

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

 && docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/ \

 && apt-get purge --auto-remove libicu-dev \
 && apt-get purge --auto-remove libmcrypt-dev \
 && apt-get purge --auto-remove libpq-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/project
