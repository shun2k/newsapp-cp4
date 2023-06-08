FROM php:7.4-apache

# Composer のバージョン と ハッシュ値
ARG composer_ver=2.4.4
ARG composer_hash=c252c2a2219956f88089ffc242b42c8cb9300a368fd3890d63940e4fc9652345

# Composer の保存先
ARG composer_path=/usr/local/bin/composer

RUN apt-get update \
     # Composer インストール
    && php -r "copy('https://getcomposer.org/download/$composer_ver/composer.phar', '$composer_path');" \
    && chmod 755 $composer_path \
    && php -r "if (hash_file('sha256', '$composer_path') !== '$composer_hash') { \
          echo '!!! Failed to install Composer !!!'; \
          unlink('$composer_path'); \
      } \
      echo PHP_EOL;" \
    && apt-get install -y libonig-dev \
    && apt-get install -y vim \
    && apt-get install -y unzip \
    && apt-get install -y libicu-dev \
    && apt-get install -qy apache2 \
    && docker-php-ext-install pdo_mysql mysqli mbstring intl \
    && a2enmod rewrite  

RUN rm -rf /etc/apache2

ENTRYPOINT []
CMD ["find", "/etc/apache2"]

COPY . .
COPY .htaccess /var/www/html/
