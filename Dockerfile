# nginx php centos
#
# Version:1.0.0

FROM centos:7
MAINTAINER sunny5156 <137898350@qq.com>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install initscripts;
RUN yum -y install sudo;

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# add nginx repo
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Install supervisor
RUN yum install -y python-setuptools; yum clean all
RUN easy_install pip
RUN pip install supervisor

# Install nginx
RUN yum -y install nginx; yum clean all;

# Install PHP
RUN yum -y --enablerepo=remi,remi-php72 --skip-broken install \
				php-amqp \
				php-redis \
				php-mongodb \
				php-memcache \
				php-fpm \
				php-common \
				php-cli \
				php-pdo  \
				php-mysql \
				php-gd \
				php-imap \
				php-ldap \
				php-odbc \
				php-opcache \
				php-pear \
				php-xml \
				php-devel \
				php-xmlrpc \
				php-mbstring \
				php-mcrypt \
				php-bcmath \
				php-mhash \
				libmcrypt; yum clean all;

# Add the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Add the file
ADD index.php /var/www/html/index.php

#Add supervisord conf
ADD supervisord.conf /etc/supervisord.conf

RUN chkconfig nginx on
RUN chkconfig php-fpm on

ADD init.sh  /init.sh
RUN chmod +x /init.sh

#RUN sudo /init.sh

#Open firewall ports
#RUN firewall-cmd --permanent --add-service=http
#RUN firewall-cmd --permanent --add-service=https
#RUN firewall-cmd --reload

# Set the port to 80 443
EXPOSE 80 443

#CMD ["/usr/bin/supervisord"]
#CMD /usr/bin/supervisord -n -c /etc/supervisord.conf
CMD ["/init.sh"]
