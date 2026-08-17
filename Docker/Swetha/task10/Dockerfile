FROM ubuntu:latest
LABEL maintainer="Swetha"
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget
WORKDIR /opt
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.106/bin/apache-tomcat-9.0.106.tar.gz && \
    tar -xzf apache-tomcat-9.0.106.tar.gz && \
    mv apache-tomcat-9.0.106 tomcat9
COPY Amazon.war /opt/tomcat9/webapps/
EXPOSE 8080
WORKDIR /opt/tomcat9/bin
ENTRYPOINT ["sh","catalina.sh","run"]
