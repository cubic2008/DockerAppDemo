usage() {
    echo "Invalid arguments!"
    echo .
    echo "Usage: "
    echo "   ./dockerapp-compose.sh [springboot|tomcat] [build|no-build] [up|down|ps] "
    echo .
}
if [[ "$1" == "springboot" ]]
then
    if [[ "$2" == "build" ]]
    then
        composeFile="docker-compose_angular_springboot_mysql_with_image_build.yml"
    elif [[ "$2" == "no-build" ]]
    then
       composeFile="docker-compose_angular_springboot_mysql.yml"
    else
        usage
        # exit 1
    fi
elif [[ "$1" == "tomcat" ]]
then
    if [[ "$2" == "build" ]]
    then
       composeFile="docker-compose_angular_tomcat_mysql_with_image_build.yml"
    elif [[ "$2" == "no-build" ]]
    then
       composeFile="docker-compose_angular_tomcat_mysql.yml"
    else
        usage
        exit 1
    fi
else
    usage
    exit 1
fi
if [[ "$3" != "up" && "$3" != "down" && "$3" != "ps" ]]; then
    usage
    exit 1
fi
docker compose --env-file env.txt -f $composeFile $3 &
