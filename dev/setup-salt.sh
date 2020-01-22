#!/bin/sh

curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh stable

sudo apt-get update -y
sudo apt-get install salt-master -y
sudo apt-get install salt-minion -y
# setup top files to test the formula
sudo mkdir -p /srv/pillar
sudo ln -s /srv/salt/pillar.example /srv/pillar/salt.sls
sudo ln -s /srv/salt/dev/pillar_top.sls /srv/pillar/top.sls
# this file will be copied to make a running config. it should not be checked in.
sudo cp /srv/salt/dev/state_top.sls /srv/salt/top.sls
sleep 15 #give the minion a few seconds to register
# Accept all keys#
sudo salt-key -y -A
