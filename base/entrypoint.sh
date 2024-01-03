#!/bin/bash

mode=${CONNECT_MODE:-standalone}

/opt/envsubst \
    -i /etc/kafka/connect-${mode}.properties.tmpl \
    -o /etc/kafka/connect.properties

cp /opt/kafka/bin/connect-${mode}.sh /opt/kafka/bin/connect.sh

exec "$@"
