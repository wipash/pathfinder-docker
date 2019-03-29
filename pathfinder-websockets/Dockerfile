FROM php:7.2
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apt-get update &&  apt-get install -y libzmq5 libzmq3-dev git unzip zlib1g-dev \
&& printf "\n" | pecl install -f zmq-beta \
&& docker-php-ext-enable zmq
WORKDIR /pathfinder-websockets
RUN git clone https://github.com/exodus4d/pathfinder_websocket.git . \
&& composer install
ENTRYPOINT ["php", "cmd.php", "--pf_listen_port", "8030", "--pf_host", "pathfinder-app"]