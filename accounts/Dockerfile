FROM openjdk:21-jdk-slim
WORKDIR /app

RUN apt-get update && apt-get install -y curl

COPY target/app.jar app.jar
COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

EXPOSE 8080
ENTRYPOINT ["./wait-for-it.sh", "configserver", "8071", "--", "java", "-jar", "app.jar"]
