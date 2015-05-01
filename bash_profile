source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

export JAVA_HOME=/Library/Java/HomeJava7
export PATH=/opt/local/bin:$PATH
export PATH=/Users/xuleiliu/Develop/tools/apache-maven-3.2.1/bin:/Users/xuleiliu/Develop/tools/gradle-1.12/bin:$PATH
export PATH=/Users/xuleiliu/bin:/Users/xuleiliu/Develop/tools/adt-bundle-mac-x86_64-20140321/sdk/tools:/Users/xuleiliu/Develop/tools/adt-bundle-mac-x86_64-20140321/sdk/platform-tools:$PATH

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}
# mount the android file image
function mountAndroid { 
    hdiutil attach ~/android.dmg.sparseimage -mountpoint /Volumes/android; 
}
# unmount the android file image
function umountAndroid() { 
    hdiutil detach /Volumes/android; 
}

#PS1="\u@\h \[\033[0;36m\]\W\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\] \$ "

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"

GIT_PS1_SHOWDIRTYSTATE=true;

PS1=$LIGHT_GRAY"\u@\h"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file hs been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the  state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$BLUE" \w"$GREEN": "

alias ll='ls -lah'
alias gg='git status -s'
