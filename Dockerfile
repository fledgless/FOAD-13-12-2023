ARG PHP_VERSION=7.4
FROM php:${PHP_VERSION}-fpm

RUN apt-get update -y \
    && apt-get install -y nginx nano

ENV php_cppflags="$php_cppflags -std=c++11"

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && apt-get install libicu-dev -y \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && apt-get remove libicu-dev icu-devtools -y
RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=2'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/php-opocache-cfg.ini

ENV TERM=xterm-256color
RUN echo "PS1='\e[92m\u\e[0m@\e[94m\h\e[0m:\e[35m\w\e[0m# '" >> /root/.bashrc

ARG FOLDER_CONFIG=config
ARG FOLDER_APP=app

ARG WORKDIR=/var/www/monsite

COPY ${FOLDER_CONFIG}/nginx-site.conf /etc/nginx/sites-enabled/default
COPY ${FOLDER_CONFIG}/entrypoint.sh /etc/entrypoint.sh

WORKDIR ${WORKDIR}

COPY --chown=www-data:www-data ${FOLDER_APP} .

ENTRYPOINT ["/etc/entrypoint.sh"]