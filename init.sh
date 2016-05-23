#!/bin/bash

chkconfig nginx on;
chkconfig php-fpm on;

systemctl nginx restart;
systemctl php-fpm restart;