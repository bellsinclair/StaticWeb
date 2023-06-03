# Use an official Nginx image as a parent image
FROM nginx:latest

# Set the working directory in the container to /usr/share/nginx/html
# This is where NGINX serves files from by default
WORKDIR /usr/share/nginx/html

# Copy the current directory contents into the container at /usr/share/nginx/html
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Run nginx
# No need to use CMD because it's already in the nginx base image
