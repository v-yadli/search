#!/bin/bash

if [ ! -d ~/.search ] 
then
				mkdir ~/.search
fi

cp search ~/.search/

if [ -f ~/.zshrc ]
then
				cat ./search_wrapper.sh >> ~/.zshrc
fi

if [ -f ~/.bashrc ]
then
				cat ./search_wrapper.sh >> ~/.bashrc
fi
