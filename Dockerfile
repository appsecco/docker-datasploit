# Datasploit in a container
# 
# docker run -p 8000:8000 -it appsecco/datasploit
#

FROM ubuntu:16.04
MAINTAINER Madhu Akula <madhu@appsecco.com>

# installing dependencies
RUN apt-get update && apt-get install -y python-pip \
			python3-lxml libxml2-dev libxslt-dev python-dev git wget

# installing lxml 
RUN apt-get build-dep python3-lxml -y && pip install lxml

# key for mongodb
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# key for rabbitmq
RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -

# adding mongo to apt source list
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# adding rabbitmq for source list
RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list

RUN apt-get update && apt-get install -y mongodb-org rabbitmq-server

WORKDIR /opt

# cloning the datasploit git repo
RUN git clone https://github.com/upgoingstar/datasploit.git

WORKDIR /opt/datasploit

# installing python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# moving the configurations file for API (as per datasploit docs)
RUN mv config_sample.py config.py

RUN mkdir /opt/datasploit/datasploitDb

RUN apt-get remove git wget -y

# exposed the port 8000 to the host system
EXPOSE 8000
