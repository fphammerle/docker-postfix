FROM alpine:3.11

ARG POSTFIX_PACKAGE_VERSION=3.4.8-r0
RUN apk add --no-cache postfix=$POSTFIX_PACKAGE_VERSION

# http://www.postfix.org/MAILLOG_README.html
RUN postconf -F | grep -E '^postlog/unix-dgram/service = postlog$' \
    && postconf -evv maillog_file=/dev/stdout \
    && postfix check

# http://www.postfix.org/postconf.5.html#queue_directory
VOLUME /var/spool/postfix

EXPOSE 25/tcp
COPY postfix.sh /
CMD ["/postfix.sh"]
