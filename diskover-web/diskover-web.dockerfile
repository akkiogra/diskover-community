FROM php:7.4-fpm

# Install php ldap extension (Essential + versions only)
RUN apt-get update && \
    apt-get install -y libldap2-dev
RUN docker-php-ext-configure ldap
RUN docker-php-ext-install ldap

# Copy php.ini
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Copy existing application directory contents
COPY ./diskover-web /var/www

EXPOSE 8000
