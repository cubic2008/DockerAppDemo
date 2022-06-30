# dockerfile for building the base image (git + Maven + Angular)
# (This dockerfile is not in used for the DockerApp demo)

FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update 
RUN apt-get install -y git
RUN apt-get install -y maven
#RUN apt-get install -y npm
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g
RUN npm install -g @angular/cli
