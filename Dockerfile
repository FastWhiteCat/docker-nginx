FROM nginx:1.10.1

EXPOSE 80

ADD conf.d/ /etc/nginx/conf.d/

ADD start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD start.sh
