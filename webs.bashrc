#! /bin/bash
function webs 
{
  PARS=" start stop restart reload force-reload start-htcacheclean stop-htcacheclean status "
  if [ -z "$1" ]; then
    echo "Empty params: try $PARS"  
    return 0
  else
    REGEX="\s$1\s"
    if [[ $PARS =~ $REGEX ]]; then
       sudo /etc/init.d/apache2 $1
    else
       echo "Bad action: try $PARS"
       return 0
    fi
  fi  
}  
