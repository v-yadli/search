#!/bin/bash

source_command='source ~/.search/search_wrapper.sh'

function install()
{
				if [ ! -d ~/.search ] 
				then
								mkdir ~/.search
				fi

				cp ./search ~/.search/
				cp ./search_wrapper.sh ~/.search/
				
				if [ -f ~/.zshrc ]
				then
								#could anyone tell me what's wrong if I make this string as a $variable? How to escape it?
								fgrep "$source_command" ~/.zshrc > /dev/null
								if [ $? -ne 0 ]
								then
												echo "$source_command" >> ~/.zshrc
								fi
				fi

				if [ -f ~/.bashrc ] || [ -f ~/.bash_profile ]
				then
								#in both cases, we install to .bashrc
								fgrep "$source_command" ~/.bashrc > /dev/null 2>&1
								if [ $? -ne 0 ]
								then
												echo "$source_command" >> ~/.bashrc
								fi
				fi
}

function uninstall()
{
				rm -rf ~/.search

				if [ -f ~/.zshrc ]
				then
								#echo "Need uninstall"
								fgrep -v "$source_command" ~/.zshrc > ~/.zshrc_removing_search
								mv ~/.zshrc_removing_search ~/.zshrc
				fi

				if [ -f ~/.bashrc ]
				then
								#echo "Need uninstall"
								fgrep -v "$source_command" ~/.bashrc > ~/.bashrc_removing_search
								mv ~/.bashrc_removing_search ~/.bashrc
				fi
}

case $1 in
				'install' )
							install;;
			'uninstall' )
							uninstall;;
esac
