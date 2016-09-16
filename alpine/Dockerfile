FROM alpine:latest
MAINTAINER Madhu Akula <madhu@appsecco.com>

# for mongodb package
RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

# running update
RUN apk upgrade --update

# installing dependencies
RUN apk add py-pip libxml2-dev libxslt-dev python-dev git py-lxml mongodb rabbitmq-server

#RUN pip install lxml

RUN git clone https://github.com/upgoingstar/datasploit.git

WORKDIR /datasploit

RUN pip install -r requirements.txt

RUN mv config_sample.py config.py && mkdir /datasploit/datasploitDb

RUN apk del git && rm -rf /var/cache/apk/*

EXPOSE 8000
