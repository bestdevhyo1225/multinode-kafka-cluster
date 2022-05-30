#!/usr/bin/env bash

# zookeeper1, kafka1, kafdrop 도커 컨테이너 실행
docker-compose -f node1/docker-compose.yml up -d

# zookeeper2, kafka2 도커 컨터이너 실행
docker-compose -f node2/docker-compose.yml up -d

# zookeeper3, kafka3 도커 컨터이너 실행
docker-compose -f node3/docker-compose.yml up -d
