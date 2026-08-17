FROM maven:3.9-eclipse-temurin-8

LABEL author=SwethaR
LABEL project=b7-java

WORKDIR /app

COPY . .

RUN mvn clean package

CMD ["java", "-jar", "target/my-app-2.0-SNAPSHOT.jar"]
