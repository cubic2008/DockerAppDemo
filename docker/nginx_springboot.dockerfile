# This is the dockerfile that is used to create the Frontend Server (Nginx)
# for running the DockerApp Frontend App (Angular) to connect the 
# SpringBoot backend REST Server


# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:latest as build
ARG apiUrlHost
ARG apiUrlPort
ENV API_URL_HOST=${apiUrlHost} \
    API_URL_PORT=${apiUrlPort}
# Set the working directory
WORKDIR /usr/local/app
RUN git clone https://github.com/cubic2008/DockerAppDemo.git DockerApp
WORKDIR /usr/local/app/DockerApp/DockerApp-Frontend
ENV NODE_OPTIONS=--openssl-legacy-provider

# Create the environment.prod.ts before the build
RUN chmod +x /usr/local/app/DockerApp/environments/frontend/set_env_springboot.sh
RUN /usr/local/app/DockerApp/environments/frontend/set_env_springboot.sh

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build --prod


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest
ARG src1="/usr/local/app/DockerApp/DockerApp-Frontend/dist/DockerApp-Frontend/"
ARG src2="/usr/local/app/DockerApp/environments/nginx/nginx.conf"
# Copy the build output to replace the default nginx contents.
COPY --from=build ${src1} /usr/share/nginx/html
COPY --from=build ${src2} /etc/nginx/nginx.conf

EXPOSE 80
