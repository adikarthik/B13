FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y git

COPY build-war.sh .

RUN chmod +x build-war.sh

VOLUME /shared

CMD ["./build-war.sh"]
