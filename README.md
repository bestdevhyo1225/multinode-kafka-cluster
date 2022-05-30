# multinode-kafka-cluster

## kafka-cluster

### Kafka(broker) Service Ports

- default port : 9092

### ZooKeeper Service Ports

- clientPort : 2181
- peerport : 2888
- leaderport : 3888

### 디렉터리 생성

```
mkdir -p kafka-data kafka-varlog zookeeper-data zookeeper-varlog
```

### 디렉터리 권한(chown) 변경

- uid=1000(appuser) gid=1000(appuser)

```
chown -R 1000.1000 kafka-data kafka-varlog zookeeper-data zookeeper-varlog
```

## ZooKeeper 옵션 정리

- `ZOOKEEPER_SERVER_ID` : 주키퍼 클러스터 구성을 위한 서버 설정이며, server.myid 형식으로 사용한다.
- `ZOOKEEPER_CLIENT_PORT` : 주키퍼 사용 TCP 포트
- `ZOOKEEPER_TICK_TIME` : 주키퍼가 사용하는 시간에 대한 기본 기본 측정 단위 (밀리초)
- `ZOOKEEPER_INIT_LIMIT` : 팔로워가 리더와 초기에 연결하는 시간에 대한 타임 아웃 tick의 수
- `ZOOKEEPER_SYNC_LIMIT` : 팔로워와 리더가 동기화 하는 시간에 대한 타임 아웃 tick의 수 (주키퍼에 저장된 데이터가 크면 수를 늘려야한다.)
- `ZOOKEEPER_DATA_DIR` : 주키퍼의 트랜잭션 로그와 스냅샷이 저장되는 데이터 저장 경로이다.
