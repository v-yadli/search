### wrapper for search utility

if [ -n "$ZSH_NAME" ]
then
  bindkey -s '^@' '^asearch \n'
fi
if [ -n "$BASH" ]
then
  bind '"\C-@":"\C-Asearch \n'
fi

function search()
{
  param_len=$(($#-1))
  cmd_array=${@:1:$param_len}
  pattern=${@: -1}
  if [ -f ~/.search/search ] 
  then
    tmpfile=$(mktemp /tmp/search.XXXXXX)
    ~/.search/search $tmpfile $cmd_array "$pattern"
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
