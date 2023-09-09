FROM jenkins/jenkins

USER root

# Install Python 3 and pip
RUN apt-get update && \
    apt-get -y install python3 python3-pip

# Install Ansible
RUN pip3 install -U ansible

# Install Docker dependencies
RUN apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Add Docker GPG key and repository
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# Install Docker
RUN apt-get update && \
    apt-get -y install docker-ce

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins

USER jenkins
