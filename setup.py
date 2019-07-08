import os
import sys, socket

print("Running apt-get update")
os.system("sudo apt -y update")
os.system("sudo apt-get -y install git")

print("Installing apt-transport-https, ca-certificates, curl, software-properties-common")
os.system("swapoff -a")
os.system("sudo apt-get -y install \
apt-transport-https \
ca-certificates \
curl \
software-properties-common")

print("Downloading Docker related.....")
os.system("curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -")
os.system("add-apt-repository \
deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable")

print("Installing docker-ce & golang")
os.system("apt-get update")
os.system("apt-get install -y docker docker.io")
os.system("apt-get install -y golang")

os.system("mkdir -p /opt/go")
os.system("echo 'export GOPATH=/opt/go' >> ~/.bashrc")
os.system("echo 'export PATH=$PATH:/opt/go/bin:/opt/go/src/github.com/docker/swarmkit/bin' >> ~/.bashrc")
os.system("export GOPATH=/opt/go")
os.system("mkdir -p $GOPATH/src/ && mkdir -p $GOPATH/pkg/ && mkdir -p $GOPATH/bin/")

print("Pulling gopsutil")
os.system("go get github.com/shirou/gopsutil")
os.system("mkdir -p $GOPATH/src/golang.org/x")

os.system("cd $GOPATH/src/golang.org/x")
os.system("git clone https://github.com/golang/sys.git")
os.system("mkdir /opt/go/src/github.com/docker")

print("Installing pip")
os.system("apt install -y python-pip")

print("Installing docker...")
os.system("pip install docker")

print("Downloading and installing swarmkit")
os.system("tar -xzf swarmkit.tar.gz -C /opt/go/src/github.com/docker/")
os.system("cd opt/go/src/github.com/docker/swarmkit/")
os.system("make setup")
os.system("make binaries")
