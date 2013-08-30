# DOCKER-VERSION 0.4.x
FROM ubuntu:12.10
MAINTAINER Terin Stock <terinjokes@gmail.com>

# Setup image
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common build-essential
RUN sudo add-apt-repository ppa:chris-lea/node.js
RUN sudo apt-get update
RUN sudo apt-get install -y nodejs



# Install couchdb
RUN sudo apt-add-repository ppa:nilya/couchdb-1.3
RUN sudo apt-get update
RUN sudo apt-get install -y couchdb
RUN sudo apt-get install -y curl wget git
RUN npm install -g npm
RUN echo "install couchapp"
RUN npm install -g couchapp

ADD scripts/setup.sh /root/setup-npm.sh
RUN /root/setup-npm.sh

# Runtime configuration

ADD scripts/startup.sh /root/startup-npm.sh
CMD /root/startup-npm.sh

# Expose couchdb
EXPOSE :5984
EXPOSE :1337
