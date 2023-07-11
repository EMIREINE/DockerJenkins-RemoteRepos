# specify a base image
FROM ubuntu:latest

# description
LABEL description="containerize Apache webapp"
LABEL maintainer="Jenkins is another way to built tree stage pipeline"

# update package lists and install Apache
RUN apt-get update && apt-get install -y apache2

# copy index file from the local system to inside the container
COPY index.html /var/www/html

# expose port 80
EXPOSE 80

# set the entrypoint command to start Apache in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
