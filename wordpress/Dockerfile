FROM php:7.2-apache
RUN apt-get update && apt-get -y install git
RUN apt-get -q -y install default-mysql-client
RUN docker-php-ext-install pdo_mysql mysqli

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libxml2 \
    libxml2-dev \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt

RUN docker-php-ext-install \
    mbstring \
    json \
    simplexml \
    dom \
    fileinfo \
    hash \
    xml \
    iconv

RUN apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    mailutils \
    memcached \
    msmtp \
    msmtp-mta \
    openssl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd exif

VOLUME /var/www/html
RUN mkdir /var/run/php-fpm
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/zzz-www.conf
COPY ./httpd.conf /usr/local/apache24/conf/httpd.conf
COPY ./phpinfo.php /var/www/html

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
EXPOSE 80