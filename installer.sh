#!/bin/bash

source_command='source ~/.search/search_wrapper.sh'
command -v bash > /dev/null
has_bash=$?
command -v zsh > /dev/null
has_zsh=$?

function install()
{
  if [ ! -d ~/.search ]
  then
    mkdir ~/.search
  fi

  cp ./search ~/.search/
  cp ./search_wrapper.sh ~/.search/

  if [ $has_zsh -eq 0 ]
  then
    #could anyone tell me what's wrong if I make this string as a $variable? How to escape it?
    fgrep "$source_command" ~/.zshrc > /dev/null
    if [ $? -ne 0 ]
    then
      echo "$source_command" >> ~/.zshrc
    fi
  fi

  if [ $has_bash -eq 0 ]
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
