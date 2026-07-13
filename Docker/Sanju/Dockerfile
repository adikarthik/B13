FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install Java 11, wget and tar
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget tar

# Download Tomcat 9
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.107/bin/apache-tomcat-9.0.107.tar.gz

# Extract Tomcat
RUN tar -xzf apache-tomcat-9.0.107.tar.gz -C /opt

# Rename Tomcat folder
RUN mv /opt/apache-tomcat-9.0.107 /opt/tomcat

# Set working directory
WORKDIR /opt/tomcat

# Copy WAR file
COPY Amazon.war webapps/

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
ENTRYPOINT ["sh","bin/catalina.sh","run"]
