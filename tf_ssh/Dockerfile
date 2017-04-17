FROM tensorflow/tensorflow
#TAG tf_ssh:latest
ARG user
ARG pw



RUN useradd -m -p $(openssl passwd -crypt $pw) $user
RUN usermod -a -G sudo $user
RUN usermod -s /bin/bash $user


RUN apt-get update
RUN apt-get install -y bash-completion
RUN apt-get install -y ssh
RUN apt-get install -y sudo

COPY /external/.bashrc /home/$user/.bashrc

COPY /external/sshkey /home/$user/.ssh
RUN chown $user:$user /home/$user/.ssh -R

RUN pip install gym

USER $user
RUN which sh
#RUN ssh-keygen -b 4096 -q -t rsa -N '' -f ~/.ssh/id_rsa

USER root

#ssh
EXPOSE 22
EXPOSE 8888

CMD service ssh start && while true; do sleep 30000; done