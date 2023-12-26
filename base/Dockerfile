FROM amazoncorretto:17

RUN curl \
    -L https://github.com/a8m/envsubst/releases/download/v1.4.2/envsubst-Linux-x86_64 \
    -o /opt/envsubst \
    && chmod +x /opt/envsubst

ENV KAFKA_VERSION=3.5.2
ENV SCALA_VERSION=2.13
ENV KAFKA_PKG_NAME=kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
RUN yum install -y tar gzip
RUN curl \
    -L https://downloads.apache.org/kafka/${KAFKA_VERSION}/${KAFKA_PKG_NAME} \
    -o /opt/kafka.tgz \
    && mkdir /opt/kafka && tar -zxf /opt/kafka.tgz --strip 1 -C /opt/kafka \
    && rm /opt/kafka.tgz

COPY entrypoint.sh /opt/entrypoint.sh
COPY etc/* /etc/kafka/

CMD ["bash", "-c", "/opt/entrypoint.sh && /opt/kafka/bin/connect.sh /etc/kafka/connect.properties"]
