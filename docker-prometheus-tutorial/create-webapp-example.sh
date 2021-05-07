docker service create --name node \
 --mode global \
 --mount type=bind,source=/proc,target=/host/proc \
 --mount type=bind,source=/sys,target=/host/sys \
 --mount type=bind,source=/,target=/rootfs \
 --network prom \
 --publish 9100:9100 \
 prom/node-exporter:v0.15.0 \
  --path.procfs /host/proc \
  --path.sysfs /host/sys \
  --collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"

docker container run \
  -d \
  -p 3000:3000 \
  --name=grafana \
  -e "GF_SECURITY_ADMIN_PASSWORD=secret" \
  grafana/grafana