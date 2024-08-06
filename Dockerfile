FROM richarvey/nginx-php-fpm

COPY ./config/nginx/default.conf /etc/nginx/sites-available/default.conf

WORKDIR /var/www/html

COPY src/ /var/www/html/

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-dev --optimize-autoloader

RUN php artisan optimize