#!/bin/bash -x

useradd pcbc
mkdir /home/pcbc
chown pcbc:users /home/pcbc
echo pcbcseattle:pcbc2016pcbc | chpasswd
chsh -s /bin/bash pcbc

export DEBIAN_FRONTEND=noninteractive
apt-get install -y --no-install-recommends ed less locales vim-tiny wget
apt-get install -y curl libcurl4-openssl-dev libxml2-dev git libncurses5-dev

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen en_US.utf8
/usr/sbin/update-locale LANG=en_US.UTF-8

export LC_ALL="en_US.UTF-8"

## Desktop
apt-get install -y xubuntu-desktop
