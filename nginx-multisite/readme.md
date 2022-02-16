## Setting up multiple sites with nginx for Laravel

### Applies to nginx using conf.d and PHP8 (or whichever latest)

Requires:

- PHP-FPM
- nginx
- project files stored in /var/www/projectname

Steps:

- run multisite-nginx.sh

Steps (manual):

- Start and enable php-fpm
- create usergroup and user for site
- create backup for /etc/php-fpm.d/www.conf
- 