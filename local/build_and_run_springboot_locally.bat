@echo off

@REM Step 1: Download the required modules/libraries

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|             Download the required modules/libraries               ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.


@REM Step 2: Start the Frontend Application (in development mode)

cd ../DockerApp-Frontend
npm install
@REM mvn -Dmaven.test.skip package
call mvn package

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|        Start the Frontend Application (in development mode)        ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.

ng serve
