FROM php:7.4-apache

WORKDIR /app

COPY . /app

# RUN composer install

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
