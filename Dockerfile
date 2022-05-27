FROM alpine:3.16.0

ARG POSTFIX_PACKAGE_VERSION=3.6.6-r0
# http://www.postfix.org/postconf.5.html#tls_append_default_CA
# https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/
ARG MOZILLA_CA_CERT_STORE_PACKAGE_VERSION=20211220-r0
RUN apk add --no-cache \
        ca-certificates=$MOZILLA_CA_CERT_STORE_PACKAGE_VERSION \
        postfix=$POSTFIX_PACKAGE_VERSION \
    && postconf -evv tls_append_default_CA=no `# default, but better be safe`

# http://www.postfix.org/MAILLOG_README.html
RUN postconf -F | grep -E '^postlog/unix-dgram/service = postlog$' \
    && postconf -evv maillog_file=/dev/stdout \
    && postfix check

# http://www.postfix.org/postconf.5.html#queue_directory
VOLUME /var/spool/postfix

EXPOSE 25/tcp
COPY postfix.sh /
CMD ["/postfix.sh"]
