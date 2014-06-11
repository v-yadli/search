### wrapper for search utility
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
