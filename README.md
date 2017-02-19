# BuildDocker
It's a simple Docker project to build a image to build embedded system.

There three images that this repo wanna build

 * ut_b - A basic image that based on Ubuntu 14.04 plus some basic tools 
 * ut_ep- A image based on ut_b plus advenced packages for what we needs
 * b1   - Build machine 1, based on ut_ep plus user register ssh key and ssh enable stuff




To deal with dependency chain.

I wrote a simple Script (in admin/build <tag name> <searching root dir>) to deal with dependency chain

In Dockerfile you need to specify the image tag name

For example in Dockerfile tou can see

\#TAG ut_b:latest 

So that other image depends on ub_b knows this Dockerfile need to be built in advance





# How to Build image b1?
```
#Have docker runing on this machine
git clone git@github.com:MDMTseng/BuildDocker.git
cd BuildDocker
sh  admin/build b1 ./

#ssh port mapping is specified in this file
sh b1/admin/run.sh

#Name and password are specified in b1/admin/build.sh change it as you want
ssh ctseng@localhost -p 2022
password:pppppppp
```
