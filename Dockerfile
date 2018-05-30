FROM nginx:1.13.12-alpine

EXPOSE 80

ADD nginx.conf /etc/nginx/nginx.conf
ADD conf.d/ /etc/nginx/conf.d/

ADD 502.html /var/www/502.html

ADD start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

RUN rm /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log

CMD ["usr/local/bin/start.sh"]
