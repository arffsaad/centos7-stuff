#!/bin/bash
# Add repos

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Install PHP8.0

yum install -y yum-utils
yum-config-manager --enable remi-php80
yum install php php-gd php-intl php-mbstring php-pdo php-process php-xml php-cli php-mcrypt php-fpm -y

# Check Version 
echo "Checking PHP Version..."
php -v

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer global require laravel/installer