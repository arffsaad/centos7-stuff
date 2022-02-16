#!/bin/bash

# prereqs
echo "Installing git..."
sudo yum -y -q install git

# Clone project from git repository
git clone https://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@github.com/arffsaad/parseapi.git


# copying files

echo "Copying files..."
cd parseapi
sudo cp -R call /var/www/call
sudo cp conf/call.conf /etc/nginx/conf.d/call.conf
sudo cp conf/fpm-call.conf /etc/php-fpm.d/fpm-call.conf

# permissions

echo "Creating Group and User 'call' ..."
sudo useradd call
sudo groupadd call

echo "Setting permissions and ownership..."
sudo chown -R call:call /etc/php-fpm.d/fpm-call.conf
sudo chown -R nginx:nginx /var/run/php-fpm/php-call-fpm.sock
sudo chown -R nginx:nginx /var/www/call/storage
sudo chmod -R ugo+rw /var/www/sitename/storage

# initialize project files

echo "Initializing project files..."
cd /var/www/call
composer install
cp .env.example .env
php artisan key:generate