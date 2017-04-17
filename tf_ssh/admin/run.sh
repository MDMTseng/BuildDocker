volumeName=b1_vol
docker volume ls|grep $volumeName
[ $? -ne 0 ]&&(echo "cannot find docker volume:$volumeName. creat it"; docker volume create $volumeName)
username=$1
[ -z $username ]&& echo "specify your username.."&& exit 1
docker run -d \
-p 3022:22 \
-p 8088:8888 \
-v $volumeName:/home/$username/workspace \
-v /Library/WebServer/Documents/webup:/home/$username/WEBUP \
-v /Users/ctseng/workspace:/home/$username/ct_ws \
tf_ssh

