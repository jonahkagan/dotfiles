# extend path
export PATH=$PATH:/Applications/Racket\ v5.3/bin:/Users/Jonah/Documents/scripts:/Users/Jonah/.gem/ruby/1.8/bin

# use vim line editing
set -o vi

# safe rm
alias rm="rm -i"

# source nvm
. ~/nvm/nvm.sh

# aliases
alias komodo="open -a '/Applications/Komodo Edit.app'"
alias textedit="open -a '/Applications/TextEdit.app'"
alias prepare-for-dict="~/Desktop/crosswords/prepare-for-dict.py"
alias drracket="open -a '/Applications/Racket v5.1.3/DrRacket.app'"
alias preview="open -a '/Applications/Preview.app'"
alias ack="ack-5.12"
alias sshvi="ssh jmkagan@ssh.cs.brown.edu ssh csadmin@virus-game.cs.brown.edu"
alias cds="cd ~/Documents/spring2012"
alias cdf="cd ~/Documents/fall2012"
alias cdsym="cd ~/Documents/spring2012/research/LambdaS5/src"
alias mongo-start="sudo mongod -f /opt/local/etc/mongodb/mongod.conf"

alias ls='ls -FG'
alias ll="ls -al"
export CLI_COLOR=1
export LS_COLORS=ExFxCxDxBxegedabagacad

function del() {
while [ -n "$1" ]; do
  if [ ! -e "$1" ]; then
    echo "'$1' not found; exiting"
    return
  fi

  local file=`basename -- "$1"`

  # Chop trailing '/' if there
  file=${file%/}

  local destination=''

  if [ -e "$HOME/.Trash/$file" ]; then
    # Extract file and extension
    local ext=`expr "$file" : ".*\(\.[^\.]*\)$"`
    local base=${file%$ext}

    # Add a space between base and timestamp
    test -n "$base" && base="$base "

    destination="/$base`date +%H-%M-%S`_$RANDOM$ext"
  fi

  echo "Moving '$1' to '$HOME/.Trash$destination'"
  \mv -i -- "$1" "$HOME/.Trash$destination" || return
  shift
done
}
alias rm='del'

##
# Your previous /Users/Jonah/.bash_profile file was backed up as /Users/Jonah/.bash_profile.macports-saved_2010-12-08_at_22:16:11
##

# MacPorts Installer addition on 2010-12-08_at_22:16:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
