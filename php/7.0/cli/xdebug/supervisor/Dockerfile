FROM musurp/php-dev:7.0.33-cli

RUN set -ex \
 && apk update \
 && apk add supervisor \
 && rm -rf /src /tmp/*

ENTRYPOINT ["supervisord", "--nodaemon"]
