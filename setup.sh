cd /root

curl -O ftp://ftp.ncbi.nih.gov/blast/executables/release/2.2.24/blast-2.2.24-x64-linux.tar.gz
tar xzf blast-2.2.24-x64-linux.tar.gz
cp blast-2.2.24/bin/* /usr/local/bin
cp -r blast-2.2.24/data /usr/local/blast-data

pip install screed

git clone https://github.com/ngs-docs/ngs-scripts /usr/local/share/ngs-scripts

apt-get -y install lighttpd

cd /etc/lighttpd/conf-enabled
ln -fs ../conf-available/10-cgi.conf ./
echo 'cgi.assign = ( ".cgi" => "" )' >> 10-cgi.conf
echo 'index-file.names += ( "index.cgi" ) ' >> 10-cgi.conf
/etc/init.d/lighttpd restart

pip install -U ipython
pip install -U ipython
pip install -U pyzmq

cd /usr/local/notebooks
rm *.ipynb
curl -O https://raw.github.com/ged-lab/2013-msu-zero-entry/master/graph-blast-bitscore.ipynb
curl -O https://raw.github.com/ged-lab/2013-msu-zero-entry/master/filter-blast-csv.ipynb
curl -O https://raw.github.com/ged-lab/2013-msu-zero-entry/master/monty-hall.ipynb
curl -O https://raw.github.com/ged-lab/2013-msu-zero-entry/master/coin-flips.ipynb

shutdown -r now
