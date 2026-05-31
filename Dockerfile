FROM bitnami/kafka:latest

ENV KAFKA_CFG_PROCESS_ROLES=broker,controller \
    KAFKA_CFG_NODE_ID=1 \
    KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=1@localhost:9093 \
    KAFKA_CFG_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093 \
    KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://0.0.0.0:9092 \
    KAFKA_CFG_LOG_DIRS=/tmp/kraft-combined-logs

EXPOSE 9092 9093

CMD ["kafka-server-start.sh", "/opt/bitnami/kafka/config/server.properties"]