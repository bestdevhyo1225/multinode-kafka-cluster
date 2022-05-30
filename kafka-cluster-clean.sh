docker stop kafka1 kafka2 kafka3 zookeeper1 zookeeper2 zookeeper3 kafdrop
docker rm kafka1 kafka2 kafka3 zookeeper1 zookeeper2 zookeeper3 kafdrop
docker network rm kafka-cluster-net
docker volume prune -f
