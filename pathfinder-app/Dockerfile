FROM php:7.2-fpm
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apt-get update &&  apt-get install -y libjpeg62-turbo-dev libpng-dev libzmq3-dev git unzip zlib1g-dev libevent-dev libssl-dev \
&& docker-php-ext-install sockets \
&& pecl channel-update pecl.php.net \
&& pecl install event-2.4.2 \
&& docker-php-ext-enable event \
&& printf "\n" | pecl install -f zmq-beta \
&& docker-php-ext-enable zmq \
&& pecl install -f redis \
&& docker-php-ext-enable redis \
&& docker-php-ext-configure gd \
&& docker-php-ext-install -j$(nproc) gd pdo_mysql
RUN { \
    echo 'session.save_handler = redis'; \
    echo 'session.save_path = tcp://redis:6379'; \
    echo 'max_input_vars = 5000'; \
    echo 'html_errors = 0'; \
} >> /usr/local/etc/php/conf.d/pathfinder-app.ini
WORKDIR /var/www/html
RUN git clone https://github.com/exodus4d/pathfinder.git . \
&& composer install \
&& rm -f /var/www/html/app/environment.ini /var/www/html/app/config.ini /var/www/html/app/pathfinder.ini /var/www/html/app/routes.ini \
&& chmod 777 -R /var/www/html
VOLUME /var/www/html
