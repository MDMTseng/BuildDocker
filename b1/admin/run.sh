volumeName=b1_workspace
docker volume ls|grep $volumeName
[ $? -ne 0 ]&&(echo "cannot find docker volume:$volumeName. creat it"; docker volume create $volumeName)
username=$1
[ -z $username ]&& echo "specify your username.."&& exit 1
docker run -d \
-p 2022:22 b1 \
-v $volumeName:/home/$username/workspace \

