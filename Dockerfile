FROM openjdk:8-jdk-alpine

# Build the project
COPY . /app
RUN cd /app && ./mvnw package



FROM openjdk:8-jre-alpine

# Copy the final artifact
COPY --from=0 /app/target/spring-boot-0.0.1-SNAPSHOT.jar /app.jar

# Two commands which are required for divio cloud
RUN echo "#!/bin/sh" > /usr/local/bin/start && chmod +x /usr/local/bin/start
RUN mkdir /app && echo "set -x\nstart migrate" > /app/migrate.sh && chmod +x /app/migrate.sh

# Expose the port
EXPOSE 8080

CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/app.jar"]


