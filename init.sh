#!/bin/bash

chkconfig nginx on;
chkconfig php-fpm on;

sudo systemctl start nginx.service
sudo systemctl start php-fpm.service
