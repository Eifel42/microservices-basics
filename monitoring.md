# Monitoring

This section covers some configuration steps around the monitoring of JVM and microservices.

## Jolokia 

[Jolokia](https://jolokia.org/) is a well know and robust measurement tool. It provides a REST API.
Please change port 9077 to the port on your microservices JVM.

http://localhost:9077/jolokia/version

#### Jolokia Endpoint examples
- http://localhost:9077/jolokia/read/java.lang:type=Runtime
- http://localhost:9077/jolokia/read/java.lang:type=Memory
- http://localhost:9077/jolokia/read/java.lang:type=Memory/HeapMemoryUsage
- http://localhost:9077/jolokia/read/java.lang:type=Memory/HeapMemoryUsage/committed
- http://localhost:9077/jolokia/read/java.lang:type=OperatingSystem/Name
- http://localhost:9077/jolokia/read/java.lang:type=MemoryPool,name=Metaspace/Usage
- http://localhost:9077/jolokia/read/java.nio:type=BufferPool,name=direct/TotalCapacity


## Hawt.io

- [hawt.io](https://hawt.io) is a modular web console for managing a lot of diagnostics and monitoring stuff.

## Installation

- https://github.com/hawtio/hawtio/releases

## Prometheus and Grafana

- Monitoring Docker Containers is a basic docker tutorial from docker.com [GitHub Docker](https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch10-monitoring.adoc). 

- Check for Prometheus the operating system setting of the Docker Host ([config docker dameon](https://docs.docker.com/config/daemon/prometheus/)).

## Google cAdvisor (Container Advisor) 

- [cAdvisor](https://github.com/google/cadvisor) is a performance resource measurement tool for containers.
``` 
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8045:8080 \
  --detach=true \
  --name=cadvisor-demo \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:latest
```


## Docker Stats

Docker stats is a command that shows the performance data of each running container.
``` 
docker stats

CONTAINER ID   NAME        CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O        PIDS
f06b7b52c241   portainer   0.00%     7.215MiB / 1.941GiB   0.36%     6.75kB / 1.59kB   19.7MB / 299kB   10
```

``` 
docker container stats --format "{{.Container}}: {{.CPUPerc}}":

H9ba0fe831aaa: 24.28%:
2214cc4ffce6: 8.37%:
f06b7b52c241: 0.00%:
```

``` 
docker container stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"

NAME                                     CPU %     MEM USAGE / LIMIT
webapp_web.1.sw2vdz01f9xigp7lfcfiqpahz   0.17%     542.7MiB / 1.941GiB
webapp_db.1.i0rewr3gy3dnd899cgogz03tn    0.31%     379.9MiB / 1.941GiB
portainer                                0.00%     13.77MiB / 1.941GiB
```
