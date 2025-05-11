FROM openjdk:21-jdk-slim

# Install curl for Docker healthcheck
RUN apt-get update && apt-get install -y curl && apt-get clean

WORKDIR /app
COPY target/app.jar app.jar
EXPOSE 8071
ENTRYPOINT ["java", "-jar", "app.jar"]

