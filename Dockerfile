FROM confluentinc/cp-kafka:7.6.0

ENV KAFKA_PROCESS_ROLES=broker,controller \
    KAFKA_NODE_ID=1 \
    KAFKA_CONTROLLER_QUORUM_VOTERS=1@localhost:9093 \
    KAFKA_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093 \
    KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka-production-e850.up.railway.app:9092 \
    KAFKA_LOG_DIRS=/tmp/kraft-combined-logs

EXPOSE 9092 9093

CMD ["bash", "-c", "exec kafka-server-start /etc/kafka/server.properties"]
