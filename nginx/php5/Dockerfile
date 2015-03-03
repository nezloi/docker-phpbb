#
# Install imagemagic, php5, some php extentions
#

# Pull base image.
FROM phusion/baseimage

# Install 
RUN \
	apt-get update && \
	apt-get install -y php5 php5-mysql php5-gd php5-fpm imagemagick unzip  && \
	sed -e 's/\/var\/run\/php5-fpm.sock/9000/' -i /etc/php5/fpm/pool.d/www.conf && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Runit php-fpm  service
ADD php-fpm.sh /etc/service/php-fpm/run

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
