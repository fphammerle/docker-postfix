# Copyright (c) 2024 Fabian Peter Hammerle
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# SPDX-License-Identifier: EPL-2.0

FROM docker.io/alpine:3.21.0

# http://www.postfix.org/announcements.html
# https://git.alpinelinux.org/aports/log/main/postfix?h=3.20-stable
ARG POSTFIX_PACKAGE_VERSION=3.9.0-r1
# http://www.postfix.org/postconf.5.html#tls_append_default_CA
# https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/
# https://gitlab.alpinelinux.org/alpine/ca-certificates/-/commits/master
# https://git.alpinelinux.org/aports/log/main/ca-certificates?h=3.19-stable
ARG MOZILLA_CA_CERT_STORE_PACKAGE_VERSION=20240705-r0
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
