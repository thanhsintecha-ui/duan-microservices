# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM maven:3.9.6 AS build
WORKDIR /app
COPY maven-settings.xml /root/.m2/settings.xml
COPY notification-service/pom.xml .
COPY notification-service/src ./src
RUN mvn clean package -DskipTests -s /root/.m2/settings.xml

# Stage 2: Run the application
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/notification-service-0.0.1-SNAPSHOT.jar notification-service.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "/app/notification-service.jar"]
