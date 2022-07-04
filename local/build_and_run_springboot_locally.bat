set DOCKERAPP_DB_HOST=localhost
set DOCKERAPP_DB_PORT=3306
set DOCKERAPP_DB_USER=appUser
set DOCKERAPP_DB_PASSWORD=appPassw0rd
set DOCKERAPP_DB_NAME=dockerappdb
cd "../Docker/DockerApp-Backend (SpringBoots)"
mvn -Dmaven.test.skip package
java -jar target/docker_app_backend-0.0.1-SNAPSHOT.jar
