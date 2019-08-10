#!/bin/sh

set -e

echo "$POSTMAP_PATHS" | while IFS= read -r postmap_path; do
    [ -z "$postmap_path" ] || (set -x; postmap "$postmap_path")
done

set -x

# http://www.postfix.org/postconf.5.html#alias_database
# http://www.postfix.org/newaliases.1.html
newaliases

exec postfix start-fg
