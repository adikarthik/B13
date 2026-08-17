FROM nginx
MAINTAINER SwethaR
LABEL projectname=nginx1
WORKDIR /tmp
COPY file1 /tmp
RUN apt-get update
CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
