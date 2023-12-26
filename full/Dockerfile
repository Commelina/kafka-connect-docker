FROM hstreamdb/kafka-connect-base

ARG CONNECTOR_URLS
RUN for i in $CONNECTOR_URLS; do /opt/install-connector.sh /opt/connectors $i; done
