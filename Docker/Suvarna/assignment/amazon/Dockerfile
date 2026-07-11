FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY build-war.sh .
RUN chmod +x build-war.sh
RUN ./build-war.sh

FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=builder /app/Amazon/Amazon/Amazon-Web/target/Amazon.war \
    /usr/local/tomcat/webapps/Amazon.war

EXPOSE 8080

CMD ["catalina.sh","run"]
