# Docker 기반의 Kafka 클러스터 구성하기

## Kafka 클러스터

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

- `ZOOKEEPER_SERVER_ID` : 주키퍼 서버 ID
- `ZOOKEEPER_CLIENT_PORT` : 주키퍼 사용 TCP 포트
- `ZOOKEEPER_TICK_TIME` : 주키퍼가 사용하는 시간에 대한 기본 기본 측정 단위 (밀리초)
- `ZOOKEEPER_INIT_LIMIT` : 팔로워가 리더와 초기에 연결하는 시간에 대한 타임 아웃 tick의 수
- `ZOOKEEPER_SYNC_LIMIT` : 팔로워와 리더가 동기화 하는 시간에 대한 타임 아웃 tick의 수 (주키퍼에 저장된 데이터가 크면 수를 늘려야한다.)
- `ZOOKEEPER_DATA_DIR` : 주키퍼의 트랜잭션 로그와 스냅샷이 저장되는 데이터 저장 경로이다.
- `ZOOKEEPER_SERVERS` : 주키퍼 클러스터 구성을 위한 서버 설정이며, server.myid 형식으로 사용한다.

## Kafka 옵션 정리

- `KAFKA_BROKER_ID` : 브로커를 구분하기 위한 ID
- `KAFKA_ZOOKEEPER_CONNECT` : 주키퍼 접속 정보
- `KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR` : offsets 토픽의 리플리케이션 팩터
- `KAFKA_NUM_PARTITIONS` : 파티션 수 옵션을 주지 않았을 경우의 기본 값
- `KAFKA_LOG_RETENTION_HOURS` : 저장된 로그의 보관 주기
- `LOG_DIR` : 로그가 저장되는 위치

## CMAK 설정

- `Cluster Zookeeper Hosts` : `172.30.0.3:12181,172.30.0.5:22181,172.30.0.7:32181/hyo-kafka/01`
- [CMAK 설정 관련 링크](https://program-error-review.tistory.com/52)

## listeners 와 advertised.listeners 차이

### listeners

카프카 브로커가 내부적으로 바인딩하는 주소이다.

### advertised.listeners

카프카 `Producer`, `Consumer` 에게 노출할 주소이다. 설정하지 않을 경우에는 디폴트로 listners 설정을 따른다.

### listeners 와 advertised.listeners 가 별도로 존재하는 이유

만약 우리의 Kafka 서버가 3개의 랜카드를 장착중이고 A,B,C 라는 IP를 각각 부여 받아 사용중이고, 해당 서버에는 Kafka 서비스와, 그 Kafka의 Topic을 구독중인 별도의 Test라는 서비스가
실행중이라고 생각해보자.

우리의 Test 서비스는 Kafka 서비스와 같은 PC에서 구동중이기에 localhost 또는 127.0.0.1 이라는 주소로 kafka에 접근이 가능하다.

그러나 A,B,C 라는 IP로 접근을 하려는 외부 서비스들이 있을 경우, 특정 IP로 접근한 요청들은 Kafka에 접근하지 못하게 해야하는 경우가 있다.

예를들어 우리의 서버는 localhost로 접근하는 내부 서비스와 B라는 IP로 접근하는 외부 서비스만 Kafka에 접근 할 수 있게 하고 싶은 경우에는 아래와 같은 설정을 할 수 있다.

```markdown
listeners=PLAINTEXT://localhost:9092
advertised.listeners==PLAINTEXT://B:9092
```
