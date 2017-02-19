volumeName=b1_workspace
docker volume ls|grep $volumeName
[ $? -ne 0 ]&&(echo "cannot find docker volume:$volumeName. creat it"; docker volume create $volumeName)

docker run -d -v $volumeName:/home/ctseng/workspace  -p 2022:22 b1
