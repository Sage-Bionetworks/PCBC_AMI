#!/bin/bash -x
apt-get -y install python-pip
sudo pip install synapseclient

## For the R client
install.r RJSONIO digest

Rscript -e 'source("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"))'
