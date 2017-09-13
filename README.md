#nginx-php-centos

使用命令
docker pull
docker run --privileged --restart=always -it -d --name="nginx-php-centos"  -p 80:80 -p 443:443 -v /data/nginx-php-centos:/data  镜像name /bin/bash
