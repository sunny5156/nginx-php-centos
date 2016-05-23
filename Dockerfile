# PHP\Python\NodeJS
# 
# Version:1.0.0

FROM centos:7
MAINTAINER sunny5156 <137898350@qq.com>

ENV REFRESHED_AT 2015-06-05

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

RUN rpm -ivh http://nginx.org/packages/centos/6/x86_64/RPMS/nginx-1.8.1-1.el6.ngx.x86_64.rpm

#ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Install supervisor
RUN yum install -y python-setuptools; yum clean all
RUN easy_install pip
RUN pip install supervisor

# Install nginx 
#RUN yum -y install nginx; yum clean all

# Install PHP
RUN yum -y --enablerepo=remi,remi-php56 --skip-broken install php-fpm php-common php-cli php-pdo php-mysql php-gd php-imap php-ldap php-odbc php-opcache php-pear php-xml php-devel php-xmlrpc php-mbstring php-mcrypt php-bcmath php-mhash libmcrypt; yum clean all

# Add the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Add the configuration file of the Supervisor
ADD supervisord.conf /etc/

# Add the file
ADD index.php /var/www/index.php

# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord", "-n"]