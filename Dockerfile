FROM nimmis/apache

MAINTAINER facha <eu@nunofacha.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt-get update -y
RUN apt-get install -y php7.2 libapache2-mod-php7.2  \
php7.2-fpm php7.2-cli php7.2-mysql php7.2-pgsql php7.2-sqlite3 php7.2-redis \
php7.2-apcu php7.2-intl php7.2-imagick php7.2-json php7.2-gd php7.2-curl php-curl && \
phpenmod mcrypt && \
rm -rf /var/lib/apt/lists/* && \
a2enconf php7.2-fpm && \
cd /tmp && curl -sS https://getcomposer.org/installer | php7.2 && mv composer.phar /usr/local/bin/composer
RUN composer global require hirak/prestissimo
