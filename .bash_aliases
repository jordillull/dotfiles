export EDITOR=vim
export SSH_AUTH_SOCK=0
export TERM=xterm

alias ll="ls -lh"
alias lla="ls -lha"
alias l="ls"
#alias less="less --colors"

# system command aliases
alias mkdir='mkdir -p'
alias grep='grep --color=tty'

# custom aliases
alias sudo="sudo -E" # preserve environment by default
alias ssh="( ssh-add -l > /dev/null || ssh-add ) && ssh"
alias gitfuckers="git grep -in fuck | grep -v 'Binary file' | awk -F: '{ print \"git --no-pager blame \"\$1\" -L \"\$2 \",\"\$2 }'  | bash"


# load git-achievemnts if available
#if [ -f ~/projects/git-achievements ]; then
# export PATH="$PATH:~/projects/git-achievements"
#fi
#if ( type git-achievements &> /dev/null ); then
# alias git="git-achievements"
#fi

# alias codemod if exists
if [ -f ~/projects/codemod/src/codemod.py ]; then
        alias codemod="python ~/projects/codemod/src/codemod.py"
        fi

        if [ -f ~/.local_aliases ]; then
                . ~/.local_aliases
                fi
