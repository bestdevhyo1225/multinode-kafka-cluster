#!/usr/bin/env bash

# 도커 관련 삭제
docker stop kafka1 kafka2 kafka3 zookeeper1 zookeeper2 zookeeper3 kafka_manager
docker rm kafka1 kafka2 kafka3 zookeeper1 zookeeper2 zookeeper3 kafka_manager
docker network rm kafka-cluster-net
docker volume prune -f

# Data 파일 삭제
#rm -rf node1/kafka-data node1/kafka-varlog node1/zookeeper-data node1/zookeeper-varlog
#rm -rf node2/kafka-data node2/kafka-varlog node2/zookeeper-data node2/zookeeper-varlog
#rm -rf node3/kafka-data node3/kafka-varlog node3/zookeeper-data node3/zookeeper-varlog
