#!/bin/sh

if [ ! -e ~/.ssh/id_rsa.pub ]
then
	echo "creating RSA key-pair"
	ssh-keygen -t rsa
	cat ~/.ssh/id_rsa.pub
fi

TERMINATOR_EXISTS=`which terminator`

if [ $? == 1 ] 
then 
	echo "fetching rpmforge and installing terminator"
	wget http://apt.sw.be/redhat/el6/en/i386/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.i686.rpm 
	sudo rpm -Uvh rpmforge-release-0.5.3-1.el6.rf.i686.rpm
	sudo yum install terminator
fi

if [ ! -e /etc/yum.repos.d/chromium-el6.repo ]
then
	echo "installing chrome"
	cd /etc/yum.repos.d
	sudo wget http://people.centos.org/hughesjr/chromium/6/chromium-el6.repo
	sudo yum install chromium
fi

if [ ! -e ~/.vimrc ]
then
	echo "setting up minimal ~/.vimrc"
	touch ~/.vimrc
	echo "set expandtab" > ~/.vimrc
	echo "set tabstop=4" >> ~/.vimrc
	echo "set shiftwidth=4" >> ~/.vimrc
	echo "set encoding=utf8" >> ~/.vimrc
	echo "syntax enable" >> ~/.vimrc	
fi
