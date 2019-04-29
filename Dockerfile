FROM debian:stretch-slim

# Install dependencies
RUN apt-get update
RUN apt-get install -y \
    sudo \
    curl \
    git \
    python3 \
    python3-pip \
    apt-transport-https \
    gettext-base

# Add docker
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && apt-get update \
    && apt-get install docker-ce-cli

# Add new user ci and set sudo without password
RUN adduser --disabled-password --gecos "" ci
RUN echo "ci     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install aws cli from pip3 paquet manager
RUN pip3 install awscli

# Install kubectl from google official source
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN mv /kubectl /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# Cleanup
RUN apt-get clean -y

# Use ci user and run bash
USER ci

CMD ["bash"]
