FROM alpine:3.10

RUN apk add postfix

# http://www.postfix.org/MAILLOG_README.html
RUN postconf -F | grep -E '^postlog/unix-dgram/service = postlog$' \
    && postfix check

EXPOSE 25/tcp
COPY postfix.sh /
CMD ["/postfix.sh"]
