@echo off

@REM Step 1: Setup the environment variables for connecting to the database server

echo.
echo +--------------------------------------------------------------------+
echo ^|      Set environment variables for connecting MySQL database       ^|
echo +--------------------------------------------------------------------+
echo.

@echo on
set DOCKERAPP_DB_HOST=localhost
set DOCKERAPP_DB_PORT=3306
set DOCKERAPP_DB_USER=appUser
set DOCKERAPP_DB_PASSWORD=appPassw0rd
set DOCKERAPP_DB_NAME=dockerappdb
@echo off


@REM Step 2: Build the server using “maven package” command

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


@REM Step 3: Start the SpringBoot application which embedded a Tomcat server.

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|       Start DockerApp-Backend (SpringBoots) REST API server        ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.

start java -jar target/docker_app_backend-0.0.1-SNAPSHOT.jar
cd ../local
