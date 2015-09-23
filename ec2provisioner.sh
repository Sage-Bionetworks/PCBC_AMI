#!/bin/bash -x

useradd pcbc
mkdir /home/pcbc
chown pcbc:users /home/pcbc
echo pcbc:pcbc2015 | chpasswd

useradd docker
mkdir /home/docker
chown docker:docker /home/docker
addgroup docker staff

apt-get update

apt-get install -y --no-install-recommends ed less locales vim-tiny wget

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen en_US.utf8
/usr/sbin/update-locale LANG=en_US.UTF-8

export LC_ALL="en_US.UTF-8"

## Use Ubuntu repo at CRAN, and use RStudio CDN as mirror
## This gets us updated r-base, r-base-dev, r-recommended and littler
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
gpg -a --export E084DAB9 | apt-key add -

echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" > /etc/apt/sources.list.d/r-cran.list

export R_BASE_VERSION=3.1.2

# ## Now install R and littler, and create a link for littler in /usr/local/bin
apt-get update
apt-get install -y --no-install-recommends littler r-base=${R_BASE_VERSION}* r-base-dev=${R_BASE_VERSION}* r-recommended=${R_BASE_VERSION}*

ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r
ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r
ln -s /usr/share/doc/littler/examples/installGithub.r /usr/local/bin/installGithub.r
ln -s /usr/share/doc/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r

install.r docopt

## Set a default CRAN Repo
echo 'options(repos = list(CRAN="http://cran.rstudio.com/"))' >> /etc/R/Rprofile.site

## OTher stuff
install.r ggplot2 plyr dplyr tidyr reshape reshape2 stringr


## For python/ipython
apt-get install -y python-pip python-dev build-essential
apt-get install -y libzmq3 libzmq3-dev

apt-get install -y tcl tcl-devel tk tk-devel libagg-dev python-tk

pip install numpy pandas ipython pyzmq jinja2 tornado

pip install matplotlib
pip install pysam
pip install sklearn

## Desktop stuff for remote access
apt-get install -y xubuntu-desktop


## Cleanup
rm -rf /tmp/downloaded_packages/ /tmp/*.rds
rm -rf /var/lib/apt/lists/*

