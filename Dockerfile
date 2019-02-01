FROM nimmis/apache

MAINTAINER facha <eu@nunofacha.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt-get update -y
RUN apt-get install -y php7.1 libapache2-mod-php  \
php7.1-fpm php7.1-cli php7.1-mysql php7.1-pgsql php7.1-sqlite3 php7.1-redis \
php7.1-apcu php7.1-intl php7.1-imagick php7.1-mcrypt php7.1-json php7.1-gd php7.1-curl && \
phpenmod mcrypt && \
rm -rf /var/lib/apt/lists/* && \
cd /tmp && curl -sS https://getcomposer.org/installer | php7.1 && mv composer.phar /usr/local/bin/composer
RUN composer global require hirak/prestissimo
