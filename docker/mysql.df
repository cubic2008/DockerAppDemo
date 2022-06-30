# This is the dockerfile that is used to create MySQL DB server

# Stage 1: Download the application from GitHub

FROM davidgao2008/ubuntu-git-maven as build1

RUN cd /home && \
    git clone https://github.com/cubic2008/DockerAppDemo.git DockerApp

# Stage 2: Create the MySQL DB Server using the schema from "build1"

FROM mysql:latest as runtime
ARG src1="/home/DockerApp/database/schema.sql"
ARG target1=/docker-entrypoint-initdb.d
COPY --from=build1 ${src1} ${target1}
ENV MYSQL_ROOT_PASSWORD="" \
    MYSQL_DATABASE="dockerappdb" \
    MYSQL_USER="appuser" \
    MYSQL_PASSWORD="appPassw0rd" \
    MYSQL_ALLOW_EMPTY_PASSWORD="yes"
