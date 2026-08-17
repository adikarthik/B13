# Stage 1
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package

# Stage 2
FROM tomcat:9

COPY --from=builder /app/Amazon-Web/target/Amazon.war \
/usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh","run"]
