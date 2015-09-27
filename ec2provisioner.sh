#!/bin/bash -x

useradd pcbc
mkdir /home/pcbc
chown pcbc:users /home/pcbc
echo pcbc:pcbc2015 | chpasswd
chsh -s /bin/bash pcbc

## Allow password login
sed -i -e "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
service ssh restart

apt-get update

apt-get install -y --no-install-recommends ed less locales vim-tiny wget

apt-get install -y curl libcurl4-openssl-dev
apt-get install -y curl
apt-get install -y libxml2-dev
apt-get install -y git
apt-get install -y openjdk-7-jre

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen en_US.utf8
/usr/sbin/update-locale LANG=en_US.UTF-8

export LC_ALL="en_US.UTF-8"

## Desktop
apt-get install -y xubuntu-desktop

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

## Set a default CRAN Repo
echo 'options(repos = list(CRAN="https://cran.rstudio.com/"))' >> /etc/R/Rprofile.site

echo 'source("/etc/R/Rprofile.site")' >> /etc/littler.r

install.r docopt

## OTher stuff
install.r ggplot2 plyr dplyr tidyr reshape reshape2 stringr knitr data.table
install.r httr RCurl swirl
install.r devtools

Rscript -e 'devtools::install_github("Sage-Bionetworks/knit2synapse")'

## For python/ipython
apt-get install -y python-pip python-dev build-essential
apt-get install -y libzmq3 libzmq3-dev
apt-get install -y tcl tcl-dev tk tk-dev libagg-dev python-tk
apt-get install -y python-imaging-tk
apt-get install -y python-wxgtk2.8 libwxbase2.8-dev
apt-get install -y libreoffice
apt-get install -y samtools

apt-get install -y python-numpy python-matplotlib python-scipy

pip install ipython pyzmq jinja2 tornado
pip install python-igraph
pip install pandas

pip install pysam
pip install sklearn

pip install PyPDF2
pip install fastcluster
pip install patsy

## ChipSeq stuff
pip install MACS2

## x2go server for remote access
apt-get install -y software-properties-common
add-apt-repository -y ppa:x2go/stable
apt-get update
apt-get install -y x2goserver x2goserver-xsession

## PathVisio
cd /opt/
wget http://developers.pathvisio.org/data/releases/current/pathvisio_bin-3.2.0-r3999.tar.gz
tar xzf pathvisio_bin-3.2.0-r3999.tar.gz
wget -P /opt/pathvisio-3.2.0/ http://www.pathvisio.org/wcms/wp-content/uploads/2013/03/pathvisio-eye-switch-e1363105300175.png

wget -P /home/pcbc/Downloads/ http://bridgedb.org/data/gene_database/metabolites_20140516.bridge.zip
wget -P /home/pcbc/Downloads/ http://www.pathvisio.org/data/gene_database/Hs_Derby_20130701.zip
wget -P /home/pcbc/Downloads/ http://www.pathvisio.org/data/gene_database/Mm_Derby_20130701.zip
wget -P /home/pcbc/Downloads/ http://www.pathvisio.org/data/gene_database/Interactions-02022013-Rhea.bridge
wget -P /home/pcbc/Downloads/ 'http://www.wikipathways.org//wpi/batchDownload.php?species=Homo%20sapiens&fileType=gpml&tag=Curation:AnalysisCollection'

## Cytoscape
cd /opt/
wget http://chianti.ucsd.edu/cytoscape-3.2.1/Cytoscape_3_2_1_unix.sh
sh Cytoscape_3_2_1_unix.sh -q

## RStudio
apt-get install -y libjpeg62
cd /opt/
wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-0.99.691-amd64.deb
dpkg -i rstudio-0.99.691-amd64.deb

## RStudio Server
cd /root/
wget https://download2.rstudio.org/rstudio-server-0.99.484-amd64.deb
dpkg -i rstudio-server-0.99.484-amd64.deb

## kallisto and sleuth
apt-get install -y cmake libhdf5-dev
cd /root
wget https://github.com/pachterlab/kallisto/archive/v0.42.3.tar.gz
tar xzf v0.42.3.tar.gz
cd kallisto-0.42.3
mkdir build
cd build
cmake .. && make && make install

Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("pachterlab/sleuth")'

script -e 'source("http://bioconductor.org/biocLite.R"); biocLite("hopach")'

## Bioconductor
Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite()'

## Cleanup
rm -rf /tmp/downloaded_packages/ /tmp/*.rds
rm -rf /var/lib/apt/lists/*
