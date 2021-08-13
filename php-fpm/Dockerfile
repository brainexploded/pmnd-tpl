FROM php:8.0.9-fpm-alpine

RUN apk --update add wget \
  curl \
  git \
  grep \
  build-base \
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
  $PHPIZE_DEPS

RUN docker-php-ext-configure zip
RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql tokenizer xml zip
RUN pecl channel-update pecl.php.net \
    && pecl install memcached \
    $$ pecl install redis \
    && pecl install imagick \
    && pecl install mcrypt-1.0.4 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt \
    && pecl install xdebug-3.0.4 \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN rm /var/cache/apk/* && \
    mkdir -p /var/www/app

WORKDIR /var/www/app
