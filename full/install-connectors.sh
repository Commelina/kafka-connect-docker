#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid Arguements, e.g.: ./install-connectors.sh <TARGET_DIR>"
    exit 1
fi

set -x

TARGET_DIR=$1
TGZS=( \
    'https://repo1.maven.org/maven2/io/debezium/debezium-connector-jdbc/2.4.1.Final/debezium-connector-jdbc-2.4.1.Final-plugin.tar.gz' \
    'https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/2.5.0.Final/debezium-connector-mysql-2.5.0.Final-plugin.tar.gz' \
    'https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/2.5.0.Final/debezium-connector-postgres-2.5.0.Final-plugin.tar.gz' \
    'https://repo1.maven.org/maven2/io/debezium/debezium-connector-mongodb/2.5.0.Final/debezium-connector-mongodb-2.5.0.Final-plugin.tar.gz' \
    )

cd $TARGET_DIR && \
    curl -s -L  | 

