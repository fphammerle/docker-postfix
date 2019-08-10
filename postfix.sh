#!/bin/sh

set -ex

# http://www.postfix.org/postconf.5.html#alias_database
# http://www.postfix.org/newaliases.1.html
newaliases

# http://www.postfix.org/MAILLOG_README.html
postconf -e maillog_file=/dev/stdout

exec postfix start-fg
