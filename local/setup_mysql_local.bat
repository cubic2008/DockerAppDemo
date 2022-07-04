@echo off

@REM Step 1: Create database and schema

echo +------------------------------------------------------------------+
echo ^|                   Create database and schema                     ^|
echo +------------------------------------------------------------------+
echo.

%MYSQL_HOME%\bin\mysql -u root -p < local_db_schema.sql
echo done.
echo .

@REM Step 2: Create database account for runnning the application

echo +-----------------------------------------------------------------+
echo ^|      Create database account for runnning the application       ^|
echo +-----------------------------------------------------------------+
echo.

%MYSQL_HOME%\bin\mysql -u root -p < create_mysql_user.sql
echo done.
echo .
