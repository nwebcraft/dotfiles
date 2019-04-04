# export PS1="\u:[\w]:\$ "
if [ $UID -eq 0 ]; then
    PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
    PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

alias ll='ls -lahFG'
export LSCOLORS=gxfxcxdxbxegedabagacad

alias re='rbenv exec'
alias be='bundle exec'
alias rebe='rbenv exec bundle exec'


