FROM ubuntu:latest

MAINTAINER Arun

LABEL docker file to onvert Amazon.war to image

RUN apt-get update && apt-get install -y openjdk-11-jdk wget tar && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.119/bin/apache-tomcat-9.0.119.tar.gz && \
    tar -xvzf apache-tomcat-9.0.119.tar.gz && \
    mv apache-tomcat-9.0.119 tomcat9 && \
    rm apache-tomcat-9.0.119.tar.gz

COPY /Amazon.war /opt/tomcat9/webapps/

EXPOSE 8080

WORKDIR /opt/tomcat9/bin

ENTRYPOINT ["sh", "catalina.sh", "run"]

CMD ["sh"," catalina.out", "run"]
