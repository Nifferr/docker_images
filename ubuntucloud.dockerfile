FROM ubuntu:20.04
WORKDIR /usr/local/
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y lsb-release apt-transport-https ca-certificates gnupg wget curl python3-pip python3.8-venv unzip jq
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    python3.8 awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update -y && \
    apt-get install google-cloud-sdk vim -y