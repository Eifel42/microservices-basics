docker service rm metrics

docker service create \
  --replicas 1 \
  --network webapp_default \
  --name metrics \
  --mount type=bind,source=/tmp/prometheus.yml,destination=/etc/prometheus/prometheus.yml \
  --publish 9090:9090 \
  prom/prometheus
