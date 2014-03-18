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

# Domain name
domainname=`echo $HOSTNAME | cut -d . -f 2`

# Hva heter maskinene dine akkurat nå?
laptop='appelsin'

# Div
HISTFILESIZE=10000
HISTSIZE=10000
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

# Platform dependent 
if [ "$(uname)" == "Darwin" ]; then  #OS X
    export EDITOR=subl
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then  #Linux
    export EDITOR=gvim
fi

## DEVELOPMENT ##
# Maven
export MVN_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=256M -XX:MaxPermSize=512M"

# Domain dependent
if [[ $domainname == "ifi" ]]; then
    export PS1="$LIGHT_GREEN\u@\h:$BLUE\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
    
    export PATH=/opt/texlive/uio-texmf/bin/x86_64-linux/:/snacks/bin:/usr/bin:/hom/termvakt/bin:/hom/peder/bin:$HOME/software/bin:$HOME/apache-maven-3.0.4/bin/:$HOME/software/idea-IC-133.330/bin:$HOME/postgres9.2/bin:$HOME/.local/bin$PATH
    export JAVA_HOME=/local/store/localhost/.j2sdk/ver-7u7/opt/j2sdk\@amd64linux
    export CLASSPATH="$HOME/javalibs/junit-4.4.jar:$HOME/software/junit4.10/junit-4.10.jar:$CLASSPATH"
    export PYTHONPATH="$HOME/master/implementation/gtrackcore:$HOME/software/python_modules"

    export LD_LIBRARY_PATH=$HOME/pgadmin/lib:$HOME/software/lib
    export LIBPATH=$HOME/software/lib:$LIBPATH
    export LIBRARY_PATH=$HOME/software/lib:$LIBPATH
    export C_INCLUDE_PATH=$HOME/software/include:$C_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=$HOME/software/include:$CPLUS_INCLUDE_PATH
    export BOOST_PATH=$HOME/software/include
    export BOOST_ROOT=$HOME/software/include

    alias intellij="idea.sh"
    alias a2ps="a2ps -f 10 -M A4 -2 -C -A virtual -o"
    alias clock="tty-clock -c -C 3"
    alias spotify='/snacks/bin/wine ~/.wine/drive_c/Program\ Files/Spotify/spotify.exe &'
    alias gtrackcore="cd $HOME/master/implementation/gtrackcore"
    alias master="cd $HOME/master/thesis"

elif [[ $domainname == $laptop ]]; then
    export PS1="$LIGHT_GREEN\u@\h:$BLUE\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
    export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH"
    export PYTHONPATH=/Users/brynjar/gtrackcore
fi

if [ "$(uname)" == "Darwin" ]; then  #OS X
    alias ls='ls -G'       
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then  #Linux
    alias ls='ls --color=auto'
fi

# div
alias :q='exit'
alias mkdir='mkdir -p' #make parents if needed
alias ll='ls -l'
alias la='ls -A'
alias ..='cd ..'

# SSH
alias insilico='ssh brynjagr@insilico.hpc.uio.no'
alias abel='ssh brynjagr@abel.uio.no'
alias uio='ssh brynjagr@login.ifi.uio.no'
alias diamant='ssh brynjagr@diamant.ifi.uio.no'

# Remote desktop
alias doze="windows window.ifi.uio.no"

# soft
alias ec="eclipse"
alias p='python'

# Irssi
alias irc="screen -ls | grep -q irc && nice -n 17 screen -r -d irc || nice -n 17 screen -S irc irssi"
