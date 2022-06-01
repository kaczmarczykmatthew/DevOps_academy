#!/bin/bash

echo""
echo "********************* Generating ssh keys *********************"
echo""
	if [ ! -f ~/.ssh/id_rsa ]; then
		echo -e "\n" | ssh-keygen -t rsa -b 4096 -P ''
	else
		echo "Keys are already generated"
	fi
echo""
echo "********************* Copying public key to authorized_keys  *********************"
echo""
	if [ -f ~/.ssh/authorized_key ]; then
                cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	elif [ $(grep -q "`cat ~/.ssh/id_rsa.pub`" ~/.ssh/authorized_keys; test $? -eq 0 && echo "0" || echo "1") -eq 0 ]; then
		echo "Keys are the same, didn't add new entry to authorized_keys"
        else
                cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
		echo "Copied public key to authorized_keys"
        fi
echo""
echo "********************* Installing HomeBrew *********************"
echo""
	xcode-select --install
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ -f ~/.zshrc ]; then
		echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
	elif [ $(grep "`cat ~/.zshrc`" ~/.zshrc; test $? -eq 0 && echo "0" || echo "1") -eq 0 ]; then
		echo "Didn't add new entry because the same exist already"
	else
		echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
		echo "Added new entry in ~/.zshrc"
	fi
	source ~/.zshrc
echo""
echo "********************* Updating HomeBrew *********************"
echo""
	brew update
echo""
echo "********************* Installing Vagrant *********************"
echo""
	brew install --cask vagrant
echo""
echo "********************* Installing Ansible *********************"
echo""
	brew install ansible
echo""
echo "********************* Executing Ansible *********************"
echo""
	ansible-playbook install.yml -vv
echo""
echo "************************************************"
echo "************************************************"
echo "********************* DONE *********************"
echo "************************************************"
echo "************************************************"
echo""
