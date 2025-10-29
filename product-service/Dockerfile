# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM maven:3.9.6 AS build
WORKDIR /app
COPY maven-settings.xml /root/.m2/settings.xml
COPY product-service/pom.xml .
COPY product-service/src ./src
RUN mvn clean package -DskipTests -s /root/.m2/settings.xml

# Stage 2: Run the application
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/product-service-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "app.jar"]
