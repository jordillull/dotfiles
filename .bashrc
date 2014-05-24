# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export HISTSIZE=10000
export HISTFILESIZE=250000


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Colors depending on host
if [ `hostname` == tremere -o `hostname` == daisy ]; then
    # Green
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u\[\033[00;32m\]@\[\033[00;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
elif [ `hostname` == yoshi -o `hostname` == hal -o `hostname` == wopr -o `hostname` == glados ]; then
    # Red
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\u\[\033[00;31m\]@\[\033[00;31m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    # Yellow
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;33m\]\u\[\033[00;33m\]@\[\033[00;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi;

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias symfshell='cd ~/projects/habitissimo && phpsh symfony-interactive.php'

alias nano='vi'

# TIG options
export TIG_DIFF_OPTS="-w"

# Spotify with limited bandwithd
alias spotify='trickle -s -u 200 -d 0 -w 64 -t 0.1 -l 10 /usr/bin/spotify'

alias mystatus='watch -tc -n 1 "mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD status && mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD processlist && echo && df -Th -xtmpfs -xdevtmpfs"'

# ssh-agent
#GREP=/bin/grep
#test=`/bin/ps -ef | $GREP ssh-agent | $GREP -v gnome-session-xmonad | $GREP -v defunct | $GREP -v grep | /usr/bin/awk '{print $2}' | xargs`
#
#if [ "$test" = "" ]; then
#   # there is no agent running
#   if [ -e "$HOME/agent.sh" ]; then
#      # remove the old file
#      /bin/rm -f $HOME/agent.sh
#   fi;
#   # start a new agent
#   /usr/bin/ssh-agent | $GREP -v echo >&$HOME/agent.sh
#fi;

test -e $HOME/agent.sh && source $HOME/agent.sh

alias kagent="kill -9 $SSH_AGENT_PID"

alias cdhab="cd ~/projects/habitissimo"

alias cdquo="cd ~/projects/quotation123"

alias phpunit="phpunit --colors" 
