#The environment should be in b1

echo To build this image it needs user Name\&PW
echo -n UserName:
read  username
echo -n "Password:(won't show what you type)"
read -s password
docker build --build-arg user=$username --build-arg pw=$password -t tf_ssh .
exit $?
