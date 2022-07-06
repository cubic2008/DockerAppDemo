docker compose -f docker-compose_angular_springboot_mysql.yml down
docker compose -f docker-compose_angular_springboot_mysql_with_image_build.yml down
docker compose -f docker-compose_angular_tomcat_mysql.yml down
docker compose -f docker-compose_angular_tomcat_mysql_with_image_build.yml down
docker stop $(docker ps -a -q)
docker image rm -f $(docker image ls -a -q)
docker network rm dockerapp-network