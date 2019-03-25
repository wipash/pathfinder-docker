FROM php:7.3-alpine as builder
LABEL stage=intermediate
COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR /pathfinder
RUN apk add --no-cache git
RUN git clone https://github.com/exodus4d/pathfinder.git .
RUN composer config --global github-protocols https && composer install --ignore-platform-reqs -v

FROM nginx:1.15.9-alpine
VOLUME /var/www/html
COPY --from=builder /pathfinder /var/www/html
RUN chmod -R 777 /var/www
COPY pathfinder-nginx.conf /etc/nginx/conf.d/default.conf