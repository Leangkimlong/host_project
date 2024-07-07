# Dockerfile

# Use the official PHP image with Apache as the base image
FROM php:7.4-apache

# Install dependencies
RUN docker-php-ext-install pdo pdo_mysql \
    && a2enmod rewrite

# Copy existing application directory contents to the container working directory
COPY . /var/www/html

# Change Apache document root
RUN sed -i -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# Expose port 8000 and start Apache
EXPOSE 8000
CMD ["apache2-foreground"]
