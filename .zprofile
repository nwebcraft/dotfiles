if [ -f ~/.bashrc ] ; then
. ~/.zshrc
fi

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"

export EDITOR="vim"

