# extend path
export PATH=$PATH:/Applications/Racket/bin
export PATH=$PATH:$HOME/.gem/ruby/1.8/bin
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:/Applications/CoqIdE_8.4.app/Contents/Resources/bin

# use vim line editing
set -o vi

# the path to the working directory (up to three dirs long)
# http://www.reddit.com/r/programming/comments/697cu/bash_users_what_do_you_have_for_your_ps1/c0382ne
pwd_three() {
  echo ${PWD} | sed "s&${HOME}&~&" | sed "s&.*./\([^/]*/[^/]*/[^/]*\)$&\1&"
}
# http://martinfitzpatrick.name/article/add-git-branch-name-to-terminal-prompt-mac
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# change command prompt
#export PS1='$(pwd_three) \e[0;35m\$\e[m '
PS1='$(pwd_three)'
PS1=$PS1'$(parse_git_branch)'
PS1=$PS1' \[$(tput setaf 5)\]\$\[$(tput sgr0)\] '
export PS1

# init opam
#which opam && eval `opam config -env`

# alias hub to `git`
#eval "$(hub alias -s)"
# enable git tab completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# override git checkout completion to only use local branches
# https://cmetcalfe.ca/blog/git-checkout-autocomplete-local-branches-only.html
_git_checkout ()
{
	__git_has_doubledash && return

	case "$cur" in
	--conflict=*)
		__gitcomp "diff3 merge" "" "${cur##--conflict=}"
		;;
	--*)
		__gitcomp "
			--quiet --ours --theirs --track --no-track --merge
			--conflict= --orphan --patch
			"
		;;
	*)
		# check if --track, --no-track, or --no-guess was specified
		# if so, disable DWIM mode
		local flags="--track --no-track --no-guess" track=1
		if [ -n "$(__git_find_on_cmdline "$flags")" ]; then
			track=''
		fi
		__gitcomp_nl "$(__git_heads '' $track)"
		;;
	esac
}

set show-all-if-ambiguous on

# App aliases
alias komodo="open -a '/Applications/Komodo Edit.app'"
alias textedit="open -a '/Applications/TextEdit.app'"
alias prepare-for-dict="~/Desktop/crosswords/prepare-for-dict.py"
alias drracket="open -a '/Applications/Racket-v5.3.2/DrRacket.app'"
alias preview="open -a '/Applications/Preview.app'"

# Convenience aliases
alias sshvi="ssh jmkagan@ssh.cs.brown.edu ssh csadmin@virus-game.cs.brown.edu"
alias mongo-start="sudo mongod -f /opt/local/etc/mongodb/mongod.conf"

# Port aliases
#alias ack="ack-5.12 --follow"
#alias pip="pip-2.7"

alias ack="ack --ignore-dir node_modules"
alias acknm='ack --noignore-dir=node_modules'

# Bash stuff
alias ls='ls -FG'
alias ll="ls -alh"
export CLI_COLOR=1
export LS_COLORS=ExFxCxDxBxegedabagacad

# safe rm
#alias rm="rm -i"
function del() {
while [ -n "$1" ]; do
  if [ ! -e "$1" -a ! -h "$1" ]; then
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

#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# MacPorts Installer addition on 2010-12-08_at_22:16:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# For Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [ -f ~/.clever_bash ]; then source ~/.clever_bash; else echo 'ERROR: Could not find ~/.clever_bash'; fi

export NVM_DIR="/Users/jonahkagan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Until Karabiner works, set key repeat here
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
