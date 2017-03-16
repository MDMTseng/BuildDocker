FROM ut_ep:latest
#TAG b1:latest
ARG user
ARG pw

RUN useradd -m -p $(openssl passwd -crypt $pw) $user
RUN usermod -a -G sudo $user
RUN usermod -s /bin/bash $user

USER $user
RUN which sh
RUN ssh-keygen -b 4096 -q -t rsa -N '' -f ~/.ssh/id_rsa

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


RUN apt-get update
RUN apt-get install -y bash-completion

RUN apt-get install -y nfs-kernel-server
COPY /external/etc_nfs_exports /etc/exports

COPY /external/.bashrc /home/$user/.bashrc


#ssh
EXPOSE 22

#NFS
EXPOSE 111
EXPOSE 2049

CMD service ssh start && while true; do sleep 30000; done
