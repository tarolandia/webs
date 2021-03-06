# webs - Shorthand for apache2 service

## Description

Use this shorthand + autocomplete to speed up your admin's tasks.

_File: webs.bashrc_

```bash
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
```
**IMPORTANT**
This script must be placed before these lines if you use the auto-completion:

```bash
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
   /etc/bash_completion
fi

```

* You can add the file _webs_ to your bash_completion.d folder (/etc/bash_completion.d) for commands autocompletion

```bash
#! /bin/bash
_webs()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    opts="start stop restart reload force-reload start-htcacheclean stop-htcacheclean status"
    
    if [[ -z "${cur}"  ]] ; then
       COMPREPLY=( $opts )
       return 0
    else
       COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
       return 0
    fi
}
complete -F _webs webs
```

## Example

```bash
webs [tab] [tab]
force-reload        restart             start-htcacheclean  stop                
reload              start               status              stop-htcacheclean

webs re[tab][tab]
reload   restart

webs restart
[enter]
[sudo] password for User:xxxxxx
[enter]

* Restarting web server apache2
... waiting

=)
```
