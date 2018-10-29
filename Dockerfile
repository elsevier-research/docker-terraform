FROM python:3.6-slim

ENV TERRAFORM_VERSION=0.11.10

RUN apt-get update \
    && apt-get install -y unzip curl ca-certificates libcurl4-openssl-dev \
    && apt-get install -y build-essential libssl-dev libffi-dev tzdata wget vim \
    && mkdir -p /tmp/terraform \
    && cd /tmp/terraform \
    && curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform* /usr/local/bin/ \
    && rm -rf /tmp/terraform

RUN apt-get install -y git bsdmainutils gnupg

# install fish shell manually to have lastest version 
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' | tee -a /etc/apt/sources.list
RUN wget -q -O - https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key | apt-key add -

RUN apt-get update
RUN apt-get install -y fish

RUN apt-get purge -y --auto-remove unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://get.oh-my.fish > install && fish install --noninteractive
RUN fish -c 'omf install aws'

SHELL ["/usr/bin/fish"]
CMD ["fish"]

