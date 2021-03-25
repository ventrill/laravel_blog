FROM php:7.2-fpm
MAINTAINER neolao <contact@neolao.com>
# https://hub.docker.com/r/neolao/php/~/dockerfile/


RUN apt-get update


# Install opcache
#RUN docker-php-ext-install opcache

# Install APCu
#RUN pecl install apcu
#RUN echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini

# Install bcmath
RUN docker-php-ext-install bcmath

# Install bz2
RUN apt-get install -y libbz2-dev
RUN docker-php-ext-install bz2

# Install calendar
#RUN docker-php-ext-install calendar

# Install dba
#RUN docker-php-ext-install dba

# Install GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

#RUN apt-get install -y pkg-config patch
#ADD https://git.archlinux.org/svntogit/packages.git/plain/trunk/freetype.patch?h=packages/php /tmp/freetype.patch
#RUN docker-php-source extract; \
#  cd /usr/src/php; \
#  patch -p1 -i /tmp/freetype.patch; \
#  rm /tmp/freetype.patch

RUN docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install mbstring
RUN docker-php-ext-install mbstring

# Install mcrypt
RUN apt-get install -y libmcrypt-dev
RUN pecl install mcrypt-1.0.1
RUN docker-php-ext-enable mcrypt
#RUN docker-php-ext-install mcrypt

# Install PDO
# RUN apt-get install -y freetds-dev php5-sybase
# RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
# RUN docker-php-ext-install pdo_oci
# RUN docker-php-ext-install pdo_odbc
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql
# RUN apt-get install -y libsqlite3-dev
# RUN docker-php-ext-install pdo_sqlite

# Install phpredis
RUN pecl install redis-3.1.2 && docker-php-ext-enable redis

# Install XSL
#RUN apt-get install -y libxslt-dev
#RUN docker-php-ext-install xsl

# Install xmlrpc
#RUN docker-php-ext-install xmlrpc

# Install zip
RUN docker-php-ext-install zip

# Install memcached
#COPY memcached-2.2.0.zip memcached-2.2.0.zip
#RUN apt-get install -y libmemcached-dev zlib1g-dev libncurses5-dev
#RUN mkdir /usr/src/php/ext/memcached-2.2.0
#RUN unzip memcached-2.2.0.zip -d /usr/src/php/ext/memcached-2.2.0
#RUN rm memcached-2.2.0.zip
#RUN docker-php-ext-install memcached-2.2.0

# Install mongo
#RUN pecl install mongodb-beta
#RUN echo "extension=mongo.so" > /usr/local/etc/php/conf.d/mongo.ini

# Install ftp
#RUN docker-php-ext-install ftp

# Install intl
RUN apt-get install -y zlib1g-dev libicu-dev g++ \
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl

# Install libXL
RUN apt-get install -y libxml2-dev git wget
RUN wget http://www.libxl.com/download/libxl-lin-3.7.2.tar.gz \
    && tar -zxv -f libxl-lin-3.7.2.tar.gz \
    && cd libxl-3.7.2.0/ \
    && cp lib64/libxl.so /usr/lib/libxl.so \
    && mkdir -p /usr/include/libxl_c/ \
    && cp include_c/* /usr/include/libxl_c/

RUN git clone https://github.com/iliaal/php_excel.git -b php7 \
    && cd php_excel \
    && phpize \
    && ./configure --with-php-config=$(which php-config) --with-libxl-incdir=/usr/include/libxl_c/ --with-libxml-dir=/usr/include/libxml2/ --with-excel \
    && make \
    && make install
RUN docker-php-ext-enable excel \
    && sed -i '1 a excel.license_name="David Akopyan"' /usr/local/etc/php/conf.d/docker-php-ext-excel.ini \
    && sed -i '1 a excel.license_key="linux-ead61b709ca6a4180c0f233748o2g8q3"' /usr/local/etc/php/conf.d/docker-php-ext-excel.ini \
    && sed -i '1 a excel.skip_empty=0' /usr/local/etc/php/conf.d/docker-php-ext-excel.ini

# Install SOAP
RUN docker-php-ext-install soap

# Install pcntl
RUN docker-php-ext-install pcntl

# Install wkhtmltopdf
RUN apt-get install -y libxrender1 fontconfig xvfb  \
    && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -P /tmp/  \
    && cd /opt/  \
    && tar xf /tmp/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz  \
    && ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

# Install vim
RUN apt-get install -y vim

RUN ln -s /usr/local/bin/php /usr/bin/php

#install MC
RUN apt-get install -y mc

#install ps
RUN apt-get install -y procps

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN pecl install xdebug-2.6.1 && docker-php-ext-enable xdebug \
    && sed -i '1 a xdebug.remote_autostart=true' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && sed -i '1 a xdebug.remote_mode=req' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && sed -i '1 a xdebug.remote_handler=dbgp' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && sed -i '1 a xdebug.remote_host=192.168.100.5 ' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && sed -i '1 a xdebug.remote_port=9001' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && sed -i '1 a xdebug.remote_enable=1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
