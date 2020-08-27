FROM jupyter/base-notebook:python-3.8.3

LABEL maintainer="Ravan Nannapaneni"

# Switch to root user
USER root

# Install necessary software
# iputils-ping to ping other machines in network
# ssh - client and server for ansible
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    iputils-ping \
    openssh-client \
    openssh-server \
    rsync \
    vim \
    && \
    apt-get clean

# Give no password sudo access to jupyter user
RUN echo "$NB_USER    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

# Create python link for ansible
RUN ln -s /opt/conda/bin/python /usr/bin/ && ln -s /opt/conda/bin/python3 /usr/bin/

# Copy files for change permissions
COPY ansible.cfg start.sh requirements.txt /home/$NB_USER/
RUN chown -R $NB_USER:$NB_GROUP /home/$NB_USER && chmod 755 /home/$NB_USER/start.sh

USER $NB_UID

# Set ansible config file
ENV ANSIBLE_CONFIG /home/$NB_USER/ansible.cfg

# Install required python packages
RUN pip3 install -r ~/requirements.txt

# Setup SSH for ansible
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P "" && chmod -R 700 ~/.ssh && \
    cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys2

# Add localhost to ansible hosts file
RUN mkdir ~/ansible && echo localhost > ~/ansible/hosts

# Change the CMD to (1) start SSH (2) start Jupyter
CMD ["/home/jovyan/start.sh"]
