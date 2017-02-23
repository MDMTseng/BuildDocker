
sharedFolder=${1:-$(pwd)}
sharedFolder=$(cd $sharedFolder && pwd )
mappedFolder=/home/$USER/sharedFolder
docker run \
-v $sharedFolder:$mappedFolder \
b_auto

