# docker-cqrs-server
Docker musings for a cqrs-server container

See [Makefile](./Makefile) for details.

```
$ make

$ docker-machine ssh dev

Edit and save the profile file to add the "--iptables=false" line:

$ sudo vi /var/lib/boot2docker/profile
$ cat /var/lib/boot2docker/profile

EXTRA_ARGS='
--label provider=virtualbox
--iptables=false

'
CACERT=/var/lib/boot2docker/ca.pem
DOCKER_HOST='-H tcp://0.0.0.0:2376'
DOCKER_STORAGE=aufs
DOCKER_TLS=auto
SERVERKEY=/var/lib/boot2docker/server-key.pem
SERVERCERT=/var/lib/boot2docker/server.pem

$ sudo /etc/init.d/docker restart

$ exit
```

## Prerequisites (Mac OS X)

- https://github.com/norton/docker-machine
- https://github.com/norton/dfwfw
- https://github.com/norton/docker_aws_dynamodb_local
- https://github.com/norton/zookeeper-docker
- https://github.com/norton/kafka-docker
- https://github.com/norton/cqrs-server
