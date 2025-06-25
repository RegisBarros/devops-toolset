# DevOps Toolset Dockerfile
# Base image: Pinning to a specific version for predictable builds
FROM debian:12-slim

LABEL maintainer="devops@yourcompany.com"
LABEL description="A DevOps toolset container with essential CLI tools."

# Arguments for user and group IDs
ARG UID=10001
ARG GID=10001

# Install essential tools in a single RUN command to reduce layers
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
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd -g ${GID} devops && \
    useradd -u ${UID} -g devops -m -s /bin/bash devops

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Set working directory
WORKDIR /workspace

# Switch to the non-root user
USER devops

# Set entrypoint and default command for Kubernetes compatibility
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "while true; do sleep 30; done"]
