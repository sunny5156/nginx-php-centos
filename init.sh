#!/bin/bash

chkconfig nginx on;
chkconfig php-fpm on;

service nginx restart;
service php-fpm restart;