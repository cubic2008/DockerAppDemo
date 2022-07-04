@echo off
echo.
echo +--------------------------------------------------------------------+
echo ^|      Set environment variables for connecting MySQL database       ^|
echo +--------------------------------------------------------------------+
echo.

set DOCKERAPP_DB_HOST=localhost
set DOCKERAPP_DB_PORT=3306
set DOCKERAPP_DB_USER=appUser
set DOCKERAPP_DB_PASSWORD=appPassw0rd
set DOCKERAPP_DB_NAME=dockerappdb

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|              Build DockerApp-Backend (SpringBoots)                 ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.

cd "../DockerApp-Backend (SpringBoots)"
@REM mvn -Dmaven.test.skip package
call mvn package

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|       Start DockerApp-Backend (SpringBoots) REST API server        ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.

java -jar target/docker_app_backend-0.0.1-SNAPSHOT.jar
