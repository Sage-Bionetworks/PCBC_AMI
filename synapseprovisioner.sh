#!/bin/bash -x

sudo pip install synapseclient

## For the R client
install.r RJSONIO digest

Rscript -e 'source("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"))'
