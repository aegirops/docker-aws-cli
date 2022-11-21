FROM debian:bullseye-slim AS aws-cli

# Install dependencies
RUN apt-get update
RUN apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    python3 \
    python3-pip \
    apt-transport-https \
    gettext-base \
    jq

# Add docker
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" >> /etc/apt/sources.list \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && apt-get update \
    && apt-get install docker-ce-cli docker-compose -y

# Add new user ci and set sudo without password
RUN adduser --disabled-password --gecos "" ci
RUN echo "ci     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install aws cli from pip3 paquet manager
RUN pip3 install awscli
RUN pip3 install awscli-plugin-endpoint

# Install s3cmd
RUN pip3 install s3cmd

# Install kubectl from google official source
RUN curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Install ytt yaml templating tool
RUN curl -o /usr/local/bin/ytt -LO https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.44.0/ytt-linux-amd64 \
    && chmod +x /usr/local/bin/ytt

# Cleanup
RUN apt-get clean -y

# Use ci user and run bash
USER ci

CMD ["bash"]

FROM aws-cli AS aws-cli-serverless

# Install serverless.com cli
RUN curl -o- -L https://slss.io/install | bash
ENV PATH="$HOME/.serverless/bin:$PATH"

CMD ["bash"]