FROM openjdk:21-jdk-slim
WORKDIR /app
COPY target/app.jar app.jar
EXPOSE 9001
ENTRYPOINT ["java", "-jar", "app.jar"]