FROM centos:latest
LABEL org.opencontainers.image.authors="Farman Ansari <farmaan78678@gmail.com>"
RUN yum update -y
RUN yum install  -y httpd \
  zip  \ 
  wget 
# CMD ["service","nginx","start"] 
# Note :- nginx should be start via docker exec - <container name> service nginx start
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page43/gazebo.zip
RUN unzip gazebo.zip
RUN cp -rvf gazebo/* .
RUN rm -rf gazebo.zip gazebo
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80 22 8081

#Here you can test centos as well
