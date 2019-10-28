# Created by newuser for 5.7.1

autoload -Uz colors && colors
autoload -Uz vcs_info

# zstyle ':vcs_info:git:*' check-for-changes true     # formats 設定項目で %c,%u が使用可
# zstyle ':vcs_info:git:*' stagedstr "%F{green}!"     # commit されていないファイルがある
# zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" # add されていないファイルがある
# zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"   # 通常
# zstyle ':vcs_info:*' actionformats '[%b|%a]'        # rebase 途中,merge コンフリクト等 formats 外の表示

# precmd () { vcs_info }


zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}


PROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
PROMPT=$PROMPT'`vcs_echo`:%# '

alias ll='ls -lahFG'
export LSCOLORS=gxfxcxdxbxegedabagacad

alias re='rbenv exec'
alias be='bundle exec'
alias rebe='rbenv exec bundle exec'

