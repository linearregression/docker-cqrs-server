.PHONY: all buildit start stop clean realclean

all: start

buildit: ./build build/cqrs-server/.git build/dfwfw/.git build/dynamodb/.git build/kafka/.git build/zookeeper/.git
	cp -f priv/cqrs-server-dockerfile build/cqrs-server/Dockerfile
	docker-compose build

start: buildit
	docker-machine scp priv/dfwfw.conf $(DOCKER_MACHINE_NAME):/home/docker/dfwfw.conf
	docker-compose up -d

stop:
	docker-compose stop

clean: stop
	-docker-compose down

realclean: clean
	@docker rm -v $(shell docker ps -a -q -f status=exited) 2>/dev/null || true
	@docker rmi $(shell docker images -q) 2>/dev/null || true
	@docker rm $(shell docker ps -a -q) 2>/dev/null || true
	@rm -rf ./xbuild

./build:
	mkdir -p ./build

build/cqrs-server/.git:
	git clone https://github.com/norton/cqrs-server.git build/cqrs-server

build/dfwfw/.git:
	git clone https://github.com/norton/dfwfw.git build/dfwfw

build/dynamodb/.git:
	git clone https://github.com/norton/docker_aws_dynamodb_local.git build/dynamodb

build/kafka/.git:
	git clone https://github.com/norton/kafka-docker.git build/kafka

build/zookeeper/.git:
	git clone https://github.com/norton/zookeeper-docker.git build/zookeeper
