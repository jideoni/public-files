#!/bin/bash

#script to install minikube, docker on Amazon Linux 2 AMI
# Installing minikube
sudo yum update &&

# Install Docker
echo Intalling Docker....... &&
sudo yum install docker &&
sudo usermod -aG docker $USER && newgrp docker &&
#enable docker
sudo systemctl enable docker.service &&
#start docker
sudo systemctl start docker.service &&
#check docker status
sudo systemctl status docker.service &&
echo Docker Installation complete &&

#install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
sudo install minikube-linux-amd64 /usr/local/bin/minikube &&
#start minikube
minikube start --driver=docker &&

#install kubectl 1.29
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.0/2024-01-04/bin/linux/amd64/kubectl &&
#Apply execute permissions to the binary
chmod +x ./kubectl &&
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH &&
#check version
kubectl version --client
