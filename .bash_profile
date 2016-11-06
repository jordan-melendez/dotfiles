#!/bin/bash
#
# Inspired by https://github.com/paulirish/dotfiles.git and https://github.com/sapegin/dotfiles.git

# Don't put duplicate lines in the history
export HISTCONTROL=ignoreboth:erasedups

# Set history length
HISTFILESIZE=1000000000
HISTSIZE=1000000


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done


# Colors
if tput setaf 1 &> /dev/null; then
    tput bold
    CYAN=$(tput setaf 6)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)
    GRAY=$(tput setaf 8)
    NOCOLOR=$(tput sgr0)
    NORMAL=$(tput sgr0)
    RESET=$(tput sgr0)
    BOLD=$(tput bold)
    UNDERLINE=$(tput sgr 0 1)
    INVERT=$(tput sgr 1 0)
else
    BLACK="\033[1;30m"
    RED="\033[1;31m"
    MAGENTA="\033[1;31m"
    GREEN="\033[1;32m"
    ORANGE="\033[1;33m"
    YELLOW="\033[1;33m"
    BLUE="\033[1;34m"
    PURPLE="\033[1;35m"
    VIOLET="\033[1;35m"
    CYAN="\033[1;36m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi


# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{bash_local,bash_prompt,exports,aliases,bash_functions}; do
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


# Probably makes iterm2 the default terminal or something
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# Tell ls to be colourful
export CLICOLOR=1

# Homebrew install badge: coffee > beer ?
export HOMEBREW_INSTALL_BADGE='☕'

# init z https://github.com/rupa/z
. ~/z/z.sh
