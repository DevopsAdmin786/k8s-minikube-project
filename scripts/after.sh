#!/bin/bash

img=`docker images | cut -d " " -f1| grep dm_processingqueue_img`
con=`docker ps -a| awk '{print $NF}'| grep -wi "processing-queue"`
appimg="dm_processingqueue_img"
appcon="processing-queue"

if [ "$con" = "$appcon" ]
then
        echo "processing-queue cotainer is runnig lets remove it..."
        docker stop processing-queue
        docker rm processing-queue
else
        echo "No container is Running..."
fi


if [ "$img" = "$appimg" ]
then

    echo "dm_processingqueue_img already in the server just removing the old image"   
    docker image rm dm_processingqueue_img
    echo "Old image has been removed and creating new one"
    docker build -t dm_processingqueue_img /home/ubuntu/Project1/   
    echo "New docker imgae dm_processingqueue_img has been created"
else
    docker build -t dm_processingqueue_img /home/ubuntu/Project1/
    echo "New docker imgae dm_processingqueue_img has been created"
fi  
