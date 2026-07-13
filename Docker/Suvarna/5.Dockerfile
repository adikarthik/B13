FROM ubuntu:24.04
RUN mkdir /project && \
WORKDIR /project && \
COPY config.txt .
