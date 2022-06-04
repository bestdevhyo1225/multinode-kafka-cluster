docker stop kafka1 zookeeper1 kafdrop kafka_manager
docker rm kafka1 zookeeper1 kafdrop kafka_manager
docker network rm node1_kafka-net
docker volume prune -f

# Data 파일 삭제
#rm -rf node1/kafka-data node1/kafka-varlog node1/zookeeper-data node1/zookeeper-varlog
