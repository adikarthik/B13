FROM ubuntu:24.04
ENV APP_HOME=/Project
WORKDIR $APP_HOME
RUN touch logs
