# This script will build the unbutu-git-maven image and push it to the DockerHub
# This is optional as it is required only once and has been uploaded to DockerHub
# It is only required if the dockerfile is changed.
docker image build --tag davidgao2008/ubuntu-git-maven -f ubuntu-git-maven.df .
docker image push davidgao2008/ubuntu-git-maven