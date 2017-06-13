FROM nginx:1.10.1

RUN apt-get update && \
    apt-get install -y \
    curl

#RUN curl 'https://bintray.com/user/downloadSubjectPublicKey?username=bintray' | apt-key add -
#RUN echo "deb http://dl.bintray.com/donbeave/deb wheezy main" >> /etc/apt/sources.list

#RUN apt-get update && \
#    apt-get install -y \
#    ca-certificates nginx-pagespeed && \
#    rm -rf /var/lib/apt/lists/*

EXPOSE 80

ADD conf.d/ /etc/nginx/conf.d/

ADD 502.html /var/www/502.html

ADD start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["usr/local/bin/start.sh"]
