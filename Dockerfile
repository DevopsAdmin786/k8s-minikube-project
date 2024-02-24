FROM ubuntu:latest
LABEL org.opencontainers.image.authors="Farman Ansari <farmaan78678@gmail.com>"
RUN apt install -y nginx \
zip
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page43/gazebo.zip 
RUN unzip gazebo.zip 
RUN cp -rvf gazebo/* .
RUN rm -rf gazebo.zip gazebo
EXPOSE 80 22
#Here you can test centos as well
