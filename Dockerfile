FROM node:14-alpine

RUN apk add --no-cache \
  openssh \
  util-linux \
  python3 \
  py3-pip \
  py-setuptools \
  ca-certificates \
  openssl \
  groff \
  less \
  bash \
  curl \
  jq \
  git \
  zip && \
  pip3 install --no-cache-dir --upgrade pip awscli && \
  aws configure set preview.cloudfront true

ENV TERRAFORM_VERSION 1.0.6

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip -d /usr/local/bin && \
  rm -f terraform.zip

ENTRYPOINT ["/bin/bash", "-c"]
