# This script creates the docker environment for the Frontend Application (Angular), Backend REST Server (SpringBoot 2) and the Backend 
# database server (MySQL).
#
# This script creates the following three images:
# * dockerapp-springboot: using springboot.df
# * dockerapp-db: using mysql.df
# * dockerapp-nginx: using nginx_springboot.df
#
# Then it creates and runs the three docker containers respectively and one bridge network.


# Step 0: (Optional) Setup environment variables
echo "+------------------------------------------------+"
echo "| Step 0: (Optional) Setup environment variables |"
echo "+------------------------------------------------+"
export HOSTING_SERVER_NAME=192.168.15.135 # The hostname of the hosting server. It could the VM server name that hosting the containers.
export APP_SERVER_PORT=18080
export DB_USER=appuser
export DB_PASSWORD=appPassw0rd

# Step 1: Create images
echo "+--------------------------------------------------------------------+"
echo "| Step 1.1: Create images (dockerapp-springboot using springboot.df) |"
echo "+--------------------------------------------------------------------+"
sudo docker image build --tag dockerapp-springboot -f sprintboot.df .
#sudo docker image build --tag dockerapp-tomcat -f tomcat.df .
echo "+-------------------------------------------------------+"
echo "| Step 1.2: Create images (dockerapp-db using mysql.df) |"
echo "+-------------------------------------------------------+"
sudo docker image build --tag dockerapp-db -f mysql.df .
echo "+---------------------------------------------------------------------+"
echo "| Step 1.3: Create images (dockerapp-nginx using nginx_springboot.df) |"
echo "+---------------------------------------------------------------------+"
sudo docker image build --tag dockerapp-nginx --build-arg apiUrlHost=$HOSTING_SERVER_NAME --build-arg apiUrlPort=$APP_SERVER_PORT -f nginx_springboot.df .
# sudo docker image build --tag dockerapp-nginx --build-arg apiUrlHost=$HOSTING_SERVER_NAME --build-arg apiUrlPort=$APP_SERVER_PORT -f nginx_tomcat.df .

# Step 2: Create a bridge network
echo "+---------------------------------+"
echo "| Step 2: Create a bridge network |"
echo "+---------------------------------+"
sudo docker network create --driver bridge --label project=dockerapp --label module=web_app --attachable --scope local --subnet 10.0.1.0/24 --ip-range 10.0.1.1/25 dockerapp-network


# Step 3: Create & Run Database (MySQL) Container
echo "+-------------------------------------------------+"
echo "| Step 3: Create & Run Database (MySQL) Container |"
echo "+-------------------------------------------------+"
sudo docker run --rm --name dockerapp-db --network dockerapp-network -e MYSQL_USER=$DB_USER -e MYSQL_PASSWORD=$DB_PASSWORD -d dockerapp-db

sleep 20

# Step 4a: Create & Run App Server (SpringBoot) Container
echo "+--------------------------------------------------------+"
echo "| Step 4: Create & Run App Server (SpringBoot) Container |"
echo "+--------------------------------------------------------+"
sudo docker run --rm --name dockerapp-restserver --network dockerapp-network -p $APP_SERVER_PORT:8080 -e DOCKERAPP_DB_USER=$DB_USER -e DOCKERAPP_DB_PASSWORD=$DB_PASSWORD -d dockerapp-springboot

# Step 4b: Create & Run App Server (SpringMVC/Tomcat) Container
#sudo docker run --rm --name dockerapp-tomcat --network dockerapp-network -p $APP_SERVER_PORT:8080 -e DOCKERAPP_DB_USER=$DB_USER -e DOCKERAPP_DB_PASSWORD=$DB_PASSWORD -d dockerapp-tomcat

sleep 10

# Step 5: Create & Run Web Server (Nginx) Container
echo "+---------------------------------------------------+"
echo "| Step 5: Create & Run Web Server (Nginx) Container |"
echo "+---------------------------------------------------+"
sudo docker run --rm --name dockerapp-nginx -p 19090:80 -d dockerapp-nginx
