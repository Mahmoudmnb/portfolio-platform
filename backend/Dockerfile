FROM php:8.5.11-fpm-bookworm AS runtime
RUN apt-get update && apt-get install -y --no-install-recommends libpq-dev libpng-dev libjpeg62-turbo-dev libwebp-dev libzip-dev libonig-dev libxml2-dev unzip curl nginx supervisor \
    && docker-php-ext-configure gd --with-jpeg --with-webp \
    && docker-php-ext-install pdo_pgsql gd bcmath pcntl mbstring dom xml zip \
    && rm -rf /var/lib/apt/lists/*
COPY --from=composer:2.9.5 /usr/bin/composer /usr/bin/composer
COPY docker/php.ini /usr/local/etc/php/conf.d/portfolio.ini
WORKDIR /app
RUN useradd --uid 1000 --create-home app
COPY --chown=app:app . .
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader \
    && mkdir -p storage/app/private storage/app/public storage/framework/cache/data storage/framework/views storage/framework/sessions /tmp/nginx \
    && ln -s /app/storage/app/public public/storage \
    && chown -R app:app storage bootstrap/cache \
    && chown -R app:app /tmp/nginx
USER app
EXPOSE 8000
ENV APP_ENV=production APP_DEBUG=false
CMD ["supervisord", "-c", "/app/docker/supervisord.conf"]
