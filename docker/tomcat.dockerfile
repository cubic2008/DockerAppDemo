# This is the dockerfile that is used to create the REST Server
# for running the DockerApp Backend (SpringMVC/Tomcat)

# Stage 1: Compile and Build the SpringMVC/Tomcat backend application

FROM davidgao2008/ubuntu-git-maven as build1

RUN cd home && \
    git clone https://github.com/cubic2008/DockerAppDemo.git DockerApp
# Set working directory
WORKDIR "/home/DockerApp/DockerApp-Backend (SpringMVC)"

# The environment variables for connecting to the database server that are required 
# when the maven build runs the test cases. In order to run the test cases during
# the build, the database server container needs to be up running. You also need to 
# specify the "--network dockerapp-network" option in the "docker image build" command.
# Also dont forget to set the following two environment variables on the hosting VM 
# before running the msyql database server container:
# *    export DB_USER=appuser
# *    export DB_PASSWORD=appPassw0rd
#ENV DOCKERAPP_DB_HOST=dockerapp-db \
#    DOCKERAPP_DB_PORT=3306 \
#    DOCKERAPP_DB_NAME=dockerappdb \
#    DOCKERAPP_DB_USER=appuser \
#    DOCKERAPP_DB_PASSWORD=appPassw0rd
#RUN mvn package
RUN mvn -Dmaven.test.skip package

# Stage 2: Prepare the target image

FROM tomcat:9.0.56-jdk8-openjdk-bullseye as runtime
ARG src1="/home/DockerApp/DockerApp-Backend (SpringMVC)/target/docker_app_backend.war"
ARG target1=/usr/local/tomcat/webapps/
ARG src2="/home/DockerApp/environments/tomcat/context.xml"
ARG target2=/usr/local/tomcat/conf/
ARG src3="/home/DockerApp/environments/tomcat/setenv.sh"
ARG target3=/usr/local/tomcat/bin/
COPY --from=build1 ${src1} ${target1}
COPY --from=build1 ${src2} ${target2}
COPY --from=build1 ${src3} ${target3}
ENV DOCKERAPP_DB_HOST=dockerapp-db \
    DOCKERAPP_DB_PORT=3306 \
    DOCKERAPP_DB_NAME=dockerappdb \
    DOCKERAPP_DB_USER=appuser \
    DOCKERAPP_DB_PASSWORD=appPassw0rd \
    DOCKERAPP_DB_JNDI_NAME=jdbc/dockerappdb
EXPOSE 8080
