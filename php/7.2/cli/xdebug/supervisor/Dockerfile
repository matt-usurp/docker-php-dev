FROM musurp/php-dev:7.2.25-cli

RUN set -ex \
 && apk update \
 && apk add supervisor \
 && rm -rf /src /tmp/*

ENTRYPOINT ["supervisord", "--nodaemon"]
