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
install.r ggplot2 plyr dplyr tidyr reshape reshape2 stringr knitr data.table httr RCurl swirl devtools

Rscript -e 'devtools::install_github("Sage-Bionetworks/knit2synapse")'
Rscript -e 'devtools::install_github("brian-bot/githubr")'

## RStudio
apt-get install -y libjpeg62
cd /opt/
wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-0.99.691-amd64.deb
dpkg -i rstudio-0.99.691-amd64.deb

## RStudio Server
cd /root/
wget https://download2.rstudio.org/rstudio-server-0.99.484-amd64.deb
dpkg -i rstudio-server-0.99.484-amd64.deb

Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("pachterlab/sleuth")'

## Bioconductor
Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite()'

Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite(c("BSgenome", "Rsamtools", "ShortRead"))'
