#!/bin/sh

function set_option {
    (set -x; postconf -evv "$1=$2")
}

# http://www.postfix.org/postconf.5.html
[ -z "$POSTFIX_RELAYHOST" ] || set_option relayhost "$POSTFIX_RELAYHOST"
[ -z "$POSTFIX_RELAY_DOMAINS" ] || set_option relay_domains "$POSTFIX_RELAY_DOMAINS"
# TODO log to stdout (requires postfix >= 3.4)
# http://www.postfix.org/announcements/postfix-3.4.0.html
# http://www.postfix.org/MAILLOG_README.html
set_option syslog_name "$(hostname)/pstfx"

set -x
exec postfix start-fg
