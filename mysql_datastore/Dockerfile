FROM busybox
RUN \
	adduser -H -D mysql mysql && \
	mkdir /var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql

VOLUME /var/lib/mysql
CMD /bin/sh
