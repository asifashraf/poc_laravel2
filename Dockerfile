FROM php:7.4-apache
RUN apt-get update \
    && apt-get install -y \
        curl \
        git \
        unzip \
        libonig-dev \
        libxml2-dev \
        libzip-dev \
        zip \
        unzip \
        mariadb-client \
    && rm -rf /var/lib/apt/lists/*

    RUN docker-php-ext-install pdo_mysql mbstring xml zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN echo "export PATH=\"/usr/local/bin/composer:\$PATH\"" >> ~/.bashrc
RUN echo "export PATH=\"/app/shell:\$PATH\"" >> ~/.bashrc
RUN echo "alias pa=\"php artisan\"" >> ~/.bashrc
RUN echo "alias ll=\"source /app/shell/internal.sh\"" >> ~/.bashrc
RUN composer global require laravel/installer
WORKDIR /app
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
