# DockerApp Demo

## Introduction
This repository is created for demonstrating how to build and deploy a typical fullstack project in the docker environment.

In this demon, we will setup two environments for two typical applications. Each environment contains a front-end application, back-end service (A REST API server), and a database server
* The first environment contains the following three components:
  - Front-end application: implemented using Angular framework
  - Backend REST API server: implemented using SpringBoot 2
  - Database server: implemented using MySQL 8.x
* The second environment contains the following three components:
  - Front-end application: implemented using Angular framework
  - Backend REST API server: implemented using SpringMVC that is deployed on Tomcat
  - Database server: implemented using MySQL 8.x

The following diagrams illustrate the two environments.

![Environment 1: Angular-SpringBoot-MySQL](git-resources/overview-1.png)
<figcaption align = "center"><b>Figure.1 - Angular-SpringBoot-MySQL Environment</b></figcaption>


![Environment 2: Angular-SpringMVC/Tomcat-MySQL](git-resources/overview-2.png)
<figcaption align = "center"><b>Figure.2 - Angular-SpringMVC/Tomcat-MySQL Environment</b></figcaption>


## The Application

* Front-end application: implemented using Angular framework
* Backend REST API application #1: implemented using SpringBoot 2
* Backend REST API application #2: implemented using SpringMVC that is deployed on Tomcat
* Database server: implemented using MySQL 8.x

Free download from GitHub: https://github.com/cubic2008/DockerAppDemo

GIT clone/pull: https://github.com/cubic2008/DockerAppDemo.git

### The Frontend Application

* Developed using Angular Framework
* Implemented a simple CRUD functions
* Communicates to the backend REST API server

![Frontend App - SpringBoot](git-resources/frontend-app.png)
<figcaption align = "center"><b>Figure.3 - The Frontend Application</b></figcaption>

### The Back-end Application - SpringBoot

* Developed using SpringBoot Framework
* Expose a set of CRUD functions to front-end App
* Can be tested using Postman

![Backend App - SpringBoot](git-resources/backend-app-springboot.png)
<figcaption align = "center"><b>Figure.4 - The Backend Application (SpringBoot version) tested with Postman</b></figcaption>

### The Back-end Application - SpringMVC

* Developed using SpringMVC Framework
* Need to be deployed to App Server, e.g., Tomcat
* Expose a set of CRUD functions (functionalities are exact the same as in the SpringBoot version) to frontend App
* Can be tested using Postman

![Backend App - SpringMVC](git-resources/backend-app-springmvc.png)
<figcaption align = "center"><b>Figure.5 - The Backend Application (SpringMVC version) tested with Postman</b></figcaption>

### The Database Server

* Use MySQL in this example.
* Can be replaced by any other relational database.

## Build and Run the Application Locally

In this section, we will describe how to build and run the application locally, i.e., without deploying docker environment.

You will need to have the following software installed locally.
* MySQL v8.x
* Maven
* JDK 8
* Node.js
* Angular
* Postman (optional)

Setup and Deploy to the Database Server

Before deploying on Docker, let’s see how to run the application locally.

Let setup and start the database first. First you need start the MySQL database engine.

In this example, the local host is running Windows O/S (hosting O/S)

**Step 1**: Get a clone copy from Github (using git clone or git pull command):

```
C:> docker clone https://github.com/cubic2008/DockerAppDemo.git DockerApp
```

Step 2: Before running the local database setup script, you will need to set the “MYSQL_HOME” environment variable to point to the MySQL DB installation directory, for example:

```
C:> SET MYSQL_HOME=C:\mysql-8.0.18-winx64
```

Step 3: Run local database setup under the “local” directory. The local setup script uses the MySQL “root” account, so you will have to input the password for the “root” account.

```
C:> cd DockerApp\local
C:> setup_mysql_local.bat
```

Step 4: Now you can verify the database setup using the commands shown on the right.Please note that the password specified in the localsetup script is “appPassw0rd”. Feel free to change it asyou wish.
The scripts for setting up MySQL database are shown on thenext slide.

![Local Database SEtup](git-resources/local-db-setup.png)
<figcaption align = "center"><b>Figure.6 - Local MySQL database setup result</b></figcaption>















