# docker container: postfix

docker hub: https://hub.docker.com/r/fphammerle/postfix/

dockerfile repo: https://git.hammerle.me/fphammerle/docker-postfix

config notes: https://git.hammerle.me/fphammerle/config-postfix/src/master/README.md

```sh
sudo docker run --detach \
    --security-opt=no-new-privileges \
    --volume /dev/log:/dev/log \
    --env POSTFIX_RELAYHOST=relayhost.example.com:submission \
    --env POSTFIX_RELAY_DOMAINS=example.com \
    --publish 127.0.0.1:25:25 \
    --restart unless-stopped \
    --name postfix \
    fphammerle/postfix:3.3.0-amd64-relay-secure
```

optional: enable usernamespace mode via daemon option `userns-remap`
