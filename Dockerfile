FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    curl wget procps mc \
    libmosquitto1 libmosquitto-dev \
    python3 python3-pip python3-setuptools unzip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-enable intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && pecl install Mosquitto-alpha \
    && docker-php-ext-enable mosquitto \
    && curl -sL https://getcomposer.org/installer | php -- --install-dir /usr/bin --filename composer \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR /var/www
EXPOSE  9000
