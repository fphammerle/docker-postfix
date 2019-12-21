FROM alpine:3.10

RUN apk add --no-cache postfix

# http://www.postfix.org/MAILLOG_README.html
RUN postconf -F | grep -E '^postlog/unix-dgram/service = postlog$' \
    && postconf -evv maillog_file=/dev/stdout \
    && postfix check

# http://www.postfix.org/postconf.5.html#queue_directory
VOLUME /var/spool/postfix

EXPOSE 25/tcp
COPY postfix.sh /
CMD ["/postfix.sh"]
