FROM eclipse-temurin:8-jre

WORKDIR /app

COPY target/spring-boot-rest-example-0.5.0.war app.war

EXPOSE 8090
EXPOSE 8091

ENTRYPOINT ["java","-jar","app.war"]
