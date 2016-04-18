#!/bin/bash -x

# UCSC tools
mkdir /opt/ucsc_tools
wget http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v309.src.tgz -P /opt/ucsc_tools
cd /opt/ucsc_tools
tar xzf userApps.v309.src.tgz
cd userApps
make
export PATH=${PATH}:/opt/ucsc_tools/userApps/bin

# ## PathVisio
# cd /opt/
# wget http://developers.pathvisio.org/data/releases/current/pathvisio_bin-3.2.0-r3999.tar.gz
# tar xzf pathvisio_bin-3.2.0-r3999.tar.gz
# wget -P /opt/pathvisio-3.2.0/ http://www.pathvisio.org/wcms/wp-content/uploads/2013/03/pathvisio-eye-switch-e1363105300175.png

# wget -P /home/pcbc/Downloads/ http://bridgedb.org/data/gene_database/metabolites_20140516.bridge.zip
# wget -P /home/pcbc/Downloads/ http://www.pathvisio.org/data/gene_database/Hs_Derby_20130701.zip
# wget -P /home/pcbc/Downloads/ http://www.pathvisio.org/data/gene_database/Mm_Derby_20130701.zip
# wget -P /home/pcbc/Downloads/ http://www.pathvisio.org/data/gene_database/Interactions-02022013-Rhea.bridge
# wget -P /home/pcbc/Downloads/ 'http://www.wikipathways.org//wpi/batchDownload.php?species=Homo%20sapiens&fileType=gpml&tag=Curation:AnalysisCollection'

## Cytoscape
cd /opt/
wget http://chianti.ucsd.edu/cytoscape-3.3.0/Cytoscape_3_3_0_unix.sh
sh Cytoscape_3_3_0_unix.sh -q

## kallisto and sleuth
apt-get install -y cmake libhdf5-dev
cd /root
wget https://github.com/pachterlab/kallisto/archive/v0.42.3.tar.gz
cd kallisto-0.42.3
mkdir build
cd build
cmake .. && make && make install

## ngsPlot
## Need to export NGSPLOT=/opt/ngsplot-2.61
cd /root
wget https://github.com/shenlab-sinai/ngsplot/archive/2.61.tar.gz
tar xzf 2.61.tar.gz -C /opt

## Homer stuff
# mkdir /opt/ucsc
# wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat -P /opt/ucsc
# wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig -P /opt/ucsc
# wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/liftOver -P /opt/ucsc
# chmod +x /opt/ucsc/*
# export PATH=${PATH}:/opt/ucsc

# Weblogo
cd /root
wget http://weblogo.berkeley.edu/release/weblogo.2.8.2.tar.gz
tar xzf weblogo.2.8.2.tar.gz -C /opt
export PATH=${PATH}:/opt/weblogo

# samtools
cd /root
curl --location "http://downloads.sourceforge.net/project/samtools/samtools/1.3/samtools-1.3.tar.bz2?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fsamtools%2Ffiles%2F&ts=1460658865&use_mirror=iweb" -o samtools-1.3.tar.bz2
tar xjf samtools-1.3.tar.bz2
cd samtools-1.3
./configure && make && make install

# Homer
mkdir /opt/homer
export PATH=$PATH:/opt/homer/bin
wget http://homer.salk.edu/homer/configureHomer.pl -P /opt/homer
perl /opt/homer/configureHomer.pl -install

# IGV
mkdir /opt/IGV
wget http://data.broadinstitute.org/igv/projects/downloads/IGV_2.3.72.zip -P /opt/IGV
unzip /opt/IGV/IGV_2.3.72.zip
