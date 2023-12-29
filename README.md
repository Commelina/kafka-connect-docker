# Kafka Connect Images

* hstreamdb/kafka-connect-base: base kafka connect image, which only includes the basic connectors(DatagenConnector, FileStreamConnector).
* hstreamdb/kafka-connect-full: includes built-in rich connector plugins(and all the connectors are under stardand Open-Source Licenses).

## Quickstart

Standalone Mode:
```
docker run -it --rm --network=host
  -e KAFKA_BOOTSTRAP_SERVERS=localhost:9092 \
  hstreamdb/kafka-connect-base
```

Distributed Mode:
```
docker run -it --rm --network=host
  -e KAFKA_BOOTSTRAP_SERVERS=localhost:9092 \
  -e CONNECT_MODE=distributed \
  hstreamdb/kafka-connect-base
```

The default kafka-connect port is 8083.
