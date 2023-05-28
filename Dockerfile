FROM php:7.4-apache
RUN apt-get update \
    && apt-get install -y \
        curl \
        git \
        unzip \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN echo "export PATH=\"/usr/local/bin/composer:\$PATH\"" >> ~/.bashrc
RUN composer global require laravel/installer
WORKDIR /app
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
