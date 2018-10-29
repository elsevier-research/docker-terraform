FROM python:3.6-slim

ENV TERRAFORM_VERSION=0.11.10

RUN apt-get update \
    && apt-get install -y unzip curl \
    #&& apt-get install -y ca-certificates libcurl4-openssl-dev \
    #&& apt-get install -y build-essential libssl-dev libffi-dev tzdata wget vim \
    && mkdir -p /tmp/terraform \
    && cd /tmp/terraform \
    && curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform* /usr/local/bin/ \
    && rm -rf /tmp/terraform \
    && apt-get remove -y unzip curl \
    && apt-get purge -y --auto-remove unzip \
    && rm -rf /var/lib/apt/lists/*

