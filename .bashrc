source /local/lib/setupfiles/bashrc
source ./.alias

#Options
shopt -s cdspell  #auto correct typos in the cd command
shopt -s cdable_vars # treat every non-directory argument to the cd-command as variable name containing a directory to cd into. 
shopt -s checkwinsize #if necessary, updates the values of the variables LINES and COLUMNS. 
shopt -s histappend histreedit histverify



#Bash prompt setting 1
export PS1='\[\033[01;30m\]\u@\h:\[\033[01;34m\]\W$ \[\033[00m\]'

#Extract funtion
function extract()
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#Open program with appropriate application
function o() 
{
     if [ -f $1 ] ; then
         case $1 in
             *.png)     gthumb $1     ;;
             *.jpg)     gthumb $1     ;;
             *.gif)     gthumb $1     ;;
             *.pdf)     evince $1     ;;
             *.ppt)     ooimpress $1  ;;
             *.pptx)    ooimpress $1  ;;
             *.xlsx)    oocalc $1     ;;
             *.html)    firefox $1     ;;
             *.htm)     firefox $1     ;;
             *)         gvim   $1     ;;
         esac
     else
         echo "'$1' is probably a directory and can thus not be opened by this script"
     fi

}

#Command repeat function. Repeat command n times
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

# SSH to my host
alias uio='ssh brynjagr@login.ifi.uio.no'
alias diamant='ssh brynjagr@diamant'

# Kart
function vb {
    xterm -bg black -fg white -geometry 87x77 -e ssh rubin -t screen -dRS irc irssi &
    uxterm -bg black -fg white -geometry 51x36 -fn *-fixed-*-*-*-10-*  -e ~peder/bin/termstue -s 2 -d -G -stat -l vb123&
    xterm  -title "Pennalet" -bg black -fg white -geometry 65x49 -fn *-fixed-*-*-*-10-* -e ~peder/bin/termstue -d -s 2 -G -stat -l pennalet&
    xterm  -title "VB 141" -bg black -fg white -geometry 63x27 -fn *-fixed-*-*-*-10-* -e ~peder/bin/termstue -d -s 2 -G -stat -l vb141&
    xterm  -title "VB 305" -bg black -fg white -geometry 51x38 -fn *-fixed-*-*-*-10-* -e ~peder/bin/termstue -d -s 2 -G -stat -l vb305&
    xterm  -title "HANGAREN" -bg black -fg white -geometry 68x37 -fn *-fixed-*-*-*-10-* -e ~peder/bin/termstue -d -s 2 -G -stat -l vb&
}
alias storefys='uxterm -bg black -fg white -geometry 112x59 -e ~peder/opt/termstue/bin/termstue -s 2 -G -stat -l storefys&' 
alias drift='uxterm -bg black -fg white -geometry 65x40  -e ~peder/opt/termstue/bin/termstue -s 2 -G -stat -l driftmap&'
alias abel='uxterm -bg black -fg white -geometry 112x59 -e ~peder/opt/termstue/bin/termstue -s 2 -G -stat -l abelwide&' 
alias fys='uxterm -bg black -fg white -geometry 67x45 -e ~peder/opt/termstue/bin/termstue -s 2 -G -stat -l fysmap&' 
alias tv='uxterm -bg black -fg white -geometry 67x21 -e ~peder/opt/termstue/bin/termstue -s 2 -G -stat -l tvmap&' 
alias th='termhjelp'
alias ojd='xterm -bg black -fg white -geometry 306x115 -fn *-fixed-*-*-*-12-* -e termstue -s 2 -d -G -stat -l /uio/arkimedes/s23/fredrihl/termvakt/maps/ojd.map&'
alias ojdp='uxterm -bg black -fg white -geometry 185x50 -fn *-fixed-*-*-*-12-* -e termstue -s 2 -d -G -stat -l ~/maps/programrom.map&'
alias omsles='uxterm -bg black -fg white -geometry 50x25 -fn *-fixed-*-*-*-12-* -e termstue -s 2 -d -G -stat -l /hom/peder/opt/termstue/share/maps/ga06/09/9470.map'

alias omslab='uxterm -bg black -fg white -geometry 185x50 -fn *-fixed-*-*-*-12-* -e termstue -s 2 -d -G -stat -l/hom/peder/opt/termstue/share/maps/ga06/09/9270.map' 

alias kart='uxterm -bg black -fg white -geometry 185x50 -fn *-fixed-*-*-*-12-* -e termstue -s 2 -d -G -stat -l ~/maps/interest.map&'

alias irc="screen -ls | grep -q irc && nice -n 17 screen -r -d irc || nice -n 17 screen -S irc irssi"

#Program aliases
alias ec="eclipse"
alias intellij="idea.sh"

#PATHs
export PATH=/opt/texlive/uio-texmf/bin/x86_64-linux/:/snacks/bin:/usr/bin:/hom/termvakt/bin:/hom/peder/bin:$HOME/software/bin:$HOME/apache-maven-3.0.4/bin/:$HOME/software/idea-IC-133.330/bin:$HOME/postgres9.2/bin:$HOME/.local/bin$PATH
export JAVA_HOME=/local/store/localhost/.j2sdk/ver-7u7/opt/j2sdk\@amd64linux
export CLASSPATH="$HOME/javalibs/junit-4.4.jar:$HOME/software/junit4.10/junit-4.10.jar:$CLASSPATH"
export PYTHONPATH="$HOME/master/implementation/gtrackcore:$HOME/software/python_modules"
#windows
alias doze="windows window.ifi.uio.no"

#default editor
export EDITOR=gvim

#Maven
export MVN_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=256M
-XX:MaxPermSize=512M"

export LD_LIBRARY_PATH=$HOME/pgadmin/lib:$HOME/software/lib
export LIBPATH=$HOME/software/lib:$LIBPATH
export LIBRARY_PATH=$HOME/software/lib:$LIBPATH

export C_INCLUDE_PATH=$HOME/software/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOME/software/include:$CPLUS_INCLUDE_PATH
export BOOST_PATH=$HOME/software/include
export BOOST_ROOT=$HOME/software/include
