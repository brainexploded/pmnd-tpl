FROM php:8.3-fpm-alpine AS build

RUN apk --update add wget \
    curl \
    git \
    grep \
    build-base \
    linux-headers \
    libmemcached-dev \
    libmcrypt-dev \
    libxml2-dev \
    imagemagick-dev \
    pcre-dev \
    libtool \
    make \
    autoconf \
    g++ \
    cyrus-sasl-dev \
    libgsasl-dev \
    oniguruma-dev \
    zip \
    libzip-dev \
    yaml-dev \
    busybox-extras \
    supervisor \
    sudo \
    $PHPIZE_DEPS

RUN docker-php-ext-configure zip
RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql xml zip sockets
RUN pecl channel-update pecl.php.net \
    && pecl install memcached \
    && pecl install mcrypt-1.0.7 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-enable mcrypt \
    && pecl install xdebug-3.3.2 \
    && docker-php-ext-enable xdebug \
    && pecl install yaml \
    && docker-php-ext-enable yaml \
    && docker-php-ext-enable sockets \
    && pecl install redis \
    && docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN rm /var/cache/apk/* && \
    mkdir -p /var/www/app

WORKDIR /var/www/app

RUN  deluser www-data \
    && addgroup -g 1001 www-data && adduser -u 1000 -G www-data www-data -D -S

RUN  echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER www-data

FROM build AS localdev

ENTRYPOINT ["/run.sh"]
