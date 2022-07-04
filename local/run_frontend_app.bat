@echo off

@REM Step 1: Download the required modules/libraries

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|              Download the required modules/libraries               ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.

cd ../DockerApp-Frontend
call npm install



@REM Step 2: Start the Frontend Application (in development mode)

echo.
echo.
echo.
echo +--------------------------------------------------------------------+
echo ^|        Start the Frontend Application (in development mode)        ^|
echo +--------------------------------------------------------------------+
echo.
echo.
echo.

start ng serve
cd ../local
