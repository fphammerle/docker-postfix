FROM alpine:3.10

RUN apk add postfix

# http://www.postfix.org/MAILLOG_README.html
RUN postconf -F | grep -E '^postlog/unix-dgram/service = postlog$' \
    && postconf -evv maillog_file=/dev/stdout \
    && postfix check

EXPOSE 25/tcp
CMD ["postfix", "start-fg"]
