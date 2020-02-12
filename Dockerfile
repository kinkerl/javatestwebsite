FROM openjdk:8-jdk-alpine

# FROM openjdk:8-jre-alpine

# Two commands which are required for divio cloud
RUN echo "#!/bin/sh" > /usr/local/bin/start && chmod +x /usr/local/bin/start
ADD migrate.sh /app/migrate.sh

COPY . /app
RUN cd /app && ./mvnw package


EXPOSE 8080

CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/app/target/spring-boot-0.0.1-SNAPSHOT.jar"]


