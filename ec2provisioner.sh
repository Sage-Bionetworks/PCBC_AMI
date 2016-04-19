#!/bin/bash -x

useradd pcbc
mkdir /home/pcbc
chown pcbc:users /home/pcbc
echo pcbc:pcbc2016 | chpasswd
chsh -s /bin/bash pcbc

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends ed less locales vim-tiny wget
apt-get install -y curl libcurl4-openssl-dev libxml2-dev git libncurses5-dev libpng3 libpng3-dev libmysqld-dev libstdc++-4.8-dev 
apt-get install -y python-pip

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen en_US.utf8
/usr/sbin/update-locale LANG=en_US.UTF-8

export LC_ALL="en_US.UTF-8"

## Desktop
apt-get install -y xubuntu-desktop
apt-get install -y lxde

## Google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
dpkg -i -f /tmp/google-chrome-stable_current_amd64.deb
apt-get -f --force-yes --yes install
dpkg -i -f /tmp/google-chrome-stable_current_amd64.deb

## Get data for R teaching
wget http://swcarpentry.github.io/r-novice-inflammation/r-novice-inflammation-data.zip -P /mnt/r-novice-inflammation
cd /mnt/r-novice-inflammation
unzip /mnt/r-novice-inflammation/r-novice-inflammation-data.zip
chown -R pcbc:pcbc /mnt/r-novice-inflammation
