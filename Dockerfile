FROM confluentinc/cp-kafka:7.6.0

COPY server.properties /etc/kafka/server.properties

EXPOSE 9092 9093

CMD ["bash", "-c", "kafka-storage format --config /etc/kafka/server.properties --cluster-id=$(kafka-storage random-uuid) --ignore-formatted && exec kafka-server-start /etc/kafka/server.properties"]
