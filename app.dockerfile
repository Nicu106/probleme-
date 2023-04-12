FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libz-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libxml2-dev \
        libjpeg62-turbo-dev \
        libicu-dev \
        libzip-dev \
        libgd-dev \
        zip \
        cron \
        nano \
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg\
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install soap \
    && pecl install memcached  \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install bcmath \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache \
    && docker-php-ext-install xml \
    && docker-php-ext-install zip
