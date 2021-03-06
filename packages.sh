#!/bin/bash
set -e
source ./help.sh

if ask "upgrade, update and dist-upgrade?" N; then
	apt-get -qq update && apt-get -y upgrade
	apt-get -y dist-upgrade
fi

if ask "install useful commandline tools?" N; then
	apt-get install -y terminator bpython zsh build-essential cmake python-dev python-pip git curl vim tree openvpn gnupg2 # cifs-utils binutils-mingw-w64 gcc-mingw-w64 mingw-w64 mingw-w64-dev
fi

if ask "Install useful gui tools?" N; then
	# add-apt-repository ppa:caffeine-developers/ppa
	# add-apt-repository ppa:gwendal-lebihan-dev/hexchat-stable
	add-apt-repository ppa:webupd8team/sublime-text-2
	apt-get -qq update
	apt-get install -y synapse thunderbird skype keepnote shutter glipper virtualbox hexchat wireshark vlc browser-plugin-vlc sublime-text # openjdk-8-jdk caffeine <- 
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/
	dpkg -i /tmp/google-chrome-stable_current_amd64.deb
fi
#TODO add repo for most up to date virtual box
#TODO test this 
# may need to install libgcrypt11 on ubu 15. http://tipsonubuntu.com/2015/04/24/install-spotify-in-ubuntu-15-04-fix-not-launch-issue/
#if ask "Install spotify fat client? Warning: untested." N; then
#	apt-add-repository -y "deb http://repository.spotify.com stable non-free"
#	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
#	apt-get update -qq
#	apt-get install -y spotify-client spotify-client-qt spotify-client-gnome-support
#fi

##if iceweasal is installed, ask if it should be removed and firefox installed
#if [ $(dpkg-query -W -f='${Status}' iceweasel 2>/dev/null | grep -c -v "ok install") -eq 0 ];then
#	if ask "remove iceweasel and install firefox?" N; then
#		apt-get remove -y iceweasel
#			if grep -v -q 'project/ubuntuzilla/mozilla/apt' /etc/apt/sources.list; then
#			echo -e "\ndeb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main" | tee -a /etc/apt/sources.list > /dev/null
#			apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29
#			fi
#		apt-get -qq update
#		apt-get install -y firefox-mozilla-build 
#	fi
#fi
#TODO fix this...
#if ask "install chrome?" N; then
#	if grep -v -q 'deb http://dl.google.com/linux/chrome/deb/ stable main' /etc/apt/sources.list.d/google.list; then
#		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#		sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#		apt-get -qq update
#		apt-get install -y google-chrome-stable
#	fi
#fi
