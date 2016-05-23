#!/bin/bash

chkconfig nginx on;
chkconfig php-fpm on;

systemctl start nginx.service;
systemctl start php-fpm.service;
