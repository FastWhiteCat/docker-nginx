FROM nginx:1.10.1

COPY nginx-magento.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/
