docker rm $(docker ps|awk '{print $1}')
exit 0
