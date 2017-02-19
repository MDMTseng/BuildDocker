docker stop $(docker ps |awk '{print $1}')
docker rm $(docker ps -a|awk '{print $1}')
exit 0
