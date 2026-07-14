FROM ubuntu:22.04

MAINTAINER ARUN

RUN apt-get update

RUN mkdir testdata && touch t1 t2 t2 

WORKDIR testdata

COPY config.txt .

EXPOSE 8080


