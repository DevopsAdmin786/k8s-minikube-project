FROM ubuntu:latest
LABEL org.opencontainers.image.authors="Farman Ansari <farmaan78678@gmail.com>"
RUN apt-get update -y
RUN apt-get install  nginx -y
RUN  apt-get install  zip  \
wget -y
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip
RUN unzip mediplus-lite.zip
RUN cp -rvf mediplus-lite/* .
RUN rm -rf mediplus-lite.zip mediplus-lite
EXPOSE 80 
# Note :- nginx should be start via docker exec - <container name> service nginx start
CMD ["nginx", "-g", "daemon off;"]
#Here you can test centos as well
