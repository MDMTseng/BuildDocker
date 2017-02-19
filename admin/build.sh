MACH_TAG=$1
ROOT_DIR=$2

Dockerfile_List=$(find $ROOT_DIR -name Dockerfile)

TargetPath=$(grep "TAG\s" $Dockerfile_List|sed 's/\/Dockerfile:#TAG / /g'|grep $MACH_TAG)
if [ $? -ne 0 ];then
	echo "No Dockerfile with TAG:$MACH_TAG under ROOT_DIR:$ROOT_DIR"
	echo "Try pull from docker"
	docker pull $MACH_TAG
	exit $?
fi

TargetPath=$(echo $TargetPath|awk '{print $1}')

TargetBase=$(grep "FROM\s" $TargetPath/Dockerfile|sed 's/:FROM / /g'|awk '{print $2}')

if [ ! -z $TargetBase ]; then
	sh $0 $TargetBase $ROOT_DIR
	[ $? -ne 0 ] && exit 1
fi
echo $MACH_TAG
echo $TargetPath/build.sh
if [ -f $TargetPath/build.sh ];then
	( cd $TargetPath ; sh ./build.sh)
else
	docker build -t $MACH_TAG $TargetPath
fi
exit $?
