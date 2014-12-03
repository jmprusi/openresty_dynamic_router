FROM 3scale/openresty

ADD supervisor/openresty.conf /etc/supervisor/conf.d/

COPY redis/redis.conf	    /etc/redis/redis.conf
COPY proxy_conf/nginx.conf  /opt/openresty/nginx/conf/nginx.conf
ADD  proxy_conf/conf/       /opt/openresty/nginx/conf/sites-enabled/proxy/
ADD  proxy_conf/lua         /opt/openresty/nginx/lua/

EXPOSE 80
EXPOSE 8080

CMD ["/etc/init.d/supervisor", "start"]
