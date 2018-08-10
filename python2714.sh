#!/bin/bash

sudo yum update

#install deps
sudo yum install -y wget epel-release git
sudo yum groupinstall -y "development tools"
sudo yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel

#download python
wget http://python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz
tar xf Python-2.7.14.tar.xz
cd Python-2.7.14

#config+install python
./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
sudo make
sudo make altinstall

#add python to secure path
sudo sed -i 's/Defaults    secure_path = \/sbin:\/bin:\/usr\/sbin:\/usr\/bin/Defaults    secure_path = \/usr\/local\/bin:\/sbin:\/bin:\/usr\/sbin:\/usr\/bin/' /etc/sudoers

#download+install pip
cd ..
wget https://bootstrap.pypa.io/get-pip.py
sudo python2.7 get-pip.py

