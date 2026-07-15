FROM tomcat:9.0-jdk17

LABEL maintainer="Tilak"

RUN rm -rf /usr/local/tomcat/webapps/*

COPY Amazon.war /usr/local/tomcat/webapps/


EXPOSE 8080

CMD ["catalina.sh", "run"]
