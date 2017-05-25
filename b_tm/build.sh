#The environment should be in b1
[ ! -d ./external/pybin ]&& echo "please extract pybin folder in the folder with Dockerfile" && exit 1

GCC_ARM_FILE=gcc-arm-none-eabi-4_7-2013q3-20130916-linux.tar.bz2
if [ ! -f ./external/$GCC_ARM_FILE ];
  then echo "No file $GCC_ARM_FILE found in external folder try to download it.."
  wget https://launchpad.net/gcc-arm-embedded/4.7/4.7-2013-q3-update/+download/$GCC_ARM_FILE -P ./external/
  [ $? -ne 0 ] && exit 1
fi

echo To build this image it needs user Name\&PW
echo -n UserName:
read  username
echo -n "Password:(won't show what you type)"
read -s password
docker build --build-arg user=$username --build-arg pw=$password -t b_tm .
exit $?
