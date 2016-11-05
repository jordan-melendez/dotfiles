# Inspired by https://github.com/paulirish/dotfiles.git and https://github.com/sapegin/dotfiles.git

bold=""
reset="\e[0m"

# BLACK="\e[1;30m"
# BLUE="\e[1;34m"
# CYAN="\e[1;36m"
# GREEN="\e[1;32m"
# ORANGE="\e[1;33m"
# PURPLE="\e[1;35m"
# RED="\e[1;31m"
# MAGENTA="\e[1;31m"
# VIOLET="\e[1;35m"
# WHITE="\e[1;37m"
# YELLOW="\e[1;33m"

# Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"



# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# to help sublimelinter etc with finding my PATHS
case $- in
   *i*) source ~/.extra
esac

# generic colouriser
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
    then
        alias colourify="$GRC -es --colour=auto"
        alias configure='colourify ./configure'
        for app in {diff,make,gcc,g++,ping,traceroute}; do
            alias "$app"='colourify '$app
    done
fi

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


# added by Anaconda3 4.2.0 installer
export PATH="/Users/jordanmelendez/anaconda/bin:$PATH"
# Added by install_latest_perl_osx.pl
[ -r /Users/jordanmelendez/.bashrc ] && source /Users/jordanmelendez/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# Tell ls to be colourful
export CLICOLOR=1

# Homebrew install badge: coffee > beer ?
export HOMEBREW_INSTALL_BADGE='☕'
