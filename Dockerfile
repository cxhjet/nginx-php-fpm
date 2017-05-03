FROM cxhjet/php5.6
RUN apt-get update 
RUN echo deb http://nginx.org/packages/debian/ jessie nginx >> /etc/apt/sources.list \
    && echo deb-src http://nginx.org/packages/debian/ jessie nginx >> /etc/apt/sources.list \
    && apt-get install -y wget \
    && wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key && apt-get update && apt-get install -y nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN apt-get install  -y  supervisor
ADD ./supervisord.conf /etc/supervisor/supervisord.conf
ADD ./start.sh /start.sh

STOPSIGNAL SIGQUIT

EXPOSE 443 80
CMD ["/start.sh"]
