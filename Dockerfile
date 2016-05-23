# PHP\Python\NodeJS
# 
# Version:1.0.0

FROM centos:7
MAINTAINER sunny5156 <137898350@qq.com>


RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

#RUN rpm -ivh http://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.8.1-1.el7.ngx.x86_64.rpm

#ADD nginx.repo /etc/yum.repos.d/nginx.repo

#Install sudo
RUN yum -y install sudo;

# Install nginx 
RUN yum -y install nginx; yum clean all

# Install PHP
RUN yum -y --enablerepo=remi,remi-php56 --skip-broken install php-fpm php-common php-cli php-pdo php-mysql php-gd php-imap php-ldap php-odbc php-opcache php-pear php-xml php-devel php-xmlrpc php-mbstring php-mcrypt php-bcmath php-mhash libmcrypt; yum clean all

# Add the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Add the file
ADD index.php /var/www/html/index.php

RUN chkconfig nginx on
RUN chkconfig php-fpm on

RUN sudo systemctl start nginx.service
RUN sudo systemctl start php-fpm.service

# Set the port to 80 
EXPOSE 80

# Executing supervisord
#CMD ["supervisord", "-n"]

#ADD init.sh /var/www/init.sh
#RUN chmod +x /var/www/init.sh

#RUN sh /var/www/init.sh