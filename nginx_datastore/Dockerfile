FROM busybox

ADD https://www.phpbb.com/files/release/phpBB-3.1.3.zip /tmp/phpbb/phpbb.zip
ADD https://www.phpbb.com/customise/db/download/109011 /tmp/phpbb/phpbb-rus.zip
WORKDIR /tmp/phpbb
RUN \
	mkdir -p /etc/nginx/conf.d /www/phpbb && \
	unzip phpbb.zip -qq -d . && \
	unzip phpbb-rus.zip -d . && \
	mv phpBB3/* russian_1_1_3/* /www/phpbb/
ADD phpbb.conf /etc/nginx/conf.d/
VOLUME /etc/nginx/conf.d
VOLUME /www
CMD /bin/sh
