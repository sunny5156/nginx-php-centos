#nginx-php-centos

使用Docker搭建nginx php 环境,通过Supervisord管理启动.



## 使用命令

```

docker run --privileged --restart=always -it -d --name="nginx-php-centos"  -p 80:80 -p 443:443 -p 9001:9001 -v /data/nginx-php-centos:/data  daocloud.io/sunny5156/docker-nginx-php /bin/bash /init.sh



```

## web管理

```

服务器ip:9001

账号:admin

密码:admin

```



## Supervisord配置

更多详细的配置，请参考 http://supervisord.org/



