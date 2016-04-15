#!/bin/bash -x

apt-get install -y tk-dev python-tk

cd /opt
git clone https://github.com/kdaily/altanalyze.git
cd altanalyze
git checkout seattle

# Download databases
python AltAnalyze.py --update Official --version EnsMart72 --species Hs --platform RNASeq
