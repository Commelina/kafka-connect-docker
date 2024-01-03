#!/bin/bash

mode=${CONNECT_MODE:-standalone}

/opt/envsubst \
    -i /etc/kafka/connect-${mode}.properties.tmpl \
    -o /etc/kafka/connect.properties

if [[ -n ${JMX_EXPORTER_PORT} ]]; then
    export KAFKA_OPTS="${KAFKA_OPTS} -javaagent:/opt/jmx.jar=${JMX_EXPORTER_PORT}:/etc/kafka/jmx.yaml"
fi

/opt/kafka/bin/connect-${mode}.sh /etc/kafka/connect.properties
