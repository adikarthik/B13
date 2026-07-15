FROM ubuntu:26.04

MAINTAINER Shashikant Maski

LABEL PROJECT="Jenkins Docker Lab"
LABEL VERSION="1.0"
LABEL AUTHOR="Shashikant"

ENV JENKINS_HOME=/opt/jenkins
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

RUN apt-get update && \
    apt-get install -y openjdk-21-jdk wget curl vim && \
    mkdir -p $JENKINS_HOME/logs

WORKDIR $JENKINS_HOME

COPY config.txt .

EXPOSE 8080

CMD ["/bin/bash"]
