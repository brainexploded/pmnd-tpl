#!/bin/sh

sudo supervisord -c /etc/supervisord.conf &

php-fpm -F

