# Based on the example Dockerfile at:
# https://github.com/microsoft/vscode-dev-containers/blob/master/containers/debian/.devcontainer/Dockerfile

# Update the VARIANT arg in devcontainer.json to override the Debian version below
ARG VARIANT=buster
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

RUN git config --global core.editor "code --wait"

    # Install shellcheck (apt-get doesn't install the latest version needed by VS code, so installing from GitHub release, see:
    # https://askubuntu.com/a/1228181)
ARG SHELLCHECK_VERSION="v0.7.1"
ARG SECRETHUB_CLI_VERSION="v0.40.0"
SHELL ["/bin/bash", "-o", "pipefail", "-c"] 
# hadolint ignore=DL4001
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
# Install xz-utils to extract tarballs
    && apt-get -y install --no-install-recommends xz-utils=5.2.4-1 \
    && mkdir -p /tmp/shellcheck \
    && wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${SHELLCHECK_VERSION}/shellcheck-${SHELLCHECK_VERSION}.linux.x86_64.tar.xz" | tar -xJv -C /tmp/shellcheck/ \
    && install -m 755 /tmp/shellcheck/shellcheck-${SHELLCHECK_VERSION}/shellcheck /usr/local/bin/shellcheck \
    && rm -rf /tmp/shellcheck \
    #
    # Install SecretHub CLI to manage our secrets
    && mkdir -p /tmp/secrethub \
    && wget -qO- "https://github.com/secrethub/secrethub-cli/releases/download/${SECRETHUB_CLI_VERSION}/secrethub-${SECRETHUB_CLI_VERSION}-linux-386.tar.gz" | tar -xz -C /tmp/secrethub/ \
    && install -m 755 /tmp/secrethub/bin/secrethub /usr/local/bin/secrethub \
    && rm -rf /tmp/secrethub \
    # Install the Confluent Cloud CLI - see:
    # https://docs.confluent.io/current/quickstart/cloud-quickstart/index.html#cloud-cli-install
    && curl -L --http1.1 https://cnfl.io/ccloud-cli | sh -s -- -b /usr/local/bin \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
