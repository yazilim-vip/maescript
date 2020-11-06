#!/bin/bash

#
# Inspired by https://github.com/ohmyzsh/ohmyzsh/blob/master/tools/install.sh
#

#######################
# Default settings
#######################
MAESCRIPT_HOME=${MAESCRIPT_HOME:-~/.maescript}
REPO=${REPO:-yazilim-vip/maescript}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-main}

#######################
# Global Variables
#######################
CURRENT_SHELL=""

#######################
# Helper Functions
#######################
command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		BOLD=$(printf '\033[1m')
		BOLD=$(printf '\033[1m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}


#######################
# Setup Functions
#######################
configure(){
	echo "${BLUE}Home directory for maescript is: $MAESCRIPT_HOME ${RESET}"
	echo "${BLUE}Installing maescript for ${CURRENT_SHELL} ${RESET}"
	if echo "${CURRENT_SHELL}" | grep -iq "^bash" ;then
		conf_file="$HOME/.bashrc"
	elif echo "${CURRENT_SHELL}" | grep -iq "^zsh" ;then
		conf_file="$HOME/.zshrc"
	fi
	echo "Adding maescript to the $conf_file file"
	echo "# maescript" >> $conf_file
	echo "source $MAESCRIPT_HOME/init.sh ${CURRENT_SHELL}" >> $conf_file
}

install(){
	command_exists git || {
		error "git is not installed"
		exit 1
	}

	if [ -d $MAESCRIPT_HOME ]; then 
		echo "${YELLOW}maescript already installed${RESET}"
		echo -n "- Would you like to configure for ${CURRENT_SHELL} (y/n)? "
		read answer
	 	if echo "$answer" | grep -iq "^n" ;then
			exit 0
		fi	
	else
		echo "${BLUE}Cloning Maescript...${RESET}"
		git clone -c core.eol=lf -c core.autocrlf=false \
			-c fsck.zeroPaddedFilemode=ignore \
			-c fetch.fsck.zeroPaddedFilemode=ignore \
			-c receive.fsck.zeroPaddedFilemode=ignore \
			--branch "$BRANCH" "$REMOTE" "$MAESCRIPT_HOME" || {
			error "git clone of maescript failed"
			exit 1
		}
	fi
}



main() {

	setup_color
	
	shell_executable=$(ps -hp $$ | tr -s ' ' | cut -d ' ' -f 6)
	CURRENT_SHELL=$(echo ${shell_executable##*/})
	if [ -z $CURRENT_SHELL ]; then
		error "Missing shell argument"
		exit 1;
	elif [ "$CURRENT_SHELL" != "bash" ] && [ "$CURRENT_SHELL" != "zsh" ]; then
		error "Shell  $CURRENT_SHELL not supported yet"
		exit 1;
	fi

	echo "Installing for ${BLUE}${CURRENT_SHELL}${RESET}"
	install	

	echo "Configuring for ${BLUE}${CURRENT_SHELL}${RESET}"
	configure
}

main "$@"