# Set the base image for subsequent instructions
FROM php:7.4

# Update packages
RUN apt-get update

# Install PHP and composer dependencies
RUN apt-get update && apt-get install -y \
    git \
    zlib1g-dev \
    libzip-dev
RUN docker-php-ext-install zip

# Copy composer executable from official image
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Clear out the local repository of retrieved package files
RUN apt-get clean

# Install Laravel Envoy
RUN composer global require "laravel/envoy=~2.2.0"
