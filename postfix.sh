#!/bin/sh

set -e

echo "$POSTMAP_PATHS" | while IFS= read -r postmap_path; do
    # by default, postmap runs setresuid(file owner).
    # disable via -o cause file owner might not have write perms on dir
    # (e.g., due to dockerd --userns-remap).
    [ -z "$postmap_path" ] || (set -x; postmap -o "$postmap_path")
done

set -x

# http://www.postfix.org/postconf.5.html#alias_database
# http://www.postfix.org/newaliases.1.html
newaliases

exec postfix start-fg
