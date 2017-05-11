#!/bin/bash

# configure static mac 
#nmcli connection modify "Wired connection 1" 802-3-ethernet.cloned-mac-address f2:ba:01:0d:7a:44

# pc name
cp ./etc/* /etc/

# install some packages
apt-get update && apt-get install docker.io tmux htop pydf libav-tools nethogs cifs-utils nfs-common nmap -y
