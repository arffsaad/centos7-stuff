#!/bin/bash
# Add repos

yum -y -q install wget curl epel-release
yum install -y -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y -q https://rpms.remirepo.net/enterprise/remi-release-7.rpm
echo "Added Repos"

# Install PHP8.0

echo "Installing latest PHP version..."
yum install -y yum-utils
yum-config-manager --enable remi-php80
yum install php php-gd php-intl php-mbstring php-pdo php-process php-xml php-cli php-mcrypt php-fpm php-zip -y
echo "PHP Installed"

# Check Version 
echo "Checking PHP Version..."
php -v

# Install Composer
echo "Installing Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
echo "Installing Laravel..."
composer global require laravel/installer
composer global require laravel/laravel

echo "Laravel Installed. Use 'composer create-project laravel/laravel projectname' to create your project!"
