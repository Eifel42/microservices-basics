# Setup Local CI/CD 

A list of helpful docker images to test on a local CI/CD pipeline.

## Nexus
Install the Sonatype Nexus Repository Manager
```
 docker run -d -p 8081:8081 -p 8082:8082 --name nexus sonatype/nexus3
```
Check the hints for the generate Administrator password on [DockerHub](https://hub.docker.com/r/sonatype/nexus3#user-content-persistent-data).

## Jenkins
Jenkins is an open-source CI/CD build server.
```
docker run -p 8080:8080 -p 50000:50000 -v /home/ci/jenkins/:/var/jenkins_home jenkins/jenkins
```

## Portainer
Portainer an easy way to administrating docker environments on any device. From an IoT (Raspberry PI) to data centers. 
```
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

## Docker Local Registry

Run a local register to have a private instance for your images ([Deploy a registry server](https://docs.docker.com/registry/deploying/)).

``` 
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```
