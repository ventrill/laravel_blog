FROM nginx

RUN mkdir -p /var/www/html
RUN mkdir -p /var/www/html/public
#RUN mkdir -p /var/www/html/web
# Change Nginx config here...
RUN rm /etc/nginx/conf.d/default.conf
ADD ./erp.conf /etc/nginx/conf.d/erp.conf
#ADD ./web.conf /etc/nginx/conf.d/web.conf
#ADD ./web_admin.conf /etc/nginx/conf.d/web_admin.conf
