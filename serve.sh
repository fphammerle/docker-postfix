#!/bin/sh

function set_option {
    (set -x; postconf -evv "$1=$2")
}

[ -z "$POSTFIX_RELAYHOST" ] || set_option relayhost "$POSTFIX_RELAYHOST"
[ -z "$POSTFIX_RELAY_DOMAINS" ] || set_option relay_domains "$POSTFIX_RELAY_DOMAINS"
set_option syslog_name "$(hostname)/pstfx"

set -x
exec postfix start-fg
