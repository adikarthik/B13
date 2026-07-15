FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y curl
RUN mkdir test
RUN touch test/abc

