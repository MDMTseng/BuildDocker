volumeName=b1_vol
docker volume ls|grep $volumeName
[ $? -ne 0 ]&&(echo "cannot find docker volume:$volumeName. creat it"; docker volume create $volumeName)
username=$1
[ -z $username ]&& echo "specify your username.."&& exit 1
docker run -d \
-p 2022:22 \
-p 111:111 \
-p 2049:2049 \
-v $volumeName:/home/$username/workspace \
-v /Users/ctseng/Documents/workspace/BANZAI_X/:/home/$username/BZ_X \
-v /Library/WebServer/Documents/webup:/home/$username/WEBUP \
-v /Volumes:/home/$username/Volumes \
b1

