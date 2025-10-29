# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM maven:3.9.6 AS build
WORKDIR /app
COPY maven-settings.xml /root/.m2/settings.xml
COPY eureka-server/pom.xml .
COPY eureka-server/src ./src
RUN mvn clean package -DskipTests -s /root/.m2/settings.xml

# Stage 2: Run the application
FROM openjdk:17-jdk-slim
WORKDIR /app
VOLUME /tmp
COPY --from=build /app/target/eureka-server-1.0-SNAPSHOT.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "/app.jar"]
