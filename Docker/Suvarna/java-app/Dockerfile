FROM eclipse-temurin:17-jdk AS builder

WORKDIR /app

COPY Hello.java .

RUN javac Hello.java

FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

COPY --from=builder /app/Hello.class .

CMD ["java", "Hello"]
