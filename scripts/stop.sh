#!/bin/sh
#!/bin/bash

con=`docker ps -a| awk '{print $NF}'| grep -wi "processing-queue"`
img=`docker images | cut -d " " -f1| grep dm_processingqueue_img` 
appcon="processing-queue"
appimg="dm_processingqueue_img"
if [ "$con" = "$appcon" ]
then
    echo "processing-queue cotainer is runnig lets remove it..."
    docker stop processing-queue
    docker rm -f processing-queue
else
    echo "No container is Running..."
fi

if [ "$img" = "$appimg" ]
then 
        docker image rm  -f dm_processingqueue_img 
else        
        echo "No Similar image found"    
fi
