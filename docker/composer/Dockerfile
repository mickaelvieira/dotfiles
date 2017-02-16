FROM alpine:3.5

WORKDIR /srv

ENV COMPOSER_HOME="/composer"

RUN apk add --no-cache \
    curl \
    git \
    ca-certificates \
    php7 \
    php7-ctype \
    php7-phar \
    php7-curl \
    php7-fpm \
    php7-json \
    php7-zlib \
    php7-xml \
    php7-dom \
    php7-opcache \
    php7-zip \
    php7-pdo \
    php7-pdo_mysql \
    php7-mbstring \
    php7-session \
    php7-gd \
    php7-openssl \
 && sed -i -e "s/^;date.timezone =$/date.timezone = \"UTC\"/" /etc/php7/php.ini \
 && ln -s /usr/bin/php7 /usr/bin/php \
 && curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
 && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
 && php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === trim(file_get_contents('/tmp/composer-setup.sig'))) { echo 'Installer verified'; } else { echo 'Installer corrupt' . PHP_EOL; exit(1); } echo PHP_EOL;" \
 && php /tmp/composer-setup.php \
 && rm -f /tmp/composer-setup.php \
 && rm -f /tmp/composer-setup.sig \
 && mv /srv/composer.phar /usr/local/bin/composer \
 && chmod u+x /usr/local/bin/composer \
 && composer --global config optimize-autoloader true \
 && composer --global config data-dir /composer

COPY script.sh /root/script.sh

RUN chmod u+x /root/script.sh

CMD /bin/sh -c /root/script.sh
