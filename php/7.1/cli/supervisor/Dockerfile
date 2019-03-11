FROM musurp/php:7.1.27-cli

RUN set -ex \
 && apk update \
 && apk add supervisor \
 && rm -rf /src /tmp/*

ENTRYPOINT ["supervisord", "--nodaemon"]
