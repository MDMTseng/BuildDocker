FROM ut_b:latest
#TAG ut_tm:latest



#in orfer to have add-apt-repository
RUN apt-get update && apt-get install -y software-properties-common



#You must install Git version 2.5 or later.  If you're running Ubuntu 14.04, please do:
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git

#You must install gcc-4.9 and g++-4.9:

#Add test gcc builds to Ubuntu package provider list:
RUN add-apt-repository ppa:ubuntu-toolchain-r/test

#Install version 4.9 of gcc and g++
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install -y gcc-4.9-multilib g++-4.9-multilib

#Install version 4.9 as the default:
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100
RUN update-alternatives --config gcc
RUN update-alternatives --config g++ 

#dpkg-reconfigure dash
#RUN dpkg-reconfigure dash
RUN apt-get install -y phablet-tools