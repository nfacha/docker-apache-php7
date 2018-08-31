FROM nimmis/apache

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y php libapache2-mod-php  \
php-fpm php-cli php-mysqlnd php-pgsql php-sqlite3 php-redis \
php-apcu php-intl php-imagick php-mcrypt php-json php-gd php-curl && \
phpenmod mcrypt && \
rm -rf /var/lib/apt/lists/* && \
cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN composer global require hirak/prestissimo
RUN composer global require "phpunit/phpunit=4.1.*"
RUN composer global require "phpunit/php-invoker=~1.1."
RUN composer global require "fxp/composer-asset-plugin:~1.3"
