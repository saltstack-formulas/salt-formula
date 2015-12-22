#!/bin/sh
sudo apt-get update -y
echo 'deb http://repo.saltstack.com/apt/ubuntu/ubuntu14 trusty main' | sudo tee /etc/apt/sources.list.d/saltstack.list
wget -O - https://repo.saltstack.com/apt/ubuntu/ubuntu14/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install salt-master -y
sudo apt-get install salt-minion -y
# setup top files to test the formula
sudo mkdir -p /srv/pillar
sudo ln -s /srv/salt/pillar.example /srv/pillar/salt.sls
sudo ln -s /srv/salt/dev/pillar_top.sls /srv/pillar/top.sls
# this file will be copied to make a running config. it should not be checked in.
sudo cp /srv/salt/dev/state_top.sls /srv/salt/top.sls
# Accept all keys#
sleep 15 #give the minion a few seconds to register
sudo salt-key -y -A
