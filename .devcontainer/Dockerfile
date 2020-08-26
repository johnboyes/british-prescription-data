# Based on the example Dockerfile at:
# https://github.com/microsoft/vscode-dev-containers/blob/master/containers/debian/.devcontainer/Dockerfile

# Update the VARIANT arg in devcontainer.json to override the Debian version below
ARG VARIANT=buster
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

RUN git config --global core.editor "code --wait"

# Install the Confluent Cloud CLI - see:
# https://docs.confluent.io/current/quickstart/cloud-quickstart/index.html#cloud-cli-install
SHELL ["/bin/bash", "-o", "pipefail", "-c"] 
RUN curl -L --http1.1 https://cnfl.io/ccloud-cli | sh -s -- -b /usr/local/bin
