FROM php:7.2-fpm as base
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apt-get update &&  apt-get install -y libjpeg62-turbo-dev libpng-dev libzmq3-dev git unzip zlib1g-dev \
&& printf "\n" | pecl install -f zmq-beta \
&& docker-php-ext-enable zmq \
&& docker-php-ext-configure gd \
&& docker-php-ext-install -j$(nproc) gd pdo_mysql

FROM base
WORKDIR /var/www/html
RUN git clone https://github.com/exodus4d/pathfinder.git .
COPY ./pathfinder-config/environment.ini /var/www/html/app/environment.ini
RUN composer install
VOLUME /var/www/html
