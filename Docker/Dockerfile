FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk 
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.108/bin/apache-tomcat-9.0.108.tar.gz
RUN tar -xzf apache-tomcat-9.0.108.tar.gz
WORKDIR /apache-tomcat-9.0.108/webapps
COPY Amazon.war .
EXPOSE 8080
ENTRYPOINT [""sh"",""/apache-tomcat-9.0.108/bin/catalina.sh"",""run""]
