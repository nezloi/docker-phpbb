FROM busybox

WORKDIR /tmp/phpbb
RUN \
	mkdir -p /etc/nginx/conf.d /www/phpbb && \
	wget https://www.phpbb.com/files/release/phpBB-3.1.3.zip -O phpbb.zip && \
	wget https://www.phpbb.com/customise/db/download/109011 -O phpbb-rus.zip && \
	unzip phpbb.zip -qq -d . && \
	unzip phpbb-rus.zip -d . && \
	mv phpBB/* /www/phpbb/ && \
	mv russian_1_1_3/* /www/phpbb/

VOLUME /etc/nginx/conf.d
VOLUME /www
CMD /bin/sh
