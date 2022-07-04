@echo off

@REM Step 1: Setup the environment variables for connecting to the database server

@REM echo.
@REM echo +--------------------------------------------------------------------+
@REM echo ^|      Set environment variables for connecting MySQL database       ^|
@REM echo +--------------------------------------------------------------------+
@REM echo.

@echo on
@REM set DOCKERAPP_DB_HOST=localhost
@REM set DOCKERAPP_DB_PORT=3306
@REM set DOCKERAPP_DB_USER=appUser
@REM set DOCKERAPP_DB_PASSWORD=appPassw0rd
@REM set DOCKERAPP_DB_NAME=dockerappdb
@echo off


@REM Step 1: Build and Deploy DockerApp-Backend (SpringMVC)
echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|           Build and Deploy DockerApp-Backend (SpringMVC)           ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.


@REM Step 2: Start DockerApp-Backend (SpringMVC/Tomcat) REST API server

cd "../DockerApp-Backend (SpringMVC)"
@REM mvn -Dmaven.test.skip package
call mvn package tomcat7:deploy

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|     Start DockerApp-Backend (SpringMVC/Tomcat) REST API server     ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.

start java -jar target/docker_app_backend-0.0.1-SNAPSHOT.jar
cd ../local
