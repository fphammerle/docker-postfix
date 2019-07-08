# postfix ✉️ 🐳

Mail Server http://www.postfix.org/documentation.html

```sh
docker run --rm -p 25:25 fphammerle/postfix
```

config docs: http://www.postfix.org/postconf.5.html

```sh
docker run --name postfix \
    --volume $PWD/main.cf:/etc/postfix/main.cf:ro \
    --detach --restart unless-stopped \
    --security-opt=no-new-privileges \
    --publish 25:25 \
    fphammerle/postfix
```

Optionally enable user namespace remapping via docker daemon option `userns-remap`.
