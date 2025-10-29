# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM maven:3.8-openjdk-11 AS build
WORKDIR /app
COPY maven-settings.xml /root/.m2/settings.xml
COPY order-service/pom.xml .
COPY order-service/src ./src
RUN mvn clean package -DskipTests -s /root/.m2/settings.xml

# Stage 2: Run the application
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/order-service-0.0.1-SNAPSHOT.jar order-service.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "/app/order-service.jar"]
