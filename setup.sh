#!/bin/bash

sudo mv ~/swarmkit.tar.gz /
sudo apt -y update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce
apt-get install -y golang
echo 'export GOPATH=/opt/go' >> ~/.bashrc
echo 'export PATH=$PATH:/opt/go/bin:/opt/go/src/github.com/docker/swarmkit/bin' >> ~/.bashrc
export GOPATH=/opt/go
mkdir -p $GOPATH/src/ && mkdir -p $GOPATH/pkg/ && mkdir -p $GOPATH/bin/
go get github.com/shirou/gopsutil
mkdir -p $GOPATH/src/golang.org/x
cd $GOPATH/src/golang.org/x
git clone https://github.com/golang/sys.git
mkdir  /opt/go/src/github.com/docker
apt install -y python-pip
pip install docker
tar -xzf /swarmkit.tar.gz -C /opt/go/src/github.com/docker/
cd /opt/go/src/github.com/docker/swarmkit/
make setup
make binaries

docker pull myidwei/test:0.02
