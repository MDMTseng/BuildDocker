MACH_TAG=$1
#Set default ROOT as the context
ROOT_DIR=${2:-"./"}
if [ -z "$MACH_TAG" ] ;then
    echo "`basename "$0"` <image tag> <ROOT_DIR(default ./)>"
		exit 1
fi

Dockerfile_List=$(find $ROOT_DIR -name Dockerfile)

TargetPath=$(grep "TAG\s" $Dockerfile_List|sed 's/\/Dockerfile:#TAG / /g'|grep $MACH_TAG)
if [ $? -ne 0 ];then
	echo "No Dockerfile with TAG:$MACH_TAG under ROOT_DIR:$ROOT_DIR"
	echo "Try pull from docker"
	#docker pull $MACH_TAG
	exit $?
fi

TargetPath=$(echo $TargetPath|awk '{print $1}')

#Get base image TAG for the target
BASE_TAG=$(grep "FROM\s" $TargetPath/Dockerfile|sed 's/:FROM / /g'|awk '{print $2}')

echo "To Build $MACH_TAG requires ${BASE_TAG:-\"NULL\"}.. "
if [ ! -z $BASE_TAG ]; then
	sh $0 $BASE_TAG $ROOT_DIR
	[ $? -ne 0 ] && exit 1
else
	echo "ERROR: No base image specified in Dockerfile: Check Dockerfile under path $TargetPath"
	exit 1
fi
echo $MACH_TAG
echo $TargetPath/build.sh
if [ -f $TargetPath/build.sh ];then
	( cd $TargetPath ; sh ./build.sh $MACH_TAG)
else
	docker build -t $MACH_TAG $TargetPath
fi
exit $?
