### wrapper for search utility

if [ "$ZSH_NAME" == "zsh" ]
then
  bindkey -s '^@' '^asearch \n'
fi
if [ "`basename $(echo $BASH)`" == "bash" ]
then
  bind '"\C-@":"\C-Asearch \n'
fi

function search()
{
  if [ -f ~/.search/search ] 
  then
    tmpfile=$(mktemp /tmp/search.XXXXXX)
    ~/.search/search $tmpfile $*
    if [ -s $tmpfile ]
    then
      eval $(cat $tmpfile)
    else
      echo "Operation cancelled."
    fi
    rm -f $tmpfile
  else
    echo 'Cannot find search script in ~/.search... Maybe the installation is broken?'
  fi
}
### function search()
