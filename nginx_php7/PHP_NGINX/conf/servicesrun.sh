#!/bin/bash

#Starting php
echo 'Starting php'
/usr/sbin/php-fpm

#Staring nginx
echo 'Staring nginx'
nginx -g 'daemon off;'

