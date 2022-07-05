# This is the dockerfile that is used to create the REST Server
# for running the DockerApp Backend (SpringBoot)

# Stage 1: Compile and Build the SpringBoot backend application

FROM davidgao2008/ubuntu-git-maven as build1

RUN cd home && \
    git clone https://github.com/cubic2008/DockerAppDemo.git DockerApp
# Set working directory
WORKDIR "/home/DockerApp/DockerApp-Backend (SpringBoots)"

# The environment variables for connecting to the database server that are required 
# when the maven build runs the test cases. In order to run the test cases during
# the build, the database server container needs to be up running.
#RUN set DOCKERAPP_DB_HOST=localhost && \
#    set DOCKERAPP_DB_PORT=3306 && \
#    set DOCKERAPP_DB_USER=appUser && \
#    set DOCKERAPP_DB_PASSWORD=appPassw0rd && \
#    set DOCKERAPP_DB_NAME=dockerappdb && \
#    mvn package

RUN mvn -Dmaven.test.skip package

# Stage 2: Prepare the target image

FROM ubuntu:latest as runtime
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk
ARG src1="/home/DockerApp/DockerApp-Backend (SpringBoots)/target/docker_app_backend-0.0.1-SNAPSHOT.jar"
ARG target1=/home/docker_app_backend-0.0.1-SNAPSHOT.jar
ARG src2="/home/DockerApp/DockerApp-Backend (SpringBoots)/src/main/resources/application.properties"
ARG target2=/home/application.properties
COPY --from=build1 ${src1} ${target1}
#COPY --from=build1 ${src2} ${target2}
ENV DOCKERAPP_DB_HOST=dockerapp-db \
    DOCKERAPP_DB_PORT=3306 \
    DOCKERAPP_DB_NAME=dockerappdb \
    DOCKERAPP_DB_USER=appuser \
    DOCKERAPP_DB_PASSWORD=appPassw0rd \
    DOCKERAPP_DB_JNDI_NAME=jdbc/dockerappdb
#ENTRYPOINT ["java", "-jar", "/home/docker_app_backend-0.0.1-SNAPSHOT.jar", "--spring.config.location=/home/application.properties"]
ENTRYPOINT ["java", "-jar", "/home/docker_app_backend-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
