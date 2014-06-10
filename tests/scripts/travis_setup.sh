#!/bin/bash

sudo apt-get -y install openbabel fp-compiler
wget "http://merian.pch.univie.ac.at/pch/download/chemistry/checkmol/server/cmmmsrv.pas"
fpc cmmmsrv.pas -O3 -Op3
sudo mv ./cmmmsrv /usr/local/bin
sudo mv $TRAVIS_BUILD_DIR/tests/scripts/cmmmsrv.init /etc/init.d/cmmmsrv
sudo chmod +x /etc/init.d/cmmmsrv
sudo service cmmmsrv start
wget "http://ggasoftware.com/downloads/indigo-1.1.12/indigo-python-1.1.12-linux.zip"
unzip indigo-python-1.1.12-linux.zip
cd $HOME/drupal-*
mv ../indigo-python-1.1.12-linux sites/all/libraries/indigo-python
