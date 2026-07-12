# Base Image
FROM ubuntu:latest

# Update packages and install Java 11, wget, and curl
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget curl && \
    apt-get clean

# Set Tomcat version
ENV TOMCAT_VERSION=9.0.108

# Download and extract Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Set working directory
WORKDIR /opt/tomcat

# Copy WAR file into Tomcat webapps directory
COPY Amazon.war /opt/tomcat/webapps/

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
ENTRYPOINT ["sh","bin/catalina.sh","run"]
