# cd /opt/
# git clone https://github.com/kdaily/altanalyze.git
# cd altanalyze
# git checkout bozeman

# Download databases
# python AltAnalyze.py --update Official --version EnsMart72 --species Hs --platform RNASeq

cd /home/pcbc
git clone https://github.com/kdaily/altanalyze.git
chown -R pcbc:pcbc altanalyze
chmod -R a+rwx altanalyze

cd altanalyze
git checkout bozeman

cp /usr/local/bin/kallisto /home/pcbc/altanalyze/AltDatabase/kallisto/0.42.1/Linux/bin/

# Download databases
python AltAnalyze.py --update Official --version EnsMart72 --species Hs --platform RNASeq
