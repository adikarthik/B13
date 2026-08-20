FROM ubuntu:26.04 
MAINTAINER Gousiya
RUN apt-get update
RUN mkdir testdata
RUN touch t1 t2 t3

WORKDIR testdata/
COPY file.txt .
EXPOSE 8080
