@echo off
echo "-------------------------------------------------------------"
echo "Set environment variables for connecting MySQL database . . ."
echo "-------------------------------------------------------------"

set DOCKERAPP_DB_HOST=localhost
set DOCKERAPP_DB_PORT=3306
set DOCKERAPP_DB_USER=appUser
set DOCKERAPP_DB_PASSWORD=appPassw0rd
set DOCKERAPP_DB_NAME=dockerappdb

echo "-------------------------------------------"
echo "Build DockerApp-Backend (SpringBoots) . . ."
echo "-------------------------------------------"

cd "../DockerApp-Backend (SpringBoots)"
@REM mvn -Dmaven.test.skip package
call mvn package

echo "-----------------------------------------------------------"
echo "Start DockerApp-Backend (SpringBoots) REST API server . . ."
echo "-----------------------------------------------------------"

java -jar target/docker_app_backend-0.0.1-SNAPSHOT.jar
