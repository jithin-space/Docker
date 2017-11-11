#!/bin/bash

apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 

echo 'deb [arch=amd64] https://download.docker.com/linux/debian stretch stable' >> /etc/apt/sources.list

apt-get update && apt-get install docker-ce -y

