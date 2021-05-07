docker service create \
  --replicas 1 \
  --name metrics \
  --network prom \
  --mount type=bind,source=/tmp/prometheus3.yml,destination=/etc/prometheus/prometheus.yml \
  --publish 9090:9090/tcp \
  prom/prometheus