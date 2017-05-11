#!/bin/bash

# configure static mac 
#nmcli connection modify "Wired connection 1" 802-3-ethernet.cloned-mac-address f2:ba:01:0d:7a:44

echo " *** Config personal profile"
cp ./home/dronische/.bashrc /home/dronische/.bashrc
chown dronische:dronische /home/dronische/.bashrc

echo " *** Configuring pc name"
cp ./etc/* /etc/

echo " *** Installing some packages"
apt-get update && apt-get install docker.io tmux htop pydf libav-tools nethogs cifs-utils nfs-common nmap -y

echo " *** Configuring docker services"
usermod dronische -a -G docker

mkdir /etc/aceproxy
curl -sSL https://raw.githubusercontent.com/anabolyc/acestreamproxyvlc-pi/master/etc/p2pproxy.py > /etc/aceproxy/p2pproxy.py

curl -sSL https://raw.githubusercontent.com/anabolyc/acestreamproxyvlc-pi/master/vlc-nox.service > /etc/systemd/system/vlc-nox.service
curl -sSL https://raw.githubusercontent.com/anabolyc/acestreamproxyvlc-pi/master/acestream.service > /etc/systemd/system/acestream.service
curl -sSL https://raw.githubusercontent.com/anabolyc/acestreamproxyvlc-pi/master/aceproxy.service > /etc/systemd/system/aceproxy.service 
curl -sSL https://raw.githubusercontent.com/anabolyc/mediaserver-role-upnpd_iptv/master/systemd/upnpd_iptv-docker.service > /etc/systemd/system/upnpd_iptv-docker.service

echo " *** Starting services"
systemctl daemon-reload

systemctl enable vlc-nox
systemctl enable aceproxy
systemctl enable acestream
systemctl enable upnpd_iptv-docker

systemctl start vlc-nox
systemctl start aceproxy
systemctl start acestream
systemctl start upnpd_iptv-docker 


