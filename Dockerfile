# DevOps Toolset Dockerfile
# Base image: lightweight and popular for tool containers
FROM debian:stable-slim

LABEL maintainer="devops@yourcompany.com"
LABEL description="A DevOps toolset container with essential CLI tools."

# Install essential tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        curl \
        redis-tools \
        git \
        iputils-ping \
        dnsutils \
        net-tools \
        vim \
        htop \
        unzip \
        jq \
        openssh-client \
        less \
        procps && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Set entrypoint to bash for interactive use
ENTRYPOINT ["/bin/bash"]
