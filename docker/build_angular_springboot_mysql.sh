# Step 0: (Optional) Setup environment variables
export HOSTING_SERVER_NAME=192.168.15.135 # The hostname of the hosting server. It could the VM server name that hosting the containers.
export APP_SERVER_PORT=18080
export DB_USER=appuser
export DB_PASSWORD=appPassw0rd

# Step 1: Create images
sudo docker image build --tag dockerapp-restserver -f sprintboot.df .
#sudo docker image build --tag dockerapp-tomcat -f tomcat.df .
sudo docker image build --tag dockerapp-db -f mysql.df .
sudo docker image build --tag dockerapp-nginx --build-arg apiUrlHost=$HOSTING_SERVER_NAME --build-arg apiUrlPort=$APP_SERVER_PORT -f nginx.df .

# Step 2: Create a bridge network
sudo docker network create --driver bridge --label project=dockerapp --label module=web_app --attachable --scope local --subnet 10.0.1.0/24 --ip-range 10.0.1.1/25 dockerapp-network


# Step 3: Create & Run Database (MySQL) Container
sudo docker run --rm --name dockerapp-db --network dockerapp-network -e MYSQL_USER=$DB_USER -e MYSQL_PASSWORD=$DB_PASSWORD -d dockerapp-db

# sleep 20

# Step 4a: Create & Run App Server (SpringBoot) Container
sudo docker run --rm --name dockerapp-restserver --network dockerapp-network -p $APP_SERVER_PORT:8080 -e DOCKERAPP_DB_USER=$DB_USER -e DOCKERAPP_DB_PASSWORD=$DB_PASSWORD -d dockerapp-restserver

# Step 4b: Create & Run App Server (SpringMVC/Tomcat) Container
#sudo docker run --rm --name dockerapp-tomcat --network dockerapp-network -p $APP_SERVER_PORT:8080 -e DOCKERAPP_DB_USER=$DB_USER -e DOCKERAPP_DB_PASSWORD=$DB_PASSWORD -d dockerapp-tomcat

# sleep 10

# Step 5: Create & Run Web Server (Nginx) Container
sudo docker run --rm --name dockerapp-nginx -p 19090:80 -d dockerapp-nginx
