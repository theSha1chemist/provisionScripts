#!/bin/bash
source ./help.sh

check_euid

if ask "Install packages?" N; then
	./packages.sh
fi
success_check

if ask "Install theSha1chemist's vim and zsh setup?" N; then
	print_notification "Checking if zsh is installed"
	command_exists zsh
	if [ $? -eq 0 ]; then
		print_good "Excellent, you have zsh installed"
		$(which zsh) ./dotFiles.sh 
	else
		print_notification "zsh not found, installing..."
		apt-get install -y zsh
		success_check
		$(which zsh) ./dotFiles.sh 
	fi
fi
success_check
