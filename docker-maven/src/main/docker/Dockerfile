FROM adoptopenjdk/openjdk11:alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
VOLUME /tmp
ARG JAR_FILE
EXPOSE 8080
