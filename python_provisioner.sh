#!/bin/bash -x

## For python/ipython
apt-get install -y python-pip python-dev build-essential libzmq3 libzmq3-dev tcl tcl-dev tk tk-dev libagg-dev python-tk openjdk-7-jre
apt-get install -y libopenblas-dev libopenblas-base liblapack-dev gfortran python-dev

pip install numpy
pip install scipy
pip install pandas
pip install matplotlib

pip install jupyter ipython pyzmq jinja2 tornado

pip install pysam
pip install sklearn

pip install PyPDF2
pip install fastcluster
pip install patsy

## ChipSeq stuff
pip install MACS2

apt-get install -y python-wxgtk2.8 libwxbase2.8-dev
