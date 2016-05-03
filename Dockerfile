FROM jeanblanchard/java:8
MAINTAINER James Z.M. Gao <gaozm55@gmail.com>

# Download
ADD http://downloads.sourceforge.net/project/davmail/davmail/4.7.2/davmail-linux-x86_64-4.7.2-2427.tgz /opt/
COPY content /

# untar file, add a non-root system user
# note we specify a id so as to *try* to avoid collisions on the host
RUN apk --update upgrade && \
    cd /opt && \
    tar -xzv -f davmail-linux-x86_64-4.7.2-2427.tgz && \
    mv /opt/davmail-*/* /opt/davmail/ && \
    rm -rf /var/cache/apk/* /tmp/* /opt/davmail-* && \
    adduser -S -u 500 -h /var/lib/davmail davmail && \
    chmod 0644 /etc/davmail/*

USER davmail

EXPOSE     1080
EXPOSE     1143
EXPOSE     1389
EXPOSE     1110
EXPOSE     1025
WORKDIR    /opt/davmail
ENTRYPOINT ["/opt/davmail/entrypoint.sh"]
