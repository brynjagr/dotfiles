[[ $- != *i*  ]] && return # check if shell is interactive

if [ -f /local/lib/setupfiles/bashrc ] ; then
    source /local/lib/setupfiles/bashrc
fi
source ~/.functions
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

if [ ! -f ~/.vimrc ] ; then
    cp ~/.my_configs.vim ~/.vim_runtime/my_configs.vim
    . ~/.vim_runtime/install_awesome_vimrc.sh
    cd
fi

unalias -a
if `tty -s`; then
    mesg n
fi

# Domain name
domainname=`echo $HOSTNAME | cut -d . -f 2`

# Name of your machines 
arch='gaebora'
laptop='kaepora'

# Div
HISTFILESIZE=20000
HISTSIZE=20000
HISTCONTROL=ignoredups:ignorespace
HISTTIMEFORMAT='%F %T '
HISTIGNORE='&:d:ls:lm:lm *'
shopt -u dotglob
shopt -s cdspell  #auto correct typos in the cd command
shopt -s cdable_vars # treat every non-directory argument to the cd-command as variable name containing a directory to cd into. 
shopt -s checkwinsize #if necessary, updates the values of the variables LINES and COLUMNS. 
shopt -s histappend histreedit histverify

export LC_ALL=""

#Prompt colors:
LIGHT_GREEN='\[\033[01;32m\]'
LIGHT_RED='\[\033[01;31m\]'
DARK_GRAY='\[\033[01;30m\]'
LIGHT_GRAY='\[\033[0;37m\]'
LIGHT_CYAN='\[\033[01;36m\]'
LIGHT_PURPLE='\[\033[01;35m\]'
BLUE='\[\033[01;34m\]'
NO_COLOR='\[\033[00m\]'

#Set editor
export EDITOR=vim
if [ "$(uname)" == "Darwin" ]; then  #OS X
    if type "subl" > /dev/null 2>/dev/null; then
        export EDITOR=code
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then  #Linux
    if type "gvim" > /dev/null 2>/dev/null; then
        export EDITOR=vim
    fi
fi

## DEVELOPMENT ##
export NODE_ENV=development

# Maven
export MVN_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=256M -XX:MaxPermSize=512M"

if [[ $domainname == $arch ]]; then
    TERM='rxvt-unicode'
    eval `dircolors ~/.dircolors/dircolors.256dark`
elif [[ $domainname == $laptop ]]; then
    export PS1="$LIGHT_GREEN\u@\h:$BLUE\w\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$BLUE\$$NO_COLOR "
    #export PS1="$DARK_GRAY\u@\h:$BLUE\w\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$BLUE\$$NO_COLOR "
    #export PS1="$LIGHT_CYAN\u@\h:$BLUE\w\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$BLUE\$$NO_COLOR "
    #export PS1="$DARK_GRAY\u@\h:$BLUE\w\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$BLUE\$$NO_COLOR "
fi
if [ "$(uname)" == "Darwin" ]; then  #OS X
    alias ls='ls -G'       
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then  #Linux
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# div
alias :q='exit'
alias mkdir='mkdir -p' #make parents if needed
alias ll='ls -l'
alias la='ls -A'
alias ..='cd ..'

# Irssi
alias irc="screen -ls | grep -q irc && nice -n 17 screen -r -d irc || nice -n 17 screen -S irc irssi"

# AWS
alias awslogin='awsmfa -i mfa -t default --duration 129600'

