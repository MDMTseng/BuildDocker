FROM ut_ep:latest
#TAG b_auto:latest
ARG user

RUN useradd -m $user
RUN usermod -a -G sudo $user
RUN usermod -s /bin/bash $user

USER $user
#Setup pybin & it's path
COPY /external/pybin /home/$user/pybin
RUN echo "PATH=\$PATH:/home/$user/pybin" >> /home/$user/.bashrc

#Setup gcc-arm-none
ENV GCC_ARM_FILE gcc-arm-none-eabi-4_7-2013q3-20130916-linux
COPY /external/${GCC_ARM_FILE}.tar.bz2 /home/$user/${GCC_ARM_FILE}.tar.bz2
RUN tar xvjf /home/$user/${GCC_ARM_FILE}.tar.bz2 -C /home/$user/
RUN rm /home/$user/${GCC_ARM_FILE}.tar.bz2
RUN echo "PATH=\$PATH:/home/$user/gcc-arm-none-eabi-4_7-2013q3/bin" >> /home/$user/.bashrc

WORKDIR /home/$user/sharedFolder

ENTRYPOINT sh docker-entrypoint.sh
