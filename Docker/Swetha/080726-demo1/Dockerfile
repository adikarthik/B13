#stage1
FROM maven:3.9-eclipse-temurin-17 AS stage1
LABEL author=SwethaR
LABEL Projectname=Demo1
WORKDIR /app
COPY . .
RUN mvn clean package

#stage
FROM eclipse-temurin:17-jre
COPY --from=stage1 /app/target/demo1-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
EXPOSE 8080
