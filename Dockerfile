FROM jeanblanchard/java:8
LABEL maintainer="James Z.M. Gao <gaozm55@gmail.com>"

# Download
ADD http://downloads.sourceforge.net/project/davmail/davmail/5.1.0/davmail-5.1.0-2891.zip /opt/
COPY content /

# untar file, add a non-root system user
# note we specify a id so as to *try* to avoid collisions on the host
RUN set -ex \
    && apk --update --no-progress upgrade \
    && cd /opt \
    && mkdir -p davmail \
    && unzip davmail-5.1.0-2891.zip -d davmail \
    && rm -rf /var/cache/apk/* /tmp/* /opt/davmail-* \
    && adduser -S -u 500 -h /var/lib/davmail davmail \
    && chmod 0644 /etc/davmail/*

USER davmail

# if $DAVMAIL_SSL_PASS is not empty, use this file as keystoreFile of type PKCS12
VOLUME ["/etc/davmail/davmail.p12"]

EXPOSE     1080
EXPOSE     1993
EXPOSE     1636
EXPOSE     1995
EXPOSE     1587

WORKDIR    /opt/davmail
ENTRYPOINT ["/opt/davmail/entrypoint.sh"]
