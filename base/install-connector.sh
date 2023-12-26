#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid Arguements, e.g.: ./install-connectors.sh <TARGET_DIR> <CONNECTOR_URL>"
    exit 1
fi

set -x

TARGET_DIR=$1
CONNECTOR_URL=$2

if [[ ! -d $TARGET_DIR ]]; then
    mkdir $TARGET_DIR -p
fi

cd $TARGET_DIR

if [[ $CONNECTOR_URL == *.tar.gz ]]; then
    curl -s -L $CONNECTOR_URL | tar -zxf - -C .
elif [[ $CONNECTOR_URL == *.zip ]]; then
    TMP_FILE=$(mktemp --suffix=.zip) && \
    curl -s -L $CONNECTOR_URL -o $TMP_FILE && unzip $TMP_FILE && \
    rm $TMP_FILE
else
    echo "unsupported url:${CONNECTOR_URL}"
    echo "plugin file must be *.tar.gz, *.zip"
    exit 1
fi
