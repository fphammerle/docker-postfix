#!/bin/sh

set -ex

# http://www.postfix.org/MAILLOG_README.html
postconf -e maillog_file=/dev/stdout

exec postfix start-fg
