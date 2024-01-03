FROM amazoncorretto:17

RUN curl \
    -L https://github.com/a8m/envsubst/releases/download/v1.4.2/envsubst-Linux-x86_64 \
    -o /opt/envsubst \
    && chmod +x /opt/envsubst

ENV KAFKA_VERSION=3.5.2
ENV SCALA_VERSION=2.13
ENV JMX_VERSION=0.19.0
ENV KAFKA_PKG_NAME=kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

COPY entrypoint.sh /opt/entrypoint.sh
COPY install-connector.sh /opt/install-connector.sh
COPY etc/* /etc/kafka/

RUN yum install -y tar gzip unzip
RUN curl \
    -L https://downloads.apache.org/kafka/${KAFKA_VERSION}/${KAFKA_PKG_NAME} \
    -o /opt/kafka.tgz \
    && mkdir /opt/kafka && tar -zxf /opt/kafka.tgz --strip 1 -C /opt/kafka \
    && rm /opt/kafka.tgz

RUN /opt/install-connector.sh /opt/connectors https://github.com/hstreamdb/kafka-connect-docker/releases/download/v0.0.1/confluentinc-kafka-connect-datagen-0.6.3.zip

RUN curl \
    -L https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_VERSION}/jmx_prometheus_javaagent-${JMX_VERSION}.jar \
    -o /opt/jmx.jar

CMD ["bash", "-c", "/opt/entrypoint.sh && /opt/kafka/bin/connect.sh /etc/kafka/connect.properties"]
