#!/bin/bash -eux

#login as root
#sudo apt-get -f install
# for latest ansible version use "ppa:ansible/ansible" insted of "ppa:ansible/ansible-2.5"

sudo apt-get update
sudo apt-add-repository ppa:ansible/ansible-2.5
sudo apt-get update
sudo apt-get -y install ansible


#sudo apt-get update
#sudo apt-get install \
#     python-minimal \
#     python-setuptools \
#     python-yaml \
#     python-paramiko \
#     python-jinja2 \
#     python-httplib2 \
#     git \
#     wget \
#     python-pip \
#     python-dev \
#     build-essential \
#     python-pip
#     apt-transport-https \
#     createrepo \
#     rpm2cpio  -y

#sudo wget https://launchpad.net/~ansible/+archive/ubuntu/ansible-2.4/+files/ansible_2.4.2.0-1ppa~zesty_all.deb

#sudo apt-get -f install

#sudo dpkg -i ansible_2.4.2.0-1ppa~zesty_all.deb