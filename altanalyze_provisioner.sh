cd /opt
git clone https://github.com/kdaily/altanalyze.git
cd altanalyze
git checkout bozeman

# Download databases
python AltAnalyze.py --update Official --version EnsMart72 --species Hs --platform RNASeq
