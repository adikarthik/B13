FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

CMD cp /shared/Amazon.war /usr/local/tomcat/webapps/ && \
    catalina.sh run
