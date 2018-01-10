FROM ut_tm:latest
#TAG b_tm:latest
ARG user
ARG pw



RUN useradd -m -p $(openssl passwd -crypt $pw) $user
RUN usermod -a -G sudo $user
RUN usermod -s /bin/bash $user


RUN apt-get update
RUN apt-get install -y bash-completion

COPY /external/.bashrc /home/$user/.bashrc


COPY /external/sshkey /home/$user/.ssh
RUN chown $user:$user /home/$user/.ssh -R


USER $user
RUN which sh
#RUN ssh-keygen -b 4096 -q -t rsa -N '' -f ~/.ssh/id_rsa


USER root

#Setup pybin & it's path
COPY /external/pybin /home/$user/pybin
RUN echo "PATH=\$PATH:/home/$user/pybin" >> /home/$user/.bashrc

#Setup gcc-arm-none
ENV GCC_ARM_FILE gcc-arm-none-eabi-4_7-2013q3-20130916-linux
COPY /external/${GCC_ARM_FILE}.tar.bz2 /home/$user/${GCC_ARM_FILE}.tar.bz2
RUN tar xvjf /home/$user/${GCC_ARM_FILE}.tar.bz2 -C /home/$user/
RUN rm /home/$user/${GCC_ARM_FILE}.tar.bz2
RUN echo "PATH=\$PATH:/home/$user/gcc-arm-none-eabi-4_7-2013q3/bin" >> /home/$user/.bashrc

#For perf img -> makeinfo,gawk,chrpath
RUN apt-get update && apt-get install -y texinfo gawk chrpath

#Install zip
RUN apt-get update && apt-get install -y zip
#ssh
EXPOSE 22

CMD service ssh start && while true; do sleep 30000; done
