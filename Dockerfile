FROM alpine:3.8

RUN find / -xdev -type f -perm /u+s -exec chmod --changes u-s {} \; \
    && find / -xdev -type f -perm /g+s -exec chmod --changes g-s {} \;

RUN apk add tini
ENTRYPOINT ["/sbin/tini", "-s", "--"]

RUN apk add postfix

COPY smtp-tls-trusted-ca.pem /etc/postfix/smtp-tls-trusted-ca.pem
COPY smtp-tls-policy-map /etc/postfix/smtp-tls-policy-map
RUN postmap /etc/postfix/smtp-tls-policy-map

EXPOSE 25
COPY main.cf /etc/postfix/main.cf
RUN postfix check

ENV POSTFIX_RELAYHOST ""
ENV POSTFIX_RELAY_DOMAINS ""
# TODO run as unprivileged user?
CMD postconf -ev relayhost="$POSTFIX_RELAYHOST" \
 && postconf -ev relay_domains="$POSTFIX_RELAY_DOMAINS" \
 && postconf -ev syslog_name="$HOSTNAME/pstfx" \
 && postfix start-fg
