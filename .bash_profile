### this will automatically star ssh_agent and load the ssh_key on login
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

### to kill ssh_agent on logout
if [ -n "$SSH_AUTH_SOCK" ] ; then
  eval `/usr/bin/ssh-agent -k`
fi

### prompt color and shit, literally
[[ -s "/Users/dwightk/.rvm/scripts/rvm" ]] && source "/Users/dwightk/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="💩 \[\033[01;33m\]\u@\t\[\033[01;34m\]\$(parse_git_branch) \[\033[01;32m\]\w \[\033[01;34m\]\n> \[\e[0m\]"

alias ls='ls -G'
