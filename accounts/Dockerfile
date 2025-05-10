FROM openjdk:21-jdk-slim

# Install netcat (using openbsd version explicitly)
RUN apt-get update && \
    apt-get install -y --no-install-recommends netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Argument for JAR file location
ARG JAR_FILE=target/*.jar

# Copy JAR into the container
COPY ${JAR_FILE} app.jar

# Copy the wait-for-it script and set permissions
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Entry point waits for config server before launching app
ENTRYPOINT ["/wait-for-it.sh", "configserver", "8071", "--", "java", "-jar", "/app.jar"]
