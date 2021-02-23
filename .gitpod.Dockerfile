FROM gitpod/workspace-full

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN sudo apt-get update && apt-get upgrade -y
RUN sudo apt-get install -y python3 python3-dev python3-pip nano \
  git curl net-tools jq zip unzip dnsutils httpie tzdata wget \
  htop iputils-ping mysql-client redis gsutil apt-transport-https \
  ca-certificates gnupg gcc python-dev python-setuptools libffi-dev

RUN sudo python3 -m pip install --upgrade pip

RUN sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
  -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root
COPY ./ ./
