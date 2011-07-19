#! /bin/bash
function webs 
{
  if [ -z "$1" ]; then
    echo "Empty params: try start|stop|restart|reload|force-reload|start-htcacheclean|stop-htcacheclean|status"
    return 0
  else
    sudo /etc/init.d/apache2 $1
  fi  
}  
