FROM php:7.4-cli

WORKDIR /var/www

RUN apt-get update && \
  apt-get install libzip-dev -y && \
  docker-php-ext-install zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');"

RUN php composer.phar create-project laravel/laravel app

ENTRYPOINT [ "php","app/artisan","serve" ]

CMD ["--host=0.0.0.0"]

