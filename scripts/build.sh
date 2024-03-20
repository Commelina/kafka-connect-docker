#!/usr/bin/bash

PROJECT_DIR="$(realpath $(dirname $0)/..)"
set -x

if [ $# -lt 1 ]; then
    echo "Usage: $0 <build-type> (base|full)"
    exit 1
fi

BUILD_TYPE=$1
shift

if [[ "$BUILD_TYPE" == "base" ]]; then
    docker build "$PROJECT_DIR"/base/ -t "hstreamdb/kafka-connect-base" "$@"
elif [[ "$BUILD_TYPE" == "full" ]]; then
    docker build --build-arg CONNECTOR_URLS="$(cat $PROJECT_DIR/full/full.list)" "$PROJECT_DIR"/full/ -t "hstreamdb/kafka-connect-full" "$@"
else
    echo "Invalid build type: $BUILD_TYPE"
    exit 1
fi
