FROM wordpress:php7.4-apache

RUN echo "upload_max_filesize = 30M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 30M" >> /usr/local/etc/php/conf.d/uploads.ini

# Configurar ServerName para eliminar el aviso en los logs
RUN echo "ServerName localhost:8080" >> /etc/apache2/apache2.conf
