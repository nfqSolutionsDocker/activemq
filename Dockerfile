FROM alpine:3.6

MAINTAINER solutions@nfq.com

COPY soft /active
COPY entrypoint.sh /

RUN ln -sf /active/bin/activemq /usr/local/bin/activemq && \
    apk update && \
    chmod +x /entrypoint.sh && \
    apk add openjdk8

VOLUME /active/data
# Expose all port
EXPOSE 61616 5672 61613 1883 61614 8161 1883

CMD ["/bin/sh", "-c", "activemq console"]