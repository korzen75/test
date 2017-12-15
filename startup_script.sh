#! /usr/bin/env bash

# Create dir if 
DIR="/home/ekobushka"
if [ ! -d "$DIR" ]; then
    mkdir $DIR
fi

# Add repository MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

# install ruby & mongodb
sudo apt-get update && sudo apt-get install -y ruby-full ruby-bundler build-essential mongodb-org

# Check ruby & bundle
# ruby -v
# bundle -v

# Add mongodb service
sudo systemctl start mongod
sudo systemctl enable mongod

# Check status mongodb
# sudo systemctl status mongod

# Deploy app
cd $DIR
git clone https://github.com/Otus-DevOps-2017-11/reddit.git 
cd reddit && bundle install
puma -d
