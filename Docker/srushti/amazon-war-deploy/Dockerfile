FROM ubuntu:26.04

LABEL maintainer="Srushti"
LABEL application="Amazon"

#installation of java
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk wget curl && \
    apt-get clean 

#download and installation of tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.120/bin/apache-tomcat-9.0.120.tar.gz && \
    mkdir -p /opt&& \
    tar -xzf apache-tomcat-9.0.120.tar.gz -C /opt && \
    mv /opt/apache-tomcat-9.0.120 /opt/tomcat && \
     rm apache-tomcat-9.0.120.tar.gz

#copy war file
COPY Amazon.war /opt/tomcat/webapps/

#expose of port
EXPOSE 8080

#start tomcat
CMD ["/opt/tomcat/bin/catalina.sh","run"] 
