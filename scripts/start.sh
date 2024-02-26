#!/bin/sh


#cd /home/ubuntu/mfr
#npm install
# Modify the deployed code to include the hostname.
#echo export const hostname = \"$(hostname)\"\; > src/hostname.js
#pm2 start node_modules/react-scripts/scripts/start.js


con=`docker ps -a| awk '{print $NF}'| grep -wi "processing-queue"`
appcon="processing-queue"

if  [ "$con" = "processing-queue" ]
then
    echo "........processing-queue container is already running........"
    docker stop processing-queue
    docker rm processing-queue
    docker run -itd -p 80:80 --name processing-queue dm_processingqueue_img
    docker exec -i processing-queue  service nginx start
else
    echo "processing-queue is not runnning let us start the contianer on port 80:80"
    docker run -itd -p 80:80 --name processing-queue dm_processingqueue_img 
    docker exec -i processing-queue  service nginx start 
fi
