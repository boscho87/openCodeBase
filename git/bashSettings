#for git completion, download bash_completion file from github
 if [ -f ./.bash_completion ]; then
    . ./.bash_completion
  fi

#to show the current branch
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$  \n| => "
export PS2="| $ "
