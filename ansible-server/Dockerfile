FROM jupyter/base-notebook:python-3.8.3

LABEL maintainer=Ravan Nannapaneni

USER root

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    iputils-ping \
    openssh-client \
    openssh-server \
    rsync \
    vim \
    && \
    apt-get clean

RUN echo "$NB_USER    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN ln -s /opt/conda/bin/python /usr/bin/ && ln -s /opt/conda/bin/python3 /usr/bin/

COPY ansible.cfg start.sh requirements.txt /home/$NB_USER/
RUN chown -R $NB_USER:$NB_GROUP /home/$NB_USER && chmod 755 /home/$NB_USER/start.sh

USER $NB_UID


ENV ANSIBLE_CONFIG /home/$NB_USER/ansible.cfg

RUN pip3 install -r ~/requirements.txt

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P "" && chmod -R 700 ~/.ssh && \
    cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys2

RUN mkdir ~/ansible && echo localhost > ~/ansible/hosts

CMD ["/home/jovyan/start.sh"]
