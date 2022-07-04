@echo off

@REM Step 1: Build and Deploy DockerApp-Backend (SpringMVC)

cd "../DockerApp-Backend (SpringMVC)"
@REM mvn -Dmaven.test.skip package tomcat7:deploy
call mvn package tomcat7:deploy

cd ../local
